Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9E0B7BBAC2
	for <lists+linux-leds@lfdr.de>; Mon, 23 Sep 2019 19:52:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2440247AbfIWRwj (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 23 Sep 2019 13:52:39 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:43470 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2440205AbfIWRwj (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 23 Sep 2019 13:52:39 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8NHqW6A023946;
        Mon, 23 Sep 2019 12:52:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1569261152;
        bh=pTT6+T51M3bQC6BPOViNywhI9h2CrxF+9XPU1PCqnJk=;
        h=From:Subject:To:CC:References:Date:In-Reply-To;
        b=m/CLklx8xFvVfPuqTCM8mrWtYmwT9FkFrWCUs/ltvfETDRGJm7ASweQNvNVA1ifMH
         ZjP16rLjrdnGLmwFCZTMvBs7oX/isQ1ycb5xurY6dToPqti0qyY5Ebdc9aSumgUs/Q
         4h0ZqF+5OgrNYno2eCcRxHIeUdjfYQ6XrXqVfTeg=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8NHqWJY018994;
        Mon, 23 Sep 2019 12:52:32 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 23
 Sep 2019 12:52:31 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 23 Sep 2019 12:52:25 -0500
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8NHqVCo085319;
        Mon, 23 Sep 2019 12:52:31 -0500
From:   Dan Murphy <dmurphy@ti.com>
Subject: Re: [PATCH v8 8/9] leds: lp50xx: Add the LP50XX family of the RGB LED
 driver
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20190920174139.30079-1-dmurphy@ti.com>
 <20190920174139.30079-9-dmurphy@ti.com>
 <b6a09f76-3663-9bce-e009-24e31940517e@gmail.com>
Message-ID: <c063774f-9397-31ae-4ca8-24d50114296e@ti.com>
Date:   Mon, 23 Sep 2019 12:56:59 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <b6a09f76-3663-9bce-e009-24e31940517e@gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Jacek

On 9/21/19 10:11 AM, Jacek Anaszewski wrote:
> Dan,
>
> On 9/20/19 7:41 PM, Dan Murphy wrote:
>> Introduce the LP5036/30/24/18/12/9 RGB LED driver.
>> The difference in these parts are the number of
>> LED outputs where the:
>>
>> LP5036 can control 36 LEDs
>> LP5030 can control 30 LEDs
>> LP5024 can control 24 LEDs
>> LP5018 can control 18 LEDs
>> LP5012 can control 12 LEDs
>> LP509 can control 9 LEDs
>>
>> The device has the ability to group LED output into control banks
>> so that multiple LED banks can be controlled with the same mixing and
>> brightness.  Inversely the LEDs can also be controlled independently.
>>
>> Signed-off-by: Dan Murphy<dmurphy@ti.com>
>> ---
>>   drivers/leds/Kconfig       |   7 +
>>   drivers/leds/Makefile      |   1 +
>>   drivers/leds/leds-lp50xx.c | 785 +++++++++++++++++++++++++++++++++++++
>>   3 files changed, 793 insertions(+)
>>   create mode 100644 drivers/leds/leds-lp50xx.c
>>
>> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
>> index cfb1ebb6517f..1c0cacb100e6 100644
>> --- a/drivers/leds/Kconfig
>> +++ b/drivers/leds/Kconfig
>> @@ -363,6 +363,13 @@ config LEDS_LP3952
>>   	  To compile this driver as a module, choose M here: the
>>   	  module will be called leds-lp3952.
>>   
>> +config LEDS_LP50XX
>> +	tristate "LED Support for TI LP5036/30/24/18 LED driver chip"
>> +	depends on LEDS_CLASS && REGMAP_I2C
> && OF

Not sure why I would add that since we are using fw_node calls not 
of_property calls.

The fw_node calls are built in as default kernel so these should always 
be available.

Unless this is a led_class has a dependency


>> +	help
>> +	  If you say yes here you get support for the Texas Instruments
>> +	  LP5036, LP5030, LP5024 and LP5018 LED driver.
> Please add also this standard sentence for a module.

Ack

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
>> new file mode 100644
>> index 000000000000..3ddc14f53eae
>> --- /dev/null
>> +++ b/drivers/leds/leds-lp50xx.c
>> @@ -0,0 +1,785 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +// TI LP50XX LED chip family driver
>> +// Copyright (C) 2018 Texas Instruments Incorporated -http://www.ti.com/
>> +
>> +#include <linux/gpio/consumer.h>
>> +#include <linux/i2c.h>
>> +#include <linux/init.h>
>> +#include <linux/leds.h>
>> +#include <linux/module.h>
>> +#include <linux/mutex.h>
>> +#include <linux/of.h>
>> +#include <linux/of_gpio.h>
>> +#include <linux/regmap.h>
>> +#include <linux/regulator/consumer.h>
>> +#include <linux/slab.h>
>> +#include <uapi/linux/uleds.h>
>> +
>> +#include <linux/led-class-multicolor.h>
>> +
>> +#define LP50XX_DEV_CFG0		0x00
>> +#define LP50XX_DEV_CFG1		0x01
>> +#define LP50XX_LED_CFG0		0x02
>> +
>> +/* LP5009 and LP5012 registers */
>> +#define LP5012_BNK_BRT		0x03
>> +#define LP5012_BNKA_CLR		0x04
>> +#define LP5012_BNKB_CLR		0x05
>> +#define LP5012_BNKC_CLR		0x06
>> +#define LP5012_LED0_BRT		0x07
>> +#define LP5012_LED1_BRT		0x08
>> +#define LP5012_LED2_BRT		0x09
>> +#define LP5012_LED3_BRT		0x0a
>> +#define LP5012_OUT0_CLR		0x0b
>> +#define LP5012_OUT1_CLR		0x0c
>> +#define LP5012_OUT2_CLR		0x0d
>> +#define LP5012_OUT3_CLR		0x0e
>> +#define LP5012_OUT4_CLR		0x0f
>> +#define LP5012_OUT5_CLR		0x10
>> +#define LP5012_OUT6_CLR		0x11
>> +#define LP5012_OUT7_CLR		0x12
>> +#define LP5012_OUT8_CLR		0x13
>> +#define LP5012_OUT9_CLR		0x14
>> +#define LP5012_OUT10_CLR	0x15
>> +#define LP5012_OUT11_CLR	0x16
>> +#define LP5012_RESET		0x17
>> +
>> +/* LP5018 and LP5024 registers */
>> +#define LP5024_BNK_BRT		0x03
>> +#define LP5024_BNKA_CLR		0x04
>> +#define LP5024_BNKB_CLR		0x05
>> +#define LP5024_BNKC_CLR		0x06
>> +#define LP5024_LED0_BRT		0x07
>> +#define LP5024_LED1_BRT		0x08
>> +#define LP5024_LED2_BRT		0x09
>> +#define LP5024_LED3_BRT		0x0a
>> +#define LP5024_LED4_BRT		0x0b
>> +#define LP5024_LED5_BRT		0x0c
>> +#define LP5024_LED6_BRT		0x0d
>> +#define LP5024_LED7_BRT		0x0e
>> +
>> +#define LP5024_OUT0_CLR		0x0f
>> +#define LP5024_OUT1_CLR		0x10
>> +#define LP5024_OUT2_CLR		0x11
>> +#define LP5024_OUT3_CLR		0x12
>> +#define LP5024_OUT4_CLR		0x13
>> +#define LP5024_OUT5_CLR		0x14
>> +#define LP5024_OUT6_CLR		0x15
>> +#define LP5024_OUT7_CLR		0x16
>> +#define LP5024_OUT8_CLR		0x17
>> +#define LP5024_OUT9_CLR		0x18
>> +#define LP5024_OUT10_CLR	0x19
>> +#define LP5024_OUT11_CLR	0x1a
>> +#define LP5024_OUT12_CLR	0x1b
>> +#define LP5024_OUT13_CLR	0x1c
>> +#define LP5024_OUT14_CLR	0x1d
>> +#define LP5024_OUT15_CLR	0x1e
>> +#define LP5024_OUT16_CLR	0x1f
>> +#define LP5024_OUT17_CLR	0x20
>> +#define LP5024_OUT18_CLR	0x21
>> +#define LP5024_OUT19_CLR	0x22
>> +#define LP5024_OUT20_CLR	0x23
>> +#define LP5024_OUT21_CLR	0x24
>> +#define LP5024_OUT22_CLR	0x25
>> +#define LP5024_OUT23_CLR	0x26
>> +#define LP5024_RESET		0x27
>> +
>> +/* LP5030 and LP5036 registers */
>> +#define LP5036_LED_CFG1		0x03
>> +#define LP5036_BNK_BRT		0x04
>> +#define LP5036_BNKA_CLR		0x05
>> +#define LP5036_BNKB_CLR		0x06
>> +#define LP5036_BNKC_CLR		0x07
>> +#define LP5036_LED0_BRT		0x08
>> +#define LP5036_LED1_BRT		0x09
>> +#define LP5036_LED2_BRT		0x0a
>> +#define LP5036_LED3_BRT		0x0b
>> +#define LP5036_LED4_BRT		0x0c
>> +#define LP5036_LED5_BRT		0x0d
>> +#define LP5036_LED6_BRT		0x0e
>> +#define LP5036_LED7_BRT		0x0f
>> +#define LP5036_LED8_BRT		0x10
>> +#define LP5036_LED9_BRT		0x11
>> +#define LP5036_LED10_BRT	0x12
>> +#define LP5036_LED11_BRT	0x13
>> +
>> +#define LP5036_OUT0_CLR		0x14
>> +#define LP5036_OUT1_CLR		0x15
>> +#define LP5036_OUT2_CLR		0x16
>> +#define LP5036_OUT3_CLR		0x17
>> +#define LP5036_OUT4_CLR		0x18
>> +#define LP5036_OUT5_CLR		0x19
>> +#define LP5036_OUT6_CLR		0x1a
>> +#define LP5036_OUT7_CLR		0x1b
>> +#define LP5036_OUT8_CLR		0x1c
>> +#define LP5036_OUT9_CLR		0x1d
>> +#define LP5036_OUT10_CLR	0x1e
>> +#define LP5036_OUT11_CLR	0x1f
>> +#define LP5036_OUT12_CLR	0x20
>> +#define LP5036_OUT13_CLR	0x21
>> +#define LP5036_OUT14_CLR	0x22
>> +#define LP5036_OUT15_CLR	0x23
>> +#define LP5036_OUT16_CLR	0x24
>> +#define LP5036_OUT17_CLR	0x25
>> +#define LP5036_OUT18_CLR	0x26
>> +#define LP5036_OUT19_CLR	0x27
>> +#define LP5036_OUT20_CLR	0x28
>> +#define LP5036_OUT21_CLR	0x29
>> +#define LP5036_OUT22_CLR	0x2a
>> +#define LP5036_OUT23_CLR	0x2b
>> +#define LP5036_OUT24_CLR	0x2c
>> +#define LP5036_OUT25_CLR	0x2d
>> +#define LP5036_OUT26_CLR	0x2e
>> +#define LP5036_OUT27_CLR	0x2f
>> +#define LP5036_OUT28_CLR	0x30
>> +#define LP5036_OUT29_CLR	0x31
>> +#define LP5036_OUT30_CLR	0x32
>> +#define LP5036_OUT31_CLR	0x33
>> +#define LP5036_OUT32_CLR	0x34
>> +#define LP5036_OUT33_CLR	0x35
>> +#define LP5036_OUT34_CLR	0x36
>> +#define LP5036_OUT35_CLR	0x37
>> +#define LP5036_RESET		0x38
>> +
>> +#define LP50XX_SW_RESET		0xff
>> +#define LP50XX_CHIP_EN		BIT(6)
>> +
>> +#define LP5009_MAX_LED_MODULES	2
>> +#define LP5012_MAX_LED_MODULES	4
>> +#define LP5018_MAX_LED_MODULES	6
>> +#define LP5024_MAX_LED_MODULES	8
>> +#define LP5030_MAX_LED_MODULES	10
>> +#define LP5036_MAX_LED_MODULES	12
>> +
>> +struct lp50xx_led {
>> +	struct led_classdev led_dev;
>> +	struct led_classdev_mc mc_cdev;
>> +	struct lp50xx *priv;
>> +	unsigned long bank_modules;
>> +	int led_intensity[LED_COLOR_ID_MAX];
> This is waste of memory. There should be only three elements.

Ack


>> +	u8 ctrl_bank_enabled;
>> +	int led_number;
>> +};
>> +
>> +/**
>> + * struct lp50xx -
>> + * @enable_gpio: Hardware enable gpio
>> + * @regulator: LED supply regulator pointer
>> + * @client: Pointer to the I2C client
>> + * @regmap: Devices register map
> Device or Device's ?
device
>
>> + * @dev: Pointer to the devices device struct
>> + * @lock: Lock for reading/writing the device
>> + * @chip_info: chip specific information (ie num_leds)
>> + * @num_of_banked_leds: holds the number of banked LEDs
>> + * @leds: Array of LED strings
>> + */
>> +struct lp50xx {
>> +	struct gpio_desc *enable_gpio;
>> +	struct regulator *regulator;
>> +	struct i2c_client *client;
>> +	struct regmap *regmap;
>> +	struct device *dev;
>> +	struct mutex lock;
>> +	const struct lp50xx_chip_info *chip_info;
>> +	int num_of_banked_leds;
>> +
>> +	/* This needs to be at the end of the struct */
>> +	struct lp50xx_led leds[];
>> +};
>> +
>> +static const struct reg_default lp5012_reg_defs[] = {
>> +	{LP50XX_DEV_CFG0, 0x0},
>> +	{LP50XX_DEV_CFG1, 0x3c},
>> +	{LP50XX_LED_CFG0, 0x0},
>> +	{LP5012_BNK_BRT, 0xff},
>> +	{LP5012_BNKA_CLR, 0x0f},
>> +	{LP5012_BNKB_CLR, 0x0f},
>> +	{LP5012_BNKC_CLR, 0x0f},
>> +	{LP5012_LED0_BRT, 0x0f},
>> +	{LP5012_LED1_BRT, 0xff},
>> +	{LP5012_LED2_BRT, 0xff},
>> +	{LP5012_LED3_BRT, 0xff},
>> +	{LP5012_OUT0_CLR, 0x0f},
>> +	{LP5012_OUT1_CLR, 0x00},
>> +	{LP5012_OUT2_CLR, 0x00},
>> +	{LP5012_OUT3_CLR, 0x00},
>> +	{LP5012_OUT4_CLR, 0x00},
>> +	{LP5012_OUT5_CLR, 0x00},
>> +	{LP5012_OUT6_CLR, 0x00},
>> +	{LP5012_OUT7_CLR, 0x00},
>> +	{LP5012_OUT8_CLR, 0x00},
>> +	{LP5012_OUT9_CLR, 0x00},
>> +	{LP5012_OUT10_CLR, 0x00},
>> +	{LP5012_OUT11_CLR, 0x00},
>> +	{LP5012_RESET, 0x00}
>> +};
>> +
>> +static const struct reg_default lp5024_reg_defs[] = {
>> +	{LP50XX_DEV_CFG0, 0x0},
>> +	{LP50XX_DEV_CFG1, 0x3c},
>> +	{LP50XX_LED_CFG0, 0x0},
>> +	{LP5024_BNK_BRT, 0xff},
>> +	{LP5024_BNKA_CLR, 0x0f},
>> +	{LP5024_BNKB_CLR, 0x0f},
>> +	{LP5024_BNKC_CLR, 0x0f},
>> +	{LP5024_LED0_BRT, 0x0f},
>> +	{LP5024_LED1_BRT, 0xff},
>> +	{LP5024_LED2_BRT, 0xff},
>> +	{LP5024_LED3_BRT, 0xff},
>> +	{LP5024_LED4_BRT, 0xff},
>> +	{LP5024_LED5_BRT, 0xff},
>> +	{LP5024_LED6_BRT, 0xff},
>> +	{LP5024_LED7_BRT, 0xff},
>> +	{LP5024_OUT0_CLR, 0x0f},
>> +	{LP5024_OUT1_CLR, 0x00},
>> +	{LP5024_OUT2_CLR, 0x00},
>> +	{LP5024_OUT3_CLR, 0x00},
>> +	{LP5024_OUT4_CLR, 0x00},
>> +	{LP5024_OUT5_CLR, 0x00},
>> +	{LP5024_OUT6_CLR, 0x00},
>> +	{LP5024_OUT7_CLR, 0x00},
>> +	{LP5024_OUT8_CLR, 0x00},
>> +	{LP5024_OUT9_CLR, 0x00},
>> +	{LP5024_OUT10_CLR, 0x00},
>> +	{LP5024_OUT11_CLR, 0x00},
>> +	{LP5024_OUT12_CLR, 0x00},
>> +	{LP5024_OUT13_CLR, 0x00},
>> +	{LP5024_OUT14_CLR, 0x00},
>> +	{LP5024_OUT15_CLR, 0x00},
>> +	{LP5024_OUT16_CLR, 0x00},
>> +	{LP5024_OUT17_CLR, 0x00},
>> +	{LP5024_OUT18_CLR, 0x00},
>> +	{LP5024_OUT19_CLR, 0x00},
>> +	{LP5024_OUT20_CLR, 0x00},
>> +	{LP5024_OUT21_CLR, 0x00},
>> +	{LP5024_OUT22_CLR, 0x00},
>> +	{LP5024_OUT23_CLR, 0x00},
>> +	{LP5024_RESET, 0x00}
>> +};
>> +
>> +static const struct reg_default lp5036_reg_defs[] = {
>> +	{LP50XX_DEV_CFG0, 0x0},
>> +	{LP50XX_DEV_CFG1, 0x3c},
>> +	{LP50XX_LED_CFG0, 0x0},
>> +	{LP5036_LED_CFG1, 0x0},
>> +	{LP5036_BNK_BRT, 0xff},
>> +	{LP5036_BNKA_CLR, 0x0f},
>> +	{LP5036_BNKB_CLR, 0x0f},
>> +	{LP5036_BNKC_CLR, 0x0f},
>> +	{LP5036_LED0_BRT, 0x0f},
>> +	{LP5036_LED1_BRT, 0xff},
>> +	{LP5036_LED2_BRT, 0xff},
>> +	{LP5036_LED3_BRT, 0xff},
>> +	{LP5036_LED4_BRT, 0xff},
>> +	{LP5036_LED5_BRT, 0xff},
>> +	{LP5036_LED6_BRT, 0xff},
>> +	{LP5036_LED7_BRT, 0xff},
>> +	{LP5036_OUT0_CLR, 0x0f},
>> +	{LP5036_OUT1_CLR, 0x00},
>> +	{LP5036_OUT2_CLR, 0x00},
>> +	{LP5036_OUT3_CLR, 0x00},
>> +	{LP5036_OUT4_CLR, 0x00},
>> +	{LP5036_OUT5_CLR, 0x00},
>> +	{LP5036_OUT6_CLR, 0x00},
>> +	{LP5036_OUT7_CLR, 0x00},
>> +	{LP5036_OUT8_CLR, 0x00},
>> +	{LP5036_OUT9_CLR, 0x00},
>> +	{LP5036_OUT10_CLR, 0x00},
>> +	{LP5036_OUT11_CLR, 0x00},
>> +	{LP5036_OUT12_CLR, 0x00},
>> +	{LP5036_OUT13_CLR, 0x00},
>> +	{LP5036_OUT14_CLR, 0x00},
>> +	{LP5036_OUT15_CLR, 0x00},
>> +	{LP5036_OUT16_CLR, 0x00},
>> +	{LP5036_OUT17_CLR, 0x00},
>> +	{LP5036_OUT18_CLR, 0x00},
>> +	{LP5036_OUT19_CLR, 0x00},
>> +	{LP5036_OUT20_CLR, 0x00},
>> +	{LP5036_OUT21_CLR, 0x00},
>> +	{LP5036_OUT22_CLR, 0x00},
>> +	{LP5036_OUT23_CLR, 0x00},
>> +	{LP5036_OUT24_CLR, 0x00},
>> +	{LP5036_OUT25_CLR, 0x00},
>> +	{LP5036_OUT26_CLR, 0x00},
>> +	{LP5036_OUT27_CLR, 0x00},
>> +	{LP5036_OUT28_CLR, 0x00},
>> +	{LP5036_OUT29_CLR, 0x00},
>> +	{LP5036_OUT30_CLR, 0x00},
>> +	{LP5036_OUT31_CLR, 0x00},
>> +	{LP5036_OUT32_CLR, 0x00},
>> +	{LP5036_OUT33_CLR, 0x00},
>> +	{LP5036_OUT34_CLR, 0x00},
>> +	{LP5036_OUT35_CLR, 0x00},
>> +	{LP5036_RESET, 0x00}
>> +};
>> +
>> +static const struct regmap_config lp5012_regmap_config = {
>> +	.reg_bits = 8,
>> +	.val_bits = 8,
>> +
>> +	.max_register = LP5012_RESET,
>> +	.reg_defaults = lp5012_reg_defs,
>> +	.num_reg_defaults = ARRAY_SIZE(lp5012_reg_defs),
>> +	.cache_type = REGCACHE_RBTREE,
>> +};
>> +
>> +static const struct regmap_config lp5024_regmap_config = {
>> +	.reg_bits = 8,
>> +	.val_bits = 8,
>> +
>> +	.max_register = LP5024_RESET,
>> +	.reg_defaults = lp5024_reg_defs,
>> +	.num_reg_defaults = ARRAY_SIZE(lp5024_reg_defs),
>> +	.cache_type = REGCACHE_RBTREE,
>> +};
>> +
>> +static const struct regmap_config lp5036_regmap_config = {
>> +	.reg_bits = 8,
>> +	.val_bits = 8,
>> +
>> +	.max_register = LP5036_RESET,
>> +	.reg_defaults = lp5036_reg_defs,
>> +	.num_reg_defaults = ARRAY_SIZE(lp5036_reg_defs),
>> +	.cache_type = REGCACHE_RBTREE,
>> +};
>> +
>> +enum lp50xx_model {
>> +	LP5009,
>> +	LP5012,
>> +	LP5018,
>> +	LP5024,
>> +	LP5030,
>> +	LP5036,
>> +};
>> +
>> +/*
>> + * struct lp50xx_chip_info -
>> + * @num_leds: number of LED outputs available on the device
>> + * @led_brightness0_reg: first brightness register of the device
>> + * @mix_out0_reg: first color mix register of the device
>> + * @bank_brt_reg: bank brightness register
>> + * @bank_mix_reg: color mix register
>> + * @reset_reg: devices reset register
> s/devices/device/
>
> Please be consequent: I prefer starting the property description
> always with lower case.

Ack


>> + */
>> +struct lp50xx_chip_info {
>> +	struct regmap_config lp50xx_regmap_config;
>> +	u8 num_leds;
>> +	u8 led_brightness0_reg;
>> +	u8 mix_out0_reg;
>> +	u8 bank_brt_reg;
>> +	u8 bank_mix_reg;
>> +	u8 reset_reg;
>> +};
>> +
>> +static const struct lp50xx_chip_info lp50xx_chip_info_tbl[] = {
>> +	[LP5009] = {
>> +		.num_leds = LP5009_MAX_LED_MODULES,
>> +		.led_brightness0_reg = LP5012_LED0_BRT,
>> +		.mix_out0_reg = LP5012_OUT0_CLR,
>> +		.bank_brt_reg = LP5012_BNK_BRT,
>> +		.bank_mix_reg = LP5012_BNKA_CLR,
>> +		.reset_reg = LP5012_RESET,
>> +		.lp50xx_regmap_config = lp5012_regmap_config,
>> +	},
>> +	[LP5012] = {
>> +		.num_leds = LP5012_MAX_LED_MODULES,
>> +		.led_brightness0_reg = LP5012_LED0_BRT,
>> +		.mix_out0_reg = LP5012_OUT0_CLR,
>> +		.bank_brt_reg = LP5012_BNK_BRT,
>> +		.bank_mix_reg = LP5012_BNKA_CLR,
>> +		.reset_reg = LP5012_RESET,
>> +		.lp50xx_regmap_config = lp5012_regmap_config,
>> +	},
>> +	[LP5018] = {
>> +		.num_leds = LP5018_MAX_LED_MODULES,
>> +		.led_brightness0_reg = LP5024_LED0_BRT,
>> +		.mix_out0_reg = LP5024_OUT0_CLR,
>> +		.bank_brt_reg = LP5024_BNK_BRT,
>> +		.bank_mix_reg = LP5024_BNKA_CLR,
>> +		.reset_reg = LP5024_RESET,
>> +		.lp50xx_regmap_config = lp5024_regmap_config,
>> +	},
>> +	[LP5024] = {
>> +		.num_leds = LP5024_MAX_LED_MODULES,
>> +		.led_brightness0_reg = LP5024_LED0_BRT,
>> +		.mix_out0_reg = LP5024_OUT0_CLR,
>> +		.bank_brt_reg = LP5024_BNK_BRT,
>> +		.bank_mix_reg = LP5024_BNKA_CLR,
>> +		.reset_reg = LP5024_RESET,
>> +		.lp50xx_regmap_config = lp5024_regmap_config,
>> +	},
>> +	[LP5030] = {
>> +		.num_leds = LP5030_MAX_LED_MODULES,
>> +		.led_brightness0_reg = LP5036_LED0_BRT,
>> +		.mix_out0_reg = LP5036_OUT0_CLR,
>> +		.bank_brt_reg = LP5036_BNK_BRT,
>> +		.bank_mix_reg = LP5036_BNKA_CLR,
>> +		.reset_reg = LP5036_RESET,
>> +		.lp50xx_regmap_config = lp5036_regmap_config,
>> +	},
>> +	[LP5036] = {
>> +		.num_leds = LP5036_MAX_LED_MODULES,
>> +		.led_brightness0_reg = LP5036_LED0_BRT,
>> +		.mix_out0_reg = LP5036_OUT0_CLR,
>> +		.bank_brt_reg = LP5036_BNK_BRT,
>> +		.bank_mix_reg = LP5036_BNKA_CLR,
>> +		.reset_reg = LP5036_RESET,
>> +		.lp50xx_regmap_config = lp5036_regmap_config,
>> +	},
>> +};
>> +
>> +static struct lp50xx_led *mcled_cdev_to_led(struct led_classdev_mc *mcled_cdev)
>> +{
>> +	return container_of(mcled_cdev, struct lp50xx_led, mc_cdev);
>> +}
>> +
>> +static int lp50xx_set_intensity(struct lp50xx_led *led)
>> +{
>> +	struct lp50xx *priv = led->priv;
>> +	u8 led_offset, reg_number, reg_color_off;
> reg_color_off feels like "turning the color off"
>
> Let's have full reg_color_offset form.

I will ack this for brightness set as this function will disappear in v9


>
>> +	int i, ret = -EINVAL;
>> +
>> +	for (i = 0; i <= LED_COLOR_ID_MAX; i++) {
>> +		if (!test_bit(i, &led->mc_cdev.available_colors))
>> +			continue;
>> +
>> +		if (i == LED_COLOR_ID_RED)
>> +			reg_color_off = 0;
>> +		else if (i == LED_COLOR_ID_GREEN)
>> +			reg_color_off = 1;
>> +		else if (i == LED_COLOR_ID_BLUE)
>> +			reg_color_off = 2;
>> +		else
>> +			continue;
>> +
>> +		if (led->ctrl_bank_enabled) {
>> +			reg_number = priv->chip_info->bank_mix_reg + reg_color_off;
>> +		} else {
>> +			led_offset = (led->led_number * 3)  + reg_color_off;
>> +			reg_number = priv->chip_info->mix_out0_reg + led_offset;
>> +		}
>> +
>> +		ret = regmap_write(priv->regmap, reg_number,
>> +				   led->led_intensity[i]);
>> +		if (ret) {
>> +			dev_err(&priv->client->dev, "Cannot write LED value\n");
>> +			goto out;
>> +		}
>> +	}
>> +out:
>> +	return ret;
>> +}
>> +
>> +static int lp50xx_brightness_set(struct led_classdev *cdev,
>> +			     enum led_brightness brightness)
>> +{
>> +	struct lp50xx_led *led = container_of(cdev, struct lp50xx_led, led_dev);
>> +	int ret = 0;
>> +	u8 reg_val;
>> +
>> +	mutex_lock(&led->priv->lock);
>> +
>> +	if (led->ctrl_bank_enabled)
>> +		reg_val = led->priv->chip_info->bank_brt_reg;
>> +	else
>> +		reg_val = led->priv->chip_info->led_brightness0_reg +
>> +			  led->led_number;
>> +
>> +	ret = regmap_write(led->priv->regmap, reg_val, brightness);
>> +	if (ret)
>> +		goto err_out;
>> +
>> +	ret = lp50xx_set_intensity(led);
>> +err_out:
>> +	mutex_unlock(&led->priv->lock);
>> +	return ret;
>> +}
>> +
>> +static enum led_brightness lp50xx_brightness_get(struct led_classdev *cdev)
> Do we really need this op? Is it possible that the device will alter
> brightness autonomously ? IOW can't we rely on what we've written
> previously to the hw?

How can we be sure that the previous I/O actually wrote to the device?

If set_brightness fails does the LED class not modify the current 
brightness setting?

So we have mismatched values and with this call back we can refresh the 
right setting.

But I can remove it if you see no value in doing get_brightness call back.

>
>> +{
>> +	struct lp50xx_led *led = container_of(cdev, struct lp50xx_led, led_dev);
>> +	unsigned int brt_val;
>> +	u8 reg_val;
>> +	int ret;
>> +
>> +	mutex_lock(&led->priv->lock);
>> +
>> +	if (led->ctrl_bank_enabled)
>> +		reg_val = led->priv->chip_info->bank_brt_reg;
>> +	else
>> +		reg_val = led->priv->chip_info->led_brightness0_reg + led->led_number;
>> +
>> +	ret = regmap_read(led->priv->regmap, reg_val, &brt_val);
>> +
>> +	mutex_unlock(&led->priv->lock);
>> +
>> +	return brt_val;
>> +}
>> +
>> +static int lp50xx_set_color(struct led_classdev_mc *mcled_cdev,
>> +			    int color, int value)
>> +{
>> +	struct lp50xx_led *led = mcled_cdev_to_led(mcled_cdev);
>> +
>> +	led->led_intensity[color] = value;
>> +
>> +	return 0;
>> +}
>> +
>> +static int lp50xx_set_banks(struct lp50xx *priv, u32 led_strings[])
> This is a bit misleading to introduce "strings" when the function
> claims to set "banks". Let's have the parameter name "led_banks".
Ack
>
>> +{
>> +	u8 led_ctrl_enable = 0;
>> +	u8 led1_ctrl_enable = 0;
>> +	u8 ctrl_ext = 0;
> Let's have below instead of the above three variables:
>
> 	u32 bank_enable_mask = 0;
> 	u8 led_config_lo, led_config_hi;

Ack but I have to keep the initialization to 0 as the compiler 
complained that these values may not be set.


>
>> +	int ret;
>> +	int j;
> This is subjective, but why j? We usually have 'i' for one level loop.

I think this was residual from code from previous revisions I will 
change it to i

Ack

>
>> +
>> +	for (j = 0; j <= priv->chip_info->num_leds - 1; j++) {
>> +		if (led_strings[j] > (LP5024_MAX_LED_MODULES - 1)) {
>> +			ctrl_ext = led_strings[j] - LP5024_MAX_LED_MODULES;
>> +			led1_ctrl_enable |= (1 << ctrl_ext)> +		} else {
>> +			led_ctrl_enable |= (1 << led_strings[j]);
>> +		}
>> +	}
> This looks harder than it should be.
>
> for (i = 0; i < priv->chip_info->num_leds; i++)
> 	bank_enable_mask |= (1 << led_banks[i]);
>
> led_config_lo = (u8)(bank_enable_mask & 0xff);
> led_config_hi = (u8)(bank_enable_mask >> 8) & 0xff);

I will have to go through your logic to make sure it writes the correct 
values.

There was a reason why I did it this way but that was a while back and I 
have to review.


>> +
>> +	ret = regmap_write(priv->regmap, LP50XX_LED_CFG0, led_ctrl_enable);
> ret = regmap_write(priv->regmap, LP50XX_LED_CFG0, led_config_lo);
> if (ret)
> 	return ret;
>
Ack
>> +
>> +	if (led1_ctrl_enable)
>> +		ret = regmap_write(priv->regmap, LP5036_LED_CFG1,
>> +				   led1_ctrl_enable);
> if (led_config_hi)
> 	ret = regmap_write(priv->regmap, LP5036_LED_CFG1,
>                             led_config_hi);
>
Ack
>> +
>> +	return ret;
>> +}
>> +
>> +static int lp50xx_reset(struct lp50xx *priv)
>> +{
>> +	if (priv->enable_gpio)
>> +		return gpiod_direction_output(priv->enable_gpio, 1);
>> +	else
>> +		return regmap_write(priv->regmap, priv->chip_info->reset_reg,
>> +				    LP50XX_SW_RESET);
>> +}
>> +
>> +static int lp50xx_enable_disable(struct lp50xx *priv, u8 enable_disable)
>> +{
>> +	return regmap_write(priv->regmap, LP50XX_DEV_CFG0, enable_disable);
>> +}
>> +
>> +static int lp50xx_probe_dt(struct lp50xx *priv)
>> +{
>> +	u32 led_strings[LP5036_MAX_LED_MODULES];
> s/led_strings/led_banks/

Ack


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
>> +							     led_strings,
>> +							     ret);
>> +
>> +			priv->num_of_banked_leds = ARRAY_SIZE(led_strings);
>> +
>> +			ret = lp50xx_set_banks(priv, led_strings);
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
>> +
>> +			led->led_number = led_number;
>> +		}
>> +		if (ret) {
>> +			dev_err(&priv->client->dev,
>> +				"led sourcing property missing\n");
>> +			fwnode_handle_put(child);
>> +			goto child_out;
>> +		}
>> +
>> +		if (led_number > priv->chip_info->num_leds) {
>> +			dev_err(&priv->client->dev,
>> +				"led-sources property is invalid\n");
>> +			ret = -EINVAL;
>> +			fwnode_handle_put(child);
>> +			goto child_out;
>> +		}
>> +
>> +		init_data.fwnode = child;
>> +		init_data.devicename = priv->client->name;
>> +		init_data.default_label = ":";
> devicename and default_label are for LEDs with mandatory devicename
> and for backward compatibility. Neither is pertinent to this driver.

Ack

Dan

[...]

