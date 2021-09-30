Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9977941D499
	for <lists+linux-leds@lfdr.de>; Thu, 30 Sep 2021 09:37:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348742AbhI3HjM (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 30 Sep 2021 03:39:12 -0400
Received: from protonic.xs4all.nl ([83.163.252.89]:42202 "EHLO
        protonic.xs4all.nl" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348737AbhI3HjL (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 30 Sep 2021 03:39:11 -0400
Received: from fiber.protonic.nl (edge2.prtnl [192.168.1.170])
        by sparta.prtnl (Postfix) with ESMTP id 17F5F44A024E;
        Thu, 30 Sep 2021 09:37:22 +0200 (CEST)
MIME-Version: 1.0
Date:   Thu, 30 Sep 2021 09:37:22 +0200
From:   Robin van der Gracht <robin@protonic.nl>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Miguel Ojeda <ojeda@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Paul Burton <paulburton@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Pavel Machek <pavel@ucw.cz>, Marek Behun <marek.behun@nic.cz>,
        devicetree@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 17/19] auxdisplay: ht16k33: Add support for segment
 displays
Reply-To: robin@protonic.nl
In-Reply-To: <20210914143835.511051-18-geert@linux-m68k.org>
References: <20210914143835.511051-1-geert@linux-m68k.org>
 <20210914143835.511051-18-geert@linux-m68k.org>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <f902011b7be495219da31e4c1d561cfe@protonic.nl>
X-Sender: robin@protonic.nl
Organization: Protonic Holland
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Acked-by: Robin van der Gracht <robin@protonic.nl>

On 2021-09-14 16:38, Geert Uytterhoeven wrote:
> The Holtek HT16K33 LED controller is not only used for driving
> dot-matrix displays, but also for driving segment displays.
> 
> Add support for 4-digit 7-segment and quad 14-segment alphanumeric
> displays, like the Adafruit 7-segment and 14-segment display backpack
> and FeatherWing expansion boards.  Use the character line display core
> support to display a message, which will be scrolled if it doesn't fit.
> 
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---
> The 7-segment support is based on schematics, and untested on actual
> hardware.
> 
> v6:
>   - No changes,
> 
> v5:
>   - No changes,
> 
> v4:
>   - No changes,
> 
> v3:
>   - Pass "dev" instead of "client" to ht16k33_seg_probe(),
>   - Remove unneeded inclusion of <linux/leds.h> and <linux/of_device.h>,
> 
> v2:
>   - Move "select LINEDISP" to this patch,
>   - Set "err = -EINVAL" in switch() case that cannot happen.
> ---
>  drivers/auxdisplay/Kconfig   |   1 +
>  drivers/auxdisplay/ht16k33.c | 196 +++++++++++++++++++++++++++++++++--
>  2 files changed, 190 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/auxdisplay/Kconfig b/drivers/auxdisplay/Kconfig
> index b41fdc5f7bf72a1b..42fc7b155de09dbc 100644
> --- a/drivers/auxdisplay/Kconfig
> +++ b/drivers/auxdisplay/Kconfig
> @@ -176,6 +176,7 @@ config HT16K33
>  	select FB_SYS_IMAGEBLIT
>  	select INPUT_MATRIXKMAP
>  	select FB_BACKLIGHT
> +	select LINEDISP
>  	help
>  	  Say yes here to add support for Holtek HT16K33, RAM mapping 16*8
>  	  LED controller driver with keyscan.
> diff --git a/drivers/auxdisplay/ht16k33.c b/drivers/auxdisplay/ht16k33.c
> index 27ac167dae74bd82..3b555e119e326cec 100644
> --- a/drivers/auxdisplay/ht16k33.c
> +++ b/drivers/auxdisplay/ht16k33.c
> @@ -5,6 +5,7 @@
>   * Author: Robin van der Gracht <robin@protonic.nl>
>   *
>   * Copyright: (C) 2016 Protonic Holland.
> + * Copyright (C) 2021 Glider bv
>   */
> 
>  #include <linux/kernel.h>
> @@ -20,6 +21,13 @@
>  #include <linux/workqueue.h>
>  #include <linux/mm.h>
> 
> +#include <linux/map_to_7segment.h>
> +#include <linux/map_to_14segment.h>
> +
> +#include <asm/unaligned.h>
> +
> +#include "line-display.h"
> +
>  /* Registers */
>  #define REG_SYSTEM_SETUP		0x20
>  #define REG_SYSTEM_SETUP_OSC_ON		BIT(0)
> @@ -47,6 +55,12 @@
>  #define BYTES_PER_ROW		(HT16K33_MATRIX_LED_MAX_ROWS / 8)
>  #define HT16K33_FB_SIZE		(HT16K33_MATRIX_LED_MAX_COLS * BYTES_PER_ROW)
> 
> +enum display_type {
> +	DISP_MATRIX = 0,
> +	DISP_QUAD_7SEG,
> +	DISP_QUAD_14SEG,
> +};
> +
>  struct ht16k33_keypad {
>  	struct i2c_client *client;
>  	struct input_dev *dev;
> @@ -67,11 +81,25 @@ struct ht16k33_fbdev {
>  	uint8_t *cache;
>  };
> 
> +struct ht16k33_seg {
> +	struct linedisp linedisp;
> +	union {
> +		struct seg7_conversion_map seg7;
> +		struct seg14_conversion_map seg14;
> +	} map;
> +	unsigned int map_size;
> +	char curr[4];
> +};
> +
>  struct ht16k33_priv {
>  	struct i2c_client *client;
>  	struct delayed_work work;
>  	struct ht16k33_keypad keypad;
> -	struct ht16k33_fbdev fbdev;
> +	union {
> +		struct ht16k33_fbdev fbdev;
> +		struct ht16k33_seg seg;
> +	};
> +	enum display_type type;
>  };
> 
>  static const struct fb_fix_screeninfo ht16k33_fb_fix = {
> @@ -101,6 +129,33 @@ static const struct fb_var_screeninfo ht16k33_fb_var = 
> {
>  	.vmode = FB_VMODE_NONINTERLACED,
>  };
> 
> +static const SEG7_DEFAULT_MAP(initial_map_seg7);
> +static const SEG14_DEFAULT_MAP(initial_map_seg14);
> +
> +static ssize_t map_seg_show(struct device *dev, struct device_attribute 
> *attr,
> +			    char *buf)
> +{
> +	struct ht16k33_priv *priv = dev_get_drvdata(dev);
> +
> +	memcpy(buf, &priv->seg.map, priv->seg.map_size);
> +	return priv->seg.map_size;
> +}
> +
> +static ssize_t map_seg_store(struct device *dev, struct device_attribute 
> *attr,
> +			     const char *buf, size_t cnt)
> +{
> +	struct ht16k33_priv *priv = dev_get_drvdata(dev);
> +
> +	if (cnt != priv->seg.map_size)
> +		return -EINVAL;
> +
> +	memcpy(&priv->seg.map, buf, cnt);
> +	return cnt;
> +}
> +
> +static DEVICE_ATTR(map_seg7, 0644, map_seg_show, map_seg_store);
> +static DEVICE_ATTR(map_seg14, 0644, map_seg_show, map_seg_store);
> +
>  static int ht16k33_display_on(struct ht16k33_priv *priv)
>  {
>  	uint8_t data = REG_DISPLAY_SETUP | REG_DISPLAY_SETUP_ON;
> @@ -325,6 +380,51 @@ static void ht16k33_keypad_stop(struct input_dev *dev)
>  	disable_irq(keypad->client->irq);
>  }
> 
> +static void ht16k33_linedisp_update(struct linedisp *linedisp)
> +{
> +	struct ht16k33_priv *priv = container_of(linedisp, struct ht16k33_priv,
> +						 seg.linedisp);
> +
> +	schedule_delayed_work(&priv->work, 0);
> +}
> +
> +static void ht16k33_seg7_update(struct work_struct *work)
> +{
> +	struct ht16k33_priv *priv = container_of(work, struct ht16k33_priv,
> +						 work.work);
> +	struct ht16k33_seg *seg = &priv->seg;
> +	char *s = seg->curr;
> +	uint8_t buf[9];
> +
> +	buf[0] = map_to_seg7(&seg->map.seg7, *s++);
> +	buf[1] = 0;
> +	buf[2] = map_to_seg7(&seg->map.seg7, *s++);
> +	buf[3] = 0;
> +	buf[4] = 0;
> +	buf[5] = 0;
> +	buf[6] = map_to_seg7(&seg->map.seg7, *s++);
> +	buf[7] = 0;
> +	buf[8] = map_to_seg7(&seg->map.seg7, *s++);
> +
> +	i2c_smbus_write_i2c_block_data(priv->client, 0, ARRAY_SIZE(buf), buf);
> +}
> +
> +static void ht16k33_seg14_update(struct work_struct *work)
> +{
> +	struct ht16k33_priv *priv = container_of(work, struct ht16k33_priv,
> +						 work.work);
> +	struct ht16k33_seg *seg = &priv->seg;
> +	char *s = seg->curr;
> +	uint8_t buf[8];
> +
> +	put_unaligned_le16(map_to_seg14(&seg->map.seg14, *s++), buf);
> +	put_unaligned_le16(map_to_seg14(&seg->map.seg14, *s++), buf + 2);
> +	put_unaligned_le16(map_to_seg14(&seg->map.seg14, *s++), buf + 4);
> +	put_unaligned_le16(map_to_seg14(&seg->map.seg14, *s++), buf + 6);
> +
> +	i2c_smbus_write_i2c_block_data(priv->client, 0, ARRAY_SIZE(buf), buf);
> +}
> +
>  static int ht16k33_keypad_probe(struct i2c_client *client,
>  				struct ht16k33_keypad *keypad)
>  {
> @@ -469,9 +569,56 @@ static int ht16k33_fbdev_probe(struct device *dev,
> struct ht16k33_priv *priv,
>  	return err;
>  }
> 
> +static int ht16k33_seg_probe(struct device *dev, struct ht16k33_priv *priv,
> +			     uint32_t brightness)
> +{
> +	struct ht16k33_seg *seg = &priv->seg;
> +	int err;
> +
> +	err = ht16k33_brightness_set(priv, MAX_BRIGHTNESS);
> +	if (err)
> +		return err;
> +
> +	switch (priv->type) {
> +	case DISP_MATRIX:
> +		/* not handled here */
> +		err = -EINVAL;
> +		break;
> +
> +	case DISP_QUAD_7SEG:
> +		INIT_DELAYED_WORK(&priv->work, ht16k33_seg7_update);
> +		seg->map.seg7 = initial_map_seg7;
> +		seg->map_size = sizeof(seg->map.seg7);
> +		err = device_create_file(dev, &dev_attr_map_seg7);
> +		break;
> +
> +	case DISP_QUAD_14SEG:
> +		INIT_DELAYED_WORK(&priv->work, ht16k33_seg14_update);
> +		seg->map.seg14 = initial_map_seg14;
> +		seg->map_size = sizeof(seg->map.seg14);
> +		err = device_create_file(dev, &dev_attr_map_seg14);
> +		break;
> +	}
> +	if (err)
> +		return err;
> +
> +	err = linedisp_register(&seg->linedisp, dev, 4, seg->curr,
> +				ht16k33_linedisp_update);
> +	if (err)
> +		goto err_remove_map_file;
> +
> +	return 0;
> +
> +err_remove_map_file:
> +	device_remove_file(dev, &dev_attr_map_seg7);
> +	device_remove_file(dev, &dev_attr_map_seg14);
> +	return err;
> +}
> +
>  static int ht16k33_probe(struct i2c_client *client)
>  {
>  	struct device *dev = &client->dev;
> +	const struct of_device_id *id;
>  	struct ht16k33_priv *priv;
>  	uint32_t dft_brightness;
>  	int err;
> @@ -486,6 +633,9 @@ static int ht16k33_probe(struct i2c_client *client)
>  		return -ENOMEM;
> 
>  	priv->client = client;
> +	id = i2c_of_match_device(dev->driver->of_match_table, client);
> +	if (id)
> +		priv->type = (uintptr_t)id->data;
>  	i2c_set_clientdata(client, priv);
> 
>  	err = ht16k33_initialize(priv);
> @@ -510,8 +660,19 @@ static int ht16k33_probe(struct i2c_client *client)
>  			return err;
>  	}
> 
> -	/* Frame Buffer Display */
> -	return ht16k33_fbdev_probe(dev, priv, dft_brightness);
> +	switch (priv->type) {
> +	case DISP_MATRIX:
> +		/* Frame Buffer Display */
> +		err = ht16k33_fbdev_probe(dev, priv, dft_brightness);
> +		break;
> +
> +	case DISP_QUAD_7SEG:
> +	case DISP_QUAD_14SEG:
> +		/* Segment Display */
> +		err = ht16k33_seg_probe(dev, priv, dft_brightness);
> +		break;
> +	}
> +	return err;
>  }
> 
>  static int ht16k33_remove(struct i2c_client *client)
> @@ -520,9 +681,21 @@ static int ht16k33_remove(struct i2c_client *client)
>  	struct ht16k33_fbdev *fbdev = &priv->fbdev;
> 
>  	cancel_delayed_work_sync(&priv->work);
> -	unregister_framebuffer(fbdev->info);
> -	framebuffer_release(fbdev->info);
> -	free_page((unsigned long) fbdev->buffer);
> +
> +	switch (priv->type) {
> +	case DISP_MATRIX:
> +		unregister_framebuffer(fbdev->info);
> +		framebuffer_release(fbdev->info);
> +		free_page((unsigned long)fbdev->buffer);
> +		break;
> +
> +	case DISP_QUAD_7SEG:
> +	case DISP_QUAD_14SEG:
> +		linedisp_unregister(&priv->seg.linedisp);
> +		device_remove_file(&client->dev, &dev_attr_map_seg7);
> +		device_remove_file(&client->dev, &dev_attr_map_seg14);
> +		break;
> +	}
> 
>  	return 0;
>  }
> @@ -534,7 +707,16 @@ static const struct i2c_device_id ht16k33_i2c_match[] = 
> {
>  MODULE_DEVICE_TABLE(i2c, ht16k33_i2c_match);
> 
>  static const struct of_device_id ht16k33_of_match[] = {
> -	{ .compatible = "holtek,ht16k33", },
> +	{
> +		/* 0.56" 4-Digit 7-Segment FeatherWing Display (Red) */
> +		.compatible = "adafruit,3108", .data = (void *)DISP_QUAD_7SEG,
> +	}, {
> +		/* 0.54" Quad Alphanumeric FeatherWing Display (Red) */
> +		.compatible = "adafruit,3130", .data = (void *)DISP_QUAD_14SEG,
> +	}, {
> +		/* Generic, assumed Dot-Matrix Display */
> +		.compatible = "holtek,ht16k33", .data = (void *)DISP_MATRIX,
> +	},
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(of, ht16k33_of_match);
