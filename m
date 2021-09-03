Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1549E3FFE43
	for <lists+linux-leds@lfdr.de>; Fri,  3 Sep 2021 12:36:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235007AbhICKhn (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 3 Sep 2021 06:37:43 -0400
Received: from wout4-smtp.messagingengine.com ([64.147.123.20]:58427 "EHLO
        wout4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234713AbhICKhm (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 3 Sep 2021 06:37:42 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.west.internal (Postfix) with ESMTP id 370FE32009AC;
        Fri,  3 Sep 2021 06:36:42 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Fri, 03 Sep 2021 06:36:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm3; bh=HOjlwovaGo2T2Z2maAkLXRgm4ex
        N9xUh1eJCrlg75tk=; b=d2wJldA2lXjxjbNDHAoEpb5ezoYuRvGJbJI7wD/rf4L
        AidRYfVPTjqB+JLVIv3AKOhUJ4OxZuRpfICEsQCAj1hIMAz+MNLw+VyaryzksZuT
        EVCHp1wYp7p9VgLe2V2ephv6GbWz+mTnHcA4HI0JJkDQC2lUx+8dCXqoLJNpz+iA
        tNpJACgjj82+Wg46vobE0347LTDPscfqmcOTHiPk+ELT+sBfiKXk/jeLzkh8EFfj
        jHg0aj57Rkoa/iv7o32/u1K2RCndnGYFVpZkoG6crSblxKgkXh65E9BH40rQjHPU
        T9KcdkSoR8b4cWBuUYYYzsGA8OP4RKJfhROvrl+MMUw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=HOjlwo
        vaGo2T2Z2maAkLXRgm4exN9xUh1eJCrlg75tk=; b=HfqQOdGGPB11QKkC3VanW7
        bXPl5/6FRMFjPKy7FiFlb32ZSajcFpedqDgg24tr9zRunVVxGJQFSq41yLEwLcw1
        GtfXg0r0PGwUo+YlZgvkL/8gfo/M+SCFg2Nu7W6e3wprbMIEDPTRUiVsmj5GI01C
        tgQqqaBnvkrRDFi0LP5FkYzGlbuZnKRugm7VdWh9kHy8Fr4E+04+4oMdaq1j3Q7D
        1CK16HsWg2viLgtpD4hfGGWuLa+9Df2O50y6Wmmy0lreT7lFcG4/sMJ4X+9f3Nps
        j3a37MP/5MrgQft3vEu1sQNuuHYAnFsisSrOhdbsNE/u/Vrp/aMGbRPQUdFB3bWw
        ==
X-ME-Sender: <xms:uPoxYayqcZ0KqCzzF25hvsoksgEf6aV5gZ5fU6EAWmU3VckocFpRdw>
    <xme:uPoxYWRPQu8bu6lK6xn5cVu7cohmlL0jRidI4g5cOyYDSNO19YCZSxqE-SyBdQLTv
    OQQkGN7ZVd7-8yUCEs>
X-ME-Received: <xmr:uPoxYcX9H1KxX37JI9Kov1HIvHUYZHALZv8vtgEe_ciZTGDPcEj0oeY8CUe4LJOOBfB39nwvqPwLC40lbcawK5wRvqJTGQakjo1d>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddruddvjedgvdelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddunecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepuddvudfhkeekhefgffetffelgffftdehffduffegveetffehueeivddvjedv
    gfevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
    grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:uPoxYQh3HcK82LH1m-o5NLnWuu45x4fJKbUuLFYsxFLPUXe8uw8kWQ>
    <xmx:uPoxYcCiIAdlSW9nS53PCsjbjY-U1NO4xMhNLNjxsHqrjUNONxefKw>
    <xmx:uPoxYRJoBGWYaQH4nOmRLeYzqNkj-ngVnTTUcSxvACU8Xfs5MlbD_g>
    <xmx:ufoxYY3hDS_LCCcvd7WrMjnfnaEfdGD7JWGazZA0YV3mAEGQDGB_nw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 3 Sep 2021 06:36:40 -0400 (EDT)
Date:   Fri, 3 Sep 2021 12:36:38 +0200
From:   Maxime Ripard <maxime@cerno.tech>
To:     Samuel Holland <samuel@sholland.org>
Cc:     Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Icenowy Zheng <icenowy@aosc.io>, devicetree@vger.kernel.org,
        linux-leds@vger.kernel.org, linux-sunxi@lists.linux.dev,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] leds: sunxi: New driver for the R329/D1 LED
 controller
Message-ID: <20210903103638.5yhuvkyf62i3rp6a@gilmour>
References: <20210902234228.32223-1-samuel@sholland.org>
 <20210902234228.32223-2-samuel@sholland.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="lig3fkhpokomm4zi"
Content-Disposition: inline
In-Reply-To: <20210902234228.32223-2-samuel@sholland.org>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--lig3fkhpokomm4zi
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 02, 2021 at 06:42:28PM -0500, Samuel Holland wrote:
> Some Allwinner sunxi SoCs, starting with the R329, contain an LED
> controller designed to drive RGB LED pixels. Add a driver for it using
> the multicolor LED framework, and with LEDs defined in the device tree.
>=20
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> ---
>  drivers/leds/Kconfig      |   8 +
>  drivers/leds/Makefile     |   1 +
>  drivers/leds/leds-sunxi.c | 562 ++++++++++++++++++++++++++++++++++++++
>  3 files changed, 571 insertions(+)
>  create mode 100644 drivers/leds/leds-sunxi.c
>=20
> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> index ed800f5da7d8..559d2ca0a7f4 100644
> --- a/drivers/leds/Kconfig
> +++ b/drivers/leds/Kconfig
> @@ -297,6 +297,14 @@ config LEDS_SUNFIRE
>  	  This option enables support for the Left, Middle, and Right
>  	  LEDs on the I/O and CPU boards of SunFire UltraSPARC servers.
> =20
> +config LEDS_SUNXI
> +	tristate "LED support for Allwinner sunxi LED controller"
> +	depends on LEDS_CLASS
> +	depends on ARCH_SUNXI || COMPILE_TEST
> +	help
> +	  This option enables support for the LED controller provided in
> +	  some Allwinner sunxi SoCs.
> +

Same comment for the name

>  config LEDS_IPAQ_MICRO
>  	tristate "LED Support for the Compaq iPAQ h3xxx"
>  	depends on LEDS_CLASS
> diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
> index c636ec069612..3395f188e5bf 100644
> --- a/drivers/leds/Makefile
> +++ b/drivers/leds/Makefile
> @@ -77,6 +77,7 @@ obj-$(CONFIG_LEDS_PWM)			+=3D leds-pwm.o
>  obj-$(CONFIG_LEDS_REGULATOR)		+=3D leds-regulator.o
>  obj-$(CONFIG_LEDS_S3C24XX)		+=3D leds-s3c24xx.o
>  obj-$(CONFIG_LEDS_SC27XX_BLTC)		+=3D leds-sc27xx-bltc.o
> +obj-$(CONFIG_LEDS_SUNXI)		+=3D leds-sunxi.o
>  obj-$(CONFIG_LEDS_SUNFIRE)		+=3D leds-sunfire.o
>  obj-$(CONFIG_LEDS_SYSCON)		+=3D leds-syscon.o
>  obj-$(CONFIG_LEDS_TCA6507)		+=3D leds-tca6507.o
> diff --git a/drivers/leds/leds-sunxi.c b/drivers/leds/leds-sunxi.c
> new file mode 100644
> index 000000000000..6569d64e0c76
> --- /dev/null
> +++ b/drivers/leds/leds-sunxi.c
> @@ -0,0 +1,562 @@
> +// SPDX-License-Identifier: GPL-2.0
> +//
> +// Copyright (c) 2021 Samuel Holland <samuel@sholland.org>
> +//
> +// Partly based on drivers/leds/leds-turris-omnia.c, which is:
> +//     Copyright (c) 2020 by Marek Beh=FAn <kabel@kernel.org>
> +//
> +
> +#include <linux/clk.h>
> +#include <linux/dma-mapping.h>
> +#include <linux/dmaengine.h>
> +#include <linux/interrupt.h>
> +#include <linux/io.h>
> +#include <linux/led-class-multicolor.h>
> +#include <linux/leds.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm.h>
> +#include <linux/regulator/consumer.h>
> +#include <linux/reset.h>
> +#include <linux/spinlock.h>
> +
> +#define LEDC_CTRL_REG			0x0000
> +#define LEDC_CTRL_REG_DATA_LENGTH		(0x1fff << 16)
> +#define LEDC_CTRL_REG_RGB_MODE			(0x7 << 6)
> +#define LEDC_CTRL_REG_LEDC_EN			BIT(0)
> +#define LEDC_T01_TIMING_CTRL_REG	0x0004
> +#define LEDC_T01_TIMING_CTRL_REG_T1H		(0x3f << 21)
> +#define LEDC_T01_TIMING_CTRL_REG_T1L		(0x1f << 16)
> +#define LEDC_T01_TIMING_CTRL_REG_T0H		(0x1f << 6)
> +#define LEDC_T01_TIMING_CTRL_REG_T0L		(0x3f << 0)
> +#define LEDC_RESET_TIMING_CTRL_REG	0x000c
> +#define LEDC_RESET_TIMING_CTRL_REG_LED_NUM	(0x3ff << 0)
> +#define LEDC_DATA_REG			0x0014
> +#define LEDC_DMA_CTRL_REG		0x0018
> +#define LEDC_DMA_CTRL_REG_FIFO_TRIG_LEVEL	(0x1f << 0)
> +#define LEDC_INT_CTRL_REG		0x001c
> +#define LEDC_INT_CTRL_REG_GLOBAL_INT_EN		BIT(5)
> +#define LEDC_INT_CTRL_REG_FIFO_CPUREQ_INT_EN	BIT(1)
> +#define LEDC_INT_CTRL_REG_TRANS_FINISH_INT_EN	BIT(0)
> +#define LEDC_INT_STS_REG		0x0020
> +#define LEDC_INT_STS_REG_FIFO_CPUREQ_INT	BIT(1)
> +#define LEDC_INT_STS_REG_TRANS_FINISH_INT	BIT(0)
> +
> +#define LEDC_FIFO_DEPTH			32
> +#define LEDC_MAX_LEDS			1024
> +
> +#define LEDS_TO_BYTES(n)		((n) * sizeof(u32))
> +
> +struct sunxi_ledc_led {
> +	struct led_classdev_mc mc_cdev;
> +	struct mc_subled subled_info[3];
> +};
> +#define to_ledc_led(mc) container_of(mc, struct sunxi_ledc_led, mc_cdev)
> +
> +struct sunxi_ledc_timing {
> +	u32 t0h_ns;
> +	u32 t0l_ns;
> +	u32 t1h_ns;
> +	u32 t1l_ns;
> +	u32 treset_ns;
> +};
> +
> +struct sunxi_ledc {
> +	struct device *dev;
> +	void __iomem *base;
> +	struct clk *bus_clk;
> +	struct clk *mod_clk;
> +	struct reset_control *reset;
> +	struct regulator *vled;
> +
> +	u32 *buffer;
> +	struct dma_chan *dma_chan;
> +	dma_addr_t dma_handle;
> +	int pio_length;
> +	int pio_offset;
> +
> +	spinlock_t lock;
> +	int next_length;
> +	bool xfer_active;
> +
> +	u32 format;
> +	struct sunxi_ledc_timing timing;
> +
> +	int num_leds;
> +	struct sunxi_ledc_led leds[];
> +};
> +
> +static int sunxi_ledc_dma_xfer(struct sunxi_ledc *priv, int length)
> +{
> +	struct dma_async_tx_descriptor *desc;
> +	dma_cookie_t cookie;
> +
> +	desc =3D dmaengine_prep_slave_single(priv->dma_chan, priv->dma_handle,
> +					   LEDS_TO_BYTES(length),
> +					   DMA_MEM_TO_DEV, 0);
> +	if (!desc)
> +		return -ENOMEM;
> +
> +	cookie =3D dmaengine_submit(desc);
> +	if (dma_submit_error(cookie))
> +		return -EIO;
> +
> +	dma_async_issue_pending(priv->dma_chan);
> +
> +	return 0;
> +}
> +
> +static void sunxi_ledc_pio_xfer(struct sunxi_ledc *priv, int length)
> +{
> +	u32 burst, offset, val;
> +
> +	if (length) {
> +		/* New transfer (FIFO is empty). */
> +		offset =3D 0;
> +		burst  =3D min(length, LEDC_FIFO_DEPTH);
> +	} else {
> +		/* Existing transfer (FIFO is half-full). */
> +		length =3D priv->pio_length;
> +		offset =3D priv->pio_offset;
> +		burst  =3D min(length, LEDC_FIFO_DEPTH / 2);
> +	}
> +
> +	writesl(priv->base + LEDC_DATA_REG, priv->buffer + offset, burst);
> +
> +	if (burst < length) {
> +		priv->pio_length =3D length - burst;
> +		priv->pio_offset =3D offset + burst;
> +
> +		if (!offset) {
> +			val =3D readl(priv->base + LEDC_INT_CTRL_REG);
> +			val |=3D LEDC_INT_CTRL_REG_FIFO_CPUREQ_INT_EN;
> +			writel(val, priv->base + LEDC_INT_CTRL_REG);
> +		}
> +	} else {
> +		/* Disable the request IRQ once all data is written. */
> +		val =3D readl(priv->base + LEDC_INT_CTRL_REG);
> +		val &=3D ~LEDC_INT_CTRL_REG_FIFO_CPUREQ_INT_EN;
> +		writel(val, priv->base + LEDC_INT_CTRL_REG);
> +	}
> +}
> +
> +static void sunxi_ledc_start_xfer(struct sunxi_ledc *priv, int length)
> +{
> +	u32 val;
> +
> +	dev_dbg(priv->dev, "Updating %d LEDs\n", length);
> +
> +	val =3D readl(priv->base + LEDC_CTRL_REG);
> +	val &=3D ~LEDC_CTRL_REG_DATA_LENGTH;
> +	val |=3D length << 16 | LEDC_CTRL_REG_LEDC_EN;
> +	writel(val, priv->base + LEDC_CTRL_REG);
> +
> +	if (length > LEDC_FIFO_DEPTH) {
> +		int ret =3D sunxi_ledc_dma_xfer(priv, length);
> +
> +		if (!ret)
> +			return;
> +
> +		dev_warn(priv->dev, "Failed to set up DMA: %d\n", ret);
> +	}
> +
> +	sunxi_ledc_pio_xfer(priv, length);
> +}
> +
> +static irqreturn_t sunxi_ledc_irq(int irq, void *dev_id)
> +{
> +	struct sunxi_ledc *priv =3D dev_id;
> +	u32 val;
> +
> +	val =3D readl(priv->base + LEDC_INT_STS_REG);
> +
> +	if (val & LEDC_INT_STS_REG_TRANS_FINISH_INT) {
> +		int next_length;
> +
> +		/* Start the next transfer if needed. */
> +		spin_lock(&priv->lock);
> +		next_length =3D priv->next_length;
> +		if (next_length)
> +			priv->next_length =3D 0;
> +		else
> +			priv->xfer_active =3D false;
> +		spin_unlock(&priv->lock);
> +
> +		if (next_length)
> +			sunxi_ledc_start_xfer(priv, next_length);
> +	} else if (val & LEDC_INT_STS_REG_FIFO_CPUREQ_INT) {
> +		/* Continue the current transfer. */
> +		sunxi_ledc_pio_xfer(priv, 0);
> +	}
> +
> +	writel(val, priv->base + LEDC_INT_STS_REG);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static void sunxi_ledc_brightness_set(struct led_classdev *cdev,
> +				       enum led_brightness brightness)
> +{
> +	struct sunxi_ledc *priv =3D dev_get_drvdata(cdev->dev->parent);
> +	struct led_classdev_mc *mc_cdev =3D lcdev_to_mccdev(cdev);
> +	struct sunxi_ledc_led *led =3D to_ledc_led(mc_cdev);
> +	int addr =3D led - priv->leds;
> +	unsigned long flags;
> +	bool xfer_active;
> +	int next_length;
> +
> +	led_mc_calc_color_components(mc_cdev, brightness);
> +
> +	priv->buffer[addr] =3D led->subled_info[0].brightness << 16 |
> +			     led->subled_info[1].brightness <<  8 |
> +			     led->subled_info[2].brightness;
> +
> +	dev_dbg(priv->dev, "LED %d -> #%06x\n", addr, priv->buffer[addr]);
> +
> +	spin_lock_irqsave(&priv->lock, flags);
> +	next_length =3D max(priv->next_length, addr + 1);
> +	xfer_active =3D priv->xfer_active;
> +	if (xfer_active)
> +		priv->next_length =3D next_length;
> +	else
> +		priv->xfer_active =3D true;
> +	spin_unlock_irqrestore(&priv->lock, flags);
> +
> +	if (!xfer_active)
> +		sunxi_ledc_start_xfer(priv, next_length);
> +}
> +
> +static const char *const sunxi_ledc_formats[] =3D {
> +	"rgb",
> +	"rbg",
> +	"grb",
> +	"gbr",
> +	"brg",
> +	"bgr",
> +};
> +
> +static int sunxi_ledc_parse_format(const struct device_node *np,
> +				    struct sunxi_ledc *priv)
> +{
> +	const char *format =3D "grb";
> +	u32 i;
> +
> +	of_property_read_string(np, "format", &format);
> +
> +	for (i =3D 0; i < ARRAY_SIZE(sunxi_ledc_formats); ++i) {
> +		if (!strcmp(format, sunxi_ledc_formats[i])) {
> +			priv->format =3D i;
> +			return 0;
> +		}
> +	}
> +
> +	dev_err(priv->dev, "Bad pixel format '%s'\n", format);
> +
> +	return -EINVAL;
> +}
> +
> +static void sunxi_ledc_set_format(struct sunxi_ledc *priv)
> +{
> +	u32 val;
> +
> +	val =3D readl(priv->base + LEDC_CTRL_REG);
> +	val &=3D ~LEDC_CTRL_REG_RGB_MODE;
> +	val |=3D priv->format << 6;
> +	writel(val, priv->base + LEDC_CTRL_REG);
> +}
> +
> +static const struct sunxi_ledc_timing sunxi_ledc_default_timing =3D {
> +	.t0h_ns =3D 336,
> +	.t0l_ns =3D 840,
> +	.t1h_ns =3D 882,
> +	.t1l_ns =3D 294,
> +	.treset_ns =3D 300000,
> +};
> +
> +static int sunxi_ledc_parse_timing(const struct device_node *np,
> +				    struct sunxi_ledc *priv)
> +{
> +	struct sunxi_ledc_timing *timing =3D &priv->timing;
> +
> +	*timing =3D sunxi_ledc_default_timing;
> +
> +	of_property_read_u32(np, "t0h-ns", &timing->t0h_ns);
> +	of_property_read_u32(np, "t0l-ns", &timing->t0l_ns);
> +	of_property_read_u32(np, "t1h-ns", &timing->t1h_ns);
> +	of_property_read_u32(np, "t1l-ns", &timing->t1l_ns);
> +	of_property_read_u32(np, "treset-ns", &timing->treset_ns);
> +
> +	return 0;
> +}
> +
> +static void sunxi_ledc_set_timing(struct sunxi_ledc *priv)
> +{
> +	const struct sunxi_ledc_timing *timing =3D &priv->timing;
> +	unsigned long mod_freq =3D clk_get_rate(priv->mod_clk);
> +	u32 cycle_ns =3D NSEC_PER_SEC / mod_freq;
> +	u32 val;
> +
> +	val =3D (timing->t1h_ns / cycle_ns) << 21 |
> +	      (timing->t1l_ns / cycle_ns) << 16 |
> +	      (timing->t0h_ns / cycle_ns) <<  6 |
> +	      (timing->t0l_ns / cycle_ns);
> +	writel(val, priv->base + LEDC_T01_TIMING_CTRL_REG);
> +
> +	val =3D (timing->treset_ns / cycle_ns) << 16 |
> +	      (priv->num_leds - 1);
> +	writel(val, priv->base + LEDC_RESET_TIMING_CTRL_REG);
> +}
> +
> +static int sunxi_ledc_resume(struct device *dev)
> +{
> +	struct sunxi_ledc *priv =3D dev_get_drvdata(dev);
> +	u32 val;
> +	int ret;
> +
> +	ret =3D regulator_enable(priv->vled);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D reset_control_deassert(priv->reset);
> +	if (ret)
> +		goto err_disable_regulator;
> +
> +	ret =3D clk_prepare_enable(priv->bus_clk);
> +	if (ret)
> +		goto err_assert_reset;
> +
> +	ret =3D clk_prepare_enable(priv->mod_clk);
> +	if (ret)
> +		goto err_disable_bus_clk;
> +
> +	sunxi_ledc_set_format(priv);
> +	sunxi_ledc_set_timing(priv);
> +
> +	/* The trigger level must be at least the burst length. */
> +	val =3D readl(priv->base + LEDC_DMA_CTRL_REG);
> +	val &=3D ~LEDC_DMA_CTRL_REG_FIFO_TRIG_LEVEL;
> +	val |=3D LEDC_FIFO_DEPTH / 2;
> +	writel(val, priv->base + LEDC_DMA_CTRL_REG);
> +
> +	val =3D LEDC_INT_CTRL_REG_GLOBAL_INT_EN |
> +	      LEDC_INT_CTRL_REG_TRANS_FINISH_INT_EN;
> +	writel(val, priv->base + LEDC_INT_CTRL_REG);
> +
> +	return 0;
> +
> +err_disable_bus_clk:
> +	clk_disable_unprepare(priv->bus_clk);
> +err_assert_reset:
> +	reset_control_assert(priv->reset);
> +err_disable_regulator:
> +	regulator_disable(priv->vled);
> +
> +	return ret;
> +}
> +
> +static int sunxi_ledc_suspend(struct device *dev)
> +{
> +	struct sunxi_ledc *priv =3D dev_get_drvdata(dev);
> +
> +	clk_disable_unprepare(priv->mod_clk);
> +	clk_disable_unprepare(priv->bus_clk);
> +	reset_control_assert(priv->reset);
> +	regulator_disable(priv->vled);
> +
> +	return 0;
> +}
> +
> +static void sunxi_ledc_dma_cleanup(void *data)
> +{
> +	struct sunxi_ledc *priv =3D data;
> +	struct device *dma_dev =3D dmaengine_get_dma_device(priv->dma_chan);
> +
> +	if (priv->buffer)
> +		dma_free_wc(dma_dev, LEDS_TO_BYTES(priv->num_leds),
> +			    priv->buffer, priv->dma_handle);
> +	dma_release_channel(priv->dma_chan);
> +}
> +
> +static int sunxi_ledc_probe(struct platform_device *pdev)
> +{
> +	const struct device_node *np =3D pdev->dev.of_node;
> +	struct dma_slave_config dma_cfg =3D {};
> +	struct led_init_data init_data =3D {};
> +	struct device *dev =3D &pdev->dev;
> +	struct device_node *child;
> +	struct sunxi_ledc *priv;
> +	struct resource *mem;
> +	int count, irq, ret;
> +
> +	count =3D of_get_available_child_count(np);
> +	if (!count)
> +		return -ENODEV;
> +	if (count > LEDC_MAX_LEDS) {
> +		dev_err(dev, "Too many LEDs! (max is %d)\n", LEDC_MAX_LEDS);
> +		return -EINVAL;
> +	}
> +
> +	priv =3D devm_kzalloc(dev, struct_size(priv, leds, count), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	priv->dev =3D dev;
> +	priv->num_leds =3D count;
> +	spin_lock_init(&priv->lock);
> +	dev_set_drvdata(dev, priv);
> +
> +	ret =3D sunxi_ledc_parse_format(np, priv);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D sunxi_ledc_parse_timing(np, priv);
> +	if (ret)
> +		return ret;
> +
> +	priv->base =3D devm_platform_get_and_ioremap_resource(pdev, 0, &mem);
> +	if (IS_ERR(priv->base))
> +		return PTR_ERR(priv->base);
> +
> +	priv->bus_clk =3D devm_clk_get(dev, "bus");
> +	if (IS_ERR(priv->bus_clk))
> +		return PTR_ERR(priv->bus_clk);
> +
> +	priv->mod_clk =3D devm_clk_get(dev, "mod");
> +	if (IS_ERR(priv->mod_clk))
> +		return PTR_ERR(priv->mod_clk);
> +
> +	priv->reset =3D devm_reset_control_get_exclusive(dev, NULL);
> +	if (IS_ERR(priv->reset))
> +		return PTR_ERR(priv->reset);
> +
> +	priv->vled =3D devm_regulator_get(dev, "vled");
> +	if (IS_ERR(priv->vled))
> +		return PTR_ERR(priv->vled);
> +
> +	priv->dma_chan =3D dma_request_chan(dev, "tx");
> +	if (IS_ERR(priv->dma_chan))
> +		return PTR_ERR(priv->dma_chan);
> +
> +	ret =3D devm_add_action_or_reset(dev, sunxi_ledc_dma_cleanup, priv);
> +	if (ret)
> +		return ret;
> +
> +	dma_cfg.dst_addr	=3D mem->start + LEDC_DATA_REG;
> +	dma_cfg.dst_addr_width	=3D DMA_SLAVE_BUSWIDTH_4_BYTES;
> +	dma_cfg.dst_maxburst	=3D LEDC_FIFO_DEPTH / 2;
> +	ret =3D dmaengine_slave_config(priv->dma_chan, &dma_cfg);
> +	if (ret)
> +		return ret;
> +
> +	priv->buffer =3D dma_alloc_wc(dmaengine_get_dma_device(priv->dma_chan),
> +				    LEDS_TO_BYTES(priv->num_leds),
> +				    &priv->dma_handle, GFP_KERNEL);
> +	if (!priv->buffer)
> +		return -ENOMEM;
> +
> +	irq =3D platform_get_irq(pdev, 0);
> +	if (irq < 0)
> +		return irq;
> +
> +	ret =3D devm_request_irq(dev, irq, sunxi_ledc_irq, 0, dev_name(dev), pr=
iv);
> +	if (ret)
> +		return ret;

Starting here, you can get interrupts. I couldn't spot anything wrong in
the handler, but would that cause any trouble if an interrupt was coming
right here?

> +	ret =3D sunxi_ledc_resume(dev);
> +	if (ret)
> +		return ret;

It's not clear to me what is done here. I assume from the rest of the
driver that you want to use runtime_pm, but it's never enabled for that
driver and the active count will be off here

Maxime

--lig3fkhpokomm4zi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYTH6tgAKCRDj7w1vZxhR
xXt1AP9RfaApt6ZYh65TJZAmWV4D3FTjZol7oXVElRecFeS8tAD8COhxvE5UWdGw
dB3JcAOz3aBIhemNs4VwilscNCrSsg0=
=xApB
-----END PGP SIGNATURE-----

--lig3fkhpokomm4zi--
