Return-Path: <linux-leds+bounces-2400-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C841947E25
	for <lists+linux-leds@lfdr.de>; Mon,  5 Aug 2024 17:32:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 52ECF281311
	for <lists+linux-leds@lfdr.de>; Mon,  5 Aug 2024 15:32:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44F8515B118;
	Mon,  5 Aug 2024 15:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="X3fTZaWB"
X-Original-To: linux-leds@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A139915B102
	for <linux-leds@vger.kernel.org>; Mon,  5 Aug 2024 15:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722871898; cv=none; b=BcSwVo+9ViKk1YLZyq9aDftCIAFN4UkS6aE3K48S4vBs1b+YnGyYE2GwQXt3eWKr82UBLuERJM9yrgrzJG2zq7uu4VvCF2Wb0X4jq8CrnQoK68Ny1DIhf6JtukfzMHYh3ie73rJ44m2fC45UuSHuoUzKmRv7MU0RQiqAAwmcHn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722871898; c=relaxed/simple;
	bh=LujCxIzyXRjwhPlqP8whLTzqd1Iwo0W1UDi1/ERk5Do=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mIjlvqzuLf9gD165WWOdvNfEovDzlSp+M891x3yOdBhudKBhvYB+PopdYQiYfflHNeTI4LaMHYtuiQMlg2jSsnVb6eNVpFUZVKtvIpl8ovjfoy1RCoXJM3NJMVfpTsM/nTHNt1a8ldROixmhkuuBpEyUR0SPzxsL9TtbapQUuMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=X3fTZaWB; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722871895;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=g6h3TlWGTE1+WlvLS85nPM+6D3cqZx0X5zf2j2PeJ3w=;
	b=X3fTZaWBUVbKh9k3BPdugbvrP2J/l75GeWQtcsDFKHNg3+npvosHVDXEr44WSaiTJMKWjr
	GFV62OQe5JMqpUMuMR9sDWMb1vhyXOuLoIoE+o7MZNGOzW1OBsVPPN1l7fySrgDDOfq6TQ
	c5oUzanJQL0xBPtRiyz/SAWzlfvYQYo=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-26-aOEEkzq3OESPZ3G7_3-eBQ-1; Mon, 05 Aug 2024 11:31:32 -0400
X-MC-Unique: aOEEkzq3OESPZ3G7_3-eBQ-1
Received: by mail-lf1-f70.google.com with SMTP id 2adb3069b0e04-52ebdbf8a7cso8458398e87.2
        for <linux-leds@vger.kernel.org>; Mon, 05 Aug 2024 08:31:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722871890; x=1723476690;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g6h3TlWGTE1+WlvLS85nPM+6D3cqZx0X5zf2j2PeJ3w=;
        b=rXF/dUQMXqEqZSmA1B8nIn0MEGiaRYM06TL06HahFLunXFoAOFuyLlExGwKq+oaUWf
         ZKZlSnFt8jeKd9mryYyJMpzljeSEOjMPzVXXySOvx+QO9dKSPmDBp+UdH0ajLqPXuh6g
         pqyqrYgBi/a3gubFqclfKGwSIBE7Au5ZFiD1DQqnPfaY36Bg8GXrlR3SgSLeujy/DKj3
         DSbSKptpSW0r4p4iBxaWi14QqHVriuIYx8taA+qr3h5dxhkbknxES5EdmPhJyAlovHWk
         bZiXtunPPMRsmDTBTLgTBwwzqOZ7Wflmg7TVEQFaNqYZ5MJKqzkEbGM5hkWNsQW+BCme
         S7tA==
X-Forwarded-Encrypted: i=1; AJvYcCVIUIdGMM1vkVdKXXk9UJisRX5rkaNPVlRVrJd6SZQ0jvF7KBO3khMEBSF5cr+0HILVwQkw8QKqMDSM5a2mlP5UgRqB6FIoh/1K1Q==
X-Gm-Message-State: AOJu0Yx64nXwVjDd+x4V/J9YJeKnztSJzDbD6gPkXwWTjZg0wiAD+zCH
	WF1dJDLBL0GtuiULFHc4h32EeJl+sRrOqp/GOvIx43izNql1Q8IVm367CHght+Z5m4BjSpS9q1c
	ba0i7Ich9/e/XlT9isJrMOzdIlD3B6jVpYRp7NDO+GBFxNylM0UzLghxHDBQ=
X-Received: by 2002:a05:6512:6c2:b0:52c:e1cd:39be with SMTP id 2adb3069b0e04-530bb366423mr8255144e87.8.1722871890548;
        Mon, 05 Aug 2024 08:31:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHxZ6chdviq5hamliBqyoWz+o5DUn/+8ZWwmK9zqpFBDa2VFpbqPj1SixEfhXHWy5MD7/IH3Q==
X-Received: by 2002:a05:6512:6c2:b0:52c:e1cd:39be with SMTP id 2adb3069b0e04-530bb366423mr8255104e87.8.1722871889911;
        Mon, 05 Aug 2024 08:31:29 -0700 (PDT)
Received: from [192.168.211.203] ([109.38.139.91])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5b83bf3b99dsm5009113a12.91.2024.08.05.08.31.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Aug 2024 08:31:29 -0700 (PDT)
Message-ID: <3dba67bc-fb22-41af-b9b9-3746c94cc1a1@redhat.com>
Date: Mon, 5 Aug 2024 17:31:27 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6] platform/x86: Add wmi driver for Casper Excalibur
 laptops
To: =?UTF-8?Q?Mustafa_Ek=C5=9Fi?= <mustafa.eskieksi@gmail.com>,
 ilpo.jarvinen@linux.intel.com
Cc: jdelvare@suse.com, linux@roeck-us.net, linux-kernel@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, linux-hwmon@vger.kernel.org,
 pavel@ucw.cz, lee@kernel.org, linux-leds@vger.kernel.org,
 rishitbansal0@gmail.com, bahaku@elrant.team,
 carlosmiguelferreira.2003@gmail.com, alviro.iskandar@gnuweeb.org,
 ammarfaizi2@gnuweeb.org, bedirhan_kurt22@erdogan.edu.tr
References: <20240713163521.21958-1-mustafa.eskieksi@gmail.com>
Content-Language: en-US
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240713163521.21958-1-mustafa.eskieksi@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 7/13/24 6:35 PM, Mustafa Ekşi wrote:
> Hi, I apologize for the delay. I recently saw Carlos's patch and your
> reviews, so I improved my driver according to it and made it ready for
> another version.
> 
> I didn't include the documentation for the new zoned keyboard backlight
> naming since Carlos is going to do that. However, I changed the naming of
> corner led because it isn't affected when other zones' brightness changes.
> And one last reason to not name it kbd_zoned_backlight is the fact that it
> isn't on the keyboard, it's on the two corners of the laptop. I'm still not
> sure how to name it, so I named it 'backlight'.
> Here's a photo of the laptop: https://imgur.com/a/JEqMiGL

Thanks for the photo very helpful.

I see these corner LEDs actually illuminate the table, not the laptop
itself, a bit like ambilight on Philips television sets. According
to wikipedia the vendor neutral not trademarked name for this is
bias-lighting:

https://en.wikipedia.org/wiki/Bias_lighting

So lets name it "casper:rgb:biaslight", which I admittedly is a bit
weird, but backlight for LEDs which are not actually a backlight for
displays or keys is confusing, so IMHO biaslight is best.

Regards,

Hans


p.s.

I'm also doing a review of the patch itself, but I likely will not finish
that today.






> 
> Mustafa Ekşi (1):
>   platform/x86: Add wmi driver for Casper Excalibur laptops
> 
>  MAINTAINERS                       |   6 +
>  drivers/platform/x86/Kconfig      |  14 +
>  drivers/platform/x86/Makefile     |   1 +
>  drivers/platform/x86/casper-wmi.c | 656 ++++++++++++++++++++++++++++++
>  4 files changed, 677 insertions(+)
>  create mode 100644 drivers/platform/x86/casper-wmi.c
> 


