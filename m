Return-Path: <linux-leds+bounces-4729-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2022EAC78B1
	for <lists+linux-leds@lfdr.de>; Thu, 29 May 2025 08:31:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BE8D61C03A9E
	for <lists+linux-leds@lfdr.de>; Thu, 29 May 2025 06:31:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14F1620E021;
	Thu, 29 May 2025 06:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yQeTN6q7"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18FFA13D8A3
	for <linux-leds@vger.kernel.org>; Thu, 29 May 2025 06:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748500283; cv=none; b=JKpBy1S7zHROog2VFgcf2Cp5saOLo+0k0JhryiQm0adkz6ZqWX+efrwWgUWBkm+bifSkWIQ0w51O4QWM5w/XQxyxYmg0iUra9f3HaeKhkkbeirFVXy1a+Zk9gsF/yNv9Pm+YkE/3e4YW6D0eYXVck4/Cv0YtICVMQ/9XojByDB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748500283; c=relaxed/simple;
	bh=j8BqjmjHZNv71a5DNyE9aKkxJqPzWFLn/6qs1DPKhuc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VtS9m9STXO68WGhXB+eZYxEe4gXUxo0M5r4nHR44qBvMTBwsLIrvCr4KMjOVXR7GVk+1VvGaIo+F+OMoYgoL2Q73OshEf1PjT+ic7NJ4vTfnyqhGvLOZpJ3fHWxDSLZ/CvHLssE7ElY3CKi77Ymo3odvhxBhUQHRITACaO8gVh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yQeTN6q7; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-60462031113so113606a12.0
        for <linux-leds@vger.kernel.org>; Wed, 28 May 2025 23:31:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748500279; x=1749105079; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rt6mhCx+Xta4pmHm0wtc8Qz2ggrm33jLnwirmmfkTiM=;
        b=yQeTN6q7zQAG1AVIIuU3mZTZ3x3/RBONr/Xz0AbM+dmGuZKpJo+z6O+hSF23vXwZn+
         aEnKLGZNtKNyWpkVWakJ/ImUV9M8CRBMIWcKA75oq5iV40p5haf4m9EtyqM2DdbgK6E8
         DAwC6x3yQ62SytDc1TVarnKLuFitwPlLKz7RjdlxIvgssTfon89Sdp6lxkdZxag7BlAd
         I17uoQJ58YMtxhAgKEm8b5R45pV5nCD/zoq5QIL+Fis3dUi1c5WmCdhWNaA5DkuDTGvp
         yZ/giVOyofizM3q8m4bNk1G+zYTDwo9jUQTSw+hdQTJVoOXwuxf3xU3C7i6xfGTvEbXR
         qwTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748500279; x=1749105079;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rt6mhCx+Xta4pmHm0wtc8Qz2ggrm33jLnwirmmfkTiM=;
        b=U9uEjvSklkoxUV2nO6M12bM9S1K0rJvofRCW6eFRXx6vX8U/jIPPoPf4S2R4T1UWy/
         9AL7UzbSOqjXLLN0fzadc0kck/h61HhIkLYPFRmpxRUMixx1URdylLYP30gQJ+L/9bvc
         0lDvwr7GTyVcuWWX5bG3oRw00I3w5k9V0ZH5AqdyF7+hiiXouRz5u8wqQ4t5OnVuf25c
         LYHuJN31l5PnTQXPHzAl8vP/txYnnJKnPvsHovrAIpi3/VhzqtQIkx4ZuTHedYX4Cp3b
         HqFXlcMTSrGMQ87puVjZ8wSxKkvv9k3RDZ3C2+EBl2pyLg972G1NauEWkzm+9QUp05ZW
         0EKg==
X-Forwarded-Encrypted: i=1; AJvYcCXZ9lfRw5jIxNCCX8vreJgbevSM860/Ao1Gtt3u6lmb8zUo4rldy/LSXjWLuixmC8rR2g9fSJX9Z553@vger.kernel.org
X-Gm-Message-State: AOJu0Yxz81WBlJwhH4lD6e0ODUOIzKCNTKa6rZQ0E53Luu4BIS8IU6Qt
	rygFSkqjk3isWL8L/C/ACCiBa1lcyEdaRyZRz8QVYcA3jub7UN4MGhr72MSl5PC+BdM=
X-Gm-Gg: ASbGncuyjeahurE901rUqCizTBKrJRdzXphQkKnGbG1l4xoeJ64+XTQBMVFK/5oGLRR
	GmesUEecOuQqY2D61mTz7Fw9/lrYeuRfUP0FmshsGglCBm+xJwgQaC73/Js0cx+Kqiv3Rz4h4kR
	ApvETv2bGw5p3CDwws+IvZuRZbWf79BeKh6bo8z/HsdlIqmKIMbiRO+wIl5DW8b0g+ZYZ/w++OP
	mys9a3CUvZH2CPrOE8IeJQD7XPm4UaCCk8qYrDpwXgrukXzOqbTcVQu+ldhFkKmrXQc/ubRDWw6
	ofHPhfJYN2zF1hb+wukjMXZm4VVW/DceRSCf6qb/5RFZA5RRCu/7eDrvxMstTCOmJFmz0u0=
X-Google-Smtp-Source: AGHT+IHBoTLt2zj07UfvDpduyo6VwGS6VJkEDnEAwKaxoqBhRhFaLtslOtTaIwBlX2xZrWOmGrIukw==
X-Received: by 2002:a05:6402:51d2:b0:602:a0:1f27 with SMTP id 4fb4d7f45d1cf-60518ce9f36mr1664563a12.1.1748500279313;
        Wed, 28 May 2025 23:31:19 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada5d7fee1esm83489266b.25.2025.05.28.23.31.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 May 2025 23:31:18 -0700 (PDT)
Message-ID: <8b2f664d-8e89-460f-a8df-d3fab13fe889@linaro.org>
Date: Thu, 29 May 2025 08:31:17 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] leds: flash: leds-qcom-flash: Fix registry access after
 re-bind
To: Fenglin Wu <fenglin.wu@oss.qualcomm.com>, Lee Jones <lee@kernel.org>,
 Pavel Machek <pavel@kernel.org>, linux-leds@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
References: <20250528194425.567172-2-krzysztof.kozlowski@linaro.org>
 <42be0934-2e97-4d02-98df-b5a03195e8ae@quicinc.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <42be0934-2e97-4d02-98df-b5a03195e8ae@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29/05/2025 05:11, Fenglin Wu wrote:
>> -static struct reg_field mvflash_4ch_regs[REG_MAX_COUNT] = {
>> +static const struct reg_field mvflash_4ch_regs[REG_MAX_COUNT] = {
>>   	REG_FIELD(0x06, 0, 7),			/* status1	*/
>>   	REG_FIELD(0x07, 0, 6),			/* status2	*/
>>   	REG_FIELD(0x09, 0, 7),			/* status3	*/
>> @@ -854,11 +854,17 @@ static int qcom_flash_led_probe(struct platform_device *pdev)
>>   	if (val == FLASH_SUBTYPE_3CH_PM8150_VAL || val == FLASH_SUBTYPE_3CH_PMI8998_VAL) {
>>   		flash_data->hw_type = QCOM_MVFLASH_3CH;
>>   		flash_data->max_channels = 3;
>> -		regs = mvflash_3ch_regs;
>> +		regs = devm_kmemdup(dev, mvflash_3ch_regs, sizeof(mvflash_3ch_regs),
>> +				    GFP_KERNEL);
>> +		if (!regs)
>> +			return -ENOMEM;
>>   	} else if (val == FLASH_SUBTYPE_4CH_VAL) {
>>   		flash_data->hw_type = QCOM_MVFLASH_4CH;
>>   		flash_data->max_channels = 4;
>> -		regs = mvflash_4ch_regs;
>> +		regs = devm_kmemdup(dev, mvflash_4ch_regs, sizeof(mvflash_3ch_regs),
> 
> Minor: sizeof(mvflash_4ch_regs)

Copy paste, thanks.

> 



Best regards,
Krzysztof

