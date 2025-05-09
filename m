Return-Path: <linux-leds+bounces-4608-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F2CD4AB0BD5
	for <lists+linux-leds@lfdr.de>; Fri,  9 May 2025 09:37:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A9BD21BA18F5
	for <lists+linux-leds@lfdr.de>; Fri,  9 May 2025 07:37:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C655D26B968;
	Fri,  9 May 2025 07:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=emfend.at header.i=@emfend.at header.b="EJbTKNzM"
X-Original-To: linux-leds@vger.kernel.org
Received: from lx20.hoststar.hosting (lx20.hoststar.hosting [168.119.41.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14A241D7E41;
	Fri,  9 May 2025 07:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=168.119.41.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746776223; cv=none; b=pDmL9FXUxIdgLvkxyNh+yUmAI/3M4KZklXwasDZud2iFIu1W24oo4NWeoR4Am1/TKd089k19Nc2M7F5nrWwt7E/3qfemXU9u3/2xflL/kZtRzZMy4quVk696cykXEg7Re63ngwqx26MmLENLAq6sUHvRmp+CTOYkGO1fJzqUb+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746776223; c=relaxed/simple;
	bh=v4RJYrTLD3AuLSDA8ck/2vADTh0z7eLV6QPezD0lOBg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z1PciccLnrDrj9YDCOn5PMuuLdGeaN2Sb6QeseVXUynqM8xS0k5zNguAYBffnwYsjznTFAzKe0Dh3Xz4UeCv/q+bKAw03LnTWd3Ae9th0qAiH2alyWE6VDovtjvz08FOyPw1EZJy2gYDv6a7tj7+58lsmT8MOOH2mrSAr+3Cxy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emfend.at; spf=pass smtp.mailfrom=emfend.at; dkim=pass (1024-bit key) header.d=emfend.at header.i=@emfend.at header.b=EJbTKNzM; arc=none smtp.client-ip=168.119.41.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emfend.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=emfend.at
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=emfend.at;
	 s=mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References
	:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=PqRWRjq4iDCd8/24ot71ISCxxHqGfiMza7AyQ9P7QZc=; b=EJbTKNzMWddXOQ6OkUwEBAPo4y
	PaZKyQFvsv7BHVlYt8mj5gujU/O+rhj31zd1ChzRwIIIMvGGxvxvDMld6TI5D3UA6Xn6LmER+2pBI
	GaYFuetZqwvCe1aIt4juJlHrMo/6eUO37Ujjc1QcGLBhLfkTAEt05Jz0GenL19QpktXA=;
Received: from 194-208-208-245.tele.net ([194.208.208.245]:63582 helo=[192.168.0.218])
	by lx20.hoststar.hosting with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256
	(Exim 4.93)
	(envelope-from <matthias.fend@emfend.at>)
	id 1uDIHo-00HSQ4-BW; Fri, 09 May 2025 09:36:50 +0200
Message-ID: <8220a150-b114-441a-a13a-62dc5dbf0ade@emfend.at>
Date: Fri, 9 May 2025 09:36:45 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] leds: tps6131x: add support for Texas Instruments
 TPS6131X flash LED driver
To: Lee Jones <lee@kernel.org>
Cc: Pavel Machek <pavel@ucw.cz>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Pavel Machek <pavel@kernel.org>,
 linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, bsp-development.geo@leica-geosystems.com
References: <20250423-leds-tps6131x-v3-0-ca67d346a4ea@emfend.at>
 <20250423-leds-tps6131x-v3-2-ca67d346a4ea@emfend.at>
 <20250501110306.GF1567507@google.com>
 <74577715-b644-4281-8e9b-b481d2a026f3@emfend.at>
 <20250508143146.GP3865826@google.com>
Content-Language: de-DE
From: Matthias Fend <matthias.fend@emfend.at>
In-Reply-To: <20250508143146.GP3865826@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Score: 
X-Spam-Bar: 
X-Spam-Report: 

Hi Lee,

thank you for your answers and additional explanations.
Except for one point, I think I understand the rest and will amend it 
accordingly.

Am 08.05.2025 um 16:31 schrieb Lee Jones:
> On Fri, 02 May 2025, Matthias Fend wrote:
> 
>> Hi Lee,
>>
>> thank you for taking the time for this review.
>>
>> Am 01.05.2025 um 13:03 schrieb Lee Jones:
>>> On Wed, 23 Apr 2025, Matthias Fend wrote:
>>>
>>>> The TPS61310/TPS61311 is a flash LED driver with I2C interface. Its power
>>>> stage is capable of supplying a maximum total current of roughly 1500mA.
>>>> The TPS6131x provides three constant-current sinks, capable of sinking up
>>>> to 2 × 400mA (LED1 and LED3) and 800mA (LED2) in flash mode. In torch mode
>>>> each sink (LED1, LED2, LED3) supports currents up to 175mA.
>>>>
>>>> Signed-off-by: Matthias Fend <matthias.fend@emfend.at>
>>>> ---
>>>>    MAINTAINERS                        |   7 +
>>>>    drivers/leds/flash/Kconfig         |  11 +
>>>>    drivers/leds/flash/Makefile        |   1 +
>>>>    drivers/leds/flash/leds-tps6131x.c | 798 +++++++++++++++++++++++++++++++++++++
>>>>    4 files changed, 817 insertions(+)
>>>
>>> Looks pretty good in general.  Just a few nits, really.
>>>
>>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>>> index fa1e04e87d1d63c1b01b59744d7ade00fe5a1885..67e7c165efd332dfe3bc5ec64a4cc10845d7bbd6 100644
>>>> --- a/MAINTAINERS
>>>> +++ b/MAINTAINERS
>>>> @@ -23983,6 +23983,13 @@ F:	Documentation/devicetree/bindings/hwmon/ti,tps23861.yaml
>>>>    F:	Documentation/hwmon/tps23861.rst
>>>>    F:	drivers/hwmon/tps23861.c
>>>> +TEXAS INSTRUMENTS TPS6131X FLASH LED DRIVER
>>>> +M:	Matthias Fend <matthias.fend@emfend.at>
>>>> +L:	linux-leds@vger.kernel.org
>>>> +S:	Maintained
>>>> +F:	Documentation/devicetree/bindings/leds/ti,tps6131x.yaml
>>>> +F:	drivers/leds/flash/leds-tps6131x.c
>>>> +
>>>>    TEXAS INSTRUMENTS' DAC7612 DAC DRIVER
>>>>    M:	Ricardo Ribalda <ribalda@kernel.org>
>>>>    L:	linux-iio@vger.kernel.org
>>>> diff --git a/drivers/leds/flash/Kconfig b/drivers/leds/flash/Kconfig
>>>> index f39f0bfe6eefcd376405d9d35dc36e323a485002..55ca663ca506ad8be627f58f6d6308368ea2b928 100644
>>>> --- a/drivers/leds/flash/Kconfig
>>>> +++ b/drivers/leds/flash/Kconfig
>>>> @@ -132,4 +132,15 @@ config LEDS_SY7802
>>>>    	  This driver can be built as a module, it will be called "leds-sy7802".
>>>> +config LEDS_TPS6131X
>>>> +	tristate "LED support for TI TPS6131x flash LED driver"
>>>> +	depends on I2C && OF
>>>> +	depends on GPIOLIB
>>>> +	select REGMAP_I2C
>>>> +	help
>>>> +	  This option enables support for Texas Instruments TPS61310/TPS61311
>>>> +	  flash LED driver.
>>>> +
>>>> +	  This driver can be built as a module, it will be called "leds-tps6131x".
>>>> +
>>>>    endif # LEDS_CLASS_FLASH
>>>> diff --git a/drivers/leds/flash/Makefile b/drivers/leds/flash/Makefile
>>>> index 48860eeced79513a0ed303e4af3db9bfe9724b7e..712fb737a428e42747e1aa339058dc4306ade9c8 100644
>>>> --- a/drivers/leds/flash/Makefile
>>>> +++ b/drivers/leds/flash/Makefile
>>>> @@ -12,3 +12,4 @@ obj-$(CONFIG_LEDS_RT4505)	+= leds-rt4505.o
>>>>    obj-$(CONFIG_LEDS_RT8515)	+= leds-rt8515.o
>>>>    obj-$(CONFIG_LEDS_SGM3140)	+= leds-sgm3140.o
>>>>    obj-$(CONFIG_LEDS_SY7802)	+= leds-sy7802.o
>>>> +obj-$(CONFIG_LEDS_TPS6131X)	+= leds-tps6131x.o
>>>> diff --git a/drivers/leds/flash/leds-tps6131x.c b/drivers/leds/flash/leds-tps6131x.c
>>>> new file mode 100644
>>>> index 0000000000000000000000000000000000000000..c123fb3f908c865f8a9e60b0339067cdb5a864f6
>>>> --- /dev/null
>>>> +++ b/drivers/leds/flash/leds-tps6131x.c
>>>> @@ -0,0 +1,798 @@
>>>> +// SPDX-License-Identifier: GPL-2.0-or-later
>>>> +/*
>>>> + * Texas Instruments TPS61310/TPS61311 flash LED driver with I2C interface
>>>> + *
>>>> + * Copyright 2025 Matthias Fend <matthias.fend@emfend.at>
>>>> + */
>>>> +
>>>> +#include <linux/gpio/consumer.h>
>>>> +#include <linux/i2c.h>
>>>> +#include <linux/led-class-flash.h>
>>>> +#include <linux/leds.h>
>>>> +#include <linux/module.h>
>>>> +#include <linux/regmap.h>
>>>> +#include <media/v4l2-flash-led-class.h>
>>>> +
>>>> +/* Registers */
>>>
>>> This little header comments are superfluous IMHO.
>>>
>>> The nomenclature of the defines is good enough.
>>
>> Okay, I'll remove them.
>>
>>>
>>>> +#define TPS6131X_REG_0				0x00
>>>> +#define TPS6131X_REG_0_RESET			BIT(7)
>>>
>>> Suggest adding a space or two before the bit defines, like:
>>>
>>> #define TPS6131X_REG_0                          0x00
>>> #define   TPS6131X_REG_0_RESET                  BIT(7)
>>
>> I actually like that too, but I couldn't convince clang-format to keep the
>> spaces. The automatic formatting was more valuable to me in the end. If you
>> know how to have both, I'd be very happy :)
> 
> I wouldn't let the tooling push you around.
> 
> IMHO that's a false positive and should be reported.
> 
>>>> +#define TPS6131X_REG_0_DCLC13			GENMASK(5, 3)
>>>> +#define TPS6131X_REG_0_DCLC13_SHIFT		3
>>>> +#define TPS6131X_REG_0_DCLC2			GENMASK(2, 0)
>>>> +#define TPS6131X_REG_0_DCLC2_SHIFT		0
>>>> +
>>>> +#define TPS6131X_REG_1				0x01
>>>> +#define TPS6131X_REG_1_MODE			GENMASK(7, 6)
>>>> +#define TPS6131X_REG_1_MODE_SHIFT		6
>>>> +#define TPS6131X_REG_1_FC2			GENMASK(5, 0)
>>>> +#define TPS6131X_REG_1_FC2_SHIFT		0
>>>> +
>>>> +#define TPS6131X_REG_2				0x02
>>>> +#define TPS6131X_REG_2_MODE			GENMASK(7, 6)
>>>> +#define TPS6131X_REG_2_MODE_SHIFT		6
>>>> +#define TPS6131X_REG_2_ENVM			BIT(5)
>>>> +#define TPS6131X_REG_2_FC13			GENMASK(4, 0)
>>>> +#define TPS6131X_REG_2_FC13_SHIFT		0
>>>> +
>>>> +#define TPS6131X_REG_3				0x03
>>>> +#define TPS6131X_REG_3_STIM			GENMASK(7, 5)
>>>> +#define TPS6131X_REG_3_STIM_SHIFT		5
>>>> +#define TPS6131X_REG_3_HPFL			BIT(4)
>>>> +#define TPS6131X_REG_3_SELSTIM_TO		BIT(3)
>>>> +#define TPS6131X_REG_3_STT			BIT(2)
>>>> +#define TPS6131X_REG_3_SFT			BIT(1)
>>>> +#define TPS6131X_REG_3_TXMASK			BIT(0)
>>>> +
>>>> +#define TPS6131X_REG_4				0x04
>>>> +#define TPS6131X_REG_4_PG			BIT(7)
>>>> +#define TPS6131X_REG_4_HOTDIE_HI		BIT(6)
>>>> +#define TPS6131X_REG_4_HOTDIE_LO		BIT(5)
>>>> +#define TPS6131X_REG_4_ILIM			BIT(4)
>>>> +#define TPS6131X_REG_4_INDC			GENMASK(3, 0)
>>>> +#define TPS6131X_REG_4_INDC_SHIFT		0
>>>> +
>>>> +#define TPS6131X_REG_5				0x05
>>>> +#define TPS6131X_REG_5_SELFCAL			BIT(7)
>>>> +#define TPS6131X_REG_5_ENPSM			BIT(6)
>>>> +#define TPS6131X_REG_5_STSTRB1_DIR		BIT(5)
>>>> +#define TPS6131X_REG_5_GPIO			BIT(4)
>>>> +#define TPS6131X_REG_5_GPIOTYPE			BIT(3)
>>>> +#define TPS6131X_REG_5_ENLED3			BIT(2)
>>>> +#define TPS6131X_REG_5_ENLED2			BIT(1)
>>>> +#define TPS6131X_REG_5_ENLED1			BIT(0)
>>>> +
>>>> +#define TPS6131X_REG_6				0x06
>>>> +#define TPS6131X_REG_6_ENTS			BIT(7)
>>>> +#define TPS6131X_REG_6_LEDHOT			BIT(6)
>>>> +#define TPS6131X_REG_6_LEDWARN			BIT(5)
>>>> +#define TPS6131X_REG_6_LEDHDR			BIT(4)
>>>> +#define TPS6131X_REG_6_OV			GENMASK(3, 0)
>>>> +#define TPS6131X_REG_6_OV_SHIFT			0
>>>> +
>>>> +#define TPS6131X_REG_7				0x07
>>>> +#define TPS6131X_REG_7_ENBATMON			BIT(7)
>>>> +#define TPS6131X_REG_7_BATDROOP			GENMASK(6, 4)
>>>> +#define TPS6131X_REG_7_BATDROOP_SHIFT		4
>>>> +#define TPS6131X_REG_7_REVID			GENMASK(2, 0)
>>>> +#define TPS6131X_REG_7_REVID_SHIFT		0
>>>> +
>>>> +/* Constants */
>>>> +
>>>> +#define TPS6131X_MAX_CHANNELS			3
>>>> +
>>>> +#define TPS6131X_FLASH_MAX_I_CHAN13_MA		400
>>>> +#define TPS6131X_FLASH_MAX_I_CHAN2_MA		800
>>>> +#define TPS6131X_FLASH_STEP_I_MA		25
>>>> +
>>>> +#define TPS6131X_TORCH_MAX_I_CHAN13_MA		175
>>>> +#define TPS6131X_TORCH_MAX_I_CHAN2_MA		175
>>>> +#define TPS6131X_TORCH_STEP_I_MA		25
>>>> +
>>>> +#define TPS6131X_TORCH_REFRESH_INTERVAL_JIFFIES msecs_to_jiffies(10000)
>>>
>>> Why 10s?
>>
>> At the point where the timer starts, there's a comment that says the
>> register must be updated within a timeout of 13 seconds.
>> So I thought 10 seconds would be a nice, appropriate interval.
> 
> Maybe put this useful info in a small comment.
> 
>>>
>>>> +#define UA_TO_MA(UA)				((UA) / 1000)
>>>
>>> I'm surprised a generic macro like this doesn't exist already.
>>>
>>>> +enum tps6131x_mode {
>>>> +	TPS6131X_MODE_SHUTDOWN = 0x0,
>>>> +	TPS6131X_MODE_TORCH = 0x1,
>>>> +	TPS6131X_MODE_FLASH = 0x2,
>>>
>>> Are these set in stone or are they arbitrary?
>>
>> The values ​​are fixed because they are written directly to a register.
>> In V1, I used an enum without values ​​and mapped it to the register value in
>> a function. I was asked to omit this mapping and use the enum directly.
>>
>> TLDR:
>> [x] stone
>> [ ] arbitrary
>>
>>>
>>>> +};
>>>> +
>>>> +struct tps6131x {
>>>> +	struct device *dev;
>>>> +	struct regmap *regmap;
>>>> +	struct gpio_desc *reset_gpio;
>>>> +	/*
>>>> +	 * Registers 0, 1, 2, and 3 control parts of the controller that are not completely
>>>> +	 * independent of each other. Since some operations require the registers to be written in
>>>> +	 * a specific order to avoid unwanted side effects, they are synchronized with a lock.
>>>> +	 */
>>>> +	struct mutex lock; /* Hardware access lock for register 0, 1, 2 and 3 */
>>>> +	struct delayed_work torch_refresh_work;
>>>> +	bool valley_current_limit;
>>>> +	bool chan1_en;
>>>> +	bool chan2_en;
>>>> +	bool chan3_en;
>>>> +	struct fwnode_handle *led_node;
>>>> +	u32 max_flash_current_ma;
>>>> +	u32 step_flash_current_ma;
>>>> +	u32 max_torch_current_ma;
>>>> +	u32 step_torch_current_ma;
>>>> +	u32 max_timeout_us;
>>>> +	struct led_classdev_flash fled_cdev;
>>>> +	struct v4l2_flash *v4l2_flash;
>>>> +};
>>>> +
>>>> +static struct tps6131x *fled_cdev_to_tps6131x(struct led_classdev_flash *fled_cdev)
>>>> +{
>>>> +	return container_of(fled_cdev, struct tps6131x, fled_cdev);
>>>> +}
>>>> +
>>>> +/*
>>>> + * Register contents after a power on/reset. These values cannot be changed.
>>>> + */
>>>> +static const struct reg_default tps6131x_regmap_defaults[] = {
>>>> +	{ TPS6131X_REG_0, (1 << TPS6131X_REG_0_DCLC13_SHIFT) | (2 << TPS6131X_REG_0_DCLC2_SHIFT) },
>>>
>>> Real values should be defined.  What does 2 even do, etc?
>>
>> Initially, I only had the bare values ​​here, so that no one would mistakenly
>> think that something could be changed here.
>> This information only contains the information about the reset state of the
>> registers from the datasheet.
>> The contents are only needed for correct cache handling and have no meaning
>> for the driver itself.
>> If I now create a separate 'INITIAL' define for each value, which is only
>> used here, it would probably make it a bit harder to read, wouldn't it? What
>> do you think?
> 
> I think that I like magic numbers to be defined. :)
> 
>>>> +	{ TPS6131X_REG_1, (0 << TPS6131X_REG_1_MODE_SHIFT) | (16 << TPS6131X_REG_1_FC2_SHIFT) },
>>>
>>> What's the point in oring 0 values?  Can't you just omit them?
>>
>> Of course, I could simply omit that. But the point was that I had to
>> describe which fields have which values.
>> If I omitted that, the information would somehow disappear.
> 
> It's okay to leave things like this in for documentation purposes,
> however since '0' is not documented with a define, it's effectively
> meaningless.  What is mode 0?  If you define all of these magic numbers,
> you can use the 'documentation' ~excuse~ reason guilt-free. :)
> 
>>>> +	{ TPS6131X_REG_2, (0 << TPS6131X_REG_2_MODE_SHIFT) | (8 << TPS6131X_REG_2_FC13_SHIFT) },
>>>> +	{ TPS6131X_REG_3, (6 << TPS6131X_REG_3_STIM_SHIFT) | TPS6131X_REG_3_TXMASK },
>>>> +	{ TPS6131X_REG_4, (0 << TPS6131X_REG_4_INDC_SHIFT) },
>>>> +	{ TPS6131X_REG_5, TPS6131X_REG_5_ENPSM | TPS6131X_REG_5_STSTRB1_DIR |
>>>> +				  TPS6131X_REG_5_GPIOTYPE | TPS6131X_REG_5_ENLED2 },
>>>> +	{ TPS6131X_REG_6, (9 << TPS6131X_REG_6_OV_SHIFT) },
>>>> +	{ TPS6131X_REG_7, (4 << TPS6131X_REG_7_BATDROOP_SHIFT) },
>>>> +};
>>>> +
>>>> +/*
>>>> + * These registers contain flags that are reset when read. Ensure that these registers are not read
>>>> + * outside of a call from the driver.
>>>
>>> You can simplify to just the first sentence.  The rest is implied.
>>
>> ACK.
>>
>>>
>>>> + */
>>>> +static bool tps6131x_regmap_precious(struct device *dev, unsigned int reg)
>>>> +{
>>>> +	switch (reg) {
>>>> +	case TPS6131X_REG_3:
>>>> +	case TPS6131X_REG_4:
>>>> +	case TPS6131X_REG_6:
>>>> +		return true;
>>>> +	default:
>>>> +		return false;
>>>> +	}
>>>> +}
>>>> +
>>>> +static const struct regmap_config tps6131x_regmap = {
>>>> +	.reg_bits = 8,
>>>> +	.val_bits = 8,
>>>> +	.max_register = TPS6131X_REG_7,
>>>> +	.reg_defaults = tps6131x_regmap_defaults,
>>>> +	.num_reg_defaults = ARRAY_SIZE(tps6131x_regmap_defaults),
>>>> +	.cache_type = REGCACHE_FLAT,
>>>
>>> This is new to me.  Why was this chosen over the usual REGCACHE_MAPLE?
>>
>> Since the register space for this chip is very small, simple, compact, and
>> contiguous, I think this is the right cache type for it. Did I miss
>> something here?
> 
> No, it's just unusual.  It's probably correct (you decide).
> 
>>>> +	.precious_reg = &tps6131x_regmap_precious,
>>>> +};
>>>> +
>>>> +struct tps6131x_timer_config {
>>>> +	u8 val;
>>>> +	u8 range;
>>>> +	u32 time_us;
>>>> +};
>>>> +
>>>> +static const struct tps6131x_timer_config tps6131x_timer_configs[] = {
>>>> +	{ .val = 0, .range = 1, .time_us = 5300 },
>>>> +	{ .val = 1, .range = 1, .time_us = 10700 },
>>>> +	{ .val = 2, .range = 1, .time_us = 16000 },
>>>> +	{ .val = 3, .range = 1, .time_us = 21300 },
>>>> +	{ .val = 4, .range = 1, .time_us = 26600 },
>>>> +	{ .val = 5, .range = 1, .time_us = 32000 },
>>>> +	{ .val = 6, .range = 1, .time_us = 37300 },
>>>> +	{ .val = 0, .range = 0, .time_us = 68200 },
>>>> +	{ .val = 7, .range = 1, .time_us = 71500 },
>>>> +	{ .val = 1, .range = 0, .time_us = 102200 },
>>>> +	{ .val = 2, .range = 0, .time_us = 136300 },
>>>> +	{ .val = 3, .range = 0, .time_us = 170400 },
>>>> +	{ .val = 4, .range = 0, .time_us = 204500 },
>>>> +	{ .val = 5, .range = 0, .time_us = 340800 },
>>>> +	{ .val = 6, .range = 0, .time_us = 579300 },
>>>> +	{ .val = 7, .range = 0, .time_us = 852000 },
>>>> +};
>>>> +
>>>> +static const struct tps6131x_timer_config *tps6131x_find_closest_timer_config(u32 timeout_us)
>>>> +{
>>>> +	const struct tps6131x_timer_config *timer_config = &tps6131x_timer_configs[0];
>>>> +	u32 diff, min_diff = U32_MAX;
>>>> +	int i;
>>>> +
>>>> +	for (i = 0; i < ARRAY_SIZE(tps6131x_timer_configs); i++) {
>>>> +		diff = abs(tps6131x_timer_configs[i].time_us - timeout_us);
>>>> +		if (diff < min_diff) {
>>>> +			timer_config = &tps6131x_timer_configs[i];
>>>> +			min_diff = diff;
>>>> +			if (!min_diff)
>>>> +				break;
>>>> +		}
>>>> +	}
>>>> +
>>>> +	return timer_config;
>>>> +}
>>>> +
>>>> +static int tps6131x_reset_chip(struct tps6131x *tps6131x)
>>>> +{
>>>> +	int ret;
>>>> +
>>>> +	if (tps6131x->reset_gpio) {
>>>> +		gpiod_set_value_cansleep(tps6131x->reset_gpio, 1);
>>>> +		fsleep(10);
>>>> +		gpiod_set_value_cansleep(tps6131x->reset_gpio, 0);
>>>> +		fsleep(100);
>>>> +	} else {
>>>> +		ret = regmap_update_bits(tps6131x->regmap, TPS6131X_REG_0, TPS6131X_REG_0_RESET,
>>>> +					 TPS6131X_REG_0_RESET);
>>>> +		if (ret)
>>>> +			return ret;
>>>> +
>>>> +		fsleep(100);
>>>> +
>>>> +		ret = regmap_update_bits(tps6131x->regmap, TPS6131X_REG_0, TPS6131X_REG_0_RESET, 0);
>>>> +		if (ret)
>>>> +			return ret;
>>>> +	}
>>>> +
>>>> +	return 0;
>>>> +}
>>>> +
>>>> +static int tps6131x_init_chip(struct tps6131x *tps6131x)
>>>> +{
>>>> +	u32 reg4, reg5, reg6;
>>>
>>> Why cant we just reuse a single variable called 'value'?
>>
>> This way, it's easy to spot a mistake. Each line can only contain parts that
>> use the same 'reg<x>'.
>> But I can easily change it and use only one variable.
> 
> Yes please.  It's common practice.
> 
>>>> +	int ret;
>>>> +
>>>> +	reg4 = tps6131x->valley_current_limit ? TPS6131X_REG_4_ILIM : 0;
>>>
>>> Nicer on the eye if we un-squidge these.
>>>
>>> No need to group everything like this.
>>
>> I'm happy to adapt the code here as well, but unfortunately I haven't quite
>> figured out how you'd like it to look. Could you please tell me more
>> specifically what I should change?
> 
> Like this:
> 
>>>> +	ret = regmap_write(tps6131x->regmap, TPS6131X_REG_4, reg4);
>>>> +	if (ret)
>>>> +		return ret;
>>>> +
>>>> +	reg5 = TPS6131X_REG_5_ENPSM | TPS6131X_REG_5_STSTRB1_DIR | TPS6131X_REG_5_GPIOTYPE;
> 
>>>> +	if (tps6131x->chan1_en)
>>>> +		reg5 |= TPS6131X_REG_5_ENLED1;
>>>> +
>>>> +	if (tps6131x->chan2_en)
>>>> +		reg5 |= TPS6131X_REG_5_ENLED2;
>>>> +
>>>> +	if (tps6131x->chan3_en)
>>>> +		reg5 |= TPS6131X_REG_5_ENLED3;
> 
>>>> +	ret = regmap_write(tps6131x->regmap, TPS6131X_REG_5, reg5);
>>>> +	if (ret)
>>>> +		return ret;
>>>> +
>>>> +	reg6 = TPS6131X_REG_6_ENTS;
> 
>>>> +	ret = regmap_write(tps6131x->regmap, TPS6131X_REG_6, reg6);
>>>> +	if (ret)
>>>> +		return ret;
>>>> +
>>>> +	return 0;
>>>> +}
>>>> +
>>>> +static int tps6131x_set_mode(struct tps6131x *tps6131x, enum tps6131x_mode mode, bool force)
>>>> +{
>>>> +	u8 val;
>>>> +
>>>> +	val = mode << TPS6131X_REG_1_MODE_SHIFT;
>>>
>>> You could do this during assignment.  Or, seeing as there is already a
>>> line break required, in the call itself.
>>
>> ACK.
>>
>>>
>>>> +
>>>> +	return regmap_update_bits_base(tps6131x->regmap, TPS6131X_REG_1, TPS6131X_REG_1_MODE, val,
>>>> +				       NULL, false, force);
>>>> +}
>>>> +
>>>> +static void tps6131x_torch_refresh_handler(struct work_struct *work)
>>>> +{
>>>> +	struct tps6131x *tps6131x = container_of(work, struct tps6131x, torch_refresh_work.work);
>>>> +
>>>> +	guard(mutex)(&tps6131x->lock);
>>>> +
>>>> +	tps6131x_set_mode(tps6131x, TPS6131X_MODE_TORCH, true);
>>>
>>> This can fail.
>>
>> That's true. I wasn't sure how to respond to this, other than just keep
>> trying.
>> What do you think about not starting the timer in case of an error and
>> instead outputting a message with dev_err?
> 
> Either check the value and/or provide a comment why checking is not required.
> 
>>>> +
>>>> +	schedule_delayed_work(&tps6131x->torch_refresh_work,
>>>> +			      TPS6131X_TORCH_REFRESH_INTERVAL_JIFFIES);
>>>> +}
>>>> +
>>>> +static int tps6131x_brightness_set(struct led_classdev *cdev, enum led_brightness brightness)
>>>> +{
>>>> +	struct led_classdev_flash *fled_cdev = lcdev_to_flcdev(cdev);
>>>> +	struct tps6131x *tps6131x = fled_cdev_to_tps6131x(fled_cdev);
>>>
>>>> +	u32 num_chans;
>>>> +	u32 steps_chan13, steps_chan2;
>>>> +	u32 steps_remaining;
>>>
>>> Why not group these?
>>
>> I will do so.
>>
>>>
>>>> +	u8 reg0;
>>>> +	int ret;
>>>> +
>>>> +	cancel_delayed_work_sync(&tps6131x->torch_refresh_work);
>>>> +
>>>> +	/*
>>>> +	 * The brightness parameter uses the number of current steps as the unit (not the current
>>>> +	 * value itself). Since the reported step size can vary depending on the configuration,
>>>> +	 * this value must be converted into actual register steps.
>>>> +	 */
>>>> +	steps_remaining = (brightness * tps6131x->step_torch_current_ma) / TPS6131X_TORCH_STEP_I_MA;
>>>> +
>>>> +	num_chans = tps6131x->chan1_en + tps6131x->chan2_en + tps6131x->chan3_en;
>>>> +
>>>> +	/*
>>>> +	 * The currents are distributed as evenly as possible across the activated channels.
>>>> +	 * Since channels 1 and 3 share the same register setting, they always use the same current
>>>> +	 * value. Channel 2 supports higher currents and thus takes over the remaining additional
>>>> +	 * portion that cannot be covered by the other channels.
>>>> +	 */
>>>> +	steps_chan13 = min_t(u32, steps_remaining / num_chans,
>>>> +			     TPS6131X_TORCH_MAX_I_CHAN13_MA / TPS6131X_TORCH_STEP_I_MA);
>>>> +	if (tps6131x->chan1_en)
>>>> +		steps_remaining -= steps_chan13;
>>>> +	if (tps6131x->chan3_en)
>>>> +		steps_remaining -= steps_chan13;
>>>> +
>>>> +	steps_chan2 = min_t(u32, steps_remaining,
>>>> +			    TPS6131X_TORCH_MAX_I_CHAN2_MA / TPS6131X_TORCH_STEP_I_MA);
>>>> +
>>>> +	guard(mutex)(&tps6131x->lock);
>>>> +
>>>> +	reg0 = (steps_chan13 << TPS6131X_REG_0_DCLC13_SHIFT) |
>>>> +	       (steps_chan2 << TPS6131X_REG_0_DCLC2_SHIFT);
>>>
>>> Indent.
>>
>> The indent was intention ;) The operands of arithmetic assignments are at
>> least intentionally and automatically aligned to be on the same column. This
>> is also the case elsewhere in the code.
>> What is the alternative expectation here?
> 
> I'd normally expect line feeds to be indented.
> 
> This is an odd one because nothing is in front of the open parenthesis.
> 
> I'm struggling to find any other examples like it - perhaps it is correct?!
> 
> [..]
> 
>>>> +static int tps6131x_v4l2_setup(struct tps6131x *tps6131x)
>>>> +{
>>>> +	struct v4l2_flash_config v4l2_cfg = { 0 };
>>>> +	struct led_flash_setting *intensity = &v4l2_cfg.intensity;
>>>> +
>>>> +	intensity->min = tps6131x->step_torch_current_ma;
>>>> +	intensity->max = tps6131x->max_torch_current_ma;
>>>> +	intensity->step = tps6131x->step_torch_current_ma;
>>>> +	intensity->val = intensity->min;
>>>> +
>>>> +	strscpy(v4l2_cfg.dev_name, tps6131x->fled_cdev.led_cdev.dev->kobj.name,
>>>> +		sizeof(v4l2_cfg.dev_name));
>>>> +
>>>> +	v4l2_cfg.has_external_strobe = true;
>>>> +	v4l2_cfg.flash_faults = LED_FAULT_TIMEOUT | LED_FAULT_OVER_TEMPERATURE |
>>>> +				LED_FAULT_SHORT_CIRCUIT | LED_FAULT_UNDER_VOLTAGE |
>>>> +				LED_FAULT_LED_OVER_TEMPERATURE;
>>>> +
>>>> +	tps6131x->v4l2_flash = v4l2_flash_init(tps6131x->dev, tps6131x->led_node,
>>>> +					       &tps6131x->fled_cdev, &tps6131x_v4l2_flash_ops,
>>>> +					       &v4l2_cfg);
>>>> +	if (IS_ERR(tps6131x->v4l2_flash)) {
>>>> +		dev_err(tps6131x->dev, "Failed to initialize v4l2 flash LED\n");
>>>> +		return PTR_ERR(tps6131x->v4l2_flash);
>>>> +	}
>>>> +
>>>> +	return 0;
>>>> +}
>>>> +
>>>> +static int tps6131x_probe(struct i2c_client *client)
>>>> +{
>>>> +	struct tps6131x *tps6131x;
>>>> +	int ret;
>>>> +
>>>> +	tps6131x = devm_kzalloc(&client->dev, sizeof(*tps6131x), GFP_KERNEL);
>>>> +	if (!tps6131x)
>>>> +		return -ENOMEM;
>>>> +
>>>> +	tps6131x->dev = &client->dev;
>>>> +	i2c_set_clientdata(client, tps6131x);
>>>
>>> If you already have client, to fetch this, you'll already have access to dev.
>>
>> I understand that in principle. However, I'm still not entirely sure what
>> exactly I should change. Could you please provide me with some further
>> guidance?
> 
> Yes, don't store 'dev' in 'tps6131x'.

Ah, I see. Yes, the functions currently using 'dev' are all called from 
the probe path, so I could just pass 'dev' as a separate argument and 
remove it from 'tps6131x'.
But since I now also output a message with dev_err in 
tps6131x_torch_refresh_handler() in case of an error, I need 
'tps6131x->dev' there. I haven't thought of any other way to get 'dev' here.

In this context, is it okay for you if 'dev' remains a member of 'tps6131x'?

Thanks
  ~Matthias

> 
>>>> +	mutex_init(&tps6131x->lock);
>>>> +	INIT_DELAYED_WORK(&tps6131x->torch_refresh_work, tps6131x_torch_refresh_handler);
>>>> +
>>>> +	ret = tps6131x_parse_node(tps6131x);
>>>> +	if (ret)
>>>> +		return -ENODEV;
>>>
>>> Why aren't we propagating the real error?
>>
>> Good point. I'll change that.
>>
>>>
>>>> +	tps6131x->regmap = devm_regmap_init_i2c(client, &tps6131x_regmap);
>>>> +	if (IS_ERR(tps6131x->regmap)) {
>>>> +		ret = PTR_ERR(tps6131x->regmap);
>>>
>>> Use dev_err_ptr_probe() instead.
>>
>> Hmm, I don't quite understand that. dev_err_ptr_probe() returns an error
>> pointer instead of an int, right?
> 
> Yes, disregard - I had a senior moment!
> 


