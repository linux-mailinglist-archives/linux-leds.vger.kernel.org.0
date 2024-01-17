Return-Path: <linux-leds+bounces-612-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 64217830B75
	for <lists+linux-leds@lfdr.de>; Wed, 17 Jan 2024 17:51:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 556DD1C21CB6
	for <lists+linux-leds@lfdr.de>; Wed, 17 Jan 2024 16:51:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23EE1224DA;
	Wed, 17 Jan 2024 16:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LiX75Qi8"
X-Original-To: linux-leds@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9106533FA
	for <linux-leds@vger.kernel.org>; Wed, 17 Jan 2024 16:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705510260; cv=none; b=XbpvssX/bPLewmpUPB2GavdY3EmWHMBZYDz1Aq/eo93bq85786q9q4mnyXFtU/0YrlRRso1DOyZQIyQENVDxhni6uFwr1r6jXltdNPzrdEqnjiSZaEhiJcsElDUiOffL5giiB3s/7ERWrT1Kb9c3RvtozRYPpW7EyKK809ggNs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705510260; c=relaxed/simple;
	bh=bj/hs96SoSD6M7wdLl2YH/DmMdRpKQy3s5ii6iFbQ0o=;
	h=DKIM-Signature:Received:X-MC-Unique:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Received:
	 X-Google-Smtp-Source:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:Content-Language:To:Cc:References:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding; b=RdxxLURWNBRiywOakkndsT+wyLZIrArZekT/QQqZRDvV0RjhAwbePKMeUeYD6OWKH7j+iWrsQu3JSFSW1bT0/azTy53c9CtgC6hIVlR2e9qIkA2k3e5p/CcVQ6q/k7LpMP/rNjUyaEqkEOuVDSja8ZDxpVRV7Rm7+ojmVesjW7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LiX75Qi8; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1705510256;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nnc6dQVA3dNi3pJUCdpIqw7wvP4lwyFls8kLU3/xDnc=;
	b=LiX75Qi8LiUyhVKOgqxwh9iTTDoTcmFu4txpdxz/XpB/dBLGPk4uvvzDQ9t2qD4Byz3Whz
	KyUgWyrp2HcL/WtCjlAovZeW9TOh0/avmAHbfy+Jj4Q5j6JmsPxnSc/GYPsVPCAyTN2hVU
	GH4gI0+baGF0K4q/XYe2m6aZgNUb8XU=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-168-AqF0n53xMqubMrzu18RKQw-1; Wed, 17 Jan 2024 11:50:55 -0500
X-MC-Unique: AqF0n53xMqubMrzu18RKQw-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-a2cb0d70d6cso265957966b.2
        for <linux-leds@vger.kernel.org>; Wed, 17 Jan 2024 08:50:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705510254; x=1706115054;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nnc6dQVA3dNi3pJUCdpIqw7wvP4lwyFls8kLU3/xDnc=;
        b=vwYoExU3+Lo4F0JJ7F70wdJjdRFSUNVtJQp38mUTb16e4o2oy1WU+jqZu8QAgH2SPg
         5lYByxq3o3DRElEPChSrwICEIZqjpLDlJbEmdJ38z4h16mLHWCYsybfZWZbHtPGVyYRa
         SfgVmRKDjwu9i2qPkp01aerupQJ93m+8hNVoDpfLLPpjvpSizLOtf8++GMMjOJOIVO1k
         nIm+nOmnYkOK7/gqEv5FYZYGRkbWaGgIOUYJcJ9e5m1ovbWms39FLz1jsPOowXCUSWJn
         ODNwoUCgFb0CKuW2Jbe+mreWS2dIyiAYxNKu6h9BuGydfWNiej7iAjCMXn+pkRqj5A5c
         jV6g==
X-Gm-Message-State: AOJu0YyabTCjRPqAp+33rLTihbF30cUDhhWFotue9Xw2+6kP4x5UAYia
	yedjj/eNgTTh2W6cy0mb0oSKaTL/6VzDsZEMuLhjWy+7pjahaHJP7rjU4DKeVWs4TrWRIj5dwM1
	b+UwrbBad+lpXU3+ieUCI0EjvWmPwjA==
X-Received: by 2002:a17:907:c307:b0:a2d:d128:fbb8 with SMTP id tl7-20020a170907c30700b00a2dd128fbb8mr3755970ejc.124.1705510253798;
        Wed, 17 Jan 2024 08:50:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEeQWD5jgD8PYE8L0xWO+esoquWgfev7sv2x2VEZdl70xPLAE5sWQx6nUbFSZipIQNLmXnyPw==
X-Received: by 2002:a17:907:c307:b0:a2d:d128:fbb8 with SMTP id tl7-20020a170907c30700b00a2dd128fbb8mr3755959ejc.124.1705510253429;
        Wed, 17 Jan 2024 08:50:53 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id kq10-20020a170906abca00b00a2e98f4c687sm1737550ejb.164.2024.01.17.08.50.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jan 2024 08:50:52 -0800 (PST)
Message-ID: <3040290f-9b26-4fd3-8e64-a03ec59921d6@redhat.com>
Date: Wed, 17 Jan 2024 17:50:51 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Userspace API for per key backlight for non HID (no hidraw)
 keyboards
Content-Language: en-US, nl
To: Werner Sembach <wse@tuxedocomputers.com>, Pavel Machek <pavel@ucw.cz>,
 Jani Nikula <jani.nikula@linux.intel.com>, jikos@kernel.org,
 Jelle van der Waa <jelle@vdwaa.nl>, Armin Wolf <W_Armin@gmx.de>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Lee Jones
 <lee@kernel.org>, linux-kernel@vger.kernel.org,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 linux-input@vger.kernel.org, ojeda@kernel.org, linux-leds@vger.kernel.org
References: <20231011190017.1230898-1-wse@tuxedocomputers.com>
 <ZSe1GYLplZo5fsAe@duo.ucw.cz>
 <0440ed38-c53b-4aa1-8899-969e5193cfef@tuxedocomputers.com>
 <ZSf9QneKO/8IzWhd@duo.ucw.cz>
 <a244a00d-6be4-44bc-9d41-6f9df14de8ee@tuxedocomputers.com>
 <ZSk16iTBmZ2fLHZ0@duo.ucw.cz>
 <aac81702-df1e-43a2-bfe9-28e9cb8d2282@tuxedocomputers.com>
 <ZSmg4tqXiYiX18K/@duo.ucw.cz>
 <CANiq72mfP+dOLFR352O0UNVF8m8yTi_VmOY1zzQdTBjPWCRowg@mail.gmail.com>
 <87sf61bm8t.fsf@intel.com> <ZVvHG/Q+V6kCnfKZ@duo.ucw.cz>
 <f4137e34-c7fb-4f21-bc93-1496cbf61fdf@tuxedocomputers.com>
 <8096a042-83bd-4b9f-b633-79e86995c9b8@redhat.com>
 <f416fbca-589b-4f6a-aad6-323b66398273@tuxedocomputers.com>
 <4222268b-ff44-4b7d-bf11-e350594bbe24@redhat.com>
 <ac02143c-d417-49e5-9c6e-150cbda71ba7@tuxedocomputers.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <ac02143c-d417-49e5-9c6e-150cbda71ba7@tuxedocomputers.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi All,

On 11/27/23 11:59, Werner Sembach wrote:

<snip>

> I also stumbled across a new Problem:
> 
> We have an upcoming device that has a per-key keyboard backlight, but does the control completely via a wmi/acpi interface. So no usable hidraw here for a potential userspace driver implementation ...
> 
> So a quick summary for the ideas floating in this thread so far:
> 
> 1. Expand leds interface allowing arbitrary modes with semi arbitrary optional attributes:
> 
>     - Pro:
> 
>         - Still offers all default attributes for use with UPower
> 
>         - Fairly simple to implement from the preexisting codebase
> 
>         - Could be implemented for all (to me) known internal keyboard backlights
> 
>     - Con:
> 
>         - Violates the simplicity paradigm of the leds interface (e.g. with this one leds entry controls possible multiple leds)

So what you are suggesting here is having some way (a-z + other sysfs attr?)
to use a single LED class device and then extend that to allow setting all
keys ?

This does not seem like a good idea to me and this will also cause issues
when doing animations in software, since this API will likely be slow.

And if the API is not slow, then it will likely involve some sort
of binary sysfs file for setting multiple keys rather then 1
file per key which would break the normal 1 file per setting sysfs
paradigm.

> 2. Implement per-key keyboards as auxdisplay
> 
>     - Pro:
> 
>         - Already has a concept for led positions

With a "concept" you mean simple x,y positioning or is
there something more advanced here that I'm aware of ?

>         - Is conceptually closer to "multiple leds forming a singular entity"
> 
>     - Con:
> 
>         - No preexisting UPower support
> 
>         - No concept for special hardware lightning modes
> 
>         - No support for arbitrary led outlines yet (e.g. ISO style enter-key)

Hmm, so there is very little documentation on this and what
docs there is: Documentation/admin-guide/auxdisplay/cfag12864b.rst
as well as the example program how to uses this suggests that
this is using the old /dev/fb# interface which we are sorta
trying to retire.


> 3. Implement in input subsystem
> 
>     - Pro:
> 
>         - Preexisting concept for keys and key purpose
> 
>     - Con:
> 
>         - Not in scope for subsystem
> 
>         - No other preexisting light infrastructure

Dmitry actually recently nacked the addition of
a LED_MIC_MUTE define to include/uapi/linux/input-event-codes.h
which was intended to be able to allow the input LED support
with standard HID mic-mute leds (spk-mute is already supported
this way).

Dmitry was very clear that no new LEDs must be added and
that any new LED support should be done through the LED
subsytem, so I do not think that something like this
is going to fly.


> 4. Implement a simple leds driver only supporting a small subset of the capabilities and make it disable-able for a userspace driver to take over
> 
>     - Pro:
> 
>         - Most simple to implement basic support
> 
>         - In scope for led subsystem simplicity paradigm
> 
>     - Con:
> 
>         - Not all built in keyboard backlights can be implemented in a userspace only driver

Right, so this is basically what we have been discussing in the other
part of the thread with the:

/sys/bus/hid/devices/0003:xxxx:xxxx.xxxx/disable_kbd_backlight_support

proposal to unregister the kernel's LED class device and then
allow userspace to do whatever it wants through /dev/hidraw
without the kernel also trying to access the backlight
functionality at the same time.

AFAIK there already is a bunch of userspace support for
per key addressable kbd RGB backlights using hidraw support,
so this way we can use the momentum / code of these existing
projects, at least for existing hidraw keyboards and adding
support for:

/sys/bus/hid/devices/0003:xxxx:xxxx.xxxx/disable_kbd_backlight_support

to these existing projects should be simple.

Yet this will not work for your mentioned "control completely
via a wmi/acpi interface". Still I think we should go the same
route for those adding a misc-char device or something like
that to allow making WMI calls from userspace (like Windows
can do). Maybe with an allow list per GUID to only allow
specific calls, so that we can avoid possible dangerous calls.

Armin Wolf recently became the WMI bus maintainer.

Armin, we are discussing how to deal with (laptop) keyboards
which have a separate RGB LED per key and how to control
those LEDs.

So far per key addressable keyboard backlighting has always
been HID based, so any existing support is just userspace
based using /dev/hidraw. In my experience the problem with
supporting gaming peripherals is that there is interest in it,
but not really enough interest to keep a sustained momentum
behind projects, especially not when it comes to taking code
from a fun weekend hack to upstreaming them into bigger
projects like the kernel.

So I would like to offer some sort of easy accessible
API to userspace for accessing this, basically allowing
userspace drivers for the LED part of the keyboard which
in some cases will involve making WMI calls from userspace.

So, Armin, what do you think about a way of allowing
(filtered) WMI calls from userspace through say
a misc-char device + ioctls or something like that?

Werner atm I personally do think that option 4. from
your list is the way to go. Mainly because designing
a generic kernel API for all bells and whistles of gaming
hw is very tricky and would require a large ongoing
effort which I just don't see happening (based on
past experience).

Regards,

Hans



