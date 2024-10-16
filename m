Return-Path: <linux-leds+bounces-3119-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D3B699A0915
	for <lists+linux-leds@lfdr.de>; Wed, 16 Oct 2024 14:13:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 618E6B231F7
	for <lists+linux-leds@lfdr.de>; Wed, 16 Oct 2024 12:13:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CB6D207A26;
	Wed, 16 Oct 2024 12:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BB3OKRCm"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F103206059;
	Wed, 16 Oct 2024 12:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729080819; cv=none; b=HRg8DREAC34HWkx6b4msoPjzfsWyNjMKJGfN2RneJeJuRD29lJOy2tInOdhKztL1x4ZbsLgqf2WSQZNw+i/fNPPYe9jVD2YTM0TldZzW5fQNKphqsZxigoVAhBhrGEo4cn1rFe253Tl4xP0MWGhG3mQkmPB6IxLcC3wosYx+MVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729080819; c=relaxed/simple;
	bh=lK7RprZLD+xZ+b9OBOQCQ2ag1yfeLIcZq4YyXtP6YVM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dOg2rXfQakVAbmHJ4Ws/5u5G8lbA2FUSUJmoxwQNU6IF8v1aayFVhn45ga3Fu/7GaQdDZzZmkRepoTYfpv667gpKnslcf2qpExQnRM3USSpuURfXIH64Cala4ogL+Z4g50KBEh8JHIf0Ydg2s56QfvTT84nUr9BGi3CVtWox2q0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BB3OKRCm; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-7db1f13b14aso5412879a12.1;
        Wed, 16 Oct 2024 05:13:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729080817; x=1729685617; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iZZ6IoFhK6PDXBG1QpjJe1QGZtQQvwP0mL/ZwkXR4ZE=;
        b=BB3OKRCmW3E1ce8UQxGERVTXbuTdIS0X0BSDZPegrLmtIAGdSSb0XWNTi3OzuAOzuI
         8ElGjwM8L9JuvLuRsXmCejRvyKg6gxV12tdcFAfKqoUm702xMLky3ujYpeNQEGpR/S+m
         XmKAAv5r5Wrol8DQcGx1EBvROYrt16w/j9HHwYwcTHAJhF6wD5liBvv9we3O8oRp+HPA
         1b1+vhamH63FapWyRxDJX4dvuBedpYpzJa89Qr+7ZvVdz8CUMLr9kDbeipiRM/ayEPl1
         3/fKbFWDf2M93nOyFqpCxwOVUJBAaHt8Gt3I9S8vkzXHa1zu3y+Z9/Jn0WI692AjLdt4
         EwAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729080817; x=1729685617;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iZZ6IoFhK6PDXBG1QpjJe1QGZtQQvwP0mL/ZwkXR4ZE=;
        b=nHKSuvc4Lh3tH5qYeXLgCdTaPeOpigT3sJl7RMutHn5bPwSvdqBqXQJK47so50DrPJ
         wvyi2F8abcccINO3hGXwrpQniz+8nXAS+OZgTCYE14soYMA4ieXcIK/HcZDJbN8RwRAS
         UELakYbHvFcoWiWodBHibWjHu+WwVIbgZV1N6/PtwjPxxXOTP8Gxf0eLuEOh7Z20XF2a
         ao+Gas8+norijUndFn8U94zeBiTolTECogCbOd9YemuR1oSLpoFRHvCfoACziiVwQCCF
         0UMQAKSjup5Pacak+EDmawmePoXIFZxW72CEKrWvA/SDEm59Mp/AEbNX9mtIr+/GR63H
         2Qlw==
X-Forwarded-Encrypted: i=1; AJvYcCUoG2HwVzBm2N7pbMVd+wTLK8IP85lCzK7/0k+KYdJt1+L2xpl0apAAMuABQiG8NVY9z54iGJfU0oKhgw==@vger.kernel.org, AJvYcCXUf6z8NMSADACzcatVYicNrqTgrwcVBYduNVSpU9J1aTloQlEfxakUKBO84RNG1TLYD41emJa01qOQe/4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwpFO2pe9VdhZUfOmjf9OcuXzd9PumDPSN4Jd+ummA2fQRlb1I/
	HE/ZMuepjzAVxgtkbYkqdVwmK4W0MctPiNL9kAdbSsHvom+RFNQA
X-Google-Smtp-Source: AGHT+IGka7vQ+KnGqvwGPqMmm5jyJDtZa+anmR+UonwTf4lt2t9DshghkEXcXytCl/nQDa2rP0r9cg==
X-Received: by 2002:a05:6a21:1584:b0:1d8:b11e:19b9 with SMTP id adf61e73a8af0-1d905f69289mr5724548637.47.1729080817343;
        Wed, 16 Oct 2024 05:13:37 -0700 (PDT)
Received: from ?IPV6:2409:4040:d96:3a2:b0b8:ce41:c5f3:28ee? ([2409:4040:d96:3a2:b0b8:ce41:c5f3:28ee])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7ea9c6d43f8sm3105241a12.54.2024.10.16.05.13.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Oct 2024 05:13:36 -0700 (PDT)
Message-ID: <a87bee76-85a9-47d7-bdd4-70f8dbe42848@gmail.com>
Date: Wed, 16 Oct 2024 17:43:30 +0530
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: (subset) [PATCH v2] leds: Fix uninitialized variable 'ret' in
 mt6370_mc_pattern_clear
To: Lee Jones <lee@kernel.org>
Cc: angelogioacchino.delregno@collabora.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-leds@vger.kernel.org, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, pavel@ucw.cz
References: <20241015085842.GC8348@google.com>
 <20241016042142.8088-1-surajsonawane0215@gmail.com>
 <172906519188.1139310.1418498131501157586.b4-ty@kernel.org>
Content-Language: en-US
From: Suraj Sonawane <surajsonawane0215@gmail.com>
In-Reply-To: <172906519188.1139310.1418498131501157586.b4-ty@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 16/10/24 13:23, Lee Jones wrote:
> On Wed, 16 Oct 2024 09:51:42 +0530, Suraj Sonawane wrote:
>> Fix the uninitialized symbol 'ret' in the function mt6370_mc_pattern_clear
>> to resolve the following warning:
>> drivers/leds/rgb/leds-mt6370-rgb.c:604 mt6370_mc_pattern_clear()
>> error: uninitialized symbol 'ret'.
>> Initialize 'ret' to 0 to prevent undefined behavior from uninitialized
>> access.
>>
>> [...]
> 
> Applied, thanks!
> 
> [1/1] leds: Fix uninitialized variable 'ret' in mt6370_mc_pattern_clear
>        commit: 6cbf5c99541ac681cf5c6155b582dfbcd879eae3
> 
> --
> Lee Jones [李琼斯]
> 
Thanks a lot!

