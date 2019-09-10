Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6FEAFAEB9E
	for <lists+linux-leds@lfdr.de>; Tue, 10 Sep 2019 15:32:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730406AbfIJNce (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 10 Sep 2019 09:32:34 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:37535 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725935AbfIJNce (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 10 Sep 2019 09:32:34 -0400
Received: by mail-wr1-f65.google.com with SMTP id i1so19698583wro.4
        for <linux-leds@vger.kernel.org>; Tue, 10 Sep 2019 06:32:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=mvtGV+ppuX6BatO8EkLDvNZClNBV8yA0VNu0nTgja+w=;
        b=csrNJ/NyDlQ+TyDUiV5IaK5G69BtB28I8adl3PYmH3ezD7io3jIOBpVUsX9SMPr6Sv
         vp6ZltxWgr+vHLduPKRxgDDHpCWAFU44M71cxWQ1BM9oM9zDIcL9t+RRaOYH/xPWrf6u
         4Pk1czjYaO3NqHb46PSq0ySjxpRlZj6428Rgwwb6F/1WcMWp6JZ+leAZhVb2+PJUW2Ds
         FS6fXzVNLFIlNpgLJLo39SvtcicnfvcS4b3GMeb0VBr7jezUqIaKjMkhwKIwDiBb4Lcy
         rpM+VA2W1YVvV5pvvS5w1gWq2+D3RvF+oucT7jwWgjF+94xkmOiPVZhxn0Fvn79GW6Va
         bO0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=mvtGV+ppuX6BatO8EkLDvNZClNBV8yA0VNu0nTgja+w=;
        b=tZAHmtWhAZKTO3NC8VlKGKJZ9E9Cm4CpQcanRE+jym2b8wwbLtkIJrWoSBovfqtZLq
         13smbjoGnfGco2Yb8I8uwDy3k9LZiAtBsLBMRjCKsAeUDsVfWUnlFqygnuwVM2VF2jw6
         FVI5WZclqPNYtzXvRJ9gOABZJF37AbYccVajqBfVx0R/zeRXMjFf0x1wxJOKKN4VBgXx
         LZ1e5Q9U4gsa8PRslEtgGY44O3sJ78iWPD3Uc411GQAoSCOZZt5NmPGztRaJD4Mjrhlt
         1aZYZd8CWfTD4E83FSeDzR3GEwHC+Jc+q3ji6OLe+SiDJp9BDR8tl5ZzWfkd7r28E+lj
         waqQ==
X-Gm-Message-State: APjAAAU8pW3Aj7LQFqcpJwWvIBHY2LRXymW3tALwjZ/XRzrIijgXI1v2
        Gg+PdA/ppFC3i4GSwhHwJGcAxw==
X-Google-Smtp-Source: APXvYqxYMJNOkGRuyuUE5/Ca3aXHO9VYBrGI2zBYNyArWNdezp/XEQjSQCbacVckYbVYEgyaGCGI7A==
X-Received: by 2002:adf:f151:: with SMTP id y17mr6284263wro.244.1568122350781;
        Tue, 10 Sep 2019 06:32:30 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net. [86.9.19.6])
        by smtp.gmail.com with ESMTPSA id y14sm31507193wrd.84.2019.09.10.06.32.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2019 06:32:30 -0700 (PDT)
Date:   Tue, 10 Sep 2019 14:32:28 +0100
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Jean-Jacques Hiblot <jjhiblot@ti.com>
Cc:     jacek.anaszewski@gmail.com, pavel@ucw.cz, robh+dt@kernel.org,
        mark.rutland@arm.com, lee.jones@linaro.org, dmurphy@ti.com,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, tomi.valkeinen@ti.com
Subject: Re: [PATCH v6 4/4] backlight: add led-backlight driver
Message-ID: <20190910133228.oedcjnxboamf5lpj@holly.lan>
References: <20190910132734.9544-1-jjhiblot@ti.com>
 <20190910132734.9544-5-jjhiblot@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190910132734.9544-5-jjhiblot@ti.com>
User-Agent: NeoMutt/20180716
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Tue, Sep 10, 2019 at 03:27:34PM +0200, Jean-Jacques Hiblot wrote:
> From: Tomi Valkeinen <tomi.valkeinen@ti.com>
> 
> This patch adds a led-backlight driver (led_bl), which is similar to
> pwm_bl except the driver uses a LED class driver to adjust the
> brightness in the HW. Multiple LEDs can be used for a single backlight.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> Signed-off-by: Jean-Jacques Hiblot <jjhiblot@ti.com>
> Acked-by: Pavel Machek <pavel@ucw.cz>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>

> ---
>  drivers/video/backlight/Kconfig  |   7 +
>  drivers/video/backlight/Makefile |   1 +
>  drivers/video/backlight/led_bl.c | 260 +++++++++++++++++++++++++++++++
>  3 files changed, 268 insertions(+)
>  create mode 100644 drivers/video/backlight/led_bl.c
> 
> diff --git a/drivers/video/backlight/Kconfig b/drivers/video/backlight/Kconfig
> index 8b081d61773e..585a1787618c 100644
> --- a/drivers/video/backlight/Kconfig
> +++ b/drivers/video/backlight/Kconfig
> @@ -458,6 +458,13 @@ config BACKLIGHT_RAVE_SP
>  	help
>  	  Support for backlight control on RAVE SP device.
>  
> +config BACKLIGHT_LED
> +	tristate "Generic LED based Backlight Driver"
> +	depends on LEDS_CLASS && OF
> +	help
> +	  If you have a LCD backlight adjustable by LED class driver, say Y
> +	  to enable this driver.
> +
>  endif # BACKLIGHT_CLASS_DEVICE
>  
>  endmenu
> diff --git a/drivers/video/backlight/Makefile b/drivers/video/backlight/Makefile
> index 63c507c07437..2a67642966a5 100644
> --- a/drivers/video/backlight/Makefile
> +++ b/drivers/video/backlight/Makefile
> @@ -57,3 +57,4 @@ obj-$(CONFIG_BACKLIGHT_TPS65217)	+= tps65217_bl.o
>  obj-$(CONFIG_BACKLIGHT_WM831X)		+= wm831x_bl.o
>  obj-$(CONFIG_BACKLIGHT_ARCXCNN) 	+= arcxcnn_bl.o
>  obj-$(CONFIG_BACKLIGHT_RAVE_SP)		+= rave-sp-backlight.o
> +obj-$(CONFIG_BACKLIGHT_LED)		+= led_bl.o
> diff --git a/drivers/video/backlight/led_bl.c b/drivers/video/backlight/led_bl.c
> new file mode 100644
> index 000000000000..6044390d8b88
> --- /dev/null
> +++ b/drivers/video/backlight/led_bl.c
> @@ -0,0 +1,260 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2015-2019 Texas Instruments Incorporated -  http://www.ti.com/
> + * Author: Tomi Valkeinen <tomi.valkeinen@ti.com>
> + *
> + * Based on pwm_bl.c
> + */
> +
> +#include <linux/backlight.h>
> +#include <linux/leds.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +
> +struct led_bl_data {
> +	struct device		*dev;
> +	struct backlight_device	*bl_dev;
> +	struct led_classdev	**leds;
> +	bool			enabled;
> +	int			nb_leds;
> +	unsigned int		*levels;
> +	unsigned int		default_brightness;
> +	unsigned int		max_brightness;
> +};
> +
> +static void led_bl_set_brightness(struct led_bl_data *priv, int level)
> +{
> +	int i;
> +	int bkl_brightness;
> +
> +	if (priv->levels)
> +		bkl_brightness = priv->levels[level];
> +	else
> +		bkl_brightness = level;
> +
> +	for (i = 0; i < priv->nb_leds; i++)
> +		led_set_brightness(priv->leds[i], bkl_brightness);
> +
> +	priv->enabled = true;
> +}
> +
> +static void led_bl_power_off(struct led_bl_data *priv)
> +{
> +	int i;
> +
> +	if (!priv->enabled)
> +		return;
> +
> +	for (i = 0; i < priv->nb_leds; i++)
> +		led_set_brightness(priv->leds[i], LED_OFF);
> +
> +	priv->enabled = false;
> +}
> +
> +static int led_bl_update_status(struct backlight_device *bl)
> +{
> +	struct led_bl_data *priv = bl_get_data(bl);
> +	int brightness = bl->props.brightness;
> +
> +	if (bl->props.power != FB_BLANK_UNBLANK ||
> +	    bl->props.fb_blank != FB_BLANK_UNBLANK ||
> +	    bl->props.state & BL_CORE_FBBLANK)
> +		brightness = 0;
> +
> +	if (brightness > 0)
> +		led_bl_set_brightness(priv, brightness);
> +	else
> +		led_bl_power_off(priv);
> +
> +	return 0;
> +}
> +
> +static const struct backlight_ops led_bl_ops = {
> +	.update_status	= led_bl_update_status,
> +};
> +
> +static int led_bl_get_leds(struct device *dev,
> +			   struct led_bl_data *priv)
> +{
> +	int i, nb_leds, ret;
> +	struct device_node *node = dev->of_node;
> +	struct led_classdev **leds;
> +	unsigned int max_brightness;
> +	unsigned int default_brightness;
> +
> +	ret = of_count_phandle_with_args(node, "leds", NULL);
> +	if (ret < 0) {
> +		dev_err(dev, "Unable to get led count\n");
> +		return -EINVAL;
> +	}
> +
> +	nb_leds = ret;
> +	if (nb_leds < 1) {
> +		dev_err(dev, "At least one LED must be specified!\n");
> +		return -EINVAL;
> +	}
> +
> +	leds = devm_kzalloc(dev, sizeof(struct led_classdev *) * nb_leds,
> +			    GFP_KERNEL);
> +	if (!leds)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < nb_leds; i++) {
> +		leds[i] = devm_led_get(dev, i);
> +		if (IS_ERR(leds[i]))
> +			return PTR_ERR(leds[i]);
> +	}
> +
> +	/* check that the LEDs all have the same brightness range */
> +	max_brightness = leds[0]->max_brightness;
> +	for (i = 1; i < nb_leds; i++) {
> +		if (max_brightness != leds[i]->max_brightness) {
> +			dev_err(dev, "LEDs must have identical ranges\n");
> +			return -EINVAL;
> +		}
> +	}
> +
> +	/* get the default brightness from the first LED from the list */
> +	default_brightness = leds[0]->brightness;
> +
> +	priv->nb_leds = nb_leds;
> +	priv->leds = leds;
> +	priv->max_brightness = max_brightness;
> +	priv->default_brightness = default_brightness;
> +
> +	return 0;
> +}
> +
> +static int led_bl_parse_levels(struct device *dev,
> +			   struct led_bl_data *priv)
> +{
> +	struct device_node *node = dev->of_node;
> +	int num_levels;
> +	u32 value;
> +	int ret;
> +
> +	if (!node)
> +		return -ENODEV;
> +
> +	num_levels = of_property_count_u32_elems(node, "brightness-levels");
> +	if (num_levels > 1) {
> +		int i;
> +		unsigned int db;
> +		u32 *levels = NULL;
> +
> +		levels = devm_kzalloc(dev, sizeof(u32) * num_levels,
> +				      GFP_KERNEL);
> +		if (!levels)
> +			return -ENOMEM;
> +
> +		ret = of_property_read_u32_array(node, "brightness-levels",
> +						levels,
> +						num_levels);
> +		if (ret < 0)
> +			return ret;
> +
> +		/*
> +		 * Try to map actual LED brightness to backlight brightness
> +		 * level
> +		 */
> +		db = priv->default_brightness;
> +		for (i = 0 ; i < num_levels; i++) {
> +			if ((i && db > levels[i-1]) && db <= levels[i])
> +				break;
> +		}
> +		priv->default_brightness = i;
> +		priv->max_brightness = num_levels - 1;
> +		priv->levels = levels;
> +	} else if (num_levels >= 0)
> +		dev_warn(dev, "Not enough levels defined\n");
> +
> +	ret = of_property_read_u32(node, "default-brightness-level", &value);
> +	if (!ret && value <= priv->max_brightness)
> +		priv->default_brightness = value;
> +	else if (!ret  && value > priv->max_brightness)
> +		dev_warn(dev, "Invalid default brightness. Ignoring it\n");
> +
> +	return 0;
> +}
> +
> +static int led_bl_probe(struct platform_device *pdev)
> +{
> +	struct backlight_properties props;
> +	struct led_bl_data *priv;
> +	int ret, i;
> +
> +	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	platform_set_drvdata(pdev, priv);
> +
> +	priv->dev = &pdev->dev;
> +
> +	ret = led_bl_get_leds(&pdev->dev, priv);
> +	if (ret)
> +		return ret;
> +
> +	ret = led_bl_parse_levels(&pdev->dev, priv);
> +	if (ret < 0) {
> +		dev_err(&pdev->dev, "Failed to parse DT data\n");
> +		return ret;
> +	}
> +
> +	memset(&props, 0, sizeof(struct backlight_properties));
> +	props.type = BACKLIGHT_RAW;
> +	props.max_brightness = priv->max_brightness;
> +	props.brightness = priv->default_brightness;
> +	props.power = (priv->default_brightness > 0) ? FB_BLANK_POWERDOWN :
> +		      FB_BLANK_UNBLANK;
> +	priv->bl_dev = backlight_device_register(dev_name(&pdev->dev),
> +			&pdev->dev, priv, &led_bl_ops, &props);
> +	if (IS_ERR(priv->bl_dev)) {
> +		dev_err(&pdev->dev, "Failed to register backlight\n");
> +		return PTR_ERR(priv->bl_dev);
> +	}
> +
> +	for (i = 0; i < priv->nb_leds; i++)
> +		led_sysfs_disable(priv->leds[i]);
> +
> +	backlight_update_status(priv->bl_dev);
> +
> +	return 0;
> +}
> +
> +static int led_bl_remove(struct platform_device *pdev)
> +{
> +	struct led_bl_data *priv = platform_get_drvdata(pdev);
> +	struct backlight_device *bl = priv->bl_dev;
> +	int i;
> +
> +	backlight_device_unregister(bl);
> +
> +	led_bl_power_off(priv);
> +	for (i = 0; i < priv->nb_leds; i++)
> +		led_sysfs_enable(priv->leds[i]);
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id led_bl_of_match[] = {
> +	{ .compatible = "led-backlight" },
> +	{ }
> +};
> +
> +MODULE_DEVICE_TABLE(of, led_bl_of_match);
> +
> +static struct platform_driver led_bl_driver = {
> +	.driver		= {
> +		.name		= "led-backlight",
> +		.of_match_table	= of_match_ptr(led_bl_of_match),
> +	},
> +	.probe		= led_bl_probe,
> +	.remove		= led_bl_remove,
> +};
> +
> +module_platform_driver(led_bl_driver);
> +
> +MODULE_DESCRIPTION("LED based Backlight Driver");
> +MODULE_LICENSE("GPL");
> +MODULE_ALIAS("platform:led-backlight");
> -- 
> 2.17.1
> 
