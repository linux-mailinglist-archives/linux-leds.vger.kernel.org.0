Return-Path: <linux-leds+bounces-1221-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EE4B878C22
	for <lists+linux-leds@lfdr.de>; Tue, 12 Mar 2024 02:10:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 11535282C01
	for <lists+linux-leds@lfdr.de>; Tue, 12 Mar 2024 01:10:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4548E7E6;
	Tue, 12 Mar 2024 01:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TWCFsz5U"
X-Original-To: linux-leds@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 709BA65F
	for <linux-leds@vger.kernel.org>; Tue, 12 Mar 2024 01:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710205826; cv=none; b=ugOJW7iqt0+kpEH589/NaZoyrQMj2nOHKp7Pixt9nv32PbyUy94fViinb0JBhvkjRoRZbWdAbrKwUrjOdnwvJheZSdegnJ2TuOWR/5zW+B2JS2EaB/ucupfq8Li5PPUY0SqnYgS7ocKxfwBaLxsAGwzzGnEQlzbT/w55yccIivI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710205826; c=relaxed/simple;
	bh=2IKZoBxo6m2Ju8KnAoZJ5Oa2cVxc6yQ+NNpRpYhoXdk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JXXClCLJPJjI+pgT8iJfko+Uv2/ddDSERqoPnW8FhJYML2jwaL0E4DrDNwpoV9xNGYXEvkJKgkG8dfJSw0HjKPXSzWqzXID+n5qy9ntX7pL5fRSUk2CYbOzo2TFfFutTmNuPEc0qdpKP0J63bFcYG07hz7IfZbIed5D+Z6zgrpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TWCFsz5U; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1710205823;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O2b5/RPP4rC6xUSDs7L8tllctKlCe9JUBBRdcxIDUUE=;
	b=TWCFsz5UHf6AliE0nDBj9gy2oqQEF1JfBPMhgNBODW2F4Nr9/hOMvEat7H3LFJgtmQ7YbP
	kjfy0BJQKce3d5ejBRC6atDN7yij/caHoCo5JM8hyy2xeeNTeo6FdCXXgGFX66bjH8KOHV
	g/EAGogaUUTWkCy3ltHxat0+Gu2+f50=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-175-ctD-h0z2PQ61I25Kqa-naw-1; Mon,
 11 Mar 2024 21:10:18 -0400
X-MC-Unique: ctD-h0z2PQ61I25Kqa-naw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C98D43800E88;
	Tue, 12 Mar 2024 01:10:17 +0000 (UTC)
Received: from [10.22.9.132] (unknown [10.22.9.132])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 83DAF492BC6;
	Tue, 12 Mar 2024 01:10:16 +0000 (UTC)
Message-ID: <d98bff53-c85f-45c0-acde-8cb4e018af30@redhat.com>
Date: Mon, 11 Mar 2024 21:10:16 -0400
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 02/10] locking/mutex: introduce devm_mutex_init
Content-Language: en-US
To: George Stark <gnstark@salutedevices.com>, =?UTF-8?Q?Marek_Beh=C3=BAn?=
 <marek.behun@nic.cz>
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
 <3d95ab40-2df5-4988-87be-568a628a0561@redhat.com>
 <20240307174414.4059d7ee@dellmb>
 <cfceef12-883e-4593-9dca-50768acb1aa9@salutedevices.com>
From: Waiman Long <longman@redhat.com>
In-Reply-To: <cfceef12-883e-4593-9dca-50768acb1aa9@salutedevices.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.9

On 3/11/24 19:47, George Stark wrote:
> Hello Waiman, Marek
>
> Thanks for the review.
>
> I've never used lockdep for debug but it seems preferable to
> keep that feature working. It could be look like this:
>
> diff --git a/include/linux/mutex.h b/include/linux/mutex.h
> index f7611c092db7..574f6de6084d 100644
> --- a/include/linux/mutex.h
> +++ b/include/linux/mutex.h
> @@ -22,6 +22,8 @@
>  #include <linux/cleanup.h>
>  #include <linux/mutex_types.h>
>
> +struct device;
> +
>  #ifdef CONFIG_DEBUG_LOCK_ALLOC
>  # define __DEP_MAP_MUTEX_INITIALIZER(lockname)            \
>          , .dep_map = {                    \
> @@ -115,10 +117,31 @@ do {                            \
>
>  #ifdef CONFIG_DEBUG_MUTEXES
>
> +int debug_devm_mutex_init(struct device *dev, struct mutex *lock);
> +
> +#define devm_mutex_init(dev, mutex)            \
> +({                            \
> +    int ret;                    \
> +    mutex_init(mutex);                \
> +    ret = debug_devm_mutex_init(dev, mutex);    \
> +    ret;                        \
> +})

The int ret variable is not needed. The macro can just end with 
debug_devm_mutex_init().


> +
>  void mutex_destroy(struct mutex *lock);
>
>  #else
>
> +/*
> +* When CONFIG_DEBUG_MUTEXES is off mutex_destroy is just a nop so
> +* there's no really need to register it in devm subsystem.
"no really need"?
> +*/
> +#define devm_mutex_init(dev, mutex)            \
> +({                            \
> +    typecheck(struct device *, dev);        \
> +    mutex_init(mutex);                \
> +    0;                        \
> +})

Do we need a typecheck() here? Compilation will fail with 
CONFIG_DEBUG_MUTEXES if dev is not a device pointer.


> +
>  static inline void mutex_destroy(struct mutex *lock) {}
>
>  #endif
> diff --git a/kernel/locking/mutex-debug.c b/kernel/locking/mutex-debug.c
> index bc8abb8549d2..967a5367c79a 100644
> --- a/kernel/locking/mutex-debug.c
> +++ b/kernel/locking/mutex-debug.c
> @@ -19,6 +19,7 @@
>  #include <linux/kallsyms.h>
>  #include <linux/interrupt.h>
>  #include <linux/debug_locks.h>
> +#include <linux/device.h>
>
>  #include "mutex.h"
>
> @@ -89,6 +90,16 @@ void debug_mutex_init(struct mutex *lock, const 
> char *name,
>      lock->magic = lock;
>  }
>
> +static void devm_mutex_release(void *res)
> +{
> +    mutex_destroy(res);
> +}
> +
> +int debug_devm_mutex_init(struct device *dev, struct mutex *lock)
> +{
> +    return devm_add_action_or_reset(dev, devm_mutex_release, lock);
> +}
> +
>  /***
>   * mutex_destroy - mark a mutex unusable
>   * @lock: the mutex to be destroyed


