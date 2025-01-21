Return-Path: <linux-leds+bounces-3835-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D3DB0A17D72
	for <lists+linux-leds@lfdr.de>; Tue, 21 Jan 2025 13:03:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C2DA1165872
	for <lists+linux-leds@lfdr.de>; Tue, 21 Jan 2025 12:03:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA1A41F151B;
	Tue, 21 Jan 2025 12:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="IUsfFBn3"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx.denx.de (mx.denx.de [89.58.32.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB0361F03D5;
	Tue, 21 Jan 2025 12:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.58.32.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737460981; cv=none; b=HUSIAiXZGxeGssUMV/gB0yRfNmhLJqb+suVeqLQq7V9FQlDpmbvHAXnsHqVniVfoHPncDIrztkqFeQEQ8YkqZZ0Ym/I7/QYhiidrQ5u3xOCalXJlXEjyTnXxtQiROx8Uey6STS2nZfjTRCm+b0K0V4g8FRh/f/HHlI9j631cPyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737460981; c=relaxed/simple;
	bh=RWqNh0FamzGZLZTrMHa0koysLbnh/1JyBwU2rc2rJ4Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VAJq+zQT5os7QpEs12zZ9Wb/OgAc7ytFk/zNYkF91GW2h/1Z/sFh4YtEhdRJf1ow6X49f1gjnF7fhPypR8WfCSCtx8FGAPOKc0eYx8PgvvVrF8b4ovB0k0OrOp4n6apvC3TK2fw3Zjjsmdope61BBMxJO7t26EqcvurxbVpeI0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=IUsfFBn3; arc=none smtp.client-ip=89.58.32.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 56F8C104811E2;
	Tue, 21 Jan 2025 13:02:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1737460972;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4EjOg4GooGB9zfQoDLzHhDxxaxOQHP4+q8cuOcut4HE=;
	b=IUsfFBn3hZDx3M6UTDgqVE06MDOQUu9IuRkxsiIVGGJV2eiPe+KWGvz/YpXZe4AcQMOS6J
	49Q5+gQ8L+oOJNhVE276yktsvO3sAkob2LDYH6FMMNnZOiWL/QfT5hl7GwvwEoScYgq1qR
	nHLl7Bup9hRemUisXKv9rbaKtguzp7Oeu3a9nOq/iBgcWLCSU4sgrQfhlDgaKHsPsirY+u
	wXyXAB9FEQOyGvs9a65OAf0oYtBCIZmeAR8e54qssINDx5NmkBxG3y3XMewiMi92wIE+Bu
	jc5VA4fLZm8HBYFHkaskmiNyikXmGRiwCp9iFLUHNdtrX5R/ZffFHOnZVvuoNg==
Message-ID: <c794c87e-30df-4993-86d9-35be35878e44@denx.de>
Date: Tue, 21 Jan 2025 12:27:09 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] leds: trigger: netdev: Introduce OF mode
 configuration using netdev-trigger-mode property
To: Andrew Lunn <andrew@lunn.ch>
Cc: linux-leds@vger.kernel.org, Christian Marangi <ansuelsmth@gmail.com>,
 Conor Dooley <conor+dt@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Lee Jones <lee@kernel.org>,
 Lukasz Majewski <lukma@denx.de>, Pavel Machek <pavel@ucw.cz>,
 Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
References: <20250113002346.297481-1-marex@denx.de>
 <20250113002346.297481-2-marex@denx.de>
 <78e19c21-589f-4a15-8878-d2f5bb3017ef@lunn.ch>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <78e19c21-589f-4a15-8878-d2f5bb3017ef@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 1/16/25 2:47 PM, Andrew Lunn wrote:
>> It is not possible to immediately configure the LED mode, because the
>> interface to which the PHY and the LED is connected to might not be
>> attached to the PHY yet. The netdev_trig_notify() is called when the
>> PHY got attached to interface, extend netdev_trig_notify() to detect
>> the condition where the LED does have netdev trigger configured in DT
>> but the mode was not yet configured and configure the baseline mode
>> from the notifier. This can reuse most of set_device_name() except for
>> the rtnl_lock() which cannot be claimed in the notifier, so split the
>> relevant core code into set_device_name_locked() and call only the core
>> code.
> 
> Why cannot it be claimed? Because it has already been claimed?

Yes

> If so,
> please add an ASSERT_RTNL() in the locked function to document
> this.

Added

> Or is there a lock inversion here?

Not to my knowledge, the rtnl lock should always be locked first and the 
trigger_data->lock mutex second.

>> -static int set_device_name(struct led_netdev_data *trigger_data,
>> -			   const char *name, size_t size)
>> +static void set_device_name_locked(struct led_netdev_data *trigger_data,
>> +				  const char *name, size_t size)
>>   {
>> -	if (size >= IFNAMSIZ)
>> -		return -EINVAL;
>> -
> 
> The code you cannot see in the context does:
> 
>          memcpy(trigger_data->device_name, name, size);
> 
> If we don't have this size check, is it possible to overrun the
> buffer?

Yes, good point, added.

> It might be better to split this patch into two, one doing the
> refactoring of this function, and include an explanation of the
> locking and why it is safe not to include this size check.
Does this still apply with the ASSERT_RTNL() in place and the check in 
the _locked() function reinstated ?

