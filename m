Return-Path: <linux-leds+bounces-94-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D1E6D7F4FAC
	for <lists+linux-leds@lfdr.de>; Wed, 22 Nov 2023 19:34:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 485BFB20D71
	for <lists+linux-leds@lfdr.de>; Wed, 22 Nov 2023 18:34:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80C2A5C076;
	Wed, 22 Nov 2023 18:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dtMb3Pm1"
X-Original-To: linux-leds@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE9E510C2
	for <linux-leds@vger.kernel.org>; Wed, 22 Nov 2023 10:34:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1700678060;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CSq4Z/8e2pXUHkDOJ7PPcDe9XGNiH9I/kXRfecMzXmE=;
	b=dtMb3Pm1aDoYmhwNN/aBkTL4w4mk3iT8ube4dLsNmBbuJETQNPkr/gWXnQqWf5C1PfknuE
	Apb5S5fZ8cwhYyeKAcpKeJZOMFo+VYdTxRATND/fZ54+Jf5HGEGFnjXHLWBK0lJFlSP74k
	1wK4AHrA3mXsU478CdzmDEEdoQ7LU8Y=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-439-eJi7oUIINMeu2hT7s75jpw-1; Wed, 22 Nov 2023 13:34:19 -0500
X-MC-Unique: eJi7oUIINMeu2hT7s75jpw-1
Received: by mail-lf1-f72.google.com with SMTP id 2adb3069b0e04-50aaa5d2a12so4212548e87.3
        for <linux-leds@vger.kernel.org>; Wed, 22 Nov 2023 10:34:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700678058; x=1701282858;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CSq4Z/8e2pXUHkDOJ7PPcDe9XGNiH9I/kXRfecMzXmE=;
        b=koQoYyypCgmY/Wp9meo7NnoG5gIInxlPOBcE7edmIdPo/zaV/76Q/WeTa7bZ3ZgpC7
         r2hAbxPLvjQlPtb/hB4yg23r5yHqHStAsRp6H9udin8B0fczX7tUvggXEcPdDtfGotzL
         Ku9gfZNMEL4l7IfTV2neyZCo7/42G3WJhmq8NpG08qY1vwl181KAXE0HNmTMm+Fbi8ri
         7gS0YKu4hpj9DUiwJei97BBq1prj3eJMSBfMoV+O2n3y/L91ZN6mQ9drR3koX+ZrXqPX
         ynR6suNxnafy0fzu61DRtAJLN2KffkOyyXk1+UEAcwtoLoxJRa+ZfNouviakHhTFb4FA
         Wk6w==
X-Gm-Message-State: AOJu0Yw6GcXGKe0JUFptTVCaG9m0EPzS6WV91o+KCY1U20Ysvlml8IYC
	Z5JzJI2WWd9LxSAaxXfoirBtww+td77ItaAwUtI+VMijMaNsMZvLB6fPuM1XlW8bHd3dDfCZuhQ
	c1CWdGvZJBqfDNKOwN6XFBg==
X-Received: by 2002:a05:6512:3b21:b0:507:c763:27b7 with SMTP id f33-20020a0565123b2100b00507c76327b7mr3162718lfv.40.1700678057734;
        Wed, 22 Nov 2023 10:34:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFh59WQluakgPfC165eV+EpD7wmuDkQBJLEXSCOkuN9LT5IrE4iptKGqLO7vhOdGJJyfRH1LA==
X-Received: by 2002:a05:6512:3b21:b0:507:c763:27b7 with SMTP id f33-20020a0565123b2100b00507c76327b7mr3162697lfv.40.1700678057297;
        Wed, 22 Nov 2023 10:34:17 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id r18-20020aa7cfd2000000b0053f10da1105sm68825edy.87.2023.11.22.10.34.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Nov 2023 10:34:16 -0800 (PST)
Message-ID: <4222268b-ff44-4b7d-bf11-e350594bbe24@redhat.com>
Date: Wed, 22 Nov 2023 19:34:15 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Implement per-key keyboard backlight as auxdisplay?
Content-Language: en-US, nl
To: Werner Sembach <wse@tuxedocomputers.com>, Pavel Machek <pavel@ucw.cz>,
 Jani Nikula <jani.nikula@linux.intel.com>, jikos@kernel.org,
 Jelle van der Waa <jelle@vdwaa.nl>
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
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <f416fbca-589b-4f6a-aad6-323b66398273@tuxedocomputers.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Werner,

On 11/21/23 14:29, Werner Sembach wrote:
> 
> Am 21.11.23 um 13:20 schrieb Hans de Goede:
>> Hi Werner,
>>
>> On 11/21/23 12:33, Werner Sembach wrote:
>>> Hi,
>>>
>>> Am 20.11.23 um 21:52 schrieb Pavel Machek:
>>>> Hi!
>>>>
>>>>>>> So... a bit of rationale. The keyboard does not really fit into the
>>>>>>> LED subsystem; LEDs are expected to be independent ("hdd led") and not
>>>>>>> a matrix of them.
>>>>>> Makes sense.
>>>>>>
>>>>>>> We do see various strange displays these days -- they commonly have
>>>>>>> rounded corners and holes in them. I'm not sure how that's currently
>>>>>>> supported, but I believe it is reasonable to view keyboard as a
>>>>>>> display with slightly weird placing of pixels.
>>>>>>>
>>>>>>> Plus, I'd really like to play tetris on one of those :-).
>>>>>>>
>>>>>>> So, would presenting them as auxdisplay be acceptable? Or are there
>>>>>>> better options?
>>>>>> It sounds like a fair use case -- auxdisplay are typically simple
>>>>>> character-based or small graphical displays, e.g. 128x64, that may not
>>>>>> be a "main" / usual screen as typically understood, but the concept is
>>>>>> a bit fuzzy and we are a bit of a catch-all.
>>>>>>
>>>>>> And "keyboard backlight display with a pixel/color per-key" does not
>>>>>> sound like a "main" screen, and having some cute effects displayed
>>>>>> there are the kind of thing that one could do in the usual small
>>>>>> graphical ones too. :)
>>>>>>
>>>>>> But if somebody prefers to create new categories (or subcategories
>>>>>> within auxdisplay) to hold these, that could be nice too (in the
>>>>>> latter case, I would perhaps suggest reorganizing all of the existing
>>>>>> ones while at it).
>>>>> One could also reasonably make the argument that controlling the
>>>>> individual keyboard key backlights should be part of the input
>>>>> subsystem. It's not a display per se. (Unless you actually have small
>>>>> displays on the keycaps, and I think that's a thing too.)
>>>> While it would not be completely crazy to do that... I believe the
>>>> backlight is more of a display and less of a keyboard. Plus input
>>>> subystem is very far away from supporting this, and we had no input
>>>> from input people here.
>>>>
>>>> I don't think LED subsystem is right place for this, and I believe
>>>> auxdisplay makes slightly more sense than input.
>>>>
>>>> Unless someone steps up, I'd suggest Werner tries to implement this as
>>>> an auxdisplay. [And yes, this will not be simple task. RGB on LED is
>>>> different from RGB on display. But there are other LED displays, so
>>>> auxdisplay should handle this. Plus pixels are really funnily
>>>> shaped. But displays with missing pixels -- aka holes for camera --
>>>> are common in phones, and I believe we'll get variable pixel densities
>>>> -- less dense over camera -- too. So displays will have to deal with
>>>> these in the end.]
>>> Another idea I want to throw in the mix:
>>>
>>> Maybe the kernel is not the right place to implement this at all. RGB stuff is not at all standardized and every vendor is doing completely different interfaces, which does not fit the kernel userpsace apis desire to be uniformal and fixed. e.g. Auxdisplay might fit static setting of RGB values, but it does not fit the snake-effect mode, or the raindrops mode, or the 4-different-colors-in-the-edges-breathing-and-color-cycling mode.
>>>
>>> So my current idea: Implement these keyboards as a single zone RGB kbd_backlight in the leds interface to have something functional out of the box, but make it runtime disable-able if something like https://gitlab.com/CalcProgrammer1/OpenRGB wants to take over more fine granular control from userspace via hidraw.
>> That sounds like a good approach to me. We are seeing the same with game controllers where steam and wine/proton also sometimes use hidraw mode to get access to all the crazy^W interesting features.
>>
>> That would mean that all we need to standardize and the kernel <-> userspace API level is adding a standard way to disable the single zone RGB kbd_backlight support in the kernel.
> 
> I would suggest a simple "enable" entry. Default is 1. When set to 0 the kernel driver no longer does anything.

I'm not in favor of using "enable" as sysfs attribute for this,
I would like to see a more descriptive name, how about:

"disable_kernel_kbd_backlight_support"

And then maybe also have the driver actually unregister
the LED class device ?

Or just make the support inactive when writing 1 to
this and allow re-enabling it by writing 0?

> Questions:
> 
> - Should the driver try to reset the settings to boot default? Or just leave the device in the current state? With the former I could see issues that they keyboard is flashing when changing from kernelspace control to userspace control. With the later the burden on bringing the device to a know state lies with the userspace driver.

My vote would go to leave the state as is. Even if the hw
does not support state readback, then the userspace code
can readback the state before writing 1 to
"disable_kernel_kbd_backlight_support"

> - Should this be a optional entry that only shows up on drivers supporting it, or could this implemented in a generic way affecting all current led entries?

IMHO this should be optional. If we go with the variant
where writing 1 to "disable_kernel_kbd_backlight_support"
just disables support and 0 re-enables it then I guess
we could have support for this in the LED-core, enabled
by a flag set by the driver.

If we go with unregistering the led class device,
then this needs to be mostly handled in the driver.

Either way the kernel driver should know about this even
if it is mostly handled in the LED core so that e.g.
it does not try to restore settings on resume from suspend.

> - I guess UPower integration for the userspace driver could be archived with https://www.kernel.org/doc/html/latest/leds/uleds.html however this limited to brightness atm, so when accent colors actually come to UPower this would also need some expansion to be able to pass a preferred color to the userspace driver (regardless of what that driver is then doing with that information).

Using uleds is an interesting suggestion, but upower atm
does not support LED class kbd_backlight devices getting
hot-plugged. It only scans for them once at boot.

Jelle van der Waa (a colleague of mine, added to the Cc)
has indicated he is interested in maybe working on fixing
this upower short-coming as a side project, once his
current side-projects are finished.

> On a different note: This approach does currently not cover the older EC controlled 3 zone keyboards from clevo. Here only the kernel has access access to the device so the kernel driver has to expose all functionality somehow. Should this be done by an arbitrarily designed platform device?

Interesting question, this reminds there was a discussion
about how to handle zoned keyboards using plain LED class
APIs here:

https://lore.kernel.org/linux-leds/544484b9-c0ac-2fd0-1f41-8fa94cb94d4b@redhat.com/

Basically the idea discussed there is to create
separate multi-color LED sysfs devices for each zone,
using :rgb:kbd_zoned_backlight-xxx as postfix, e.g. :

 :rgb:kbd_zoned_backlight-left
 :rgb:kbd_zoned_backlight-middle
 :rgb:kbd_zoned_backlight-right
 :rgb:kbd_zoned_backlight-wasd

As postfixes for the 4 per zone LED class devices
and then teach upower to just treat this as
a single kbd-backlight for the existing upower
DBUS API and maybe later extend the DBUS API.

Would something like this work for the Clevo
case you are describing?

Unfortunately this was never implemented but
I think that for simple zoned backlighting
this still makes sense. Where as for per key
controllable backlighting as mention in
$subject I do believe that just using hidraw
access directly from userspace is best.

Regards,

Hans




