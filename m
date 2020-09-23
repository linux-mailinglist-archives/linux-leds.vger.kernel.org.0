Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2535E276353
	for <lists+linux-leds@lfdr.de>; Wed, 23 Sep 2020 23:49:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726466AbgIWVtO (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 23 Sep 2020 17:49:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726265AbgIWVtO (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 23 Sep 2020 17:49:14 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCE5CC0613CE;
        Wed, 23 Sep 2020 14:49:13 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id q13so1630803ejo.9;
        Wed, 23 Sep 2020 14:49:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=edH5wLKi7I5DDh94qXTJUceNqBSKC++GPW+ZRRCsnEw=;
        b=u3wkjayAlo0LKSAc2rM4on2ANi9i71JkWzJBb+nkgh72J4rdSH2MtpydnCkT/w3hyt
         TL81mDL9QUgEWVe29Lt6RJ2xczFjohkKDd3YB6HvjO2mSzepzEUB3m6dSbQjBs0dQQoW
         mxYpsVfzsIkXoeu6bzfP/T2fBfqT3zFcunFdz6WPS0LexqlNYC/WaP7A1Y6FxHBQx7lL
         JIy5r9t7R174s2TNeTd25zyPh2cupW6xOFppdPefw8LVzHMVGyuljoOb0YDL2bQT+LuY
         sOnx+QiibBWPi6DPfIWE08ZRiiWhb0jy9OZX4lCci+ImAlmAQC2d8iyVkw54UFNo8ZaC
         oBVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=edH5wLKi7I5DDh94qXTJUceNqBSKC++GPW+ZRRCsnEw=;
        b=WZA/MyH33FInhuQMqudMx6DZlkBRPSuoIdZz+QJwREbtCxqNQ7j0tu3Kp0CMGSux15
         DlkObZPYtC+h4JIfevspdr5wFehdZJKjlLwDlX6FvUU5gk+7g/PwFNqrnUac/0GNG+/j
         birW+6Mc4kaP0nrTJcm1jahA1rkLiDS7D3OzGjHdtFGZHdrnjlUxPtshqg/4/R3uMOKE
         qPtmt6d9LS6cgLYpsgzrgKSKY1doTBlBxszr5pe0U225Am1xz9h3lwUPMvkSgHiKo6B/
         4QizdjIbMZkfaZ5bvGgI7UcTwWXbtMIS5aAhYBQmgQhWDHcuUurSXypZZy86CSKoq/Ql
         IAwQ==
X-Gm-Message-State: AOAM5336FScSYlzZrhTe+HXNsPFV3H4EaHP4DhQGTi3Q8BhHgabJrtkI
        JSj63UNmWQw6ausg1Qh9Q0U=
X-Google-Smtp-Source: ABdhPJz/0RkCePSktM+ClM7EN6K4rN7aLDVPqtISCzCj1+813LFi4lztz6MlQUBYSCrkbBjdhlu3xg==
X-Received: by 2002:a17:906:f150:: with SMTP id gw16mr1549841ejb.528.1600897752291;
        Wed, 23 Sep 2020 14:49:12 -0700 (PDT)
Received: from ?IPv6:2a01:110f:b59:fd00:f545:16b3:bcd9:6770? ([2a01:110f:b59:fd00:f545:16b3:bcd9:6770])
        by smtp.gmail.com with ESMTPSA id s30sm851045edc.8.2020.09.23.14.49.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2020 14:49:11 -0700 (PDT)
Subject: Re: [PATCH v4 2/2] leds: mt6360: Add LED driver for MT6360
To:     Gene Chen <gene.chen.richtek@gmail.com>, pavel@ucw.cz,
        robh+dt@kernel.org, matthias.bgg@gmail.com
Cc:     dmurphy@ti.com, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        gene_chen@richtek.com, Wilma.Wu@mediatek.com,
        shufan_lee@richtek.com, cy_huang@richtek.com,
        benjamin.chao@mediatek.com
References: <1600865452-19649-1-git-send-email-gene.chen.richtek@gmail.com>
 <1600865452-19649-3-git-send-email-gene.chen.richtek@gmail.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <e82fd413-8343-5115-150e-02d96eecf6e8@gmail.com>
Date:   Wed, 23 Sep 2020 23:49:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <1600865452-19649-3-git-send-email-gene.chen.richtek@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Gene,

Thank you for the update. I have some more comments below.

On 9/23/20 2:50 PM, Gene Chen wrote:
> From: Gene Chen <gene_chen@richtek.com>
> 
> Add MT6360 LED driver include 2-channel Flash LED with torch/strobe mode,
> and 4-channel RGB LED support Register/Flash/Breath Mode
> 
> Signed-off-by: Gene Chen <gene_chen@richtek.com>
> ---
>   drivers/leds/Kconfig       |  11 +
>   drivers/leds/Makefile      |   1 +
>   drivers/leds/leds-mt6360.c | 705 +++++++++++++++++++++++++++++++++++++++++++++
>   3 files changed, 717 insertions(+)
>   create mode 100644 drivers/leds/leds-mt6360.c
> 
> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> index 1c181df..5561b08 100644
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
> index 0000000..1c3486e
> --- /dev/null
> +++ b/drivers/leds/leds-mt6360.c
> @@ -0,0 +1,705 @@
> +// SPDX-License-Identifier: GPL-2.0-only
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

One question about these ISINKs - how are they exploited in your device?
Are these LEDs used to indicate camera activity or it is one RGB LED
for status? And what functionality has the remaining amber one (sticking
to the naming from your DT bindings)?

Can you share how the documenation for this device describes the purpose
of these sinks, if it does it at all?

I got probably mislead by your naming in the driver and got fixed on
their function as camera activity indicators, for which V4L2 has
support. If that is not the case, then you'd better switch to using
multicolor framework for all four "indicator" LEDs.

> +	MT6360_LED_FLASH1,
> +	MT6360_LED_FLASH2,
> +	MT6360_MAX_LEDS
> +};
> +
> +#define MT6360_REG_RGBEN		0x380
> +#define MT6360_REG_ISNK(_led_no)	(0x381 + (_led_no))
> +#define MT6360_ISNK_ENMASK(_led_no)	BIT(7 - (_led_no))
> +#define MT6360_ISNK_MASK		GENMASK(4, 0)
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
> +#define MT6360_ISNK1_STEPUA		2000
> +#define MT6360_ISNK1_MAXUA		24000
> +#define MT6360_ISNK4_STEPUA		5000
> +#define MT6360_ISNK4_MAXUA		150000
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
> +	unsigned int fled_strobe_used;
> +	unsigned int fled_torch_used;
> +	unsigned int leds_active;
> +	unsigned int leds_count;
> +	struct mt6360_led leds[];
> +};
> +
> +static int mt6360_isnk_brightness_set(struct led_classdev *lcdev, enum led_brightness level)
> +{
> +	struct mt6360_led *led = container_of(lcdev, struct mt6360_led, isnk);
> +	struct mt6360_priv *priv = led->priv;
> +	u32 enable_mask = MT6360_ISNK_ENMASK(led->led_no);
> +	u32 val = level ? MT6360_ISNK_ENMASK(led->led_no) : 0;
> +	int ret;

You meed mutex protection in all functions acessing device registers.

> +	ret = regmap_update_bits(priv->regmap, MT6360_REG_ISNK(led->led_no),
> +				 MT6360_ISNK_MASK, level);
> +	if (ret)
> +		return ret;
> +
> +	return regmap_update_bits(priv->regmap, MT6360_REG_RGBEN, enable_mask, val);
> +}
> +
> +static int mt6360_torch_brightness_set(struct led_classdev *lcdev, enum led_brightness level)
> +{
> +	struct mt6360_led *led = container_of(lcdev, struct mt6360_led, flash.led_cdev);
> +	struct mt6360_priv *priv = led->priv;
> +	u32 enable_mask = MT6360_TORCHEN_MASK | MT6360_FLCSEN_MASK(led->led_no);
> +	u32 val = level ? MT6360_FLCSEN_MASK(led->led_no) : 0;
> +	u32 prev = priv->fled_torch_used, curr;

Above assignment must be made under mutex.

> +	int ret;
> +
> +	/* Only one set of flash control logic, use the flag to avoid strobe is currently used */
> +	if (priv->fled_strobe_used) {
> +		dev_warn(lcdev->dev, "Please disable strobe first [%d]\n", priv->fled_strobe_used);
> +		return -EBUSY;
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
> +			return ret;
> +	}
> +
> +	ret = regmap_update_bits(priv->regmap, MT6360_REG_FLEDEN, enable_mask, val);
> +	if (ret)
> +		return ret;
> +
> +	priv->fled_torch_used = curr;

Ditto. And everything between as well of course.

> +
> +	return 0;
> +}
> +
> +static int mt6360_flash_brightness_set(struct led_classdev_flash *fl_cdev, u32 brightness)
> +{
> +	/*
> +	 * Due to the current spike when turning on flash, only let brightness keep by framework

s/keep by/to be kept/

> +	 * This empty function is used to prevent led_classdev_flash register ops check

s/led_classdev_flash/led_classdev_flash()/
s/check/check failure/

And please put dots at the end of sentences.

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
> +
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

level++ fits better here.

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
> +
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
> +{
> +	struct led_classdev *lcdev;
> +	struct led_flash_setting *s = &config->intensity;
> +
> +	switch (led->led_no) {
> +	case MT6360_LED_ISNK1 ... MT6360_LED_ISNK4:
> +		lcdev = &led->isnk;
> +
> +		if (led->led_no == MT6360_LED_ISNK4)
> +			s->step = MT6360_ISNK4_STEPUA;
> +		else
> +			s->step = MT6360_ISNK1_STEPUA;
> +
> +		s->min = 0;
> +		s->val = lcdev->brightness * s->step;
> +		s->max = lcdev->max_brightness * s->step;
> +		break;
> +	default:
> +		lcdev = &led->flash.led_cdev;
> +
> +		s->min = MT6360_ITORCH_MINUA;
> +		s->step = MT6360_ITORCH_STEPUA;
> +		s->val = s->max = s->min + (lcdev->max_brightness - 1) * s->step;
> +
> +		config->has_external_strobe = 1;
> +	}
> +
> +	snprintf(config->dev_name, sizeof(config->dev_name), "%s", lcdev->name);

You're using devm_led_classdev_register_ext() so lcdev->name remains
uninitialized, but even if you used non-ext API, it wouldn't necessary
contain the final LED name, if renaming had occurred.

Please use below instead:

strscpy(config->dev_name, lcdev->dev->kobj.name,  sizeof(config->dev_name));


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
> +	switch (led->led_no) {
> +	case MT6360_LED_ISNK1 ... MT6360_LED_ISNK4:
> +		if (led->led_no == MT6360_LED_ISNK1) {
> +			/* Change isink1 to SW control mode, disconnect it with charger state */
> +			ret = regmap_update_bits(priv->regmap, MT6360_REG_RGBEN,
> +						 MT6360_CHRINDSEL_MASK, MT6360_CHRINDSEL_MASK);
> +			if (ret) {
> +				dev_err(parent, "Failed to config ISNK1 to SW mode\n");
> +				return ret;
> +			}
> +		}
> +
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
> +
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
> +	struct led_classdev *isnk = &led->isnk;
> +	struct mt6360_priv *priv = led->priv;
> +	u32 step_uA, max_uA;
> +	u32 val;
> +	int ret;
> +
> +	if (led->led_no == MT6360_LED_ISNK4) {
> +		step_uA = MT6360_ISNK4_STEPUA;
> +		max_uA = MT6360_ISNK4_MAXUA;
> +	} else {
> +		step_uA = MT6360_ISNK1_STEPUA;
> +		max_uA = MT6360_ISNK1_MAXUA;
> +	}
> +
> +	ret = fwnode_property_read_u32(init_data->fwnode, "led-max-microamp", &val);
> +	if (ret) {
> +		dev_warn(priv->dev, "Not specified led-max-microamp, config to the minimum step\n");
> +		val = 1 * step_uA;
> +	} else
> +		val = clamp_align(val, 0, max_uA, step_uA);
> +
> +	isnk->max_brightness = val / step_uA;
> +	isnk->brightness_set_blocking = mt6360_isnk_brightness_set;
> +
> +	fwnode_property_read_string(init_data->fwnode, "linux,default-trigger",
> +				    &isnk->default_trigger);
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
> +	if (!count || count > MT6360_MAX_LEDS)

Please add dev_err() here.

> +		return -EINVAL;
> +
> +	priv = devm_kzalloc(&pdev->dev, struct_size(priv, leds, count), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	priv->leds_count = count;
> +	priv->dev = &pdev->dev;
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
> +		if (reg >= MT6360_MAX_LEDS || priv->leds_active & BIT(reg))
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
> +		switch (reg) {
> +		case MT6360_LED_ISNK1 ... MT6360_LED_ISNK4:
> +			ret = mt6360_init_isnk_properties(led, &init_data);
> +			break;
> +		default:
> +			ret = mt6360_init_flash_properties(led, &init_data);
> +		}
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
