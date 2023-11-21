Return-Path: <linux-leds+bounces-56-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B65C37F2D09
	for <lists+linux-leds@lfdr.de>; Tue, 21 Nov 2023 13:23:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6AC812820C1
	for <lists+linux-leds@lfdr.de>; Tue, 21 Nov 2023 12:23:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D45E4A999;
	Tue, 21 Nov 2023 12:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QoPTFP/B"
X-Original-To: linux-leds@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9797E191
	for <linux-leds@vger.kernel.org>; Tue, 21 Nov 2023 04:23:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1700569404;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EgdkXy6q5JE0gaoC70ySFvGcqFyTFXzCOKDV430yozo=;
	b=QoPTFP/Buhzehqls3bPAZZgmymwV5tLDTxGTnx1HR1EOipoLXtnS5ViuETnuoxXjG6Rfa3
	1Vto9oaeTS9oE8bG4GU0JiMlCZqudkfnApTWSUyxU/MW1jJSaOF8Wpmlg3Fe0GIqlehaXs
	23peimzatE8SrAYn4LYeFkGu4B599xs=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-155-sNf2XVjpOSOpaBXvaB13cw-1; Tue, 21 Nov 2023 07:23:23 -0500
X-MC-Unique: sNf2XVjpOSOpaBXvaB13cw-1
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-547bb01fec2so4280057a12.0
        for <linux-leds@vger.kernel.org>; Tue, 21 Nov 2023 04:23:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700569402; x=1701174202;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EgdkXy6q5JE0gaoC70ySFvGcqFyTFXzCOKDV430yozo=;
        b=kiyL1y+XxrZZ3eXZrh6hWTrWwwP/HUJgRGYBpAQfN/elVc9d7psJZL+czNSYpsb6te
         vtuji+BKw8xlf3OCE47C14IOn/1NnrNN7zhuRBUf/KaTzxENRnUwwvTv+deJ4EvJ9HX8
         dSLZKiQgk8PKBQG8Gd8ejsWmXm0iijuLxtUnMykIACtsscaOXvAST75tObrR54N1q8TV
         3QkUyyZCDFT341oxk5/vYmURVkjYZygTUhJl+d3su2lOp9fqwtKdNajomahFoHrzoS5Z
         wPsNm2umnu8cugHpJ7Azx7RmC7+kMhTVVjzxGbmnPOHAo1PPuxep9mF9qMWesX0NONS7
         qBwQ==
X-Gm-Message-State: AOJu0YzsO8HNL932Xo6Pb6lN/yj5Vhm//naF/LoNdyFFrz14L9ccgRnC
	s2JAzfIw53pxy2aTK6ZhO49lD5SgXQD1Z4Sy+Ph9rZVYSfx1YfOKOVlzDU+FG12+Rn0Gw1V+w/u
	njilF0US41FH44q4KQeZl0Q==
X-Received: by 2002:a05:6402:797:b0:543:8391:a19a with SMTP id d23-20020a056402079700b005438391a19amr1579220edy.40.1700569402528;
        Tue, 21 Nov 2023 04:23:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFj+xiia5YOo0bOMmdIE/M2mJWXVUOP6sfD1UWb1jBME6EjjkgQ87pNiOZUjHD/IvkkrvmN6A==
X-Received: by 2002:a05:6402:797:b0:543:8391:a19a with SMTP id d23-20020a056402079700b005438391a19amr1579205edy.40.1700569402226;
        Tue, 21 Nov 2023 04:23:22 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id z1-20020aa7cf81000000b0053e89721d4esm4706851edx.68.2023.11.21.04.23.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Nov 2023 04:23:21 -0800 (PST)
Message-ID: <37f6aa8e-8cab-4194-8493-8e39819ed608@redhat.com>
Date: Tue, 21 Nov 2023 13:23:20 +0100
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
To: Takashi Iwai <tiwai@suse.de>
Cc: Thorsten Leemhuis <regressions@leemhuis.info>,
 Jean-Jacques Hiblot <jjhiblot@traphandler.com>,
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
 <ae77198c-ae7b-4988-8b5b-824260b28e84@redhat.com>
 <874jhfo0oc.wl-tiwai@suse.de>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <874jhfo0oc.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 11/21/23 11:33, Takashi Iwai wrote:
> On Tue, 21 Nov 2023 11:21:53 +0100,
> Hans de Goede wrote:
>>
>> Hi,
>>
>> On 11/21/23 10:52, Takashi Iwai wrote:
>>> On Tue, 21 Nov 2023 10:19:03 +0100,
>>> Thorsten Leemhuis wrote:
>>>>
>>>> Takashi, Jean-Jacques Hiblot, Lee,
>>>>
>>>> On 20.11.23 14:53, Takashi Iwai wrote:
>>>>> On Mon, 06 Nov 2023 14:19:08 +0100,
>>>>> Bagas Sanjaya wrote:
>>>>>> On Sat, Nov 04, 2023 at 01:01:56PM +0100, Jean-Jacques Hiblot wrote:
>>>>>>> On 29/10/2023 02:48, Bagas Sanjaya wrote:
>>>>>>>> On Thu, Oct 26, 2023 at 02:55:06PM +0700, Bagas Sanjaya wrote:
>>>>>>>>> The culprit seems to be commit c7d80059b086c4986cd994a1973ec7a5d75f8eea, which introduces a new 'color' attribute for led sysfs class devices. The problem is that the system76-acpi platform driver tries to create the exact same sysfs attribute itself for the system76_acpi::kbd_backlight device, leading to the conflict. For testing purposes, I've just rebuilt the kernel with the system76-apci color attribute renamed to kb_color, and that fixes the issue.
>>>>>>>>
>>>>>>>> Jean-Jacques Hiblot, would you like to take a look on this regression,
>>>>>>>> since you authored the culprit?
>>>>>
>>>>>>> The offending commit stores the color in struct led_classdev and exposes it
>>>>>>> via sysfs. It was part of a series that create a RGB leds from multiple
>>>>>>> single-color LEDs. for this series, we need the color information but we
>>>>>>> don't really need to expose it it via sysfs. In order to fix the issue, we
>>>>>>> can remove the 'color' attribute from the sysfs.
>>>>>>
>>>>>> OK, see you in the patch!
>>>>>
>>>>> Is there a patch available?
>>>>
>>>> Not that I know of. Could not find anything on lore either.
>>>>
>>>>> This bug hits for a few Logitech keyboard models, too, and it makes
>>>>> 6.6 kernel unsable for them, as hid-lg-g15 driver probe fails due to
>>>>> this bug:
>>>>>   https://bugzilla.kernel.org/show_bug.cgi?id=218155
>>>>>
>>>>> We need a quick fix for 6.6.x.
>>>>
>>>> Given that Jean-Jacques Hiblot (the author of the culprit) and Lee (who
>>>> committed it and sent it to Linus) know about this for a while already
>>>> without doing anything about it, I wonder if someone should just send a
>>>> revert to Linus (unless of course that is likely to introduce a
>>>> regression on its own).
>>>>
>>>> Takashi, could you maybe do this, unless a fix shows up real soon?
>>>
>>> I can, but we need to decide which way to go.
>>> There are several options:
>>>
>>> 1. Revert the commit c7d80059b086;
>>>    this drops led class color sysfs entries.  Also the store of
>>>    led_cdev->color from fwnode is dropped, too.
>>>
>>> 2. Drop only led class color sysfs entries;
>>>    a partial revert of c7d80059b086 above
>>
>> AFAIK further up in the thread (or a related thread) there
>> already was consensus to do this. Someone just needs to
>> write the patch.
> 
> Well, is there any user of this new led_classdev.color field?
> The value read from fwnode is stored there, but as far as I see, there
> seems no real user, so far.  If it's still unused, we can do the whole
> revert -- which is cleaner.

I honestly don't know. I've mostly just been reading along. I think
there may be some future in kernel use planned (not sure at all though).

If there are no current in kernel users then I agree we should just
go with a full revert now to fix the regression. If some later
in kernel users do come along then they can always re-introduce
the change minus the sysfs attr addition.

Regards,

Hans




