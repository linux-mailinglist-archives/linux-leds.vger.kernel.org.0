Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79CCA2616F9
	for <lists+linux-leds@lfdr.de>; Tue,  8 Sep 2020 19:23:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731762AbgIHRXM (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 8 Sep 2020 13:23:12 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:34520 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731742AbgIHRXK (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 8 Sep 2020 13:23:10 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 088ED1D0040463;
        Tue, 8 Sep 2020 09:13:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1599574381;
        bh=rs/4iwT2kBaICAH6JHLfEat0OAAQSMlU6zob079S12A=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=NUC1mEWW7zSsH1ZQ5y9hTVEQpcN4QG1LgRLCxJelqZA0tNz/CSs8WnmkIFYiCTs9k
         4lKuJ7BsKbj6zRjYr3fVWTI+9E661fx0aoB7obMoSNqlZ9Q2EFxzZG1U72lla/9Tcw
         CNppNg4AVo5Qag1IJnbVi0GZL2LU+lcXMUjg162U=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 088ED1aK120936;
        Tue, 8 Sep 2020 09:13:01 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 8 Sep
 2020 09:13:00 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 8 Sep 2020 09:13:00 -0500
Received: from [10.250.38.37] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 088ED02F094205;
        Tue, 8 Sep 2020 09:13:00 -0500
Subject: Re: [PATCH v3 1/2] leds: mt6360: Add LED driver for MT6360
To:     Gene Chen <gene.chen.richtek@gmail.com>,
        <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>, <robh+dt@kernel.org>,
        <matthias.bgg@gmail.com>
CC:     <linux-leds@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <gene_chen@richtek.com>,
        <Wilma.Wu@mediatek.com>, <shufan_lee@richtek.com>,
        <cy_huang@richtek.com>, <benjamin.chao@mediatek.com>
References: <1599474459-20853-1-git-send-email-gene.chen.richtek@gmail.com>
 <1599474459-20853-2-git-send-email-gene.chen.richtek@gmail.com>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <d6c1110b-ca61-31a1-f112-1dbf341eb8e7@ti.com>
Date:   Tue, 8 Sep 2020 09:13:00 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1599474459-20853-2-git-send-email-gene.chen.richtek@gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Gene

On 9/7/20 5:27 AM, Gene Chen wrote:
> From: Gene Chen <gene_chen@richtek.com>
>
> Add MT6360 LED driver include 2-channel Flash LED with torch/strobe mode,
> and 4-channel RGB LED support Register/Flash/Breath Mode
>
> Signed-off-by: Gene Chen <gene_chen@richtek.com>
> ---
>   drivers/leds/Kconfig       |  11 +
>   drivers/leds/Makefile      |   1 +
>   drivers/leds/leds-mt6360.c | 681 +++++++++++++++++++++++++++++++++++++++++++++
>   3 files changed, 693 insertions(+)
>   create mode 100644 drivers/leds/leds-mt6360.c
>
> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> index 1c181df..94a6d83 100644
> --- a/drivers/leds/Kconfig
> +++ b/drivers/leds/Kconfig
> @@ -271,6 +271,17 @@ config LEDS_MT6323
>   	  This option enables support for on-chip LED drivers found on
>   	  Mediatek MT6323 PMIC.
>   
> +config LEDS_MT6360
> +	tristate "LED Support for Mediatek MT6360 PMIC"
> +	depends on LEDS_CLASS_FLASH && OF
> +	depends on V4L2_FLASH_LED_CLASS || !V4L2_FLASH_LED_CLASS
> +	depends on MFD_MT6360
> +	help
> +	  This option enables support for dual Flash LED drivers found on
> +	  Mediatek MT6360 PMIC.
> +	  Independent current sources supply for each flash LED support torch and strobe mode.
> +	  Includes Low-VF and short protection.
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
> index 0000000..bd6fa48
> --- /dev/null
> +++ b/drivers/leds/leds-mt6360.c
> @@ -0,0 +1,681 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +//
> +// Copyright (C) 2020 MediaTek Inc.
> +//
> +// Author: Gene Chen <gene_chen@richtek.com>
> +
> +#include <linux/delay.h>
> +#include <linux/init.h>
> +#include <linux/interrupt.h>
> +#include <linux/kernel.h>
> +#include <linux/led-class-flash.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/property.h>
> +#include <linux/regmap.h>
> +#include <media/v4l2-flash-led-class.h>
> +
> +enum {
> +	MT6360_LED_ISNK1 = 0,
> +	MT6360_LED_ISNK2,
> +	MT6360_LED_ISNK3,
> +	MT6360_LED_ISNK4,
> +	MT6360_LED_FLASH1,
> +	MT6360_LED_FLASH2,
> +	MT6360_MAX_LEDS,
> +};
> +
> +#define MT6360_REG_RGBEN		0x380
> +#define MT6360_REG_ISNK(_led_no)	(0x381 + (_led_no))
> +#define MT6360_ISNK_ENMASK(_led_no)	BIT(7 - (_led_no))
> +#define MT6360_ISNK_MASK		0x1F
> +#define MT6360_CHRINDSEL_MASK		BIT(3)
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
> +/* 0 means led_off, add one for dummy */
> +#define MT6360_ISNK1_MAXLEVEL		13
> +#define MT6360_ISNK4_MAXLEVEL		31
> +
> +#define MT6360_ITORCH_MIN		25000
> +#define MT6360_ITORCH_STEP		12500
> +#define MT6360_ITORCH_MAX		400000
> +#define MT6360_ISTRB_MIN		50000
> +#define MT6360_ISTRB_STEP		12500
> +#define MT6360_ISTRB_MAX		1500000
> +#define MT6360_STRBTO_MIN		64000
> +#define MT6360_STRBTO_STEP		32000
> +#define MT6360_STRBTO_MAX		2432000
> +
> +#define FLED_TORCH_FLAG_MASK		0x0c
> +#define FLED_TORCH_FLAG_SHFT		2
> +#define FLED_STROBE_FLAG_MASK		0x03
> +
> +#define STATE_OFF			0
> +#define STATE_KEEP			1
> +#define STATE_ON			2
> +
> +struct mt6360_led {
> +	union {
> +		struct led_classdev isnk;
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
> +	struct mt6360_led *leds[MT6360_MAX_LEDS];

I would prefer to use a flexible array here as you are not guaranteed 
that the DT will contain 6 LED entries and it will simplify your probe 
and DT parsing.

There are examples of using the flexible array

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/leds/leds-cr0014114.c

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/leds/leds-lm3697.c

> +	unsigned int fled_strobe_used;
> +	unsigned int fled_torch_used;
> +};
> +
> +static int mt6360_isnk_brightness_set(struct led_classdev *lcdev, enum led_brightness level)
> +{
> +	struct mt6360_led *led = container_of(lcdev, struct mt6360_led, isnk);
> +	struct mt6360_priv *priv = led->priv;
> +	u32 enable_mask = MT6360_ISNK_ENMASK(led->led_no);
> +	u32 val = level ? MT6360_ISNK_ENMASK(led->led_no) : 0;
> +	int ret;
> +
> +	dev_dbg(lcdev->dev, "[%d] brightness %d\n", led->led_no, level);
> +
> +	if (level) {
> +		ret = regmap_update_bits(priv->regmap, MT6360_REG_ISNK(led->led_no),
> +					 MT6360_ISNK_MASK, level - 1);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	ret = regmap_update_bits(priv->regmap, MT6360_REG_RGBEN, enable_mask, val);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}
> +
> +static int mt6360_torch_brightness_set(struct led_classdev *lcdev, enum led_brightness level)
> +{
> +	struct mt6360_led *led = container_of(lcdev, struct mt6360_led, flash.led_cdev);
> +	struct mt6360_priv *priv = led->priv;
> +	u32 enable_mask = MT6360_TORCHEN_MASK | MT6360_FLCSEN_MASK(led->led_no);
> +	u32 val = (level) ? MT6360_FLCSEN_MASK(led->led_no) : 0;
> +	u32 prev = priv->fled_torch_used, curr;
> +	int ret;
> +
> +	dev_dbg(lcdev->dev, "[%d] brightness %d\n", led->led_no, level);
> +	if (priv->fled_strobe_used) {
> +		dev_warn(lcdev->dev, "Please disable strobe first [%d]\n", priv->fled_strobe_used);
> +		return -EINVAL;
> +	}
> +
> +	if (level)
> +		curr = prev | BIT(led->led_no);
> +	else
> +		curr = prev & (~BIT(led->led_no));
> +
> +	if (curr)
> +		val |= MT6360_TORCHEN_MASK;
> +
> +	if (level) {
> +		ret = regmap_update_bits(priv->regmap, MT6360_REG_FLEDITOR(led->led_no),
> +					 MT6360_ITORCH_MASK, level - 1);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	ret = regmap_update_bits(priv->regmap, MT6360_REG_FLEDEN, enable_mask, val);
> +	if (ret)
> +		return ret;
> +
> +	priv->fled_torch_used = curr;
> +
> +	return 0;
> +}
> +
> +static int mt6360_strobe_brightness_set(struct led_classdev_flash *fl_cdev, u32 brightness)
> +{
> +	struct mt6360_led *led = container_of(fl_cdev, struct mt6360_led, flash);
> +	struct led_classdev *lcdev = &fl_cdev->led_cdev;
> +
> +	dev_dbg(lcdev->dev, "[%d] strobe brightness %d\n", led->led_no, brightness);
> +	return 0;
> +}
> +
> +static int _mt6360_strobe_brightness_set(struct led_classdev_flash *fl_cdev, u32 brightness)
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
> +	dev_dbg(lcdev->dev, "[%d] strobe state %d\n", led->led_no, state);
> +	if (priv->fled_torch_used) {
> +		dev_warn(lcdev->dev, "Please disable torch first [0x%x]\n", priv->fled_torch_used);
> +		return -EINVAL;
> +	}
> +
> +	if (state)
> +		curr = prev | BIT(led->led_no);
> +	else
> +		curr = prev & (~BIT(led->led_no));
> +
> +	if (curr)
> +		val |= MT6360_STROBEN_MASK;
> +
> +	ret = regmap_update_bits(priv->regmap, MT6360_REG_FLEDEN, enable_mask, val);
> +	if (ret) {
> +		dev_err(lcdev->dev, "[%d] control current source %d fail\n", led->led_no, state);
> +		return ret;
> +	}
> +
> +	/* used to prevent flash current spike when torch on */
> +	ret = _mt6360_strobe_brightness_set(fl_cdev, state ? s->val : s->min);
> +	if (ret)
> +		return ret;
> +
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
> +
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
> +
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
> +
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
> +
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
> +	.flash_brightness_set = mt6360_strobe_brightness_set,
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
> +	if (regval & MT6360_ISNK_ENMASK(led->led_no))
> +		level += 1;
> +	else
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
> +static int mt6360_isnk_register(struct device *parent, struct mt6360_led *led,
> +				struct led_init_data *init_data)
> +{
> +	struct mt6360_priv *priv = led->priv;
> +	int ret;
> +
> +	if (led->led_no == MT6360_LED_ISNK1) {
> +		/* change isink to sw mode */
> +		ret = regmap_update_bits(priv->regmap, MT6360_REG_RGBEN, MT6360_CHRINDSEL_MASK,
> +					 MT6360_CHRINDSEL_MASK);
> +		if (ret) {
> +			dev_err(parent, "Failed to config ISNK1 to SW mode\n");
> +			return ret;
> +		}
> +	}
> +
> +	ret = mt6360_isnk_init_default_state(led);
> +	if (ret) {
> +		dev_err(parent, "Failed to init %d isnk state\n", led->led_no);
> +		return ret;
> +	}
> +
> +	ret = devm_led_classdev_register_ext(parent, &led->isnk, init_data);
> +	if (ret) {
> +		dev_err(parent, "Couldn't register isink %d\n", led->led_no);
> +		return ret;
> +	}
> +
> +	return 0;
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
> +	u32 enable_mask = MT6360_FLCSEN_MASK(led->led_no);
> +	int ret;
> +
> +	ret = regmap_update_bits(priv->regmap, MT6360_REG_FLEDEN, enable_mask,
> +				 enable ? enable_mask : 0);
> +	if (ret)
> +		return ret;
> +
> +	if (enable)
> +		priv->fled_strobe_used |= BIT(led->led_no);
> +	else
> +		priv->fled_strobe_used &= (~BIT(led->led_no));
> +
> +	return 0;
> +}
> +
> +static const struct v4l2_flash_ops v4l2_flash_ops = {
> +	.external_strobe_set = mt6360_flash_external_strobe_set,
> +};
> +
> +static void mt6360_flash_init_v4l2_config(struct mt6360_led *led, struct v4l2_flash_config *config)
> +{
> +	struct led_classdev_flash *flash = &led->flash;
> +	struct led_classdev *lcdev = &flash->led_cdev;
> +	struct led_flash_setting *s = &config->intensity;
> +
> +	snprintf(config->dev_name, sizeof(config->dev_name), "%s", lcdev->name);
> +
> +	s->min = MT6360_ITORCH_MIN;
> +	s->step = MT6360_ITORCH_STEP;
> +	s->val = s->max = (s->min) + (lcdev->max_brightness - 1) * s->step;
> +
> +	config->has_external_strobe = 1;
> +}
> +#else
> +static const struct v4l2_flash_ops v4l2_flash_ops;
> +
> +static void mt6360_flash_init_v4l2_config(struct mt6360_led *led, struct v4l2_flash_config *config)
> +{
> +}
> +#endif
> +
> +static int mt6360_flash_register(struct device *parent, struct mt6360_led *led,
> +				 struct led_init_data *init_data)
> +{
> +	struct v4l2_flash_config v4l2_config = {0};
> +	int ret;
> +
> +	ret = mt6360_flash_init_default_state(led);
> +	if (ret) {
> +		dev_err(parent, "Failed to init %d flash state\n", led->led_no);
> +		return ret;
> +	}
> +
> +	ret = devm_led_classdev_flash_register_ext(parent, &led->flash, init_data);
> +	if (ret) {
> +		dev_err(parent, "Couldn't register flash %d\n", led->led_no);
> +		return ret;
> +	}
> +
> +	mt6360_flash_init_v4l2_config(led, &v4l2_config);
> +	led->v4l2_flash = v4l2_flash_init(parent, init_data->fwnode, &led->flash, &v4l2_flash_ops,
> +					  &v4l2_config);
> +	if (IS_ERR(led->v4l2_flash)) {
> +		dev_err(parent, "Failed to register %d v4l2 sd\n", led->led_no);
> +		return PTR_ERR(led->v4l2_flash);
> +	}
> +
> +	return 0;
> +}
> +
> +static int mt6360_init_isnk_properties(struct mt6360_led *led, struct led_init_data *init_data)
> +{
> +	struct led_classdev *isnk = &led->isnk;
> +
> +	if (led->led_no == MT6360_LED_ISNK4)
> +		isnk->max_brightness = MT6360_ISNK4_MAXLEVEL;
> +	else
> +		isnk->max_brightness = MT6360_ISNK1_MAXLEVEL;
> +
> +	isnk->brightness_set_blocking = mt6360_isnk_brightness_set;
> +
> +	fwnode_property_read_string(init_data->fwnode, "linux,default-trigger",
> +				    &isnk->default_trigger);
> +
> +	return 0;
> +}
> +
> +static void clamp_align(u32 *v, u32 min, u32 max, u32 step)
> +{
> +	*v = clamp_val(*v, min, max);
> +	if (step > 1)
> +		*v = (*v - min) / step * step + min;
> +}
> +
> +static int mt6360_init_flash_properties(struct mt6360_led *led, struct led_init_data *init_data)
> +{
> +	struct led_classdev_flash *flash = &led->flash;
> +	struct led_classdev *lcdev = &flash->led_cdev;
> +	struct led_flash_setting *s;
> +	u32 val;
> +	int ret;
> +
> +	ret = fwnode_property_read_u32(init_data->fwnode, "led-max-microamp", &val);
> +	if (ret)
> +		val = MT6360_ITORCH_MIN;
> +	else
> +		clamp_align(&val, MT6360_ITORCH_MIN, MT6360_ITORCH_MAX, MT6360_ITORCH_STEP);
> +
> +	lcdev->max_brightness = (val - MT6360_ITORCH_MIN) / MT6360_ITORCH_STEP + 1;
> +	lcdev->brightness_set_blocking = mt6360_torch_brightness_set;
> +	lcdev->flags |= LED_DEV_CAP_FLASH;
> +
> +	ret = fwnode_property_read_u32(init_data->fwnode, "flash-max-microamp", &val);
> +	if (ret)
> +		val = MT6360_ISTRB_MIN;
> +	else
> +		clamp_align(&val, MT6360_ISTRB_MIN, MT6360_ISTRB_MAX, MT6360_ISTRB_STEP);
> +
> +	s = &flash->brightness;
> +	s->min = MT6360_ISTRB_MIN;
> +	s->step = MT6360_ISTRB_STEP;
> +	s->val = s->max = val;
> +
> +	/* always configure as min level when off to prevent flash current spike */
> +	ret = _mt6360_strobe_brightness_set(flash, s->min);
> +	if (ret)
> +		return ret;
> +
> +	ret = fwnode_property_read_u32(init_data->fwnode, "flash-max-timeout-us", &val);
> +	if (ret)
> +		val = MT6360_STRBTO_MIN;
> +	else
> +		clamp_align(&val, MT6360_STRBTO_MIN, MT6360_STRBTO_MAX, MT6360_STRBTO_STEP);
> +
> +	s = &flash->timeout;
> +	s->min = MT6360_STRBTO_MIN;
> +	s->step = MT6360_STRBTO_STEP;
> +	s->val = s->max = val;
> +
> +	flash->ops = &mt6360_flash_ops;
> +
> +	return 0;
> +}
> +
> +static int mt6360_init_common_properties(struct mt6360_led *led, struct led_init_data *init_data)
> +{
> +	const char *str;
> +
> +	if (!fwnode_property_read_string(init_data->fwnode, "default-state", &str)) {
> +		if (!strcmp(str, "on"))
> +			led->default_state = STATE_ON;
> +		else if (!strcmp(str, "keep"))
> +			led->default_state = STATE_KEEP;
> +		else
> +			led->default_state = STATE_OFF;
> +	}
> +
> +	return 0;
> +}
> +
> +static int mt6360_led_probe(struct platform_device *pdev)
> +{
> +	struct mt6360_priv *priv;
> +	struct fwnode_handle *child;
> +	int i, ret;
> +
> +	ret = device_get_child_node_count(&pdev->dev);
> +	if (!ret || ret > MT6360_MAX_LEDS)
> +		return -EINVAL;
> +
> +	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	priv->dev = &pdev->dev;
> +
> +	priv->regmap = dev_get_regmap(pdev->dev.parent, NULL);
> +	if (!priv->regmap) {
> +		dev_err(&pdev->dev, "Failed to get parent regmap\n");
> +		return -ENODEV;
> +	}
> +
> +	device_for_each_child_node(&pdev->dev, child) {
> +		struct mt6360_led *led;
> +		struct led_init_data init_data = { .fwnode = child, };
> +		u32 reg;
> +
> +		ret = fwnode_property_read_u32(child, "reg", &reg);
> +		if (ret || reg >= MT6360_MAX_LEDS || priv->leds[reg]) {
> +			ret = -EINVAL;
> +			goto out;
> +		}
> +
> +		led = devm_kzalloc(&pdev->dev, sizeof(*led), GFP_KERNEL);

Using the flexible array in the mt6360_priv will eliminate this allocation.

Dan

