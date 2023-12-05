Return-Path: <linux-leds+bounces-257-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BDA128049F0
	for <lists+linux-leds@lfdr.de>; Tue,  5 Dec 2023 07:21:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E9A0D1C20C79
	for <lists+linux-leds@lfdr.de>; Tue,  5 Dec 2023 06:21:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C210ADDD2;
	Tue,  5 Dec 2023 06:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OOdcoubr"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 116FFB6;
	Mon,  4 Dec 2023 22:21:01 -0800 (PST)
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2c9fdf53abcso19184031fa.1;
        Mon, 04 Dec 2023 22:21:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701757259; x=1702362059; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EOqprCd4bG5T3dRTwPYRAAXTaR7ceVabdmLSc2XpaJ0=;
        b=OOdcoubrHsN3H9Reb/J62QaitBXRxm2NCntJ3qnYY4iEiMo5k3U5IKMMQZVX+1oaWs
         fK6G2FUyJP+G6DkFjVJ8a9XRgHupteIhKJtvhP6xKWY1DELB2TRY5mAiaU1ltgBsZpHU
         KBEZzYW93mmvUBRhRjn6HWhL1ANE5uZWNJtbKXcKQ0XlJPMK0hBq2drSTq+iZJHReipR
         /yNMladsiw1HzpPFp2Vt5qoXYKasCLUpR0mzBXsOJZs7ntZ+shlE5Dr5/zl81NDpizWK
         JNx7g0+xzsk/EQrCA/9mfqN2iGVZvf0rp9pDUrMUkHCXZm2b7+uxPnF6Sy+bDEI51OrK
         gxcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701757259; x=1702362059;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EOqprCd4bG5T3dRTwPYRAAXTaR7ceVabdmLSc2XpaJ0=;
        b=T1UQcaqNrWHcmMnVRZheeKEu71HehU7RWBVCV4iiJ41+x+fkQwLBXkofWBdKNgTZEC
         7Q8NZT0qjUp2E1dRHIvw7UUf2cZpdxcYEiGX7JrkolgZEVtVTTHvsX1ZtRmEyoPnWUZU
         mkn6wdRnvz1a5FDZhCSFExJwTzsLN4gSDK5pEhHPcWGHqzIaCNdoYKSIWhZT5MMsK8bH
         QstHOLRfn4kpbnRR0Nv2q0KksJeI7dySZGN5EjJZMs9SZ5MnpNZqFsnkkCybawb8c+nO
         C4qdETv3JvAWEYYgyXKHZpey6FzttjwiRJApZgURuB3nyxDtLiXSyOsiivZrYRyv0kKr
         EDAQ==
X-Gm-Message-State: AOJu0Yw5R4mWQTg6fdDoOm2Xz+nuwMYzTfEmuWJzcXEb+9crVPLPrQ/t
	ETYpnH2QdqutLr0QsmS0lPmApM0vMRjmUw==
X-Google-Smtp-Source: AGHT+IFEpn9/cYjwhdGUMp5Q8e82xnJ9Pnz3h+NI7jLulEvGm4X2k+vBHEEVziBdAvT0dyhQQPx1Rw==
X-Received: by 2002:a2e:8908:0:b0:2c9:ea39:5fe1 with SMTP id d8-20020a2e8908000000b002c9ea395fe1mr629301lji.9.1701757258904;
        Mon, 04 Dec 2023 22:20:58 -0800 (PST)
Received: from ?IPV6:2001:14ba:16f8:1500::2? (dc78bmyyyyyyyyyyyyyby-3.rev.dnainternet.fi. [2001:14ba:16f8:1500::2])
        by smtp.gmail.com with ESMTPSA id e20-20020a2e8ed4000000b002ca0d8768a7sm296664ljl.93.2023.12.04.22.20.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Dec 2023 22:20:57 -0800 (PST)
Message-ID: <68533caa-d98f-4824-a761-82a09f419f41@gmail.com>
Date: Tue, 5 Dec 2023 08:20:56 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/10] devm-helpers: introduce devm_mutex_init
Content-Language: en-US, en-GB
To: George Stark <gnstark@salutedevices.com>, pavel@ucw.cz, lee@kernel.org,
 vadimp@nvidia.com, mpe@ellerman.id.au, npiggin@gmail.com,
 christophe.leroy@csgroup.eu, hdegoede@redhat.com, andy.shevchenko@gmail.com,
 jic23@kernel.org
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, kernel@salutedevices.com
References: <20231204180603.470421-1-gnstark@salutedevices.com>
 <20231204180603.470421-2-gnstark@salutedevices.com>
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20231204180603.470421-2-gnstark@salutedevices.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/4/23 20:05, George Stark wrote:
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
>   include/linux/devm-helpers.h | 18 ++++++++++++++++++
>   1 file changed, 18 insertions(+)
> 
> diff --git a/include/linux/devm-helpers.h b/include/linux/devm-helpers.h
> index 74891802200d..2f56e476776f 100644
> --- a/include/linux/devm-helpers.h
> +++ b/include/linux/devm-helpers.h
> @@ -76,4 +76,22 @@ static inline int devm_work_autocancel(struct device *dev,
>   	return devm_add_action(dev, devm_work_drop, w);
>   }
>   
> +static inline void devm_mutex_release(void *res)
> +{
> +	mutex_destroy(res);
> +}
> +
> +/**
> + * devm_mutex_init - Resource-managed mutex initialization
> + * @dev:	Device which lifetime work is bound to

Work? Copy-paste error?

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
>   #endif

Doesn't the mutex stuff need a header inclusion?

Yours,
	-- Matti


-- 
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~


