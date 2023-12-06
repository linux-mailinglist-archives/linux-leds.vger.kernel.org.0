Return-Path: <linux-leds+bounces-282-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F9CA807901
	for <lists+linux-leds@lfdr.de>; Wed,  6 Dec 2023 20:55:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 84B781C20AA5
	for <lists+linux-leds@lfdr.de>; Wed,  6 Dec 2023 19:55:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66B7E47F76;
	Wed,  6 Dec 2023 19:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bDibllHq"
X-Original-To: linux-leds@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27474122
	for <linux-leds@vger.kernel.org>; Wed,  6 Dec 2023 11:55:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701892510;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WNtxqmUk2Bs7YzOVHZEViZ/O+MeQgcYuxCuXpozAJVI=;
	b=bDibllHqbyz2C8GS6TKn6SYDQdvQLtZh8eHOrqBVerBiK/gImvsEw7II5Je77oUXYw7VEW
	yizgE+87JE05Alh/DBRtlKoIxgrP7PNi0VyFcau4lFeI2dRFRWP/trHwdDFSFni8SFSbWo
	Br+DMI2dtqGUHGyhkzuo23PHfwqr3M0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-196-ztNA4EBuND6esHDN-3IOMQ-1; Wed, 06 Dec 2023 14:55:05 -0500
X-MC-Unique: ztNA4EBuND6esHDN-3IOMQ-1
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-40c032abab6so1137045e9.3
        for <linux-leds@vger.kernel.org>; Wed, 06 Dec 2023 11:55:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701892504; x=1702497304;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WNtxqmUk2Bs7YzOVHZEViZ/O+MeQgcYuxCuXpozAJVI=;
        b=USHTmqQO80ZMYwttfjOdPlz1eqhwWafyndXzyyabV/L4YLMqYp6TVTrJ8vDL/L3dv6
         vTlTUKC3VsGg1qB3m/nq3Ao03fHrw2gzTy5iP99dYDz36iLOqu78p5tXA3Kk2l1/JHAM
         F/KESFUaV6CpHSIowvRl8iCFUFqLeKxRqXMPmsgb3HWPMqZfTmVvxreJXJXe4mNdSnaX
         Hd99x8yI/Y0CFwEGa9YDavEG5pCtBEL7iO4xZQEwxDyUD0nDdCpKLOkiVc36isCuRSlu
         Q4QGOgwDSDQYl9DbJcnxtd2BLkL5L761VL/3WFlHAGu6bCVd5ne2DUmg5aRiicn0cE7o
         AWFQ==
X-Gm-Message-State: AOJu0Ywv94r8DlroseVaBpSr/ovbSLA5fUIHr33vDi2SDo/xUzahkVpQ
	IAodMJygV+WxvIKJOQmW6XijHxTPkBHfrSmnYPvgf4bPkAvBjQQsBBhomCVRymq7mf2xmOsF2X4
	43DSaI9vSS/u0NO4aI3ZkWw==
X-Received: by 2002:a1c:7909:0:b0:40c:c1a:cfac with SMTP id l9-20020a1c7909000000b0040c0c1acfacmr568911wme.158.1701892503951;
        Wed, 06 Dec 2023 11:55:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHnky6uLpyWb8bqYMMFni4xX3EDvcb9YnlGZqz8FxzcndfpsjoChNLslaWPUEOk6wlicauAww==
X-Received: by 2002:a1c:7909:0:b0:40c:c1a:cfac with SMTP id l9-20020a1c7909000000b0040c0c1acfacmr568903wme.158.1701892503589;
        Wed, 06 Dec 2023 11:55:03 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id r19-20020a1709067fd300b00a1cbb289a7csm341617ejs.183.2023.12.06.11.55.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Dec 2023 11:55:03 -0800 (PST)
Message-ID: <580ecff0-b335-4cc0-b928-a99fe73741ca@redhat.com>
Date: Wed, 6 Dec 2023 20:55:02 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/10] devm-helpers: introduce devm_mutex_init
Content-Language: en-US, nl
To: George Stark <gnstark@salutedevices.com>, pavel@ucw.cz, lee@kernel.org,
 vadimp@nvidia.com, mpe@ellerman.id.au, npiggin@gmail.com,
 christophe.leroy@csgroup.eu, mazziesaccount@gmail.com,
 andy.shevchenko@gmail.com, jic23@kernel.org, peterz@infradead.org,
 Waiman Long <longman@redhat.com>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, kernel@salutedevices.com
References: <20231204180603.470421-1-gnstark@salutedevices.com>
 <20231204180603.470421-2-gnstark@salutedevices.com>
 <81798fe5-f89e-482f-b0d0-674ccbfc3666@redhat.com>
 <29584eb6-fa10-4ce0-9fa3-0c409a582445@salutedevices.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <29584eb6-fa10-4ce0-9fa3-0c409a582445@salutedevices.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 12/6/23 19:58, George Stark wrote:
> 
> Hello Hans
> 
> Thanks for the review.
> 
> On 12/6/23 18:01, Hans de Goede wrote:
>> Hi George,
>>
>> On 12/4/23 19:05, George Stark wrote:
>>> Using of devm API leads to certain order of releasing resources.
>>> So all dependent resources which are not devm-wrapped should be deleted
>>> with respect to devm-release order. Mutex is one of such objects that
>>> often is bound to other resources and has no own devm wrapping.
>>> Since mutex_destroy() actually does nothing in non-debug builds
>>> frequently calling mutex_destroy() is just ignored which is safe for now
>>> but wrong formally and can lead to a problem if mutex_destroy() is
>>> extended so introduce devm_mutex_init().
>>>
>>> Signed-off-by: George Stark <gnstark@salutedevices.com>
>>> ---
>>>   include/linux/devm-helpers.h | 18 ++++++++++++++++++
>>>   1 file changed, 18 insertions(+)
>>>
>>> diff --git a/include/linux/devm-helpers.h b/include/linux/devm-helpers.h
>>> index 74891802200d..2f56e476776f 100644
>>> --- a/include/linux/devm-helpers.h
>>> +++ b/include/linux/devm-helpers.h
>>> @@ -76,4 +76,22 @@ static inline int devm_work_autocancel(struct device *dev,
>>>       return devm_add_action(dev, devm_work_drop, w);
>>>   }
>>>   +static inline void devm_mutex_release(void *res)
>>> +{
>>> +    mutex_destroy(res);
>>> +}
>>> +
>>> +/**
>>> + * devm_mutex_init - Resource-managed mutex initialization
>>> + * @dev:    Device which lifetime work is bound to
>>> + * @lock:    Pointer to a mutex
>>> + *
>>> + * Initialize mutex which is automatically destroyed when driver is detached.
>>> + */
>>> +static inline int devm_mutex_init(struct device *dev, struct mutex *lock)
>>> +{
>>> +    mutex_init(lock);
>>> +    return devm_add_action_or_reset(dev, devm_mutex_release, lock);
>>> +}
>>> +
>>>   #endif
>>
>> mutex_destroy() only actually does anything if CONFIG_DEBUG_MUTEXES
>> is set, otherwise it is an empty inline-stub.
>>
>> Adding a devres resource to the device just to call an empty inline
>> stub which is a no-op seems like a waste of resources. IMHO it
>> would be better to change this to:
>>
>> static inline int devm_mutex_init(struct device *dev, struct mutex *lock)
>> {
>>     mutex_init(lock);
>> #ifdef CONFIG_DEBUG_MUTEXES
>>     return devm_add_action_or_reset(dev, devm_mutex_release, lock);
>> #else
>>     return 0;
>> #endif
>> }
>>
>> To avoid the unnecessary devres allocation when
>> CONFIG_DEBUG_MUTEXES is not set.
> 
> Honestly saying I don't like unnecessary devres allocation either but the proposed approach has its own price:
> 
> 1) we'll have more than one place with branching if mutex_destroy is empty or not using  indirect condition. If suddenly mutex_destroy is extended for non-debug code (in upstream branch or e.g. by someone for local debug) than there'll be a problem.
> 
> 2) If mutex_destroy is empty or not depends on CONFIG_PREEMPT_RT option too. When CONFIG_PREEMPT_RT is on mutex_destroy is always empty.
> 
> As I see it only the mutex interface (mutex.h) has to say definitely if mutex_destroy must be called. Probably we could add some define to include/linux/mutex.h,like IS_MUTEX_DESTROY_REQUIRED and declare it near mutex_destroy definition itself.

That (a  IS_MUTEX_DESTROY_REQUIRED define) is an interesting idea. Lets see for v3 if the mutex maintainers will accept that and if not then I guess we will just need to live with the unnecessary devres allocation.

Regards,

Hans



