Return-Path: <linux-leds+bounces-3876-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4181FA26DE0
	for <lists+linux-leds@lfdr.de>; Tue,  4 Feb 2025 10:01:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BE7C4164CC2
	for <lists+linux-leds@lfdr.de>; Tue,  4 Feb 2025 09:01:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 836AD2063FC;
	Tue,  4 Feb 2025 09:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="FdmUuAtG"
X-Original-To: linux-leds@vger.kernel.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3471D8635E;
	Tue,  4 Feb 2025 09:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738659675; cv=none; b=cCCou1p8ruu5gfWNsvF/gKFK3JiMWNygPwaJcS8oDn0tRA2kfOciNT/OKqVoe2bbxYKjBo2XW5FrMv5nSSux7lnN5l3q3rc/m81paHP0y4z/qD+cU10NHNvHmFZWb5r88SrM52GJGz4Vmttl2dpg4bdtvyTZ+UN4ZkDY8uWTDHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738659675; c=relaxed/simple;
	bh=6d3fcbbn2Pf6RuelrUjsLK8C4wz9xI5/BD65tXDJkRg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rTGS6DMX4mSXmR1zbbP38YyULpzcaYSnQgOU+dME9ctZPI//rcYlWXh6kn4zqjHHhDUqsEUEHvunLis0vIJdvf3VxK/mcAOFGTyUPvo9jEv9rpVnFiVcgULd3qpSBaeyBxaHvZmP4xwLbWWoKDuSvf0v8FxauiXbWPCFET1o58Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=FdmUuAtG; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=OhhhR3x+W9KJfK0DXKEIItqeRAaiUhkKFIUFxL4Ai9o=; b=FdmUuAtGd5DClTutxPqEz2pWIW
	wu4//0c/pv3CWVvWVxcH27N292P1m1vljdZkI1fqor09sraKJZpz6h0g0uWqRA0+oetnFrr3PRA0x
	riGtv+G4TF4cCYSv+uXsvRC8uCcO8/MwV7twWGyyeHFxZVdWi4Yu3us6lEZtIV1Vq7TW58k45cc+o
	Wvx06rNEnVSufmUxNd17r30jyJaWWk4KZeqDW7a7zKmrebL2vARmCc+1X39TKtFX61PAdqKCaqNMy
	A1jbHgEm0YBHp178kLCCdfO7ATOB9nfpdlDhu6s47NFe/L5HaH9ZlI3WMX0r6qBJAzelSqXQ7Af7R
	608pyRVw==;
Received: from 77-249-17-89.cable.dynamic.v4.ziggo.nl ([77.249.17.89] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tfEnq-0000000GHJP-2lch;
	Tue, 04 Feb 2025 09:01:07 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 0B895300599; Tue,  4 Feb 2025 10:01:06 +0100 (CET)
Date: Tue, 4 Feb 2025 10:01:06 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>,
	Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
	Vicentiu Galanopulo <vicentiu.galanopulo@remote-tech.co.uk>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
Subject: Re: [PATCH v2 2/2] locking/mutex: Mark devm_mutex_init() as
 __must_check
Message-ID: <20250204090106.GP7145@noisy.programming.kicks-ass.net>
References: <20250204-must_check-devm_mutex_init-v2-0-7b6271c4b7e6@weissschuh.net>
 <20250204-must_check-devm_mutex_init-v2-2-7b6271c4b7e6@weissschuh.net>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250204-must_check-devm_mutex_init-v2-2-7b6271c4b7e6@weissschuh.net>

On Tue, Feb 04, 2025 at 07:52:51AM +0100, Thomas Weiﬂschuh wrote:
> Even if it's not critical, the avoidance of checking the error code
> from devm_mutex_init() call today diminishes the point of using devm
> variant of it. Tomorrow it may even leak something. Enforce all callers
> checking the return value through the compiler.
> 
> As devm_mutex_init() itself is a macro which can not be annotated,
> annotate __devm_mutex_init() instead.
> Unfortunately __must_check/warn_unused_result don't propagate through
> statement expression. To work around this move the statement expression
> into the argument list of the call to __devm_mutex_init() so
> devm_mutex_init() directly expands to __devm_mutex_init().
> 
> Signed-off-by: Thomas Weiﬂschuh <linux@weissschuh.net>
> ---
>  include/linux/mutex.h | 17 ++++++++---------
>  1 file changed, 8 insertions(+), 9 deletions(-)
> 
> diff --git a/include/linux/mutex.h b/include/linux/mutex.h
> index 2bf91b57591b49e4668752e773419ae945f124da..65b28c9e6efc123982d923d1ed171eae471c82c1 100644
> --- a/include/linux/mutex.h
> +++ b/include/linux/mutex.h
> @@ -126,11 +126,11 @@ do {							\
>  
>  #ifdef CONFIG_DEBUG_MUTEXES
>  
> -int __devm_mutex_init(struct device *dev, struct mutex *lock);
> +int __must_check __devm_mutex_init(struct device *dev, struct mutex *lock);
>  
>  #else
>  
> -static inline int __devm_mutex_init(struct device *dev, struct mutex *lock)
> +static inline int __must_check __devm_mutex_init(struct device *dev, struct mutex *lock)
>  {
>  	/*
>  	 * When CONFIG_DEBUG_MUTEXES is off mutex_destroy() is just a nop so
> @@ -141,13 +141,12 @@ static inline int __devm_mutex_init(struct device *dev, struct mutex *lock)
>  
>  #endif
>  
> -#define devm_mutex_init(dev, mutex)			\
> -({							\
> -	typeof(mutex) mutex_ = (mutex);			\
> -							\
> -	mutex_init(mutex_);				\
> -	__devm_mutex_init(dev, mutex_);			\
> -})
> +#define devm_mutex_init(dev, mutex) __devm_mutex_init(dev, ({	\
> +	typeof(mutex) mutex_ = (mutex);				\
> +								\
> +	mutex_init(mutex_);					\
> +	mutex_;							\
> +}))

Urgh, that's a bit ugly isn't it.

Now we can either write a helper for that like:

#define mutex_init_ret(mutex)                           \
({                                                      \
	typeof(mutex) mutex_ = (mutex);                 \
	mutex_init(mutex_);                             \
	mutex_;                                         \
})

#define devm_mutex_init(dev, mutex)                     \
        __devm_mutex_init(dev, mutex_init_ret(mutex))


Or we can try and make mutex_init() return the pointer itself. I don't
think that will break anything, but its best to feel that to the robots
to make sure.

