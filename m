Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C29776ED01D
	for <lists+linux-leds@lfdr.de>; Mon, 24 Apr 2023 16:15:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231140AbjDXOP1 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 24 Apr 2023 10:15:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229929AbjDXOPZ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 24 Apr 2023 10:15:25 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D720F7D84
        for <linux-leds@vger.kernel.org>; Mon, 24 Apr 2023 07:15:11 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 695EE61453
        for <linux-leds@vger.kernel.org>; Mon, 24 Apr 2023 14:15:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60A60C433D2;
        Mon, 24 Apr 2023 14:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1682345710;
        bh=+hD/njM5qHvdBFWQcdVqRUc5R1ZmhZgqWB0cElKwkG8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gx1KozSq1VgBkTFS6Z14Ls8heOb479lnv+mupzCa8zO3eSSd9NqgyBAdVnVohy2xY
         asQ0xw5gVCYU2QcfSAUgs7NZtpD3V3th7Ce5H/0clX508VWoAmfTxtLFYQVniShtaI
         t9NVx3pidbQhr6ZWLhbPKmkuoiNUk0Ju0zxBIQs7BqEWeTYIUsHnxl4p3OvqiE4uDw
         kIf7LKUff2hdYKaCQ/HRGeWBvBqDxzqTa+xTiPgHOi58p1hWvaQcJHf5McbIYoUMn1
         hRpLIPRA7Fy3UxLcA9W3gjDz9LwzUH0eb421iGI/zoEUSANRzakcxa4H4D3SqyUVFW
         Zufx1xYFmQDUQ==
Date:   Mon, 24 Apr 2023 15:15:05 +0100
From:   Lee Jones <lee@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Pavel Machek <pavel@ucw.cz>, Yauhen Kharuzhy <jekhor@gmail.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        linux-leds@vger.kernel.org
Subject: Re: [PATCH v2 1/5] leds: Add Intel Cherry Trail Whiskey Cove PMIC
 LED driver
Message-ID: <20230424141505.GL50521@google.com>
References: <20230420123741.57160-1-hdegoede@redhat.com>
 <20230420123741.57160-2-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230420123741.57160-2-hdegoede@redhat.com>
X-Spam-Status: No, score=-4.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Thu, 20 Apr 2023, Hans de Goede wrote:

> From: Yauhen Kharuzhy <jekhor@gmail.com>
> 
> Add support for LEDs connected to the Intel Cherry Trail Whiskey Cove
> PMIC. Charger and general-purpose LEDs are supported. Hardware blinking
> is implemented, breathing is not.
> 
> This driver was tested with Lenovo Yoga Book notebook.
> 
> Changes by Hans de Goede (in response to review of v2):
> - Since the PMIC is connected to the battery any changes we make to
>   the LED settings are permanent, even surviving reboot / poweroff.
>   Save LED1 register settings on probe() and if auto-/hw-control was
>   enabled on probe() restore the settings on remove() and shutdown().
> - Delay switching LED1 to software control mode to first brightness write.
> - Use dynamically allocated drvdata instead of a global drvdata variable.
> - Ensure the LED is on when activating blinking.
> - Fix CHT_WC_LED_EFF_BREATHING val ((3 << 1) rather then BIT(3)).
> 
> Link: https://lore.kernel.org/r/20190212205901.13037-2-jekhor@gmail.com
> Signed-off-by: Yauhen Kharuzhy <jekhor@gmail.com>
> Co-developed-by: Hans de Goede <hdegoede@redhat.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
> Changes in v2:
> - Update comment about YB1 kernel source usage for register info
> - Replace "cht-wc::" LED name prefix with "platform::"
> - Add leds-cht-wcove to list of drivers using "platform::charging" in
>   Documentation/leds/well-known-leds.txt
> - Bail from cht_wc_leds_brightness_set() on first error
> - Make default blink 1Hz, like sw-blink default blink
> ---
>  Documentation/leds/well-known-leds.txt |   2 +-
>  drivers/leds/Kconfig                   |  11 +
>  drivers/leds/Makefile                  |   1 +
>  drivers/leds/leds-cht-wcove.c          | 373 +++++++++++++++++++++++++
>  4 files changed, 386 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/leds/leds-cht-wcove.c

Generally nice.  Couple of small nits.

> diff --git a/Documentation/leds/well-known-leds.txt b/Documentation/leds/well-known-leds.txt
> index 2160382c86be..7640debee6c0 100644
> --- a/Documentation/leds/well-known-leds.txt
> +++ b/Documentation/leds/well-known-leds.txt
> @@ -65,7 +65,7 @@ Phones usually have multi-color status LED.
>  
>  * Power management
>  
> -Good: "platform:*:charging" (allwinner sun50i)
> +Good: "platform:*:charging" (allwinner sun50i, leds-cht-wcove)
>  
>  * Screen
>  
> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> index 9dbce09eabac..90835716f14a 100644
> --- a/drivers/leds/Kconfig
> +++ b/drivers/leds/Kconfig
> @@ -122,6 +122,17 @@ config LEDS_BCM6358
>  	  This option enables support for LEDs connected to the BCM6358
>  	  LED HW controller accessed via MMIO registers.
>  
> +config LEDS_CHT_WCOVE
> +	tristate "LED support for Intel Cherry Trail Whiskey Cove PMIC"
> +	depends on LEDS_CLASS
> +	depends on INTEL_SOC_PMIC_CHTWC
> +	help
> +	  This option enables support for charger and general purpose LEDs
> +	  connected to the Intel Cherrytrail Whiskey Cove PMIC.
> +
> +	  To compile this driver as a module, choose M here: the module
> +	  will be called leds-cht-wcove.
> +
>  config LEDS_CPCAP
>  	tristate "LED Support for Motorola CPCAP"
>  	depends on LEDS_CLASS
> diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
> index d30395d11fd8..78b5b69f9c54 100644
> --- a/drivers/leds/Makefile
> +++ b/drivers/leds/Makefile
> @@ -19,6 +19,7 @@ obj-$(CONFIG_LEDS_BCM6328)		+= leds-bcm6328.o
>  obj-$(CONFIG_LEDS_BCM6358)		+= leds-bcm6358.o
>  obj-$(CONFIG_LEDS_BD2802)		+= leds-bd2802.o
>  obj-$(CONFIG_LEDS_BLINKM)		+= leds-blinkm.o
> +obj-$(CONFIG_LEDS_CHT_WCOVE)		+= leds-cht-wcove.o
>  obj-$(CONFIG_LEDS_CLEVO_MAIL)		+= leds-clevo-mail.o
>  obj-$(CONFIG_LEDS_COBALT_QUBE)		+= leds-cobalt-qube.o
>  obj-$(CONFIG_LEDS_COBALT_RAQ)		+= leds-cobalt-raq.o
> diff --git a/drivers/leds/leds-cht-wcove.c b/drivers/leds/leds-cht-wcove.c
> new file mode 100644
> index 000000000000..908965e25552
> --- /dev/null
> +++ b/drivers/leds/leds-cht-wcove.c
> @@ -0,0 +1,373 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Driver for LEDs connected to the Intel Cherry Trail Whiskey Cove PMIC
> + *
> + * Copyright 2019 Yauhen Kharuzhy <jekhor@gmail.com>
> + * Copyright 2023 Hans de Goede <hansg@kernel.org>
> + *
> + * Register info comes from the Lenovo Yoga Book Android kernel sources:
> + * YB1_source_code/kernel/cht/drivers/misc/charger_gp_led.c.

How does one browse to this?

> + */
> +
> +#include <linux/kernel.h>
> +#include <linux/mfd/intel_soc_pmic.h>
> +#include <linux/leds.h>
> +#include <linux/module.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>

So close!

> +#define CHT_WC_LED1_CTRL		0x5e1f
> +#define CHT_WC_LED1_FSM			0x5e20
> +#define CHT_WC_LED1_PWM			0x5e21
> +
> +#define CHT_WC_LED2_CTRL		0x4fdf
> +#define CHT_WC_LED2_FSM			0x4fe0
> +#define CHT_WC_LED2_PWM			0x4fe1
> +
> +/* HW or SW control of charging led */
> +#define CHT_WC_LED1_SWCTL		BIT(0)
> +#define CHT_WC_LED1_ON			BIT(1)
> +
> +#define CHT_WC_LED2_ON			BIT(0)
> +#define CHT_WC_LED_I_MA2_5		(2 << 2)
> +/* LED current limit */

If you're documenting a single define, care to put it on the same line?

> +#define CHT_WC_LED_I_MASK		GENMASK(3, 2)
> +
> +#define CHT_WC_LED_F_1_4_HZ		(0 << 4)
> +#define CHT_WC_LED_F_1_2_HZ		(1 << 4)
> +#define CHT_WC_LED_F_1_HZ		(2 << 4)
> +#define CHT_WC_LED_F_2_HZ		(3 << 4)
> +#define CHT_WC_LED_F_MASK		GENMASK(5, 4)
> +
> +#define CHT_WC_LED_EFF_OFF		(0 << 1)
> +#define CHT_WC_LED_EFF_ON		(1 << 1)
> +#define CHT_WC_LED_EFF_BLINKING		(2 << 1)
> +#define CHT_WC_LED_EFF_BREATHING	(3 << 1)
> +#define CHT_WC_LED_EFF_MASK		GENMASK(2, 1)
> +
> +#define CHT_WC_LED_COUNT		2
> +
> +struct cht_wc_led_regs {
> +	/* Register addresses */
> +	u16 ctrl;
> +	u16 fsm;
> +	u16 pwm;
> +	/* Mask + values for turning the LED on/off */
> +	u8 on_off_mask;
> +	u8 on_val;
> +	u8 off_val;
> +};
> +
> +struct cht_wc_led_saved_regs {
> +	unsigned int ctrl;
> +	unsigned int fsm;
> +	unsigned int pwm;
> +};
> +
> +struct cht_wc_led {
> +	struct led_classdev cdev;
> +	const struct cht_wc_led_regs *regs;
> +	struct regmap *regmap;
> +	struct mutex mutex;
> +};
> +
> +struct cht_wc_leds {
> +	struct cht_wc_led leds[CHT_WC_LED_COUNT];
> +	/* Saved LED1 initial register values */
> +	struct cht_wc_led_saved_regs led1_initial_regs;
> +};
> +
> +static const struct cht_wc_led_regs cht_wc_led_regs[CHT_WC_LED_COUNT] = {
> +	{
> +		.ctrl		= CHT_WC_LED1_CTRL,
> +		.fsm		= CHT_WC_LED1_FSM,
> +		.pwm		= CHT_WC_LED1_PWM,
> +		.on_off_mask	= CHT_WC_LED1_SWCTL | CHT_WC_LED1_ON,
> +		.on_val		= CHT_WC_LED1_SWCTL | CHT_WC_LED1_ON,
> +		.off_val	= CHT_WC_LED1_SWCTL,
> +	},
> +	{
> +		.ctrl		= CHT_WC_LED2_CTRL,
> +		.fsm		= CHT_WC_LED2_FSM,
> +		.pwm		= CHT_WC_LED2_PWM,
> +		.on_off_mask	= CHT_WC_LED2_ON,
> +		.on_val		= CHT_WC_LED2_ON,
> +		.off_val	= 0,
> +	},
> +};
> +
> +static const char * const cht_wc_leds_names[CHT_WC_LED_COUNT] = {
> +	"platform::" LED_FUNCTION_CHARGING,
> +	"platform::" LED_FUNCTION_INDICATOR,
> +};
> +
> +static int cht_wc_leds_brightness_set(struct led_classdev *cdev,
> +				      enum led_brightness value)
> +{
> +	struct cht_wc_led *led = container_of(cdev, struct cht_wc_led, cdev);
> +	int ret;
> +
> +	mutex_lock(&led->mutex);
> +
> +	if (!value) {
> +		ret = regmap_update_bits(led->regmap, led->regs->ctrl,
> +					 led->regs->on_off_mask, led->regs->off_val);
> +		if (ret < 0) {
> +			dev_err(cdev->dev, "Failed to turn off: %d\n", ret);
> +			goto out;
> +		}
> +
> +		/* Disable HW blinking */
> +		ret = regmap_update_bits(led->regmap, led->regs->fsm,
> +					 CHT_WC_LED_EFF_MASK, CHT_WC_LED_EFF_ON);
> +		if (ret < 0)
> +			dev_err(cdev->dev, "Failed to update LED FSM reg: %d\n", ret);
> +	} else {
> +		ret = regmap_write(led->regmap, led->regs->pwm, value);
> +		if (ret < 0) {
> +			dev_err(cdev->dev, "Failed to set brightness: %d\n", ret);
> +			goto out;
> +		}
> +
> +		ret = regmap_update_bits(led->regmap, led->regs->ctrl,
> +					 led->regs->on_off_mask, led->regs->on_val);
> +		if (ret < 0)
> +			dev_err(cdev->dev, "Failed to turn on: %d\n", ret);
> +	}
> +out:
> +	mutex_unlock(&led->mutex);
> +	return ret;
> +}
> +
> +enum led_brightness cht_wc_leds_brightness_get(struct led_classdev *cdev)
> +{
> +	struct cht_wc_led *led = container_of(cdev, struct cht_wc_led, cdev);
> +	unsigned int val;
> +	int ret;
> +
> +	mutex_lock(&led->mutex);
> +
> +	ret = regmap_read(led->regmap, led->regs->ctrl, &val);
> +	if (ret < 0) {
> +		dev_err(cdev->dev, "Failed to read LED CTRL reg: %d\n", ret);
> +		ret = LED_OFF;


include/linux/leds.h:

/* This is obsolete/useless. We now support variable maximum brightness. */
enum led_brightness {
   LED_OFF         = 0,
   LED_ON          = 1,
   LED_HALF        = 127,
   LED_FULL        = 255,
};

> +		goto done;
> +	}
> +
> +	val &= led->regs->on_off_mask;
> +	if (val != led->regs->on_val) {
> +		ret = LED_OFF;
> +		goto done;
> +	}
> +
> +	ret = regmap_read(led->regmap, led->regs->pwm, &val);
> +	if (ret < 0) {
> +		dev_err(cdev->dev, "Failed to read LED PWM reg: %d\n", ret);
> +		ret = LED_ON;
> +		goto done;
> +	}
> +
> +	ret = val;
> +done:
> +	mutex_unlock(&led->mutex);
> +
> +	return ret;
> +}
> +
> +/* Return blinking period for given CTRL reg value */
> +static unsigned long cht_wc_leds_get_period(int ctrl)
> +{
> +	ctrl &= CHT_WC_LED_F_MASK;
> +
> +	switch (ctrl) {
> +	case CHT_WC_LED_F_1_4_HZ:
> +		return 1000 * 4;
> +	case CHT_WC_LED_F_1_2_HZ:
> +		return 1000 * 2;
> +	case CHT_WC_LED_F_1_HZ:
> +		return 1000;
> +	case CHT_WC_LED_F_2_HZ:
> +		return 1000 / 2;
> +	};
> +
> +	return 0;
> +}
> +
> +/*
> + * Find suitable hardware blink mode for given period.
> + * period < 750 ms - select 2 HZ
> + * 750 ms <= period < 1500 ms - select 1 HZ
> + * 1500 ms <= period < 3000 ms - select 1/2 HZ
> + * 3000 ms <= period < 5000 ms - select 1/4 HZ
> + * 5000 ms <= period - return -1
> + */
> +static int cht_wc_leds_find_freq(unsigned long period)
> +{
> +	if (period < 750)
> +		return CHT_WC_LED_F_2_HZ;
> +	else if (period < 1500)
> +		return CHT_WC_LED_F_1_HZ;
> +	else if (period < 3000)
> +		return CHT_WC_LED_F_1_2_HZ;
> +	else if (period < 5000)
> +		return CHT_WC_LED_F_1_4_HZ;
> +	else
> +		return -1;
> +}
> +
> +static int cht_wc_leds_blink_set(struct led_classdev *cdev,
> +				 unsigned long *delay_on,
> +				 unsigned long *delay_off)
> +{
> +	struct cht_wc_led *led = container_of(cdev, struct cht_wc_led, cdev);
> +	unsigned int ctrl;
> +	int ret;
> +
> +	mutex_lock(&led->mutex);
> +
> +	/* blink with 1 Hz as default if nothing specified */

Nit: "Blink"

> +	if (!*delay_on && !*delay_off)
> +		*delay_on = *delay_off = 500;
> +
> +	ctrl = cht_wc_leds_find_freq(*delay_on + *delay_off);
> +	if (ctrl < 0) {
> +		/* Disable HW blinking */
> +		ret = regmap_update_bits(led->regmap, led->regs->fsm,
> +					 CHT_WC_LED_EFF_MASK, CHT_WC_LED_EFF_ON);
> +		if (ret < 0)
> +			dev_err(cdev->dev, "Failed to update LED FSM reg: %d\n", ret);
> +
> +		/* Fallback to software timer */
> +		*delay_on = *delay_off = 0;
> +		ret = -EINVAL;
> +		goto done;
> +	}
> +
> +	ret = regmap_update_bits(led->regmap, led->regs->fsm,
> +				 CHT_WC_LED_EFF_MASK, CHT_WC_LED_EFF_BLINKING);
> +	if (ret < 0)
> +		dev_err(cdev->dev, "Failed to update LED FSM reg: %d\n", ret);
> +
> +	/* Set the frequency and make sure the LED is on */
> +	ret = regmap_update_bits(led->regmap, led->regs->ctrl,
> +				 CHT_WC_LED_F_MASK | led->regs->on_off_mask,
> +				 ctrl | led->regs->on_val);
> +	if (ret < 0)
> +		dev_err(cdev->dev, "Failed to update LED CTRL reg: %d\n", ret);
> +
> +	*delay_off = *delay_on = cht_wc_leds_get_period(ctrl) / 2;
> +
> +done:
> +	mutex_unlock(&led->mutex);
> +
> +	return ret;
> +}
> +
> +static int cht_wc_led_save_regs(struct cht_wc_led *led,
> +				struct cht_wc_led_saved_regs *saved_regs)
> +{
> +	int ret;
> +
> +	ret = regmap_read(led->regmap, led->regs->ctrl, &saved_regs->ctrl);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = regmap_read(led->regmap, led->regs->fsm, &saved_regs->fsm);
> +	if (ret < 0)
> +		return ret;
> +
> +	return regmap_read(led->regmap, led->regs->pwm, &saved_regs->pwm);
> +}
> +
> +static void cht_wc_led_restore_regs(struct cht_wc_led *led,
> +				    const struct cht_wc_led_saved_regs *saved_regs)
> +{
> +	regmap_write(led->regmap, led->regs->ctrl, saved_regs->ctrl);
> +	regmap_write(led->regmap, led->regs->fsm, saved_regs->fsm);
> +	regmap_write(led->regmap, led->regs->pwm, saved_regs->pwm);
> +}
> +
> +static int cht_wc_leds_probe(struct platform_device *pdev)
> +{
> +	struct intel_soc_pmic *pmic = dev_get_drvdata(pdev->dev.parent);

platform_*()

> +	struct cht_wc_leds *leds;
> +	int ret;
> +	int i;
> +
> +	leds = devm_kzalloc(&pdev->dev, sizeof(*leds), GFP_KERNEL);
> +	if (!leds)
> +		return -ENOMEM;
> +
> +	/*
> +	 * LED1 might be in hw-controlled mode when this driver gets loaded; and
> +	 * since the PMIC is always powered by the battery any changes made are
> +	 * permanent. Save LED1 regs to restore them on remove() or shutdown().
> +	 */
> +	leds->leds[0].regs = &cht_wc_led_regs[0];
> +	leds->leds[0].regmap = pmic->regmap;
> +	ret = cht_wc_led_save_regs(&leds->leds[0], &leds->led1_initial_regs);
> +	if (ret < 0)
> +		return ret;
> +
> +	for (i = 0; i < CHT_WC_LED_COUNT; i++) {
> +		struct cht_wc_led *led = &leds->leds[i];
> +
> +		led->regs = &cht_wc_led_regs[i];
> +		led->regmap = pmic->regmap;
> +		mutex_init(&led->mutex);
> +		led->cdev.name = cht_wc_leds_names[i];
> +		led->cdev.brightness_set_blocking = cht_wc_leds_brightness_set;
> +		led->cdev.brightness_get = cht_wc_leds_brightness_get;
> +		led->cdev.blink_set = cht_wc_leds_blink_set;
> +		led->cdev.max_brightness = 255;
> +
> +		ret = led_classdev_register(&pdev->dev, &led->cdev);
> +		if (ret < 0)
> +			return ret;
> +	}
> +
> +	platform_set_drvdata(pdev, leds);
> +	return 0;
> +}
> +
> +static void cht_wc_leds_remove(struct platform_device *pdev)
> +{
> +	struct cht_wc_leds *leds = platform_get_drvdata(pdev);
> +	int i;
> +
> +	for (i = 0; i < CHT_WC_LED_COUNT; i++)
> +		led_classdev_unregister(&leds->leds[i].cdev);
> +
> +	/* Restore LED1 regs if hw-control was active, else leave LED1 off. */

Either use full-stops, or don't.  Please be consistent.

> +	if (!(leds->led1_initial_regs.ctrl & CHT_WC_LED1_SWCTL))
> +		cht_wc_led_restore_regs(&leds->leds[0], &leds->led1_initial_regs);
> +}
> +
> +static void cht_wc_leds_disable(struct platform_device *pdev)
> +{
> +	struct cht_wc_leds *leds = platform_get_drvdata(pdev);
> +	int i;
> +
> +	for (i = 0; i < CHT_WC_LED_COUNT; i++)
> +		cht_wc_leds_brightness_set(&leds->leds[i].cdev, LED_OFF);
> +
> +	/* Restore LED1 regs if hw-control was active, else leave LED1 off. */
> +	if (!(leds->led1_initial_regs.ctrl & CHT_WC_LED1_SWCTL))
> +		cht_wc_led_restore_regs(&leds->leds[0], &leds->led1_initial_regs);
> +}
> +
> +static struct platform_driver cht_wc_leds_driver = {
> +	.probe = cht_wc_leds_probe,
> +	.remove_new = cht_wc_leds_remove,

This is new to me.  What does remove_new do?

Just returns void?

> +	.shutdown = cht_wc_leds_disable,
> +	.driver = {
> +		.name = "cht_wcove_leds",
> +	},
> +};
> +module_platform_driver(cht_wc_leds_driver);
> +
> +MODULE_ALIAS("platform:cht_wcove_leds");
> +MODULE_DESCRIPTION("Intel Cherry Trail Whiskey Cove PMIC LEDs driver");
> +MODULE_AUTHOR("Yauhen Kharuzhy <jekhor@gmail.com>");
> +MODULE_LICENSE("GPL");
> -- 
> 2.39.2
> 

-- 
Lee Jones [李琼斯]
