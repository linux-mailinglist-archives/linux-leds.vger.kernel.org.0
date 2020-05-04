Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5BDC01C4736
	for <lists+linux-leds@lfdr.de>; Mon,  4 May 2020 21:46:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726404AbgEDTqf (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 4 May 2020 15:46:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726111AbgEDTqf (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 4 May 2020 15:46:35 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 966ABC061A0E;
        Mon,  4 May 2020 12:46:34 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id g13so519437wrb.8;
        Mon, 04 May 2020 12:46:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=XnNB0aH/wBNfR3PqmOCCQmnz2B9qDQ6cpqHat6yttEo=;
        b=Tbj9qSm6Xfa7Pu6RoQ97udzYpTaChEn00RNuIT/OR4H3diGBDAzu4tCFjS9QSgS41b
         b1fiJcVeZIcroK5+je4n/pVfza39Zrx2gEuWNld0aA92MviU9kPCT+awZ1HgWeNhE3Bj
         05ax+6cy/V75ax6XJ8zvWiBSM+E40KkG1dCwaCv22e+1dVOZ0EGL1c/YBXa2NehSWcmh
         5VDV8jQC5CJ4dNPzjrrDqBqG1uCJ5rElPAs3B+h/ndW19WROtC9o5Y8TQ4V4A2Id7j78
         t/89U5dv1Ud1pCEr8THzjF+gxxXG+UtIzQkFXr6RH93rAL6cHCKvolAl+1fENVKnswKK
         jzBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=XnNB0aH/wBNfR3PqmOCCQmnz2B9qDQ6cpqHat6yttEo=;
        b=Rx6QubBg7Okzl6AUBU7qkNUmDq53rSfbNg1E4jxTeNdywt+BGKyk/7Ab7XXC0nRtfp
         DuJ7v5K2jCFAiHqiz3x0ap6MRzoGfzloZxbrAJllTn/vkNDGVLINWsof11dUEcRVFbTO
         +fEquSaOI1cwXpkj4+y/8nASRqa804DHNeT4ghEmOiVPwdtSc/zLfeZ3Zuw+E1RiQvQN
         BlaEznqdFhGw7DZTig4QT2h8QM9HAQyJIYEroAbgo5AHNnkrnjO3A8h7B58CIpQ3GuKO
         IgUATbzMkfWqyC/nTovVqKkCh7DKqkETU37c2Escs5gkiNc7wWSDZugiwAUCvRdzCSZX
         KMQg==
X-Gm-Message-State: AGi0Puadl8AUJ8YXhE5RcrJi6XgnL9xTvjzUorYhpFLcUUdqquVcG6iG
        IHH/JaJLAdEpsZ190tHS0av0R4CdPoU=
X-Google-Smtp-Source: APiQypLS9DXfoTDSU0WNFMxxutQWynRuaZMaCOvel5cPw9u7JylxoLJW+EfqK3S7AhXp9GvfPDJUbg==
X-Received: by 2002:adf:e910:: with SMTP id f16mr958042wrm.176.1588621593195;
        Mon, 04 May 2020 12:46:33 -0700 (PDT)
Received: from [192.168.1.23] (afde147.neoplus.adsl.tpnet.pl. [95.49.82.147])
        by smtp.gmail.com with ESMTPSA id u127sm757709wme.8.2020.05.04.12.46.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 May 2020 12:46:32 -0700 (PDT)
Subject: Re: [PATCH 1/3] leds: add aw2013 driver
To:     nikitos.tr@gmail.com, pavel@ucw.cz
Cc:     dmurphy@ti.com, robh+dt@kernel.org, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
References: <20200504162934.4693-1-nikitos.tr@gmail.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <d7569b62-85b5-fbcd-130c-bde6e1d74a04@gmail.com>
Date:   Mon, 4 May 2020 21:46:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200504162934.4693-1-nikitos.tr@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Nikita,

On 5/4/20 6:29 PM, nikitos.tr@gmail.com wrote:
> From: Nikita Travkin <nikitos.tr@gmail.com>
> 
> This commit adds support for AWINIC AW2013 3-channel LED driver.
> The chip supports 3 PWM channels and is controlled with I2C.
> 
> Signed-off-by: Nikita Travkin <nikitos.tr@gmail.com>
> ---
>   drivers/leds/Kconfig       |  10 +
>   drivers/leds/Makefile      |   1 +
>   drivers/leds/leds-aw2013.c | 481 +++++++++++++++++++++++++++++++++++++
>   3 files changed, 492 insertions(+)
>   create mode 100644 drivers/leds/leds-aw2013.c
> 
> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> index 9cdc4cfc5d11..ed943140e1fd 100644
> --- a/drivers/leds/Kconfig
> +++ b/drivers/leds/Kconfig
> @@ -103,6 +103,16 @@ config LEDS_AS3645A
>   	  controller. V4L2 flash API is provided as well if
>   	  CONFIG_V4L2_FLASH_API is enabled.
>   
> +config LEDS_AW2013
> +	tristate "LED support for Awinic AW2013"
> +	depends on LEDS_CLASS && I2C && OF
> +	help
> +	  This option enables support for the AW2013 3-channel
> +	  LED driver.
> +
> +	  To compile this driver as a module, choose M here: the module
> +	  will be called leds-aw2013.
> +
>   config LEDS_BCM6328
>   	tristate "LED Support for Broadcom BCM6328"
>   	depends on LEDS_CLASS
> diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
> index d0dff504f108..d6b8a792c936 100644
> --- a/drivers/leds/Makefile
> +++ b/drivers/leds/Makefile
> @@ -15,6 +15,7 @@ obj-$(CONFIG_LEDS_APU)			+= leds-apu.o
>   obj-$(CONFIG_LEDS_ARIEL)		+= leds-ariel.o
>   obj-$(CONFIG_LEDS_AS3645A)		+= leds-as3645a.o
>   obj-$(CONFIG_LEDS_ASIC3)		+= leds-asic3.o
> +obj-$(CONFIG_LEDS_AW2013)		+= leds-aw2013.o
>   obj-$(CONFIG_LEDS_BCM6328)		+= leds-bcm6328.o
>   obj-$(CONFIG_LEDS_BCM6358)		+= leds-bcm6358.o
>   obj-$(CONFIG_LEDS_BD2802)		+= leds-bd2802.o
> diff --git a/drivers/leds/leds-aw2013.c b/drivers/leds/leds-aw2013.c
> new file mode 100644
> index 000000000000..371f128ab562
> --- /dev/null
> +++ b/drivers/leds/leds-aw2013.c
> @@ -0,0 +1,481 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +// Driver for Awinic AW2013 3-channel LED driver
> +
> +#include <linux/i2c.h>
> +#include <linux/leds.h>
> +#include <linux/module.h>
> +#include <linux/regulator/consumer.h>
> +#include <linux/mutex.h>
> +#include <linux/of.h>
> +#include <linux/regmap.h>
> +
> +#define AW2013_MAX_LEDS 3
> +
> +/* Reset and ID register */
> +#define AW2013_RSTR 0x00
> +#define AW2013_RSTR_RESET 0x55
> +#define AW2013_RSTR_CHIP_ID 0x33
> +
> +/* Global control register */
> +#define AW2013_GCR 0x01
> +#define AW2013_GCR_ENABLE BIT(0)
> +
> +/* LED channel enable register */
> +#define AW2013_LCTR 0x30
> +#define AW2013_LCTR_LE(x) BIT((x))
> +
> +/* LED channel control registers */
> +#define AW2013_LCFG(x) (0x31 + (x))
> +#define AW2013_LCFG_IMAX_MASK (BIT(0) | BIT(1)) // Should be 0-3
> +#define AW2013_LCFG_MD BIT(4)
> +#define AW2013_LCFG_FI BIT(5)
> +#define AW2013_LCFG_FO BIT(6)
> +
> +/* LED channel PWM registers */
> +#define AW2013_REG_PWM(x) (0x34 + (x))
> +
> +/* LED channel timing registers */
> +#define AW2013_LEDT0(x) (0x37 + (x) * 3)
> +#define AW2013_LEDT0_T1(x) ((x) << 4) // Should be 0-7
> +#define AW2013_LEDT0_T2(x) (x) // Should be 0-5
> +
> +#define AW2013_LEDT1(x) (0x38 + (x) * 3)
> +#define AW2013_LEDT1_T3(x) ((x) << 4) // Should be 0-7
> +#define AW2013_LEDT1_T4(x) (x) // Should be 0-7
> +
> +#define AW2013_LEDT2(x) (0x39 + (x) * 3)
> +#define AW2013_LEDT2_T0(x) ((x) << 4) // Should be 0-8
> +#define AW2013_LEDT2_REPEAT(x) (x) // Should be 0-15
> +
> +#define AW2013_REG_MAX 0x77
> +
> +#define AW2013_NAME "aw2013"
> +
> +#define AW2013_TIME_STEP 130
> +
> +#define STATE_OFF 0
> +#define STATE_KEEP 1
> +#define STATE_ON 2
> +
> +struct aw2013;
> +
> +struct aw2013_led {
> +	struct aw2013 *chip;
> +	struct fwnode_handle *fwnode;
> +	struct led_classdev cdev;
> +	u32 num;
> +	unsigned int imax;
> +	u32 default_state;

fwnode and default_state are only needed in probe() so it is suboptimal
to keep them afterwards. You could avoid that if you did DT parsing
and LED registration in one function in the same iteration step.

You can compare other LED drivers following this convention, they
usually name related functions "*probe_dt()".

> +};
> +
> +struct aw2013 {
> +	struct mutex mutex; /* held when writing to registers */
> +	struct regulator *vcc_regulator;
> +	struct i2c_client *client;
> +	struct aw2013_led leds[AW2013_MAX_LEDS];
> +	struct regmap *regmap;
> +	int num_leds;
> +	bool enabled;
> +};
> +
> +static int aw2013_chip_init(struct aw2013 *chip)
> +{
> +	int i, ret;
> +
> +	ret = regmap_write(chip->regmap, AW2013_GCR, AW2013_GCR_ENABLE);
> +	if (ret) {
> +		dev_err(&chip->client->dev, "Failed to enable the chip: %d\n",
> +			ret);
> +		goto error;
> +	}
> +
> +	for (i = 0; i < chip->num_leds; i++) {
> +		ret = regmap_update_bits(chip->regmap,
> +					 AW2013_LCFG(chip->leds[i].num),
> +					 AW2013_LCFG_IMAX_MASK,
> +					 chip->leds[i].imax);
> +		if (ret) {
> +			dev_err(&chip->client->dev,
> +				"Failed to set maximum current for led %d: %d\n",
> +				chip->leds[i].num, ret);
> +			goto error;
> +		}
> +	}
> +
> +error:
> +	return ret;
> +}
> +
> +static void aw2013_chip_disable(struct aw2013 *chip)
> +{
> +	int ret;
> +
> +	if (!chip->enabled)
> +		return;
> +
> +	regmap_write(chip->regmap, AW2013_GCR, 0);
> +
> +	ret = regulator_disable(chip->vcc_regulator);
> +	if (ret) {
> +		dev_err(&chip->client->dev,
> +			"Failed to disable regulator: %d\n", ret);
> +		return;
> +	}
> +
> +	chip->enabled = false;
> +}
> +
> +static int aw2013_chip_enable(struct aw2013 *chip)
> +{
> +	int ret;
> +
> +	if (chip->enabled)
> +		return 0;
> +
> +	ret = regulator_enable(chip->vcc_regulator);
> +	if (ret) {
> +		dev_err(&chip->client->dev,
> +			"Failed to enable regulator: %d\n", ret);
> +		return ret;
> +	}
> +	chip->enabled = true;
> +
> +	ret = aw2013_chip_init(chip);
> +	if (ret)
> +		aw2013_chip_disable(chip);
> +
> +	return ret;
> +}
> +
> +static bool aw2013_chip_in_use(struct aw2013 *chip)
> +{
> +	int i;
> +
> +	for (i = 0; i < chip->num_leds; i++)
> +		if (chip->leds[i].cdev.brightness)
> +			return true;
> +
> +	return false;
> +}
> +
> +static int aw2013_brightness_set(struct led_classdev *cdev,
> +				 enum led_brightness brightness)
> +{
> +	struct aw2013_led *led = container_of(cdev, struct aw2013_led, cdev);
> +	int ret, num;
> +
> +	mutex_lock(&led->chip->mutex);
> +
> +	if (aw2013_chip_in_use(led->chip)) {
> +		ret = aw2013_chip_enable(led->chip);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	num = led->num;
> +
> +	ret = regmap_write(led->chip->regmap, AW2013_REG_PWM(num), brightness);
> +	if (ret)
> +		goto error;
> +
> +	if (brightness) {
> +		ret = regmap_update_bits(led->chip->regmap, AW2013_LCTR,
> +					 AW2013_LCTR_LE(num), 0xFF);
> +	} else {
> +		ret = regmap_update_bits(led->chip->regmap, AW2013_LCTR,
> +					 AW2013_LCTR_LE(num), 0);
> +		if (ret)
> +			goto error;
> +		ret = regmap_update_bits(led->chip->regmap, AW2013_LCFG(num),
> +					 AW2013_LCFG_MD, 0);
> +	}
> +	if (ret)
> +		goto error;
> +
> +	if (!aw2013_chip_in_use(led->chip))
> +		aw2013_chip_disable(led->chip);
> +
> +error:
> +	mutex_unlock(&led->chip->mutex);
> +
> +	return ret;
> +}
> +
> +static int aw2013_blink_set(struct led_classdev *cdev,
> +			    unsigned long *delay_on, unsigned long *delay_off)
> +{
> +	struct aw2013_led *led = container_of(cdev, struct aw2013_led, cdev);
> +	int ret, num = led->num;
> +	unsigned long off = 0, on = 0;
> +
> +	/* If no blink specified, default to 1 Hz. */
> +	if (!*delay_off && !*delay_on) {
> +		*delay_off = 500;
> +		*delay_on = 500;
> +	}
> +
> +	/* Never on - just set to off */
> +	if (!*delay_on)
> +		return aw2013_brightness_set(&led->cdev, LED_OFF);
> +
> +	/* Never off - just set to brightness */
> +	if (!*delay_off)
> +		return aw2013_brightness_set(&led->cdev, led->cdev.brightness);
> +
> +	if (!led->cdev.brightness) {
> +		led->cdev.brightness = LED_FULL;
> +		ret = aw2013_brightness_set(&led->cdev, led->cdev.brightness);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	/* Convert into values the HW will understand. */
> +	off = min(5, ilog2((*delay_off - 1) / AW2013_TIME_STEP) + 1);
> +	on = min(7, ilog2((*delay_on - 1) / AW2013_TIME_STEP) + 1);
> +
> +	*delay_off = BIT(off) * AW2013_TIME_STEP;
> +	*delay_on = BIT(on) * AW2013_TIME_STEP;
> +
> +	mutex_lock(&led->chip->mutex);
> +
> +	/* Set timings */
> +	ret = regmap_write(led->chip->regmap,
> +			   AW2013_LEDT0(num), AW2013_LEDT0_T2(on));
> +	if (ret)
> +		goto error;
> +	ret = regmap_write(led->chip->regmap,
> +			   AW2013_LEDT1(num), AW2013_LEDT1_T4(off));
> +	if (ret)
> +		goto error;
> +
> +	/* Finally, enable the LED */
> +	ret = regmap_update_bits(led->chip->regmap, AW2013_LCFG(num),
> +				 AW2013_LCFG_MD, 0xFF);
> +	if (ret)
> +		goto error;
> +
> +	ret = regmap_update_bits(led->chip->regmap, AW2013_LCTR,
> +				 AW2013_LCTR_LE(num), 0xFF);
> +
> +error:
> +	mutex_unlock(&led->chip->mutex);
> +
> +	return ret;
> +}
> +
> +static int aw2013_dt_init(struct i2c_client *client,
> +			  struct aw2013 *chip)
> +{
> +	struct device_node *np = client->dev.of_node, *child;
> +	int count, ret;
> +	int i = 0;
> +	const char *str;
> +	struct aw2013_led *led;
> +
> +	count = of_get_child_count(np);
> +	if (!count || count > AW2013_MAX_LEDS)
> +		return -EINVAL;
> +
> +	for_each_available_child_of_node(np, child) {
> +		u32 source;
> +		u32 imax;
> +
> +		ret = of_property_read_u32(child, "reg", &source);
> +		if (ret != 0 || source >= AW2013_MAX_LEDS) {
> +			dev_err(&client->dev,
> +				"Couldn't read LED address: %d\n", ret);
> +			count--;
> +			continue;
> +		}
> +
> +		led = &chip->leds[i];
> +
> +		if (!of_property_read_u32(child, "led-max-microamp", &imax)) {
> +			led->imax = min_t(u32, imax / 5000, 3);
> +		} else {
> +			led->imax = 1; // 5mA
> +			dev_info(&client->dev,
> +				 "DT property led-max-microamp is missing!\n");
> +		}
> +
> +		led->num = source;
> +		led->chip = chip;
> +		led->fwnode = of_fwnode_handle(child);
> +
> +		if (!of_property_read_string(child, "default-state", &str)) {
> +			if (!strcmp(str, "on"))
> +				led->default_state = STATE_ON;
> +			else if (!strcmp(str, "keep"))
> +				led->default_state = STATE_KEEP;
> +			else
> +				led->default_state = STATE_OFF;
> +		}
> +
> +		of_property_read_string(child, "linux,default-trigger",
> +					&led->cdev.default_trigger);
> +
> +		i++;
> +	}
> +
> +	if (!count)
> +		return -EINVAL;
> +
> +	chip->num_leds = i;
> +
> +	return 0;
> +}
> +
> +static const struct regmap_config aw2013_regmap_config = {
> +	.reg_bits = 8,
> +	.val_bits = 8,
> +	.max_register = AW2013_REG_MAX,
> +};
> +
> +static void aw2013_read_current_state(struct aw2013 *chip)
> +{
> +	int i, led_on;
> +
> +	regmap_read(chip->regmap, AW2013_LCTR, &led_on);
> +
> +	for (i = 0; i < chip->num_leds; i++) {
> +		if (!(led_on & AW2013_LCTR_LE(chip->leds[i].num))) {
> +			chip->leds[i].cdev.brightness = LED_OFF;
> +			continue;
> +		}
> +		regmap_read(chip->regmap, AW2013_REG_PWM(chip->leds[i].num),
> +			    &chip->leds[i].cdev.brightness);
> +	}
> +}
> +
> +static void aw2013_init_default_state(struct aw2013_led *led)
> +{
> +	switch (led->default_state) {
> +	case STATE_ON:
> +		led->cdev.brightness = LED_FULL;
> +		break;
> +	case STATE_OFF:
> +		led->cdev.brightness = LED_OFF;
> +	} /* On keep - just set brightness that was retrieved previously */
> +
> +	aw2013_brightness_set(&led->cdev, led->cdev.brightness);
> +}
> +
> +static int aw2013_probe(struct i2c_client *client)
> +{
> +	struct aw2013 *chip;
> +	int i, ret;
> +	unsigned int chipid;
> +
> +	chip = devm_kzalloc(&client->dev, sizeof(*chip), GFP_KERNEL);
> +	if (!chip)
> +		return -ENOMEM;
> +
> +	ret = aw2013_dt_init(client, chip);
> +	if (ret < 0)
> +		return ret;
> +
> +	mutex_init(&chip->mutex);
> +	chip->client = client;
> +	i2c_set_clientdata(client, chip);
> +
> +	chip->regmap = devm_regmap_init_i2c(client, &aw2013_regmap_config);
> +	if (IS_ERR(chip->regmap)) {
> +		ret = PTR_ERR(chip->regmap);
> +		dev_err(&client->dev, "Failed to allocate register map: %d\n",
> +			ret);
> +		goto error;
> +	}
> +
> +	chip->vcc_regulator = devm_regulator_get(&client->dev, "vcc");
> +	ret = PTR_ERR_OR_ZERO(chip->vcc_regulator);
> +	if (ret) {
> +		if (ret != -EPROBE_DEFER)
> +			dev_err(&client->dev,
> +				"Failed to request regulator: %d\n", ret);
> +		goto error;
> +	}
> +
> +	ret = regulator_enable(chip->vcc_regulator);
> +	if (ret) {
> +		dev_err(&client->dev,
> +			"Failed to enable regulator: %d\n", ret);
> +		goto error;
> +	}
> +	chip->enabled = true;
> +
> +	ret = regmap_read(chip->regmap, AW2013_RSTR, &chipid);
> +	if (ret) {
> +		dev_err(&client->dev, "Failed to read chip ID: %d\n",
> +			ret);
> +		goto error;
> +	}
> +
> +	if (chipid != AW2013_RSTR_CHIP_ID) {
> +		dev_err(&client->dev, "Chip reported wrong ID: %x\n",
> +			chipid);
> +		ret = -ENODEV;
> +		goto error;
> +	}
> +
> +	ret = aw2013_chip_init(chip);
> +	if (ret)
> +		goto error;
> +
> +	aw2013_read_current_state(chip);
> +
> +	for (i = 0; i < chip->num_leds; i++) {
> +		struct led_init_data init_data = {};
> +
> +		aw2013_init_default_state(&chip->leds[i]);
> +
> +		chip->leds[i].cdev.brightness_set_blocking =
> +			aw2013_brightness_set;
> +		chip->leds[i].cdev.blink_set = aw2013_blink_set;
> +
> +		init_data.fwnode = chip->leds[i].fwnode;
> +		init_data.devicename = AW2013_NAME;
> +		init_data.default_label = ":";

Please drop two above lines, they are needed only when converting
old drivers to the new LED registration API.

> +
> +		ret = devm_led_classdev_register_ext(&client->dev,
> +						     &chip->leds[i].cdev,
> +						     &init_data);
> +		if (ret < 0)
> +			goto error;
> +	}
> +	return 0;
> +
> +error:
> +	mutex_destroy(&chip->mutex);
> +	return ret;
> +}
> +
> +static int aw2013_remove(struct i2c_client *client)
> +{
> +	struct aw2013 *chip = i2c_get_clientdata(client);
> +
> +	mutex_destroy(&chip->mutex);
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id aw2013_match_table[] = {
> +	{ .compatible = "awinic,aw2013", },
> +	{ /* sentinel */ },
> +};
> +
> +MODULE_DEVICE_TABLE(of, aw2013_match_table);
> +
> +static struct i2c_driver aw2013_driver = {
> +	.driver = {
> +		.name = "leds-aw2013",
> +		.of_match_table = of_match_ptr(aw2013_match_table),
> +	},
> +	.probe_new = aw2013_probe,
> +	.remove = aw2013_remove,
> +};
> +
> +module_i2c_driver(aw2013_driver);
> +
> +MODULE_AUTHOR("Nikita Travkin <nikitos.tr@gmail.com>");
> +MODULE_DESCRIPTION("AW2013 LED driver");
> +MODULE_LICENSE("GPL v2");
> 

-- 
Best regards,
Jacek Anaszewski
