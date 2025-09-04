Return-Path: <linux-leds+bounces-5384-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F7EAB43370
	for <lists+linux-leds@lfdr.de>; Thu,  4 Sep 2025 09:08:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ACAF25E0176
	for <lists+linux-leds@lfdr.de>; Thu,  4 Sep 2025 07:08:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5280D2882A7;
	Thu,  4 Sep 2025 07:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m6N7cdaK"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A57E2857F2;
	Thu,  4 Sep 2025 07:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756969725; cv=none; b=LrQMrBXj+gXXS1fgq7pa922vxovvqifDbBiCG+Vdmpm/2DHQ5CtypanRsDVjTCpQgQgd59tMHw7R4IXB+9uVM7VvesFEOBJF1Gq6E2k51XX6qxa7SA+VIK+ST7RoLOPEyHyGh6OSzvqTjQ5xHPSntwjpF0fqjHeBz/UPNjnap0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756969725; c=relaxed/simple;
	bh=tehr5OKKPXDCgpZtWn7ZOAAHOWoGtGokgtR8Jjc1MmQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XNIdyRangBC3svu+Itw4ifiUG+sMDAUdY2wGW8MTvpZJtN9QYLRZVpzXwvtrsFmdHT7YezAzUVs0ILls47N8MpLK94U7ZGIGsMEyODN4K0S+79sBSEobP17pinQVJ4eckpWkSD/1T42bnYD4KStDQiNRy7M9BoLT6PulltRDfvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m6N7cdaK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 204A4C4CEF0;
	Thu,  4 Sep 2025 07:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756969724;
	bh=tehr5OKKPXDCgpZtWn7ZOAAHOWoGtGokgtR8Jjc1MmQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=m6N7cdaKytyYJvWSl2a8fggZCeLDv0l3a2ZrFDuyip4K89mgISHAkwOXShutQqbR+
	 s9aZd5DijS6AeOMlcDIJSVZZaxNt6K4gnVJFzxk1P5TbWjJfjEd6TrrwYoc69MSVUd
	 48HbqappdvFS9PwbBWefa8AOOEyiX42YZ8/PMkwZeL2PK/UWtmtb+uyPDL5zyYWN0E
	 0goQHM8QRzjX0jRlvGX+echcqvlzluu3YEc0Mp+NU6YfoR4c+EO1JdKDhJPP98oCtL
	 WjATJAbaYiBoOAf8uA5r7LjTWMfVcOnA4AXspvjIFoXDIly3Ruqhuq81FJftRUj2QQ
	 I69EU8jKSYjbg==
Message-ID: <7a6aa370-a9e5-41f4-86d8-09d3f5c7643d@kernel.org>
Date: Thu, 4 Sep 2025 09:08:40 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] leds: led-class: Add devicetree support to led_get()
To: Aleksandrs Vinarskis <alex@vinarskis.com>, Lee Jones <lee@kernel.org>,
 Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: andy.shevchenko@gmail.com, devicetree@vger.kernel.org,
 linus.walleij@linaro.org, linux-kernel@vger.kernel.org,
 linux-leds@vger.kernel.org
References: <8aa9dfc5-5e77-48af-b2f4-f1964d20d6d1@kernel.org>
 <8aa9dfc5-5e77-48af-b2f4-f1964d20d6d1@kernel.org>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <8aa9dfc5-5e77-48af-b2f4-f1964d20d6d1@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 4-Sep-25 1:01 AM, Aleksandrs Vinarskis wrote:
>> Hi Aleksandrs,
>>
>> Thank you for working on this.
>>
>> On 2-Sep-25 1:10 PM, Aleksandrs Vinarskis wrote:
>>> From: Hans de Goede <hansg@kernel.org>
>>>
>>> Turn of_led_get() into a more generic __of_led_get() helper function,
>>> which can lookup LEDs in devicetree by either name or index.
>>>
>>> And use this new helper to add devicetree support to the generic
>>> (non devicetree specific) [devm_]led_get() function.
>>>
>>> This uses the standard devicetree pattern of adding a -names string array
>>> to map names to the indexes for an array of resources.
>>>
>>> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
>>> Reviewed-by: Lee Jones <lee@kernel.org>
>>> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
>>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>>
>> Please update this to:
>>
>> Reviewed-by: Hans de Goede <hansg@kernel.org>
>>
>> to match the update of the author which you already did.
>>
>> Also note that checkpatch should complain about the mismatch,
>> please ensure to run checkpatch before posting v2.
> 
> Hi,
> 
> ahh, I actually did not even see that email got changed, apologies. Seems
> 'b4' auto-corrected it when sending,

I already wondered if it might be something like that. b4 probably did
this because of the .mailmap entry mapping my Red Hat address (which
I've stopped using since I'm leaving Red Hat) to hansg@kernel.org .

> which would explain why checkpatch
> did not catch it, as I run it before importing and sending via 'b4'. Sure,
> will fix - did you mean to change your signoff to R-by, or is it a mistake?

It is a mistake please keep it as S-o-b.

> 
>>
>>> Tested-by: Aleksandrs Vinarskis <alex@vinarskis.com>
>>> ---
>>>  drivers/leds/led-class.c | 38 +++++++++++++++++++++++++++++---------
>>>  1 file changed, 29 insertions(+), 9 deletions(-)
>>>
>>> diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
>>> index 15633fbf3c166aa4f521774d245f6399a642bced..6f2ef4fa556b44ed3bf69dff556ae16fd2b7652b 100644
>>> --- a/drivers/leds/led-class.c
>>> +++ b/drivers/leds/led-class.c
>>> @@ -248,19 +248,18 @@ static const struct class leds_class = {
>>>  	.pm = &leds_class_dev_pm_ops,
>>>  };
>>>  
>>> -/**
>>> - * of_led_get() - request a LED device via the LED framework
>>> - * @np: device node to get the LED device from
>>> - * @index: the index of the LED
>>> - *
>>> - * Returns the LED device parsed from the phandle specified in the "leds"
>>> - * property of a device tree node or a negative error-code on failure.
>>> - */
>>> -static struct led_classdev *of_led_get(struct device_node *np, int index)
>>> +static struct led_classdev *__of_led_get(struct device_node *np, int index,
>>> +					 const char *name)
>>>  {
>>>  	struct device *led_dev;
>>>  	struct device_node *led_node;
>>>  
>>> +	/*
>>> +	 * For named LEDs, first look up the name in the "led-names" property.
>>> +	 * If it cannot be found, then of_parse_phandle() will propagate the error.
>>> +	 */
>>> +	if (name)
>>> +		index = of_property_match_string(np, "led-names", name);
>>>  	led_node = of_parse_phandle(np, "leds", index);
>>>  	if (!led_node)
>>>  		return ERR_PTR(-ENOENT);
>>> @@ -271,6 +270,20 @@ static struct led_classdev *of_led_get(struct device_node *np, int index)
>>>  	return led_module_get(led_dev);
>>>  }
>>>  
>>> +/**
>>> + * of_led_get() - request a LED device via the LED framework
>>> + * @np: device node to get the LED device from
>>> + * @index: the index of the LED
>>> + *
>>> + * Returns the LED device parsed from the phandle specified in the "leds"
>>> + * property of a device tree node or a negative error-code on failure.
>>> + */
>>> +struct led_classdev *of_led_get(struct device_node *np, int index)
>>> +{
>>> +	return __of_led_get(np, index, NULL);
>>> +}
>>> +EXPORT_SYMBOL_GPL(of_led_get);
>>
>> I probably did this myself, but since of_led_get() is private now
>> (I guess it was not private before?) and since we are moving away from
>> "of" specific functions to using generic dev_xxxx functions in the kernel
>> in general, I think this just should be a static helper.
>>
>> Or probably even better: just add the name argument to of_led_get()
>> before without renaming it, update the existing callers to pass
>> an extra NULL arg and completely drop this wrapper.
>>
> 
> That indeed sounds like a better and cleaner option, will change it.
> This way also incorporates the rest of the feedback on this series.

Sounds good.

Regards,

Hans



>>> +
>>>  /**
>>>   * led_put() - release a LED device
>>>   * @led_cdev: LED device
>>> @@ -342,9 +355,16 @@ EXPORT_SYMBOL_GPL(devm_of_led_get);
>>>  struct led_classdev *led_get(struct device *dev, char *con_id)
>>>  {
>>>  	struct led_lookup_data *lookup;
>>> +	struct led_classdev *led_cdev;
>>>  	const char *provider = NULL;
>>>  	struct device *led_dev;
>>>  
>>> +	if (dev->of_node) {
>>> +		led_cdev = __of_led_get(dev->of_node, -1, con_id);
>>> +		if (!IS_ERR(led_cdev) || PTR_ERR(led_cdev) != -ENOENT)
>>> +			return led_cdev;
>>> +	}
>>> +
>>>  	mutex_lock(&leds_lookup_lock);
>>>  	list_for_each_entry(lookup, &leds_lookup_list, list) {
>>>  		if (!strcmp(lookup->dev_id, dev_name(dev)) &&
>>>


