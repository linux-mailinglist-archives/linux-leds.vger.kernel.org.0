Return-Path: <linux-leds+bounces-1860-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 41032900215
	for <lists+linux-leds@lfdr.de>; Fri,  7 Jun 2024 13:25:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A460A2893C7
	for <lists+linux-leds@lfdr.de>; Fri,  7 Jun 2024 11:25:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AA411862B8;
	Fri,  7 Jun 2024 11:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wv/dh0Q1"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B37146D1B9;
	Fri,  7 Jun 2024 11:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717759548; cv=none; b=PsPt90fRLRQctu48LoGNn2aIyZoZ56cpn36suRI6dVizdMbzSRuiaiUx7CwNB37Kfr42eXob6cYhHUyBjbDEMIK353itIFRp6svCpG6J+ypwusu3SUFC8mAe4Nk0GPZX8sq/8fAfFc2j3eQqCbFyY4yfbd50cdbyYM4f00azgV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717759548; c=relaxed/simple;
	bh=CqTYXoVNra5Cl7LYvRYd0RXHEHobM+FtL0XVsDRSOto=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WSgCJE+OlkCCz0BxIETtcr8k/kVrpKblRx5/3EUtECCUyFAvDAVb4JZczV+6H3NW4MNvTy9gc/rWA7uxIpdx0t4VNFvpsMZI1xyeiXgWnElJij2ozZWPdNT4hsI0hB7QgVi5iBdpTwfE0yoMWxdrf/AJwGoH0uxZqcMKmMYyjgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wv/dh0Q1; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1f6559668e1so17605755ad.3;
        Fri, 07 Jun 2024 04:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717759545; x=1718364345; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AL2peTkLtP/iuUU0Wor02p7UZI/DaudYxquldAAWqLY=;
        b=Wv/dh0Q1zZ8RfuFuQJt9R2KvFwbb8UAXWnrV5QgPJk2YT0TS5B9SV5127W+Mk33Ir0
         ++jv1G0kbgl9A1kWD6T1fw5WxwQEYTj+hhmJGJX9dCizSfTXzn1HV7edCftMYK8Mn7BX
         by+Pq8GYaeL3OpwWHrwIH4kOi4L8UJzZZBGx08pBELxaejBMhKFKTSAyZqQ8ZiNxUf6P
         ddA2+cA+iGDp06ypQBqi/uSivcn1lPiND+bZgzJj6fBvAA4cw8zPvQYmgi8qm90zgUjq
         TYBqjGSEbxaeNz33Lms0WCXMgWoX/gQqgKHS/kPUZWTR+wKW9/frj9XpGGm23iQsRPfW
         8psQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717759545; x=1718364345;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AL2peTkLtP/iuUU0Wor02p7UZI/DaudYxquldAAWqLY=;
        b=GEXn+pPWqyQS3mjw9aEC316klesLfNyqO8nNEU0z1apFaMVNra+kZsbAoNLbWDBurj
         FAdoH1URIq34fLZdyvFRfSTpD618Hsp78A4ZhRHaZyNC5gdbUz/dlIlvdJ7s7o/43FYx
         vcIhPKtsL3hGi/tWB3/D48i+obhgdFo8H2ybfrFpELPrOI6kGSMYcUjoRjLhP4x21ue1
         v1AstdvRHdodLuxFfxaEF1YkQgYDkVehe54XlGkkgDlV+svpNLlXSQHyxnn1i+kqBwP1
         sIimf22bAPEvep+EsJPKJUuQVQY5czxKa1pvuUl5B3m2xAeSivYGZgCKVNEvqhqQaSUx
         2ihQ==
X-Forwarded-Encrypted: i=1; AJvYcCX4MzgjvgwCKQ4MpaddFV2SaXJAOLi7AHFh9VjAx6Pau8XgAerWwP02vVowsKJUnnnyD+akWHvDzjDekAEejTjxIiKOuNIJRYTDH0rxmqNVp7hjlJZ56gTl8dNeZNhNofWfCnof5zx9bw==
X-Gm-Message-State: AOJu0YxdGLI00P39bU6nM4y6D5BaahkBB4AW0pR/lquwPXEGcnhrybzg
	3wVFR/HXsZOStk5uoubQwbfgggZy00A6MCac+IyonuoyWjPKc6I7
X-Google-Smtp-Source: AGHT+IFOT8iHEEUZhPIDkDJbUx2BKhUqXB05g0I/13p7fXXmVD1Oc6aBBY7OKTHpeTkGO3Q1/ojkCA==
X-Received: by 2002:a17:902:d4c4:b0:1f6:857b:b5c with SMTP id d9443c01a7336-1f6d02fdd2emr27360715ad.32.1717759544944;
        Fri, 07 Jun 2024 04:25:44 -0700 (PDT)
Received: from ?IPV6:2804:431:cfd3:42f5:5119:119d:e1d9:57b4? ([2804:431:cfd3:42f5:5119:119d:e1d9:57b4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6bd75ef93sm32034235ad.3.2024.06.07.04.25.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Jun 2024 04:25:44 -0700 (PDT)
Message-ID: <98a5e808-68b5-42d0-8572-78b724b7078d@gmail.com>
Date: Fri, 7 Jun 2024 08:25:38 -0300
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 linux-next] leds: powernv: replace of_node_put to
 __free
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
 Julia Lawall <julia.lawall@inria.fr>
Cc: Shuah Khan <skhan@linuxfoundation.org>,
 Javier Carrasco <javier.carrasco.cruz@gmail.com>,
 linux-leds@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
References: <20240601031713.1307859-1-marilene.agarcia@gmail.com>
Content-Language: en-US
From: Marilene Andrade Garcia <marilene.agarcia@gmail.com>
In-Reply-To: <20240601031713.1307859-1-marilene.agarcia@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01/06/2024 00:17, MarileneGarcia wrote:
> Use __free for device_node values, and thus drop calls to
> of_node_put.
> 
> The variable attribute __free adds a scope based cleanup to
> the device node. The goal is to reduce memory management issues
> in the kernel code.
> 
> The of_node_put calls were removed, and the
> for_each_available_child_of_node was replaced to the equivalent
> for_each_available_child_of_node_scoped which use the __free.
> 
> Suggested-by: Julia Lawall <julia.lawall@inria.fr>
> Signed-off-by: MarileneGarcia <marilene.agarcia@gmail.com>
> ---
> Hello,
> Thank you for the feedback.
> 
> The line-break strategy was fixed, and now it is according to
> the top one suggested.
> 
> The __free is a wrapper to __attribute__((__cleanup__())) so
> the variavel definition is needed. And according to Julia, it
> is preferred to combine the declaration and the allocation to
> ensure that there is no return that can occur after the declaration,
> but before the allocation (or more precisely the initialization).
> If there is no other option for the initialization of the variable,
> then it should be NULL.
> 
>   drivers/leds/leds-powernv.c | 28 +++++++++-------------------
>   1 file changed, 9 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/leds/leds-powernv.c b/drivers/leds/leds-powernv.c
> index 4f01acb75727..49ab8c9a3f29 100644
> --- a/drivers/leds/leds-powernv.c
> +++ b/drivers/leds/leds-powernv.c
> @@ -246,29 +246,25 @@ static int powernv_led_classdev(struct platform_device *pdev,
>   	const char *cur = NULL;
>   	int rc = -1;
>   	struct property *p;
> -	struct device_node *np;
>   	struct powernv_led_data *powernv_led;
>   	struct device *dev = &pdev->dev;
>   
> -	for_each_available_child_of_node(led_node, np) {
> +	for_each_available_child_of_node_scoped(led_node, np) {
>   		p = of_find_property(np, "led-types", NULL);
>   
>   		while ((cur = of_prop_next_string(p, cur)) != NULL) {
>   			powernv_led = devm_kzalloc(dev, sizeof(*powernv_led),
>   						   GFP_KERNEL);
> -			if (!powernv_led) {
> -				of_node_put(np);
> +			if (!powernv_led)
>   				return -ENOMEM;
> -			}
>   
>   			powernv_led->common = powernv_led_common;
>   			powernv_led->loc_code = (char *)np->name;
>   
>   			rc = powernv_led_create(dev, powernv_led, cur);
> -			if (rc) {
> -				of_node_put(np);
> +			if (rc)
>   				return rc;
> -			}
> +
>   		} /* while end */
>   	}
>   
> @@ -278,12 +274,11 @@ static int powernv_led_classdev(struct platform_device *pdev,
>   /* Platform driver probe */
>   static int powernv_led_probe(struct platform_device *pdev)
>   {
> -	struct device_node *led_node;
>   	struct powernv_led_common *powernv_led_common;
>   	struct device *dev = &pdev->dev;
> -	int rc;
> +	struct device_node *led_node
> +		__free(device_node) = of_find_node_by_path("/ibm,opal/leds");
>   
> -	led_node = of_find_node_by_path("/ibm,opal/leds");
>   	if (!led_node) {
>   		dev_err(dev, "%s: LED parent device node not found\n",
>   			__func__);
> @@ -292,20 +287,15 @@ static int powernv_led_probe(struct platform_device *pdev)
>   
>   	powernv_led_common = devm_kzalloc(dev, sizeof(*powernv_led_common),
>   					  GFP_KERNEL);
> -	if (!powernv_led_common) {
> -		rc = -ENOMEM;
> -		goto out;
> -	}
> +	if (!powernv_led_common)
> +		return -ENOMEM;
>   
>   	mutex_init(&powernv_led_common->lock);
>   	powernv_led_common->max_led_type = cpu_to_be64(OPAL_SLOT_LED_TYPE_MAX);
>   
>   	platform_set_drvdata(pdev, powernv_led_common);
>   
> -	rc = powernv_led_classdev(pdev, led_node, powernv_led_common);
> -out:
> -	of_node_put(led_node);
> -	return rc;
> +	return powernv_led_classdev(pdev, led_node, powernv_led_common);
>   }
>   
>   /* Platform driver remove */

Hello,
Did you have a chance to look at the patch after the requested change?

Thank you,
Marilene

