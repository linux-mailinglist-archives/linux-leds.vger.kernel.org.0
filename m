Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 65E08AABDA
	for <lists+linux-leds@lfdr.de>; Thu,  5 Sep 2019 21:18:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727604AbfIETSZ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 5 Sep 2019 15:18:25 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:38455 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727304AbfIETSZ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 5 Sep 2019 15:18:25 -0400
Received: by mail-wm1-f68.google.com with SMTP id o184so4371118wme.3;
        Thu, 05 Sep 2019 12:18:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Oq/KSK0Qm2KbIKHZ/PfQlAf/DDGy81OeU7c3sYgTUtY=;
        b=M54WdTdr/iNE7qToPd9zgWLriOhP3hCURWMTS2o3Lc2cMb28eT2/tj0T2ZHKSmYWVt
         McUBLoeY9aRY0EYSOnMXLpMxD4Gl6wmNitIgEjFy4kbUlWPnrGe4zJ5Mk5tRIIDU4gXf
         +5ZZRKZ2aKXLqqsa1Gvk/P7Vpz1PxZcvhiGQKKmITVd0gnWlvLJSls2ZLM/aYJ91DFlB
         OwmccMFIHwJ4XzMK/FeYZpiOFE45Tp1VofgB4n5QAK6LQeCrbOMFz3qYSM99p9nKyZqn
         4lLvRiOJU21qa35aMRf9i4siIPZoeh+zimfchNjGFlOkofaKkO5O/64UZ6DGHKb9MCZj
         noiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=Oq/KSK0Qm2KbIKHZ/PfQlAf/DDGy81OeU7c3sYgTUtY=;
        b=ktLgraJFoayhw2V/1JGDskiXFj0CquWGZjPU76RSxf2jzgsQzogNNDLTieYcoIuW1B
         gwk7ToYh3dOGoEKYEoce77Fcyps4wyzR+vgemtwtsnkGOZpUygBh5MyThclZHHoSkGW5
         brwrso5S9Ook8FGdmNA7f1usi4TqrDpXMO/5he5FxVL/goeTiosxDMT91FfrqsfixIpf
         JYBuCqt0QGQ+Lg2nBmaz2QgG8swoK2re/7PoIRRlhB4kmvE2xxfqfKpoF0RsS+p+Z3tK
         v2AvMg5MdDvugt7Fe1uw17uKp2v1ZOMsEQf+Z3sXd2dKPF/tah+EhQIdmXtLmMr3zZv8
         Osnw==
X-Gm-Message-State: APjAAAWzL+sPUb6XNECaELa7aSt1ZLB9TF1MJqsFqAj1HXHfGVxZjUA1
        bfSTc35Ej/BfRqj+5U35BgDyNmM7
X-Google-Smtp-Source: APXvYqzsRIBOj3+YHxx2ystKKBIn/x/oiOoZ8jtPW+qI52wk37dJDH3FlVRPRIhn4Jixmz18LZ5i9Q==
X-Received: by 2002:a1c:1acc:: with SMTP id a195mr4204563wma.106.1567711100599;
        Thu, 05 Sep 2019 12:18:20 -0700 (PDT)
Received: from [192.168.1.19] (chd230.neoplus.adsl.tpnet.pl. [83.31.1.230])
        by smtp.gmail.com with ESMTPSA id c132sm4998677wme.27.2019.09.05.12.18.19
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 05 Sep 2019 12:18:20 -0700 (PDT)
Subject: Re: [PATCH v5 2/2] leds: add LED driver for EL15203000 board
To:     Oleh Kravchenko <oleg@kaa.org.ua>
Cc:     devicetree@vger.kernel.org, linux-leds@vger.kernel.org
References: <20190830224619.15728-1-oleg@kaa.org.ua>
 <20190830224619.15728-2-oleg@kaa.org.ua>
 <371b2ecd-034d-dd64-d47b-b7fcc99bedba@gmail.com>
 <75CFB808-40B7-41F1-A820-39B80C06019F@kaa.org.ua>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jacek.anaszewski@gmail.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <c8c457f9-e269-5b7a-e02a-6e7f89e62c54@gmail.com>
Date:   Thu, 5 Sep 2019 21:18:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <75CFB808-40B7-41F1-A820-39B80C06019F@kaa.org.ua>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Oleh,

On 9/5/19 8:17 AM, Oleh Kravchenko wrote:
> Hello Jacek,
> Few question from my side just for better understanding :)
> 
>> 5 вер. 2019 р. о 12:23 дп Jacek Anaszewski <jacek.anaszewski@gmail.com> написав(ла):
>>
>> Hi Oleh,
>>
>> Thank you for the updated set.
>>
>> Now it looks really good. Just few minor issues left.
>>
>> And side note - please address the patches also to maintainers,
>> not only to the list.
>>
>> On 8/31/19 12:46 AM, Oleh Kravchenko wrote:
>>> This patch adds a LED class driver for the RGB LEDs found on
>>> the Crane Merchandising System EL15203000 LEDs board
>>> (aka RED LEDs board).
>>>
>>> Signed-off-by: Oleh Kravchenko <oleg@kaa.org.ua>
>>> ---
>>> .../testing/sysfs-class-led-driver-el15203000 |  22 ++
>>> drivers/leds/Kconfig                          |  13 +
>>> drivers/leds/Makefile                         |   1 +
>>> drivers/leds/leds-el15203000.c                | 362 ++++++++++++++++++
>>> 4 files changed, 398 insertions(+)
>>> create mode 100644 Documentation/ABI/testing/sysfs-class-led-driver-el15203000
>>> create mode 100644 drivers/leds/leds-el15203000.c
>>>
>>> diff --git a/Documentation/ABI/testing/sysfs-class-led-driver-el15203000 b/Documentation/ABI/testing/sysfs-class-led-driver-el15203000
>>> new file mode 100644
>>> index 000000000000..767763409125
>>> --- /dev/null
>>> +++ b/Documentation/ABI/testing/sysfs-class-led-driver-el15203000
>>> @@ -0,0 +1,22 @@
>>> +What:		/sys/class/leds/<led>/hw_pattern
>>> +Date:		August 2019
>>> +KernelVersion:	5.3
>>
>> Now it will be September and 5.5. It is late even for 5.4.
> 
> Here should month of patch creation or when it will be reviewed? :)
> Because I sent in 31 August.

It should reflect the kernel version in which the ABI is supposed to
appear.

>>> +Description:
>>> +		Specify a hardware pattern for the EL15203000 LED.
>>> +		The LEDs board supports only predefined patterns by firmware
>>> +		for specific LEDs.
>>> +
>>> +		Breathing mode for Screen frame light tube:
>>> +		"0 4000 1 4000"
>>> +
>>> +		Cascade mode for Pipe LED:
>>> +		"1 800 2 800 4 800 8 800 16 800"
>>> +
>>> +		Inverted cascade mode for Pipe LED:
>>> +		"30 800 29 800 27 800 23 800 15 800"
>>> +
>>> +		Bounce mode for Pipe LED:
>>> +		"1 800 2 800 4 800 8 800 16 800 16 800 8 800 4 800 2 800 1 800"
>>> +
>>> +		Inverted bounce mode for Pipe LED:
>>> +		"30 800 29 800 27 800 23 800 15 800 15 800 23 800 27 800 29 800 30 800"
>>> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
>>> index 1988de1d64c0..6e7703fd03d0 100644
>>> --- a/drivers/leds/Kconfig
>>> +++ b/drivers/leds/Kconfig
>>> @@ -132,6 +132,19 @@ config LEDS_CR0014114
>>> 	  To compile this driver as a module, choose M here: the module
>>> 	  will be called leds-cr0014114.
>>>
>>> +config LEDS_EL15203000
>>> +	tristate "LED Support for Crane EL15203000"
>>> +	depends on LEDS_CLASS
>>> +	depends on SPI
>>> +	depends on OF
>>> +	help
>>> +	  This option enables support for EL15203000 LED Board
>>> +	  (aka RED LED board) which is widely used in coffee vending
>>> +	  machines produced by Crane Merchandising Systems.
>>> +
>>> +	  To compile this driver as a module, choose M here: the module
>>> +	  will be called leds-el15203000.
>>> +
>>> config LEDS_LM3530
>>> 	tristate "LCD Backlight driver for LM3530"
>>> 	depends on LEDS_CLASS
>>> diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
>>> index 41fb073a39c1..2da39e896ce8 100644
>>> --- a/drivers/leds/Makefile
>>> +++ b/drivers/leds/Makefile
>>> @@ -89,6 +89,7 @@ obj-$(CONFIG_LEDS_LM36274)		+= leds-lm36274.o
>>> # LED SPI Drivers
>>> obj-$(CONFIG_LEDS_CR0014114)		+= leds-cr0014114.o
>>> obj-$(CONFIG_LEDS_DAC124S085)		+= leds-dac124s085.o
>>> +obj-$(CONFIG_LEDS_EL15203000)		+= leds-el15203000.o
>>>
>>> # LED Userspace Drivers
>>> obj-$(CONFIG_LEDS_USER)			+= uleds.o
>>> diff --git a/drivers/leds/leds-el15203000.c b/drivers/leds/leds-el15203000.c
>>> new file mode 100644
>>> index 000000000000..9de81dee3618
>>> --- /dev/null
>>> +++ b/drivers/leds/leds-el15203000.c
>>> @@ -0,0 +1,362 @@
>>> +// SPDX-License-Identifier: GPL-2.0
>>> +// Copyright (c) 2019 Crane Merchandising Systems. All rights reserved.
>>> +// Copyright (C) 2019 Oleh Kravchenko <oleg@kaa.org.ua>
>>> +
>>> +#include <linux/delay.h>
>>> +#include <linux/leds.h>
>>> +#include <linux/module.h>
>>> +#include <linux/of_device.h>
>>> +#include <linux/spi/spi.h>
>>> +
>>> +/*
>>> + * EL15203000 SPI protocol description:
>>> + * +-----+---------+
>>> + * | LED | COMMAND |
>>> + * +-----+---------+
>>> + * |  1  |    1    |
>>> + * +-----+---------+
>>> + * (*) LEDs MCU board expects 20 msec delay per byte.
>>> + *
>>> + * LEDs:
>>> + * +----------+--------------+-------------------------------------------+
>>> + * |    ID    |     NAME     |         DESCRIPTION                       |
>>> + * +----------+--------------+-------------------------------------------+
>>> + * | 'P' 0x50 |     Pipe     | Consists from 5 LEDs, controlled by board |
>>> + * +----------+--------------+-------------------------------------------+
>>> + * | 'S' 0x53 | Screen frame | Light tube around the screen              |
>>> + * +----------+--------------+-------------------------------------------+
>>> + * | 'V' 0x56 | Vending area | Highlights a cup of coffee                |
>>> + * +----------+--------------+-------------------------------------------+
>>> + *
>>> + * COMMAND:
>>> + * +----------+-----------------+--------------+--------------+
>>> + * |  VALUES  |       PIPE      | SCREEN FRAME | VENDING AREA |
>>> + * +----------+-----------------+--------------+--------------+
>>> + * | '0' 0x30 |                      Off                      |
>>> + * +----------+-----------------------------------------------+
>>> + * | '1' 0x31 |                      On                       |
>>> + * +----------+-----------------+--------------+--------------+
>>> + * | '2' 0x32 |     Cascade     |   Breathing  |
>>> + * +----------+-----------------+--------------+
>>> + * | '3' 0x33 | Inverse cascade |
>>> + * +----------+-----------------+
>>> + * | '4' 0x34 |     Bounce      |
>>> + * +----------+-----------------+
>>> + * | '5' 0x35 | Inverse bounce  |
>>> + * +----------+-----------------+
>>> + */
>>> +
>>> +/* EL15203000 default settings */
>>> +#define EL_FW_DELAY_USEC	20000ul
>>> +#define EL_PATTERN_DELAY_MSEC	800u
>>> +#define EL_PATTERN_LEN		10u
>>> +#define EL_PATTERN_HALF_LEN	(EL_PATTERN_LEN / 2)
>>> +
>>> +enum el15203000_command {
>>> +	/* for all LEDs */
>>> +	EL_OFF			= '0',
>>> +	EL_ON			= '1',
>>> +
>>> +	/* for Screen LED */
>>> +	EL_SCREEN_BREATHING	= '2',
>>> +
>>> +	/* for Pipe LED */
>>> +	EL_PIPE_CASCADE		= '2',
>>> +	EL_PIPE_INV_CASCADE	= '3',
>>> +	EL_PIPE_BOUNCE		= '4',
>>> +	EL_PIPE_INV_BOUNCE	= '5',
>>> +};
>>> +
>>> +struct el15203000_led {
>>> +	struct el15203000	*priv;
>>> +	struct led_classdev	ldev;
>>> +	u8			reg;
>>> +};
>>> +
>>> +struct el15203000 {
>>> +	struct device		*dev;
>>> +	struct mutex		lock;
>>> +	struct spi_device	*spi;
>>> +	unsigned long		delay;
>>> +	size_t			count;
>>> +	struct el15203000_led	leds[];
>>> +};
>>> +
>>> +static int el15203000_cmd(struct el15203000_led *led, u8 brightness)
>>> +{
>>> +	int		ret;
>>> +	u8		cmd[2];
>>> +	size_t		i;
>>> +
>>> +	mutex_lock(&led->priv->lock);
>>> +
>>> +	dev_dbg(led->priv->dev, "Set brightness of 0x%02x(%c) to 0x%02x(%c)",
>>> +		led->reg, led->reg, brightness, brightness);
>>> +
>>> +	/* to avoid SPI mistiming with firmware we should wait some time */
>>> +	if (time_after(led->priv->delay, jiffies)) {
>>> +		dev_dbg(led->priv->dev, "Wait %luus to sync",
>>> +			EL_FW_DELAY_USEC);
>>> +
>>> +		usleep_range(EL_FW_DELAY_USEC,
>>> +			     EL_FW_DELAY_USEC + 1);
>>> +	}
>>> +
>>> +	cmd[0] = led->reg;
>>> +	cmd[1] = brightness;
>>> +
>>> +	for (i = 0; i < ARRAY_SIZE(cmd); i++) {
>>> +		if (i)
>>> +			usleep_range(EL_FW_DELAY_USEC,
>>> +				     EL_FW_DELAY_USEC + 1);
>>> +
>>> +		ret = spi_write(led->priv->spi, &cmd[i], sizeof(cmd[i]));
>>> +		if (ret) {
>>> +			dev_err(led->priv->dev,
>>> +				"spi_write() error %d", ret);
>>> +			break;
>>> +		}
>>> +	}
>>> +
>>> +	led->priv->delay = jiffies + usecs_to_jiffies(EL_FW_DELAY_USEC);
>>> +
>>> +	mutex_unlock(&led->priv->lock);
>>> +
>>> +	return ret;
>>> +}
>>> +
>>> +static int el15203000_set_blocking(struct led_classdev *ldev,
>>> +				   enum led_brightness brightness)
>>> +{
>>> +	struct el15203000_led	*led = container_of(ldev,
>>> +						    struct el15203000_led,
>>> +						    ldev);
>>> +
>>> +	return el15203000_cmd(led, brightness == LED_OFF ? EL_OFF : EL_ON);
>>> +}
>>> +
>>> +static int el15203000_pattern_set_S(struct led_classdev *ldev,
>>> +				    struct led_pattern *pattern,
>>> +				    u32 len, int repeat)
>>> +{
>>> +	struct el15203000_led	*led = container_of(ldev,
>>> +						    struct el15203000_led,
>>> +						    ldev);
>>> +
>>> +	if (repeat > 0 || len != 2 ||
>>> +	    pattern[0].delta_t != 4000 || pattern[0].brightness != 0 ||
>>> +	    pattern[1].delta_t != 4000 || pattern[1].brightness != 1)
>>> +		return -EINVAL;
>>> +
>>> +	dev_dbg(led->priv->dev, "Breathing mode for 0x%02x(%c)",
>>> +		led->reg, led->reg);
>>> +
>>> +	return el15203000_cmd(led, EL_SCREEN_BREATHING);
>>> +}
>>> +
>>> +static bool is_cascade(const struct led_pattern *pattern, u32 len,
>>> +		       bool inv, bool right)
>>> +{
>>> +	int val, t;
>>> +	u32 i;
>>> +
>>> +	if (len != EL_PATTERN_HALF_LEN)
>>> +		return false;
>>> +
>>> +	val = right ? BIT(4) : BIT(0);
>>> +
>>> +	for (i = 0; i < len; i++) {
>>> +		t = inv ? ~val & GENMASK(4, 0) : val;
>>> +
>>> +		if (pattern[i].delta_t != EL_PATTERN_DELAY_MSEC ||
>>> +		    pattern[i].brightness != t)
>>> +			return false;
>>> +
>>> +		val = right ? val >> 1 : val << 1;
>>> +	}
>>
>> Nice!
>>
>>> +
>>> +	return true;
>>> +}
>>> +
>>> +static bool is_bounce(const struct led_pattern *pattern, u32 len, bool inv)
>>> +{
>>> +	if (len != EL_PATTERN_LEN)
>>> +		return false;
>>> +
>>> +	return is_cascade(pattern, EL_PATTERN_HALF_LEN, inv, false) &&
>>> +	       is_cascade(pattern +  EL_PATTERN_HALF_LEN,
>>> +			  EL_PATTERN_HALF_LEN, inv, true);
>>> +}
>>> +
>>> +static int el15203000_pattern_set_P(struct led_classdev *ldev,
>>> +				    struct led_pattern *pattern,
>>> +				    u32 len, int repeat)
>>> +{
>>> +	struct el15203000_led	*led = container_of(ldev,
>>> +						    struct el15203000_led,
>>> +						    ldev);
>>> +
>>> +	if (repeat > 0)
>>
>> This is wrong. Repeat has to be -1 or > 0. If all patterns supported
>> by your device are infinite, then you should expect here -1.
> 
> Ok, then we have bug in led pattern trigger.
> echo -1 > /…/repeat doesn’t work as expected and return error.
> So if I tried to change repeat from sysfs, it will never be -1 again. 

Yes, I see now that we probably have a bug in repeat_store()
in drivers/leds/trigger/ledtrig-pattern.c.. It assumes that we have
already some pattern tuples defined and works properly only then.

It is not prepared for a case when we want to set repeat count
before defining the pattern and attempts to immediately start
pattern via pattern_trig_start_pattern(), which returns error
when no proper pattern is defined.

To fix that we could perhaps attempt to (re)start pattern in
repeat_store() only if data->npatterns > 0. It would be even
consequent with what we have there already few lines above
where led_cdev->pattern_clear(led_cdev) is guarded similarly.

>>
>> Either way this needs to be covered in the ABI documentation too.
>>
>>> +		return -EINVAL;
>>> +
>>> +	if (is_cascade(pattern, len, false, false)) {
>>> +		dev_dbg(led->priv->dev, "Cascade mode for 0x%02x(%c)",
>>> +			led->reg, led->reg);
>>> +
>>> +		return el15203000_cmd(led, EL_PIPE_CASCADE);
>>> +	} else if (is_cascade(pattern, len, true, false)) {
>>> +		dev_dbg(led->priv->dev, "Inverse cascade mode for 0x%02x(%c)",
>>> +			led->reg, led->reg);
>>> +
>>> +		return el15203000_cmd(led, EL_PIPE_INV_CASCADE);
>>> +	} else if (is_bounce(pattern, len, false)) {
>>> +		dev_dbg(led->priv->dev, "Bounce mode for 0x%02x(%c)",
>>> +			led->reg, led->reg);
>>> +
>>> +		return el15203000_cmd(led, EL_PIPE_BOUNCE);
>>> +	} else if (is_bounce(pattern, len, true)) {
>>> +		dev_dbg(led->priv->dev, "Inverse bounce mode for 0x%02x(%c)",
>>> +			led->reg, led->reg);
>>> +
>>> +		return el15203000_cmd(led, EL_PIPE_INV_BOUNCE);
>>> +	}
>>> +
>>> +	return -EINVAL;
>>> +}
>>> +
>>> +static int el15203000_pattern_clear(struct led_classdev *ldev)
>>> +{
>>> +	struct el15203000_led	*led = container_of(ldev,
>>> +						    struct el15203000_led,
>>> +						    ldev);
>>> +
>>> +	return el15203000_cmd(led, EL_OFF);
>>> +}
>>> +
>>> +static int el15203000_probe_dt(struct el15203000 *priv)
>>> +{
>>> +	size_t			i = 0;
>>> +	struct el15203000_led	*led;
>>> +	struct fwnode_handle	*child;
>>> +	int			ret;
>>> +	u32			reg;
>>> +	struct led_init_data	init_data = {};
>>> +
>>> +	device_for_each_child_node(priv->dev, child) {
>>
>> Please move above init_data initialization here.
> 
> No problem.
> 
>>
>>
>>> +		led = &priv->leds[i];
>>
>> You can increment 'i' here, it is not used below and you will save one
>> LOC:
>>
>> 		led = &priv->leds[i++];
> 
> Agree.
> 
>>
>>> +
>>> +		init_data.fwnode = child;
>>
>> Please move it to where it will be needed. i.e. one line above
>> devm_led_classdev_register_ext().
> 
> Will do.
> 
>>
>>> +
>>> +		ret = fwnode_property_read_u32(child, "reg", &reg);
>>> +		if (ret) {
>>> +			dev_err(priv->dev, "LED without ID number");
>>> +			fwnode_handle_put(child);
>>> +
>>> +			return ret;
>>> +		}
>>> +
>>> +		if (reg > U8_MAX) {
>>> +			dev_err(priv->dev, "LED value %d is invalid", reg);
>>> +			fwnode_handle_put(child);
>>> +
>>> +			return -EINVAL;
>>> +		}
>>> +
>>> +		led->reg = reg;
>>
>> I'd just pass &led->reg directly to fwnode_property_read_u32().
>> Then you'll be able to drop local reg variable.
> 
> For this device/driver reg value is just one byte
> You are ok to waste 3 bytes for every EL15203000 LED?

You're wasting them anyway due to alignment. If you really
cared about that you could add __packed modifier
to the struct definition but I don't think it makes
big difference in this case.

>>
>>> +
>>> +		fwnode_property_read_string(child, "linux,default-trigger",
>>> +					    &led->ldev.default_trigger);
>>> +
>>> +		led->priv			  = priv;
>>> +		led->ldev.max_brightness	  = LED_ON;
>>> +		led->ldev.brightness_set_blocking = el15203000_set_blocking;
>>> +
>>> +		if (reg == 'S') {
>>> +			led->ldev.pattern_set	= el15203000_pattern_set_S;
>>> +			led->ldev.pattern_clear	= el15203000_pattern_clear;
>>> +		} else if (reg == 'P') {
>>> +			led->ldev.pattern_set	= el15203000_pattern_set_P;
>>> +			led->ldev.pattern_clear	= el15203000_pattern_clear;
>>> +		}
>>> +
>>> +		ret = devm_led_classdev_register_ext(priv->dev, &led->ldev,
>>> +						     &init_data);
>>> +		if (ret) {
>>> +			dev_err(priv->dev,
>>> +				"failed to register LED device %s, err %d",
>>> +				led->ldev.name, ret);
>>> +			fwnode_handle_put(child);
>>> +
>>> +			return ret;
>>> +		}
>>> +
>>> +		i++;
>>> +	}
>>> +
>>> +	return ret;
>>> +}
>>> +
>>> +static int el15203000_probe(struct spi_device *spi)
>>> +{
>>> +	struct el15203000	*priv;
>>> +	size_t			count;
>>> +	int			ret;
>>> +
>>> +	count = device_get_child_node_count(&spi->dev);
>>> +	if (!count) {
>>> +		dev_err(&spi->dev, "LEDs are not defined in device tree!");
>>> +		return -ENODEV;
>>> +	}
>>> +
>>> +	priv = devm_kzalloc(&spi->dev, struct_size(priv, leds, count),
>>> +			    GFP_KERNEL);
>>> +	if (!priv)
>>> +		return -ENOMEM;
>>> +
>>> +	mutex_init(&priv->lock);
>>> +	priv->count	= count;
>>> +	priv->dev	= &spi->dev;
>>> +	priv->spi	= spi;
>>> +	priv->delay	= jiffies -
>>> +			  usecs_to_jiffies(EL_FW_DELAY_USEC);
>>> +
>>> +	ret = el15203000_probe_dt(priv);
>>> +	if (ret)
>>> +		return ret;
>>> +
>>> +	spi_set_drvdata(spi, priv);
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static int el15203000_remove(struct spi_device *spi)
>>> +{
>>> +	struct el15203000 *priv = spi_get_drvdata(spi);
>>> +
>>> +	mutex_destroy(&priv->lock);
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static const struct of_device_id el15203000_dt_ids[] = {
>>> +	{ .compatible = "crane,el15203000", },
>>> +	{},
>>> +};
>>> +
>>> +MODULE_DEVICE_TABLE(of, el15203000_dt_ids);
>>> +
>>> +static struct spi_driver el15203000_driver = {
>>> +	.probe		= el15203000_probe,
>>> +	.remove		= el15203000_remove,
>>> +	.driver = {
>>> +		.name		= KBUILD_MODNAME,
>>> +		.of_match_table	= el15203000_dt_ids,
>>> +	},
>>> +};
>>> +
>>> +module_spi_driver(el15203000_driver);
>>> +
>>> +MODULE_AUTHOR("Oleh Kravchenko <oleg@kaa.org.ua>");
>>> +MODULE_DESCRIPTION("el15203000 LED driver");
>>> +MODULE_LICENSE("GPL v2");
>>> +MODULE_ALIAS("spi:el15203000");
>>>
>>
>> -- 
>> Best regards,
>> Jacek Anaszewski
> 

-- 
Best regards,
Jacek Anaszewski
