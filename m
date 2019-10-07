Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7B215CE1C6
	for <lists+linux-leds@lfdr.de>; Mon,  7 Oct 2019 14:33:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727793AbfJGMd0 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 7 Oct 2019 08:33:26 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:36348 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727789AbfJGMd0 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 7 Oct 2019 08:33:26 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x97CXKkg026980;
        Mon, 7 Oct 2019 07:33:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1570451600;
        bh=orB4Mt40ggPITyEUfzhbhBT5Za8iHXundC/FxfCuCrI=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=cQshZ2d80zjYiGr0EOEc6kGwHZ8LosOKevfIos/zRbEbGQ385bVnFPU4PIhfEdcYh
         cemLqKOnraPsFxZJllghES9e9tw/Lo4nMad5lm0xAgRUSZdnclr7qDblgdFM5J3Hg1
         ngUAta5GmYTrc0iycZimtCSUQw9TQn+V1d/cBLcM=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x97CXKlW075007
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 7 Oct 2019 07:33:20 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 7 Oct
 2019 07:33:17 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 7 Oct 2019 07:33:19 -0500
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x97CXJMH114580;
        Mon, 7 Oct 2019 07:33:19 -0500
Subject: Re: [PATCH v10 06/16] leds: lp50xx: Add the LP50XX family of the RGB
 LED driver
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20191001145620.11123-1-dmurphy@ti.com>
 <20191001145620.11123-7-dmurphy@ti.com>
 <d674fcb2-922e-7801-a3a1-ee86f571eb64@gmail.com>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <2395f219-ce2f-6809-a082-035f5f1a8a6b@ti.com>
Date:   Mon, 7 Oct 2019 07:35:57 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <d674fcb2-922e-7801-a3a1-ee86f571eb64@gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Jacek

On 10/6/19 11:12 AM, Jacek Anaszewski wrote:
> Dan,
>
> On 10/1/19 4:56 PM, Dan Murphy wrote:
>> Introduce the LP5036/30/24/18/12/9 RGB LED driver.
>> The difference in these parts are the number of
>> LED outputs where the:
>>
>> LP5036 can control 36 LEDs
>> LP5030 can control 30 LEDs
>> LP5024 can control 24 LEDs
>> LP5018 can control 18 LEDs
>> LP5012 can control 12 LEDs
>> LP5009 can control 9 LEDs
>>
>> The device has the ability to group LED output into control banks
>> so that multiple LED banks can be controlled with the same mixing and
>> brightness.  Inversely the LEDs can also be controlled independently.
>>
>> Signed-off-by: Dan Murphy <dmurphy@ti.com>
>> ---
>>   drivers/leds/Kconfig       |  11 +
>>   drivers/leds/Makefile      |   1 +
>>   drivers/leds/leds-lp50xx.c | 784 +++++++++++++++++++++++++++++++++++++
>>   3 files changed, 796 insertions(+)
>>   create mode 100644 drivers/leds/leds-lp50xx.c
>>
>> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
>> index cfb1ebb6517f..84f60e35c5ee 100644
>> --- a/drivers/leds/Kconfig
>> +++ b/drivers/leds/Kconfig
>> @@ -363,6 +363,17 @@ config LEDS_LP3952
>>   	  To compile this driver as a module, choose M here: the
>>   	  module will be called leds-lp3952.
>>   
>> +config LEDS_LP50XX
>> +	tristate "LED Support for TI LP5036/30/24/18/12/9 LED driver chip"
>> +	depends on LEDS_CLASS && REGMAP_I2C
>> +	depends on LEDS_CLASS_MULTI_COLOR
>> +	help
>> +	  If you say yes here you get support for the Texas Instruments
>> +	  LP5036, LP5030, LP5024, LP5018, LP5012 and LP5009 LED driver.
>> +
>> +	  To compile this driver as a module, choose M here: the
>> +	  module will be called leds-lp50xx.
>> +
>>   config LEDS_LP55XX_COMMON
>>   	tristate "Common Driver for TI/National LP5521/5523/55231/5562/8501"
>>   	depends on LEDS_LP5521 || LEDS_LP5523 || LEDS_LP5562 || LEDS_LP8501
>> diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
>> index 841038cfe35b..7a208a0f7b84 100644
>> --- a/drivers/leds/Makefile
>> +++ b/drivers/leds/Makefile
>> @@ -34,6 +34,7 @@ obj-$(CONFIG_LEDS_GPIO_REGISTER)	+= leds-gpio-register.o
>>   obj-$(CONFIG_LEDS_GPIO)			+= leds-gpio.o
>>   obj-$(CONFIG_LEDS_LP3944)		+= leds-lp3944.o
>>   obj-$(CONFIG_LEDS_LP3952)		+= leds-lp3952.o
>> +obj-$(CONFIG_LEDS_LP50XX)		+= leds-lp50xx.o
>>   obj-$(CONFIG_LEDS_LP55XX_COMMON)	+= leds-lp55xx-common.o
>>   obj-$(CONFIG_LEDS_LP5521)		+= leds-lp5521.o
>>   obj-$(CONFIG_LEDS_LP5523)		+= leds-lp5523.o
>> diff --git a/drivers/leds/leds-lp50xx.c b/drivers/leds/leds-lp50xx.c
> [...]
>> +static int lp50xx_probe_dt(struct lp50xx *priv)
>> +{
>> +	u32 led_banks[LP5036_MAX_LED_MODULES];
>> +	struct fwnode_handle *child = NULL;
>> +	struct fwnode_handle *led_node = NULL;
>> +	struct led_init_data init_data;
>> +	struct lp50xx_led *led;
>> +	int num_colors;
>> +	u32 color_id;
>> +	int led_number;
>> +	size_t i = 0;
>> +	int ret;
>> +
>> +	priv->enable_gpio = devm_gpiod_get_optional(&priv->client->dev,
>> +						   "enable", GPIOD_OUT_LOW);
>> +	if (IS_ERR(priv->enable_gpio)) {
>> +		ret = PTR_ERR(priv->enable_gpio);
>> +		dev_err(&priv->client->dev, "Failed to get enable gpio: %d\n",
>> +			ret);
>> +		return ret;
>> +	}
>> +
>> +	priv->regulator = devm_regulator_get(&priv->client->dev, "vled");
>> +	if (IS_ERR(priv->regulator))
>> +		priv->regulator = NULL;
>> +
>> +	device_for_each_child_node(&priv->client->dev, child) {
>> +		led = &priv->leds[i];
>> +		if (fwnode_property_present(child, "ti,led-bank")) {
>> +			ret = fwnode_property_read_u32_array(child,
>> +							     "ti,led-bank",
>> +							     NULL, 0);
>> +			ret = fwnode_property_read_u32_array(child,
>> +							     "ti,led-bank",
>> +							     led_banks,
>> +							     ret);
> You could check if bank numbers are within a range.

Ack


>
>> +			if (ret) {
>> +				dev_err(&priv->client->dev,
>> +					"led-bank property is missing\n");
>> +				fwnode_handle_put(child);
>> +				goto child_out;
>> +			}
>> +
>> +			priv->num_of_banked_leds = ARRAY_SIZE(led_banks);
>> +
>> +			ret = lp50xx_set_banks(priv, led_banks);
>> +			if (ret) {
>> +				dev_err(&priv->client->dev,
>> +					"Cannot setup banked LEDs\n");
>> +				fwnode_handle_put(child);
>> +				goto child_out;
>> +			}
>> +			led->ctrl_bank_enabled = 1;
>> +
>> +		} else {
>> +			ret = fwnode_property_read_u32(child, "reg",
>> +					       &led_number);
> The same applies to the led_number.

NACK to this.  This is checked below.  But I should probably move that 
check up into the else case.

Dan


>
>> +			if (ret) {
>> +				dev_err(&priv->client->dev,
>> +					"led reg property missing\n");
>> +				fwnode_handle_put(child);
>> +				goto child_out;
>> +			}
>> +
>> +			led->led_number = led_number;
>> +		}
