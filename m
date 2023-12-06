Return-Path: <linux-leds+bounces-275-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 72D4580733E
	for <lists+linux-leds@lfdr.de>; Wed,  6 Dec 2023 16:01:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8DE4E1C209C6
	for <lists+linux-leds@lfdr.de>; Wed,  6 Dec 2023 15:01:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B222374E6;
	Wed,  6 Dec 2023 15:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IqHRjHLQ"
X-Original-To: linux-leds@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10282D46
	for <linux-leds@vger.kernel.org>; Wed,  6 Dec 2023 07:01:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701874866;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dOg7HAEWpXF9CsdFUNxvCGFVvkmTsr7J73fSYQBJM0c=;
	b=IqHRjHLQQEx1agXylreAFb9I4xfYGCme+duBvXNCtiBkOBBGm4UswiWipuC4P9+AJigkZZ
	7mL2+RIW1KayBF1TwPnnaBfK5ZGwBBjXryDXGkRj7YGra156jbPKTfdBHKE7RSclCv6qzF
	R4qCZc/5MAh/VO3sGPzpuZV4sWZ7KJE=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-473-MGpZpasvMPipHhR7zs3I3w-1; Wed, 06 Dec 2023 10:01:04 -0500
X-MC-Unique: MGpZpasvMPipHhR7zs3I3w-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-9fd0a58549bso106461666b.0
        for <linux-leds@vger.kernel.org>; Wed, 06 Dec 2023 07:01:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701874863; x=1702479663;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dOg7HAEWpXF9CsdFUNxvCGFVvkmTsr7J73fSYQBJM0c=;
        b=sqNNsv+I56tho1tEM0/zmaitmQbWPozo4O6mmUKEXbZdZr7vyW66JH/nKXdCBZzPAp
         bQWkjjeP9/9YvcUkucZQQVo/acgRVfPsNf0mRcGYIHJuOL+CUgeQJ22GtVA09HUnNiwT
         kloU9w99kC5QGdQRYzz82nuFt/93exwqm1o0qasTI28HzZjSep6B2vb/9PPjcrP7Fgma
         np0flpXlx8GZEpT419F51jQnJE1uUvH+4oUoVFLRnT24UCwkjOBD960VL8waEFwZaKzz
         knOjF5YRK21m6DUD9WHPNa/SHLLXMIPPeVPYaYXGuYcF1d/c0I8OnJBMVbKuYg7NaKAe
         b7QQ==
X-Gm-Message-State: AOJu0YzoSr8bRZI1ZiYONkW/R7PpaQL1uZ9hkU9sGSybAudNpfQKsl20
	YVTYcpZUFRRHHgcr9h88X2NGEeLbiSz9BN5EYXjP05nzEAS/nfgYrNOHSioaOTRldKjKZXbpq9j
	1A3nfNA1/LgoBPVK9SG7t3w==
X-Received: by 2002:a17:906:207:b0:9ad:8a96:ad55 with SMTP id 7-20020a170906020700b009ad8a96ad55mr3351778ejd.14.1701874863023;
        Wed, 06 Dec 2023 07:01:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHc2iizgPGK0ASX2Lu5JUlmiNsXLAMQISUNLo9xAMCsPCxJYJkGgUwN23XU1+bxfd5zfQWGqw==
X-Received: by 2002:a17:906:207:b0:9ad:8a96:ad55 with SMTP id 7-20020a170906020700b009ad8a96ad55mr3351759ejd.14.1701874862671;
        Wed, 06 Dec 2023 07:01:02 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id t7-20020a1709063e4700b00a1dc7e789fbsm31636eji.21.2023.12.06.07.01.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Dec 2023 07:01:02 -0800 (PST)
Message-ID: <81798fe5-f89e-482f-b0d0-674ccbfc3666@redhat.com>
Date: Wed, 6 Dec 2023 16:01:01 +0100
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
 andy.shevchenko@gmail.com, jic23@kernel.org
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, kernel@salutedevices.com
References: <20231204180603.470421-1-gnstark@salutedevices.com>
 <20231204180603.470421-2-gnstark@salutedevices.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20231204180603.470421-2-gnstark@salutedevices.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi George,

On 12/4/23 19:05, George Stark wrote:
> Using of devm API leads to certain order of releasing resources.
> So all dependent resources which are not devm-wrapped should be deleted
> with respect to devm-release order. Mutex is one of such objects that
> often is bound to other resources and has no own devm wrapping.
> Since mutex_destroy() actually does nothing in non-debug builds
> frequently calling mutex_destroy() is just ignored which is safe for now
> but wrong formally and can lead to a problem if mutex_destroy() is
> extended so introduce devm_mutex_init().
> 
> Signed-off-by: George Stark <gnstark@salutedevices.com>
> ---
>  include/linux/devm-helpers.h | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/include/linux/devm-helpers.h b/include/linux/devm-helpers.h
> index 74891802200d..2f56e476776f 100644
> --- a/include/linux/devm-helpers.h
> +++ b/include/linux/devm-helpers.h
> @@ -76,4 +76,22 @@ static inline int devm_work_autocancel(struct device *dev,
>  	return devm_add_action(dev, devm_work_drop, w);
>  }
>  
> +static inline void devm_mutex_release(void *res)
> +{
> +	mutex_destroy(res);
> +}
> +
> +/**
> + * devm_mutex_init - Resource-managed mutex initialization
> + * @dev:	Device which lifetime work is bound to
> + * @lock:	Pointer to a mutex
> + *
> + * Initialize mutex which is automatically destroyed when driver is detached.
> + */
> +static inline int devm_mutex_init(struct device *dev, struct mutex *lock)
> +{
> +	mutex_init(lock);
> +	return devm_add_action_or_reset(dev, devm_mutex_release, lock);
> +}
> +
>  #endif

mutex_destroy() only actually does anything if CONFIG_DEBUG_MUTEXES
is set, otherwise it is an empty inline-stub.

Adding a devres resource to the device just to call an empty inline
stub which is a no-op seems like a waste of resources. IMHO it
would be better to change this to:

static inline int devm_mutex_init(struct device *dev, struct mutex *lock)
{
	mutex_init(lock);
#ifdef CONFIG_DEBUG_MUTEXES
	return devm_add_action_or_reset(dev, devm_mutex_release, lock);
#else
	return 0;
#endif
}

To avoid the unnecessary devres allocation when
CONFIG_DEBUG_MUTEXES is not set.

Regards,

Hans





