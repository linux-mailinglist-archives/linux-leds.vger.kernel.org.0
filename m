Return-Path: <linux-leds+bounces-5472-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 83A96B51639
	for <lists+linux-leds@lfdr.de>; Wed, 10 Sep 2025 13:57:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 634A6565AF4
	for <lists+linux-leds@lfdr.de>; Wed, 10 Sep 2025 11:57:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD03C313526;
	Wed, 10 Sep 2025 11:57:13 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7C5B25A355;
	Wed, 10 Sep 2025 11:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757505433; cv=none; b=M1lJnMyz2HE92e5Z+/XKDa7iixJUp5SIvfO41R75FDNwY0ckdKvlySuPMLUQiO/flyqfYGkRYyKYQY0nRyXovW2WeGjtCd9HCzSjl9dzQxquAzP6+pyxG30e/j59g9vtgINunqJvbyt3lYhT728rh5/eX+Up3SWEwrYA7q4eD9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757505433; c=relaxed/simple;
	bh=BNAymGbsk/LLslNv3KQi0+YNC2Er1zFt+MJxHW7z8Sc=;
	h=Message-ID:Date:MIME-Version:Subject:References:To:Cc:From:
	 In-Reply-To:Content-Type; b=edcpvIEBg+xOfUXGlKJxYwpzsWtJfvd2KNy4w+KxkzC2y5w2iKVVs/DNEc/6RV14NC1m/oZaCzqp3CrWmWmdyWh8HsX1bYkXdvMjNdGU9LzYGkiA3PI6NF75sxwVnV+/916AClgYMOstzN4QcHZTc+cybRt+9cygkD78sb0mjag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=timmermann.space; spf=pass smtp.mailfrom=timmermann.space; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=timmermann.space
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=timmermann.space
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4cMK1F4jMYz9tZT;
	Wed, 10 Sep 2025 13:57:05 +0200 (CEST)
Message-ID: <9d3cce84-451d-4af1-a54a-e6de8cb9699e@timmermann.space>
Date: Wed, 10 Sep 2025 13:57:03 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: [PATCH v8 2/2] leds: as3668: Driver for the ams Osram 4-channel i2c
 LED driver
Content-Language: en-US, de-DE
References: <32c7324f-60cb-4cae-beff-0a177a7986ea@timmermann.space>
To: Lee Jones <lee@kernel.org>
Cc: pavel@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
From: Lukas Timmermann <linux@timmermann.space>
In-Reply-To: <32c7324f-60cb-4cae-beff-0a177a7986ea@timmermann.space>
X-Forwarded-Message-Id: <32c7324f-60cb-4cae-beff-0a177a7986ea@timmermann.space>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On Tue, 02 Sep 2025, Lee Jones wrote:
> On Tue, 02 Sep 2025, Lukas Timmermann wrote:
>
>> On Tue, 02 Sep 2025, Lee Jones wrote:> On Fri, 08 Aug 2025, Lukas 
>> Timmermann
>> wrote:
>>>
>>>> Since there were no existing drivers for the AS3668 or related devices,
>>>> a new driver was introduced in a separate file. Similar devices were
>>>> reviewed, but none shared enough characteristics to justify code reuse.
>>>> As a result, this driver is written specifically for the AS3668.
>>>>
>>>> Signed-off-by: Lukas Timmermann <linux@timmermann.space>
>>>> ---
>>>> MAINTAINERS | 1 +
>>>> drivers/leds/Kconfig | 13 +++
>>>> drivers/leds/Makefile | 1 +
>>>> drivers/leds/leds-as3668.c | 202 +++++++++++++++++++++++++++++++++++++
>>>> 4 files changed, 217 insertions(+)
>>>> create mode 100644 drivers/leds/leds-as3668.c
>>>>
>>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>>> index 091206c54c63..945d78fef380 100644
>>>> --- a/MAINTAINERS
>>>> +++ b/MAINTAINERS
>>>> @@ -3511,6 +3511,7 @@ M: Lukas Timmermann <linux@timmermann.space>
>>>> L: linux-leds@vger.kernel.org
>>>> S: Maintained
>>>> F: Documentation/devicetree/bindings/leds/ams,as3668.yaml
>>>> +F: drivers/leds/leds-as3668.c
>>>> ASAHI KASEI AK7375 LENS VOICE COIL DRIVER
>>>> M: Tianshu Qiu <tian.shu.qiu@intel.com>
>>>> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
>>>> index a104cbb0a001..8cfb423ddf82 100644
>>>> --- a/drivers/leds/Kconfig
>>>> +++ b/drivers/leds/Kconfig
>>>> @@ -100,6 +100,19 @@ config LEDS_ARIEL
>>>> Say Y to if your machine is a Dell Wyse 3020 thin client.
>>>> +config LEDS_AS3668
>>>> + tristate "LED support for AMS AS3668"
>>>> + depends on LEDS_CLASS
>>>> + depends on I2C
>>>> + help
>>>> + This option enables support for the AMS AS3668 LED controller.
>>>> + The AS3668 provides up to four LED channels and is controlled via
>>>> + the I2C bus. This driver offers basic brightness control for each
>>>> + channel, without support for blinking or other advanced features.
>>>> +
>>>> + To compile this driver as a module, choose M here: the module
>>>> + will be called leds-as3668.
>>>> +
>>>> config LEDS_AW200XX
>>>> tristate "LED support for Awinic AW20036/AW20054/AW20072/AW20108"
>>>> depends on LEDS_CLASS
>>>> diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
>>>> index 2f170d69dcbf..983811384fec 100644
>>>> --- a/drivers/leds/Makefile
>>>> +++ b/drivers/leds/Makefile
>>>> @@ -14,6 +14,7 @@ obj-$(CONFIG_LEDS_ADP5520) += leds-adp5520.o
>>>> obj-$(CONFIG_LEDS_AN30259A) += leds-an30259a.o
>>>> obj-$(CONFIG_LEDS_APU) += leds-apu.o
>>>> obj-$(CONFIG_LEDS_ARIEL) += leds-ariel.o
>>>> +obj-$(CONFIG_LEDS_AS3668) += leds-as3668.o
>>>> obj-$(CONFIG_LEDS_AW200XX) += leds-aw200xx.o
>>>> obj-$(CONFIG_LEDS_AW2013) += leds-aw2013.o
>>>> obj-$(CONFIG_LEDS_BCM6328) += leds-bcm6328.o
>>>> diff --git a/drivers/leds/leds-as3668.c b/drivers/leds/leds-as3668.c
>>>> new file mode 100644
>>>> index 000000000000..0cfd3b68f90c
>>>> --- /dev/null
>>>> +++ b/drivers/leds/leds-as3668.c
>>>> @@ -0,0 +1,202 @@
>>>> +// SPDX-License-Identifier: GPL-2.0-or-later
>>>> +/*
>>>> + * Osram AMS AS3668 LED Driver IC
>>>> + *
>>>> + * Copyright (C) 2025 Lukas Timmermann <linux@timmermann.space>
>>>> + */
>>>> +
>>>> +#include <linux/bitfield.h>
>>>> +#include <linux/i2c.h>
>>>> +#include <linux/leds.h>
>>>> +#include <linux/module.h>
>>>> +#include <linux/uleds.h>
>>>> +
>>>> +#define AS3668_MAX_LEDS 4
>>>> +#define AS3668_EXPECTED_I2C_ADDR 0x42
>>>> +
>>>> +/* Chip Ident */
>>>> +
>>>> +#define AS3668_CHIP_ID1_REG 0x3e
>>>
>>> Can you tab out all of the values please.
>>>
>>>> +#define AS3668_CHIP_ID2_REG 0x3f
>>>> +#define AS3668_CHIP_ID1_EXPECTED_IDENTIFIER 0xa5
>>>
>>> This is odd. What do you mean by expected?
>>>
>>> What kind of ID is this? Board ID, platform ID, Chip ID?
>>>
>>> Call it that instead.
>> Calling it just AS3668_CHIP_ID1 then?
>> It's the identifier of the chip model burned into silicon in the CHIP_ID1
>> register. Checking it isn't critical in the first place.
>> It catches errors made in DT files but nothing else. You haven't 
>> commented
>> about that so i guess it's okay. Are drivers in the led subsystem 
>> supposed
>> to check that?>
>
> CHIP_ID1 is the register, but what does the number signify?
>
> What version of the chip? Does the chip have a name?
>
> What's the difference between the values in ID1 and ID2?
>
CHIP_ID1 is a register which contains a fixed magic number so a driver 
can check if it's talking to the correct chip. There is no deeper 
meaning to the number as far as the datasheet is concerned. We simply 
check the number. It's supposed to be 10100101b according to the datasheet.
CHIP_ID2 contains two fixed values. The upper four bits indicate a 
serial number of some sorts. The datasheet doesn't specify an expected 
value and doesn't state it's purpose. I suspect it to change between 
production runs. The lower four bits of the CHIP_ID2 register contains 
the revision of the chip.
None of these values are particulary important for the function of the 
driver. My suggested driver does check CHIP_ID1 just to fail early.
>>>> +#define AS3668_CHIP_ID2_SERIAL_MASK GENMASK(7, 4)
>>>> +#define AS3668_CHIP_ID2_REV_MASK GENMASK(3, 0)
>>>> +
>>>> +/* Current Control */
>>>> +
>>>
>>> The X thing (below) is weirding me out.
>>>
>>>> +#define AS3668_CURRX_CONTROL_REG 0x01
>>>
>>> Drop the X.
>> The datasheet explictly calls this "CurrX control". It configures the
>> outputs for different modes like off/on and pwm or pattern generation for
>> all four channels simultaneously.
>> I could imagine AS3668_MODE_REG being more descriptive but we would 
>> diverge
>> from the datasheet. Is that acceptable?>
>
> It is if you say it is. Some authors like to stick to the datasheet,
> which I would respect. Others think that datasheet authors / register
> namers are bonkers and the S/W should be much more friendly to readers.
>
All the register names are taken from the datasheet. I considered 
renaming them but I think it would do more harm than good as the 
datasheet is publicly available and could be helpful for future changes.

