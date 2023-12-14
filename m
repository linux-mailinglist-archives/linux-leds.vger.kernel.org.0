Return-Path: <linux-leds+bounces-381-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 454E38124CB
	for <lists+linux-leds@lfdr.de>; Thu, 14 Dec 2023 02:52:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 785D81C20336
	for <lists+linux-leds@lfdr.de>; Thu, 14 Dec 2023 01:52:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79BDD186F;
	Thu, 14 Dec 2023 01:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OE/OHna9"
X-Original-To: linux-leds@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9B3A107
	for <linux-leds@vger.kernel.org>; Wed, 13 Dec 2023 17:52:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1702518727;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9AXXFjkdvphmQ1MZVdZxrm1IU4YccGEU/JmOtXsDs6c=;
	b=OE/OHna9DsPkQGLY2qVXz9FCpEfSDPD23MpBYRyeOZZJNANxHTi7diiyFGb5iEdhOcaeeR
	qa0UBD5YQmscmeL654cDYxc2iPKNiSYvAXDJr8+hvoHjMuxcnVoqiwFnv7fv/7/GBSjDlL
	hQNZb1g7kBuo1tjxg0kjgITVQ49/+og=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-222-FawC5tQhPU2pB8SQSY2xmw-1; Wed, 13 Dec 2023 20:52:05 -0500
X-MC-Unique: FawC5tQhPU2pB8SQSY2xmw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7A21685A588;
	Thu, 14 Dec 2023 01:52:04 +0000 (UTC)
Received: from [10.22.33.1] (unknown [10.22.33.1])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 017AD492BF0;
	Thu, 14 Dec 2023 01:52:02 +0000 (UTC)
Message-ID: <ff0c735e-9e8e-4f26-96eb-3927c26e1e01@redhat.com>
Date: Wed, 13 Dec 2023 20:52:02 -0500
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/11] locking: add define if mutex_destroy() is not an
 empty function
Content-Language: en-US
To: George Stark <gnstark@salutedevices.com>, andy.shevchenko@gmail.com,
 pavel@ucw.cz, lee@kernel.org, vadimp@nvidia.com, mpe@ellerman.id.au,
 npiggin@gmail.com, christophe.leroy@csgroup.eu, hdegoede@redhat.com,
 mazziesaccount@gmail.com, peterz@infradead.org, mingo@redhat.com,
 will@kernel.org, boqun.feng@gmail.com, nikitos.tr@gmail.com
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, kernel@salutedevices.com
References: <20231213223020.2713164-1-gnstark@salutedevices.com>
 <20231213223020.2713164-3-gnstark@salutedevices.com>
From: Waiman Long <longman@redhat.com>
In-Reply-To: <20231213223020.2713164-3-gnstark@salutedevices.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.10


On 12/13/23 17:30, George Stark wrote:
> mutex_destroy() is only a debug helper and an empty function on non-debug
> configurations still we can't legally ignore it because it's the
> established API call and it can be extended theoretically in the future.
> Sometimes it could be useful to know e.g. in the higher-level API if
> mutex_destroy() really does something in the current configuration
> and it's should be called or skipped otherwise for the sake of
> optimization so add dedicated define to recognize these cases.
>
> Signed-off-by: George Stark <gnstark@salutedevices.com>
> ---
>   include/linux/mutex.h | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/include/linux/mutex.h b/include/linux/mutex.h
> index a33aa9eb9fc3..2395ce4fcaf6 100644
> --- a/include/linux/mutex.h
> +++ b/include/linux/mutex.h
> @@ -83,6 +83,9 @@ struct mutex {
>   
>   extern void mutex_destroy(struct mutex *lock);
>   
> +/* mutex_destroy() is a real function, not a NOP */
> +#define mutex_destroy  mutex_destroy
> +
>   #else
>   
>   # define __DEBUG_MUTEX_INITIALIZER(lockname)
Acked-by: Waiman Long <longman@redhat.com>


