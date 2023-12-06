Return-Path: <linux-leds+bounces-283-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AAF4A8079F9
	for <lists+linux-leds@lfdr.de>; Wed,  6 Dec 2023 22:02:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 650DE28245A
	for <lists+linux-leds@lfdr.de>; Wed,  6 Dec 2023 21:02:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D19947786;
	Wed,  6 Dec 2023 21:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IdejeKfu"
X-Original-To: linux-leds@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D057D5C
	for <linux-leds@vger.kernel.org>; Wed,  6 Dec 2023 13:02:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701896533;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yHW20tuEOrmNp4P41P/HLfeGuZPZFZ5btUUMCBjAyAo=;
	b=IdejeKfuAmbLBWE992qTb78Bjo78t/JICzCeIt1W3H1eVbpj22YscQhKT6NjvOajmRzxfv
	BXb/1jMEWw0cv3XqZP5HoS4UU5EM+w+YiCN73qXvjjZzr5ifdXaOadiQGz7Cy3+HRrxPHF
	YUVoc7xkOxwguaRKYJKh/xrNIztQASs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-58-Tr0n8Aj5Or-lbiOYGgyS8w-1; Wed, 06 Dec 2023 16:02:07 -0500
X-MC-Unique: Tr0n8Aj5Or-lbiOYGgyS8w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A252F8353F2;
	Wed,  6 Dec 2023 21:02:04 +0000 (UTC)
Received: from [10.22.34.92] (unknown [10.22.34.92])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B2EEB111E404;
	Wed,  6 Dec 2023 21:02:02 +0000 (UTC)
Message-ID: <469f44fb-2371-4b3b-bc1c-d09ec35a5ec8@redhat.com>
Date: Wed, 6 Dec 2023 16:02:02 -0500
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/10] devm-helpers: introduce devm_mutex_init
Content-Language: en-US
To: Hans de Goede <hdegoede@redhat.com>,
 George Stark <gnstark@salutedevices.com>, pavel@ucw.cz, lee@kernel.org,
 vadimp@nvidia.com, mpe@ellerman.id.au, npiggin@gmail.com,
 christophe.leroy@csgroup.eu, mazziesaccount@gmail.com,
 andy.shevchenko@gmail.com, jic23@kernel.org, peterz@infradead.org
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, kernel@salutedevices.com
References: <20231204180603.470421-1-gnstark@salutedevices.com>
 <20231204180603.470421-2-gnstark@salutedevices.com>
 <81798fe5-f89e-482f-b0d0-674ccbfc3666@redhat.com>
 <29584eb6-fa10-4ce0-9fa3-0c409a582445@salutedevices.com>
 <580ecff0-b335-4cc0-b928-a99fe73741ca@redhat.com>
From: Waiman Long <longman@redhat.com>
In-Reply-To: <580ecff0-b335-4cc0-b928-a99fe73741ca@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.3

On 12/6/23 14:55, Hans de Goede wrote:
> Hi,
>
> On 12/6/23 19:58, George Stark wrote:
>> Hello Hans
>>
>> Thanks for the review.
>>
>> On 12/6/23 18:01, Hans de Goede wrote:
>>> Hi George,
>>>
>>> On 12/4/23 19:05, George Stark wrote:
>>>> Using of devm API leads to certain order of releasing resources.
>>>> So all dependent resources which are not devm-wrapped should be deleted
>>>> with respect to devm-release order. Mutex is one of such objects that
>>>> often is bound to other resources and has no own devm wrapping.
>>>> Since mutex_destroy() actually does nothing in non-debug builds
>>>> frequently calling mutex_destroy() is just ignored which is safe for now
>>>> but wrong formally and can lead to a problem if mutex_destroy() is
>>>> extended so introduce devm_mutex_init().
>>>>
>>>> Signed-off-by: George Stark <gnstark@salutedevices.com>
>>>> ---
>>>>    include/linux/devm-helpers.h | 18 ++++++++++++++++++
>>>>    1 file changed, 18 insertions(+)
>>>>
>>>> diff --git a/include/linux/devm-helpers.h b/include/linux/devm-helpers.h
>>>> index 74891802200d..2f56e476776f 100644
>>>> --- a/include/linux/devm-helpers.h
>>>> +++ b/include/linux/devm-helpers.h
>>>> @@ -76,4 +76,22 @@ static inline int devm_work_autocancel(struct device *dev,
>>>>        return devm_add_action(dev, devm_work_drop, w);
>>>>    }
>>>>    +static inline void devm_mutex_release(void *res)
>>>> +{
>>>> +    mutex_destroy(res);
>>>> +}
>>>> +
>>>> +/**
>>>> + * devm_mutex_init - Resource-managed mutex initialization
>>>> + * @dev:    Device which lifetime work is bound to
>>>> + * @lock:    Pointer to a mutex
>>>> + *
>>>> + * Initialize mutex which is automatically destroyed when driver is detached.
>>>> + */
>>>> +static inline int devm_mutex_init(struct device *dev, struct mutex *lock)
>>>> +{
>>>> +    mutex_init(lock);
>>>> +    return devm_add_action_or_reset(dev, devm_mutex_release, lock);
>>>> +}
>>>> +
>>>>    #endif
>>> mutex_destroy() only actually does anything if CONFIG_DEBUG_MUTEXES
>>> is set, otherwise it is an empty inline-stub.
>>>
>>> Adding a devres resource to the device just to call an empty inline
>>> stub which is a no-op seems like a waste of resources. IMHO it
>>> would be better to change this to:
>>>
>>> static inline int devm_mutex_init(struct device *dev, struct mutex *lock)
>>> {
>>>      mutex_init(lock);
>>> #ifdef CONFIG_DEBUG_MUTEXES
>>>      return devm_add_action_or_reset(dev, devm_mutex_release, lock);
>>> #else
>>>      return 0;
>>> #endif
>>> }
>>>
>>> To avoid the unnecessary devres allocation when
>>> CONFIG_DEBUG_MUTEXES is not set.
>> Honestly saying I don't like unnecessary devres allocation either but the proposed approach has its own price:
>>
>> 1) we'll have more than one place with branching if mutex_destroy is empty or not using  indirect condition. If suddenly mutex_destroy is extended for non-debug code (in upstream branch or e.g. by someone for local debug) than there'll be a problem.
>>
>> 2) If mutex_destroy is empty or not depends on CONFIG_PREEMPT_RT option too. When CONFIG_PREEMPT_RT is on mutex_destroy is always empty.
>>
>> As I see it only the mutex interface (mutex.h) has to say definitely if mutex_destroy must be called. Probably we could add some define to include/linux/mutex.h,like IS_MUTEX_DESTROY_REQUIRED and declare it near mutex_destroy definition itself.
> That (a  IS_MUTEX_DESTROY_REQUIRED define) is an interesting idea. Lets see for v3 if the mutex maintainers will accept that and if not then I guess we will just need to live with the unnecessary devres allocation.

The purpose of calling mutex_destroy() is to mark a mutex as being 
destroyed so that any subsequent call to mutex_lock/unlock will cause a 
warning to be printed when CONFIG_DEBUG_MUTEXES is defined. I would not 
say that mutex_destroy() is required. Rather it is a nice to have for 
catching programming error.

Cheers,
Longman


