Return-Path: <linux-leds+bounces-1359-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C2D3388DBC6
	for <lists+linux-leds@lfdr.de>; Wed, 27 Mar 2024 12:01:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E5E661C276D2
	for <lists+linux-leds@lfdr.de>; Wed, 27 Mar 2024 11:01:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80A4654667;
	Wed, 27 Mar 2024 11:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="i7wLWqSA"
X-Original-To: linux-leds@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D29D2535B2
	for <linux-leds@vger.kernel.org>; Wed, 27 Mar 2024 11:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711537282; cv=none; b=BFQXrw8hsfemx3YIUdoA0v98l2o6FfcLeCb4Q8HtJN+K50S5FZS8aXb619vqLlUqDTtK+9TY2fdz0OAqw9oTqnVwKnpqufnSyIUfaeGQYRU19zUZVdAx8teW6z5qzfYVOK4Fhqo/Ynpd8B29raj3Dnp4ExvpgwjW2cCIXAs5XlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711537282; c=relaxed/simple;
	bh=OCgOC55RkGuZFBUWdYqsYbnWl7hU8PQnILlI2tenrQU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Hq2nVxOdg2Jpj4XM2KUsly9BfDuAjUONTRaxa0F5vRv8MVYDfHtM/3xUd2cirNMhb60HsFz9BUJg5+fkYPI1XRnj1aIpzf1loY7ONN+UWQqbedmil1MmpMVsjx6C8U4afrkxUTqxdRhWJkJ0qSEC4f12hw5yYxVeFrl5E65waiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=i7wLWqSA; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711537280;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ijmIYkbtUgLloemb3IYBRxrYfQqt9ANY3s0WCkNZQa8=;
	b=i7wLWqSAfbN7GIEIAsoL4qXc022bu6Do7z1vVXxb1+smSfornovTuG7G0nwZYzyZpQFUXf
	OzdTTQ92/a04nktZpAJ2oxkv7+ZO5wi5HYyrNohUk5wmnUXqUJixoVzW6HVbAqbruMco1N
	IotaBDtAsOiH2Rhl2VPL27k67Lgh4UM=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-363-ZAsdn5kcPOaBvFCZ8o0Onw-1; Wed, 27 Mar 2024 07:01:16 -0400
X-MC-Unique: ZAsdn5kcPOaBvFCZ8o0Onw-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-a474ee91f00so153334166b.0
        for <linux-leds@vger.kernel.org>; Wed, 27 Mar 2024 04:01:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711537275; x=1712142075;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ijmIYkbtUgLloemb3IYBRxrYfQqt9ANY3s0WCkNZQa8=;
        b=MMH9eyj9J1uauLP95JOOL5vn/7PssDxFbHDtPxCgaRthlv88stX6IStH153vTYAXXo
         YvJUV9dadF/hJicLj7XKfEGuyqzxF4uGPkJSfrOILVS12ln63rGsDDsfuVOYX/yBm6aQ
         93WHj/576gK5MXCamaK92rEHhWGjeqo0CssSojuJiMjt6s2o8CFySaept+uMzD8uOylG
         09PZaUE82L5xRvpcuxZ4ylmR2feR8I3rEw1rewWiFgxHTtVCtuhnnfUw37zDfuJqoTB8
         Dr6HVk4LYh7WzlurwLIzExlx5zpss4Sl3OIhy9HZ+wiSsO/5dXr0lyV2wHGqv7N1G00x
         lipg==
X-Forwarded-Encrypted: i=1; AJvYcCWYDLIpVTErNK8NWL1vZPg+K4H/4mdLo6kJAC7eSE/AhrKH2T5G/QoNn7w0OVyypR8Di/CCYBb7wwSHAwKLxg8V2W6bg/aasm7vBQ==
X-Gm-Message-State: AOJu0YxZEOA45f3GY0GUqKgy1gwfOBiw8Vm/Ek70hpAiI3QTb0LEEoW1
	v0NMMILaRQKD273s/3i2XN7QrtztdKfhlNkYoUjSoIC/IJBtcKeLqr2xhg3L5raUzERf/I4P0a5
	Iudj4fUrS682QS0QkwqG8u/kkaYH2lJaMkpg6h+iwFCNCTk26+oH4j+KZ6UI=
X-Received: by 2002:a17:906:411b:b0:a45:94bf:18e6 with SMTP id j27-20020a170906411b00b00a4594bf18e6mr703033ejk.73.1711537275416;
        Wed, 27 Mar 2024 04:01:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHIUiXXgqzuCXG1SnQhqhZWjP4NPbliJw2BfoqBSvCm3uFfuZwCbtt/lNUnL0xkGv7en/Zo2Q==
X-Received: by 2002:a17:906:411b:b0:a45:94bf:18e6 with SMTP id j27-20020a170906411b00b00a4594bf18e6mr703015ejk.73.1711537275058;
        Wed, 27 Mar 2024 04:01:15 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id kv20-20020a17090778d400b00a46cc48ab07sm5296891ejc.221.2024.03.27.04.01.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Mar 2024 04:01:14 -0700 (PDT)
Message-ID: <42e676ec-f44e-4447-aa4e-c5ab70b5bf91@redhat.com>
Date: Wed, 27 Mar 2024 12:01:13 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: In kernel virtual HID devices (was Future handling of complex RGB
 devices on Linux v3)
Content-Language: en-US, nl
To: Benjamin Tissoires <bentiss@kernel.org>,
 Werner Sembach <wse@tuxedocomputers.com>
Cc: Lee Jones <lee@kernel.org>, jikos@kernel.org,
 linux-kernel@vger.kernel.org, Jelle van der Waa <jelle@vdwaa.nl>,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 linux-input@vger.kernel.org, ojeda@kernel.org, linux-leds@vger.kernel.org,
 Pavel Machek <pavel@ucw.cz>, Gregor Riepl <onitake@gmail.com>
References: <b6d79727-ae94-44b1-aa88-069416435c14@redhat.com>
 <a21f6c49-2c05-4496-965c-a7524ed38634@gmail.com>
 <825129ea-d389-4c6c-8a23-39f05572e4b4@redhat.com>
 <adbfdf6c-fb59-4fae-a472-17b04dd8a3f6@tuxedocomputers.com>
 <1fb08a74-62c7-4d0c-ba5d-648e23082dcb@tuxedocomputers.com>
 <aec1d22d-9e59-4dfc-b108-5ba339b0e76a@redhat.com>
 <siebkhaauocqkuox73q2e5p2mbsyc7j4gvpzfvt4c3gvncdpap@oxh5pp4gxpuo>
 <870cca8a-1a1b-4d17-874e-a26c30aca2bf@tuxedocomputers.com>
 <fcf4dd53-f461-4c2e-8fbe-50b50e4e6797@redhat.com>
 <65b24776-ae1a-4290-a1d5-c7637ad0accc@tuxedocomputers.com>
 <vjd5xqgd2gsyz4ubgk6eusuyqdtxpdw6vogc5u537x2a245xcj@m2twppbxea4p>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <vjd5xqgd2gsyz4ubgk6eusuyqdtxpdw6vogc5u537x2a245xcj@m2twppbxea4p>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 3/26/24 4:39 PM, Benjamin Tissoires wrote:
> On Mar 26 2024, Werner Sembach wrote:
>> Hi all,
>>
>> Am 25.03.24 um 19:30 schrieb Hans de Goede:
>>
>> [snip]
>>>>> If the kernel already handles the custom protocol into generic HID, the
>>>>> work for userspace is not too hard because they can deal with a known
>>>>> protocol and can be cross-platform in their implementation.
>>>>>
>>>>> I'm mentioning that cross-platform because SDL used to rely on the
>>>>> input, LEDs, and other Linux peculiarities and eventually fell back on
>>>>> using hidraw only because it's way more easier that way.
>>>>>
>>>>> The other advantage of LampArray is that according to Microsoft's
>>>>> document, new devices are going to support it out of the box, so they'll
>>>>> be supported out of the box directly.
>>>>>
>>>>> Most of the time my stance is "do not add new kernel API, you'll regret
>>>>> it later". So in that case, given that we have a formally approved
>>>>> standard, I would suggest to use it, and consider it your API.
>>>> The only new UAPI would be the use_leds_uapi switch to turn on/off the backwards compatibility.
> 
> I have my reserves with such a kill switch (see below).
> 
>>> Actually we don't even need that. Typically there is a single HID
>>> driver handling both keys and the backlight, so userspace cannot
>>> just unbind the HID driver since then the keys stop working.
> 
> I don't think Werner meant unbinding the HID driver, just a toggle to
> enable/disable the basic HID core processing of LampArray.

Right, what I was trying to say is that unbinding the driver
might be an alternative. I know things like the G15 keyboard
userspace daemons used to do this in the past.

But Werner is right that this won't be an option if the actual
keyboard presses and the LampArray parts are part of a single
HID device.

> 
>>>
>>> But with a virtual LampArray HID device the only functionality
>>> for an in kernel HID driver would be to export a basic keyboard
>>> backlight control interface for simple non per key backlight control
>>> to integrate nicely with e.g. GNOME's backlight control.
>>
>> Don't forget that in the future there will be devices that natively support
>> LampArray in their firmware, so for them it is the same device.
> 
> Yeah, the generic LampArray support will not be able to differentiate
> "emulated" devices from native ones.
> 
>>
>> Regards,
>>
>> Werner
>>
>>> And then when OpenRGB wants to take over it can just unbind the HID
>>> driver from the HID device using existing mechanisms for that.
> 
> Again no, it'll be too unpredicted.
> 
>>>
>>> Hmm, I wonder if that will not also kill hidraw support though ...
>>> I guess getting hidraw support back might require then also manually
>>> binding the default HID input driver.  Bentiss any input on this?
> 
> To be able to talk over hidraw you need a driver to be bound, yes. But I
> had the impression that LampArray would be supported by default in
> hid-input.c, thus making this hard to remove. Having a separate driver
> will work, but as soon as the LampArray device will also export a
> multitouch touchpad, we are screwed and will have to make a choice
> between LampArray and touch...

The idea is to have the actual RGB support in userspace through hidraw,
I believe we all agreed on that higher up in the thread.

Werner would like for there to also be a simpler in kernel support
which treats the per key lighting as if it is a more standard
(e.g. thinkpad x1) style keyboard backlight so that existing desktop
environment integration for that will work for users who do not
install say openrgb.

The question is how do we disable the in kernel basic kbd_backlight support
when openrgb wants to take over and fully control the LEDs ?

Given that driver unbinding is out of the question I think that we are
back to having a sysfs attribute to disable / re-enable the in kernel
basic kbd_backlight support.

Note that the basic kbd_backlight support also allows e.g. GNOME to
set the brightness (not only monitor it) so at a minimum we need to
disable the "write" support when e.g. openrgb has control.

Regards,

Hans




