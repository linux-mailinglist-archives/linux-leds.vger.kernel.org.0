Return-Path: <linux-leds+bounces-51-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 136537F2A3C
	for <lists+linux-leds@lfdr.de>; Tue, 21 Nov 2023 11:22:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C12622822AC
	for <lists+linux-leds@lfdr.de>; Tue, 21 Nov 2023 10:22:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7085736B0F;
	Tue, 21 Nov 2023 10:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WhexbCvX"
X-Original-To: linux-leds@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06886114
	for <linux-leds@vger.kernel.org>; Tue, 21 Nov 2023 02:21:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1700562117;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cfNnWg07vc4dtfhe3jy2IEWts0b85w4zN19C29eJ7XI=;
	b=WhexbCvX1v3/0nJb/93UuUE9DBcgIltj0iTEHITtABjEZuHrd4c5fCfPQE7fz1Xa/cebtp
	yBMY81iNjK/VCEU46GDIy2aHl25e3QklecQK3TWnaQZPeWT7+/F72G0MQ/H7icmADG+aCM
	wlRA+TUkspvZkhKODdlEPEQvNKStXKg=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-682-A2gxYIJbMkOlgTTiF0Y90A-1; Tue, 21 Nov 2023 05:21:56 -0500
X-MC-Unique: A2gxYIJbMkOlgTTiF0Y90A-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-9fffa4c4f28so110006066b.3
        for <linux-leds@vger.kernel.org>; Tue, 21 Nov 2023 02:21:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700562114; x=1701166914;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cfNnWg07vc4dtfhe3jy2IEWts0b85w4zN19C29eJ7XI=;
        b=ZdvZGaMwhsMMrTtr32UcOyEFttwo5r0IEBvUmUr71yilZKShNRuC/uWKOCgkBQdieA
         NL/Tyly5hg657kj8Fw6lVaS12S9yFxFmC+86ftBFbSjN+LdGjqePJBpn+jS31o+1Bozi
         K0ust927EONunrpOeKzE/EqGxrZ26f6BT1iXTD5FmV3vfaFy3G643ylbmS4xrza33p5S
         3lyOeWQXJMByLopyZmrxnY0z/luDc7D3bz1lt94/LIJxn48WF+bMwZhayi0xglz76x29
         sjuzl6EYpxYXUSIf5RAUpJpmYNLAcD1w0aYGpf05wCR+JltrrneZfMJZL+qqT6fvbrI/
         k6lA==
X-Gm-Message-State: AOJu0YzEmhSnEU8gJYKFQi77wZTPLma7PdF5eqZY3fUmaqTsi4mN9n5F
	Q7prjpqzQwF726Ocj/eGrGWqMNSSCuF5HzqGtwmIX99fmY8ANHwUdO+khrbWm2d7DRgvZYYcru7
	QlqJl0rc+gaYk/5EfaEeUfA==
X-Received: by 2002:a17:907:1ca8:b0:9e0:dcf:17d5 with SMTP id nb40-20020a1709071ca800b009e00dcf17d5mr7731220ejc.43.1700562114687;
        Tue, 21 Nov 2023 02:21:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEnHTpYS1U3kUu2OxwPrgQY0GNCk/I3WSIYHNlFXhVd6SF9XinJx3fI1AP0AiDEyfy1o76dMw==
X-Received: by 2002:a17:907:1ca8:b0:9e0:dcf:17d5 with SMTP id nb40-20020a1709071ca800b009e00dcf17d5mr7731209ejc.43.1700562114388;
        Tue, 21 Nov 2023 02:21:54 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id g9-20020a170906520900b009faca59cf38sm3718947ejm.182.2023.11.21.02.21.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Nov 2023 02:21:53 -0800 (PST)
Message-ID: <ae77198c-ae7b-4988-8b5b-824260b28e84@redhat.com>
Date: Tue, 21 Nov 2023 11:21:53 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Fwd: sysfs: cannot create duplicate filename
 .../system76_acpi::kbd_backlight/color
Content-Language: en-US, nl
To: Takashi Iwai <tiwai@suse.de>,
 Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Jean-Jacques Hiblot <jjhiblot@traphandler.com>,
 Bagas Sanjaya <bagasdotme@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Regressions <regressions@lists.linux.dev>,
 Linux LEDs <linux-leds@vger.kernel.org>,
 Tim Crawford <tcrawford@system76.com>, Jeremy Soller <jeremy@system76.com>,
 System76 Product Development <productdev@system76.com>,
 Lee Jones <lee@kernel.org>, Pavel Machek <pavel@ucw.cz>,
 =?UTF-8?Q?Johannes_Pen=C3=9Fel?= <johannes.penssel@gmail.com>
References: <b5646db3-acff-45aa-baef-df3f660486fb@gmail.com>
 <ZT25-gUmLl8MPk93@debian.me>
 <dc6264c4-d551-4913-a51b-72c22217f15a@traphandler.com>
 <ZUjnzB2RL2iLzIQG@debian.me> <87sf50pm34.wl-tiwai@suse.de>
 <b9d4ab02-fe49-48ab-bf74-0c7a578e891a@leemhuis.info>
 <87edgjo2kr.wl-tiwai@suse.de>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <87edgjo2kr.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 11/21/23 10:52, Takashi Iwai wrote:
> On Tue, 21 Nov 2023 10:19:03 +0100,
> Thorsten Leemhuis wrote:
>>
>> Takashi, Jean-Jacques Hiblot, Lee,
>>
>> On 20.11.23 14:53, Takashi Iwai wrote:
>>> On Mon, 06 Nov 2023 14:19:08 +0100,
>>> Bagas Sanjaya wrote:
>>>> On Sat, Nov 04, 2023 at 01:01:56PM +0100, Jean-Jacques Hiblot wrote:
>>>>> On 29/10/2023 02:48, Bagas Sanjaya wrote:
>>>>>> On Thu, Oct 26, 2023 at 02:55:06PM +0700, Bagas Sanjaya wrote:
>>>>>>> The culprit seems to be commit c7d80059b086c4986cd994a1973ec7a5d75f8eea, which introduces a new 'color' attribute for led sysfs class devices. The problem is that the system76-acpi platform driver tries to create the exact same sysfs attribute itself for the system76_acpi::kbd_backlight device, leading to the conflict. For testing purposes, I've just rebuilt the kernel with the system76-apci color attribute renamed to kb_color, and that fixes the issue.
>>>>>>
>>>>>> Jean-Jacques Hiblot, would you like to take a look on this regression,
>>>>>> since you authored the culprit?
>>>
>>>>> The offending commit stores the color in struct led_classdev and exposes it
>>>>> via sysfs. It was part of a series that create a RGB leds from multiple
>>>>> single-color LEDs. for this series, we need the color information but we
>>>>> don't really need to expose it it via sysfs. In order to fix the issue, we
>>>>> can remove the 'color' attribute from the sysfs.
>>>>
>>>> OK, see you in the patch!
>>>
>>> Is there a patch available?
>>
>> Not that I know of. Could not find anything on lore either.
>>
>>> This bug hits for a few Logitech keyboard models, too, and it makes
>>> 6.6 kernel unsable for them, as hid-lg-g15 driver probe fails due to
>>> this bug:
>>>   https://bugzilla.kernel.org/show_bug.cgi?id=218155
>>>
>>> We need a quick fix for 6.6.x.
>>
>> Given that Jean-Jacques Hiblot (the author of the culprit) and Lee (who
>> committed it and sent it to Linus) know about this for a while already
>> without doing anything about it, I wonder if someone should just send a
>> revert to Linus (unless of course that is likely to introduce a
>> regression on its own).
>>
>> Takashi, could you maybe do this, unless a fix shows up real soon?
> 
> I can, but we need to decide which way to go.
> There are several options:
> 
> 1. Revert the commit c7d80059b086;
>    this drops led class color sysfs entries.  Also the store of
>    led_cdev->color from fwnode is dropped, too.
> 
> 2. Drop only led class color sysfs entries;
>    a partial revert of c7d80059b086 above

AFAIK further up in the thread (or a related thread) there
already was consensus to do this. Someone just needs to
write the patch.

> 3. Rename conflicting sysfs entries in drivers;
>    e.g. color -> kb_color for hid-lg-g15 and system76_acpi
> 
> In either way, we'd break user-space (sysfs).

The new color attribute causing the conflict has only
been in 6.6 so there likely aren't any users of it yet
and since dropping it would be backported to 6.6.y
there shouldn't be any future users of it either, since
any 6.6 users presumably will use 6.6.y and not 6.6.0

> IMO, 2 would be the least harm, as the class sysfs entry was
> introduced since 6.6.

Ack.

> I guess this is what Jean-Jacques suggested.

Right.

> But I'm not sure how important this new class sysfs entry is; it has
> to be clarified from leds people who actually use / wanted the
> feature.

If I have read the thread correctly it is not important the value
it represents is used internally in the LED subsystem and userspace
does not really need it.

Regards,

Hans




