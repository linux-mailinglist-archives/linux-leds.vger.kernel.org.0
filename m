Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 461B140156C
	for <lists+linux-leds@lfdr.de>; Mon,  6 Sep 2021 06:17:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233223AbhIFESm (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 6 Sep 2021 00:18:42 -0400
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:56173 "EHLO
        out3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234748AbhIFESc (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 6 Sep 2021 00:18:32 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
        by mailout.nyi.internal (Postfix) with ESMTP id 070345C013C;
        Mon,  6 Sep 2021 00:17:23 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Mon, 06 Sep 2021 00:17:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
        subject:to:cc:references:from:message-id:date:mime-version
        :in-reply-to:content-type:content-transfer-encoding; s=fm3; bh=d
        KWH9HxEDGNwLC16SJLdDt+B4ELercRgifodOhHvUrM=; b=Pk6ape2HGALFvWFrM
        SNC7XBSR1rV8SpfFh4kBTPI1Vyap6s2GhPn32JqOKySVzzQivD4JKHz0YDmaQB+V
        JeltDu6Iqmu4hGR0ieQ9PLXU1SCmqqD7sZZryNDl7YgdBP4W/7vTdqI7WYC9+A2c
        BhdttpCcMlU1n6jLDfpAH1+fC29HE7nsOgdgVHpJBhTDK5z4z4GUOrBqTARlTv/Q
        UoMkhb0qxs+2BzCtXq7t70nmlfLspA7rs/dE6PvNvM4Uz2hLgJMFQcPzrAu3BMFo
        bpYKmUTUB1AySCTaDCYIERdd/ELW+hP6mGk+XRHTtWpIovT3wEV+RRE7VvFnbdoO
        g0fkw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; bh=dKWH9HxEDGNwLC16SJLdDt+B4ELercRgifodOhHvU
        rM=; b=Y8VcWBrkAzoBYCre3MZ4IqizVwONj+4d9Cy+adt1bdKmRm/PQjqCwF1gl
        lNIPwX1r5XXv8Y4dOMjJm7CP5U4LkgpYJRQ6TB4ANlnVrf1nJ7CtAfphxtvBDgja
        UDFNpDJgDoVCz12QY0kIvoFD0f4cDfryJi89t3sXEhDl2UH3YBpQHOo8W8a5IZm8
        0E6cW7gSWbv7tyrjb7Ud9oqz2C/2hQSuv9Kczm3RfdJvGvPpO2D7IJFyJD2i2phE
        RBich3j3sY2aw9mRIVikHF9bj8d3N45jgwS2b+EqN7aYe1P7b65IIBhzP6gOwchU
        365PCtZbWRKyQodPXi2Ko3ExIeU+A==
X-ME-Sender: <xms:UZY1YTFYr2oY-cler6SdoCKdj6B1zOTh1k2q1UHkTfYB0KW39IBqPA>
    <xme:UZY1YQWvBglddyKvpN8T5Xzrzb-06sYI3utc5bwtlRNIt6HXElLxoZWS6SguiYmhN
    z1jv6QO8bpKhiCRCQ>
X-ME-Received: <xmr:UZY1YVJbE39wFXmOVGoURxXQi6jHDEtGLu36ZcC24AuVJhOI0OpB0NoK2X-01WnyZ5G_uYQ51FkwKy1SGR5RguwspirwDubHAV68ApzCKz4Cz-dPOiTicXPlaA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudefvddgjedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepuffvfhfhkffffgggjggtgfesthekredttdefjeenucfhrhhomhepufgrmhhu
    vghlucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecugg
    ftrfgrthhtvghrnhepgfelkeduveejtdejhfeiledvhfeggeeiieeklefhfeefffffffeg
    udetteelieejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
    homhepshgrmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:UZY1YRH6xA8CmcQwSOR51yTWP-J2XacsusdsBXv9tdFYNzjXijLPjw>
    <xmx:UZY1YZWDeTE3WpAr8cFz5a4akiKG3LXEeJjHCY7sw5AO2JlNN1N7mw>
    <xmx:UZY1YcOAN0FKLkJUgRLOkfmtKZWnClP0URRo_Qi4rksWLzqM3i2EOw>
    <xmx:U5Y1YVq8d8NzMj5tnnVhx6Epl-SnNWdKgGb4MM4zey7IiSs4nnEs9Q>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 6 Sep 2021 00:17:21 -0400 (EDT)
Subject: Re: [PATCH 2/2] leds: sunxi: New driver for the R329/D1 LED
 controller
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Icenowy Zheng <icenowy@aosc.io>, devicetree@vger.kernel.org,
        linux-leds@vger.kernel.org, linux-sunxi@lists.linux.dev,
        linux-kernel@vger.kernel.org
References: <20210902234228.32223-1-samuel@sholland.org>
 <20210902234228.32223-2-samuel@sholland.org>
 <20210903103638.5yhuvkyf62i3rp6a@gilmour>
From:   Samuel Holland <samuel@sholland.org>
Message-ID: <70c76fe4-41e4-7232-c961-785193a68859@sholland.org>
Date:   Sun, 5 Sep 2021 23:17:19 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20210903103638.5yhuvkyf62i3rp6a@gilmour>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi,

On 9/3/21 5:36 AM, Maxime Ripard wrote:
> On Thu, Sep 02, 2021 at 06:42:28PM -0500, Samuel Holland wrote:
>> Some Allwinner sunxi SoCs, starting with the R329, contain an LED
>> controller designed to drive RGB LED pixels. Add a driver for it using
>> the multicolor LED framework, and with LEDs defined in the device tree.
>>
>> Signed-off-by: Samuel Holland <samuel@sholland.org>
>> ---
>>  drivers/leds/Kconfig      |   8 +
>>  drivers/leds/Makefile     |   1 +
>>  drivers/leds/leds-sunxi.c | 562 ++++++++++++++++++++++++++++++++++++++
>>  3 files changed, 571 insertions(+)
>>  create mode 100644 drivers/leds/leds-sunxi.c
>>
>> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
>> index ed800f5da7d8..559d2ca0a7f4 100644
>> --- a/drivers/leds/Kconfig
>> +++ b/drivers/leds/Kconfig
>> @@ -297,6 +297,14 @@ config LEDS_SUNFIRE
>>  	  This option enables support for the Left, Middle, and Right
>>  	  LEDs on the I/O and CPU boards of SunFire UltraSPARC servers.
>>  
>> +config LEDS_SUNXI
>> +	tristate "LED support for Allwinner sunxi LED controller"
>> +	depends on LEDS_CLASS
>> +	depends on ARCH_SUNXI || COMPILE_TEST
>> +	help
>> +	  This option enables support for the LED controller provided in
>> +	  some Allwinner sunxi SoCs.
>> +
> 
> Same comment for the name

Are you concerned about the help text only, or do you also want me to rename the
Kconfig symbol?

I am happy to change the help text to something like: "This option enables
support for the LED controller provided in the Allwinner R329 and D1 SoCs."

But I don't know of any satisfying way to rename the Kconfig symbol. There is no
general category name for "R329 and D1."

>>  config LEDS_IPAQ_MICRO
>>  	tristate "LED Support for the Compaq iPAQ h3xxx"
>>  	depends on LEDS_CLASS
>> diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
>> index c636ec069612..3395f188e5bf 100644
>> --- a/drivers/leds/Makefile
>> +++ b/drivers/leds/Makefile
>> @@ -77,6 +77,7 @@ obj-$(CONFIG_LEDS_PWM)			+= leds-pwm.o
>>  obj-$(CONFIG_LEDS_REGULATOR)		+= leds-regulator.o
>>  obj-$(CONFIG_LEDS_S3C24XX)		+= leds-s3c24xx.o
>>  obj-$(CONFIG_LEDS_SC27XX_BLTC)		+= leds-sc27xx-bltc.o
>> +obj-$(CONFIG_LEDS_SUNXI)		+= leds-sunxi.o
>>  obj-$(CONFIG_LEDS_SUNFIRE)		+= leds-sunfire.o
>>  obj-$(CONFIG_LEDS_SYSCON)		+= leds-syscon.o
>>  obj-$(CONFIG_LEDS_TCA6507)		+= leds-tca6507.o
>> diff --git a/drivers/leds/leds-sunxi.c b/drivers/leds/leds-sunxi.c
>> new file mode 100644
>> index 000000000000..6569d64e0c76
>> --- /dev/null
>> +++ b/drivers/leds/leds-sunxi.c
>> @@ -0,0 +1,562 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +//
>> +// Copyright (c) 2021 Samuel Holland <samuel@sholland.org>
>> +//
>> +// Partly based on drivers/leds/leds-turris-omnia.c, which is:
>> +//     Copyright (c) 2020 by Marek Behún <kabel@kernel.org>
>> +//
>> +
>> +#include <linux/clk.h>
>> +#include <linux/dma-mapping.h>
>> +#include <linux/dmaengine.h>
>> +#include <linux/interrupt.h>
>> +#include <linux/io.h>
>> +#include <linux/led-class-multicolor.h>
>> +#include <linux/leds.h>
>> +#include <linux/module.h>
>> +#include <linux/of.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/pm.h>
>> +#include <linux/regulator/consumer.h>
>> +#include <linux/reset.h>
>> +#include <linux/spinlock.h>
>> +
>> +#define LEDC_CTRL_REG			0x0000
>> +#define LEDC_CTRL_REG_DATA_LENGTH		(0x1fff << 16)
>> +#define LEDC_CTRL_REG_RGB_MODE			(0x7 << 6)
>> +#define LEDC_CTRL_REG_LEDC_EN			BIT(0)
>> +#define LEDC_T01_TIMING_CTRL_REG	0x0004
>> +#define LEDC_T01_TIMING_CTRL_REG_T1H		(0x3f << 21)
>> +#define LEDC_T01_TIMING_CTRL_REG_T1L		(0x1f << 16)
>> +#define LEDC_T01_TIMING_CTRL_REG_T0H		(0x1f << 6)
>> +#define LEDC_T01_TIMING_CTRL_REG_T0L		(0x3f << 0)
>> +#define LEDC_RESET_TIMING_CTRL_REG	0x000c
>> +#define LEDC_RESET_TIMING_CTRL_REG_LED_NUM	(0x3ff << 0)
>> +#define LEDC_DATA_REG			0x0014
>> +#define LEDC_DMA_CTRL_REG		0x0018
>> +#define LEDC_DMA_CTRL_REG_FIFO_TRIG_LEVEL	(0x1f << 0)
>> +#define LEDC_INT_CTRL_REG		0x001c
>> +#define LEDC_INT_CTRL_REG_GLOBAL_INT_EN		BIT(5)
>> +#define LEDC_INT_CTRL_REG_FIFO_CPUREQ_INT_EN	BIT(1)
>> +#define LEDC_INT_CTRL_REG_TRANS_FINISH_INT_EN	BIT(0)
>> +#define LEDC_INT_STS_REG		0x0020
>> +#define LEDC_INT_STS_REG_FIFO_CPUREQ_INT	BIT(1)
>> +#define LEDC_INT_STS_REG_TRANS_FINISH_INT	BIT(0)
>> +
>> +#define LEDC_FIFO_DEPTH			32
>> +#define LEDC_MAX_LEDS			1024
>> +
>> +#define LEDS_TO_BYTES(n)		((n) * sizeof(u32))
>> +
>> +struct sunxi_ledc_led {
>> +	struct led_classdev_mc mc_cdev;
>> +	struct mc_subled subled_info[3];
>> +};
>> +#define to_ledc_led(mc) container_of(mc, struct sunxi_ledc_led, mc_cdev)
>> +
>> +struct sunxi_ledc_timing {
>> +	u32 t0h_ns;
>> +	u32 t0l_ns;
>> +	u32 t1h_ns;
>> +	u32 t1l_ns;
>> +	u32 treset_ns;
>> +};
>> +
>> +struct sunxi_ledc {
>> +	struct device *dev;
>> +	void __iomem *base;
>> +	struct clk *bus_clk;
>> +	struct clk *mod_clk;
>> +	struct reset_control *reset;
>> +	struct regulator *vled;
>> +
>> +	u32 *buffer;
>> +	struct dma_chan *dma_chan;
>> +	dma_addr_t dma_handle;
>> +	int pio_length;
>> +	int pio_offset;
>> +
>> +	spinlock_t lock;
>> +	int next_length;
>> +	bool xfer_active;
>> +
>> +	u32 format;
>> +	struct sunxi_ledc_timing timing;
>> +
>> +	int num_leds;
>> +	struct sunxi_ledc_led leds[];
>> +};
>> +
>> +static int sunxi_ledc_dma_xfer(struct sunxi_ledc *priv, int length)
>> +{
>> +	struct dma_async_tx_descriptor *desc;
>> +	dma_cookie_t cookie;
>> +
>> +	desc = dmaengine_prep_slave_single(priv->dma_chan, priv->dma_handle,
>> +					   LEDS_TO_BYTES(length),
>> +					   DMA_MEM_TO_DEV, 0);
>> +	if (!desc)
>> +		return -ENOMEM;
>> +
>> +	cookie = dmaengine_submit(desc);
>> +	if (dma_submit_error(cookie))
>> +		return -EIO;
>> +
>> +	dma_async_issue_pending(priv->dma_chan);
>> +
>> +	return 0;
>> +}
>> +
>> +static void sunxi_ledc_pio_xfer(struct sunxi_ledc *priv, int length)
>> +{
>> +	u32 burst, offset, val;
>> +
>> +	if (length) {
>> +		/* New transfer (FIFO is empty). */
>> +		offset = 0;
>> +		burst  = min(length, LEDC_FIFO_DEPTH);
>> +	} else {
>> +		/* Existing transfer (FIFO is half-full). */
>> +		length = priv->pio_length;
>> +		offset = priv->pio_offset;
>> +		burst  = min(length, LEDC_FIFO_DEPTH / 2);
>> +	}
>> +
>> +	writesl(priv->base + LEDC_DATA_REG, priv->buffer + offset, burst);
>> +
>> +	if (burst < length) {
>> +		priv->pio_length = length - burst;
>> +		priv->pio_offset = offset + burst;
>> +
>> +		if (!offset) {
>> +			val = readl(priv->base + LEDC_INT_CTRL_REG);
>> +			val |= LEDC_INT_CTRL_REG_FIFO_CPUREQ_INT_EN;
>> +			writel(val, priv->base + LEDC_INT_CTRL_REG);
>> +		}
>> +	} else {
>> +		/* Disable the request IRQ once all data is written. */
>> +		val = readl(priv->base + LEDC_INT_CTRL_REG);
>> +		val &= ~LEDC_INT_CTRL_REG_FIFO_CPUREQ_INT_EN;
>> +		writel(val, priv->base + LEDC_INT_CTRL_REG);
>> +	}
>> +}
>> +
>> +static void sunxi_ledc_start_xfer(struct sunxi_ledc *priv, int length)
>> +{
>> +	u32 val;
>> +
>> +	dev_dbg(priv->dev, "Updating %d LEDs\n", length);
>> +
>> +	val = readl(priv->base + LEDC_CTRL_REG);
>> +	val &= ~LEDC_CTRL_REG_DATA_LENGTH;
>> +	val |= length << 16 | LEDC_CTRL_REG_LEDC_EN;
>> +	writel(val, priv->base + LEDC_CTRL_REG);
>> +
>> +	if (length > LEDC_FIFO_DEPTH) {
>> +		int ret = sunxi_ledc_dma_xfer(priv, length);
>> +
>> +		if (!ret)
>> +			return;
>> +
>> +		dev_warn(priv->dev, "Failed to set up DMA: %d\n", ret);
>> +	}
>> +
>> +	sunxi_ledc_pio_xfer(priv, length);
>> +}
>> +
>> +static irqreturn_t sunxi_ledc_irq(int irq, void *dev_id)
>> +{
>> +	struct sunxi_ledc *priv = dev_id;
>> +	u32 val;
>> +
>> +	val = readl(priv->base + LEDC_INT_STS_REG);
>> +
>> +	if (val & LEDC_INT_STS_REG_TRANS_FINISH_INT) {
>> +		int next_length;
>> +
>> +		/* Start the next transfer if needed. */
>> +		spin_lock(&priv->lock);
>> +		next_length = priv->next_length;
>> +		if (next_length)
>> +			priv->next_length = 0;
>> +		else
>> +			priv->xfer_active = false;
>> +		spin_unlock(&priv->lock);
>> +
>> +		if (next_length)
>> +			sunxi_ledc_start_xfer(priv, next_length);
>> +	} else if (val & LEDC_INT_STS_REG_FIFO_CPUREQ_INT) {
>> +		/* Continue the current transfer. */
>> +		sunxi_ledc_pio_xfer(priv, 0);
>> +	}
>> +
>> +	writel(val, priv->base + LEDC_INT_STS_REG);
>> +
>> +	return IRQ_HANDLED;
>> +}
>> +
>> +static void sunxi_ledc_brightness_set(struct led_classdev *cdev,
>> +				       enum led_brightness brightness)
>> +{
>> +	struct sunxi_ledc *priv = dev_get_drvdata(cdev->dev->parent);
>> +	struct led_classdev_mc *mc_cdev = lcdev_to_mccdev(cdev);
>> +	struct sunxi_ledc_led *led = to_ledc_led(mc_cdev);
>> +	int addr = led - priv->leds;
>> +	unsigned long flags;
>> +	bool xfer_active;
>> +	int next_length;
>> +
>> +	led_mc_calc_color_components(mc_cdev, brightness);
>> +
>> +	priv->buffer[addr] = led->subled_info[0].brightness << 16 |
>> +			     led->subled_info[1].brightness <<  8 |
>> +			     led->subled_info[2].brightness;
>> +
>> +	dev_dbg(priv->dev, "LED %d -> #%06x\n", addr, priv->buffer[addr]);
>> +
>> +	spin_lock_irqsave(&priv->lock, flags);
>> +	next_length = max(priv->next_length, addr + 1);
>> +	xfer_active = priv->xfer_active;
>> +	if (xfer_active)
>> +		priv->next_length = next_length;
>> +	else
>> +		priv->xfer_active = true;
>> +	spin_unlock_irqrestore(&priv->lock, flags);
>> +
>> +	if (!xfer_active)
>> +		sunxi_ledc_start_xfer(priv, next_length);
>> +}
>> +
>> +static const char *const sunxi_ledc_formats[] = {
>> +	"rgb",
>> +	"rbg",
>> +	"grb",
>> +	"gbr",
>> +	"brg",
>> +	"bgr",
>> +};
>> +
>> +static int sunxi_ledc_parse_format(const struct device_node *np,
>> +				    struct sunxi_ledc *priv)
>> +{
>> +	const char *format = "grb";
>> +	u32 i;
>> +
>> +	of_property_read_string(np, "format", &format);
>> +
>> +	for (i = 0; i < ARRAY_SIZE(sunxi_ledc_formats); ++i) {
>> +		if (!strcmp(format, sunxi_ledc_formats[i])) {
>> +			priv->format = i;
>> +			return 0;
>> +		}
>> +	}
>> +
>> +	dev_err(priv->dev, "Bad pixel format '%s'\n", format);
>> +
>> +	return -EINVAL;
>> +}
>> +
>> +static void sunxi_ledc_set_format(struct sunxi_ledc *priv)
>> +{
>> +	u32 val;
>> +
>> +	val = readl(priv->base + LEDC_CTRL_REG);
>> +	val &= ~LEDC_CTRL_REG_RGB_MODE;
>> +	val |= priv->format << 6;
>> +	writel(val, priv->base + LEDC_CTRL_REG);
>> +}
>> +
>> +static const struct sunxi_ledc_timing sunxi_ledc_default_timing = {
>> +	.t0h_ns = 336,
>> +	.t0l_ns = 840,
>> +	.t1h_ns = 882,
>> +	.t1l_ns = 294,
>> +	.treset_ns = 300000,
>> +};
>> +
>> +static int sunxi_ledc_parse_timing(const struct device_node *np,
>> +				    struct sunxi_ledc *priv)
>> +{
>> +	struct sunxi_ledc_timing *timing = &priv->timing;
>> +
>> +	*timing = sunxi_ledc_default_timing;
>> +
>> +	of_property_read_u32(np, "t0h-ns", &timing->t0h_ns);
>> +	of_property_read_u32(np, "t0l-ns", &timing->t0l_ns);
>> +	of_property_read_u32(np, "t1h-ns", &timing->t1h_ns);
>> +	of_property_read_u32(np, "t1l-ns", &timing->t1l_ns);
>> +	of_property_read_u32(np, "treset-ns", &timing->treset_ns);
>> +
>> +	return 0;
>> +}
>> +
>> +static void sunxi_ledc_set_timing(struct sunxi_ledc *priv)
>> +{
>> +	const struct sunxi_ledc_timing *timing = &priv->timing;
>> +	unsigned long mod_freq = clk_get_rate(priv->mod_clk);
>> +	u32 cycle_ns = NSEC_PER_SEC / mod_freq;
>> +	u32 val;
>> +
>> +	val = (timing->t1h_ns / cycle_ns) << 21 |
>> +	      (timing->t1l_ns / cycle_ns) << 16 |
>> +	      (timing->t0h_ns / cycle_ns) <<  6 |
>> +	      (timing->t0l_ns / cycle_ns);
>> +	writel(val, priv->base + LEDC_T01_TIMING_CTRL_REG);
>> +
>> +	val = (timing->treset_ns / cycle_ns) << 16 |
>> +	      (priv->num_leds - 1);
>> +	writel(val, priv->base + LEDC_RESET_TIMING_CTRL_REG);
>> +}
>> +
>> +static int sunxi_ledc_resume(struct device *dev)
>> +{
>> +	struct sunxi_ledc *priv = dev_get_drvdata(dev);
>> +	u32 val;
>> +	int ret;
>> +
>> +	ret = regulator_enable(priv->vled);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = reset_control_deassert(priv->reset);
>> +	if (ret)
>> +		goto err_disable_regulator;
>> +
>> +	ret = clk_prepare_enable(priv->bus_clk);
>> +	if (ret)
>> +		goto err_assert_reset;
>> +
>> +	ret = clk_prepare_enable(priv->mod_clk);
>> +	if (ret)
>> +		goto err_disable_bus_clk;
>> +
>> +	sunxi_ledc_set_format(priv);
>> +	sunxi_ledc_set_timing(priv);
>> +
>> +	/* The trigger level must be at least the burst length. */
>> +	val = readl(priv->base + LEDC_DMA_CTRL_REG);
>> +	val &= ~LEDC_DMA_CTRL_REG_FIFO_TRIG_LEVEL;
>> +	val |= LEDC_FIFO_DEPTH / 2;
>> +	writel(val, priv->base + LEDC_DMA_CTRL_REG);
>> +
>> +	val = LEDC_INT_CTRL_REG_GLOBAL_INT_EN |
>> +	      LEDC_INT_CTRL_REG_TRANS_FINISH_INT_EN;
>> +	writel(val, priv->base + LEDC_INT_CTRL_REG);
>> +
>> +	return 0;
>> +
>> +err_disable_bus_clk:
>> +	clk_disable_unprepare(priv->bus_clk);
>> +err_assert_reset:
>> +	reset_control_assert(priv->reset);
>> +err_disable_regulator:
>> +	regulator_disable(priv->vled);
>> +
>> +	return ret;
>> +}
>> +
>> +static int sunxi_ledc_suspend(struct device *dev)
>> +{
>> +	struct sunxi_ledc *priv = dev_get_drvdata(dev);
>> +
>> +	clk_disable_unprepare(priv->mod_clk);
>> +	clk_disable_unprepare(priv->bus_clk);
>> +	reset_control_assert(priv->reset);
>> +	regulator_disable(priv->vled);
>> +
>> +	return 0;
>> +}
>> +
>> +static void sunxi_ledc_dma_cleanup(void *data)
>> +{
>> +	struct sunxi_ledc *priv = data;
>> +	struct device *dma_dev = dmaengine_get_dma_device(priv->dma_chan);
>> +
>> +	if (priv->buffer)
>> +		dma_free_wc(dma_dev, LEDS_TO_BYTES(priv->num_leds),
>> +			    priv->buffer, priv->dma_handle);
>> +	dma_release_channel(priv->dma_chan);
>> +}
>> +
>> +static int sunxi_ledc_probe(struct platform_device *pdev)
>> +{
>> +	const struct device_node *np = pdev->dev.of_node;
>> +	struct dma_slave_config dma_cfg = {};
>> +	struct led_init_data init_data = {};
>> +	struct device *dev = &pdev->dev;
>> +	struct device_node *child;
>> +	struct sunxi_ledc *priv;
>> +	struct resource *mem;
>> +	int count, irq, ret;
>> +
>> +	count = of_get_available_child_count(np);
>> +	if (!count)
>> +		return -ENODEV;
>> +	if (count > LEDC_MAX_LEDS) {
>> +		dev_err(dev, "Too many LEDs! (max is %d)\n", LEDC_MAX_LEDS);
>> +		return -EINVAL;
>> +	}
>> +
>> +	priv = devm_kzalloc(dev, struct_size(priv, leds, count), GFP_KERNEL);
>> +	if (!priv)
>> +		return -ENOMEM;
>> +
>> +	priv->dev = dev;
>> +	priv->num_leds = count;
>> +	spin_lock_init(&priv->lock);
>> +	dev_set_drvdata(dev, priv);
>> +
>> +	ret = sunxi_ledc_parse_format(np, priv);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = sunxi_ledc_parse_timing(np, priv);
>> +	if (ret)
>> +		return ret;
>> +
>> +	priv->base = devm_platform_get_and_ioremap_resource(pdev, 0, &mem);
>> +	if (IS_ERR(priv->base))
>> +		return PTR_ERR(priv->base);
>> +
>> +	priv->bus_clk = devm_clk_get(dev, "bus");
>> +	if (IS_ERR(priv->bus_clk))
>> +		return PTR_ERR(priv->bus_clk);
>> +
>> +	priv->mod_clk = devm_clk_get(dev, "mod");
>> +	if (IS_ERR(priv->mod_clk))
>> +		return PTR_ERR(priv->mod_clk);
>> +
>> +	priv->reset = devm_reset_control_get_exclusive(dev, NULL);
>> +	if (IS_ERR(priv->reset))
>> +		return PTR_ERR(priv->reset);
>> +
>> +	priv->vled = devm_regulator_get(dev, "vled");
>> +	if (IS_ERR(priv->vled))
>> +		return PTR_ERR(priv->vled);
>> +
>> +	priv->dma_chan = dma_request_chan(dev, "tx");
>> +	if (IS_ERR(priv->dma_chan))
>> +		return PTR_ERR(priv->dma_chan);
>> +
>> +	ret = devm_add_action_or_reset(dev, sunxi_ledc_dma_cleanup, priv);
>> +	if (ret)
>> +		return ret;
>> +
>> +	dma_cfg.dst_addr	= mem->start + LEDC_DATA_REG;
>> +	dma_cfg.dst_addr_width	= DMA_SLAVE_BUSWIDTH_4_BYTES;
>> +	dma_cfg.dst_maxburst	= LEDC_FIFO_DEPTH / 2;
>> +	ret = dmaengine_slave_config(priv->dma_chan, &dma_cfg);
>> +	if (ret)
>> +		return ret;
>> +
>> +	priv->buffer = dma_alloc_wc(dmaengine_get_dma_device(priv->dma_chan),
>> +				    LEDS_TO_BYTES(priv->num_leds),
>> +				    &priv->dma_handle, GFP_KERNEL);
>> +	if (!priv->buffer)
>> +		return -ENOMEM;
>> +
>> +	irq = platform_get_irq(pdev, 0);
>> +	if (irq < 0)
>> +		return irq;
>> +
>> +	ret = devm_request_irq(dev, irq, sunxi_ledc_irq, 0, dev_name(dev), priv);
>> +	if (ret)
>> +		return ret;
> 
> Starting here, you can get interrupts. I couldn't spot anything wrong in
> the handler, but would that cause any trouble if an interrupt was coming
> right here?

It should be fine. The data request IRQ will be disabled if it is received
because priv->pio_length == 0, and the other IRQs are oneshots and harmless.

>> +	ret = sunxi_ledc_resume(dev);
>> +	if (ret)
>> +		return ret;
> 
> It's not clear to me what is done here. I assume from the rest of the
> driver that you want to use runtime_pm, but it's never enabled for that
> driver and the active count will be off here

There is no runtime PM here, only system PM. So I have just reused the hardware
init procedure from system resume. If I was to add runtime PM, then yes, this
call would not belong here.

Regards,
Samuel
