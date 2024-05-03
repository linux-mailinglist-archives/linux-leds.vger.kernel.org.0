Return-Path: <linux-leds+bounces-1575-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 337468BAE44
	for <lists+linux-leds@lfdr.de>; Fri,  3 May 2024 15:58:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5EF531C20930
	for <lists+linux-leds@lfdr.de>; Fri,  3 May 2024 13:58:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDCE615442B;
	Fri,  3 May 2024 13:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="duG1jnAM"
X-Original-To: linux-leds@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F694154435
	for <linux-leds@vger.kernel.org>; Fri,  3 May 2024 13:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714744661; cv=none; b=VfK4qY3yOlB5nr5OQcNMEH8KuViSFHU4Oa7KvHNBQfW31AZa8iaS3KzX5jgjjlPFYrgzkXlWtRm6zESyFfJolsrTY30xhPENIZgt7beBwH2hLo669mAQzDid6+UHnd2eUYvNWFSr+wm+UkRy1o+o2UP+K+JKDsHmyF8s0HBvzbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714744661; c=relaxed/simple;
	bh=c1otjCUr6/46Yb0CCCZ/Kv82KCQ+4RRahotV1mpW2bc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XjKNR6nSaE3Cu7saeoxZLBUgU8ls26lOPYK/ceE7TSh4tkQRN1MAVrF5z4duS+5FTLGz6GvWgzv2PEX55k+gvQl2PZNbdXBsIXimblOzbvhkYVG4RnP2s/l1zUP9n8Yw5Y2o2eLH9Ymv/F4242OcW+G9+qUJH0Bx1X84q2nkYwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=duG1jnAM; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1714744658;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oHAnt3kV8i2lFHc2XkUBb5R3EM8KnMK0NS1IZLqYFQc=;
	b=duG1jnAMVf39hglhk9KlIMPRjEbLL7NgUbrN3pivd3CJ752XICmp42btLoInBp20TzIB5Z
	cyz8Gl5ihvvpErRmVOFJ9AdRstDFZ8wp5ZmOcHJmUZETlC9aOcvBlqIwc0UTnLspl7WBl5
	sobTa+NwqijGkforNPUwItCD0xr8Wg4=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-103-8ZFbrrXnNziaoV-MLzV16w-1; Fri, 03 May 2024 09:57:37 -0400
X-MC-Unique: 8ZFbrrXnNziaoV-MLzV16w-1
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-5684c1abc7fso1086766a12.3
        for <linux-leds@vger.kernel.org>; Fri, 03 May 2024 06:57:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714744656; x=1715349456;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oHAnt3kV8i2lFHc2XkUBb5R3EM8KnMK0NS1IZLqYFQc=;
        b=kB6jTCchgCpxdsZfZ05eC7zYdVht8P/02qx9rjc0HQ+dUYhuo4wvNQo2SPHdcHhNL3
         Cn5I7Z/UWg2Vgsz79zPatig7i5BtujlxR8vzIMvtBzpRhTE29VXk+d03leP33Cpk8iTo
         N6KqQdTY3KqVYzWBj8YqRYWr/1U0EX2aBSpvg4Mg0IcauXeYo3uOJRejugmZLGzyIDep
         ixq1jgRoGy9/1XdxX3ksj5HmJsDcuL1PMIOASlskCr0Q1+OSLMx0feiURuxZ8Jj/z7MH
         UGTd9al2LMs8kODrzcdnNk29FwAg5OBGXdjy6gcNWA8IuBjac0tkGVlWXDdSCkrTNLbD
         Xtng==
X-Forwarded-Encrypted: i=1; AJvYcCUofTKbvIbIQn+Xnm2WmLIZE+7PnxjwLq7J1TwDIrc8hCFqSCc8ko0cC5I/SZ26pp4JSLtg6OAOEbbsXpnBb+5wNjhrn57HLflhBw==
X-Gm-Message-State: AOJu0Yw0WhvVavszNOjRQpMNA/1oUx7MWp+5Wf40OWiQ8njXK8KUy1bH
	47erAxlLHGbBYpkTNgzU1uVis4w8KaJE5WFOV9ceXSOQl2SZKXF7kvWNHYMziRhOStZWkNLH3O/
	9TlnJqFqV/IyT5ko82tTKJ8/u2tdn1cGYEv3EV4ICOm93A62u6cg1bIh5cuE=
X-Received: by 2002:a50:cd93:0:b0:572:4e6b:c31 with SMTP id p19-20020a50cd93000000b005724e6b0c31mr1712645edi.34.1714744656629;
        Fri, 03 May 2024 06:57:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEAsh5w9dz9XrIXDm8tg48qsQqC1SjQyRh4dvyIngfpi43NIJJn8TFScktjkZPnUKAHnLhEpw==
X-Received: by 2002:a50:cd93:0:b0:572:4e6b:c31 with SMTP id p19-20020a50cd93000000b005724e6b0c31mr1712637edi.34.1714744656304;
        Fri, 03 May 2024 06:57:36 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id p4-20020a056402074400b00572b2ad900fsm1684546edy.46.2024.05.03.06.57.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 May 2024 06:57:35 -0700 (PDT)
Message-ID: <10b4ac92-dd72-445a-9727-f6e40c68b12a@redhat.com>
Date: Fri, 3 May 2024 15:57:34 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 3/7] leds: rgb: leds-ktd202x: Initialize mutex earlier
To: Lee Jones <lee@kernel.org>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>, Pavel Machek <pavel@ucw.cz>,
 Kate Hsuan <hpa@redhat.com>, Sebastian Reichel <sre@kernel.org>,
 platform-driver-x86@vger.kernel.org, =?UTF-8?Q?Andr=C3=A9_Apitzsch?=
 <git@apitzsch.eu>, linux-leds@vger.kernel.org, linux-pm@vger.kernel.org
References: <20240502211425.8678-1-hdegoede@redhat.com>
 <20240502211425.8678-4-hdegoede@redhat.com>
 <CAHp75VdSHGXuvGtPBuQSeDLTg0FjPNStcgG3-p07cfVLi_D_YA@mail.gmail.com>
 <88d18069-3327-463e-afa6-b80645dfbb7f@redhat.com>
 <20240503070322.GA1227636@google.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240503070322.GA1227636@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 5/3/24 9:03 AM, Lee Jones wrote:
> On Fri, 03 May 2024, Hans de Goede wrote:
> 
>> Hi,
>>
>> On 5/3/24 5:43 AM, Andy Shevchenko wrote:
>>> On Fri, May 3, 2024 at 12:14 AM Hans de Goede <hdegoede@redhat.com> wrote:
>>>>
>>>> The mutex must be initialized before the LED class device is registered
>>>> otherwise there is a race where it may get used before it is initialized:
>>>>
>>>>  DEBUG_LOCKS_WARN_ON(lock->magic != lock)
>>>>  WARNING: CPU: 2 PID: 2045 at kernel/locking/mutex.c:587 __mutex_lock
>>>>  ...
>>>>  RIP: 0010:__mutex_lock+0x7db/0xc10
>>>>  ...
>>>>  set_brightness_delayed_set_brightness.part.0+0x17/0x60
>>>>  set_brightness_delayed+0xf1/0x100
>>>>  process_one_work+0x222/0x5a0
>>>
>>> ...
>>>
>>>> +       mutex_init(&chip->mutex);
>>>
>>> devm_mutex_init() ?
>>
>> That is not in Torvald's tree yet.
> 
> Neither is this.  :)
> 
> Since we're nearly at -rc7, I think it's safe to say you have time.

Ok I'll prepare a v9 with this addressed and Andy's Reviewed-by
added.

Regards,

Hans




