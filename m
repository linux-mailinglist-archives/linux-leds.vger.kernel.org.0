Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5D8C30518F
	for <lists+linux-leds@lfdr.de>; Wed, 27 Jan 2021 05:57:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234659AbhA0E5M (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 26 Jan 2021 23:57:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238633AbhA0E1G (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 26 Jan 2021 23:27:06 -0500
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1C8EC061220
        for <linux-leds@vger.kernel.org>; Tue, 26 Jan 2021 20:23:44 -0800 (PST)
Received: by mail-oi1-x230.google.com with SMTP id p5so837114oif.7
        for <linux-leds@vger.kernel.org>; Tue, 26 Jan 2021 20:23:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=ahUKLd6CjuDNKIbRIwCOuHf3uiXkyILc5fwpJgKdQCo=;
        b=K5F2RZI4Qqi5xj8SQ5KCyCutb7vh+vItJF+HBiHAVC1X3no5p0aGTLScb2+AtLzsUK
         6mB0calwbqvRny8BF06+vR7UwoF+ntk+a9phFeFEkvhVWIDJkVStac09nI9B8ZI7EoqN
         A3aFbf3j1k6Sbqh50Q6e1Nc7r/mYUeYWMWvR07VisUQqZWcmCkMXjdtBjSJfkhTPtRAf
         lFqOWDdhTI7SwqSMdqeWrVa76fkVyYkrV0y/TobQmbEy1qZt8BL8XZb4cPiDmBMKMMVd
         mGEMQqyjOqxiPu6YkjUMBLZNoUT+x9KHAqSL79PST4z825WL3TAvEaRMQrF+Qc0J9cUy
         OU3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=ahUKLd6CjuDNKIbRIwCOuHf3uiXkyILc5fwpJgKdQCo=;
        b=QXs0tq8tz6btnwzr6xKc2AmYGu88u9N3emQ1hbOfaYo6/O2lX3L6FKOjapdMir6quI
         dR1OL8pefNaHZjGxB7iuGQNfAICfKlvrzWgEeup+oDPgBiZ/nRcBpzs9DRUj3xIy2AmG
         xN/QnGOA94SFncHY4tHir9U7Rq7B55B4wz4sd0S4RwOHGZGHW2szSBQYwjcidc9lZDQp
         61Nm+UwAQ/otOBOLBA1N0iEmMZcBOE6sSxoP76A1TlTyIKNTKfyqhMsK/+d3Tg+XKwE3
         vpfEw5wu7/WPtsEbXaPllbPk5qrDF1omUcYJbJf2ZwSEQ9umn9eoLZNnMUUaWHeHmjpm
         gP9Q==
X-Gm-Message-State: AOAM533YArj74jWOe45zvCwSL4noqclH6biNjuUY2eSpqxhTkJQynvw7
        TnSTeqCRuHWzCAtQOtM9e4USwoI6xfh4hA==
X-Google-Smtp-Source: ABdhPJzc2iECj/D7IaP2YxLNabJCdL/B70mchbKz8JLvxYQdWXsxldceHveFnquk9ls6oHMV6EOgEg==
X-Received: by 2002:aca:c756:: with SMTP id x83mr1985724oif.4.1611721423954;
        Tue, 26 Jan 2021 20:23:43 -0800 (PST)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id y66sm231897oia.20.2021.01.26.20.23.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jan 2021 20:23:43 -0800 (PST)
Date:   Tue, 26 Jan 2021 22:23:41 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     "N?colas F. R. A. Prado" <nfraprado@protonmail.com>
Cc:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, linux-leds@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Brian Masney <masneyb@onstation.org>,
        Luca Weiss <luca@z3ntu.xyz>,
        Russell King <linux@armlinux.org.uk>,
        Georgi Djakov <georgi.djakov@linaro.org>,
        linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        lkcamp@lists.libreplanetbr.org, andrealmeid@collabora.com
Subject: Re: [PATCH v2 2/4] leds: Add driver for QCOM SPMI Flash LEDs
Message-ID: <20210127042341.GJ1241218@yoga>
References: <20210126140240.1517044-1-nfraprado@protonmail.com>
 <20210126140240.1517044-3-nfraprado@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210126140240.1517044-3-nfraprado@protonmail.com>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Tue 26 Jan 08:05 CST 2021, N?colas F. R. A. Prado wrote:

> Add driver for the Qualcomm SPMI Flash LEDs. These are controlled
> through an SPMI bus and are part of the PM8941 PMIC. There are two LEDs
> present in the chip, and can be used independently as camera flash or
> together in torch mode to act as a lantern.
> 
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@protonmail.com>
> ---
> Changes in v2:
> - Thanks to Jacek:
>   - Implemented flash LED class framework
> - Thanks to Bjorn:
>   - Renamed driver to "qcom spmi flash"
> - Refactored code
> - Added missing copyright
> 
>  drivers/leds/Kconfig                |    8 +
>  drivers/leds/Makefile               |    1 +
>  drivers/leds/leds-qcom-spmi-flash.c | 1153 +++++++++++++++++++++++++++
>  3 files changed, 1162 insertions(+)
>  create mode 100644 drivers/leds/leds-qcom-spmi-flash.c
> 
> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> index 849d3c5f908e..ad1c7846f9b3 100644
> --- a/drivers/leds/Kconfig
> +++ b/drivers/leds/Kconfig
> @@ -928,6 +928,14 @@ config LEDS_ACER_A500
>  	  This option enables support for the Power Button LED of
>  	  Acer Iconia Tab A500.
>  
> +config LEDS_QCOM_SPMI_FLASH
> +	tristate "Support for QCOM SPMI Flash LEDs"
> +	depends on SPMI
> +	depends on LEDS_CLASS_FLASH

depends on OF?

> +	help
> +	  This driver supports the Flash/Torch LED present in Qualcomm's PM8941
> +	  PMIC.
> +
>  comment "LED Triggers"
>  source "drivers/leds/trigger/Kconfig"
>  
> diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
> index 73e603e1727e..e86bcfba016b 100644
> --- a/drivers/leds/Makefile
> +++ b/drivers/leds/Makefile
> @@ -93,6 +93,7 @@ obj-$(CONFIG_LEDS_TURRIS_OMNIA)		+= leds-turris-omnia.o
>  obj-$(CONFIG_LEDS_WM831X_STATUS)	+= leds-wm831x-status.o
>  obj-$(CONFIG_LEDS_WM8350)		+= leds-wm8350.o
>  obj-$(CONFIG_LEDS_WRAP)			+= leds-wrap.o
> +obj-$(CONFIG_LEDS_QCOM_SPMI_FLASH)	+= leds-qcom-spmi-flash.o
>  
>  # LED SPI Drivers
>  obj-$(CONFIG_LEDS_CR0014114)		+= leds-cr0014114.o
> diff --git a/drivers/leds/leds-qcom-spmi-flash.c b/drivers/leds/leds-qcom-spmi-flash.c
> new file mode 100644
> index 000000000000..023fc107abce
> --- /dev/null
> +++ b/drivers/leds/leds-qcom-spmi-flash.c
> @@ -0,0 +1,1153 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Qualcomm SPMI Flash Driver
> + *
> + * Copyright (c) 2020, Nícolas F. R. A. Prado <nfraprado@protonmail.com>
> + *
> + * Based on QPNP LEDs driver from downstream MSM kernel sources.
> + * Copyright (c) 2012-2013, The Linux Foundation. All rights reserved.
> + */
> +
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/spmi.h>
> +#include <linux/of_device.h>
> +#include <linux/device.h>
> +#include <linux/types.h>
> +#include <linux/string.h>
> +#include <linux/mutex.h>
> +#include <linux/sysfs.h>
> +#include <linux/led-class-flash.h>
> +#include <linux/regulator/consumer.h>
> +#include <linux/delay.h>
> +#include <linux/regmap.h>
> +#include <dt-bindings/leds/leds-qcom-spmi-flash.h>
> +
> +#define FLASH_SAFETY_TIMER		0x40
> +#define FLASH_MAX_CURR			0x41
> +#define FLASH_LED_0_CURR		0x42
> +#define FLASH_LED_1_CURR		0x43
> +#define FLASH_CLAMP_CURR		0x44
> +#define FLASH_LED_TMR_CTRL		0x48
> +#define FLASH_HEADROOM			0x4A
> +#define FLASH_STARTUP_DELAY		0x4B
> +#define FLASH_MASK_ENABLE		0x4C
> +#define FLASH_VREG_OK_FORCE		0x4F
> +#define FLASH_ENABLE_CONTROL		0x46
> +#define FLASH_LED_STROBE_CTRL		0x47
> +#define FLASH_LED_UNLOCK_SECURE		0xD0
> +#define FLASH_LED_TORCH			0xE4
> +#define FLASH_FAULT_DETECT		0x51
> +#define FLASH_RAMP_RATE			0x54
> +#define FLASH_PERIPHERAL_SUBTYPE	0x05
> +#define FLASH_VPH_PWR_DROOP		0x5A
> +
> +#define FLASH_MAX_LEVEL			0x4F
> +#define TORCH_MAX_LEVEL			0x0F
> +#define	FLASH_NO_MASK			0x00
> +
> +#define FLASH_MASK_1			0x20
> +#define FLASH_MASK_REG_MASK		0xE0
> +#define FLASH_HEADROOM_MASK		0x03
> +#define FLASH_SAFETY_TIMER_MASK		0x7F
> +#define FLASH_CURRENT_MASK		0xFF
> +#define FLASH_MAX_CURRENT_MASK		0x7F
> +#define FLASH_TMR_MASK			0x03
> +#define FLASH_TMR_WATCHDOG		0x03
> +#define FLASH_TMR_SAFETY		0x00
> +#define FLASH_FAULT_DETECT_MASK		0X80
> +#define FLASH_HW_VREG_OK		0x40
> +#define FLASH_VREG_MASK			0xC0
> +#define FLASH_STARTUP_DLY_MASK		0x02
> +#define FLASH_RAMP_RATE_MASK		0xBF
> +#define FLASH_VPH_PWR_DROOP_MASK	0xF3
> +
> +#define FLASH_ENABLE_ALL		0xE0
> +#define FLASH_ENABLE_MODULE		0x80
> +#define FLASH_ENABLE_MODULE_MASK	0x80
> +#define FLASH_DISABLE_ALL		0x00
> +#define FLASH_ENABLE_MASK		0xE0
> +#define FLASH_ENABLE_LED_0		0xC0
> +#define FLASH_ENABLE_LED_1		0xA0
> +#define FLASH_INIT_MASK			0xE0
> +#define FLASH_SELFCHECK_ENABLE		0x80
> +#define FLASH_SELFCHECK_DISABLE		0x00
> +
> +#define FLASH_STROBE_SW			0xC0
> +#define FLASH_STROBE_HW			0x04
> +#define FLASH_STROBE_MASK		0xC7
> +#define FLASH_LED_0_OUTPUT		0x80
> +#define FLASH_LED_1_OUTPUT		0x40
> +
> +#define FLASH_TORCH_MASK		0x03
> +#define FLASH_LED_TORCH_ENABLE		0x00
> +#define FLASH_LED_TORCH_DISABLE		0x03
> +#define FLASH_UNLOCK_SECURE		0xA5
> +#define FLASH_SECURE_MASK		0xFF
> +
> +#define FLASH_SUBTYPE_DUAL		0x01
> +#define FLASH_SUBTYPE_SINGLE		0x02
> +
> +#define FLASH_DURATION_STEP		10000
> +#define FLASH_DURATION_MIN		10000
> +#define FLASH_DURATION_MAX		1280000 //TODO: find real value
> +
> +#define FLASH_CURRENT_STEP		12500
> +#define FLASH_CURRENT_MIN		12500
> +#define FLASH_CURRENT_MAX		1000000
> +#define FLASH_TORCH_CURRENT_MAX		200000
> +
> +#define FLASH_DEFAULT_CLAMP		200000
> +
> +enum qcom_flash_ids {
> +	QCOM_FLASH_ID_LED0,
> +	QCOM_FLASH_ID_LED1,
> +};
> +
> +static u8 flash_debug_regs[] = {
> +	0x40, 0x41, 0x42, 0x43, 0x44, 0x48, 0x49, 0x4b, 0x4c,
> +	0x4f, 0x46, 0x47,
> +};
> +
> +/**
> + * struct qcom_flash_led - Represents each individual flash LED
> + * @cdev: flash LED classdev
> + * @id: led ID as given by enum qcom_flash_ids
> + * @default_on: default state for the LED
> + * @turn_off_delay_ms: number of msec before turning off the LED
> + * @clamp_curr: Clamp current to use
> + * @headroom: Headroom value to use, as given by leds-qcom-spmi-flash.h
> + * @enable_module: enable address for particular flash
> + * @trigger_flash: trigger flash
> + * @startup_dly: startup delay for flash, as given by leds-qcom-spmi-flash.h
> + * @strobe_type: select between sw and hw strobe
> + * @current_addr: address to write for current
> + * @second_addr: address of secondary flash to be written
> + * @safety_timer: enable safety timer or watchdog timer
> + * @torch_enable: whether torch mode is enabled or individual flash LED
> + */
> +struct qcom_flash_led {
> +	struct led_classdev_flash cdev;
> +	int id;
> +	bool default_on;
> +	int turn_off_delay_ms;
> +	u32 clamp_curr;
> +	u8 headroom;
> +	u8 enable_module;
> +	u8 trigger_flash;
> +	u8 startup_dly;
> +	u8 strobe_type;
> +	u16 current_addr;
> +	u16 second_addr;
> +	bool safety_timer;
> +	bool torch_enable;
> +};
> +
> +/**
> + * struct qcom_flash_device - QCOM SPMI Flash device, contains 2 flash LEDs
> + * @regmap: regmap used to access LED registers over SPMI
> + * @base: base register given in device tree
> + * @pdev: platform device from devicetree
> + * @flash_boost_reg: voltage regulator to supply the flashes
> + * @torch_boost_reg: voltage regulator to supply torch mode
> + * @leds: flash LEDs
> + * @num_leds: number of LEDs registered (between 0 and 2)
> + * @lock: lock to protect SPMI transactions
> + * @torch_enable: enable flash LED torch mode
> + * @peripheral_subtype: module peripheral subtype
> + * @flash_regulator_on: flash regulator status
> + * @torch_regulator_on: torch regulator status
> + */
> +struct qcom_flash_device {
> +	struct regmap *regmap;
> +	u16 base;
> +	struct platform_device *pdev;

You only ever use this to get to pdev->dev, so better store the "struct
device *" here.

> +	struct regulator *flash_boost_reg;

Rename flash_supply?

> +	struct regulator *torch_boost_reg;

torch_supply?

> +	struct qcom_flash_led leds[2];
> +	u8 num_leds;
> +	struct mutex lock;
> +	u8 torch_enable;
> +	u8 peripheral_subtype;
> +	bool flash_regulator_on;
> +	bool torch_regulator_on;
> +};
> +
> +static inline struct qcom_flash_led *flcdev_to_led(struct led_classdev_flash *fled_cdev)
> +{
> +	return container_of(fled_cdev, struct qcom_flash_led, cdev);
> +}
> +
> +static inline struct qcom_flash_device *led_to_leds_dev(struct qcom_flash_led *led)
> +{
> +	return container_of(led, struct qcom_flash_device, leds[led->id]);
> +}
> +
> +static int led_read_reg(struct qcom_flash_device *leds_dev, u16 offset, u8 *data)

Can't you just use unsigned int when handling the values and thereby use
regmap_read/write/update_bits directly in the code instead of wrapping
them like this?

> +{
> +	unsigned int val;
> +	int ret;
> +
> +	ret = regmap_read(leds_dev->regmap, leds_dev->base + offset, &val);
> +	if (ret < 0)
> +		return ret;
> +
> +	*data = val;
> +	return 0;
> +}
> +
> +static int led_write_reg(struct qcom_flash_device *leds_dev, u16 offset, u8 data)
> +{
> +	return regmap_write(leds_dev->regmap, leds_dev->base + offset, data);
> +}
> +
> +static int qcom_flash_masked_write(struct qcom_flash_device *leds_dev,
> +				   u16 addr,
> +				   u8 mask,
> +				   u8 val)

Use regmap_update_bits() directly for this?

> +{
> +	int rc;
> +	u8 reg;
> +
> +	rc = led_read_reg(leds_dev, addr, &reg);
> +	if (rc)
> +		dev_err(&leds_dev->pdev->dev,
> +			"Unable to read from addr=%x, rc(%d)\n", addr, rc);
> +
> +	reg &= ~mask;
> +	reg |= val;
> +
> +	rc = led_write_reg(leds_dev, addr, reg);
> +	if (rc)
> +		dev_err(&leds_dev->pdev->dev,
> +			"Unable to write to addr=%x, rc(%d)\n", addr, rc);
> +	return rc;
> +}
> +
> +static void qcom_flash_dump_regs(struct qcom_flash_device *leds_dev,

If you think this is valuable, please move it to debugfs.

> +				 u8 regs[],
> +				 u8 array_size)
> +{
> +	int i;
> +	u8 val;
> +
> +	pr_debug("===== LED register dump start =====\n");
> +	for (i = 0; i < array_size; i++) {
> +		led_read_reg(leds_dev, regs[i], &val);
> +		pr_debug("0x%x = 0x%x\n", leds_dev->base + regs[i], val);
> +	}
> +	pr_debug("===== LED register dump end =====\n");
> +}
> +
> +static u8 qcom_flash_duration_to_reg(u32 us)
> +{
> +	if (us < FLASH_DURATION_MIN)
> +		us = FLASH_DURATION_MIN;
> +	return (us - FLASH_DURATION_MIN) / FLASH_DURATION_STEP;
> +}
> +
> +static u8 qcom_flash_current_to_reg(u32 ua)
> +{
> +	if (ua < FLASH_CURRENT_MIN)
> +		ua = FLASH_CURRENT_MIN;
> +	return (ua - FLASH_CURRENT_MIN) / FLASH_CURRENT_STEP;
> +}
> +
> +static void clamp_align(u32 *v, u32 min, u32 max, u32 step)
> +{
> +	*v = clamp_val(*v, min, max);
> +	if (step > 1)
> +		*v = (*v - min) / step * step + min;
> +}
> +
> +static int qcom_flash_fled_regulator_operate(struct qcom_flash_device *leds_dev,
> +					     bool on)
> +{
> +	int rc;
> +
> +	if (!on)
> +		goto regulator_turn_off;

Given that this function comprises two completely separate code paths,
better split it into separate enable and disable functions..

> +
> +	if (!leds_dev->flash_regulator_on) {
> +		if (leds_dev->flash_boost_reg) {
> +			rc = regulator_enable(leds_dev->flash_boost_reg);
> +			if (rc) {
> +				dev_err(&leds_dev->pdev->dev,
> +					"Regulator enable failed(%d)\n", rc);
> +				return rc;
> +			}
> +			leds_dev->flash_regulator_on = true;
> +		}
> +	}
> +
> +	return 0;
> +
> +regulator_turn_off:
> +	if (leds_dev->flash_regulator_on) {
> +		if (leds_dev->flash_boost_reg) {
> +			rc = qcom_flash_masked_write(leds_dev,
> +				FLASH_ENABLE_CONTROL,
> +				FLASH_ENABLE_MASK,
> +				FLASH_DISABLE_ALL);
> +			if (rc)
> +				dev_err(&leds_dev->pdev->dev,
> +					"Enable reg write failed(%d)\n", rc);
> +
> +			rc = regulator_disable(leds_dev->flash_boost_reg);
> +			if (rc) {
> +				dev_err(&leds_dev->pdev->dev,
> +					"Regulator disable failed(%d)\n", rc);
> +				return rc;
> +			}
> +			leds_dev->flash_regulator_on = false;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static int qcom_flash_torch_regulator_operate(struct qcom_flash_device *leds_dev,
> +					      bool on)
> +{
> +	int rc;
> +
> +	if (!on)
> +		goto regulator_turn_off;

As with the flash regulator function, please split this in two.

> +
> +	if (!leds_dev->torch_regulator_on) {
> +		rc = regulator_enable(leds_dev->torch_boost_reg);
> +		if (rc) {
> +			dev_err(&leds_dev->pdev->dev,
> +				"Regulator enable failed(%d)\n", rc);
> +			return rc;
> +		}
> +		leds_dev->torch_regulator_on = true;
> +	}
> +	return 0;
> +
> +regulator_turn_off:
> +	if (leds_dev->torch_regulator_on) {
> +		rc = qcom_flash_masked_write(leds_dev, FLASH_ENABLE_CONTROL,
> +				FLASH_ENABLE_MODULE_MASK, FLASH_DISABLE_ALL);
> +		if (rc)
> +			dev_err(&leds_dev->pdev->dev,
> +				"Enable reg write failed(%d)\n", rc);
> +
> +		rc = regulator_disable(leds_dev->torch_boost_reg);
> +		if (rc) {
> +			dev_err(&leds_dev->pdev->dev,
> +				"Regulator disable failed(%d)\n", rc);
> +			return rc;
> +		}
> +		leds_dev->torch_regulator_on = false;
> +	}
> +	return 0;
> +}
> +
> +static int qcom_flash_fled_set(struct qcom_flash_led *led, bool on)
> +{
> +	int rc, error;
> +	u8 curr;
> +	struct qcom_flash_device *leds_dev = led_to_leds_dev(led);
> +	struct device *dev = &leds_dev->pdev->dev;
> +
> +	/* dump flash registers */
> +	pr_debug("Regdump before\n");
> +	qcom_flash_dump_regs(leds_dev, flash_debug_regs,
> +			     ARRAY_SIZE(flash_debug_regs));
> +
> +	/* Set led current */
> +	if (on) {

Please split this into enable/disable torch and enable/disable flash.

> +		if (led->torch_enable)
> +			curr = qcom_flash_current_to_reg(led->cdev.led_cdev.brightness);
> +		else
> +			curr = qcom_flash_current_to_reg(led->cdev.brightness.val);
> +
> +		if (led->torch_enable) {
> +			if (leds_dev->peripheral_subtype == FLASH_SUBTYPE_DUAL) {
> +				rc = qcom_flash_torch_regulator_operate(leds_dev, true);
> +				if (rc) {
> +					dev_err(dev,
> +					"Torch regulator operate failed(%d)\n",
> +					rc);
> +					return rc;
> +				}
> +			} else if (leds_dev->peripheral_subtype == FLASH_SUBTYPE_SINGLE) {
> +				rc = qcom_flash_fled_regulator_operate(leds_dev, true);
> +				if (rc) {
> +					dev_err(dev,
> +					"Flash regulator operate failed(%d)\n",
> +					rc);
> +					goto error_flash_set;
> +				}
> +
> +				/*
> +				 * Write 0x80 to MODULE_ENABLE before writing
> +				 * 0xE0 in order to avoid a hardware bug caused
> +				 * by register value going from 0x00 to 0xE0.
> +				 */
> +				rc = qcom_flash_masked_write(leds_dev,
> +					FLASH_ENABLE_CONTROL,
> +					FLASH_ENABLE_MODULE_MASK,
> +					FLASH_ENABLE_MODULE);
> +				if (rc) {
> +					dev_err(dev,
> +						"Enable reg write failed(%d)\n",
> +						rc);
> +					return rc;
> +				}
> +			}
> +
> +			rc = qcom_flash_masked_write(leds_dev,
> +				FLASH_LED_UNLOCK_SECURE,
> +				FLASH_SECURE_MASK, FLASH_UNLOCK_SECURE);
> +			if (rc) {
> +				dev_err(dev, "Secure reg write failed(%d)\n", rc);
> +				goto error_reg_write;
> +			}
> +
> +			rc = qcom_flash_masked_write(leds_dev,
> +				FLASH_LED_TORCH,
> +				FLASH_TORCH_MASK, FLASH_LED_TORCH_ENABLE);
> +			if (rc) {
> +				dev_err(dev, "Torch reg write failed(%d)\n", rc);
> +				goto error_reg_write;
> +			}
> +
> +			rc = qcom_flash_masked_write(leds_dev,
> +				led->current_addr,
> +				FLASH_CURRENT_MASK,
> +				curr);
> +			if (rc) {
> +				dev_err(dev, "Current reg write failed(%d)\n", rc);
> +				goto error_reg_write;
> +			}
> +
> +			rc = qcom_flash_masked_write(leds_dev,
> +				led->second_addr,
> +				FLASH_CURRENT_MASK,
> +				curr);
> +			if (rc) {
> +				dev_err(dev,
> +					"2nd Current reg write failed(%d)\n",
> +					rc);
> +				goto error_reg_write;
> +			}
> +
> +			qcom_flash_masked_write(leds_dev, FLASH_MAX_CURR,
> +				FLASH_CURRENT_MASK,
> +				TORCH_MAX_LEVEL);
> +			if (rc) {
> +				dev_err(dev,
> +					"Max current reg write failed(%d)\n",
> +					rc);
> +				goto error_reg_write;
> +			}
> +
> +			rc = qcom_flash_masked_write(leds_dev,
> +				FLASH_ENABLE_CONTROL,
> +				FLASH_ENABLE_MASK,
> +				leds_dev->torch_enable);
> +			if (rc) {
> +				dev_err(dev, "Enable reg write failed(%d)\n", rc);
> +				goto error_reg_write;
> +			}
> +
> +			rc = qcom_flash_masked_write(leds_dev,
> +				FLASH_LED_STROBE_CTRL,
> +				FLASH_STROBE_SW,
> +				FLASH_STROBE_SW);
> +			if (rc) {
> +				dev_err(dev,
> +					"LED %d strobe reg write failed(%d)\n",
> +					led->id, rc);
> +				goto error_reg_write;
> +			}
> +		} else {
> +			rc = qcom_flash_fled_regulator_operate(leds_dev, true);
> +			if (rc) {
> +				dev_err(dev,
> +					"Flash regulator operate failed(%d)\n",
> +					rc);
> +				goto error_flash_set;
> +			}
> +
> +			/* Set flash safety timer */
> +			rc = qcom_flash_masked_write(leds_dev,
> +				FLASH_SAFETY_TIMER,
> +				FLASH_SAFETY_TIMER_MASK,
> +				qcom_flash_duration_to_reg(led->cdev.timeout.val));
> +			if (rc) {
> +				dev_err(dev,
> +					"Safety timer reg write failed(%d)\n",
> +					rc);
> +				goto error_flash_set;
> +			}
> +
> +			/* Set max current */
> +			rc = qcom_flash_masked_write(leds_dev,
> +				FLASH_MAX_CURR, FLASH_CURRENT_MASK,
> +				FLASH_MAX_LEVEL);
> +			if (rc) {
> +				dev_err(dev,
> +					"Max current reg write failed(%d)\n",
> +					rc);
> +				goto error_flash_set;
> +			}
> +
> +			/* Set clamp current */
> +			rc = qcom_flash_masked_write(leds_dev,
> +				FLASH_CLAMP_CURR,
> +				FLASH_CURRENT_MASK,
> +				qcom_flash_current_to_reg(led->clamp_curr));
> +			if (rc) {
> +				dev_err(dev,
> +					"Clamp current reg write failed(%d)\n",
> +					rc);
> +				goto error_flash_set;
> +			}
> +
> +			rc = qcom_flash_masked_write(leds_dev,
> +				led->current_addr,
> +				FLASH_CURRENT_MASK,
> +				curr);
> +			if (rc) {
> +				dev_err(dev, "Current reg write failed(%d)\n", rc);
> +				goto error_flash_set;
> +			}
> +
> +			rc = qcom_flash_masked_write(leds_dev,
> +				FLASH_ENABLE_CONTROL,
> +				led->enable_module,
> +				led->enable_module);
> +			if (rc) {
> +				dev_err(dev, "Enable reg write failed(%d)\n", rc);
> +				goto error_flash_set;
> +			}
> +
> +			/* TODO try to not busy wait*/
> +			mdelay(1);
> +
> +			if (!led->strobe_type) {
> +				rc = qcom_flash_masked_write(leds_dev,
> +					FLASH_LED_STROBE_CTRL,
> +					led->trigger_flash,
> +					led->trigger_flash);
> +				if (rc) {
> +					dev_err(dev,
> +					"LED %d strobe reg write failed(%d)\n",
> +					led->id, rc);
> +					goto error_flash_set;
> +				}
> +			} else {
> +				rc = qcom_flash_masked_write(leds_dev,
> +					FLASH_LED_STROBE_CTRL,
> +					(led->trigger_flash | FLASH_STROBE_HW),
> +					(led->trigger_flash | FLASH_STROBE_HW));
> +				if (rc) {
> +					dev_err(dev,
> +					"LED %d strobe reg write failed(%d)\n",
> +					led->id, rc);
> +					goto error_flash_set;
> +				}
> +			}
> +		}
> +	} else {
> +		rc = qcom_flash_masked_write(leds_dev,
> +			FLASH_LED_STROBE_CTRL,
> +			led->trigger_flash,
> +			FLASH_DISABLE_ALL);
> +		if (rc) {
> +			dev_err(dev,
> +				"LED %d flash write failed(%d)\n", led->id, rc);
> +			if (led->torch_enable)
> +				goto error_torch_set;
> +			else
> +				goto error_flash_set;
> +		}
> +
> +		/* TODO try to not busy wait*/
> +		mdelay(2);
> +		udelay(160);
> +
> +		if (led->torch_enable) {
> +			rc = qcom_flash_masked_write(leds_dev,
> +				FLASH_LED_UNLOCK_SECURE,
> +				FLASH_SECURE_MASK, FLASH_UNLOCK_SECURE);
> +			if (rc) {
> +				dev_err(dev, "Secure reg write failed(%d)\n", rc);
> +				goto error_torch_set;
> +			}
> +
> +			rc = qcom_flash_masked_write(leds_dev,
> +					FLASH_LED_TORCH,
> +					FLASH_TORCH_MASK,
> +					FLASH_LED_TORCH_DISABLE);
> +			if (rc) {
> +				dev_err(dev, "Torch reg write failed(%d)\n", rc);
> +				goto error_torch_set;
> +			}
> +
> +			if (leds_dev->peripheral_subtype == FLASH_SUBTYPE_DUAL) {
> +				rc = qcom_flash_torch_regulator_operate(leds_dev,false);
> +				if (rc) {
> +					dev_err(dev,
> +						"Torch regulator operate failed(%d)\n",
> +						rc);
> +					return rc;
> +				}
> +			} else if (leds_dev->peripheral_subtype == FLASH_SUBTYPE_SINGLE) {
> +				rc = qcom_flash_fled_regulator_operate(leds_dev, false);
> +				if (rc) {
> +					dev_err(dev,
> +						"Flash regulator operate failed(%d)\n",
> +						rc);
> +					return rc;
> +				}
> +			}
> +		} else {
> +			rc = qcom_flash_masked_write(leds_dev,
> +				FLASH_ENABLE_CONTROL,
> +				led->enable_module &
> +				~FLASH_ENABLE_MODULE_MASK,
> +				FLASH_DISABLE_ALL);
> +			if (rc) {
> +				dev_err(dev, "Enable reg write failed(%d)\n", rc);
> +				if (led->torch_enable)
> +					goto error_torch_set;
> +				else
> +					goto error_flash_set;
> +			}
> +
> +			rc = qcom_flash_fled_regulator_operate(leds_dev, false);
> +			if (rc) {
> +				dev_err(dev,
> +					"Flash regulator operate failed(%d)\n",
> +					rc);
> +				return rc;
> +			}
> +		}
> +	}
> +
> +	pr_debug("Regdump after\n");
> +	qcom_flash_dump_regs(leds_dev, flash_debug_regs, ARRAY_SIZE(flash_debug_regs));
> +
> +	return 0;
> +
> +error_reg_write:
> +	if (leds_dev->peripheral_subtype == FLASH_SUBTYPE_SINGLE)
> +		goto error_flash_set;
> +
> +error_torch_set:
> +	error = qcom_flash_torch_regulator_operate(leds_dev, false);
> +	if (error) {
> +		dev_err(dev, "Torch regulator operate failed(%d)\n", rc);
> +		return error;
> +	}
> +	return rc;
> +
> +error_flash_set:
> +	error = qcom_flash_fled_regulator_operate(leds_dev, false);
> +	if (error) {
> +		dev_err(dev, "Flash regulator operate failed(%d)\n", rc);
> +		return error;
> +	}
> +	return rc;
> +}
> +
> +static int qcom_flash_led_set(struct led_classdev *led_cdev,
> +			      enum led_brightness value)
> +{
> +	struct led_classdev_flash *fled_cdev = lcdev_to_flcdev(led_cdev);
> +	struct qcom_flash_led *led = flcdev_to_led(fled_cdev);
> +	struct qcom_flash_device *leds_dev = led_to_leds_dev(led);
> +	u32 val = value;
> +	int rc;
> +	bool on;
> +
> +	if (val > led_cdev->max_brightness) {
> +		dev_err(&leds_dev->pdev->dev, "Invalid brightness value\n");
> +		return -EINVAL;
> +	}
> +
> +	if (val) {
> +		on = true;
> +		clamp_align(&val, FLASH_CURRENT_MIN, led_cdev->max_brightness,
> +			    FLASH_CURRENT_STEP);
> +		led_cdev->brightness = val;
> +		led->torch_enable = true;
> +	} else {
> +		on = false;
> +	}
> +
> +	mutex_lock(&leds_dev->lock);
> +	rc = qcom_flash_fled_set(led, on);
> +	if (rc < 0)
> +		dev_err(&leds_dev->pdev->dev, "FLASH set brightness failed (%d)\n", rc);

I believe you're printing error messages in all cases of
qcom_flash_fled_set() returning an error and you're not printing in the
other call spots, so please drop this print.

> +	mutex_unlock(&leds_dev->lock);
> +	return rc;
> +}
> +
> +static int qcom_flash_fled_brightness_set(struct led_classdev_flash *fled_cdev,
> +					  u32 brightness)
> +{
> +	clamp_align(&brightness, FLASH_CURRENT_MIN, fled_cdev->brightness.max,
> +		    FLASH_CURRENT_STEP);
> +	fled_cdev->brightness.val = brightness;
> +	return 0;
> +}
> +
> +static int qcom_flash_fled_strobe_set(struct led_classdev_flash *fled_cdev,
> +				      bool state)
> +{
> +	struct qcom_flash_led *led = flcdev_to_led(fled_cdev);
> +	struct qcom_flash_device *leds_dev = led_to_leds_dev(led);
> +	int rc;
> +
> +	led->torch_enable = false;
> +
> +	mutex_lock(&leds_dev->lock);
> +	rc = qcom_flash_fled_set(led, state);
> +	if (rc < 0)
> +		return rc;

You're returning with the lock held here, fall through and return rc at
the end instead.

> +	mutex_unlock(&leds_dev->lock);
> +
> +	return 0;
> +}
> +
> +static int qcom_flash_fled_strobe_get(struct led_classdev_flash *fled_cdev,
> +				      bool *state)
> +{
> +	//TODO
> +	*state = 0;
> +	return 0;
> +}
> +
> +static int qcom_flash_fled_timeout_set(struct led_classdev_flash *fled_cdev,
> +				       u32 timeout)
> +{
> +	fled_cdev->timeout.val = timeout;
> +	return 0;
> +}
> +
> +static int qcom_flash_fled_fault_get(struct led_classdev_flash *fled_cdev,
> +				     u32 *fault)
> +{
> +	//TODO
> +	*fault = 0;
> +	return 0;
> +}
> +
> +static const struct led_flash_ops flash_ops = {
> +	.flash_brightness_set	= qcom_flash_fled_brightness_set,
> +	.strobe_set		= qcom_flash_fled_strobe_set,
> +	.strobe_get		= qcom_flash_fled_strobe_get,
> +	.timeout_set		= qcom_flash_fled_timeout_set,
> +	.fault_get		= qcom_flash_fled_fault_get,
> +};
> +
> +static int qcom_flash_flcdev_setup(struct qcom_flash_led *led,
> +				   struct device_node *node)
> +{
> +	int rc;
> +	struct platform_device *pdev = led_to_leds_dev(led)->pdev;
> +	struct led_init_data init_data = {};
> +
> +	init_data.fwnode = of_fwnode_handle(node);
> +	init_data.devicename = "qcom-spmi-flash";
> +	init_data.default_label = "flash";
> +
> +	led->cdev.led_cdev.brightness_set_blocking    = qcom_flash_led_set;
> +
> +	rc = of_property_read_u32(node, "led-max-microamp",
> +				  &led->cdev.led_cdev.max_brightness);
> +	if (rc < 0) {
> +		dev_err(&pdev->dev, "Failure reading max_current, rc =  %d\n", rc);
> +		return rc;
> +	}
> +	led->cdev.led_cdev.max_brightness = min((u32) led->cdev.led_cdev.max_brightness,
> +						(u32) FLASH_TORCH_CURRENT_MAX);
> +
> +	rc = of_property_read_u32(node, "flash-max-microamp", &led->cdev.brightness.max);
> +	if (rc < 0) {
> +		dev_err(&pdev->dev, "Failure reading max_current, rc =  %d\n", rc);
> +		return rc;
> +	}
> +	led->cdev.brightness.max = min((u32) led->cdev.brightness.max,
> +				(u32) FLASH_CURRENT_MAX);
> +	led->cdev.brightness.min = FLASH_CURRENT_MIN;
> +	led->cdev.brightness.step = FLASH_CURRENT_STEP;
> +	led->cdev.brightness.val = led->cdev.brightness.max;
> +
> +	rc = of_property_read_u32(node, "flash-max-timeout-us", &led->cdev.timeout.max);
> +	if (rc < 0) {
> +		dev_err(&pdev->dev, "Failure reading max_timeout, rc =  %d\n", rc);
> +		return rc;
> +	}
> +	led->cdev.timeout.max = min((u32) led->cdev.timeout.max,
> +				    (u32) FLASH_DURATION_MAX);
> +	led->cdev.timeout.min = FLASH_DURATION_MIN;
> +	led->cdev.timeout.step = FLASH_DURATION_STEP;
> +	led->cdev.timeout.val = led->cdev.timeout.max;
> +
> +	led->cdev.ops = &flash_ops;
> +	led->cdev.led_cdev.flags |= LED_DEV_CAP_FLASH;
> +
> +	rc = led_classdev_flash_register_ext(&pdev->dev, &led->cdev, &init_data);
> +	if (rc) {
> +		dev_err(&pdev->dev, "unable to register led %d,rc=%d\n", led->id, rc);
> +		return rc;
> +	}
> +
> +	return 0;
> +}
> +
> +static int qcom_flash_setup_flash_regs(struct qcom_flash_led *led)
> +{
> +	int rc;
> +	struct qcom_flash_device *leds_dev = led_to_leds_dev(led);
> +
> +	/* Set headroom */
> +	rc = qcom_flash_masked_write(leds_dev, FLASH_HEADROOM,
> +		FLASH_HEADROOM_MASK, led->headroom);
> +	if (rc) {
> +		dev_err(&leds_dev->pdev->dev, "Headroom reg write failed(%d)\n", rc);
> +		return rc;
> +	}
> +
> +	/* Set startup delay */
> +	rc = qcom_flash_masked_write(leds_dev,
> +		FLASH_STARTUP_DELAY, FLASH_STARTUP_DLY_MASK,
> +		led->startup_dly);
> +	if (rc) {
> +		dev_err(&leds_dev->pdev->dev,
> +			"Startup delay reg write failed(%d)\n", rc);
> +		return rc;
> +	}
> +
> +	/* Set timer control - safety or watchdog */
> +	if (led->safety_timer) {
> +		rc = qcom_flash_masked_write(leds_dev,
> +			FLASH_LED_TMR_CTRL,
> +			FLASH_TMR_MASK, FLASH_TMR_SAFETY);
> +		if (rc) {
> +			dev_err(&leds_dev->pdev->dev,
> +				"LED timer ctrl reg write failed(%d)\n", rc);
> +			return rc;
> +		}
> +	}
> +
> +	/* dump flash registers */
> +	qcom_flash_dump_regs(leds_dev, flash_debug_regs, ARRAY_SIZE(flash_debug_regs));
> +
> +	return 0;
> +}
> +
> +static int qcom_flash_get_config_flash(struct qcom_flash_led *led,
> +				       struct device_node *node)
> +{
> +	int rc;
> +	u32 val;
> +	const char *temp_string;
> +	struct device *dev = &led_to_leds_dev(led)->pdev->dev;
> +
> +	rc = of_property_read_u32(node, "led-sources", &led->id);
> +	if (rc < 0) {
> +		dev_err(dev, "Failure reading led id, rc =  %d\n", rc);
> +		return rc;
> +	}
> +
> +	led->default_on = false;
> +	rc = of_property_read_string(node, "default-state", &temp_string);
> +	if (!rc) {
> +		if (strncmp(temp_string, "on", sizeof("on")) == 0)
> +			led->default_on = true;
> +	} else if (rc != -EINVAL)
> +		return rc;
> +
> +	led->turn_off_delay_ms = 0;
> +	rc = of_property_read_u32(node, "qcom,turn-off-delay-ms", &val);
> +	if (!rc)
> +		led->turn_off_delay_ms = val;
> +	else if (rc != -EINVAL)
> +		return rc;
> +
> +	if (led->id == QCOM_FLASH_ID_LED0) {
> +		led->enable_module = FLASH_ENABLE_LED_0;
> +		led->current_addr = FLASH_LED_0_CURR;
> +		led->trigger_flash = FLASH_LED_0_OUTPUT;
> +
> +		led->second_addr = FLASH_LED_1_CURR;
> +	} else if (led->id == QCOM_FLASH_ID_LED1) {
> +		led->enable_module = FLASH_ENABLE_LED_1;
> +		led->current_addr = FLASH_LED_1_CURR;
> +		led->trigger_flash = FLASH_LED_1_OUTPUT;
> +
> +		led->second_addr = FLASH_LED_0_CURR;
> +	} else {
> +		dev_err(dev, "Unknown flash LED name given\n");
> +		return -EINVAL;
> +	}
> +
> +	rc = of_property_read_u32(node, "qcom,headroom", &val);
> +	if (!rc)
> +		led->headroom = (u8) val;
> +	else if (rc == -EINVAL)
> +		led->headroom = QCOM_SPMI_FLASH_HEADROOM_500MV;
> +
> +	rc = of_property_read_u32(node, "qcom,clamp-curr", &val);
> +	if (!rc)
> +		led->clamp_curr = val;
> +	else if (rc == -EINVAL)
> +		led->clamp_curr = FLASH_DEFAULT_CLAMP;
> +
> +	rc = of_property_read_u32(node, "qcom,startup-dly", &val);
> +	if (!rc)
> +		led->startup_dly = (u8) val;
> +	else if (rc == -EINVAL)
> +		led->startup_dly = QCOM_SPMI_FLASH_STARTUP_DLY_128US;
> +
> +	led->safety_timer = of_property_read_bool(node, "qcom,safety-timer");
> +
> +	return 0;
> +}
> +
> +static int qcom_flash_setup_regs(struct qcom_flash_device *leds_dev)
> +{
> +	int rc;
> +
> +	rc = qcom_flash_masked_write(leds_dev,
> +		FLASH_LED_STROBE_CTRL,
> +		FLASH_STROBE_MASK, FLASH_DISABLE_ALL);
> +	if (rc) {
> +		dev_err(&leds_dev->pdev->dev, "LED flash write failed(%d)\n", rc);
> +		return rc;
> +	}
> +
> +	/* Disable flash LED module */
> +	rc = qcom_flash_masked_write(leds_dev, FLASH_ENABLE_CONTROL,
> +		FLASH_ENABLE_MODULE_MASK, FLASH_DISABLE_ALL);
> +	if (rc) {
> +		dev_err(&leds_dev->pdev->dev, "Enable reg write failed(%d)\n", rc);
> +		return rc;
> +	}
> +
> +	/* Set Vreg force */
> +	rc = qcom_flash_masked_write(leds_dev, FLASH_VREG_OK_FORCE,
> +		FLASH_VREG_MASK, FLASH_HW_VREG_OK);
> +	if (rc) {
> +		dev_err(&leds_dev->pdev->dev, "Vreg OK reg write failed(%d)\n", rc);
> +		return rc;
> +	}
> +
> +	/* Set self fault check */
> +	rc = qcom_flash_masked_write(leds_dev, FLASH_FAULT_DETECT,
> +		FLASH_FAULT_DETECT_MASK, FLASH_SELFCHECK_DISABLE);
> +	if (rc) {
> +		dev_err(&leds_dev->pdev->dev,
> +			"Fault detect reg write failed(%d)\n", rc);
> +		return rc;
> +	}
> +
> +	/* Set mask enable */
> +	rc = qcom_flash_masked_write(leds_dev, FLASH_MASK_ENABLE,
> +		FLASH_MASK_REG_MASK, FLASH_MASK_1);
> +	if (rc) {
> +		dev_err(&leds_dev->pdev->dev, "Mask enable reg write failed(%d)\n", rc);
> +		return rc;
> +	}
> +
> +	/* Set ramp rate */
> +	rc = qcom_flash_masked_write(leds_dev, FLASH_RAMP_RATE,
> +		FLASH_RAMP_RATE_MASK, 0xBF);
> +	if (rc) {
> +		dev_err(&leds_dev->pdev->dev, "Ramp rate reg write failed(%d)\n", rc);
> +		return rc;
> +	}
> +
> +	/* Enable VPH_PWR_DROOP and set threshold to 2.9V */
> +	rc = qcom_flash_masked_write(leds_dev, FLASH_VPH_PWR_DROOP,
> +					FLASH_VPH_PWR_DROOP_MASK, 0xC2);
> +	if (rc) {
> +		dev_err(&leds_dev->pdev->dev,
> +			"FLASH_VPH_PWR_DROOP reg write failed(%d)\n", rc);
> +		return rc;
> +	}
> +
> +	return 0;
> +}
> +
> +static int qcom_flash_setup_led(struct qcom_flash_led *led,
> +				struct device_node *node)
> +{
> +	int rc;
> +
> +	rc = qcom_flash_get_config_flash(led, node);
> +	if (rc < 0) {
> +		dev_err(&led_to_leds_dev(led)->pdev->dev,

Stash led_to_leds_dev() in a local variable to reduce duplication.

> +			"Unable to read flash config data\n");
> +		return rc;
> +	}
> +
> +	rc = qcom_flash_setup_flash_regs(led);
> +	if (rc) {
> +		dev_err(&led_to_leds_dev(led)->pdev->dev,
> +			"FLASH initialize failed(%d)\n", rc);
> +		return rc;
> +	}
> +
> +	rc = qcom_flash_flcdev_setup(led, node);
> +	if (rc < 0)
> +		return rc;
> +
> +	/* configure default state */
> +	if (led->default_on) {
> +		led->cdev.led_cdev.brightness = led->cdev.led_cdev.max_brightness;
> +		led->torch_enable = true;
> +		mutex_lock(&led_to_leds_dev(led)->lock);
> +		rc = qcom_flash_fled_set(led, true);
> +		if (rc < 0)

You're returning with lock held.

> +			return rc;
> +		mutex_unlock(&led_to_leds_dev(led)->lock);
> +	} else {
> +		led->cdev.led_cdev.brightness = LED_OFF;
> +	}
> +
> +	return 0;
> +}
> +
> +static int qcom_flash_setup_leds_device(struct qcom_flash_device *leds_dev,
> +					struct device_node *node,
> +					struct platform_device *pdev)
> +{
> +	u32 reg;
> +	int rc;
> +
> +	leds_dev->pdev = pdev;
> +
> +	leds_dev->regmap = dev_get_regmap(pdev->dev.parent, NULL);
> +	if (!leds_dev->regmap)
> +		return -ENODEV;
> +
> +	rc = of_property_read_u32(node, "reg", &reg);
> +	if (rc < 0) {
> +		dev_err(&pdev->dev, "Failure reading reg, rc = %d\n", rc);
> +		return rc;
> +	}
> +	leds_dev->base = reg;
> +
> +	qcom_flash_setup_regs(leds_dev);
> +
> +	if (of_find_property(node, "flash-boost-supply", NULL)) {

The idiomatic form is:

	rc = of_find_property();
	if (rc)

But I think you can use regulator_get_optional() instead, for which you
can look at the return value to determine if flash-boost wasn't
specified.


That said, I don't see why you need to give it special treatment, it
should be fine to just expect them to be specified and use the standard
form - which would give you a dummy regulator if it's not specified.

Finally you should use the devm_regulator_get() form, so that you don't
have to regulator_put() in remove.

> +		leds_dev->flash_boost_reg = regulator_get(&pdev->dev, "flash-boost");
> +		if (IS_ERR(leds_dev->flash_boost_reg)) {
> +			rc = PTR_ERR(leds_dev->flash_boost_reg);
> +			dev_err(&pdev->dev, "Regulator get failed(%d)\n", rc);
> +			regulator_put(leds_dev->flash_boost_reg);
> +			leds_dev->flash_boost_reg = NULL;
> +			return rc;
> +		}
> +	}
> +
> +	if (of_find_property(node, "torch-boost-supply", NULL)) {
> +		leds_dev->torch_boost_reg = regulator_get(&pdev->dev, "torch-boost");
> +		if (IS_ERR(leds_dev->torch_boost_reg)) {
> +			rc = PTR_ERR(leds_dev->torch_boost_reg);
> +			dev_err(&pdev->dev, "Torch regulator get failed(%d)\n", rc);
> +			regulator_put(leds_dev->flash_boost_reg);
> +			regulator_put(leds_dev->torch_boost_reg);
> +			leds_dev->flash_boost_reg = NULL;
> +			leds_dev->torch_boost_reg = NULL;
> +			return rc;
> +		}
> +		leds_dev->torch_enable = FLASH_ENABLE_MODULE;

This seems to warrant the use of devm_regulator_get_optional()

> +	} else {
> +		leds_dev->torch_enable = FLASH_ENABLE_ALL;
> +	}
> +
> +	rc = led_read_reg(leds_dev, FLASH_PERIPHERAL_SUBTYPE,
> +			  &leds_dev->peripheral_subtype);
> +	if (rc) {
> +		dev_err(&pdev->dev,
> +			"Unable to read from addr=%x, rc(%d)\n",
> +			FLASH_PERIPHERAL_SUBTYPE, rc);
> +	}
> +
> +	mutex_init(&leds_dev->lock);
> +
> +	return 0;
> +}
> +
> +static int qcom_flash_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct qcom_flash_device *leds_dev;
> +	struct device_node *node = dev->of_node;
> +	struct qcom_flash_led *led;
> +	struct device_node *temp;
> +	int rc, i, parsed_leds = 0;
> +
> +	leds_dev = devm_kzalloc(dev, sizeof(struct qcom_flash_device), GFP_KERNEL);

It's idiomatic to use sizeof(*leds_dev)

> +	if (!leds_dev)
> +		return -ENOMEM;
> +
> +	rc = qcom_flash_setup_leds_device(leds_dev, node, pdev);
> +	if (rc) {
> +		pr_debug("Probe failed setting up base (%d)\n", rc);

This is an error, but all paths out of qcom_flash_setup_leds_device()
already prints, so no need for you to do as well.

> +		return rc;
> +	}
> +
> +	platform_set_drvdata(pdev, leds_dev);
> +
> +	for_each_child_of_node(node, temp) {
> +		led = &leds_dev->leds[parsed_leds];
> +
> +		rc = qcom_flash_setup_led(led, temp);
> +		if (rc) {
> +			for (i = 0; i < parsed_leds; i++)
> +				led_classdev_flash_unregister(&leds_dev->leds[i].cdev);

Do a "goto err_unregister" here instead and clean up at the bottom of
the function.

> +			pr_debug("Probe failed setting up leds (%d)\n", rc);

You have dev, so use dev_err. But I think you already wrote error
messages on the way back here.

> +			return rc;
> +		}
> +
> +		parsed_leds++;
> +	}
> +	leds_dev->num_leds = parsed_leds;
> +	return 0;
> +}
> +
> +static int qcom_flash_remove(struct platform_device *pdev)
> +{
> +	struct qcom_flash_device *leds_dev  = platform_get_drvdata(pdev);
> +	int i, parsed_leds = leds_dev->num_leds;
> +
> +	mutex_destroy(&leds_dev->lock);
> +	if (leds_dev->flash_boost_reg)
> +		regulator_put(leds_dev->flash_boost_reg);

Use devm_regulator_get() and you don't have put it here.

> +	if (leds_dev->torch_boost_reg)
> +		regulator_put(leds_dev->torch_boost_reg);
> +	for (i = 0; i < parsed_leds; i++)
> +		led_classdev_flash_unregister(&leds_dev->leds[i].cdev);
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id qcom_flash_spmi_of_match[] = {
> +	{ .compatible = "qcom,spmi-flash" },
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, qcom_flash_spmi_of_match);
> +
> +static struct platform_driver qcom_flash_driver = {
> +	.driver		= {
> +		.name	= "qcom,spmi-flash",
> +		.of_match_table = of_match_ptr(qcom_flash_spmi_of_match),

Please skip the of_match_ptr(), otherwise if the driver is compiled
without CONFIG_OF you'll get a warning that there's no references to
qcom_flash_driver.

Regards,
Bjorn

> +	},
> +	.probe		= qcom_flash_probe,
> +	.remove		= qcom_flash_remove,
> +};
> +module_platform_driver(qcom_flash_driver);
> +
> +MODULE_DESCRIPTION("Qualcomm SPMI Flash LED driver");
> +MODULE_LICENSE("GPL v2");
> +MODULE_AUTHOR("Nícolas F. R. A. Prado <nfraprado@protonmail.com>");
> -- 
> 2.30.0
> 
> 
