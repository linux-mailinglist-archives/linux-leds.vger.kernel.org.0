Return-Path: <linux-leds+bounces-5478-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AFEB2B51681
	for <lists+linux-leds@lfdr.de>; Wed, 10 Sep 2025 14:05:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F30023AE20D
	for <lists+linux-leds@lfdr.de>; Wed, 10 Sep 2025 12:05:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4071228CF5E;
	Wed, 10 Sep 2025 12:05:11 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFED428725D;
	Wed, 10 Sep 2025 12:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757505911; cv=none; b=VBMYhT7K2h8oagdbU+VlFWDn9GNeYE/eTGub+ai052EvjJ0AyVDekkTCymLWtd5cgnNt88AZYFjldjn9F7nNbZ1VEDYMoiln1K/RLvjP6BO5wHmhGE9FNb5mjM9Hy1AjLLDbdxNY107bo9jA60dGdNK6lkU/3uNH4jLb+a/oOX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757505911; c=relaxed/simple;
	bh=bdzDIfJAO9naVesO5ghAegwF290w/9cda2jd2nwY0wg=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:References:Cc:
	 In-Reply-To:Content-Type; b=AjriitSNtjD8MjdYjlI4UssuOqJF0JiFxaTFCOZ59g6Bd7AJKgUE6L2S7crqYkvPY+bBEHd47dRGYRmDa0nq3aEETW+LQEZRoWCbDf8iBibZFZr/nqwzW/9PHs2HPjRMYy6umZKNpsWlquYudA3zyzFIiFdMuyqiPlYX+yW9zd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=timmermann.space; spf=pass smtp.mailfrom=timmermann.space; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=timmermann.space
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=timmermann.space
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4cMKBM1ygYz9tSL;
	Wed, 10 Sep 2025 14:04:59 +0200 (CEST)
Message-ID: <b4d2866d-e391-4230-a07d-05854456c185@timmermann.space>
Date: Wed, 10 Sep 2025 14:04:57 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Lukas Timmermann <linux@timmermann.space>
Subject: Re: [PATCH v8 2/2] leds: as3668: Driver for the ams Osram 4-channel
 i2c LED driver
To: Lee Jones <lee@kernel.org>
References: <20250808213143.146732-1-linux@timmermann.space>
 <20250808213143.146732-3-linux@timmermann.space>
 <20250902075037.GA2163762@google.com>
 <886ea017-7b40-43e8-a366-9e890b10c0f8@timmermann.space>
 <20250902120944.GJ2163762@google.com>
Content-Language: en-US, de-DE
Cc: pavel@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20250902120944.GJ2163762@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

I'm sorry for the last message. It was sent incorrectly. Here is a fixed 
version.

On Tue, 02 Sep 2025, Lee Jones wrote:
> On Tue, 02 Sep 2025, Lukas Timmermann wrote:
> 
>> On Tue, 02 Sep 2025, Lee Jones wrote:> On Fri, 08 Aug 2025, Lukas Timmermann
>> wrote:
>>>
>>>> Since there were no existing drivers for the AS3668 or related devices,
>>>> a new driver was introduced in a separate file. Similar devices were
>>>> reviewed, but none shared enough characteristics to justify code reuse.
>>>> As a result, this driver is written specifically for the AS3668.
>>>>
>>>> Signed-off-by: Lukas Timmermann <linux@timmermann.space>
>>>> ---
>>>>    MAINTAINERS                |   1 +
>>>>    drivers/leds/Kconfig       |  13 +++
>>>>    drivers/leds/Makefile      |   1 +
>>>>    drivers/leds/leds-as3668.c | 202 +++++++++++++++++++++++++++++++++++++
>>>>    4 files changed, 217 insertions(+)
>>>>    create mode 100644 drivers/leds/leds-as3668.c
>>>>
>>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>>> index 091206c54c63..945d78fef380 100644
>>>> --- a/MAINTAINERS
>>>> +++ b/MAINTAINERS
>>>> @@ -3511,6 +3511,7 @@ M:	Lukas Timmermann <linux@timmermann.space>
>>>>    L:	linux-leds@vger.kernel.org
>>>>    S:	Maintained
>>>>    F:	Documentation/devicetree/bindings/leds/ams,as3668.yaml
>>>> +F:	drivers/leds/leds-as3668.c
>>>>    ASAHI KASEI AK7375 LENS VOICE COIL DRIVER
>>>>    M:	Tianshu Qiu <tian.shu.qiu@intel.com>
>>>> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
>>>> index a104cbb0a001..8cfb423ddf82 100644
>>>> --- a/drivers/leds/Kconfig
>>>> +++ b/drivers/leds/Kconfig
>>>> @@ -100,6 +100,19 @@ config LEDS_ARIEL
>>>>    	  Say Y to if your machine is a Dell Wyse 3020 thin client.
>>>> +config LEDS_AS3668
>>>> +	tristate "LED support for AMS AS3668"
>>>> +	depends on LEDS_CLASS
>>>> +	depends on I2C
>>>> +	help
>>>> +	  This option enables support for the AMS AS3668 LED controller.
>>>> +	  The AS3668 provides up to four LED channels and is controlled via
>>>> +	  the I2C bus. This driver offers basic brightness control for each
>>>> +	  channel, without support for blinking or other advanced features.
>>>> +
>>>> +	  To compile this driver as a module, choose M here: the module
>>>> +	  will be called leds-as3668.
>>>> +
>>>>    config LEDS_AW200XX
>>>>    	tristate "LED support for Awinic AW20036/AW20054/AW20072/AW20108"
>>>>    	depends on LEDS_CLASS
>>>> diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
>>>> index 2f170d69dcbf..983811384fec 100644
>>>> --- a/drivers/leds/Makefile
>>>> +++ b/drivers/leds/Makefile
>>>> @@ -14,6 +14,7 @@ obj-$(CONFIG_LEDS_ADP5520)		+= leds-adp5520.o
>>>>    obj-$(CONFIG_LEDS_AN30259A)		+= leds-an30259a.o
>>>>    obj-$(CONFIG_LEDS_APU)			+= leds-apu.o
>>>>    obj-$(CONFIG_LEDS_ARIEL)		+= leds-ariel.o
>>>> +obj-$(CONFIG_LEDS_AS3668)		+= leds-as3668.o
>>>>    obj-$(CONFIG_LEDS_AW200XX)		+= leds-aw200xx.o
>>>>    obj-$(CONFIG_LEDS_AW2013)		+= leds-aw2013.o
>>>>    obj-$(CONFIG_LEDS_BCM6328)		+= leds-bcm6328.o
>>>> diff --git a/drivers/leds/leds-as3668.c b/drivers/leds/leds-as3668.c
>>>> new file mode 100644
>>>> index 000000000000..0cfd3b68f90c
>>>> --- /dev/null
>>>> +++ b/drivers/leds/leds-as3668.c
>>>> @@ -0,0 +1,202 @@
>>>> +// SPDX-License-Identifier: GPL-2.0-or-later
>>>> +/*
>>>> + *  Osram AMS AS3668 LED Driver IC
>>>> + *
>>>> + *  Copyright (C) 2025 Lukas Timmermann <linux@timmermann.space>
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
>>> This is odd.  What do you mean by expected?
>>>
>>> What kind of ID is this?  Board ID, platform ID, Chip ID?
>>>
>>> Call it that instead.
>> Calling it just AS3668_CHIP_ID1 then?
>> It's the identifier of the chip model burned into silicon in the CHIP_ID1
>> register. Checking it isn't critical in the first place.
>> It catches errors made in DT files but nothing else. You haven't commented
>> about that so i guess it's okay. Are drivers in the led subsystem supposed
>> to check that?>
> 
> CHIP_ID1 is the register, but what does the number signify?
> 
> What version of the chip?  Does the chip have a name?
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
>> I could imagine AS3668_MODE_REG being more descriptive but we would diverge
>> from the datasheet. Is that acceptable?>
> 
> It is if you say it is.  Some authors like to stick to the datasheet,
> which I would respect.  Others think that datasheet authors / register
> namers are bonkers and the S/W should be much more friendly to readers.
> 
All the register names are taken from the datasheet. I considered 
renaming them but I think it would do more harm than good as the 
datasheet is publicly available and could be helpful for future changes.

