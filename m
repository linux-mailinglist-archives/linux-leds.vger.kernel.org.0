Return-Path: <linux-leds+bounces-1185-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C9A6D8750A6
	for <lists+linux-leds@lfdr.de>; Thu,  7 Mar 2024 14:46:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EC0BC1C22CC4
	for <lists+linux-leds@lfdr.de>; Thu,  7 Mar 2024 13:46:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25B2C12EBCA;
	Thu,  7 Mar 2024 13:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="D5YqfRFS"
X-Original-To: linux-leds@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3487139574
	for <linux-leds@vger.kernel.org>; Thu,  7 Mar 2024 13:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709818796; cv=none; b=YBOVGzh6AbPQYyYkI2RJqAejBeI5MFgs/CCsxSdlLe4JcmBprJIYLRAk3+pxyWo3oAyvvLL1etHOhW9HzByImdxSesUvon0bptQNsJxDHpWNoPS1D31Q3NO7NdVw8DRxYNAXZhWI6aRjP91tQkfhRRsJodDmlbxm9j+pBNmVMF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709818796; c=relaxed/simple;
	bh=lNA1D4PxgTE+BH5Xs2JJugSoGU2banGwahprvTGRSvs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tqC1AzmzXBtodz7hxXIUND+BkdIpm0PBy4Pej+MACOYc5e190/5C+oht5sA87qFClyPA0W7do294sX2JmDeYSFtmJw9JPLdU/8G4ekPq/uGLZ7Cp9uz5pfv9KA4Od4auIKS+y6CG/ekdNlxIwEhZWDXxU1UFB/Ps+PYuYwThgQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=D5YqfRFS; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709818793;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=112pI+gt3JMCgKzIzUNSwArv3bdYT5A5xYg70+5/nCY=;
	b=D5YqfRFSQihjhvSRKnbpjEPDtCbp51UkbW9vQHYe+0aMeRoo2MIS7gOXHmxqw81/lmGg+l
	BrJwUlXAOY31UUyvD+t7WYDoMonOv05MfOteaHrq+YMTugJWboSQ9rRN7ncq1xpagdEdYy
	Ak+t2Zd1gfQaDS0fCQpD33zpXRnfRAA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-286-PhGOQ0k9Pra5YEfCRg8aGQ-1; Thu, 07 Mar 2024 08:39:50 -0500
X-MC-Unique: PhGOQ0k9Pra5YEfCRg8aGQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1EA19101A523;
	Thu,  7 Mar 2024 13:39:49 +0000 (UTC)
Received: from [10.22.17.9] (unknown [10.22.17.9])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5BB371C0653F;
	Thu,  7 Mar 2024 13:39:47 +0000 (UTC)
Message-ID: <3d95ab40-2df5-4988-87be-568a628a0561@redhat.com>
Date: Thu, 7 Mar 2024 08:39:46 -0500
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 02/10] locking/mutex: introduce devm_mutex_init
Content-Language: en-US
To: =?UTF-8?Q?Marek_Beh=C3=BAn?= <marek.behun@nic.cz>,
 George Stark <gnstark@salutedevices.com>
Cc: andy.shevchenko@gmail.com, pavel@ucw.cz, lee@kernel.org,
 vadimp@nvidia.com, mpe@ellerman.id.au, npiggin@gmail.com,
 christophe.leroy@csgroup.eu, hdegoede@redhat.com, mazziesaccount@gmail.com,
 peterz@infradead.org, mingo@redhat.com, will@kernel.org,
 boqun.feng@gmail.com, nikitos.tr@gmail.com, kabel@kernel.org,
 linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, kernel@salutedevices.com
References: <20240307024034.1548605-1-gnstark@salutedevices.com>
 <20240307024034.1548605-3-gnstark@salutedevices.com>
 <20240307095639.b6utkbzr36liuu3p@kandell>
From: Waiman Long <longman@redhat.com>
In-Reply-To: <20240307095639.b6utkbzr36liuu3p@kandell>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7

On 3/7/24 04:56, Marek Behún wrote:
> On Thu, Mar 07, 2024 at 05:40:26AM +0300, George Stark wrote:
>> Using of devm API leads to a certain order of releasing resources.
>> So all dependent resources which are not devm-wrapped should be deleted
>> with respect to devm-release order. Mutex is one of such objects that
>> often is bound to other resources and has no own devm wrapping.
>> Since mutex_destroy() actually does nothing in non-debug builds
>> frequently calling mutex_destroy() is just ignored which is safe for now
>> but wrong formally and can lead to a problem if mutex_destroy() will be
>> extended so introduce devm_mutex_init()
>>
>> Signed-off-by: George Stark <gnstark@salutedevices.com>
>> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>> ---
>>   Hello Christophe. Hope you don't mind I put you SoB tag because you helped alot
>>   to make this patch happen.
>>
>>   include/linux/mutex.h        | 13 +++++++++++++
>>   kernel/locking/mutex-debug.c | 22 ++++++++++++++++++++++
>>   2 files changed, 35 insertions(+)
>>
>> diff --git a/include/linux/mutex.h b/include/linux/mutex.h
>> index f7611c092db7..9bcf72cb941a 100644
>> --- a/include/linux/mutex.h
>> +++ b/include/linux/mutex.h
>> @@ -22,6 +22,8 @@
>>   #include <linux/cleanup.h>
>>   #include <linux/mutex_types.h>
>>
>> +struct device;
>> +
>>   #ifdef CONFIG_DEBUG_LOCK_ALLOC
>>   # define __DEP_MAP_MUTEX_INITIALIZER(lockname)			\
>>   		, .dep_map = {					\
>> @@ -115,10 +117,21 @@ do {							\
>>
>>   #ifdef CONFIG_DEBUG_MUTEXES
>>
>> +int devm_mutex_init(struct device *dev, struct mutex *lock);
>>   void mutex_destroy(struct mutex *lock);
>>
>>   #else
>>
>> +static inline int devm_mutex_init(struct device *dev, struct mutex *lock)
>> +{
>> +	/*
>> +	 * since mutex_destroy is nop actually there's no need to register it
>> +	 * in devm subsystem.
>> +	 */
>> +	mutex_init(lock);
>> +	return 0;
>> +}
>> +
>>   static inline void mutex_destroy(struct mutex *lock) {}
>>
>>   #endif
>> diff --git a/kernel/locking/mutex-debug.c b/kernel/locking/mutex-debug.c
>> index bc8abb8549d2..c9efab1a8026 100644
>> --- a/kernel/locking/mutex-debug.c
>> +++ b/kernel/locking/mutex-debug.c
>> @@ -19,6 +19,7 @@
>>   #include <linux/kallsyms.h>
>>   #include <linux/interrupt.h>
>>   #include <linux/debug_locks.h>
>> +#include <linux/device.h>
>>
>>   #include "mutex.h"
>>
>> @@ -104,3 +105,24 @@ void mutex_destroy(struct mutex *lock)
>>   }
>>
>>   EXPORT_SYMBOL_GPL(mutex_destroy);
>> +
>> +static void devm_mutex_release(void *res)
>> +{
>> +	mutex_destroy(res);
>> +}
>> +
>> +/**
>> + * devm_mutex_init - Resource-managed mutex initialization
>> + * @dev:	Device which lifetime mutex is bound to
>> + * @lock:	Pointer to a mutex
>> + *
>> + * Initialize mutex which is automatically destroyed when the driver is detached.
>> + *
>> + * Returns: 0 on success or a negative error code on failure.
>> + */
>> +int devm_mutex_init(struct device *dev, struct mutex *lock)
>> +{
>> +	mutex_init(lock);
>> +	return devm_add_action_or_reset(dev, devm_mutex_release, lock);
>> +}
>> +EXPORT_SYMBOL_GPL(devm_mutex_init);
> Hi George,
>
> look at
> https://lore.kernel.org/lkml/7013bf9e-2663-4613-ae61-61872e81355b@redhat.com/
> where Matthew and Hans explain that devm_mutex_init needs to be a macro
> because of the static lockdep key.
>
> so this should be something like:
>
> static inline int __devm_mutex_init(struct device *dev, struct mutex *mutex,
> 				    const char *name,
> 				    struct lock_class_key *key)
> {
> 	__mutex_init(mutex, name, key);
> 	return devm_add_action_or_reset(dev, devm_mutex_release, mutex);
> }
>
> #define devm_mutex_init(dev, mutex)				\
> do {								\
> 	static struct lock_class_key __key;			\
> 								\
> 	__devm_mutex_init(dev, (mutex), #mutex, &__key);	\
> } while (0);
>
>
> Marek

Making devm_mutex_init() a function will make all the devm_mutex share 
the same lockdep key. Making it a macro will make each caller of 
devm_mutex_init() have a distinct lockdep key. It all depends on whether 
all the devm_mutexes have the same lock usage pattern or not and whether 
it is possible for one devm_mutex to be nested inside another. So either 
way can be fine depending on the mutex usage pattern. My suggestion is 
to use a function, if possible, unless it will cause a false positive 
lockdep splat as there is a limit on the maximum # of lockdep keys that 
can be used.

Cheers,
Longman


