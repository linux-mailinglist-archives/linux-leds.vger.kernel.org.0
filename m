Return-Path: <linux-leds+bounces-1363-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 501B588DC57
	for <lists+linux-leds@lfdr.de>; Wed, 27 Mar 2024 12:18:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 066DA29996F
	for <lists+linux-leds@lfdr.de>; Wed, 27 Mar 2024 11:18:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEEC359B5C;
	Wed, 27 Mar 2024 11:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Tpur/Lkm"
X-Original-To: linux-leds@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 345CE5811A
	for <linux-leds@vger.kernel.org>; Wed, 27 Mar 2024 11:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711538316; cv=none; b=E2gv9wjK0iAlm3YuuHpAe385auOCkCvz287xqBAlyGwG7TVhHmygQyna5/fQDRV7N6AFLfpLjUPPEKomO/8drZLjZwoPvxZmxF5Tq1EstKu5GtPb/1st64PUFs5cy05IYZWwYGmTunZLVnr/guuUE/qD1rSuA5TK9NF9/o3N1pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711538316; c=relaxed/simple;
	bh=PV6iBV3NTtZSk+xti3mU4j4ZRMotMMn3ZMUL9aGb8Lw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iIlQyWfKmzvlGFD4a0bGG4yxhn1f9HF38FBRWmz0htAS43srZhBsku3sMiPOp09mi4x9FoiPOWHDOf4mqR1VFRATT5z4TLpxAa0FGA20Gfqgvn8qE42N0RPpZPUZJAMFMLHqQFqx5L12K4zrhm1FwdGk3ADf0CY+PV7xRrvxL1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Tpur/Lkm; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711538314;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5hjUO3X0f8evhTpl93uFd1JpuHN37SYWADTl9Dfh7Ok=;
	b=Tpur/Lkm1P5pbYwz5cVzmGGzQZz1zbp0LjA4ErxvdML3zC87mtQ4pijCG2urUtgFS7sgzz
	lkdYYtpIdXCLNbojy33aXrv+2GbyYRGVgVBQNZjLlwYnRUGGPTEwFmMv4BzQeqGleB9wh7
	a36+XL8/50ojRS9Vr2Vg/yosk5jB3q0=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-470-e5oRuddfPdmX_TajXqKV5Q-1; Wed, 27 Mar 2024 07:18:30 -0400
X-MC-Unique: e5oRuddfPdmX_TajXqKV5Q-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-a46bae02169so70531466b.1
        for <linux-leds@vger.kernel.org>; Wed, 27 Mar 2024 04:18:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711538309; x=1712143109;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5hjUO3X0f8evhTpl93uFd1JpuHN37SYWADTl9Dfh7Ok=;
        b=d4s7gI7seG1ljlhAwz1q67WFWhzgVkf6snkxnPULdMg8SfqUSM1+ctfiJa7aUNo1Wk
         7nLvbRSHRkJ9N/ieOtDKft3bsqSvSnT21SZRDZat1Sp1OXJkL7rhCw9ZICWHIhv8IYG2
         e1oJqFKqMzMo9JsQKGRKa6WtQnpKA8WhE1zd8+BTQXu8K6J4MI3aZ3m5G3GZihI7fP7o
         hNGZF0113EPb2SD2xk2gyzkgFEfhOcdzob0UVNKABXyQqYXnyBPHvMR5+Ve6SVQNffMI
         AEsgd8Qt2MSqNsNh+0/QJNnH8zqWMRXLPuBjeAoNJbCBCZiNB+pqQUAo+YUSCU+AbIwY
         ACzw==
X-Forwarded-Encrypted: i=1; AJvYcCXLlot7YJIL794RkQFuy1oaGtvT/8PziQDcUCsmXs608z6ED/GxP7yGU8gsEAayEVTK5X/bQY29rYPZUDiEUSgZVEOpN00xTBJbRQ==
X-Gm-Message-State: AOJu0YwsTvw6JZNEyIXXXDKsZ0CrJl+BbcwQAdlpjGUhV2hOtx9foB5p
	gMykTQ+sz9ZiDzdn5DoTurrfSj5ymgiK4TJwSP783XPUkqZWcsmCT6AF0/7A5GL0VsuPoukNiRq
	40ZqWicwVp2fXWe/k6n0/AoVrcoANyPN/NHKPGPkwJS038B10KPfvRnFVj4w=
X-Received: by 2002:a17:906:5653:b0:a4a:36e4:c3f9 with SMTP id v19-20020a170906565300b00a4a36e4c3f9mr3461653ejr.7.1711538309530;
        Wed, 27 Mar 2024 04:18:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGtL/LG14IkjrkAPVGdxcDdBbYWLCeTwDrzk3UV7Eh20ITH+X8xI4DGbIz8pRK7fB9NmOxylQ==
X-Received: by 2002:a17:906:5653:b0:a4a:36e4:c3f9 with SMTP id v19-20020a170906565300b00a4a36e4c3f9mr3461632ejr.7.1711538309182;
        Wed, 27 Mar 2024 04:18:29 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id u17-20020a17090663d100b00a468bcde79bsm5349484ejk.109.2024.03.27.04.18.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Mar 2024 04:18:28 -0700 (PDT)
Message-ID: <58014ecc-4353-494d-acfb-767e9c977abe@redhat.com>
Date: Wed, 27 Mar 2024 12:18:28 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 RESEND 1/6] platform: x86-android-tablets: other: Add
 swnode for Xiaomi pad2 indicator LED
Content-Language: en-US, nl
To: Andy Shevchenko <andy.shevchenko@gmail.com>, Kate Hsuan <hpa@redhat.com>
Cc: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
 linux-leds@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>,
 linux-kernel@vger.kernel.org, Sebastian Reichel <sre@kernel.org>,
 linux-pm@vger.kernel.org
References: <20240324150107.976025-1-hpa@redhat.com>
 <20240324150107.976025-2-hpa@redhat.com>
 <CAHp75Ve5201KNdjvDZYq_unHTKp9wZXPWZXDgStP8y+XjtnWWg@mail.gmail.com>
 <CAEth8oG7_qFuUrL+kX3ezNatWqKPqT-qiaO5NGY-N3F3ufQL9w@mail.gmail.com>
 <CAHp75VdQtmT0G1dFhdY7TrcBj2W6GhOaVv90_T1e3MdEtiduQQ@mail.gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75VdQtmT0G1dFhdY7TrcBj2W6GhOaVv90_T1e3MdEtiduQQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 3/27/24 12:05 PM, Andy Shevchenko wrote:
> On Wed, Mar 27, 2024 at 9:58 AM Kate Hsuan <hpa@redhat.com> wrote:
>> On Mon, Mar 25, 2024 at 3:30 AM Andy Shevchenko
>> <andy.shevchenko@gmail.com> wrote:
>>> On Sun, Mar 24, 2024 at 5:02 PM Kate Hsuan <hpa@redhat.com> wrote:
> 
> ...
> 
>>>> +/* main fwnode for ktd2026 */
>>>> +static const struct software_node ktd2026_node = {
>>>> +       .name = "ktd2026"
>>>
>>> Leave a comma, this is not a terminator.
>>>
>>>> +};
>>>
>>> When I asked about the name I relied on the fact that you have an idea
>>> how it works. So, assuming my understanding is correct, this platform
>>> may not have more than a single LED of this type. Dunno if we need a
>>> comment about this.
>>
>> I'll make a comment to describe the configuration.
>> This LED controller can be configured to an RGB LED like this. Also,
>> it can be configured as three single-color (RGB) LEDs to show red,
>> green, and blue only.
>> I think the name can be "ktd2026-multi-color". Is it good for you?
> 
> My point here is that the name is static and if you have more than one
> LED in the system, the second one won't be registered due to sysfs
> name collisions. Question here is how many of these types of LEDs are
> possible on the platform? If more than one, the name has to be
> dropped. Writing this I think a comment would be good to have in any
> case.
> 
> ...
> 
>>>> +static int __init xiaomi_mipad2_init(void)
>>>> +{
>>>> +       return software_node_register_node_group(ktd2026_node_group);
>>>> +}
>>>> +
>>>> +static void xiaomi_mipad2_exit(void)
>>>
>>> __exit ?
>> No need.
>> x86-andriod-tablet is based on platform_driver and platform_device so
>> it doesn't need __exit.
>>
>> I put __exit and the compiler complained about the warning.
>> ===
>> WARNING: modpost:
>> drivers/platform/x86/x86-android-tablets/x86-android-tablets: section
>> mismatch in reference: xiaomi_mipad2_info+0x50 (section: .init.rodata)
>> -> xiaomi_mipad2_exit (section: .exit.text)
>> ===
> 
> This is interesting. Why then do we call them symmetrically?
> 
> Hans, do we need to have anything here been amended?

No this is all as expected.

The platform driver's probe() function can be __init because
the platform device is registered with the special:
platform_create_bundle() function which takes a probe() function
and the actual "struct platform_driver" does not have .probe
set at all.

Since we need to do manual cleanup on remove() however we need
a remove() callback and that does sit in the struct platform_driver
and since remove() can normally also be called on manual unbind
of the driver through sysfs it cannot be in the __exit section.

I say normally because IIRC platform_create_bundle() disables
manual unbinding but the section checking code does not know this,
all it sees is that the "struct platform_driver" is not __exit
and that it references the remove() callback and therefor the
remove() callback itself cannot be __exit.

Regards,

Hans


