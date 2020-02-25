Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7199116C181
	for <lists+linux-leds@lfdr.de>; Tue, 25 Feb 2020 13:59:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729260AbgBYM76 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 25 Feb 2020 07:59:58 -0500
Received: from lelv0142.ext.ti.com ([198.47.23.249]:42812 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725788AbgBYM75 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 25 Feb 2020 07:59:57 -0500
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01PCxAnF093127;
        Tue, 25 Feb 2020 06:59:10 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1582635550;
        bh=bGd3RwTb8H7E4eSTshWOunqzeFmHbDqIl5e7AKSC+qs=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=qNjJXWqdoFq/wxtuIspMCurSNiSRATI1lIuaQjqMZsBM9mAkDReAJ76hOeKKA/Lno
         s3f8tA9Om4DIAC5peWhP2A5156hlLLADMDknhQPhleYRFMMlicTbU44BY1n4NDMxDH
         +gnbiYR+8FLJo36k+mttZ8lwqK8c+nA1GeBLX/VI=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 01PCxALl095593
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 25 Feb 2020 06:59:10 -0600
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 25
 Feb 2020 06:59:10 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 25 Feb 2020 06:59:09 -0600
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01PCx9lL033752;
        Tue, 25 Feb 2020 06:59:09 -0600
Subject: Re: [PATCH 2/4] leds: axp20x: Support charger LED on AXP20x like
 PMICs
To:     Ondrej Jirman <megous@megous.com>, <linux-sunxi@googlegroups.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Maxime Ripard <mripard@kernel.org>
CC:     Mark Rutland <mark.rutland@arm.com>,
        Lee Jones <lee.jones@linaro.org>, <linux-leds@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20200223131435.681620-1-megous@megous.com>
 <20200223131435.681620-3-megous@megous.com>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <7f8a74e1-28ad-1b27-b491-9bd70f0c4e61@ti.com>
Date:   Tue, 25 Feb 2020 06:53:58 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200223131435.681620-3-megous@megous.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Ondrej

On 2/23/20 7:14 AM, Ondrej Jirman wrote:
> There is single LED that can be turned on and off by the user, or set to
> be controlled by the charger in 2 different modes.
>
> The driver initializes the LED to be controlled by the charger, but
> allows to switch it to user control, and change the mode of charging
> indication via a sysfs.
>
> The driver was developed on AXP813, but should work on other PMICs like
> that without changes.
>
> Signed-off-by: Ondrej Jirman <megous@megous.com>
> ---
>   drivers/leds/Kconfig       |   7 ++
>   drivers/leds/Makefile      |   1 +
>   drivers/leds/leds-axp20x.c | 240 +++++++++++++++++++++++++++++++++++++
>   drivers/mfd/axp20x.c       |   3 +
>   4 files changed, 251 insertions(+)
>   create mode 100644 drivers/leds/leds-axp20x.c
>
> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> index d82f1dea37111..80a3f31f6f4c3 100644
> --- a/drivers/leds/Kconfig
> +++ b/drivers/leds/Kconfig
> @@ -846,6 +846,13 @@ config LEDS_TPS6105X
>   	  It is a single boost converter primarily for white LEDs and
>   	  audio amplifiers.
>   
> +config LEDS_AXP20X
> +	tristate "Charger LED support for AXP20X-like PMICs (AXP813, ...)"
> +	depends on LEDS_CLASS && MFD_AXP20X
> +	help
> +	  This option enables support for on-chip LED driver on
> +	  AXP20X-like PMICs.
> +
>   comment "LED Triggers"
>   source "drivers/leds/trigger/Kconfig"
>   
> diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
> index d7e1107753fb1..80ea1bc4744b0 100644
> --- a/drivers/leds/Makefile
> +++ b/drivers/leds/Makefile
> @@ -86,6 +86,7 @@ obj-$(CONFIG_LEDS_TI_LMU_COMMON)	+= leds-ti-lmu-common.o
>   obj-$(CONFIG_LEDS_LM3697)		+= leds-lm3697.o
>   obj-$(CONFIG_LEDS_LM36274)		+= leds-lm36274.o
>   obj-$(CONFIG_LEDS_TPS6105X)		+= leds-tps6105x.o
> +obj-$(CONFIG_LEDS_AXP20X)		+= leds-axp20x.o
>   
>   # LED SPI Drivers
>   obj-$(CONFIG_LEDS_CR0014114)		+= leds-cr0014114.o
> diff --git a/drivers/leds/leds-axp20x.c b/drivers/leds/leds-axp20x.c
> new file mode 100644
> index 0000000000000..e6c9853b84d52
> --- /dev/null
> +++ b/drivers/leds/leds-axp20x.c
> @@ -0,0 +1,240 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * LED Driver for X-Powers AXP813 PMIC and similar.
> + *
> + * Copyright(c) 2020 Ondrej Jirman <megous@megous.com>
> + */
> +
> +#include <linux/module.h>
> +#include <linux/kernel.h>
> +#include <linux/platform_device.h>
> +#include <linux/leds.h>
> +#include <linux/slab.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>
> +#include <linux/mfd/axp20x.h>
> +
> +#define AXP20X_CHGLED_CTRL_MASK		BIT(3)
> +#define AXP20X_CHGLED_CTRL_CHARGER	BIT(3)
> +#define AXP20X_CHGLED_CTRL_USER		0
> +
> +#define AXP20X_CHRG_CTRL2_MODE		BIT(4)
> +
> +#define AXP20X_CHGLED_USER_STATE_MASK		GENMASK(5, 4)
> +#define AXP20X_CHGLED_USER_STATE_OFF		(0 << 4)
> +#define AXP20X_CHGLED_USER_STATE_BLINK_SLOW	(1 << 4)
> +#define AXP20X_CHGLED_USER_STATE_BLINK_FAST	(2 << 4)
> +#define AXP20X_CHGLED_USER_STATE_ON		(3 << 4)
> +
> +struct axp20x_led {
> +	struct led_classdev cdev;
> +	struct regmap *regmap;
> +};
> +
> +static int axp20x_led_set(struct led_classdev *led_cdev,
> +			   enum led_brightness value)
> +{
> +	struct axp20x_led *led =
> +			container_of(led_cdev, struct axp20x_led, cdev);
> +	unsigned int val;
> +
> +	val = value == LED_OFF ? AXP20X_CHGLED_USER_STATE_OFF :
> +		AXP20X_CHGLED_USER_STATE_ON;
> +
> +	return regmap_update_bits(led->regmap, AXP20X_OFF_CTRL,
> +				  AXP20X_CHGLED_USER_STATE_MASK, val);
> +
> +}
> +
> +static ssize_t charger_control_show(struct device *dev,
> +				    struct device_attribute *attr, char *buf)
> +{
> +	struct led_classdev *led_cdev = dev_get_drvdata(dev);
> +	struct axp20x_led *led =
> +		container_of(led_cdev, struct axp20x_led, cdev);
> +	unsigned int val;
> +	int ret;
> +
> +	ret = regmap_read(led->regmap, AXP20X_OFF_CTRL, &val);
> +	if (ret)
> +		return ret;
> +
> +	return scnprintf(buf, PAGE_SIZE, "%u\n",
> +			 val & AXP20X_CHGLED_CTRL_MASK ? 1 : 0);
> +}
> +
> +static ssize_t charger_control_store(struct device *dev,
> +				     struct device_attribute *attr,
> +				     const char *buf, size_t len)
> +{
> +	struct led_classdev *led_cdev = dev_get_drvdata(dev);
> +	struct axp20x_led *led =
> +			container_of(led_cdev, struct axp20x_led, cdev);
> +	bool status;
> +	int ret;
> +
> +	ret = kstrtobool(buf, &status);
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_update_bits(led->regmap, AXP20X_OFF_CTRL,
> +				 AXP20X_CHGLED_CTRL_MASK,
> +				 status ? AXP20X_CHGLED_CTRL_CHARGER :
> +				 AXP20X_CHGLED_CTRL_USER);
> +	if (ret)
> +		return ret;
> +
> +	return len;
> +}
> +
> +static ssize_t charger_mode_show(struct device *dev,
> +				 struct device_attribute *attr, char *buf)
> +{
> +	struct led_classdev *led_cdev = dev_get_drvdata(dev);
> +	struct axp20x_led *led =
> +		container_of(led_cdev, struct axp20x_led, cdev);
> +	unsigned int val;
> +	int ret;
> +
> +	ret = regmap_read(led->regmap, AXP20X_CHRG_CTRL2, &val);
> +	if (ret)
> +		return ret;
> +
> +	return scnprintf(buf, PAGE_SIZE, "%u\n",
> +			 val & AXP20X_CHRG_CTRL2_MODE ? 1 : 0);
> +}
> +
> +static ssize_t charger_mode_store(struct device *dev,
> +				  struct device_attribute *attr,
> +				  const char *buf, size_t len)
> +{
> +	struct led_classdev *led_cdev = dev_get_drvdata(dev);
> +	struct axp20x_led *led =
> +		container_of(led_cdev, struct axp20x_led, cdev);
> +	unsigned int mode;
> +	int ret;
> +
> +	ret = kstrtouint(buf, 0, &mode);
> +	if (ret)
> +		return ret;
> +
> +	if (mode > 1)
> +		return -ERANGE;
> +
> +	ret = regmap_update_bits(led->regmap, AXP20X_CHRG_CTRL2,
> +				 AXP20X_CHRG_CTRL2_MODE,
> +				 mode ? AXP20X_CHRG_CTRL2_MODE : 0);
> +	if (ret)
> +		return ret;
> +
> +	return len;
> +}
> +
> +static DEVICE_ATTR_RW(charger_control);
> +static DEVICE_ATTR_RW(charger_mode);
> +
> +static struct attribute *axp20x_led_attrs[] = {
> +	&dev_attr_charger_control.attr,
> +	&dev_attr_charger_mode.attr,
> +	NULL,
> +};
> +
> +ATTRIBUTE_GROUPS(axp20x_led);
> +
> +static int axp20x_led_probe(struct platform_device *pdev)
> +{
> +	struct axp20x_dev *axp20x;
> +	struct axp20x_led *led;
> +	int ret;
> +
> +	if (!of_device_is_available(pdev->dev.of_node))
> +		return -ENODEV;
> +
> +	axp20x = dev_get_drvdata(pdev->dev.parent);
> +	if (!axp20x)
> +		return -EINVAL;
> +
> +	led = devm_kzalloc(&pdev->dev,
> +			   sizeof(struct axp20x_led),
> +			   GFP_KERNEL);
> +	if (!led)
> +		return -ENOMEM;
> +
> +	platform_set_drvdata(pdev, led);
> +
> +	led->regmap = axp20x->regmap;
> +
> +	led->cdev.name = "axp20x-chgarger-led";


This does not follow the LED device naming convention please refer to 
the leds-class.rst document

https://elixir.bootlin.com/linux/latest/source/Documentation/leds/leds-class.rst

Dan
