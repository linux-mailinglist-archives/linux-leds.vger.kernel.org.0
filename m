Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EAEB42CDFC5
	for <lists+linux-leds@lfdr.de>; Thu,  3 Dec 2020 21:36:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727154AbgLCUg3 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 3 Dec 2020 15:36:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725885AbgLCUg3 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 3 Dec 2020 15:36:29 -0500
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9ED3BC061A51;
        Thu,  3 Dec 2020 12:35:48 -0800 (PST)
Received: by mail-wm1-x341.google.com with SMTP id h21so5217363wmb.2;
        Thu, 03 Dec 2020 12:35:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=dU03bFDd4EmhKp1sv3SYB6+nzXscAxpruUkgadQmNp0=;
        b=q8vJDoMOBpn2HIKfVGsDOSyVwC0UYIzdzgnkPMJFDXj+8tP5EZDjLpcWSlXQkXtQmk
         SzFXo1GGrw0m3ZuYXkv32hT6MoO/YXqFH8/G3i2A40JyYkewF4fAeM7DPBN01v7QM+0c
         RxkLrNKYyGzx+UVRiX66+yzmLIUns247t1bSM/oZ+1k8smaBnYvFDMMuPb1GJ0fL5Qr6
         7FqqHjLuy4b0AQS+TAvilptPGoS4ktN+c1+BYBzwxv3RQiAO6WUraz3HScAGCpRxJ0F7
         r7odGOqddLN5fPNlWCQPRZwwkejZyPe8WeZ2HL47mwQhjEtOMu2hfMEVJ/iVoCj2eS3O
         MZHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=dU03bFDd4EmhKp1sv3SYB6+nzXscAxpruUkgadQmNp0=;
        b=uSTxu6fdNq3GEs2haeaDPLMuAWRNIldTqCzGVktoYKYWZUoB0cCfJcKw/CoW1mcU5p
         CSDK1Q824h36i19/jt8Z3QJ5zPn0YwZJqqdKsY+y4YUSpeDjFlS4+/ZeC+KoZYGNt8ht
         Il7mjwEA8WsNs2fyyxkxiW7PA8LS9XsJyZ9gBk0UHSsuLothy542BE/Vo6BIzptY/NkK
         rDhpNP072mFAnZ/igAliUN5iLf9WhDK1aIGIxhDlDrV4I1J6dEPyyNDNJ5ZLLcUTOoJc
         4VjhXjfIYCZjXwHlNIZBMnG8YD1Q7H78QICfG7UtD4q8VK1W2fzOUvggFtHE1/FB75Kt
         4cIg==
X-Gm-Message-State: AOAM530GOrp08xbe7pOVlrwjQbk44O2J5uHbQyakKOObJ5eE/yTKNEY4
        /cQHYeXZXVlTXA5NAddnhms=
X-Google-Smtp-Source: ABdhPJyd5R/8V40zUYtMb2LVtX/LVzt8JRzhXGnsS/an180Dgt2+kfXQjFtGFVnD+PMVGl6+bAMlZA==
X-Received: by 2002:a1c:5402:: with SMTP id i2mr675598wmb.12.1607027747396;
        Thu, 03 Dec 2020 12:35:47 -0800 (PST)
Received: from ?IPv6:2a01:110f:b59:fd00:2969:dca1:ffae:a9ff? ([2a01:110f:b59:fd00:2969:dca1:ffae:a9ff])
        by smtp.gmail.com with ESMTPSA id z22sm533874wml.1.2020.12.03.12.35.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Dec 2020 12:35:46 -0800 (PST)
Subject: Re: [PATCH v11 5/5] leds: mt6360: Add LED driver for MT6360
To:     Gene Chen <gene.chen.richtek@gmail.com>, pavel@ucw.cz,
        robh+dt@kernel.org, matthias.bgg@gmail.com
Cc:     dmurphy@ti.com, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        gene_chen@richtek.com, Wilma.Wu@mediatek.com,
        shufan_lee@richtek.com, cy_huang@richtek.com,
        benjamin.chao@mediatek.com
References: <1606906011-25633-1-git-send-email-gene.chen.richtek@gmail.com>
 <1606906011-25633-6-git-send-email-gene.chen.richtek@gmail.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <058f0770-eae6-6a53-ec9f-dc69fdca86ac@gmail.com>
Date:   Thu, 3 Dec 2020 21:35:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <1606906011-25633-6-git-send-email-gene.chen.richtek@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Gene,

On 12/2/20 11:46 AM, Gene Chen wrote:
> From: Gene Chen <gene_chen@richtek.com>
> 
> Add MT6360 LED driver include 2-channel Flash LED with torch/strobe mode,
> 3-channel RGB LED support Register/Flash/Breath Mode, and 1-channel for
> moonlight LED.
> 
> Signed-off-by: Gene Chen <gene_chen@richtek.com>
> ---
>   drivers/leds/Kconfig       |  13 +
>   drivers/leds/Makefile      |   1 +
>   drivers/leds/leds-mt6360.c | 827 +++++++++++++++++++++++++++++++++++++++++++++
>   3 files changed, 841 insertions(+)
>   create mode 100644 drivers/leds/leds-mt6360.c
> 
> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> index 1c181df..4f533bc 100644
> --- a/drivers/leds/Kconfig
> +++ b/drivers/leds/Kconfig
> @@ -271,6 +271,19 @@ config LEDS_MT6323
>   	  This option enables support for on-chip LED drivers found on
>   	  Mediatek MT6323 PMIC.
>   
> +config LEDS_MT6360
> +	tristate "LED Support for Mediatek MT6360 PMIC"
> +	depends on LEDS_CLASS && OF
> +	depends on LEDS_CLASS_FLASH || !LEDS_CLASS_FLASH
> +	depends on LEDS_CLASS_MULTICOLOR || !LEDS_CLASS_MULTICOLOR
> +	depends on V4L2_FLASH_LED_CLASS || !V4L2_FLASH_LED_CLASS
> +	depends on MFD_MT6360
> +	help
> +	  This option enables support for dual Flash LED drivers found on
> +	  Mediatek MT6360 PMIC.
> +	  Independent current sources supply for each flash LED support torch
> +	  and strobe mode.
> +
>   config LEDS_S3C24XX
>   	tristate "LED Support for Samsung S3C24XX GPIO LEDs"
>   	depends on LEDS_CLASS
> diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
> index c2c7d7a..5596427 100644
[...]
> +static int mt6360_led_probe(struct platform_device *pdev)
> +{
> +	struct mt6360_priv *priv;
> +	struct fwnode_handle *child;
> +	size_t count;
> +	int i = 0, ret;
> +
> +	count = device_get_child_node_count(&pdev->dev);
> +	if (!count || count > MT6360_MAX_LEDS) {
> +		dev_err(&pdev->dev, "No child node or node count over max led number %lu\n", count);
> +		return -EINVAL;
> +	}
> +
> +	priv = devm_kzalloc(&pdev->dev, struct_size(priv, leds, count), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	priv->leds_count = count;
> +	priv->dev = &pdev->dev;
> +	mutex_init(&priv->lock);
> +
> +	priv->regmap = dev_get_regmap(pdev->dev.parent, NULL);
> +	if (!priv->regmap) {
> +		dev_err(&pdev->dev, "Failed to get parent regmap\n");
> +		return -ENODEV;
> +	}
> +
> +	device_for_each_child_node(&pdev->dev, child) {
> +		struct mt6360_led *led = priv->leds + i;
> +		struct led_init_data init_data = { .fwnode = child, };
> +		u32 reg, led_color;
> +
> +		ret = fwnode_property_read_u32(child, "color", &led_color);
> +		if (ret)
> +			goto out_flash_release;
> +
> +		if (led_color == LED_COLOR_ID_RGB || led_color == LED_COLOR_ID_MULTI)
> +			reg = MT6360_VIRTUAL_MULTICOLOR;
> +		else {
> +			ret = fwnode_property_read_u32(child, "reg", &reg);
> +			if (ret)
> +				goto out_flash_release;
> +
> +			if (reg >= MT6360_MAX_LEDS) {
> +				ret = -EINVAL;
> +				goto out_flash_release;
> +			}
> +		}
> +
> +		if (priv->leds_active & BIT(reg)) {
> +			ret = -EINVAL;
> +			goto out_flash_release;
> +		}
> +		priv->leds_active |= BIT(reg);
> +
> +		led->led_no = reg;
> +		led->priv = priv;
> +
> +		ret = mt6360_init_common_properties(led, &init_data);
> +		if (ret)
> +			goto out_flash_release;
> +
> +		if (reg == MT6360_VIRTUAL_MULTICOLOR ||
> +			(reg >= MT6360_LED_ISNK1 && reg <= MT6360_LED_ISNKML))
> +			ret = mt6360_init_isnk_properties(led, &init_data);
> +		else
> +			ret = mt6360_init_flash_properties(led, &init_data);
> +
> +		if (ret)
> +			goto out_flash_release;
> +
> +		ret = mt6360_led_register(&pdev->dev, led, &init_data);
> +		if (ret)
> +			goto out_flash_release;
> +
> +		i++;
> +	}
> +
> +	platform_set_drvdata(pdev, priv);
> +	return 0;
> +
> +out_flash_release:
> +	mt6360_v4l2_flash_release(priv);

The need for releasing v4l2_flash devices here and not other LEDs is not
obvious at first glance. Of course this is due to the fact that
LED/flash registration functions have devm support but v4l2_flash
doesn't. It would be good to cover it at some point.

If you added that support to
drivers/media/v4l2-core/v4l2-flash-led-class.c then you could
simplify the code in this driver quite nicely.

But it's up to you.

That being said:

Acked-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>

-- 
Best regards,
Jacek Anaszewski
