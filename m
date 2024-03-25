Return-Path: <linux-leds+bounces-1338-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 156AE88A916
	for <lists+linux-leds@lfdr.de>; Mon, 25 Mar 2024 17:26:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 80B501F3F0D6
	for <lists+linux-leds@lfdr.de>; Mon, 25 Mar 2024 16:26:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59F7B14BF9F;
	Mon, 25 Mar 2024 14:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LKwF+omr"
X-Original-To: linux-leds@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 819CD15886A
	for <linux-leds@vger.kernel.org>; Mon, 25 Mar 2024 14:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711376726; cv=none; b=piex7kF2TYPcRkj6G48GfU+tPN+fPXilreblmbLb3p7bdY+EewOC5e/wXz19hqU/OJOO6jYoOxkNTYMyMhLITMzghVRkMENTsoEKizZbFy3R4oIHXKOXj0f+zkU5hoH2bIiBigv9+k3M75J5msOm+MbGAVE8dl+dH+sm0G/H5wY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711376726; c=relaxed/simple;
	bh=rzde9nZg0OvrJTww7H+/t1tWyrqe4/ueC3Y0WR6wWm8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NXhtJ6p7sUaQI3HutdfBwyf7lumqsAymMNvtThCWjYCn1ABJS8OolkXB2h8zSKJSaVbO/bjzuaATTzh1aL7A5cKxBjmO0WMfaVoEyV2KOWmgNj93kjnmxiIFZB9lyIZ0cfxw0/5cjhQ5d7UrAm4Nr6lKQ18Pwo1Z9Z8hFYRcL8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LKwF+omr; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711376723;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=P7f00HUXp3zd1m3YJGt//Yz1Nl22MNuXdWxqtATqspc=;
	b=LKwF+omr2KsmeTYhFiN36I0IRRDNySfflkZFeayDb1rmcGP31yiYHN726bDA4NIzwNBqGm
	vCRBou2DaN6XVXOy/MwDp98X7TlpArUUAJw9bUwYX+8hpeTRVMVMClmItncchSvWyqeo8b
	pUBsqhryVsfS/rf9qpYrLNMlA7ohlXQ=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-639-4YSGfTLFP5KmKDH_Jb5_7w-1; Mon, 25 Mar 2024 10:25:22 -0400
X-MC-Unique: 4YSGfTLFP5KmKDH_Jb5_7w-1
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-5684345c0ebso5842026a12.1
        for <linux-leds@vger.kernel.org>; Mon, 25 Mar 2024 07:25:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711376721; x=1711981521;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P7f00HUXp3zd1m3YJGt//Yz1Nl22MNuXdWxqtATqspc=;
        b=RDf4vj5GLePz+1H0pYsHGKtTzwn5hUi6pJQgYIZj2Uq3A4pClgjxGROzQl6EedlXHt
         Rl977MrvCru6yAUW872XfMNancw4cVCOztJg6xHFs0ppVA3Xbi+u+vX/Oh2rhgXoC8d5
         vu6fpUYirrhzN6iozwywBI1D8RyJQIy4vt32u9yJZD1xbdRLI5AHVuVyWEAOWUY/zH/o
         h01sUioMx10cMc0xn20TrVB6qHLqvAXkZQVtIIidUh1II6PUwHZqwzBk+ZzsQKWsajQo
         tOvAMds3BoA6f9KJOALs/hJZXY5UgKEOVUsYo56mMAG6vgRbJ3MpQmNpIlj8AW6a1kEW
         U9uQ==
X-Forwarded-Encrypted: i=1; AJvYcCV5NZLezOoy0niNX/Upxxv/sby/N3P7eIaiy1gdDZMiurwCwGIt4uDTIdI5cXhuiiorodQQZwHRryN2Qq803SRpxJLQjBuQWefY4Q==
X-Gm-Message-State: AOJu0Yy0Av99klsOyJBKQnDa2JRNDZIHRR0daQ8KBKi71eNcL4d0JaDd
	FLuZqBObxQNl3nlJmxKz4eUugm6TTgWjXz2TCeQ32nNXXtdz+pDLSmFt9WIBG7NgEkZ6Li3bSZq
	ReZicouEGZ5jRq6DeVcs5SmZLV2EvcIA/UNxrC2y+XGMpuRMomKAJFskfarc=
X-Received: by 2002:a50:9f46:0:b0:568:9f77:9c0 with SMTP id b64-20020a509f46000000b005689f7709c0mr5343910edf.4.1711376720828;
        Mon, 25 Mar 2024 07:25:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IExhsFatz36wq0gHQ23Z8oZAyiiQ9qppOFaIfR20MLP2ncbc0znQUTkcsy/vu+vh23j886d9A==
X-Received: by 2002:a50:9f46:0:b0:568:9f77:9c0 with SMTP id b64-20020a509f46000000b005689f7709c0mr5343885edf.4.1711376720363;
        Mon, 25 Mar 2024 07:25:20 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id w14-20020aa7cb4e000000b0056729e902f7sm3013149edt.56.2024.03.25.07.25.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Mar 2024 07:25:19 -0700 (PDT)
Message-ID: <aec1d22d-9e59-4dfc-b108-5ba339b0e76a@redhat.com>
Date: Mon, 25 Mar 2024 15:25:19 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: In kernel virtual HID devices (was Future handling of complex RGB
 devices on Linux v3)
Content-Language: en-US, nl
To: Werner Sembach <wse@tuxedocomputers.com>
Cc: Lee Jones <lee@kernel.org>, jikos@kernel.org,
 linux-kernel@vger.kernel.org, Jelle van der Waa <jelle@vdwaa.nl>,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 linux-input@vger.kernel.org, ojeda@kernel.org, linux-leds@vger.kernel.org,
 Pavel Machek <pavel@ucw.cz>, Gregor Riepl <onitake@gmail.com>,
 Benjamin Tissoires <bentiss@kernel.org>, Jiri Kosina <jikos@kernel.org>
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
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <1fb08a74-62c7-4d0c-ba5d-648e23082dcb@tuxedocomputers.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

+Cc: Bentiss, Jiri

Hi Werner,

On 3/20/24 12:16 PM, Werner Sembach wrote:
> Hi Hans and the others,
> 
> Am 22.02.24 um 14:14 schrieb Werner Sembach:
>> Hi,
>>
>> Thanks everyone for the exhaustive feedback. And at least this thread is a good comprehesive reference for the future ^^.
>>
>> To recap the hopefully final UAPI for complex RGB lighting devices:
>>
>> - By default there is a singular /sys/class/leds/* entry that treats the device as if it was a single zone RGB keyboard backlight with no special effects.
>>
>> - There is an accompanying misc device with the sysfs attributes "name", "device_type",  "firmware_version_string", "serial_number" for device identification and "use_leds_uapi" that defaults to 1.
>>
>>     - If set to 0 the /sys/class/leds/* entry disappears. The driver should keep the last state the backlight was in active if possible.
>>
>>     - If set 1 it appears again. The driver should bring it back to a static 1 zone setting while avoiding flicker if possible.
>>
>> - If the device is not controllable by for example hidraw, the misc device might also implement additional ioctls or sysfs attributes to allow a more complex low level control for the keyboard backlight. This is will be a highly vendor specific UAPI.
> So in the OpenRGB issue thread https://learn.microsoft.com/en-us/windows-hardware/design/component-guidelines/dynamic-lighting-devices aka HID LampArray was mentioned. I did dismiss it because I thought that is only relevant for firmware, but I now stumbled upon the Virtual HID Framework (VHF) https://learn.microsoft.com/en-us/windows-hardware/drivers/hid/virtual-hid-framework--vhf- and now I wonder if an equivalent exists for Linux? A quick search did not yield any results for me.

Oh, interesting. I did not know about the HID LampArray API.

About your question about virtual HID devices, there is uHID,
but as the name suggests this allows userspace to emulate a HID
device.

In your case you want to do the emulation in kernel so that you
can translate the proprietary WMI calls to something HID LampArray
compatible.

I guess you could do this by defining your own HID transport driver,
like how e.g. the i2c-hid code defines 1 i2c-hid parent + 1 HID
"client" for each device which talks HID over i2c in the machine.

Bentiss, Jiri, do you have any input on this. Would something like
that be acceptable to you (just based on the concept at least) ?

Regards,

Hans



