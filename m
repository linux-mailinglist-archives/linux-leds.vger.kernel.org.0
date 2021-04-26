Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 86B1B36B179
	for <lists+linux-leds@lfdr.de>; Mon, 26 Apr 2021 12:20:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232253AbhDZKUl (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 26 Apr 2021 06:20:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232561AbhDZKUl (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 26 Apr 2021 06:20:41 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B31FAC061574
        for <linux-leds@vger.kernel.org>; Mon, 26 Apr 2021 03:19:59 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id 82-20020a1c01550000b0290142562ff7c9so680742wmb.3
        for <linux-leds@vger.kernel.org>; Mon, 26 Apr 2021 03:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=iFNGnoccywIgatYBeD1GhNDThjEToKa6gWFZ6zkjB4c=;
        b=Gicbg+ykTX4/QrlruuAgXzAyAyMdWZGFHp7aZBC0cGosdTjK39mLDafu24GZyg8gHM
         ZE4rpuJnIB34J73kEulYmMfskZMvwbn2T0tmy6SMFH+UX8yAU3rtc1tttix32baw3aQ/
         cwjCeDR42ww5KS7BIz8Pt9mjQIl0x8u5r0hN7simghRzoUU1BXYU29Z3L30dSy8Adf1C
         LvmOUX+RNyEQhhgAZ4YA4P2w3SOf1e9yGswiBQ0SoFlyC0Egiw38sxsDCmIaiabK8Avc
         /1SWnEhi6ZziBbGnoZnvz8sZBWza5ORKJdYfEnB5T8g5qU0XJuRMFnN7yGrEam9Ib7VH
         B9Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=iFNGnoccywIgatYBeD1GhNDThjEToKa6gWFZ6zkjB4c=;
        b=h2h+Pw6PIPwGiww6eYKduvB2HdIgEPM1HetePpmhXwG9Leq3U5F/DAG3JSbrU/rsvm
         uQ9aj9hLqMEmU2KkZj1j91yN2S/4ZnmBoURJMTWwyOIPLBnXtZBKVE9xuyTzYamKdlfM
         cFUf9/Yg3tBktSiC0RkPa043msn6waQaKULLa2oJhsu59sA1jfakpi5silweIO9OEM1g
         i8fXLNrrP29EOOHxrDY6bAJNo9z/Cr3cgUvmhsmX8Szq6pHG7KQKqbecw6RAEScBWH5A
         QKv8cbECogA4Kb4qcoLRK9u7ZpOdXR1SEwRtoQ6sPS4yHdqqDMT5P3A0lm/aazOg4gEM
         Rk1g==
X-Gm-Message-State: AOAM532TB2jL8jHydL99efG7KxAnRaKpRIgGQ0GXfr3jxigH1T6UK8Aq
        sHKMWw5griUBfJkfxbvFwhsMPg==
X-Google-Smtp-Source: ABdhPJxs22GjYtguzq5DAoJ2TnwaEFFMNiyq+mpe1gpKAQwmZbNFR2tON1juASiU/9HPrUUhuJ7UxA==
X-Received: by 2002:a05:600c:4f8b:: with SMTP id n11mr12061667wmq.136.1619432398334;
        Mon, 26 Apr 2021 03:19:58 -0700 (PDT)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net. [80.7.220.175])
        by smtp.gmail.com with ESMTPSA id a9sm5158799wrw.26.2021.04.26.03.19.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Apr 2021 03:19:57 -0700 (PDT)
Date:   Mon, 26 Apr 2021 11:19:55 +0100
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     cy_huang <u0084500@gmail.com>
Cc:     lee.jones@linaro.org, lgirdwood@gmail.com, broonie@kernel.org,
        jingoohan1@gmail.com, b.zolnierkie@samsung.com, pavel@ucw.cz,
        robh+dt@kernel.org, dri-devel@lists.freedesktop.org,
        linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        cy_huang@richtek.com
Subject: Re: [RESEND PATCH v6 4/4] backlight: rt4831: Adds support for
 Richtek RT4831 backlight
Message-ID: <20210426101955.uvuzzsiig27xyuxc@maple.lan>
References: <1619421491-31494-1-git-send-email-u0084500@gmail.com>
 <1619421491-31494-4-git-send-email-u0084500@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1619421491-31494-4-git-send-email-u0084500@gmail.com>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Mon, Apr 26, 2021 at 03:18:11PM +0800, cy_huang wrote:
> From: ChiYuan Huang <cy_huang@richtek.com>
> 
> Adds support for Richtek RT4831 backlight.
> 
> Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
> Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
> ---
> Resend this v6 patch series to loop devicetree reviewers.
> 
> For next, if the typo in Kconfig 'common' to 'commonly' can be added the below line
> Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
> ---

This isn't the best way to handle feedback from multiple maintainers.

It is great to see you are keeping track of feedback. However it doesn't
make sense to RESEND an old patchset and acknowledge that you haven't
fixed a typo yet.

It would be better to fix the typo and to resend a v7.


Daniel.


>  drivers/video/backlight/Kconfig            |   8 ++
>  drivers/video/backlight/Makefile           |   1 +
>  drivers/video/backlight/rt4831-backlight.c | 203 +++++++++++++++++++++++++++++
>  3 files changed, 212 insertions(+)
>  create mode 100644 drivers/video/backlight/rt4831-backlight.c
> 
> diff --git a/drivers/video/backlight/Kconfig b/drivers/video/backlight/Kconfig
> index d83c87b..de96441 100644
> --- a/drivers/video/backlight/Kconfig
> +++ b/drivers/video/backlight/Kconfig
> @@ -289,6 +289,14 @@ config BACKLIGHT_QCOM_WLED
>  	  If you have the Qualcomm PMIC, say Y to enable a driver for the
>  	  WLED block. Currently it supports PM8941 and PMI8998.
>  
> +config BACKLIGHT_RT4831
> +	tristate "Richtek RT4831 Backlight Driver"
> +	depends on MFD_RT4831
> +	help
> +	  This enables support for Richtek RT4831 Backlight driver.
> +	  It's common used to drive the display WLED. There're four channels
> +	  inisde, and each channel can provide up to 30mA current.
> +
>  config BACKLIGHT_SAHARA
>  	tristate "Tabletkiosk Sahara Touch-iT Backlight Driver"
>  	depends on X86
> diff --git a/drivers/video/backlight/Makefile b/drivers/video/backlight/Makefile
> index 685f3f1..cae2c83 100644
> --- a/drivers/video/backlight/Makefile
> +++ b/drivers/video/backlight/Makefile
> @@ -49,6 +49,7 @@ obj-$(CONFIG_BACKLIGHT_PANDORA)		+= pandora_bl.o
>  obj-$(CONFIG_BACKLIGHT_PCF50633)	+= pcf50633-backlight.o
>  obj-$(CONFIG_BACKLIGHT_PWM)		+= pwm_bl.o
>  obj-$(CONFIG_BACKLIGHT_QCOM_WLED)	+= qcom-wled.o
> +obj-$(CONFIG_BACKLIGHT_RT4831)		+= rt4831-backlight.o
>  obj-$(CONFIG_BACKLIGHT_SAHARA)		+= kb3886_bl.o
>  obj-$(CONFIG_BACKLIGHT_SKY81452)	+= sky81452-backlight.o
>  obj-$(CONFIG_BACKLIGHT_TOSA)		+= tosa_bl.o
> diff --git a/drivers/video/backlight/rt4831-backlight.c b/drivers/video/backlight/rt4831-backlight.c
> new file mode 100644
> index 00000000..42155c7
> --- /dev/null
> +++ b/drivers/video/backlight/rt4831-backlight.c
> @@ -0,0 +1,203 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +
> +#include <dt-bindings/leds/rt4831-backlight.h>
> +#include <linux/backlight.h>
> +#include <linux/bitops.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/property.h>
> +#include <linux/regmap.h>
> +
> +#define RT4831_REG_BLCFG	0x02
> +#define RT4831_REG_BLDIML	0x04
> +#define RT4831_REG_ENABLE	0x08
> +
> +#define RT4831_BLMAX_BRIGHTNESS	2048
> +
> +#define RT4831_BLOVP_MASK	GENMASK(7, 5)
> +#define RT4831_BLOVP_SHIFT	5
> +#define RT4831_BLPWMEN_MASK	BIT(0)
> +#define RT4831_BLEN_MASK	BIT(4)
> +#define RT4831_BLCH_MASK	GENMASK(3, 0)
> +#define RT4831_BLDIML_MASK	GENMASK(2, 0)
> +#define RT4831_BLDIMH_MASK	GENMASK(10, 3)
> +#define RT4831_BLDIMH_SHIFT	3
> +
> +struct rt4831_priv {
> +	struct device *dev;
> +	struct regmap *regmap;
> +	struct backlight_device *bl;
> +};
> +
> +static int rt4831_bl_update_status(struct backlight_device *bl_dev)
> +{
> +	struct rt4831_priv *priv = bl_get_data(bl_dev);
> +	int brightness = backlight_get_brightness(bl_dev);
> +	unsigned int enable = brightness ? RT4831_BLEN_MASK : 0;
> +	u8 v[2];
> +	int ret;
> +
> +	if (brightness) {
> +		v[0] = (brightness - 1) & RT4831_BLDIML_MASK;
> +		v[1] = ((brightness - 1) & RT4831_BLDIMH_MASK) >> RT4831_BLDIMH_SHIFT;
> +
> +		ret = regmap_raw_write(priv->regmap, RT4831_REG_BLDIML, v, sizeof(v));
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return regmap_update_bits(priv->regmap, RT4831_REG_ENABLE, RT4831_BLEN_MASK, enable);
> +
> +}
> +
> +static int rt4831_bl_get_brightness(struct backlight_device *bl_dev)
> +{
> +	struct rt4831_priv *priv = bl_get_data(bl_dev);
> +	unsigned int val;
> +	u8 v[2];
> +	int ret;
> +
> +	ret = regmap_read(priv->regmap, RT4831_REG_ENABLE, &val);
> +	if (ret)
> +		return ret;
> +
> +	if (!(val & RT4831_BLEN_MASK))
> +		return 0;
> +
> +	ret = regmap_raw_read(priv->regmap, RT4831_REG_BLDIML, v, sizeof(v));
> +	if (ret)
> +		return ret;
> +
> +	ret = (v[1] << RT4831_BLDIMH_SHIFT) + (v[0] & RT4831_BLDIML_MASK) + 1;
> +
> +	return ret;
> +}
> +
> +static const struct backlight_ops rt4831_bl_ops = {
> +	.options = BL_CORE_SUSPENDRESUME,
> +	.update_status = rt4831_bl_update_status,
> +	.get_brightness = rt4831_bl_get_brightness,
> +};
> +
> +static int rt4831_parse_backlight_properties(struct rt4831_priv *priv,
> +					     struct backlight_properties *bl_props)
> +{
> +	struct device *dev = priv->dev;
> +	u8 propval;
> +	u32 brightness;
> +	unsigned int val = 0;
> +	int ret;
> +
> +	/* common properties */
> +	ret = device_property_read_u32(dev, "max-brightness", &brightness);
> +	if (ret)
> +		brightness = RT4831_BLMAX_BRIGHTNESS;
> +
> +	bl_props->max_brightness = min_t(u32, brightness, RT4831_BLMAX_BRIGHTNESS);
> +
> +	ret = device_property_read_u32(dev, "default-brightness", &brightness);
> +	if (ret)
> +		brightness = bl_props->max_brightness;
> +
> +	bl_props->brightness = min_t(u32, brightness, bl_props->max_brightness);
> +
> +	/* vendor properties */
> +	if (device_property_read_bool(dev, "richtek,pwm-enable"))
> +		val = RT4831_BLPWMEN_MASK;
> +
> +	ret = regmap_update_bits(priv->regmap, RT4831_REG_BLCFG, RT4831_BLPWMEN_MASK, val);
> +	if (ret)
> +		return ret;
> +
> +	ret = device_property_read_u8(dev, "richtek,bled-ovp-sel", &propval);
> +	if (ret)
> +		propval = RT4831_BLOVPLVL_21V;
> +
> +	propval = min_t(u8, propval, RT4831_BLOVPLVL_29V);
> +	ret = regmap_update_bits(priv->regmap, RT4831_REG_BLCFG, RT4831_BLOVP_MASK,
> +				 propval << RT4831_BLOVP_SHIFT);
> +	if (ret)
> +		return ret;
> +
> +	ret = device_property_read_u8(dev, "richtek,channel-use", &propval);
> +	if (ret) {
> +		dev_err(dev, "richtek,channel-use DT property missing\n");
> +		return ret;
> +	}
> +
> +	if (!(propval & RT4831_BLCH_MASK)) {
> +		dev_err(dev, "No channel specified\n");
> +		return -EINVAL;
> +	}
> +
> +	return regmap_update_bits(priv->regmap, RT4831_REG_ENABLE, RT4831_BLCH_MASK, propval);
> +}
> +
> +static int rt4831_bl_probe(struct platform_device *pdev)
> +{
> +	struct rt4831_priv *priv;
> +	struct backlight_properties bl_props = { .type = BACKLIGHT_RAW,
> +						 .scale = BACKLIGHT_SCALE_LINEAR };
> +	int ret;
> +
> +	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	priv->dev = &pdev->dev;
> +
> +	priv->regmap = dev_get_regmap(pdev->dev.parent, NULL);
> +	if (!priv->regmap) {
> +		dev_err(&pdev->dev, "Failed to init regmap\n");
> +		return -ENODEV;
> +	}
> +
> +	ret = rt4831_parse_backlight_properties(priv, &bl_props);
> +	if (ret) {
> +		dev_err(&pdev->dev, "Failed to parse backlight properties\n");
> +		return ret;
> +	}
> +
> +	priv->bl = devm_backlight_device_register(&pdev->dev, pdev->name, &pdev->dev, priv,
> +						  &rt4831_bl_ops, &bl_props);
> +	if (IS_ERR(priv->bl)) {
> +		dev_err(&pdev->dev, "Failed to register backlight\n");
> +		return PTR_ERR(priv->bl);
> +	}
> +
> +	backlight_update_status(priv->bl);
> +	platform_set_drvdata(pdev, priv);
> +
> +	return 0;
> +}
> +
> +static int rt4831_bl_remove(struct platform_device *pdev)
> +{
> +	struct rt4831_priv *priv = platform_get_drvdata(pdev);
> +	struct backlight_device *bl_dev = priv->bl;
> +
> +	bl_dev->props.brightness = 0;
> +	backlight_update_status(priv->bl);
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id __maybe_unused rt4831_bl_of_match[] = {
> +	{ .compatible = "richtek,rt4831-backlight", },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, rt4831_bl_of_match);
> +
> +static struct platform_driver rt4831_bl_driver = {
> +	.driver = {
> +		.name = "rt4831-backlight",
> +		.of_match_table = rt4831_bl_of_match,
> +	},
> +	.probe = rt4831_bl_probe,
> +	.remove = rt4831_bl_remove,
> +};
> +module_platform_driver(rt4831_bl_driver);
> +
> +MODULE_AUTHOR("ChiYuan Huang <cy_huang@richtek.com>");
> +MODULE_LICENSE("GPL v2");
> -- 
> 2.7.4
> 
