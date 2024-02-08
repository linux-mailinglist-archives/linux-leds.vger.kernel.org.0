Return-Path: <linux-leds+bounces-783-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C4D684DEB6
	for <lists+linux-leds@lfdr.de>; Thu,  8 Feb 2024 11:53:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 02E6E28806D
	for <lists+linux-leds@lfdr.de>; Thu,  8 Feb 2024 10:53:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB93974E1E;
	Thu,  8 Feb 2024 10:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RjROIzck"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0588874E06
	for <linux-leds@vger.kernel.org>; Thu,  8 Feb 2024 10:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707389476; cv=none; b=XuWjNiAeTb6pDFr+4u1axAksK2dvGSwCB6/2hesJmFxXPye+BimocVoLu1BY+hpwyB5HNocc4i6dec9uhdrcJut9QkgB/f+cq6g+evxyv2aHQR/xicHB6Nk6eaTGzVRBRzw9hzX7qwVQ/wDCzFPeUVqfb1WUbu46gmPCK0BIIBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707389476; c=relaxed/simple;
	bh=IvgoWkKwUNv2oxL1WaE5Qo8srJCLoJ36sAwVopOve+w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VNlNOsJdKqMVmL2GmYa3QHKRtvm7dyJZZc4pUNRgt5g1SokFBzRlpPMeafpflqFgjAPHS4nf4Yxx5p9w8C//OU5eb7vQHkcyYHuv9B7tru/u7hverH6bTdj6XsF7ORM1pb9veIo91xc4dzDNS0AjXfkFMIISTtDCRuLNSqFtwvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RjROIzck; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a26fa294e56so219790066b.0
        for <linux-leds@vger.kernel.org>; Thu, 08 Feb 2024 02:51:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707389473; x=1707994273; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NMj5ThiHRpbbuXvAGdGteoN3UKted7904wELWNQQTWI=;
        b=RjROIzckzayTSkK3Wc6fDksT7gPEkJCVZJbMC939QHlNHeEl2SC1Fez9BGGz5puFRe
         tF3Yxo4Z3GUvJKBPzILsz+0jsTLTvvhEGZE/XTQeB+oeX2JYYFp5uvhH8XumuBZ3KXlF
         TozZDE5RF0ppmCRL5mlIj59uRSX2Dwc3xoHd+Py+j1yBWPv5v77VfrLLJIw4KLX2BPFQ
         FxELFWSv9UbpbCnBZ/zCwTILd3DyF9WGafQgFFl7nCTRLMUw9QN/7H18wtcfUUndHCoU
         q1bi6kQ3rikmaIjXvcwm1CYWPg68aBRLutsgtLURD3wkid9NObWggJQnjgOnHjS9pqjx
         fBGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707389473; x=1707994273;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NMj5ThiHRpbbuXvAGdGteoN3UKted7904wELWNQQTWI=;
        b=g6PKvaQamkbCHpohPUb2Ms0t8Ct4q5oYrkC0Q8BBSrJ2sKlp+RMnfSsgSZq6Nn8XTb
         419dnTWAGCUY5DRqi74NKgDSyv4+54OZW/POn9oE1Fme3G0N1OL6/xjubw5KCB/vnycw
         de00LEONbK1/oLIc0rH9StJwT/0Ai+MMkBAMmWZzdcFEZQ8iGj3Y+90edbP0PTIvtIg1
         AIUaMZlBiwdnY1qH5RkMGIXcX2H62vuUArEE1FxE5oBy9C7gy4sbVsvycR3PetSuL7cW
         w/BHfA4qx3889vaVBBjmMcmo3xaKMVJcjAhGbU/FP6B8FLEbA4QLNqBq9cD4YWlVQ/vt
         TYSA==
X-Gm-Message-State: AOJu0YwxWS8swfjc/YknosZCMaYjBBHlreh41vZa3za3Q2QKxi+XjOlE
	gtYqu+xZRen3bYfdZQis7VtyZ2ZtXUiWAP9XEZ05M+cA2vzubTXn00Byt+iK
X-Google-Smtp-Source: AGHT+IEUo8/unFEHh7WHQw6S/P4o7tWYZ4Hr897bq7umNCyQCA9i5NmjwUA1u44nYspP3TYGmsCmXQ==
X-Received: by 2002:a17:907:f99:b0:a3b:a8b7:d019 with SMTP id kb25-20020a1709070f9900b00a3ba8b7d019mr806608ejc.77.1707389472947;
        Thu, 08 Feb 2024 02:51:12 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUC5M992lYHnecZ9KHOQOFkDkxlv2zO+WwqyyEAcwOe4ooh71ZhRiRurF6qhFlClWWgKeXlOwQluV+lpbD8t85/xBomqXNhrIVmbQ==
Received: from ?IPV6:2a01:c23:c599:8500:b9b1:3254:a1ac:4417? (dynamic-2a01-0c23-c599-8500-b9b1-3254-a1ac-4417.c23.pool.telefonica.de. [2a01:c23:c599:8500:b9b1:3254:a1ac:4417])
        by smtp.googlemail.com with ESMTPSA id jx16-20020a170906ca5000b00a38259eec59sm1783745ejb.144.2024.02.08.02.51.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Feb 2024 02:51:12 -0800 (PST)
Message-ID: <f52e2e04-86f4-420c-8a1f-2bf29ff56ceb@gmail.com>
Date: Thu, 8 Feb 2024 11:51:13 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: (subset) [PATCH] leds: trigger: stop exporting trigger_list
Content-Language: en-US
To: Lee Jones <lee@kernel.org>
Cc: Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org
References: <ca185fb1-3a66-46b9-920e-bfecbe39c6bf@gmail.com>
 <170738775519.907987.8656098604510646583.b4-ty@kernel.org>
 <20240208102340.GE689448@google.com>
 <648b58db-6fb0-4b9e-8d63-ecf193f2e38a@gmail.com>
 <20240208104555.GH689448@google.com>
From: Heiner Kallweit <hkallweit1@gmail.com>
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <20240208104555.GH689448@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08.02.2024 11:45, Lee Jones wrote:
> On Thu, 08 Feb 2024, Heiner Kallweit wrote:
> 
>> On 08.02.2024 11:23, Lee Jones wrote:
>>> On Thu, 08 Feb 2024, Lee Jones wrote:
>>>
>>>> On Wed, 31 Jan 2024 15:30:53 +0100, Heiner Kallweit wrote:
>>>>> 682e98564ffb ("leds: trigger: panic: Simplify led_trigger_set_panic")
>>>>> removed the last external user of variable trigger_list. So stop
>>>>> exporting it.
>>>>> If in future a need should arise again to access this variable, I think
>>>>> we better add some accessor instead of exporting the variable directly.
>>>>>
>>>>>
>>>>> [...]
>>>>
>>>> Applied, thanks!
>>>>
>>>> [1/1] leds: trigger: stop exporting trigger_list
>>>>       commit: 6171582edb46889769d994cca81cf0f0fdd8c66f
>>>
>>> I fixed the chechpatch.pl error for you and changed the subject line to
>>> match the format expected by the LED subsystem.  Please correct these
>>> yourself in subsequent contributions.  Thanks.
>>>
>> Sure. What was wrong with subject line?
> 
> Descriptions after the `leds: <device>:` start with an uppercase char.
> 
> It's nitty, but consistency helps me sleep at night! :)
> 
Ah, ok. Thanks.

