Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C23AA220E18
	for <lists+linux-leds@lfdr.de>; Wed, 15 Jul 2020 15:28:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731621AbgGON2C (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 15 Jul 2020 09:28:02 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:46196 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731201AbgGON2B (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 15 Jul 2020 09:28:01 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 06FDRqFa081407;
        Wed, 15 Jul 2020 08:27:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1594819672;
        bh=rY8VkekEV6uYqlufiJmabYLs4vypCC6k2TwjUAXiHtU=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=SMjvhn3biQqo/H5GxGVQIAg47hRa5lGLFsMFk1EzTVZ0uclvDC5bd3mfxweEKaQFK
         ZTb28Gj7Tly5TNDlsiGdDc7Km+ONP5fHmSH7AlKiL4BbHFE/1zX/hYvZokjU3CKRTh
         ti23WAgRy6tyB7ipcLBXaFjOtyP/Isvr1gSSN+L0=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 06FDRp21050891
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 15 Jul 2020 08:27:52 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 15
 Jul 2020 08:27:51 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 15 Jul 2020 08:27:51 -0500
Received: from [10.250.32.229] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 06FDRpQo029748;
        Wed, 15 Jul 2020 08:27:51 -0500
Subject: Re: [PATCH v4 2/2] leds: initial support for Turris Omnia LEDs
To:     =?UTF-8?Q?Marek_Beh=c3=ban?= <marek.behun@nic.cz>,
        <linux-leds@vger.kernel.org>
CC:     Pavel Machek <pavel@ucw.cz>, <jacek.anaszewski@gmail.com>
References: <20200715124034.9804-1-marek.behun@nic.cz>
 <20200715124034.9804-3-marek.behun@nic.cz>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <e274c075-c630-6217-1124-b207c6f67bac@ti.com>
Date:   Wed, 15 Jul 2020 08:27:51 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200715124034.9804-3-marek.behun@nic.cz>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Marek

On 7/15/20 7:40 AM, Marek Behún wrote:
> This adds basic support for LEDs on the front side of CZ.NIC's Turris
> Omnia router.
>
> There are 12 RGB LEDs. The controller supports HW triggering mode for
> the LEDs, but this driver does not support it yet, and sets all the LEDs
> defined in device-tree into SW mode upon probe.
>
> This driver uses the multi color LED framework.
>
> Signed-off-by: Marek Behún <marek.behun@nic.cz>
> ---
>   drivers/leds/Kconfig             |  11 ++
>   drivers/leds/Makefile            |   1 +
>   drivers/leds/leds-turris-omnia.c | 296 +++++++++++++++++++++++++++++++
>   3 files changed, 308 insertions(+)
>   create mode 100644 drivers/leds/leds-turris-omnia.c
>
> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> index 68f63d1a7d48..ce365a22445d 100644
> --- a/drivers/leds/Kconfig
> +++ b/drivers/leds/Kconfig
> @@ -176,6 +176,17 @@ config LEDS_EL15203000
>   	  To compile this driver as a module, choose M here: the module
>   	  will be called leds-el15203000.
>   
> +config LEDS_TURRIS_OMNIA
> +	tristate "LED support for CZ.NIC's Turris Omnia"
> +	depends on LEDS_CLASS_MULTI_COLOR
> +	depends on I2C
> +	depends on MACH_ARMADA_38X || COMPILE_TEST
> +	depends on OF
> +	help
> +	  This option enables basic support for the LEDs found on the front
> +	  side of CZ.NIC's Turris Omnia router. There are 12 RGB LEDs on the
> +	  front panel.
> +
Can this be built as a module?
>   config LEDS_LM3530
>   	tristate "LCD Backlight driver for LM3530"
>   	depends on LEDS_CLASS
> diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
> index 68c05faec99e..0dcea0322fd3 100644
> --- a/drivers/leds/Makefile
> +++ b/drivers/leds/Makefile
> @@ -88,6 +88,7 @@ obj-$(CONFIG_LEDS_TCA6507)		+= leds-tca6507.o
>   obj-$(CONFIG_LEDS_TI_LMU_COMMON)	+= leds-ti-lmu-common.o
>   obj-$(CONFIG_LEDS_TLC591XX)		+= leds-tlc591xx.o
>   obj-$(CONFIG_LEDS_TPS6105X)		+= leds-tps6105x.o
> +obj-$(CONFIG_LEDS_TURRIS_OMNIA)		+= leds-turris-omnia.o
>   obj-$(CONFIG_LEDS_WM831X_STATUS)	+= leds-wm831x-status.o
>   obj-$(CONFIG_LEDS_WM8350)		+= leds-wm8350.o
>   obj-$(CONFIG_LEDS_WRAP)			+= leds-wrap.o
> diff --git a/drivers/leds/leds-turris-omnia.c b/drivers/leds/leds-turris-omnia.c
> new file mode 100644
> index 000000000000..0aa79abf0ed4
> --- /dev/null
> +++ b/drivers/leds/leds-turris-omnia.c
> @@ -0,0 +1,296 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * CZ.NIC's Turris Omnia LEDs driver
> + *
> + * 2020 by Marek Behun <marek.behun@nic.cz>
> + */
> +
> +#include <linux/i2c.h>
> +#include <linux/led-class-multicolor.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/of.h>
> +#include "leds.h"
> +
> +#define OMNIA_BOARD_LEDS		12
> +
> +#define CMD_LED_MODE			3
> +#define CMD_LED_MODE_LED(l)		((l) & 0x0f)
> +#define CMD_LED_MODE_USER		0x10
> +
> +#define CMD_LED_STATE			4
> +#define CMD_LED_STATE_LED(l)		((l) & 0x0f)
> +#define CMD_LED_STATE_ON		0x10
> +
> +#define CMD_LED_COLOR			5
> +#define CMD_LED_SET_BRIGHTNESS		7
> +#define CMD_LED_GET_BRIGHTNESS		8
> +
> +#define OMNIA_CMD			0
> +
> +#define OMNIA_CMD_LED_COLOR_LED		1
> +#define OMNIA_CMD_LED_COLOR_R		2
> +#define OMNIA_CMD_LED_COLOR_G		3
> +#define OMNIA_CMD_LED_COLOR_B		4
> +#define OMNIA_CMD_LED_COLOR_LEN		5
> +
> +struct omnia_led {
> +	struct led_classdev_mc mc_cdev;
> +	struct mc_subled subled_info[3];
nit. #define the 3 and use it here and when indicating the num_colors
> +	int reg;
> +};
> +
> +#define to_omnia_led(l)		container_of(l, struct omnia_led, mc_cdev)
Spacing look to be off here.
> +
> +struct omnia_leds {
> +	struct i2c_client *client;
> +	struct mutex lock;
> +	int nleds;
This does  not seem to be used anywhere except for during registering
> +	struct omnia_led leds[0];
Remove the 0 as this should be a flexible array
> +};
> +
> +static int omnia_led_brightness_set_blocking(struct led_classdev *cdev,
> +					     enum led_brightness brightness)
> +{
> +	struct led_classdev_mc *mc_cdev = lcdev_to_mccdev(cdev);
> +	struct omnia_leds *leds = dev_get_drvdata(cdev->dev->parent);
> +	struct omnia_led *led = to_omnia_led(mc_cdev);
> +	u8 buf[OMNIA_CMD_LED_COLOR_LEN], state;
> +	int ret;
> +
> +	led_mc_calc_color_components(&led->mc_cdev, brightness);

Do you need this in the lock as well?


> +
> +	mutex_lock(&leds->lock);
> +
> +	buf[OMNIA_CMD] = CMD_LED_COLOR;
> +	buf[OMNIA_CMD_LED_COLOR_LED] = led->reg;
> +	buf[OMNIA_CMD_LED_COLOR_R] = mc_cdev->subled_info[0].brightness;
> +	buf[OMNIA_CMD_LED_COLOR_G] = mc_cdev->subled_info[1].brightness;
> +	buf[OMNIA_CMD_LED_COLOR_B] = mc_cdev->subled_info[2].brightness;
> +
> +	state = CMD_LED_STATE_LED(led->reg);
> +	if (buf[OMNIA_CMD_LED_COLOR_R] || buf[OMNIA_CMD_LED_COLOR_G] || buf[OMNIA_CMD_LED_COLOR_B])
> +		state |= CMD_LED_STATE_ON;
> +
> +	ret = i2c_smbus_write_byte_data(leds->client, CMD_LED_STATE, state);
> +	if (ret >= 0 && (state & CMD_LED_STATE_ON))
> +		ret = i2c_master_send(leds->client, buf, 5);
> +
> +	mutex_unlock(&leds->lock);
> +
> +	return ret;
> +}
> +
> +static int omnia_led_register(struct omnia_leds *leds, struct device_node *np)
> +{
> +	struct i2c_client *client = leds->client;
> +	struct led_init_data init_data = {};
> +	struct device *dev = &client->dev;
> +	struct led_classdev *cdev;
> +	struct omnia_led *led;
> +	int ret, color;
> +
> +	led = &leds->leds[leds->nleds];
> +
> +	ret = of_property_read_u32(np, "reg", &led->reg);
> +	if (ret || led->reg >= OMNIA_BOARD_LEDS) {
> +		dev_warn(dev,
> +			 "Node %pOF: must contain 'reg' property with values between 0 and %i\n",
> +			 np, OMNIA_BOARD_LEDS - 1);
> +		return 0;
> +	}
> +
> +	ret = of_property_read_u32(np, "color", &color);
> +	if (ret || color != LED_COLOR_ID_MULTI) {
> +		dev_warn(dev,
> +			 "Node %pOF: must contain 'color' property with value LED_COLOR_ID_MULTI\n",
> +			 np);
> +		return 0;
> +	}
> +
> +	led->subled_info[0].color_index = LED_COLOR_ID_RED;
> +	led->subled_info[0].channel = 0;
> +	led->subled_info[1].color_index = LED_COLOR_ID_GREEN;
> +	led->subled_info[1].channel = 1;
> +	led->subled_info[2].color_index = LED_COLOR_ID_BLUE;
> +	led->subled_info[2].channel = 2;

OK this is why you may want to have sub-nodes.  Where reg is the channel 
and color is the color.  Then you can do a for_each_child.

> +
> +	led->mc_cdev.subled_info = led->subled_info;
> +	led->mc_cdev.num_colors = 3;
> +
> +	init_data.fwnode = &np->fwnode;
> +
> +	cdev = &led->mc_cdev.led_cdev;
> +	cdev->max_brightness = 255;
This is not needed.  It is defaulted to LED_FULL in led_class
> +	cdev->brightness_set_blocking = omnia_led_brightness_set_blocking;
> +
> +	of_property_read_string(np, "linux,default-trigger", &cdev->default_trigger);
> +
> +	/* put the LED into software mode */
> +	ret = i2c_smbus_write_byte_data(client, CMD_LED_MODE,
> +					CMD_LED_MODE_LED(led->reg) |
> +					CMD_LED_MODE_USER);
> +	if (ret < 0) {
> +		dev_err(dev, "Cannot set LED %pOF to software mode: %i\n", np, ret);
> +		return ret;
> +	}
> +
> +	/* disable the LED */
> +	ret = i2c_smbus_write_byte_data(client, CMD_LED_STATE, CMD_LED_STATE_LED(led->reg));
> +	if (ret < 0) {
> +		dev_err(dev, "Cannot set LED %pOF brightness: %i\n", np, ret);
> +		return ret;
> +	}
> +
> +	ret = devm_led_classdev_multicolor_register_ext(dev, &led->mc_cdev, &init_data);
> +	if (ret < 0) {
> +		dev_err(dev, "Cannot register LED %pOF: %i\n", np, ret);
> +		return ret;
> +	}
> +
> +	++leds->nleds;
> +
> +	return 0;
> +}
> +
> +/*
> + * On the front panel of the Turris Omnia router there is also a button which can be used to control
> + * the intensity of all the LEDs at once, so that if they are too bright, user can dim them.
> + * The microcontroller cycles between 8 levels of this global brightness (from 100% to 0%), but this
> + * setting can have any integer value between 0 and 100.
> + * It is usable to be able to change this value from software, so that it does not start at 100%
This does not make sense.
> + * after every power on and annoy the user.
> + * We expose this setting via a sysfs attribute file called "brightness". This file lives in the
> + * device directory of the LED controller, not an individual LED, so it should not confuse users.
> + */

Sorry if this has been discussed already

This seems a bit wonky.  You are overriding the brightness set by the 
LED class.

Does this button have an interrupt to the processor or does it go to the 
micro controller?

Where is the current power on value stored?  If this is stored in the 
micro maybe reading that value at power up and setting the brightness 
would be better.

> +static ssize_t brightness_show(struct device *dev, struct device_attribute *a, char *buf)
> +{
> +	struct i2c_client *client = to_i2c_client(dev);
> +	struct omnia_leds *leds = i2c_get_clientdata(client);
> +	int ret;
> +
> +	mutex_lock(&leds->lock);
> +	ret = i2c_smbus_read_byte_data(client, CMD_LED_GET_BRIGHTNESS);
> +	mutex_unlock(&leds->lock);
> +
> +	if (ret < 0)
> +		return ret;
> +
> +	return sprintf(buf, "%d\n", ret);
> +}
> +
> +static ssize_t brightness_store(struct device *dev, struct device_attribute *a, const char *buf,
> +				size_t count)
> +{
> +	struct i2c_client *client = to_i2c_client(dev);
> +	struct omnia_leds *leds = i2c_get_clientdata(client);
> +	unsigned int brightness;
> +	int ret;
> +
> +	if (sscanf(buf, "%u", &brightness) != 1)
> +		return -EINVAL;
> +
> +	if (brightness > 100)
> +		return -EINVAL;
> +
> +	mutex_lock(&leds->lock);
> +	ret = i2c_smbus_write_byte_data(client, CMD_LED_SET_BRIGHTNESS, (u8) brightness);
> +	mutex_unlock(&leds->lock);
> +
> +	if (ret < 0)
> +		return ret;
> +
> +	return count;
> +}
> +static DEVICE_ATTR_RW(brightness);
> +
> +static struct attribute *omnia_led_controller_attrs[] = {
> +	&dev_attr_brightness.attr,
> +	NULL,
> +};
> +ATTRIBUTE_GROUPS(omnia_led_controller);
> +
> +static int omnia_leds_probe(struct i2c_client *client,
> +			    const struct i2c_device_id *id)
> +{
> +	struct device *dev = &client->dev;
> +	struct device_node *np = dev->of_node, *child;
> +	struct omnia_leds *leds;
> +	int ret, count;
> +
> +	count = of_get_available_child_count(np);
> +	if (!count) {
> +		dev_err(dev, "LEDs are not defined in device tree!\n");
> +		return -ENODEV;
> +	} else if (count > OMNIA_BOARD_LEDS) {
> +		dev_err(dev, "Too many LEDs defined in device tree!\n");
> +		return -EINVAL;
> +	}
> +
> +	leds = devm_kzalloc(dev, sizeof(*leds) + count * sizeof(leds->leds[0]),
> +			    GFP_KERNEL);
Use the macro struct_size(led, leds, count)


Dan

