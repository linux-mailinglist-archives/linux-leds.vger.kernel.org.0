Return-Path: <linux-leds+bounces-2916-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9116298C5E3
	for <lists+linux-leds@lfdr.de>; Tue,  1 Oct 2024 21:18:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AEAC41C23805
	for <lists+linux-leds@lfdr.de>; Tue,  1 Oct 2024 19:18:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1537F1CBE9F;
	Tue,  1 Oct 2024 19:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="Sdb32tkQ"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 312F91CCEDF;
	Tue,  1 Oct 2024 19:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727810291; cv=none; b=UF+j3KIHyUbIB4n+8Nxke4oVDqxA2rswXLohTl5e/k9i5ZboYd47N/MphhkS+f4olRE4rAkkLrVPETusBbgwKWdLIYA47sJCvSnDqOLVODua5hquttM+YDyo9XuXJuzeiEfyFUS7YXEKua01C5pMYBx0sjbFyw/BedgEufKEd2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727810291; c=relaxed/simple;
	bh=hMKzXJ6JZyuiToANzK/Tu9BgvHhl2iP27Xm9dV0R3EM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IYnHbdl97F+S/Tyl30XtyICHtUomNP0dHZefhJbuhFZRgHiZX4xGO7BtCZd/FqyuyMnbcHzwZgqc0k43jqcbgJWyZFXPhTYG16EiwvQ2U9D0/ef+Q0pjlfmcMvp4zdJCVGq+kBOl765nWCyuwMds8hM9q5hFXpc0nFaK2pEeJiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=Sdb32tkQ; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Received: from [192.168.42.96] (pd9e59da1.dip0.t-ipconnect.de [217.229.157.161])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPSA id CC9192FC0055;
	Tue,  1 Oct 2024 21:18:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1727810281;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=X+cw6q/5i1bHOSzS2dbiJ/kQFGbl+76ohWRhqh4yiPA=;
	b=Sdb32tkQwZjeq/p721EE3umIc9ILqyJfy+sYxgXQZJ8ITa28NRr+KAvJLpIuBz5f4mKdBT
	2P7KNMrMXlAjbajjZLuAhtqE4kHOQCD7pOXTu9GtHu72hnzLjZXkx6BCF56kY9aXWDmMZ9
	tWzf+MXCbD0aQgqiaO6U5HOTKwV1qhs=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
Message-ID: <7ce4470c-a502-416a-8472-a5b606bb8fd4@tuxedocomputers.com>
Date: Tue, 1 Oct 2024 21:18:00 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] platform/x86/tuxedo: Add virtual LampArray for TUXEDO
 NB04 devices
To: Benjamin Tissoires <bentiss@kernel.org>
Cc: Armin Wolf <W_Armin@gmx.de>, Pavel Machek <pavel@ucw.cz>,
 Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 dri-devel@lists.freedesktop.org, jelle@vdwaa.nl, jikos@kernel.org,
 lee@kernel.org, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-leds@vger.kernel.org, miguel.ojeda.sandonis@gmail.com,
 ojeda@kernel.org, onitake@gmail.com, platform-driver-x86@vger.kernel.org
References: <ZvcdNXQJmc8cjifw@amd.ucw.cz>
 <bea39077-6104-4b59-8757-9cbe0e703e5c@gmx.de>
 <7r3zg4tcmp5ozjwyiusstgv7g4dha4wuh4kwssxpk3tkurpgo3@36laqab7lsxp>
 <58cf1777-222f-4156-9079-bcbba4a32c96@tuxedocomputers.com>
 <45qkbpaxhrv2r32hghjqoexkenktymzyjgpx2xnnxt6dmfawjt@44lrhgcnozh3>
 <586a1c41-bbe0-4912-b7c7-1716d886c198@tuxedocomputers.com>
 <5th4pisccud5s7dbia42glsnu7e5u3q7jszty6o3mjdedsd2bg@7nsvp6t2krnf>
 <b6f2244d-7567-49ac-b2db-23b632a4e181@tuxedocomputers.com>
 <cflor5mz4flekn44ttlbanfigmwn5mmp3p54gkeeznzmzkyjqz@p2c6q7gulrdl>
 <84b629c6-5b26-4285-9b2f-66dd1afa99e5@tuxedocomputers.com>
 <zph6fnuaamhayivmzftowjw6klgcy2gb7vdub2v2yo7n665vpo@rkxtorfvmzph>
Content-Language: en-US
From: Werner Sembach <wse@tuxedocomputers.com>
In-Reply-To: <zph6fnuaamhayivmzftowjw6klgcy2gb7vdub2v2yo7n665vpo@rkxtorfvmzph>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Benjamin,

Am 01.10.24 um 15:41 schrieb Benjamin Tissoires:
> On Oct 01 2024, Werner Sembach wrote:
>> (sorry resend because thunderbird made it a html mail)
>>
>> Hi,
>>
>> Am 30.09.24 um 19:06 schrieb Benjamin Tissoires:
>>> On Sep 30 2024, Werner Sembach wrote:
>>>> [...]
>>>> Thinking about it, maybe it's not to bad that it only changes once udev is
>>>> ready, like this udev could decide if leds should be used or if it should
>>>> directly be passed to OpenRGB for example, giving at least some consistency
>>>> only changing once: i.e. firmware -> OpenRGB setting and not firmware->leds
>>>> setting->OpenRGB setting.
>>> That would work if OpenRGB gets to ship the LampArray bpf object (not
>>> saying that it should). Because if OpenRGB is not installed, you'll get
>>> a led class device, and if/when OpenRGB is installed, full LampArray
>>> would be presented.
>> The idea in my head is still that there is some kind of sysfs switch to
>> enable/disable leds.
> FWIW, I'm never a big fan of sysfs. They become UAPI and we are screwed
> without possibility to change them...
>
>> My idea is then that a udev rule shipped with OpenRGB sets this switch to
>> disable before loading the BPF driver so leds never get initialized for the
>> final LampArray device.
> FWIW, udev-hid-bpf can inject a udev property into a HID-BPF. So
> basically we can have a udev property set (or not) by openrgb which
> makes the BPF program decide whether to present the keyboard as
> LampArray or not.
>
>>> But anyway, BPF allows to dynamically change the behaviour of the
>>> device, so that's IMO one bonus point of it.
>>>
>>>>> FWIW, the use of BPF only allows you to not corner yourself. If you
>>>>> failed at your LampArray implementation, you'll have to deal with it
>>>>> forever-ish. So it's perfectly sensible to use BPF as an intermediate step
>>>>> where you develop both userspace and kernel space and then convert back
>>>>> the BPF into a proper HID driver.
>>>> I don't really see this point: The LampArray API is defined by the HID Usage
>>>> Table and the report descriptor, so there is not API to mess up and
>>>> everything else has to be parsed dynamically by userspace anyway, so it can
>>>> easily be changed and userspace just adopts automatically.
>>>>
>>>> And for this case the proper HID driver is already ready.
>>> Yeah, except we don't have the fallback LED class. If you are confident
>>> enough with your implementation, then maybe yes we can include it as a
>>> driver from day one, but that looks like looking for troubles from my
>>> point of view.
>> To be on the safe side that we don't talk about different things: My current
>> plan is that the leds subsystem builds on top of the LampArray
>> implementation.
> I would say that the HID subsystem knows how to translate LampArray into
> a subset of LEDs. But I think that's what you are saying.
>
>> Like this the leds part has to be only implemented once for all LampArray
>> devices be it emulated via a driver or native via firmware in the device
>> itself.
> yep, that's the plan. However, not sure how to fit LampArray into LED.

My idea was that all leds just get treated as a singular led only allowing to 
set a singular color and brightness, but I just looked it up again: LampArray 
allows different color and brightness ranges per key, so the grouping might not 
be possible in a sensible way ...

Maybe the leds integration is a bad idea after all and we should just nudge the 
DEs and/or UPower to implement LampArray directly? But that's just kicking the 
complexity down the road, at least as long as there is not universal easy to use 
library (haven't looked into the library build of OpenRGB yet).

>
>> And I feel confident that the UAPI should be that the userspace gets a
>> hidraw device with a LampArray HID descriptor, and every thing else is, by
>> the HID spec, dynamic anyway so I can still change my mind in implementation
>> specifics there, can't I?
> Yeah... I think?
>
>  From my point of view we are just bikeshedding on to where put that
> "firmware" extension, in WMI, in HID (kernel with a subdriver), or
> externally in BPF.
>
>>> After a second look at the LampArray code here... Aren't you forgetting
>>> the to/from CPU conversions in case you are on a little endian system?
>> Since this driver is for built in keyboards of x86 notebooks it isn't
>> required or is it?
> Good point. Let's just hope you don't start shipping a LE laptop with
> the same keyboard hardware :)
Well there is the dmi table in the driver that would prevent issues in this front.
>
>>>> So the only point for me currently is: Is it ok to have key position/usage
>>>> description tables in the kernel driver or not?
>>> good question :)
>>>
>>> I would say, probably not in the WMI driver itself. I would rather have
>>> a hid-tuxedo.c HID driver that does that. But even there, we already had
>>> Linus complaining once regarding the report descriptors we sometimes
>>> insert in drivers, which are looking like opaque blobs. So it might not be
>>> the best either.
>> Isn't tuxedo_nb04_wmi_ab_virtual_lamp_array.c not something like
>> hid-tuxedo.c? or should it be a separate file with just the arrays?
> It is, in a way. I think it's more a question for Hans and the other
> platform maintainers, whether they would accept this.
>
>>> Sorry I don't have a clear yes/no answer.
>> Hm... Well if it's no problem I would keep the current implementation with
>> minor adjustments because, like i described above, I don't see a benefit now
>> that this already works to rewrite it in BPF again.
>>
>> If it is a problem then i don't see another way then to rewrite it in BPF.
>>
>> Note: For future devices there might be more keyboard layouts added,
>> basically every time the chassis form factor changes.
> If the WMI part doesn't change, then maybe having BPF would be easier
> for you in the future. Adding a HID-BPF file would cost basically
> nothing, and it'll be out of band with the kernel, meaning you can ship
> it in already running kernels (assuming the same WMI driver doesn't need
> any updates).
The WMI part will probably not change, but since we don't write the firmware but 
also just get it as a blob we can't control that. That's why I put the DMI table 
in the driver, so at least an expansion to the DMI table is required every time 
a new device releases.
>
>>> Cheers,
>>> Benjamin
>> To sum up the architechture (not mutally exclusive technically)
>>
>> /- leds
>> WMI <- WMI to LampArray Kernel driver <-switch-|
>>                                                 \- OpenRGB
>>
>> /- leds
>> WMI <- WMI to Custom HID Kernel driver <- Custom HID to LampArray BPF
>> driver<-switch-|
>> \- OpenRGB
>>
>> With the "switch" and "leds" implemented in hid core, automatically
>> initialized every time a LampArray device pops up (regardless if it is from
>> native firmware, a bpf driver or a kernel driver)
>>
>> Writing this down I think it was never decided how the switch should look like:
>>
>> It should not be a sysfs attribute of the leds device as the leds device
>> should disappear when the switch is set away from it, but should it be a
>> sysfs variable of the hid device? This would mean that hid core needs to add
>> that switch variable to every hid device having a LampArray section in the
>> descriptor.
> Again, not a big fan of the sysfs, because it's UAPI and need root to
> trigger it (though the udev rule sort this one out).
> BPF allows already to re-enumerate the device with a different look and
> feel, so it seems more appropriate to me.
>
> Also, having a sysfs that depends on the report descriptor basically
> means that we will lose it whenever we re-enumerate it (kind of what the
> LED problem you mentioned above). So we would need to have a sysfs on
> *every* HID devices???
>
> Actually, what would work is (ignoring the BPF bikeshedding for Tuxedos
> HW):
> - a device presents a report descriptor with LampArray (wherever it
>    comes from)
> - hid-led.c takes over it (assuming we extend it for LampArray), and
>    creates a few LEDs based on the Input usage (one global rgb color for
>    regular keys, another one for the few other LEDs known to userspace)
> - when openRGB is present (special udev property), a BPF program is
>    inserted that only contains a report descriptor fixup that prevent the
>    use of hid-led.c

How would that look like? just a custom bit in a "Vendor defined" usage page?

But this is still UAPI just hidden inside a BFP program instead of sysfs. But it 
would avoid the re-enumeration problem.

> - the device gets re-enumerated, cleaning the in-kernel leds, and only
>    present the LampArray through hidraw, waiting for OpenRGB to take
>    over.
> - at any time we can remove the BPF and restore the LEDs functionality
>    of hid-led.c
>
>>>>> Being able to develop a kernel driver without having to reboot and
>>>>> being sure you won't crash your kernel is a game changer ;)
>>>>>
>>>>> Cheers,
>>>>> Benjamin
>> Best regards and sorry for the many questions,
>>
>> Werner Sembach
>>
>> PS: on a side node: How does hid core handle HID devices with a broken HID
>> implementation fixed by bpf, if bpf is loaded after hid-core? Does the hid
>> device get reinitialized by hid core once the bpf driver got loaded? If yes,
>> is there a way to avoid side effects by this double initialization or is
>> there a way to avoid this double initialization, like marking the device id
>> as broken so that hid core- does not initialize it unless it's fixed by bpf?
> - broken HID device:
>    it depends on what you call "broken" HID device. If the report
>    descriptor is boggus, hid-core will reject the device and will not
>    present it to user space (by returning -EINVAL).
>    If the device is sensible in terms of HID protocol, it will present it
>    to userspace, but the fact that it creates an input node or LED or
>    whatever just depends on what is inside the report descriptor.
>
> - HID-BPF:
>    HID-BPF is inserted between the device itself and the rest of the
>    in-kernel HID stack.
>    Whenever you load and attach (or detach) a BPF program which has a
>    report descriptor fixup, HID-core will reconnect the device,
>    re-enumerate it (calling ->probe()), and will re-present it to
>    userspace as if it were a new device (you get all uevents).
>
> - double initialization:
>    nowadays hid-generic doesn't do anything on the device itself except
>    calling the powerup/powerdown, by calling ->start and ->stop on the
>    HID transport driver. It's not a problem on 99% of the devices AFAICT.
>    technically, if the report descriptor is bogus, start/stop won't be
>    called, but you'll get an error in the dmesg. So if you really want to
>    rely on that "broken" scenario we can always add a specific quirk in
>    HID to not spew that error.
>
> Cheers,
> Benjamin
>
> PPS: sorry for pushing that hard on HID-BPF, but I can see that it fits
> all of the requirements here:
> - need to be dynamic
> - still unsure of the userspace implementation, meaning that userspace
>    might do something wrong, which might require kernel changes

Well the reference implementetion for the arduiono macropad from microsoft 
ignores the intensity (brightness) channel on rgb leds contrary to the HID spec, 
soo yeah you have a point here ...

> - possibility to extend later the kernel API
> - lots of fun :)

You advertise it good ;). More work for me now but maybe less work for me later, 
I will look into it.

Best regards,

Werner


