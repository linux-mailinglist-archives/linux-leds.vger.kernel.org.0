Return-Path: <linux-leds+bounces-3135-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A4909A9BAB
	for <lists+linux-leds@lfdr.de>; Tue, 22 Oct 2024 09:59:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D29CB1C21961
	for <lists+linux-leds@lfdr.de>; Tue, 22 Oct 2024 07:59:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24C3C15534E;
	Tue, 22 Oct 2024 07:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GweyATkd"
X-Original-To: linux-leds@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75050155330
	for <linux-leds@vger.kernel.org>; Tue, 22 Oct 2024 07:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729583937; cv=none; b=DXHz2pajuBal4SHP8MBaK1Sg8QXcWMBuk5hRKiiwUgEI+7pLAEsNVLbt7UdzmvIdFbmOrRc9tSANq2tRNhh3jwu7HHfgkExh7NxpPPVcaGAn0mJmzYWmmurSgonarMuOHnXPtpX+OnwYbq28AU+Tq3r+3SALNmd38739DPEk1D0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729583937; c=relaxed/simple;
	bh=lASjZqRy8DWUdG/x3b3JyJoeoS2+o+iWUvtizrQ9F9A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rRijzWmmbUcmNK2SC3XZgJg93g5ag1qCxWHC7477aSUaD2kqzuNA3WeUnJtI+x0HjKgdox54/kD0Jn3MMUiqMEDGCPQ8NYrhUSO7LU+3tE5s9/yz4x5YsYWMGCZ/5VK/Z10cyOQYXOVH5IzqOVZ4wQ7wr1U6wzu9zChl+x/fTGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GweyATkd; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729583934;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/toOIhDFxtm2KiH53yytgdrHcc4/hOCbQgrRu1IsbBM=;
	b=GweyATkdPlz0anyMzAz6zXPcWMA27iYEuO3M3LQ6iQb/kjW6uw99NsXwpEZMhqsDCBItwW
	A8vjzzuLMXG0Fgahfefy2hD9sCOtugivyRKBCVH4FLc8A4HJRgC7KweOah9jIZAdgFOFLb
	pBihlF67nq8Dy/vnrzV7TzqDvOEKbCA=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-457-Zi6-IZfOOTumJY8ekHU-zA-1; Tue, 22 Oct 2024 03:58:53 -0400
X-MC-Unique: Zi6-IZfOOTumJY8ekHU-zA-1
Received: by mail-lf1-f72.google.com with SMTP id 2adb3069b0e04-53a0b48e8d4so4950979e87.3
        for <linux-leds@vger.kernel.org>; Tue, 22 Oct 2024 00:58:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729583932; x=1730188732;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/toOIhDFxtm2KiH53yytgdrHcc4/hOCbQgrRu1IsbBM=;
        b=UGpNrpGN12Qb43tJ2A4VVl35fD/lWlobiGGcjlFdS6Izb7ea0beAqCIUTSKutScG7S
         1uq/C5358j7EuQhEqO6RKI7kE/uw4drr6tn5+SwER3bQrcwqip3dzUdN74lNPRlV6ZHr
         9T7ZfwyLvh7qY0fYgMaLssAbp7hnasJCZEch/J37msPvZjH3kxgb012YXSbEtd94qrtb
         HqNpnd5QRqqyqZMxo8AZlR9gWIKIanvqCFzGarC4+KIbsjORaSXCfaskSHgq6WVzu/QF
         VI4sJr5g5KadfZEUeEMLrN2b3bVWf9HLgPQJePCUOZB9bysfxTYqftDPgbhFpdDpZkdc
         GV8A==
X-Forwarded-Encrypted: i=1; AJvYcCWwdeScaAT5m1+sXINekwvefPgTOT5+RgarD0NtD8QGzXZ9ucWz0iMKcvdz/U8+3QvF1k9OVfcphUn6@vger.kernel.org
X-Gm-Message-State: AOJu0YxxL0zoTDGr3Hldu434JtchJAt4e3mkc4z5Vz9y2ZrdzXHNwF1f
	M0gybK82Iq4uHMinwc/fEFA3DOjHnCFCHtR/00cD47AqE8t/n9Qy56CzylF1Os37BLogPKjrz3y
	C0lbTqvrpjbPK4eOYS7/YmSVA0vCGhAnA2ewrvVE+uExDWPDiGzD4k0Q0pmI=
X-Received: by 2002:a05:6512:1396:b0:539:e873:6e6 with SMTP id 2adb3069b0e04-53a15445fbbmr6176916e87.43.1729583931536;
        Tue, 22 Oct 2024 00:58:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFHZkuY2o29BsH2nW9fSeox5DGzjxId3xF7ANCRMftKPLZng9BBjKBjW/HI8QrQjL7hrhqDkQ==
X-Received: by 2002:a05:6512:1396:b0:539:e873:6e6 with SMTP id 2adb3069b0e04-53a15445fbbmr6176880e87.43.1729583930939;
        Tue, 22 Oct 2024 00:58:50 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cb66a6a729sm2841670a12.54.2024.10.22.00.58.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Oct 2024 00:58:50 -0700 (PDT)
Message-ID: <c52019d7-01b4-4585-a2d1-b44b0a773fc9@redhat.com>
Date: Tue, 22 Oct 2024 09:58:48 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] platform/x86/tuxedo: Add virtual LampArray for TUXEDO
 NB04 devices
To: Armin Wolf <W_Armin@gmx.de>, Pavel Machek <pavel@ucw.cz>
Cc: Werner Sembach <wse@tuxedocomputers.com>,
 Benjamin Tissoires <bentiss@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 dri-devel@lists.freedesktop.org, jelle@vdwaa.nl, jikos@kernel.org,
 lee@kernel.org, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-leds@vger.kernel.org, miguel.ojeda.sandonis@gmail.com,
 ojeda@kernel.org, onitake@gmail.com, platform-driver-x86@vger.kernel.org
References: <7ce4470c-a502-416a-8472-a5b606bb8fd4@tuxedocomputers.com>
 <d7gk2mgihtg6242l3isnhw3xpdt745ehpu2kvim2xxgmxdhat7@g5cqei7uqujj>
 <39f84cfe-bb89-4194-81a9-e178c93e5309@tuxedocomputers.com>
 <sih5i2ausorlpiosifvj2vvlut4ok6bbgt6cympuxhdbjljjiw@gg2r5al552az>
 <82a6eca1-728c-436f-8c4d-073d8a43ee27@tuxedocomputers.com>
 <5crqia4gecxg62n2m2lf6haiifue4wlxrr3g35dyoaa3svjyuj@cd5bhouz5rlh>
 <4a761cd0-611a-4245-8353-5c66ba133715@tuxedocomputers.com>
 <rszv4p34oivysoyi337dxwooebipiikzd3pyq7rof5r3agbzce@xejutpd4jcfv>
 <06c58141-4aa9-4b54-8ae4-e27069561ac9@tuxedocomputers.com>
 <48a8d62f-ea3f-4f17-b917-ff3aaa83e89c@gmx.de> <ZwlDpCPhieF3tezX@duo.ucw.cz>
 <a796f0e7-47a8-40fa-a64e-9dd56117bf78@gmx.de>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <a796f0e7-47a8-40fa-a64e-9dd56117bf78@gmx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Armin,

On 21-Oct-24 10:26 PM, Armin Wolf wrote:
> Am 11.10.24 um 17:26 schrieb Pavel Machek:
> 
>> Hi!
>>
>>>> 1.
>>>> https://lore.kernel.org/all/6b32fb73-0544-4a68-95ba-e82406a4b188@gmx.de/
>>>> -> Should be no problem? Because this is not generally exposing wmi
>>>> calls, just mapping two explicitly with sanitized input (whitelisting
>>>> basically).
>>> It would be OK to expose a selected set of WMI calls to userspace and sanitizing the input of protect potentially buggy firmware from userspace.
>>>
>> I don't believe this is good idea. Passthrough interfaces where
>> userland talks directly to hardware are very tricky.
>>
>>> Regarding the basic idea of having a virtual HID interface: i would prefer to create a illumination subsystem instead, but i have to agree that we should be doing this
>>> only after enough drivers are inside the kernel, so we can design a
>>> suitable interface for them. For now, creating a virtual HID
>>> interface seems to be good enough.
>> I have an RGB keyboard, and would like to get it supported. I already
>> have kernel driver for LEDs (which breaks input functionality). I'd
>> like to cooperate on "illumination" subsystem.
>>
>> Best regards,
>>                                 Pavel
> 
> Sorry for taking a bit long to respond.
> 
> This "illumination" subsystem would (from my perspective) act like some sort of LED subsystem
> for devices with a high count of LEDs, like some RGB keyboards.
> 
> This would allow us too:
> - provide an abstract interface for userspace applications like OpenRGB
> - provide an generic LED subsystem emulation on top of the illumination device (optional)
> - support future RGB controllers in a generic way
> 
> Advanced features like RGB effects, etc can be added later should the need arise.
> 
> I would suggest that we model it after the HID LampArray interface:
> 
> - interface for querying:
>  - number of LEDs
>  - supported colors, etc of those LEDs
>  - position of those LEDs if available
>  - kind (keyboard, ...)
>  - latency, etc
> - interface for setting multiple LEDs at once
> - interface for setting a range of LEDs at once
> - interface for getting the current LED colors
> 
> Since sysfs has a "one value per file" rule, i suggest that we use a chardev interface
> for querying per-LED data and for setting/getting LED colors.
> 
> I do not know if mixing sysfs (for controller attributes like number of LEDs, etc) and IOCTL
> (for setting/getting LED colors) is a good idea, any thoughts?

I wonder what the advantage of this approach is over simply using HID LampArray
(emulation), openRGB is already going to support HID LampArray and since Microsoft
is pushing this we will likely see it getting used more and more.

Using HID LampArray also has the advantage that work has landed and is landing
to allow safely handing over raw HID access to userspace programs or even
individual graphical apps with the option to revoke that access when it is
no longer desired for the app to have access.

HID LampArray gives us a well designed API + a safe way to give direct access
to e.g. games to control the lighting. I really don't see the advantage of
inventing our own API here only to then also have to design + code some way to
safely give access to sandboxed apps.

Note that giving access to sandboxed apps is a lot of work, it is not just
kernel API it also requires designing a portal interface + implementing
that portal for at least GNOME, KDE and wlroots.

Personally I really like the idea to just emulate a HID LampArray device
for this instead or rolling our own API.  I believe there need to be
strong arguments to go with some alternative NIH API and I have not
heard such arguments yet.

Regards,

Hans





