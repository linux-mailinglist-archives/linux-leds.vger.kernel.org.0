Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ABFD97CC3D
	for <lists+linux-leds@lfdr.de>; Wed, 31 Jul 2019 20:46:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730493AbfGaSqX (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 31 Jul 2019 14:46:23 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:49794 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725942AbfGaSqW (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 31 Jul 2019 14:46:22 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x6VIkHv1040358;
        Wed, 31 Jul 2019 13:46:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1564598777;
        bh=mL37COuUg0/2LN0HkDBc37AidxoO/sFDKCmFaAFpYjw=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=GJMXarxrFe4WAEI2tQixbJeV9LGAlR9NE9EhcTc17JDrPKvOMdxasNFoZ0Mu+7lV4
         ClPctX/SVIkeEpcxWlqrDG6HJSM8/6UVziEfTwJHScD+KWbt2NtwO1SHZkL1R1YyQD
         aXQHD05o1rkEQN11Hq7Zf1ToNC9cromds2CrG+NI=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x6VIkHl8094876
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 31 Jul 2019 13:46:17 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 31
 Jul 2019 13:46:17 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 31 Jul 2019 13:46:17 -0500
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x6VIkH4s038617;
        Wed, 31 Jul 2019 13:46:17 -0500
Subject: Re: [PATCH v4 8/9] leds: lp50xx: Add the LP50XX family of the RGB LED
 driver
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20190725182818.29556-1-dmurphy@ti.com>
 <20190725182818.29556-9-dmurphy@ti.com>
 <3cbb6e22-c71d-ad10-1976-216bd557ccd5@gmail.com>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <2a58849b-3f87-2f4b-877a-5580e50efe1d@ti.com>
Date:   Wed, 31 Jul 2019 13:46:17 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <3cbb6e22-c71d-ad10-1976-216bd557ccd5@gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Jacek

Thanks for looking at the patch

On 7/30/19 4:24 PM, Jacek Anaszewski wrote:
> Hi Dan,
>
> Thank you for the patch  I see few things to improve.
>
> On 7/25/19 8:28 PM, Dan Murphy wrote:
>> Introduce the LP5036/30/24/18 RGB LED driver.
>> The difference in these parts are the number of
>> LED outputs where the:
>>
>> LP5036 can control 36 LEDs
>> LP5030 can control 30 LEDs
>> LP5024 can control 24 LEDs
>> LP5018 can control 18 LEDs
>>
>> The device has the ability to group LED output into control banks
>> so that multiple LED banks can be controlled with the same mixing and
>> brightness.  Inversely the LEDs can also be controlled independently.
>>
>> Signed-off-by: Dan Murphy <dmurphy@ti.com>
>> ---
>>   drivers/leds/Kconfig       |   7 +
>>   drivers/leds/Makefile      |   1 +
>>   drivers/leds/leds-lp50xx.c | 789 +++++++++++++++++++++++++++++++++++++
>>   3 files changed, 797 insertions(+)
>>   create mode 100644 drivers/leds/leds-lp50xx.c
>>
>> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
>> index 7f780d5b8490..69c037020f6b 100644
>> --- a/drivers/leds/Kconfig
>> +++ b/drivers/leds/Kconfig
>> @@ -350,6 +350,13 @@ config LEDS_LP3952
>>   	  To compile this driver as a module, choose M here: the
>>   	  module will be called leds-lp3952.
>>   
>> +config LEDS_LP50XX
>> +	tristate "LED Support for TI LP5036/30/24/18 LED driver chip"
>> +	depends on LEDS_CLASS && REGMAP_I2C
>> +	help
>> +	  If you say yes here you get support for the Texas Instruments
>> +	  LP5036, LP5030, LP5024 and LP5018 LED driver.
>> +
>>   config LEDS_LP55XX_COMMON
>>   	tristate "Common Driver for TI/National LP5521/5523/55231/5562/8501"
>>   	depends on LEDS_LP5521 || LEDS_LP5523 || LEDS_LP5562 || LEDS_LP8501
>> diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
>> index 897b810257dd..438a5499f3ee 100644
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
>> index 000000000000..5a32410e4f34
> [...]
>> +static int lp50xx_probe_dt(struct lp50xx *priv)
>> +{
>> +	u32 led_strings[LP5036_MAX_LED_MODULES];
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
>> +	if (priv->model_id == LP5009)
>> +		priv->max_leds = LP5009_MAX_LED_MODULES;
>> +	else if (priv->model_id == LP5012)
>> +		priv->max_leds = LP5012_MAX_LED_MODULES;
>> +	else if (priv->model_id == LP5018)
>> +		priv->max_leds = LP5018_MAX_LED_MODULES;
>> +	else if (priv->model_id == LP5024)
>> +		priv->max_leds = LP5024_MAX_LED_MODULES;
>> +	else if (priv->model_id == LP5030)
>> +		priv->max_leds = LP5030_MAX_LED_MODULES;
>> +	else
>> +		priv->max_leds = LP5036_MAX_LED_MODULES;
> You could simplify that by initializing data property of
> lp50xx_leds_match array elements and then call of_match_device.
> You can compare e.g. drivers/leds/leds-pca9532.c

Well I am not using of_ calls in driver anymore.

I would prefer to use device_get_match_data(&client->dev);


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
>> +		if (led_number > priv->max_leds) {
>> +			dev_err(&priv->client->dev,
>> +				"led-sources property is invalid\n");
>> +			ret = -EINVAL;
>> +			fwnode_handle_put(child);
>> +			goto child_out;
>> +		}
>> +
>> +		init_data.fwnode = child;
>> +		init_data.devicename = priv->client->name;
> We'd rather not have devicename in the name of this LED class device
> according to the new LED naming convention. It's not a hot-pluggable
> device, so for properly designed DT we should not encounter name
> clash.

Ok I had this code from the previous led label patchset.

I will fix it


>
>> +		init_data.default_label = ":";
> default_label should not be set for new drivers. See the comment in
> the include/linux/leds.h:
>
>          /*
>           * string to be used for devicename section of LED class device
>           * either for label based LED name composition path or for fwnode
>           * based when devname_mandatory is true
>           */
>
> This is new driver and we should not add any convenience fallbacks
> for label based DT bindings. Label DT property has been marked
> deprecated, so for new drivers it should be deemed non-existent.
>
Same as above


>> +
>> +		fwnode_property_read_string(child, "linux,default-trigger",
>> +				    &led->led_dev.default_trigger);
>> +		num_colors = 0;
>> +
>> +		fwnode_for_each_child_node(child, led_node) {
>> +			ret = fwnode_property_read_u32(led_node, "color",
>> +						       &color_id);
>> +			if (ret)
>> +				dev_err(&priv->client->dev,
>> +				"Cannot read color\n");
>> +
>> +			led->mc_cdev.available_colors |= (1 << color_id);
>> +			num_colors++;
>> +
>> +		}
>> +
>> +		led->priv = priv;
>> +		led->mc_cdev.ops = &lp50xx_mc_ops;
>> +		led->mc_cdev.num_leds = num_colors;
>> +		led->mc_cdev.led_cdev = &led->led_dev;
>> +		led->led_dev.brightness_set_blocking = lp50xx_brightness_set;
>> +		led->led_dev.brightness_get = lp50xx_brightness_get;
>> +		ret = led_classdev_multicolor_register_ext(&priv->client->dev,
>> +						       &led->mc_cdev,
>> +						       &init_data);
> Why not devm_* prefixed version?

I did create a devm_ version like you did for flash I will change it over

Dan


>
> [...]
>
