Return-Path: <linux-leds+bounces-391-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E25E0812B72
	for <lists+linux-leds@lfdr.de>; Thu, 14 Dec 2023 10:17:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 74C962816B7
	for <lists+linux-leds@lfdr.de>; Thu, 14 Dec 2023 09:17:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE24D2BCE3;
	Thu, 14 Dec 2023 09:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="e7RY885y"
X-Original-To: linux-leds@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA82BB7
	for <linux-leds@vger.kernel.org>; Thu, 14 Dec 2023 01:16:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1702545414;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aSXTliSLRPJwWKgirD+ynnpgvILXx2haTFF7t0rHIEw=;
	b=e7RY885yJP6B4JNrRfhD4NtUKfB2bJDSjKpe4WQ8kCzYmjrYGZ4yh+sU6tfYSJd4a0S2QQ
	Oq9hf8TRLyIogRUKrSd9R0oG+knoNIIaOwtPeyn2kLP3ALFcntTsc7PRagtCJQsD2Wimwc
	935FHK+lQyDEWc8XTKZImnv1SeG7OYw=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-570-d3Bjnj-TMhaQskVKv_nqBQ-1; Thu, 14 Dec 2023 04:16:50 -0500
X-MC-Unique: d3Bjnj-TMhaQskVKv_nqBQ-1
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-55223b294e0so724053a12.2
        for <linux-leds@vger.kernel.org>; Thu, 14 Dec 2023 01:16:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702545410; x=1703150210;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aSXTliSLRPJwWKgirD+ynnpgvILXx2haTFF7t0rHIEw=;
        b=n77laO7pTsP7ADNO1MBXB/vTyIo1CDfauyyzTunA2JOHY9I333i8UG9EHvMzSaR0DS
         mv6hR+LfuBUROXb92ufBVQjagcbUtUvL12BABrxCdn8pyaBx/8zmhBDMyYJcd9hTeqL+
         maaKz89R7GCa+UqPQZ1L0s4rlnTMvV+YmsdHz8Aw3OggWSVR5hG+yLV5FlabQnXirofq
         r4oYNX29PFhRHwEU4c0GPmWN0vKRLyGJE5xrbSIoiC3a6RYI0Hh2HnolyQeBYtbtGCp9
         fZyxmN4mgvcSAuZEQgP0X2TtNRhMAQKh1l87IJpR1KdKveoNAnGPW1525puKuJZz2Svo
         gPIA==
X-Gm-Message-State: AOJu0YwA6TLTQ4x1EL7QStO/ZG0zuv9jsaR2Tm/K2O5ShJ2lF2V5L4Y3
	VHB9co0T8MQmt4j7Cms7Nfvh66nX1QulaWFGnMBS6h/20UoVArUc+/1vb20ipgOyCPlg6qkB+Pe
	TPys0nlkZld5t5oQUxBXGgA==
X-Received: by 2002:a17:907:268e:b0:a1d:b7b9:3263 with SMTP id bn14-20020a170907268e00b00a1db7b93263mr2986287ejc.164.1702545409800;
        Thu, 14 Dec 2023 01:16:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFVQE/9DmmfQQ7JcgUanGLiAM3AoyRWgj4qusaFgzl7bO8ELi8lg6GnTyvH3KcEx592UQ4ElQ==
X-Received: by 2002:a17:907:268e:b0:a1d:b7b9:3263 with SMTP id bn14-20020a170907268e00b00a1db7b93263mr2986277ejc.164.1702545409439;
        Thu, 14 Dec 2023 01:16:49 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id tq14-20020a170907c50e00b00a1f83646eb6sm7701080ejc.149.2023.12.14.01.16.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Dec 2023 01:16:48 -0800 (PST)
Message-ID: <56e74264-6f98-4216-9f9a-e8f718375602@redhat.com>
Date: Thu, 14 Dec 2023 10:16:47 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/11] devm-helpers: introduce devm_mutex_init
To: Andy Shevchenko <andy.shevchenko@gmail.com>,
 George Stark <gnstark@salutedevices.com>
Cc: pavel@ucw.cz, lee@kernel.org, vadimp@nvidia.com, mpe@ellerman.id.au,
 npiggin@gmail.com, christophe.leroy@csgroup.eu, mazziesaccount@gmail.com,
 peterz@infradead.org, mingo@redhat.com, will@kernel.org, longman@redhat.com,
 boqun.feng@gmail.com, nikitos.tr@gmail.com, linux-leds@vger.kernel.org,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 kernel@salutedevices.com
References: <20231213223020.2713164-1-gnstark@salutedevices.com>
 <20231213223020.2713164-4-gnstark@salutedevices.com>
 <CAHp75Vc1zZFWB8PPrg8oeAKz9aHnQrrSjdGyGd8mWcmeZdJ9qA@mail.gmail.com>
 <CAHp75Vdxa5k-CLhL+PmK0iTPTNSpP77DA6ooWnxfViwSKiEOSw@mail.gmail.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75Vdxa5k-CLhL+PmK0iTPTNSpP77DA6ooWnxfViwSKiEOSw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 12/13/23 23:38, Andy Shevchenko wrote:
> On Thu, Dec 14, 2023 at 12:36 AM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
>> On Thu, Dec 14, 2023 at 12:30 AM George Stark <gnstark@salutedevices.com> wrote:
>>>
>>> Using of devm API leads to a certain order of releasing resources.
>>> So all dependent resources which are not devm-wrapped should be deleted
>>> with respect to devm-release order. Mutex is one of such objects that
>>> often is bound to other resources and has no own devm wrapper.
>>> Since mutex_destroy() actually does nothing in non-debug builds
>>> frequently calling mutex_destroy() is just ignored which is safe for now
>>> but wrong formally and can lead to a problem if mutex_destroy() is
>>> extended so introduce devm_mutex_init().
> 
> ...
> 
>>> +#ifdef mutex_destroy
>>> +static inline void devm_mutex_release(void *res)
>>> +{
>>> +       mutex_destroy(res);
>>> +}
>>> +#endif
>>> +
>>> +/**
>>> + * devm_mutex_init - Resource-managed mutex initialization
>>> + * @dev:       Device which lifetime mutex is bound to
>>> + * @lock:      Pointer to a mutex
>>> + *
>>> + * Initialize mutex which is automatically destroyed when the driver is detached.
>>> + *
>>> + * Returns: 0 on success or a negative error code on failure.
>>> + */
>>> +static inline int devm_mutex_init(struct device *dev, struct mutex *lock)
>>> +{
>>> +       mutex_init(lock);
>>> +#ifdef mutex_destroy
>>> +       return devm_add_action_or_reset(dev, devm_mutex_release, lock);
>>> +#else
>>> +       return 0;
>>> +#endif
>>> +}
>>
>> If this is going to be accepted, you may decrease the amount of ifdeffery.
>>
>> #ifdef ...
>> #else
>> #define devm_mutex_init(dev, lock)  mutex_init(lock)
> 
> More precisely ({ mutex_init(lock); 0; }) or as a static inline...

With a static inline we are pretty much back to the original
v3 patch.

I believe the best way to reduce the ifdef-ery is to remove
the #ifdef around devm_mutex_release() having unused
static inline ... functions in .h files is quite common,
so this one does not need a #ifdef around it and with
that removed we are down to just one #ifdef so just
removing the #ifdef around devm_mutex_release() seems
the best fix.

With that fixed you may add my:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

to the patch and I'm fine with this being routed
upstream through whatever tree is convenient.

Regards,

Hans




