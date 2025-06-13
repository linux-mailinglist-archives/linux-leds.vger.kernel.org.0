Return-Path: <linux-leds+bounces-4796-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D7E27AD8A9E
	for <lists+linux-leds@lfdr.de>; Fri, 13 Jun 2025 13:36:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CB53D3BD9CE
	for <lists+linux-leds@lfdr.de>; Fri, 13 Jun 2025 11:34:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFD5E2DCBE2;
	Fri, 13 Jun 2025 11:34:29 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 893321E0DE8;
	Fri, 13 Jun 2025 11:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749814469; cv=none; b=eBlaS4Qt8CZdIvn6mbFe7kMRuiClCUdkFy6fyG5fKLL3x9cyhbOFgJmCUSZYW56C2GwkFDOk5zIt2ax7N/VXLOkQSyTQn3A/UtiNkA+hjk1QdEoYUxbFuILP0sgLAq0bcXYPC0zhR8WGd/d9ZuymqusSgx5G/SvFQRQkQ9gs4jA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749814469; c=relaxed/simple;
	bh=xA+zEpZ1FkdZXdfe1TRGnTDv0gMFvhRy+g6ZUqPvvs4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tVxa4gYr8t8zqhvDJfDkP0WJmkNgYI8QMcEDyO87zBIe4O8Vx0rUxPknjtUfkhvOnSJAl95bwxayNw9jYGWw43KXVFtBJES3rbQE3fWFrJ/53RyzwHPDktcXBt3nsEaPQDE/yQ6HtsgUrqlnjsoiQEbgF4nEV0VhsYGltD0AQWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=timmermann.space; spf=pass smtp.mailfrom=timmermann.space; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=timmermann.space
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=timmermann.space
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4bJck66GWDz9sfB;
	Fri, 13 Jun 2025 13:34:22 +0200 (CEST)
Message-ID: <10680b25-2953-4dbb-9ff1-362bcf0f84cc@timmermann.space>
Date: Fri, 13 Jun 2025 13:34:19 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v6 2/2] leds: as3668: Driver for the ams Osram 4-channel
 i2c LED driver
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, lee@kernel.org,
 pavel@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250611083151.22150-1-linux@timmermann.space>
 <20250611083151.22150-3-linux@timmermann.space>
 <5e131f07-9753-4d2f-a043-35751c278a63@wanadoo.fr>
Content-Language: en-US, de-DE
From: Lukas Timmermann <linux@timmermann.space>
In-Reply-To: <5e131f07-9753-4d2f-a043-35751c278a63@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

okay thanks, I will wait a week or two until sending the next patch.

I've never worked with this email-based workflow before. That's the 
reason I've chosen this simple driver as a first patch in the first 
place. Just to get a little bit of experience under my belt. I know I'm 
making a few very obvious mistakes. I'm getting a bit overwhelmed by all 
the things to remember, I guess.

Apologies for the noise.

Best regards,
Lukas Timmermann

Am 12.06.25 um 22:27 schrieb Christophe JAILLET:
> Le 11/06/2025 à 10:31, Lukas Timmermann a écrit :
>> Since there were no existing drivers for the AS3668 or related devices,
>> a new driver was introduced in a separate file. Similar devices were
>> reviewed, but none shared enough characteristics to justify code reuse.
>> As a result, this driver is written specifically for the AS3668.
>>
>> Signed-off-by: Lukas Timmermann <linux@timmermann.space>
> 
> Hi,
> 
> first, I should that you should wait longer before sending each new 
> version, so that you can collect more feedback.
> 
>> ---
>>   MAINTAINERS                |   1 +
>>   drivers/leds/Kconfig       |  13 +++
>>   drivers/leds/Makefile      |   1 +
>>   drivers/leds/leds-as3668.c | 204 +++++++++++++++++++++++++++++++++++++
>>   4 files changed, 219 insertions(+)
>>   create mode 100644 drivers/leds/leds-as3668.c
> 
> ...
> 
>> +static int as3668_dt_init(struct as3668 *as3668)
>> +{
>> +    struct device *dev = &as3668->client->dev;
>> +    struct as3668_led *led;
>> +    struct led_init_data init_data = {};
>> +    int err;
>> +    u32 reg;
>> +
>> +    for_each_available_child_of_node_scoped(dev_of_node(dev), child) {
>> +        err = of_property_read_u32(child, "reg", &reg);
>> +        if (err) {
>> +            dev_err(dev, "unable to read device tree led reg, err 
>> %d\n", err);
> 
> as3668_dt_init() is only called from the probe. Sometimes maintainers 
> prefer using "return dev_err_probe()" in such a case, to have less 
> verbose code.
> (I don't know if it is the case for the leds subsystem)
> 
>> +            return err;
>> +        }
>> +
>> +        if (reg < 0 || reg > AS3668_MAX_LEDS) {
>> +            dev_err(dev, "unsupported led reg %d\n", reg);
>> +            return -EOPNOTSUPP;
> 
> Same.
> 
>> +        }
>> +
>> +        led = &as3668->leds[reg];
>> +        led->fwnode = of_fwnode_handle(child);
>> +
>> +        led->num = reg;
>> +        led->chip = as3668;
>> +
>> +        led->cdev.max_brightness = U8_MAX;
>> +        led->cdev.brightness_get = as3668_brightness_get;
>> +        led->cdev.brightness_set = as3668_brightness_set;
>> +
>> +        init_data.fwnode = led->fwnode;
>> +        init_data.default_label = ":";
>> +
>> +        err = devm_led_classdev_register_ext(dev, &led->cdev, 
>> &init_data);
>> +        if (err) {
>> +            dev_err(dev, "failed to register %d LED\n", reg);
>> +            return err;
> 
> Same.
> 
>> +        }
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>> +static int as3668_probe(struct i2c_client *client)
>> +{
>> +    u8 chip_id1, chip_id2, chip_serial, chip_rev;
>> +    struct as3668 *as3668;
>> +
>> +    /* Check for sensible i2c address */
>> +    if (client->addr != 0x42)
>> +        return dev_err_probe(&client->dev, -EFAULT,
>> +                     "unexpected address for as3668 device\n");
>> +
>> +    /* Read identifier from chip */
>> +    chip_id1 = as3668_read_value(client, AS3668_CHIP_ID1);
>> +
>> +    if (chip_id1 != AS3668_CHIP_IDENT)
>> +        return dev_err_probe(&client->dev, -ENODEV,
>> +                "chip reported wrong id: 0x%02x\n", chip_id1);
>> +
>> +    /* Check the revision */
>> +    chip_id2 = as3668_read_value(client, AS3668_CHIP_ID2);
>> +    chip_serial = FIELD_GET(AS3668_CHIP_ID2_SERIAL_MASK, chip_id2);
>> +    chip_rev = FIELD_GET(AS3668_CHIP_ID2_REV_MASK, chip_id2);
>> +
>> +    if (chip_rev != AS3668_CHIP_REV1)
>> +        dev_warn(&client->dev, "unexpected chip revision\n");
>> +
>> +    /* Print out information about the chip */
>> +    dev_dbg(&client->dev,
>> +        "chip_id: 0x%02x | chip_id2: 0x%02x | chip_serial: 0x%02x | 
>> chip_rev: 0x%02x\n",
>> +        chip_id1, chip_id2, chip_serial, chip_rev);
>> +
>> +    as3668 = devm_kzalloc(&client->dev, sizeof(*as3668), GFP_KERNEL);
>> +
> 
> Unneeded new line.
> 
>> +    if (!as3668)
>> +        return -ENOMEM;
>> +
>> +    as3668->client = client;
>> +    int err = as3668_dt_init(as3668);
> 
> Would be better, IMHO, if err was declared at the top of the function.
> 
>> +
> 
> Unneeded new line.
> 
>> +    if (err) {
>> +        dev_err(&client->dev, "failed to initialize device, err 
>> %d\n", err);
> 
> return dev_err_probe() to be consistent with the code above.
> 
>> +        return err;
>> +    }
>> +
>> +    /* Initialize the chip */
>> +    as3668_write_value(client, AS3668_CURRX_CONTROL, 0x55);
>> +    as3668_write_value(client, AS3668_CURR1, 0x00);
>> +    as3668_write_value(client, AS3668_CURR2, 0x00);
>> +    as3668_write_value(client, AS3668_CURR3, 0x00);
>> +    as3668_write_value(client, AS3668_CURR4, 0x00);
>> +
>> +    return 0;
>> +}
> 
> ...
> 
> CJ
> 


