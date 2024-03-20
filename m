Return-Path: <linux-leds+bounces-1275-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EA803881771
	for <lists+linux-leds@lfdr.de>; Wed, 20 Mar 2024 19:46:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 49F66B222C4
	for <lists+linux-leds@lfdr.de>; Wed, 20 Mar 2024 18:46:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E82588528D;
	Wed, 20 Mar 2024 18:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="f4tGR9zO"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F54052F78;
	Wed, 20 Mar 2024 18:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710960357; cv=none; b=ONVs74+1CriBXIsnxUj2UL3GZNIdjWxf3KqzP2+DqUaNJPlmZfH4pASxrNwnMkgWaa5xibtUanBd4GTM20iGWKXJla3DpL7VQfOlbiwqNhexTo0wRt68rmFupkbSNhC06E8YHnjKx2n+7+hzMX0BYiLQH4FMsAh0Cv92A09MLQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710960357; c=relaxed/simple;
	bh=FdvAryhYuwV2hmzPVyBwo1j+eckI21gR/HiDPzPWTGg=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=Xj0G7NSw49STVx3jbjl/3LBjZf9w+qBn4Q5JQw30Y0yc3hnkJjzpeKIhFGZXbVTT6sVKOhRGUQfVtx3M8rMnMxIYmpdPwmE6WmVnTk4HJOFsdUKMPSvY8deWvM05E5MBFGv8ZCMmGM6g3In+8QHB16CXalOJzPtJ77xbHkVY6ec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=f4tGR9zO; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Received: from [192.168.42.20] (pd9e59c8a.dip0.t-ipconnect.de [217.229.156.138])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPSA id 3E8C62FC0112;
	Wed, 20 Mar 2024 19:45:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1710960345;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0aJ6WogG8TKIkMoo2xB1GRutijq0g65zd7DzWfQd0xo=;
	b=f4tGR9zOeoNnuXaCPems0Yk3CHqLH8rQYPZgbz9KHVxqddiaqgtmuOTk2m89La8hZhIZJT
	epbtVjyFfEncfkX1T/CeG3NNHemqwCgqnf9z7BwXtUvK7jAfsQcMcN0lPM3Xmjt0g+gphx
	KmYoc49s+v9KutsRCGGpxN+vfnNZd0A=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
Message-ID: <742f2564-96bd-4b4c-89d6-7ef4e6b641a5@tuxedocomputers.com>
Date: Wed, 20 Mar 2024 19:45:43 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Future handling of complex RGB devices on Linux v3
Content-Language: en-US
From: Werner Sembach <wse@tuxedocomputers.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Lee Jones <lee@kernel.org>, jikos@kernel.org,
 linux-kernel@vger.kernel.org, Jelle van der Waa <jelle@vdwaa.nl>,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 linux-input@vger.kernel.org, ojeda@kernel.org, linux-leds@vger.kernel.org,
 Pavel Machek <pavel@ucw.cz>, Gregor Riepl <onitake@gmail.com>
References: <0cdb78b1-7763-4bb6-9582-d70577781e61@tuxedocomputers.com>
 <7228f2c6-fbdd-4e19-b703-103b8535d77d@redhat.com>
 <730bead8-6e1d-4d21-90d2-4ee73155887a@tuxedocomputers.com>
 <952409e1-2f0e-4d7a-a7a9-3b78f2eafec7@redhat.com>
 <9851a06d-956e-4b57-be63-e10ff1fce8b4@tuxedocomputers.com>
 <1bc6d6f0-a13d-4148-80cb-9c13dec7ed32@redhat.com>
 <b70b2ea8-abfd-4d41-b336-3e34e5bdb8c6@tuxedocomputers.com>
 <477d30ee-247e-47e6-bc74-515fd87fdc13@redhat.com>
 <e21a7d87-3059-4a51-af04-1062dac977d2@tuxedocomputers.com>
 <247b5dcd-fda8-45a7-9896-eabc46568281@tuxedocomputers.com>
 <ZdZ2kMASawJ9wdZj@duo.ucw.cz>
 <b6d79727-ae94-44b1-aa88-069416435c14@redhat.com>
 <a21f6c49-2c05-4496-965c-a7524ed38634@gmail.com>
 <825129ea-d389-4c6c-8a23-39f05572e4b4@redhat.com>
 <adbfdf6c-fb59-4fae-a472-17b04dd8a3f6@tuxedocomputers.com>
 <1fb08a74-62c7-4d0c-ba5d-648e23082dcb@tuxedocomputers.com>
 <31bbac5f-a1fc-41dd-b614-f9039763084d@tuxedocomputers.com>
In-Reply-To: <31bbac5f-a1fc-41dd-b614-f9039763084d@tuxedocomputers.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Am 20.03.24 um 12:33 schrieb Werner Sembach:
>
> Am 20.03.24 um 12:16 schrieb Werner Sembach:
>> Hi Hans and the others,
>>
>> Am 22.02.24 um 14:14 schrieb Werner Sembach:
>>> Hi,
>>>
>>> Thanks everyone for the exhaustive feedback. And at least this thread is a 
>>> good comprehesive reference for the future ^^.
>>>
>>> To recap the hopefully final UAPI for complex RGB lighting devices:
>>>
>>> - By default there is a singular /sys/class/leds/* entry that treats the 
>>> device as if it was a single zone RGB keyboard backlight with no special 
>>> effects.
>>>
>>> - There is an accompanying misc device with the sysfs attributes "name", 
>>> "device_type",  "firmware_version_string", "serial_number" for device 
>>> identification and "use_leds_uapi" that defaults to 1.
>>>
>>>     - If set to 0 the /sys/class/leds/* entry disappears. The driver should 
>>> keep the last state the backlight was in active if possible.
>>>
>>>     - If set 1 it appears again. The driver should bring it back to a static 
>>> 1 zone setting while avoiding flicker if possible.
>>>
>>> - If the device is not controllable by for example hidraw, the misc device 
>>> might also implement additional ioctls or sysfs attributes to allow a more 
>>> complex low level control for the keyboard backlight. This is will be a 
>>> highly vendor specific UAPI.
>> So in the OpenRGB issue thread 
>> https://learn.microsoft.com/en-us/windows-hardware/design/component-guidelines/dynamic-lighting-devices 
>> aka HID LampArray was mentioned. I did dismiss it because I thought that is 
>> only relevant for firmware, but I now stumbled upon the Virtual HID Framework 
>> (VHF) 
>> https://learn.microsoft.com/en-us/windows-hardware/drivers/hid/virtual-hid-framework--vhf- 
>> and now I wonder if an equivalent exists for Linux? A quick search did not 
>> yield any results for me.
> Is this what I have been searching for? 
> https://docs.kernel.org/usb/gadget_hid.html
Nope is something different: http://www.linux-usb.org/gadget/
>>
>> If a virtual HID device is possible and the WMI interface can reasonably be 
>> mapped to the LampArray API this might be the best starting point:
>>
>> - Implement a Virtual HID device with LampArray
>>
>> - Implement LampArray in OpenRGB
>>
>> - (Optional) Implement a generic LampArray leds subsystem driver that maps to 
>> the single zone control and ads the use_leds_uapi sysfs switch to the virtual 
>> HID device
>>
>> - (Optional) Implement vendor specific controls for 
>> AutonomousMode/built-in-firmware-effects via custom HID commands
>>
>> - (Optional) Implement Virtual HID devices for actual HID devices that don't 
>> support LampArray in firmware (Open question: How to prevent 
>> userspace/OpenRGB from interacting with original HID when the virtual HID 
>> device is not in AutonomousMode? How to associate the original and virtual 
>> HID device to each other that userspace can easily recognize this relation? 
>> Or is it possible to add virtual HID commands on top of a real HID device, 
>> making it look exactly like the pure virtual devices for userspace?)
>>
>> The LampArray API hereby is made with the intention to be used for multi leds 
>> devices, like per-key-backlight keyboards, unlike the leds UAPI. And it is 
>> coming anyway with new RGB devices soon. So it would not conflict with a 
>> "don't introduce unnecessary UAPI interfaces" principle. Are there any plans 
>> already of Wrapping LampArray in some kind ioctl/sysfs API? Or just have it 
>> used via hidraw? Or was there no discussion about it till now?
>>
>> Regards,
>>
>> Werner
>>
>>>
>>>     - The actual logic interacting with this low level UAPI is implemented 
>>> by a userspace driver
>>>
>>> Implementation wise: For the creation of the misc device with the 
>>> use_leds_uapi switch a helper function/macro might be useful? Wonder if it 
>>> should go into leds.h, led-class-multicolor.h, or a new header file?
>>>
>>> - Out of my head it would look something like this:
>>>
>>> led_classdev_add_optional_misc_control(
>>>     struct led_classdev *led_cdev,
>>>     char* name,
>>>     char* device_type,
>>>     char* firmware_version_string,
>>>     char* serial_number,
>>>     void (*deregister_led)(struct led_classdev *led_cdev),
>>>     void (*reregister_led)(struct led_classdev *led_cdev))
>>>
>>> Let me know your thoughts and hopefully I can start implementing it soon for 
>>> one of our devices.
>>>
>>> Kind regards,
>>>
>>> Werner Sembach
>>>

