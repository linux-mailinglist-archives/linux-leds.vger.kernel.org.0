Return-Path: <linux-leds+bounces-1410-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EDB78968C3
	for <lists+linux-leds@lfdr.de>; Wed,  3 Apr 2024 10:33:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A3D231F2B0BC
	for <lists+linux-leds@lfdr.de>; Wed,  3 Apr 2024 08:33:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FE8554F8C;
	Wed,  3 Apr 2024 08:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DjkhvEZh"
X-Original-To: linux-leds@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A030D26ACF
	for <linux-leds@vger.kernel.org>; Wed,  3 Apr 2024 08:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712133187; cv=none; b=KvUr7pWIvCq3yzGoHPfwehYvwPU7bvVAZTNpDU1HOPkYP5JqeEF4h814PPQpn+Q2r6jKRFUeO5Jxtq0cecEv6VK/Hk9Jsu2ztLLlnoGFiFORzt3UWl0ztEYO96qtRL2T8ntcZRP1oopZkvHgnq414qbspkwxEw5V/t5848u5NkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712133187; c=relaxed/simple;
	bh=2Z+Ejko7FofGkIpI4wJ7ZPsjyB8mCnSvFfx+1YEfT4M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VQksMHsHdpOzgSrSxtbTdQtEiQB7zX/aGvl0mTShDR78YrzFkJ4uI5xAOleN/8lrJ+/SeDvHm4zD2yVo7MIEc4bwHvq0DCsqvluSCbrP5NmlL3wJAtm1QPi9+tNDfeSlejyHx9C8XUIEzsiA/F95TqbLdhNtI8oWj4JzRqGY8nE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DjkhvEZh; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712133184;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9hBwVccZBg0Fl5p97DfphA9YXGRXtnSdOSqA1Wworgs=;
	b=DjkhvEZhGrkB5nVC4eboxXbfrk7ypn5nOcfrV/avO+aoR3dtges1V1zXe5+oJrqet3vPk6
	nbkt4GCl2dJqyxeMZqdPsjU1LY6UD54jWUO1gp90i8v21B8mStM24d/RNdKXsHVare1EJj
	+QSoG1hQtpr1XbQtLWfzuSIc0XB5zOg=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-444-nnXCb_cPPgmyHiYb422e8w-1; Wed, 03 Apr 2024 04:33:03 -0400
X-MC-Unique: nnXCb_cPPgmyHiYb422e8w-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-a4d8e5d6722so430835766b.0
        for <linux-leds@vger.kernel.org>; Wed, 03 Apr 2024 01:33:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712133182; x=1712737982;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9hBwVccZBg0Fl5p97DfphA9YXGRXtnSdOSqA1Wworgs=;
        b=I9Ao6UNl+sqS1I2T3H6ebKwbEG9NE7OFEPp9xrp+t6SxfUvARN7Ci5Im7lY89Gllr9
         QeF6915z1tAQbTBIOd5Pgtd8RV+RRLEv749SiHe5bV5Bkq77i09C8kfMZNogavezChzK
         IF2DkrKfMfWAwz8cJXVlKjEZxkoZMF8/ahHiahJZvW3VFws6GUjOrJGHn0FbWEGXHV7Q
         GeSQ4E4qZYZitdrm2CjKEvPpdJpuaAvteqzr/n3pVfZ+soQU2aCg4BoVst2ImGP9N6CR
         3tIRko6rcKKAADaLRgSiTVUkVt48wu0v0ZusogV6gNBgOKPPA6hkTH4vVdsl14NIi5P4
         LMcA==
X-Forwarded-Encrypted: i=1; AJvYcCUeG2fjjX9/rwc8hKVYkvredcf+DTlPit9MB3p6EqK7Q/VcaSUkh9bYUHLUsk6Fj40jsX4z9KPlptcLzpOZhpSDqpnxOF6+eD3zyw==
X-Gm-Message-State: AOJu0YzXrUHpgbO7BlJbk4wigu+j3IcPyxFdH9HOPWuBYg2InGoZ3O2n
	da/UJSBCjEgClmWKl0gmPl1mtFuKQU36alovEYhRj1M0pon9E2HadkZnaODGXh7ASu//a+AYyDo
	UKVGZJT7RTLgxW7igXI6OjHlB+Pt41Hs+YawxMxeUlm4nLxzXeVwUbWVt/wg=
X-Received: by 2002:a17:906:1157:b0:a4e:6414:5afd with SMTP id i23-20020a170906115700b00a4e64145afdmr5759446eja.52.1712133181943;
        Wed, 03 Apr 2024 01:33:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFUYrX1YOrnmR10vdbq+ufbRk4BHlYYJBSP3DuH1BuQ6YlKfpjx3idfoB6rTEHjFrNn1Q5mmA==
X-Received: by 2002:a17:906:1157:b0:a4e:6414:5afd with SMTP id i23-20020a170906115700b00a4e64145afdmr5759429eja.52.1712133181648;
        Wed, 03 Apr 2024 01:33:01 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id jx24-20020a170906ca5800b00a47152e6d10sm7426027ejb.134.2024.04.03.01.33.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Apr 2024 01:33:01 -0700 (PDT)
Message-ID: <283b5056-29df-486f-8a4a-5271af8a5b8c@redhat.com>
Date: Wed, 3 Apr 2024 10:33:00 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: leds: add LED_FUNCTION_FNLOCK
To: Gergo Koteles <soyer@irl.hu>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Ike Panhc <ike.pan@canonical.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-leds@vger.kernel.org, devicetree@vger.kernel.org
References: <cover.1712063200.git.soyer@irl.hu>
 <8ac95e85a53dc0b8cce1e27fc1cab6d19221543b.1712063200.git.soyer@irl.hu>
 <6b47886e-09ac-4cb9-ab53-ca64f5320005@linaro.org>
 <5864594aa47ecfeb23d5d05a3afc02393f84b44e.camel@irl.hu>
 <a19688d3-5402-41c0-b10a-131cefed5b91@linaro.org>
 <2710283677cf12ca6b826565ec39652f560a43d8.camel@irl.hu>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <2710283677cf12ca6b826565ec39652f560a43d8.camel@irl.hu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi George,

On 4/2/24 8:50 PM, Gergo Koteles wrote:
> Hi Krzysztof,
> 
> On Tue, 2024-04-02 at 20:08 +0200, Krzysztof Kozlowski wrote:
>> On 02/04/2024 16:36, Gergo Koteles wrote:
>>> Hi Krzysztof,
>>>
>>> On Tue, 2024-04-02 at 15:55 +0200, Krzysztof Kozlowski wrote:
>>>>
>>>> Do we really need to define all these possible LED functions? Please
>>>> link to DTS user for this.
>>>>
>>>
>>> I think for userspace it's easier to support an LED with a specified
>>> name than to use various sysfs attributes. LED devices are easy to find
>>> because they available are in the /sys/class/leds/ directory.
>>> So I think it's a good thing to define LED names somewhere.
>>
>> You did not add anything for user-space, but DT bindings. We do not keep
>> here anything for user-space.
>>
> 
> The LED_FUNCTION_KBD_BACKLIGHT confused me. Ok, this shouldn't be here,
> I will remove it from v2.

I don't believe that is necessary, see my direct reply to Krzysztof first
email about this. According to Documentation/leds/leds-class.rst
you did exactly the right thing.

Also thank you for your interesting contribution. I have only briefly
looked over your other 2 patches, but I like the concept.

I'll hopefully have time to do a full review coming Monday.

Regards,

Hans



