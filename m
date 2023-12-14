Return-Path: <linux-leds+bounces-393-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4552D812F72
	for <lists+linux-leds@lfdr.de>; Thu, 14 Dec 2023 12:52:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DFE0D1F21925
	for <lists+linux-leds@lfdr.de>; Thu, 14 Dec 2023 11:52:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 464253F8EE;
	Thu, 14 Dec 2023 11:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KPVCy4Jo"
X-Original-To: linux-leds@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8154C183
	for <linux-leds@vger.kernel.org>; Thu, 14 Dec 2023 03:51:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1702554718;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aS/6XnBRIdVtrYOp4wLHjvS6oz2atR3YP9ICgOB3iGg=;
	b=KPVCy4JoG5Zi1WZBbThBmgzcPQP47UmD0HsBh8Zw2DvPE6uG4/xs7xsl7dqZFNk5jhDT82
	VABqJBLUkJ/+IfkcrnTPMMzSi4OF0r5m3kewmYedQPYPLPTQWxB2F7sB2GB0ICJ4FX+tzP
	FPhWCy8+gLVhKkZaPapN01EcI3pVxq0=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-140-Y6PcQ8c7PNGMTre1_WsKrQ-1; Thu, 14 Dec 2023 06:51:56 -0500
X-MC-Unique: Y6PcQ8c7PNGMTre1_WsKrQ-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-a1f9ab28654so219957166b.0
        for <linux-leds@vger.kernel.org>; Thu, 14 Dec 2023 03:51:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702554715; x=1703159515;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aS/6XnBRIdVtrYOp4wLHjvS6oz2atR3YP9ICgOB3iGg=;
        b=tPraCyktea3M2o/4KGlAZ/CDhRzRjZDKDFJCNGtUcNDH/iWsxT8CrYbm0aEeClWx+N
         G2NU2trI0itVLx/pdAUF8fN9Cv7P0CIzmD7RYINRbnPg32sJERRhqITxTrqpx1xGixQ4
         J7S6lsxa2zWq+FFhWniRgpuIDUPV1Ey5pj979ftETQzDoWHxQ/5Oo8uGkmWRZL7Koldt
         zCEsu9TTho+kRvcZhOsCcGx7ryWOacwljSKqH+1+ZF2hJ9L3dqFOIMDUfLTb2swfump/
         tbKqL4HFxlJgLRPeXoslaNemQHimQDYuaN07q3zn9zKY8QUvbqs90xw5GvNQCWug52ii
         w1oA==
X-Gm-Message-State: AOJu0Yxi8W0pg+eO//1VH7bS6oGuPxLEAcCNjtuXVNHw9c01d8Br4xAV
	rzzLLR7fE6O5QUG3xsdTkn/1wJPXnOsvYnRAhnKk7paUkx0Wnid+Arm+odpsLsOTRxTwSL3RkGT
	Pl1abgrjRhHTyYyrU/WELJw==
X-Received: by 2002:a17:906:10c7:b0:a1c:e980:3c3 with SMTP id v7-20020a17090610c700b00a1ce98003c3mr4066592ejv.28.1702554715593;
        Thu, 14 Dec 2023 03:51:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHFL7HyiSYut4T02F873+WBU/5sTp49/HyQIdZ0Go18ospT2UlJqi27N9WVGJWziHpX9DdSow==
X-Received: by 2002:a17:906:10c7:b0:a1c:e980:3c3 with SMTP id v7-20020a17090610c700b00a1ce98003c3mr4066575ejv.28.1702554715217;
        Thu, 14 Dec 2023 03:51:55 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id se13-20020a170907a38d00b00a1f78048f08sm8487004ejc.146.2023.12.14.03.51.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Dec 2023 03:51:54 -0800 (PST)
Message-ID: <c8950992-9b3e-4740-8ad6-f22d5a043fb1@redhat.com>
Date: Thu, 14 Dec 2023 12:51:53 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/11] devm-helpers: introduce devm_mutex_init
Content-Language: en-US, nl
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 George Stark <gnstark@salutedevices.com>,
 "andy.shevchenko@gmail.com" <andy.shevchenko@gmail.com>,
 "pavel@ucw.cz" <pavel@ucw.cz>, "lee@kernel.org" <lee@kernel.org>,
 "vadimp@nvidia.com" <vadimp@nvidia.com>,
 "mpe@ellerman.id.au" <mpe@ellerman.id.au>,
 "npiggin@gmail.com" <npiggin@gmail.com>,
 "mazziesaccount@gmail.com" <mazziesaccount@gmail.com>,
 "peterz@infradead.org" <peterz@infradead.org>,
 "mingo@redhat.com" <mingo@redhat.com>, "will@kernel.org" <will@kernel.org>,
 "longman@redhat.com" <longman@redhat.com>,
 "boqun.feng@gmail.com" <boqun.feng@gmail.com>,
 "nikitos.tr@gmail.com" <nikitos.tr@gmail.com>
Cc: "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "kernel@salutedevices.com" <kernel@salutedevices.com>
References: <20231213223020.2713164-1-gnstark@salutedevices.com>
 <20231213223020.2713164-4-gnstark@salutedevices.com>
 <80881d5d-3ae9-4580-84c1-f25b421cc518@csgroup.eu>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <80881d5d-3ae9-4580-84c1-f25b421cc518@csgroup.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 12/14/23 11:06, Christophe Leroy wrote:
> 
> 
> Le 13/12/2023 à 23:30, George Stark a écrit :
>> [Vous ne recevez pas souvent de courriers de gnstark@salutedevices.com. Découvrez pourquoi ceci est important à https://aka.ms/LearnAboutSenderIdentification ]
>>
>> Using of devm API leads to a certain order of releasing resources.
>> So all dependent resources which are not devm-wrapped should be deleted
>> with respect to devm-release order. Mutex is one of such objects that
>> often is bound to other resources and has no own devm wrapper.
>> Since mutex_destroy() actually does nothing in non-debug builds
>> frequently calling mutex_destroy() is just ignored which is safe for now
>> but wrong formally and can lead to a problem if mutex_destroy() is
>> extended so introduce devm_mutex_init().
> 
> So you abandonned the idea of using mutex.h ?
> 
> I can't see the point to spread mutex functions into devm-helpers.h
> 
> Adding a mutex_destroy macro for this purpose looks odd. And if someone 
> defines a new version of mutex_destroy() and forget the macro, it will 
> go undetected.
> 
> Usually macros of that type serve the purpose of defining a fallback 
> when the macro is not defined. In that case, when someone adds a new 
> version without defining the macro, it gets detected because if 
> conflicts with the fallback.
> But in your case it works the other way round, so I will just go undetected.
> 
> For me the best solution remains to use mutex.h and have 
> devm_mutex_init() defined or declared at the same place as mutex_destroy().

FWIW defining devm_mutex_init() in mutex.h is fine
with me and makes sense to me. I also agree that putting
it there would be better if that is acceptable for
the mutex maintainers.

devm-helpers.h is there for helpers which don't fit
in another place.

Regards,

Hans




> 
> 
>>
>> Signed-off-by: George Stark <gnstark@salutedevices.com>
>> ---
>>   include/linux/devm-helpers.h | 27 +++++++++++++++++++++++++++
>>   1 file changed, 27 insertions(+)
>>
>> diff --git a/include/linux/devm-helpers.h b/include/linux/devm-helpers.h
>> index 74891802200d..4043c3481d2e 100644
>> --- a/include/linux/devm-helpers.h
>> +++ b/include/linux/devm-helpers.h
>> @@ -24,6 +24,7 @@
>>    */
>>
>>   #include <linux/device.h>
>> +#include <linux/mutex.h>
>>   #include <linux/workqueue.h>
>>
>>   static inline void devm_delayed_work_drop(void *res)
>> @@ -76,4 +77,30 @@ static inline int devm_work_autocancel(struct device *dev,
>>          return devm_add_action(dev, devm_work_drop, w);
>>   }
>>
>> +#ifdef mutex_destroy
>> +static inline void devm_mutex_release(void *res)
>> +{
>> +       mutex_destroy(res);
>> +}
>> +#endif
>> +
>> +/**
>> + * devm_mutex_init - Resource-managed mutex initialization
>> + * @dev:       Device which lifetime mutex is bound to
>> + * @lock:      Pointer to a mutex
>> + *
>> + * Initialize mutex which is automatically destroyed when the driver is detached.
>> + *
>> + * Returns: 0 on success or a negative error code on failure.
>> + */
>> +static inline int devm_mutex_init(struct device *dev, struct mutex *lock)
>> +{
>> +       mutex_init(lock);
>> +#ifdef mutex_destroy
>> +       return devm_add_action_or_reset(dev, devm_mutex_release, lock);
>> +#else
>> +       return 0;
>> +#endif
>> +}
>> +
>>   #endif
>> --
>> 2.25.1
>>


