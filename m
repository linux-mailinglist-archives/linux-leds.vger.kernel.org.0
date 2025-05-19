Return-Path: <linux-leds+bounces-4686-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BF72ABC4A5
	for <lists+linux-leds@lfdr.de>; Mon, 19 May 2025 18:35:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 356953B23C2
	for <lists+linux-leds@lfdr.de>; Mon, 19 May 2025 16:35:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C947928641D;
	Mon, 19 May 2025 16:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="hY3aAFwM"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CE86286D65
	for <linux-leds@vger.kernel.org>; Mon, 19 May 2025 16:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747672553; cv=none; b=iq0mrjT4eDYnT0myY5IUZ0rloSPq8mnsWI/zkqNQQqxRV9UWqcZ5XXjR9LFa3x5WV3wKrp4bukiDeP6VblLQ1X39UgrGI1nWwjCsiObwkD/VS9o5dQGuomULl7XglbcDhWoxpEtXIDpGaWpxRITJs56z3M/PPs5GP89Y6erEe+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747672553; c=relaxed/simple;
	bh=0QbvWiCAa+GioZRtVuR1peg4Ser/UC7UOzTp8JIZmZ8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BQS9pYhSF7J7LbU/vuKvKjqgW3s2mtVB/KPT//MNeLq7BX6+CaD1thCYC7QudiZSdsMbd0At55ZktlQrOGFhMVgSZvT2zHArhJ5VFMgSfaVZjR0+Tlr6tUmXEnluJbNb3V/lZEGAqxihufIb2hI0/pWmhly+kNCnUeQmlgRIPOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=hY3aAFwM; arc=none smtp.client-ip=209.85.160.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-2cc82edcf49so816263fac.1
        for <linux-leds@vger.kernel.org>; Mon, 19 May 2025 09:35:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1747672550; x=1748277350; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=W58GfmIWiZ3U0eNBo2ssjSmziqMleoXnnwt1PGdnFxg=;
        b=hY3aAFwMukUfRB4AEd3dg6nw0Qs+GhudysQ/b7DPD6wJ1IDksewyTz7pA7Xiu4wBsC
         MdCc81yOBJZ5HMK3/TqeQaPyH8yLJmvyU3rW1mN96Y2d0AIJHZPI8++eTkfrj86/ZjXy
         3j8xWG9XVMpO15C6FKlCxVwPju6N5yWS9gdZy1ADxJghtsX18J/c3vnfYNWmiySrNc3t
         0s0NP5/TMh6Nc5m2ly6XV+2GDT9mu1cf0N9BxJfHih+0X9r2HcUfBcyM3+T5O3E85oKB
         EIF2F0yxJsExwNsc8BcUkUF8gO6w5aZNt64W7FcA0fdYz2VecfhatUXstNNyhlQouFzV
         d+tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747672550; x=1748277350;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W58GfmIWiZ3U0eNBo2ssjSmziqMleoXnnwt1PGdnFxg=;
        b=VrvObuyBDqN6HoDNe+AsJrvHW6r3bJEXXDYdsqa15Iap3X84atWql3Oy3sjN/vZoRX
         qh0TSOcYaOApYmeYe8ClyER3Eiok1CPtI3dDM8agx8Y5aiRVkgkWUD/Gm3qx+LYeoW50
         h9vRVYPn/6aD7tVxL8JPqPoplcKcW4bjCN4bu+FzpwKmNN9g6VHSRDQJUDztDy6S/Hwi
         CbOz9gNm2Ntk+UbfwRrcjhAV7GXn9Q43BhhZAcgfWBcnPiCXgkuOQzSahULNUgrwEhw5
         dtP9bmebru6slc7VdQQYOaxvSM9R0w/uIe9TK8cxSE9TLsfST+Y89Pnbo2hT7hIyqdG/
         QpbQ==
X-Forwarded-Encrypted: i=1; AJvYcCW02z4nbIcguvQ5jZWoEJzvkH+rAz1Ui2M96cfksAbn3jfdaD6kMBfi9lG/aAY+8thXdlvu7uTqC2h9@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3mgS60X4IjsdSlisV2Mb0bcMAhSEYTVHqrXUgwNlwSjRSNF64
	e6aImuethWMfBaC0UMigNKn90FEoVzVGz/ale9wcKGPjr/kB2yqVFeL6yY3hdGiYvwI=
X-Gm-Gg: ASbGncsjm9OhAdqcs7JR3s6gyjwtXEK/1GQos9W8tugfZC0LzcXSqeMD3zKy3qyhe9v
	pp9uKf5KxBtPQDC5zrN0SVXKItmz6WSWPZ2DowJBEougbT2E5UKFTntc8X9OaJ580J6kzYBNsW2
	qjFJPHXcqU/xU0CFV5yGgWIHfJ3mgP33/g5df916PE03YmjG70Ps0UeykHDLKmp4xWViWreeLLS
	3s4GDhv5mrKJ2rbBwRAflkFc1t9JSYysWUyFj8FTuaREZmF8X+WQJWsHNvfIH+cJSHXTKY80ZVt
	dXfy+dcTY7mMMPOywbLMOFXuhXWqlBO0S9g+bnGYYy7EwqApOyEVD82h6orso5ggSTCvIpzFa6E
	brxysKtGxGjxGTxw7e4Ib5BkX8+bB1feLGZ2R
X-Google-Smtp-Source: AGHT+IEqxryGUIrvlFRjjbZt/fpBB4e1H0kstalMU3B2lw3tKXhvZEegqt/3++j3ZSdhGSKMO3o38w==
X-Received: by 2002:a05:6870:ad97:b0:2d9:45b7:8ffc with SMTP id 586e51a60fabf-2e3c817196amr7065629fac.3.1747672550446;
        Mon, 19 May 2025 09:35:50 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:a628:91ca:eb5:d6f5? ([2600:8803:e7e4:1d00:a628:91ca:eb5:d6f5])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2e3c06baca3sm1795657fac.19.2025.05.19.09.35.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 May 2025 09:35:50 -0700 (PDT)
Message-ID: <ba79221f-9acd-4919-abe9-e2c49e80fb6c@baylibre.com>
Date: Mon, 19 May 2025 11:35:48 -0500
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 16/16] lib: move find_closest() and
 find_closest_descending() to lib functions
To: Alexandru Soponar <asoponar@taladin.ro>, linux-kernel@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-leds@vger.kernel.org, linux-watchdog@vger.kernel.org
Cc: jdelvare@suse.com, linux@roeck-us.net, jic23@kernel.org, pavel@ucw.cz,
 lee@kernel.org, baocheng.su@siemens.com, wim@linux-watchdog.org,
 tobias.schaffner@siemens.com, angelogioacchino.delregno@collabora.com,
 benedikt.niedermayr@siemens.com, matthias.bgg@gmail.com,
 aardelean@baylibre.com, contact@sopy.one
References: <20250515081332.151250-1-asoponar@taladin.ro>
 <20250515081332.151250-17-asoponar@taladin.ro>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20250515081332.151250-17-asoponar@taladin.ro>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/15/25 3:13 AM, Alexandru Soponar wrote:
> Move the utility macros find_closest() and find_closest_descending()
> from inline macros to proper library functions in lib/.
> 
> Signed-off-by: Alexandru Soponar <asoponar@taladin.ro>
> ---
>  include/linux/find_closest.h | 13 +++++++
>  include/linux/util_macros.h  | 61 +------------------------------
>  lib/Makefile                 |  2 +-
>  lib/find_closest.c           | 71 ++++++++++++++++++++++++++++++++++++
>  4 files changed, 86 insertions(+), 61 deletions(-)
>  create mode 100644 include/linux/find_closest.h
>  create mode 100644 lib/find_closest.c
> 
> diff --git a/include/linux/find_closest.h b/include/linux/find_closest.h
> new file mode 100644
> index 000000000000..28a5c4d0c768
> --- /dev/null
> +++ b/include/linux/find_closest.h
> @@ -0,0 +1,13 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Find closest element functions
> + */
> +#ifndef _LINUX_FIND_CLOSEST_H_
> +#define _LINUX_FIND_CLOSEST_H_
> +
> +#include <linux/types.h>

Is this header really needed?

> +
> +unsigned int find_closest(int x, const int *a, unsigned int as);
> +unsigned int find_closest_descending(int x, const int *a, unsigned int as);
> +
> +#endif /* _LINUX_FIND_CLOSEST_H_ */

...

> diff --git a/lib/find_closest.c b/lib/find_closest.c
> new file mode 100644
> index 000000000000..d481625cae9d
> --- /dev/null
> +++ b/lib/find_closest.c
> @@ -0,0 +1,71 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Find closest element functions
> + *
> + * Based on previous util_macros.h implementation
> + */
> +
> +#include <linux/find_closest.h>
> +#include <linux/module.h>
> +
> +/**
> + * find_closest - locate the closest element in a sorted array
> + * @x: The reference value.
> + * @a: The array in which to look for the closest element. Must be sorted
> + *  in ascending order.
> + * @as: Size of 'a'.
> + *
> + * Returns the index of the element closest to 'x'.

s/Returns/Returns:/

for kernel-doc semantics

> + */
> +unsigned int find_closest(int x, const int *a, unsigned int as)
> +{
> +	unsigned int array_size = as - 1;
> +	int mid_x, left, right;
> +	unsigned int i;
> +
> +	for (i = 0; i < array_size; i++) {
> +		mid_x = (a[i] + a[i + 1]) / 2;
> +		if (x <= mid_x) {
> +			left = x - a[i];
> +			right = a[i + 1] - x;
> +			if (right < left)
> +				i++;
> +			break;
> +		}
> +	}
> +
> +	return i;
> +}
> +EXPORT_SYMBOL_GPL(find_closest);
> +
> +/**
> + * find_closest_descending - locate the closest element in a sorted array
> + * @x: The reference value.
> + * @a: The array in which to look for the closest element. Must be sorted
> + *  in descending order.
> + * @as: Size of 'a'.
> + *

Would repeat the Returns: section here for completeness.

> + * Similar to find_closest() but 'a' is expected to be sorted in descending
> + * order.

This seems redundant since @a already says this.

>             The iteration is done in reverse order, so that the comparison> + * of 'right' & 'left' also works for unsigned numbers.

This seems like an implementation detail so would be better as a comment inside
the function. Although, since @a is always signed, is this comment actually
still applicable?

> + */
> +unsigned int find_closest_descending(int x, const int *a, unsigned int as)
> +{
> +	unsigned int array_size = as - 1;
> +	int mid_x, left, right;
> +	unsigned int i;
> +
> +	for (i = array_size; i >= 1; i--) {
> +		mid_x = (a[i] + a[i - 1]) / 2;
> +		if (x <= mid_x) {
> +			left = x - a[i];
> +			right = a[i - 1] - x;
> +			if (right < left)
> +				i--;
> +			break;
> +		}
> +	}
> +
> +	return i;
> +}
> +EXPORT_SYMBOL_GPL(find_closest_descending);


