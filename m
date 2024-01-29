Return-Path: <linux-leds+bounces-715-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B0938406C6
	for <lists+linux-leds@lfdr.de>; Mon, 29 Jan 2024 14:24:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5E51FB24222
	for <lists+linux-leds@lfdr.de>; Mon, 29 Jan 2024 13:24:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB8FC63133;
	Mon, 29 Jan 2024 13:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Lfn/I/mV"
X-Original-To: linux-leds@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE06863127
	for <linux-leds@vger.kernel.org>; Mon, 29 Jan 2024 13:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706534683; cv=none; b=owNNFNMekfDIyF1RB3yaMiRbU30IQydKWYHk1kqDBK67Hv1+5u65c2ldmH1PVK7wlhNuHxj6jkOR7hd12Lc4Wqu3Nti1Q6pSF8wvjJnX9tzUdRi0VicDiYB3V/BjLLfWePMAp5aty9AjId14UUeynjRWKzvlGAJV4/Gm8+YeKzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706534683; c=relaxed/simple;
	bh=XFRkpCkjwF0wDR3+g+hgQk3lmDL24IjFiHznsNLd29M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MW1fDl3zdK2JyN0eoBbaHfCBeTrnZlOWQNvZw5VNvjjk7EonTUAvUsQj/mzkQP+sXXlyZkuMpF4IF5aDGUmEZumMdVgOic4sQPqz7bBVmra/UcSElu0WLKTSa3FiVR1BJlhLk36+Ljq62njyoIa1XuaQGokXxDDKB2S0xMep2Jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Lfn/I/mV; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706534680;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BGlFJrp2hLINa9F8XlDW2FVIbAYnTd96Mns8ZAb4VDE=;
	b=Lfn/I/mVpDpfPflUPKiMBQCx9MUSU4XkpQfS8wxV2VnQ8nhYJMJBqcxpL0fBtPq7X9d4Qh
	79UXrg/ExZ7W9lv5aRQfL3K2I7sMZOWBb16XA/Rlyd7mO5Lwt3PleHXalZ4zNjAZtVb2ro
	crz0B40gxW+ggz6aLYK4foAeho8kWOw=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-519-tGORlHK0Ony1-0_QC5vISA-1; Mon, 29 Jan 2024 08:24:39 -0500
X-MC-Unique: tGORlHK0Ony1-0_QC5vISA-1
Received: by mail-lf1-f69.google.com with SMTP id 2adb3069b0e04-5110fdc81e0so889048e87.2
        for <linux-leds@vger.kernel.org>; Mon, 29 Jan 2024 05:24:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706534678; x=1707139478;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BGlFJrp2hLINa9F8XlDW2FVIbAYnTd96Mns8ZAb4VDE=;
        b=oDX1t+Wrl2pxB0f6+XytLhzQOx7h3PZROQkTEGnocT2aQG8ElPmbW9ZrnS/ldDiwJM
         bNsDm5PPsMb7LmNL2s+74VQxXFe0JX9bMpAOB6MHlILiwi3QXd+A08+bavGG03vMJ8qG
         QBgw+M3eF4x5HcCNOuSq7tCa68tmvmsMYJoc060k8T2QU3Ir8APw2hTPpv6yofLGlKxO
         EPb9kw2aSNcf7/XjBzpM/b11b5h8EdTU1wcUYfUJ+R4BKja2Jb4e78p0PgkL7gQ4yfhj
         +8EFmihkWV0u0OfKb8oQ58o8vjOxyAUr00RppHoyd8Tt7VF5MZa1H+6xfNwZvnBzv4xh
         lC1A==
X-Gm-Message-State: AOJu0YzQmx9eZ18dgLVs0qxPpJa4IhTvIGeVMr+1zxZTEXgzi7Fc+RUN
	jK7JxlGJYsDx8j1mfjyIiFrQrxS/6b/7vGX0YqsFVdXsBYnqxZZaO3hAJbIJwr/Lmd4k+pJxiUq
	/QnN03CIGmxhlAxrN0SWlVO6dKU4DpsVGcVOm36nvPT5bxYrAw2YoNahz4TA=
X-Received: by 2002:a05:6512:2019:b0:510:d7e:4cbe with SMTP id a25-20020a056512201900b005100d7e4cbemr2856029lfb.63.1706534677940;
        Mon, 29 Jan 2024 05:24:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH2N6aqVZGWGTsGYC6uZhJGvG/Rt9NH6BcQcbE2XifyO9LcSwUAWCUTThWz4kwbtJvSoGU7GA==
X-Received: by 2002:a05:6512:2019:b0:510:d7e:4cbe with SMTP id a25-20020a056512201900b005100d7e4cbemr2856016lfb.63.1706534677633;
        Mon, 29 Jan 2024 05:24:37 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id vg10-20020a170907d30a00b00a356c0fdd2csm2164303ejc.26.2024.01.29.05.24.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jan 2024 05:24:37 -0800 (PST)
Message-ID: <bf47614c-0270-462d-9cad-ff415a3a3d81@redhat.com>
Date: Mon, 29 Jan 2024 14:24:36 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Implement per-key keyboard backlight as auxdisplay?
Content-Language: en-US, nl
To: Pavel Machek <pavel@ucw.cz>
Cc: Werner Sembach <wse@tuxedocomputers.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, jikos@kernel.org,
 Jelle van der Waa <jelle@vdwaa.nl>,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Lee Jones <lee@kernel.org>,
 linux-kernel@vger.kernel.org,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 linux-input@vger.kernel.org, ojeda@kernel.org, linux-leds@vger.kernel.org
References: <CANiq72mfP+dOLFR352O0UNVF8m8yTi_VmOY1zzQdTBjPWCRowg@mail.gmail.com>
 <87sf61bm8t.fsf@intel.com> <ZVvHG/Q+V6kCnfKZ@duo.ucw.cz>
 <f4137e34-c7fb-4f21-bc93-1496cbf61fdf@tuxedocomputers.com>
 <8096a042-83bd-4b9f-b633-79e86995c9b8@redhat.com>
 <f416fbca-589b-4f6a-aad6-323b66398273@tuxedocomputers.com>
 <4222268b-ff44-4b7d-bf11-e350594bbe24@redhat.com>
 <ac02143c-d417-49e5-9c6e-150cbda71ba7@tuxedocomputers.com>
 <ZaljwLe7P+dXHEHb@duo.ucw.cz>
 <6bbfdd62-e663-4a45-82f4-445069a8d690@redhat.com>
 <ZarYSkzISyS+wuYR@duo.ucw.cz>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <ZarYSkzISyS+wuYR@duo.ucw.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 1/19/24 21:15, Pavel Machek wrote:
> Hi!
> 
>>>> 2. Implement per-key keyboards as auxdisplay
>>>>
>>>>     - Pro:
>>>>
>>>>         - Already has a concept for led positions
>>>>
>>>>         - Is conceptually closer to "multiple leds forming a singular entity"
>>>>
>>>>     - Con:
>>>>
>>>>         - No preexisting UPower support
>>>>
>>>>         - No concept for special hardware lightning modes
>>>>
>>>>         - No support for arbitrary led outlines yet (e.g. ISO style enter-key)
>>>
>>> Please do this one.
>>
>> Ok, so based on the discussion so far and Pavel's feedback lets try to
>> design a custom userspace API for this. I do not believe that auxdisplay
>> is a good fit because:
> 
> Ok, so lets call this a "display". These days, framebuffers and drm
> handles displays. My proposal is to use similar API as other displays.
> 
>> So my proposal would be an ioctl interface (ioctl only no r/w)
>> using /dev/rgbkbd0 /dev/rgbkdb1, etc. registered as a misc chardev.
>>
>> For per key controllable rgb LEDs we need to discuss a coordinate
>> system. I propose using a fixed size of 16 rows of 64 keys,
>> so 64x16 in standard WxH notation.
>>
>> And then storing RGB in separate bytes, so userspace will then
>> always send a buffer of 192 bytes per line (64x3) x 14 rows
>> = 3072 bytes. With the kernel driver ignoring parts of
>> the buffer where there are no actual keys.
> 
> That's really really weird interface. If you are doing RGB888 64x14,
> lets make it a ... display? :-).
> 
> ioctl always sending 3072 bytes is really a hack.
> 
> Small displays exist and are quite common, surely we'd handle this as
> a display:
> https://pajenicko.cz/displeje/graficky-oled-displej-0-66-64x48-i2c-bily-wemos-d1-mini
> It is 64x48.

This is indeed a display and should use display APIs

> And then there's this:
> https://pajenicko.cz/displeje/maticovy-8x8-led-displej-s-radicem-max7219
> and this:
> https://pajenicko.cz/displeje/maticovy-8x32-led-displej-s-radicem-max7219
>
> One of them is 8x8.
> 
> Surely those should be displays, too?

The 8x8 one not really, the other one could be used to scroll
some text one but cannot display images, so not really displays
IMHO.

Anyways we are talking about keyboards here and those do not have
a regular x-y grid like your example above, so they certainly do
not count as displays. See the long discussion earlier in the thread.

Regards,

Hans





