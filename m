Return-Path: <linux-leds+bounces-1255-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF80287BDC1
	for <lists+linux-leds@lfdr.de>; Thu, 14 Mar 2024 14:33:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E0B321C20A31
	for <lists+linux-leds@lfdr.de>; Thu, 14 Mar 2024 13:33:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99DD759168;
	Thu, 14 Mar 2024 13:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EjzACeo/"
X-Original-To: linux-leds@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8551C433AD
	for <linux-leds@vger.kernel.org>; Thu, 14 Mar 2024 13:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710423180; cv=none; b=sdn/O8JZAI4iW44I1razYicotyEUXS7m6OWLJ4kJrLHmihDQVLMB0Hb7ot1Oyvjljr8l5D8IYyM1nUPybf7x6MJfKPHNIXmfIa73erbYxjkWY3/UrD5QxBcPvIBhHD1N627x22w1CXjKWJ514ka4y3iq4ccXzM6muQgysH4qiWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710423180; c=relaxed/simple;
	bh=rzVcn+UtgjN+mg3nAmtva02Br7Ga9tlrYTgPWQgIvSc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X36UEsjwnj6P0kzhboGuJ4NQoWNQ/C07mC5TQGV15prPylSSOU2i6co08PKa2hTwVk9vPb5ubzh9thOCMUw9kB3kH8IWZvaH8CPE8ZjBnaGoHFgTQcjHx4ccIyzx9dsipWWDp/fB0r+fhDafGpQt5+h2B/M9ES7IkfmIRQCke98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EjzACeo/; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1710423176;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7W6VhUuT1IYXtZxvs3JZ1xOnzXyykRUh8w8oxA4GA0I=;
	b=EjzACeo/vlRs8VBA30fqSX6r4g1HuUOeYdVPgp941pxBVQ8PQI/0gyard0J7dFiES4v8Mg
	kA9bslMtuDD4wLnuQwXqfa898IuiqOgb4QkzcNlCDB3a+uLFRPSn9iFZu33hX0gd4NPw2O
	bVjWDB1/D39ZSWZ9AW2uFsDBnQ12INs=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-468-06n3wqtbNFSas5BYEGQpiw-1; Thu,
 14 Mar 2024 09:32:54 -0400
X-MC-Unique: 06n3wqtbNFSas5BYEGQpiw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 725BC1C5454A;
	Thu, 14 Mar 2024 13:32:50 +0000 (UTC)
Received: from [10.22.16.244] (unknown [10.22.16.244])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 41D38492BC6;
	Thu, 14 Mar 2024 13:32:48 +0000 (UTC)
Message-ID: <9fe2eaef-0407-4a96-b603-e7f6579110b6@redhat.com>
Date: Thu, 14 Mar 2024 09:32:48 -0400
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/9] locking/mutex: introduce devm_mutex_init
Content-Language: en-US
To: George Stark <gnstark@salutedevices.com>, andy.shevchenko@gmail.com,
 pavel@ucw.cz, lee@kernel.org, vadimp@nvidia.com, mpe@ellerman.id.au,
 npiggin@gmail.com, christophe.leroy@csgroup.eu, hdegoede@redhat.com,
 mazziesaccount@gmail.com, peterz@infradead.org, mingo@redhat.com,
 will@kernel.org, boqun.feng@gmail.com, nikitos.tr@gmail.com,
 marek.behun@nic.cz, kabel@kernel.org
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, kernel@salutedevices.com
References: <20240314084531.1935545-1-gnstark@salutedevices.com>
 <20240314084531.1935545-2-gnstark@salutedevices.com>
From: Waiman Long <longman@redhat.com>
In-Reply-To: <20240314084531.1935545-2-gnstark@salutedevices.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.9


On 3/14/24 04:45, George Stark wrote:
> Using of devm API leads to a certain order of releasing resources.
> So all dependent resources which are not devm-wrapped should be deleted
> with respect to devm-release order. Mutex is one of such objects that
> often is bound to other resources and has no own devm wrapping.
> Since mutex_destroy() actually does nothing in non-debug builds
> frequently calling mutex_destroy() is just ignored which is safe for now
> but wrong formally and can lead to a problem if mutex_destroy() will be
> extended so introduce devm_mutex_init()
>
> Signed-off-by: George Stark <gnstark@salutedevices.com>
> Suggested by-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>   include/linux/mutex.h        | 27 +++++++++++++++++++++++++++
>   kernel/locking/mutex-debug.c | 11 +++++++++++
>   2 files changed, 38 insertions(+)
>
> diff --git a/include/linux/mutex.h b/include/linux/mutex.h
> index 67edc4ca2bee..f57e005ded24 100644
> --- a/include/linux/mutex.h
> +++ b/include/linux/mutex.h
> @@ -22,6 +22,8 @@
>   #include <linux/cleanup.h>
>   #include <linux/mutex_types.h>
>   
> +struct device;
> +
>   #ifdef CONFIG_DEBUG_LOCK_ALLOC
>   # define __DEP_MAP_MUTEX_INITIALIZER(lockname)			\
>   		, .dep_map = {					\
> @@ -117,6 +119,31 @@ do {							\
>   } while (0)
>   #endif /* CONFIG_PREEMPT_RT */
>   
> +#ifdef CONFIG_DEBUG_MUTEXES
> +
> +int __devm_mutex_init(struct device *dev, struct mutex *lock);
> +
> +#else
> +
> +static inline int __devm_mutex_init(struct device *dev, struct mutex *lock)
> +{
> +	/*
> +	 * When CONFIG_DEBUG_MUTEXES is off mutex_destroy is just a nop so
> +	 * no really need to register it in devm subsystem.
> +	 */
> +	return 0;
> +}
> +
> +#endif
> +
> +#define devm_mutex_init(dev, mutex)			\
> +({							\
> +	typeof(mutex) mutex_ = (mutex);			\
> +							\
> +	mutex_init(mutex_);				\
> +	__devm_mutex_init(dev, mutex_);			\
> +})
> +
>   /*
>    * See kernel/locking/mutex.c for detailed documentation of these APIs.
>    * Also see Documentation/locking/mutex-design.rst.
> diff --git a/kernel/locking/mutex-debug.c b/kernel/locking/mutex-debug.c
> index bc8abb8549d2..6aa77e3dc82e 100644
> --- a/kernel/locking/mutex-debug.c
> +++ b/kernel/locking/mutex-debug.c
> @@ -19,6 +19,7 @@
>   #include <linux/kallsyms.h>
>   #include <linux/interrupt.h>
>   #include <linux/debug_locks.h>
> +#include <linux/device.h>
>   
>   #include "mutex.h"
>   
> @@ -89,6 +90,16 @@ void debug_mutex_init(struct mutex *lock, const char *name,
>   	lock->magic = lock;
>   }
>   
> +static void devm_mutex_release(void *res)
> +{
> +	mutex_destroy(res);
> +}
> +
> +int __devm_mutex_init(struct device *dev, struct mutex *lock)
> +{
> +	return devm_add_action_or_reset(dev, devm_mutex_release, lock);
> +}
> +
>   /***
>    * mutex_destroy - mark a mutex unusable
>    * @lock: the mutex to be destroyed
Acked-by: Waiman Long <longman@redhat.com>


