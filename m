Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6059B2B7187
	for <lists+linux-leds@lfdr.de>; Tue, 17 Nov 2020 23:26:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729075AbgKQWZG (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 17 Nov 2020 17:25:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726302AbgKQWZF (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 17 Nov 2020 17:25:05 -0500
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27602C0613CF;
        Tue, 17 Nov 2020 14:25:05 -0800 (PST)
Received: by mail-wm1-x342.google.com with SMTP id s13so196787wmh.4;
        Tue, 17 Nov 2020 14:25:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=NB/7OIS9g6EqA/NvqYVOiDze3yyFIvEFD0YUY0O+H4M=;
        b=cGVtyMrLwjjIBKkBrpNoyI+Wp/GU6llW0YyHeruFNJLTw8KPC7JtBuBCD7MkGn/xLF
         pyys/xXc5AqBl+2Z02wKCpwVr+8UA4lSi0LrLtX+taF1Yc7hP/4noDUDfjKcdgL7WnZT
         V97aXWWU2Xns5sRdAWq2qm4LumWKrwgcZNamLA7No/I0qgn2eP/PUOGwbSu+5EGq+u/o
         JcvzkVlgeauxIDkBv4F2/Qt6P18o9/HI6fqlwVL++m0VJMU/1jHy6ySxqEt56FFP11VX
         NTtezZwFzypYBZqYm1F+/sFe1u9E6m0+57SSSjlTCNI0t9+LG1z6GMgaCWU8zSo1N0tQ
         oSWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=NB/7OIS9g6EqA/NvqYVOiDze3yyFIvEFD0YUY0O+H4M=;
        b=rETIvLev2MCmlTAPj0yijJAJrbj0M6D2fidZaQdyIAQUye9MlwAcwXSUSxZ3UTlcUi
         VfREssWWQHYU6vYs7cqZQRXey+7/S1DPOBDlXu3qULn7ngXZy0P3PmzENoKYZMYxVo/S
         1dhuDW6pc0WZkacOP4RBqHA0SwlmctJXOvNmpX9DkXCCuPGV2pU+029sSZbaCcmw3wm/
         mQhJbYAF7Pwuf8w7Z9renIg1lv0bufnFtkoJu4BICCJeS9ClHYVISVA1JlW9wA6ysYJH
         k6LfMkMAJXrzxZrBZjaN3feb3l9AWGW4utGyEShrv0hwf1DAH2OjmeTSnhoAQKV93wp0
         7beg==
X-Gm-Message-State: AOAM531vYQKNZAcjAL6XJWrTMDCQNHMxUzzmPJ6r2g7nQkWUAJ31J1TB
        zjKojvtgd6tkE4jAHIGrFis=
X-Google-Smtp-Source: ABdhPJxZQtXLLvGTZiiiHyRLkQQArom2ehfC2v0SQVriSX26Z2pfSkfUeWLIZgGEYzAJ4khWZ2w6Ig==
X-Received: by 2002:a1c:f20d:: with SMTP id s13mr1260877wmc.156.1605651903730;
        Tue, 17 Nov 2020 14:25:03 -0800 (PST)
Received: from ?IPv6:2a01:110f:b59:fd00:3cf0:d5c8:abb1:7fc9? ([2a01:110f:b59:fd00:3cf0:d5c8:abb1:7fc9])
        by smtp.gmail.com with ESMTPSA id c62sm196190wme.22.2020.11.17.14.25.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2020 14:25:03 -0800 (PST)
Subject: Re: [PATCH v6 2/2] leds: mt6360: Add LED driver for MT6360
To:     Gene Chen <gene.chen.richtek@gmail.com>, pavel@ucw.cz,
        robh+dt@kernel.org, matthias.bgg@gmail.com
Cc:     dmurphy@ti.com, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        gene_chen@richtek.com, Wilma.Wu@mediatek.com,
        shufan_lee@richtek.com, cy_huang@richtek.com,
        benjamin.chao@mediatek.com
References: <1605610537-18085-1-git-send-email-gene.chen.richtek@gmail.com>
 <1605610537-18085-3-git-send-email-gene.chen.richtek@gmail.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <293d7e99-adf8-941a-7456-7d83adc5f27f@gmail.com>
Date:   Tue, 17 Nov 2020 23:25:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <1605610537-18085-3-git-send-email-gene.chen.richtek@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Gene,

On 11/17/20 11:55 AM, Gene Chen wrote:
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
>   drivers/leds/leds-mt6360.c | 817 +++++++++++++++++++++++++++++++++++++++++++++
>   3 files changed, 831 insertions(+)
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
> index 0000000..e3a30bd
> --- /dev/null
> +++ b/drivers/leds/leds-mt6360.c
> @@ -0,0 +1,817 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +
> +#include <linux/bitops.h>
> +#include <linux/delay.h>
> +#include <linux/init.h>
> +#include <linux/interrupt.h>
> +#include <linux/kernel.h>
> +#include <linux/led-class-flash.h>
> +#include <linux/led-class-multicolor.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/platform_device.h>
> +#include <linux/property.h>
> +#include <linux/regmap.h>
> +#include <media/v4l2-flash-led-class.h>
> +
> +enum {
> +	MT6360_LED_ISNK1 = 0,
> +	MT6360_LED_ISNK2,
> +	MT6360_LED_ISNK3,
> +	MT6360_LED_ISNKML,
> +	MT6360_LED_FLASH1,
> +	MT6360_LED_FLASH2,
> +	MT6360_LED_MULTICOLOR,
> +	MT6360_MAX_LEDS = MT6360_LED_MULTICOLOR
> +};
> +
> +#define MT6360_REG_RGBEN		0x380
> +#define MT6360_REG_ISNK(_led_no)	(0x381 + (_led_no))
> +#define MT6360_ISNK_ENMASK(_led_no)	BIT(7 - (_led_no))
> +#define MT6360_ISNK_MASK		GENMASK(4, 0)
> +#define MT6360_CHRINDSEL_MASK		BIT(3)
> +
> +#define MULTICOLOR_NUM_CHANNELS		3
> +
> +#define MT6360_REG_FLEDEN		0x37E
> +#define MT6360_REG_STRBTO		0x373
> +#define MT6360_REG_FLEDBASE(_id)	(0x372 + 4 * (_id - MT6360_LED_FLASH1))
> +#define MT6360_REG_FLEDISTRB(_id)	(MT6360_REG_FLEDBASE(_id) + 2)
> +#define MT6360_REG_FLEDITOR(_id)	(MT6360_REG_FLEDBASE(_id) + 3)
> +#define MT6360_REG_CHGSTAT2		0x3E1
> +#define MT6360_REG_FLEDSTAT1		0x3E9
> +#define MT6360_ITORCH_MASK		GENMASK(4, 0)
> +#define MT6360_ISTROBE_MASK		GENMASK(6, 0)
> +#define MT6360_STRBTO_MASK		GENMASK(6, 0)
> +#define MT6360_TORCHEN_MASK		BIT(3)
> +#define MT6360_STROBEN_MASK		BIT(2)
> +#define MT6360_FLCSEN_MASK(_id)		BIT(MT6360_LED_FLASH2 - _id)
> +#define MT6360_FLEDCHGVINOVP_MASK	BIT(3)
> +#define MT6360_FLED1STRBTO_MASK		BIT(11)
> +#define MT6360_FLED2STRBTO_MASK		BIT(10)
> +#define MT6360_FLED1STRB_MASK		BIT(9)
> +#define MT6360_FLED2STRB_MASK		BIT(8)
> +#define MT6360_FLED1SHORT_MASK		BIT(7)
> +#define MT6360_FLED2SHORT_MASK		BIT(6)
> +#define MT6360_FLEDLVF_MASK		BIT(3)
> +
> +#define MT6360_ISNKRGB_STEPUA		2000
> +#define MT6360_ISNKRGB_MAXUA		24000
> +#define MT6360_ISNKML_STEPUA		5000
> +#define MT6360_ISNKML_MAXUA		150000
> +
> +#define MT6360_ITORCH_MINUA		25000
> +#define MT6360_ITORCH_STEPUA		12500
> +#define MT6360_ITORCH_MAXUA		400000
> +#define MT6360_ISTRB_MINUA		50000
> +#define MT6360_ISTRB_STEPUA		12500
> +#define MT6360_ISTRB_MAXUA		1500000
> +#define MT6360_STRBTO_MINUS		64000
> +#define MT6360_STRBTO_STEPUS		32000
> +#define MT6360_STRBTO_MAXUS		2432000
> +
> +#define STATE_OFF			0
> +#define STATE_KEEP			1
> +#define STATE_ON			2
> +
> +struct mt6360_led {
> +	union {
> +		struct led_classdev isnk;
> +		struct led_classdev_mc mc;
> +		struct led_classdev_flash flash;
> +	};
> +	struct v4l2_flash *v4l2_flash;
> +	struct mt6360_priv *priv;
> +	u32 led_no;
> +	u32 default_state;
> +};
> +
> +struct mt6360_priv {
> +	struct device *dev;
> +	struct regmap *regmap;
> +	struct mutex lock;
> +	unsigned int fled_strobe_used;
> +	unsigned int fled_torch_used;
> +	unsigned int leds_active;
> +	unsigned int leds_count;
> +	struct mt6360_led leds[];
> +};
> +
> +static int mt6360_mc_brightness_set(struct led_classdev *lcdev, enum led_brightness level)
> +{
> +	struct led_classdev_mc *mccdev = lcdev_to_mccdev(lcdev);
> +	struct mt6360_led *led = container_of(mccdev, struct mt6360_led, mc);
> +	struct mt6360_priv *priv = led->priv;
> +	u32 real_bright, enable_mask = 0, enable = 0;
> +	int i, ret;
> +
> +	mutex_lock(&priv->lock);
> +
> +	led_mc_calc_color_components(mccdev, level);
> +
> +	for (i = 0; i < mccdev->num_colors; i++) {
> +		struct mc_subled *subled = mccdev->subled_info + i;
> +
> +		real_bright = min(lcdev->max_brightness, subled->brightness);
> +		ret = regmap_update_bits(priv->regmap, MT6360_REG_ISNK(i), MT6360_ISNK_MASK,
> +					 real_bright);
> +		if (ret)
> +			goto out;
> +
> +		enable_mask |= MT6360_ISNK_ENMASK(subled->channel);
> +		if (real_bright)
> +			enable |= MT6360_ISNK_ENMASK(subled->channel);
> +	}
> +
> +	ret = regmap_update_bits(priv->regmap, MT6360_REG_RGBEN, enable_mask, enable);
> +
> +out:
> +	mutex_unlock(&priv->lock);
> +	return ret;
> +}
> +
> +static int mt6360_isnk_brightness_set(struct led_classdev *lcdev, enum led_brightness level)
> +{
> +	struct mt6360_led *led = container_of(lcdev, struct mt6360_led, isnk);
> +	struct mt6360_priv *priv = led->priv;
> +	u32 enable_mask = MT6360_ISNK_ENMASK(led->led_no);
> +	u32 val = level ? MT6360_ISNK_ENMASK(led->led_no) : 0;
> +	int ret;
> +
> +	mutex_lock(&priv->lock);
> +
> +	ret = regmap_update_bits(priv->regmap, MT6360_REG_ISNK(led->led_no), MT6360_ISNK_MASK,
> +				 level);
> +	if (ret)
> +		goto out;
> +
> +	ret = regmap_update_bits(priv->regmap, MT6360_REG_RGBEN, enable_mask, val);
> +
> +out:
> +	mutex_unlock(&priv->lock);
> +	return ret;
> +}
> +
> +static int mt6360_torch_brightness_set(struct led_classdev *lcdev, enum led_brightness level)
> +{
> +	struct mt6360_led *led = container_of(lcdev, struct mt6360_led, flash.led_cdev);
> +	struct mt6360_priv *priv = led->priv;
> +	u32 enable_mask = MT6360_TORCHEN_MASK | MT6360_FLCSEN_MASK(led->led_no);
> +	u32 val = level ? MT6360_FLCSEN_MASK(led->led_no) : 0;
> +	u32 prev = priv->fled_torch_used, curr;
> +	int ret;
> +
> +	mutex_lock(&priv->lock);
> +
> +	/* Only one set of flash control logic, use the flag to avoid strobe is currently used */
> +	if (priv->fled_strobe_used) {
> +		dev_warn(lcdev->dev, "Please disable strobe first [%d]\n", priv->fled_strobe_used);
> +		ret = -EBUSY;
> +		goto out;
> +	}
> +
> +	if (level)
> +		curr = prev | BIT(led->led_no);
> +	else
> +		curr = prev & ~BIT(led->led_no);
> +
> +	if (curr)
> +		val |= MT6360_TORCHEN_MASK;
> +
> +	if (level) {
> +		ret = regmap_update_bits(priv->regmap, MT6360_REG_FLEDITOR(led->led_no),
> +					 MT6360_ITORCH_MASK, level - 1);
> +		if (ret)
> +			goto out;
> +	}
> +
> +	ret = regmap_update_bits(priv->regmap, MT6360_REG_FLEDEN, enable_mask, val);
> +	if (ret)
> +		goto out;
> +
> +	priv->fled_torch_used = curr;
> +
> +out:
> +	mutex_unlock(&priv->lock);
> +	return ret;
> +}
> +
> +static int mt6360_flash_brightness_set(struct led_classdev_flash *fl_cdev, u32 brightness)
> +{
> +	/*
> +	 * Due to the current spike when turning on flash, let brightness to be kept by framework.
> +	 * This empty function is used to prevent led_classdev_flash register ops check failure.
> +	 */
> +	return 0;
> +}
> +
> +static int _mt6360_flash_brightness_set(struct led_classdev_flash *fl_cdev, u32 brightness)
> +{
> +	struct mt6360_led *led = container_of(fl_cdev, struct mt6360_led, flash);
> +	struct mt6360_priv *priv = led->priv;
> +	struct led_flash_setting *s = &fl_cdev->brightness;
> +	u32 val = (brightness - s->min) / s->step;
> +
> +	return regmap_update_bits(priv->regmap, MT6360_REG_FLEDISTRB(led->led_no),
> +				 MT6360_ISTROBE_MASK, val);
> +}
> +
> +static int mt6360_strobe_set(struct led_classdev_flash *fl_cdev, bool state)
> +{
> +	struct mt6360_led *led = container_of(fl_cdev, struct mt6360_led, flash);
> +	struct mt6360_priv *priv = led->priv;
> +	struct led_classdev *lcdev = &fl_cdev->led_cdev;
> +	struct led_flash_setting *s = &fl_cdev->brightness;
> +	u32 enable_mask = MT6360_STROBEN_MASK | MT6360_FLCSEN_MASK(led->led_no);
> +	u32 val = state ? MT6360_FLCSEN_MASK(led->led_no) : 0;
> +	u32 prev = priv->fled_strobe_used, curr;
> +	int ret;
> +
> +	/* Only one set of flash control logic, use the flag to avoid torch is currently used */
> +	if (priv->fled_torch_used) {
> +		dev_warn(lcdev->dev, "Please disable torch first [0x%x]\n", priv->fled_torch_used);
> +		return -EBUSY;
> +	}
> +
> +	if (state)
> +		curr = prev | BIT(led->led_no);
> +	else
> +		curr = prev & ~BIT(led->led_no);
> +
> +	if (curr)
> +		val |= MT6360_STROBEN_MASK;

You need to use mutex protection consequently in all ops
accessing device registers.

> +	ret = regmap_update_bits(priv->regmap, MT6360_REG_FLEDEN, enable_mask, val);
> +	if (ret) {
> +		dev_err(lcdev->dev, "[%d] control current source %d fail\n", led->led_no, state);
> +		return ret;
> +	}
> +
> +	/*
> +	 * If the flash need to be on, config the flash current ramping up to the setting value
> +	 * Else, always recover back to the minimum one
> +	 */
> +	ret = _mt6360_flash_brightness_set(fl_cdev, state ? s->val : s->min);
> +	if (ret)
> +		return ret;
> +
> +	/* For the flash turn on/off, HW rampping up/down time is 5ms/500us, respectively */
> +	if (!prev && curr)
> +		usleep_range(5000, 6000);
> +	else if (prev && !curr)
> +		udelay(500);
> +
> +	priv->fled_strobe_used = curr;
> +	return 0;
> +}
> +
> +static int mt6360_strobe_get(struct led_classdev_flash *fl_cdev, bool *state)
> +{
> +	struct mt6360_led *led = container_of(fl_cdev, struct mt6360_led, flash);
> +	struct mt6360_priv *priv = led->priv;

Ditto.

> +	*state = !!(priv->fled_strobe_used & BIT(led->led_no));
> +	return 0;
> +}
> +
> +static int mt6360_timeout_set(struct led_classdev_flash *fl_cdev, u32 timeout)
> +{
> +	struct mt6360_led *led = container_of(fl_cdev, struct mt6360_led, flash);
> +	struct mt6360_priv *priv = led->priv;
> +	struct led_flash_setting *s = &fl_cdev->timeout;
> +	u32 val = (timeout - s->min) / s->step;

Ditto.

> +	return regmap_update_bits(priv->regmap, MT6360_REG_STRBTO, MT6360_STRBTO_MASK, val);
> +
> +}
> +
> +static int mt6360_fault_get(struct led_classdev_flash *fl_cdev, u32 *fault)
> +{
> +	struct mt6360_led *led = container_of(fl_cdev, struct mt6360_led, flash);
> +	struct mt6360_priv *priv = led->priv;
> +	u16 fled_stat;
> +	unsigned int chg_stat, strobe_timeout_mask, fled_short_mask;
> +	u32 rfault = 0;
> +	int ret;

Ditto.

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
> +static const struct led_flash_ops mt6360_flash_ops = {
> +	.flash_brightness_set = mt6360_flash_brightness_set,
> +	.strobe_set = mt6360_strobe_set,
> +	.strobe_get = mt6360_strobe_get,
> +	.timeout_set = mt6360_timeout_set,
> +	.fault_get = mt6360_fault_get,
> +};
> +
> +static int mt6360_isnk_init_default_state(struct mt6360_led *led)
> +{
> +	struct mt6360_priv *priv = led->priv;
> +	unsigned int regval;
> +	u32 level;
> +	int ret;
> +
> +	ret = regmap_read(priv->regmap, MT6360_REG_ISNK(led->led_no), &regval);
> +	if (ret)
> +		return ret;
> +	level = regval & MT6360_ISNK_MASK;
> +
> +	ret = regmap_read(priv->regmap, MT6360_REG_RGBEN, &regval);
> +	if (ret)
> +		return ret;
> +
> +	if (!(regval & MT6360_ISNK_ENMASK(led->led_no)))
> +		level = LED_OFF;
> +
> +	switch (led->default_state) {
> +	case STATE_ON:
> +		led->isnk.brightness = led->isnk.max_brightness;
> +		break;
> +	case STATE_KEEP:
> +		led->isnk.brightness = min(level, led->isnk.max_brightness);
> +		break;
> +	default:
> +		led->isnk.brightness = LED_OFF;
> +	}
> +
> +	return mt6360_isnk_brightness_set(&led->isnk, led->isnk.brightness);
> +}
> +
> +static int mt6360_flash_init_default_state(struct mt6360_led *led)
> +{
> +	struct led_classdev_flash *flash = &led->flash;
> +	struct mt6360_priv *priv = led->priv;
> +	u32 enable_mask = MT6360_TORCHEN_MASK | MT6360_FLCSEN_MASK(led->led_no);
> +	u32 level;
> +	unsigned int regval;
> +	int ret;
> +
> +	ret = regmap_read(priv->regmap, MT6360_REG_FLEDITOR(led->led_no), &regval);
> +	if (ret)
> +		return ret;
> +	level = regval & MT6360_ITORCH_MASK;
> +
> +	ret = regmap_read(priv->regmap, MT6360_REG_FLEDEN, &regval);
> +	if (ret)
> +		return ret;
> +
> +	if ((regval & enable_mask) == enable_mask)
> +		level += 1;
> +	else
> +		level = LED_OFF;
> +
> +	switch (led->default_state) {
> +	case STATE_ON:
> +		flash->led_cdev.brightness = flash->led_cdev.max_brightness;
> +		break;
> +	case STATE_KEEP:
> +		flash->led_cdev.brightness = min(level, flash->led_cdev.max_brightness);
> +		break;
> +	default:
> +		flash->led_cdev.brightness = LED_OFF;
> +	}
> +
> +	return mt6360_torch_brightness_set(&flash->led_cdev, flash->led_cdev.brightness);
> +}
> +
> +#if IS_ENABLED(CONFIG_V4L2_FLASH_LED_CLASS)
> +static int mt6360_flash_external_strobe_set(struct v4l2_flash *v4l2_flash, bool enable)
> +{
> +	struct led_classdev_flash *flash = v4l2_flash->fled_cdev;
> +	struct mt6360_led *led = container_of(flash, struct mt6360_led, flash);
> +	struct mt6360_priv *priv = led->priv;
> +	u32 mask = MT6360_FLCSEN_MASK(led->led_no);
> +	u32 val = enable ? mask : 0;
> +	int ret;

Mutex is needed here as well.

> +	ret = regmap_update_bits(priv->regmap, MT6360_REG_FLEDEN, mask, val);
> +	if (ret)
> +		return ret;
> +
> +	if (enable)
> +		priv->fled_strobe_used |= BIT(led->led_no);
> +	else
> +		priv->fled_strobe_used &= ~BIT(led->led_no);
> +
> +	return 0;
> +}
> +
> +static const struct v4l2_flash_ops v4l2_flash_ops = {
> +	.external_strobe_set = mt6360_flash_external_strobe_set,
> +};
> +
> +static void mt6360_init_v4l2_config(struct mt6360_led *led, struct v4l2_flash_config *config)

s/mt6360_init_v4l2_config/mt6360_init_v4l2_flash_config/

> +{
> +	struct led_classdev *lcdev;
> +	struct led_flash_setting *s = &config->intensity;
> +

Multicolor LEDs don't need to be registered with V4L2.
I've explained before that I had been misled by the fact that you name
these LEDs as "indicators", which for flash LED controllers usually
means something different.

Please drop the code under "if" branch.

> +	if (led->led_no == MT6360_LED_MULTICOLOR ||
> +		(led->led_no >= MT6360_LED_ISNK1 && led->led_no <= MT6360_LED_ISNKML)) {
> +		if (led->led_no != MT6360_LED_MULTICOLOR)
> +			lcdev = &led->isnk;
> +		else
> +			lcdev = &led->mc.led_cdev;
> +
> +		s->step = MT6360_ISNKRGB_STEPUA;
> +
> +		if (led->led_no == MT6360_LED_ISNKML)
> +			s->step = MT6360_ISNKML_STEPUA;
> +
> +		s->min = 0;
> +		s->val = lcdev->brightness * s->step;
> +		s->max = lcdev->max_brightness * s->step;
> +	} else {
> +		lcdev = &led->flash.led_cdev;
> +
> +		s->min = MT6360_ITORCH_MINUA;
> +		s->step = MT6360_ITORCH_STEPUA;
> +		s->val = s->max = s->min + (lcdev->max_brightness - 1) * s->step;
> +
> +		config->has_external_strobe = 1;

You also need to initialize flash faults config:

config>flash_faults = ....

> +	}
> +
> +	strscpy(config->dev_name, lcdev->dev->kobj.name, sizeof(config->dev_name));
> +}
> +#else
> +static const struct v4l2_flash_ops v4l2_flash_ops;
> +
> +static void mt6360_init_v4l2_config(struct mt6360_led *led, struct v4l2_flash_config *config)
> +{
> +}
> +#endif
> +
> +static int mt6360_led_register(struct device *parent, struct mt6360_led *led,
> +				struct led_init_data *init_data)
> +{
> +	struct mt6360_priv *priv = led->priv;
> +	struct v4l2_flash_config v4l2_config = {0};
> +	int ret;
> +
> +	if ((led->led_no == MT6360_LED_ISNK1 || led->led_no == MT6360_LED_MULTICOLOR) &&
> +		(priv->leds_active & BIT(MT6360_LED_ISNK1))) {
> +		/* Change isink1 to SW control mode, disconnect it with charger state */
> +		ret = regmap_update_bits(priv->regmap, MT6360_REG_RGBEN, MT6360_CHRINDSEL_MASK,
> +					 MT6360_CHRINDSEL_MASK);
> +		if (ret) {
> +			dev_err(parent, "Failed to config ISNK1 to SW mode\n");
> +			return ret;
> +		}
> +	}
> +
> +	switch (led->led_no) {
> +	case MT6360_LED_MULTICOLOR:
> +		ret = mt6360_mc_brightness_set(&led->mc.led_cdev, LED_OFF);
> +		if (ret) {
> +			dev_err(parent, "Failed to init multicolor brightness\n");
> +			return ret;
> +		}
> +
> +		ret = devm_led_classdev_multicolor_register_ext(parent, &led->mc, init_data);
> +		if (ret) {
> +			dev_err(parent, "Couldn't register multicolor\n");
> +			return ret;
> +		}

Don't register this LED with V4L2.

> +		mt6360_init_v4l2_config(led, &v4l2_config);
> +		led->v4l2_flash = v4l2_flash_indicator_init(parent, init_data->fwnode,
> +							    &led->mc.led_cdev, &v4l2_config);
> +		break;
> +	case MT6360_LED_ISNK1 ... MT6360_LED_ISNKML:
> +		ret = mt6360_isnk_init_default_state(led);
> +		if (ret) {
> +			dev_err(parent, "Failed to init %d isnk state\n", led->led_no);
> +			return ret;
> +		}
> +
> +		ret = devm_led_classdev_register_ext(parent, &led->isnk, init_data);
> +		if (ret) {
> +			dev_err(parent, "Couldn't register isink %d\n", led->led_no);
> +			return ret;
> +		}

As you've previously clarified these are not flash indicators, so no
need to register them with V4L2.

> +		mt6360_init_v4l2_config(led, &v4l2_config);
> +		led->v4l2_flash = v4l2_flash_indicator_init(parent, init_data->fwnode, &led->isnk,
> +							    &v4l2_config);
> +		break;
> +	default:
> +		ret = mt6360_flash_init_default_state(led);
> +		if (ret) {
> +			dev_err(parent, "Failed to init %d flash state\n", led->led_no);
> +			return ret;
> +		}
> +
> +		ret = devm_led_classdev_flash_register_ext(parent, &led->flash, init_data);

You need to add discussed no-ops for this function, or otherwise the
compilation will break when CONFIG_LEDS_CLASS_FLASH will not be set, for
which you now allow in your Kconfig entry.

Discussed fixes for multicolor registration functions are needed as
well. Please add the required patches at the beginning of this patch
set.

> +		if (ret) {
> +			dev_err(parent, "Couldn't register flash %d\n", led->led_no);
> +			return ret;
> +		}
> +
> +		mt6360_init_v4l2_config(led, &v4l2_config);
> +		led->v4l2_flash = v4l2_flash_init(parent, init_data->fwnode, &led->flash,
> +						  &v4l2_flash_ops, &v4l2_config);
> +	}
> +
> +	if (IS_ERR(led->v4l2_flash)) {
> +		dev_err(parent, "Failed to register %d v4l2 sd\n", led->led_no);
> +		return PTR_ERR(led->v4l2_flash);
> +	}
> +
> +	return 0;
> +}
> +
> +static u32 clamp_align(u32 val, u32 min, u32 max, u32 step)
> +{
> +	u32 retval;
> +
> +	retval = clamp_val(val, min, max);
> +	if (step > 1)
> +		retval = rounddown(retval - min, step) + min;
> +
> +	return retval;
> +}
> +
> +static int mt6360_init_isnk_properties(struct mt6360_led *led, struct led_init_data *init_data)
> +{
> +	struct led_classdev *lcdev;
> +	struct mt6360_priv *priv = led->priv;
> +	struct fwnode_handle *child;
> +	u32 step_uA = MT6360_ISNKRGB_STEPUA, max_uA = MT6360_ISNKRGB_MAXUA;
> +	u32 val;
> +	int num_color = 0, ret;
> +
> +	if (led->led_no == MT6360_LED_MULTICOLOR) {
> +		struct mc_subled *sub_led;
> +
> +		sub_led = devm_kzalloc(priv->dev, sizeof(*sub_led) * MULTICOLOR_NUM_CHANNELS,
> +				       GFP_KERNEL);
> +		if (!sub_led)
> +			return -ENOMEM;
> +
> +		fwnode_for_each_child_node(init_data->fwnode, child) {
> +			u32 reg, color;
> +
> +			ret = fwnode_property_read_u32(child, "reg", &reg);
> +			if (ret || reg > MT6360_LED_ISNK3 || priv->leds_active & BIT(reg))
> +				return -EINVAL;
> +
> +			ret = fwnode_property_read_u32(child, "color", &color);
> +			if (ret) {
> +				dev_err(priv->dev, "led %d, no color specified\n", led->led_no);
> +				return ret;
> +			}
> +
> +			priv->leds_active |= BIT(reg);
> +			sub_led[num_color].color_index = color;
> +			sub_led[num_color].channel = reg;
> +			num_color++;
> +		}
> +
> +		if (num_color < 2) {
> +			dev_err(priv->dev, "Multicolor must include 2 or more led channel\n");
> +			return -EINVAL;
> +		}
> +
> +		led->mc.num_colors = num_color;
> +		led->mc.subled_info = sub_led;
> +
> +		lcdev = &led->mc.led_cdev;
> +		lcdev->brightness_set_blocking = mt6360_mc_brightness_set;
> +	} else {
> +		if (led->led_no == MT6360_LED_ISNKML) {
> +			step_uA = MT6360_ISNKML_STEPUA;
> +			max_uA = MT6360_ISNKML_MAXUA;
> +		}
> +
> +		lcdev = &led->isnk;
> +		lcdev->brightness_set_blocking = mt6360_isnk_brightness_set;
> +	}
> +
> +	ret = fwnode_property_read_u32(init_data->fwnode, "led-max-microamp", &val);
> +	if (ret) {
> +		dev_warn(priv->dev, "Not specified led-max-microamp, config to the minimum\n");
> +		val = step_uA;
> +	} else
> +		val = clamp_align(val, 0, max_uA, step_uA);
> +
> +	lcdev->max_brightness = val / step_uA;
> +
> +	fwnode_property_read_string(init_data->fwnode, "linux,default-trigger",
> +				    &lcdev->default_trigger);
> +
> +	return 0;
> +}
> +
> +static int mt6360_init_flash_properties(struct mt6360_led *led, struct led_init_data *init_data)
> +{
> +	struct led_classdev_flash *flash = &led->flash;
> +	struct led_classdev *lcdev = &flash->led_cdev;
> +	struct mt6360_priv *priv = led->priv;
> +	struct led_flash_setting *s;
> +	u32 val;
> +	int ret;
> +
> +	ret = fwnode_property_read_u32(init_data->fwnode, "led-max-microamp", &val);
> +	if (ret) {
> +		dev_warn(priv->dev, "Not specified led-max-microamp, config to the minimum\n");
> +		val = MT6360_ITORCH_MINUA;
> +	} else
> +		val = clamp_align(val, MT6360_ITORCH_MINUA, MT6360_ITORCH_MAXUA,
> +				  MT6360_ITORCH_STEPUA);
> +
> +	lcdev->max_brightness = (val - MT6360_ITORCH_MINUA) / MT6360_ITORCH_STEPUA + 1;
> +	lcdev->brightness_set_blocking = mt6360_torch_brightness_set;
> +	lcdev->flags |= LED_DEV_CAP_FLASH;
> +
> +	ret = fwnode_property_read_u32(init_data->fwnode, "flash-max-microamp", &val);
> +	if (ret) {
> +		dev_warn(priv->dev, "Not specified flash-max-microamp, config to the minimum\n");
> +		val = MT6360_ISTRB_MINUA;
> +	} else
> +		val = clamp_align(val, MT6360_ISTRB_MINUA, MT6360_ISTRB_MAXUA, MT6360_ISTRB_STEPUA);
> +
> +	s = &flash->brightness;
> +	s->min = MT6360_ISTRB_MINUA;
> +	s->step = MT6360_ISTRB_STEPUA;
> +	s->val = s->max = val;
> +
> +	/* Always configure as min level when off to prevent flash current spike */
> +	ret = _mt6360_flash_brightness_set(flash, s->min);
> +	if (ret)
> +		return ret;
> +
> +	ret = fwnode_property_read_u32(init_data->fwnode, "flash-max-timeout-us", &val);
> +	if (ret) {
> +		dev_warn(priv->dev, "Not specified flash-max-timeout-us, config to the minimum\n");
> +		val = MT6360_STRBTO_MINUS;
> +	} else
> +		val = clamp_align(val, MT6360_STRBTO_MINUS, MT6360_STRBTO_MAXUS,
> +				  MT6360_STRBTO_STEPUS);
> +
> +	s = &flash->timeout;
> +	s->min = MT6360_STRBTO_MINUS;
> +	s->step = MT6360_STRBTO_STEPUS;
> +	s->val = s->max = val;
> +
> +	flash->ops = &mt6360_flash_ops;
> +
> +	return 0;
> +}
> +
> +static int mt6360_init_common_properties(struct mt6360_led *led, struct led_init_data *init_data)
> +{
> +	const char * const states[] = { "off", "keep", "on" };
> +	const char *str;
> +	int ret;
> +
> +	if (!fwnode_property_read_string(init_data->fwnode, "default-state", &str)) {
> +		ret = match_string(states, ARRAY_SIZE(states), str);
> +		if (ret < 0)
> +			ret = STATE_OFF;
> +
> +		led->default_state = ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static void mt6360_v4l2_flash_release(struct mt6360_priv *priv)
> +{
> +	int i;
> +
> +	for (i = 0; i < priv->leds_count; i++) {
> +		struct mt6360_led *led = priv->leds + i;
> +
> +		if (led->v4l2_flash)
> +			v4l2_flash_release(led->v4l2_flash);
> +
> +	}
> +}
> +
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
> +		u32 reg;
> +
> +		ret = fwnode_property_read_u32(child, "reg", &reg);
> +		if (ret)
> +			goto out_flash_release;
> +
> +		if (reg > MT6360_MAX_LEDS || priv->leds_active & BIT(reg))
> +			return -EINVAL;
> +		priv->leds_active |= BIT(reg);
> +
> +		led->led_no = reg;
> +		led->priv = priv;
> +
> +		ret = mt6360_init_common_properties(led, &init_data);
> +		if (ret)
> +			goto out_flash_release;
> +
> +		if (reg == MT6360_LED_MULTICOLOR ||
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
> +	return ret;
> +}
> +
> +static int mt6360_led_remove(struct platform_device *pdev)
> +{
> +	struct mt6360_priv *priv = platform_get_drvdata(pdev);
> +
> +	mt6360_v4l2_flash_release(priv);
> +	return 0;
> +}
> +
> +static const struct of_device_id __maybe_unused mt6360_led_of_id[] = {
> +	{ .compatible = "mediatek,mt6360-led", },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, mt6360_led_of_id);
> +
> +static struct platform_driver mt6360_led_driver = {
> +	.driver = {
> +		.name = "mt6360-led",
> +		.of_match_table = mt6360_led_of_id,
> +	},
> +	.probe = mt6360_led_probe,
> +	.remove = mt6360_led_remove,
> +};
> +module_platform_driver(mt6360_led_driver);
> +
> +MODULE_AUTHOR("Gene Chen <gene_chen@richtek.com>");
> +MODULE_DESCRIPTION("MT6360 LED Driver");
> +MODULE_LICENSE("GPL v2");
> 

-- 
Best regards,
Jacek Anaszewski
