Return-Path: <linux-leds+bounces-4680-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C523BABB0B0
	for <lists+linux-leds@lfdr.de>; Sun, 18 May 2025 17:32:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2E96A7A8D8A
	for <lists+linux-leds@lfdr.de>; Sun, 18 May 2025 15:31:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FC3415B135;
	Sun, 18 May 2025 15:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FMrPcdNQ"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A419A1482F5;
	Sun, 18 May 2025 15:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747582367; cv=none; b=NATYNl8NAmmkPJQt7fwOTvQ441nN2t6q4CQZpmyxEwTTO2KzIS6sLJk1L9twLfOpJY9aRwP7hnmjpnPs+L0cBPHVg6W+q0ffF2wGArKe7ttC2a4A7W8mbeHqOmJO0DbfRoD297BISwH4lZ2KX7NDSAYXQ9vBU0pOzxIt23+1jWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747582367; c=relaxed/simple;
	bh=nGed94xdf/ERcU1ykh8eP0PcnvtCmAhkx8zZQfFmbTQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V8kBoms70uVXll0WjO1Efmg0Mal6yvmiep0rgCgmbtAGSRcFdy/6fFkj7cbDXRK0lXQDFbdPNcK+xF7wpa4PLudpF3UhqSC8LvLac0YXQL+R0riFsgsHju9SWKg5HdYaMsIQqtMnZH8ZtYADCOHa+msHsO0cHaYMAxhyFpEwWTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FMrPcdNQ; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ad5740dd20eso5609266b.0;
        Sun, 18 May 2025 08:32:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747582364; x=1748187164; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1f92eXOWYP4V+zpTK83sed7LLMBz3R74Jjg/SFUX4Vs=;
        b=FMrPcdNQScnoRRDAhrjEggvXyh+3ui5ZgcESeN7AHddXnnRgMjJXXRhE2DBXecCAQT
         /JbmgtLaYigFnlqofsHjTFB9pVGXcCjpCRr0S+zXs4xSU6zfY3ZkfgASqxa2cI2ER1/I
         1gdPcp3WD9ruoqxxwQrjkajAfhaywAY4+DAWB394lf+auRx7WFH8ijW3Yhh3q8CNEzf1
         oJ7+j4x08nKWdAnQyrWebwZI65bf5dh3WvcXfpHIKoBGF3ShLF2jvarlNLvPw9pRtuDW
         UNjxxa/Q6nOGwxoCDjesU6A6Fy++lGDfm8GRjNqXG1uuOidw4RalLUWcw8aJ8J4JPoFB
         rjfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747582364; x=1748187164;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1f92eXOWYP4V+zpTK83sed7LLMBz3R74Jjg/SFUX4Vs=;
        b=NK/loGs/kJI2PG10HAVyzKCY1ptlU1u2GArt5qbwVjVta2U4d64DcJdXHFI74Z0tEz
         h/NDKt/Z5wgS1Hk9A752RQCDc1PCCMnCxiFtioy4DQu4e+rzUhIOPTz+jtHHjykctJYI
         Q/hfmAxtjbNK16qtnFLW1jKJ8FttCK/zK2QkT/FQ2bvJOpszrhPZyqMlFshCXd4cn/My
         3Mb0n97McPAuYd1hAQgeujcKJMezEneHP3s0IUo+YVPGp5KxVbbueWKr6a6f76nzziRS
         0O3qrXHZSqTOe+FYAZvu7V42MYce7X7y+BUsV5JaqKUhcG5resL9NOMuwv9yqu3tt1H8
         tCTw==
X-Forwarded-Encrypted: i=1; AJvYcCU3UCFT0nRYEAnqP6g0krYhCx26VpT0zLQ0tYbhl+LoYVVoiWu6yXe4No+L4Q/9AGPdniasAXdfR/VAJQ==@vger.kernel.org, AJvYcCU5fEm0FKpHxaWo0K174Yrw+8qsxAN5HKg8AgafscJsHvwjcuL90KSwrF1nsApx76WKBu2+4RxlNhQo6Hc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxS3azyCu/FvO+mOxVjEI143+RXi5+rBtZdCjXpnm0HrWSS8Dyu
	N1DExyZcPln+pr434mPUpt/Gi9L4Xs1t+Zut91E74hVnt55d7pDZBnO9
X-Gm-Gg: ASbGncucZWPvn0UVeYEpbzj04wHRxavkGiDhHEpmV6XFcn7T1IMgm6dtzpUZTG/N2BU
	Qk1AxYpoHbWO1ZaVLQn4IN1bJwgriDXpLMph4rkbEnLI2Y0/YJdQEv6jJ93fdWwQhfjGygvBfTt
	u8ILyn1XbXlVoOo5BUONHmSqpFT455xE0h6MLJoyxUlMdQzXw33bXPJ0eeLB0T3l1ekzfZSkmdD
	bxipxpTMaUY7fmDdZIuM3UjwGuPzIs3OZ15FgQRAopUb46d8FknD0cwTGJn3LwlNIShw8rAUZgd
	XqhXFIQXFrNoxj2UqRJmUE/1ivgtaicIJILBDHisCEPVZqZHAkhLoqYtymTW5gsh
X-Google-Smtp-Source: AGHT+IEUlJL8VBVYjOKV2aKMCQbEDwldB4nX6x9aADGO/DDur57+yPm6021vkCypNuuIG8bZ6IS8Pw==
X-Received: by 2002:a17:907:d26:b0:ad5:715b:d1d4 with SMTP id a640c23a62f3a-ad5715bd3b3mr78933966b.32.1747582363769;
        Sun, 18 May 2025 08:32:43 -0700 (PDT)
Received: from [192.168.0.131] ([194.183.54.57])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d4909e1sm453591866b.125.2025.05.18.08.32.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 May 2025 08:32:43 -0700 (PDT)
Message-ID: <7c5a8768-2d19-40b9-a965-966a8900e703@gmail.com>
Date: Sun, 18 May 2025 17:32:42 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] leds: KUnit registration tests pertaining to
 init_data
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
 linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: bettyzhou@google.com, ynaffit@google.com, tkjos@google.com
References: <20250515082830.800798-1-lee@kernel.org>
Content-Language: en-US
From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
In-Reply-To: <20250515082830.800798-1-lee@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Lee,

On 5/15/25 10:27, Lee Jones wrote:
> Lots of drivers still register with the LED Class using init_data. Let's

What do you mean by "still"? Actually init_data is the new approach,
that turns the LED core DT parser on, and is predestined for use with
{devm_}led_classdev_register_ext() API.

> provide some additional Kunit infrastructure to exercise the various
> possibilities.
> 
> Change log:
> 
> v1 => v2:
>   - Use devm_* to ensure resources are cleaned-up on exit
> 
> Lee Jones (5):
>    leds: led-test: Move common LED class registration code into helper
>      function
>    leds: led-test: Provide test for registration with missing
>      default_label
>    leds: led-test: Provide test for registration with missing devicename
>    leds: led-test: Provide test for registration with a name that is too
>      long
>    leds: led-test: Provide test for successful registration using
>      init_data
> 
>   drivers/leds/led-test.c | 86 ++++++++++++++++++++++++++++++++++++++---
>   1 file changed, 80 insertions(+), 6 deletions(-)
> 

-- 
Best regards,
Jacek Anaszewski


