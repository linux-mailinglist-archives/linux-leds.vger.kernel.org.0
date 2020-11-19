Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C36B82B9DE0
	for <lists+linux-leds@lfdr.de>; Thu, 19 Nov 2020 23:56:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726260AbgKSW4E (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 19 Nov 2020 17:56:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726234AbgKSW4E (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 19 Nov 2020 17:56:04 -0500
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12158C0613CF;
        Thu, 19 Nov 2020 14:56:04 -0800 (PST)
Received: by mail-ed1-x541.google.com with SMTP id cq7so7580067edb.4;
        Thu, 19 Nov 2020 14:56:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=5eqjYwEZ98jSZ4sIfy98oOLOZL2ZZaBhBxuzzcS6ds4=;
        b=RVFgh01TuNnGRg9e1I2TSwvc9mWqYjyGdBh8ZZRJa+fO5GhbYu6Rz+IjmSJ8dzpXET
         NMqrkFs1jKFR15yDSQj6CvOwtZSv3yFwCKngMxkQ95OKiJxW0j6flYtxeoVSTZnsAgKA
         uoS5tIdR9OtPHOpTUdWL95O2snY/RYhEseIxlcll2CatQkU/caDVn/2LTFBgGsDn42gf
         QbmorFCYPuw4MTtx4iErHB18im3R4tNzDm7ayVqxoPCLogh3iazE04OVMtsvEn1deXiM
         sK4mDJc3IbjqSh/SRZVIv3Pc6T1I6N/IGLKYbZttlh0xAhcuW8Xo1g7vsiWeW0l3iByg
         iizQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=5eqjYwEZ98jSZ4sIfy98oOLOZL2ZZaBhBxuzzcS6ds4=;
        b=oCwjwp2LNXluKG+q3Ns2MXcP1Yu2z3kQWp7Z7TFDgo9eGAYSEhHeV1cmSdzhUtumpl
         ytBDvGD+x6w0k2ujgUvQ6Xzl0pqyzF5W+AWaQgC4E3y1p6ciYSiihfQln75LowjxXPTc
         2ce6xg8v8fnwDFaztWI/58k72p6h31MUUEyzvkbbVJgHTG8VieFvQXPgMmn52Bt97n5H
         9Ooj0zkENVJo/KqOPnV3kQt13EbLN2nUc8mLQqqoZJtkqLY8YHkD+lw62+5AdpUM3icN
         IQqy9F/qH97gjX57xi7SmEzuAAWSJOYSxDp9WTKPoUUYR1wU4cj6uLWCJ04MBP/xVJHE
         Wo4A==
X-Gm-Message-State: AOAM533Ys26//HjqrNGuIpM8EAZiH+SAQE+Z7tNEEhLmVXzWQk6SybJF
        WG59rlFVJMHZYBY2zz/qoLw=
X-Google-Smtp-Source: ABdhPJzLlYaF17/SdQJKv+opOtZ+2ug5eJVRXwbx+0bRly313igL8YqWJ3fZnN2DxuIpDu9d61FItA==
X-Received: by 2002:aa7:c508:: with SMTP id o8mr33219975edq.339.1605826562782;
        Thu, 19 Nov 2020 14:56:02 -0800 (PST)
Received: from ?IPv6:2a01:110f:b59:fd00:5807:584b:19c8:e7be? ([2a01:110f:b59:fd00:5807:584b:19c8:e7be])
        by smtp.gmail.com with ESMTPSA id w7sm431066ejz.43.2020.11.19.14.56.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2020 14:56:02 -0800 (PST)
Subject: Re: [PATCH v7 5/5] leds: mt6360: Add LED driver for MT6360
To:     Gene Chen <gene.chen.richtek@gmail.com>, pavel@ucw.cz,
        robh+dt@kernel.org, matthias.bgg@gmail.com
Cc:     dmurphy@ti.com, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        gene_chen@richtek.com, Wilma.Wu@mediatek.com,
        shufan_lee@richtek.com, cy_huang@richtek.com,
        benjamin.chao@mediatek.com
References: <1605696462-391-1-git-send-email-gene.chen.richtek@gmail.com>
 <1605696462-391-6-git-send-email-gene.chen.richtek@gmail.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <f36fbe3a-1857-081a-a9c8-9ddf9769298c@gmail.com>
Date:   Thu, 19 Nov 2020 23:55:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <1605696462-391-6-git-send-email-gene.chen.richtek@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Gene,

On 11/18/20 11:47 AM, Gene Chen wrote:
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
>   drivers/leds/leds-mt6360.c | 808 +++++++++++++++++++++++++++++++++++++++++++++
>   3 files changed, 822 insertions(+)
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
> --- a/drivers/leds/Makefile
> +++ b/drivers/leds/Makefile
> @@ -66,6 +66,7 @@ obj-$(CONFIG_LEDS_MIKROTIK_RB532)	+= leds-rb532.o
>   obj-$(CONFIG_LEDS_MLXCPLD)		+= leds-mlxcpld.o
>   obj-$(CONFIG_LEDS_MLXREG)		+= leds-mlxreg.o
>   obj-$(CONFIG_LEDS_MT6323)		+= leds-mt6323.o
> +obj-$(CONFIG_LEDS_MT6360)		+= leds-mt6360.o
>   obj-$(CONFIG_LEDS_NET48XX)		+= leds-net48xx.o
>   obj-$(CONFIG_LEDS_NETXBIG)		+= leds-netxbig.o
>   obj-$(CONFIG_LEDS_NIC78BX)		+= leds-nic78bx.o
> diff --git a/drivers/leds/leds-mt6360.c b/drivers/leds/leds-mt6360.c
> new file mode 100644
> index 0000000..8432901
> --- /dev/null
> +++ b/drivers/leds/leds-mt6360.c
> @@ -0,0 +1,808 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +
[...]
> +static int mt6360_fault_get(struct led_classdev_flash *fl_cdev, u32 *fault)
> +{
> +	struct mt6360_led *led = container_of(fl_cdev, struct mt6360_led, flash);
> +	struct mt6360_priv *priv = led->priv;
> +	u16 fled_stat;
> +	unsigned int chg_stat, strobe_timeout_mask, fled_short_mask;
> +	u32 rfault = 0;
> +	int ret;

You need mutex here as well because you're making two readouts and
you have to assure atomicity of this operation.

> +	ret = regmap_read(priv->regmap, MT6360_REG_CHGSTAT2, &chg_stat);
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_raw_read(priv->regmap, MT6360_REG_FLEDSTAT1, &fled_stat, sizeof(fled_stat));
> +	if (ret)
> +		return ret;
> +
> +	if (led->led_no == MT6360_LED_FLASH1) {
> +		strobe_timeout_mask = MT6360_FLED1STRBTO_MASK;
> +		fled_short_mask = MT6360_FLED1SHORT_MASK;
> +	} else {
> +		strobe_timeout_mask = MT6360_FLED2STRBTO_MASK;
> +		fled_short_mask = MT6360_FLED2SHORT_MASK;
> +	}
> +
> +	if (chg_stat & MT6360_FLEDCHGVINOVP_MASK)
> +		rfault |= LED_FAULT_INPUT_VOLTAGE;
> +
> +	if (fled_stat & strobe_timeout_mask)
> +		rfault |= LED_FAULT_TIMEOUT;
> +
> +	if (fled_stat & fled_short_mask)
> +		rfault |= LED_FAULT_SHORT_CIRCUIT;
> +
> +	if (fled_stat & MT6360_FLEDLVF_MASK)
> +		rfault |= LED_FAULT_UNDER_VOLTAGE;
> +
> +	*fault = rfault;
> +	return 0;
> +}
> +
[...]

-- 
Best regards,
Jacek Anaszewski
