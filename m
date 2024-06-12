Return-Path: <linux-leds+bounces-1881-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DE3E3904B6C
	for <lists+linux-leds@lfdr.de>; Wed, 12 Jun 2024 08:14:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7751E28506F
	for <lists+linux-leds@lfdr.de>; Wed, 12 Jun 2024 06:14:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3FDA13CFB6;
	Wed, 12 Jun 2024 06:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="h/e2MtQW"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25F16155340
	for <linux-leds@vger.kernel.org>; Wed, 12 Jun 2024 06:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718172787; cv=none; b=Ih8qHRYt9ojv6tyMVOd/yMaBPz++JyOx1HZlHwX1iUbq7TGnJR5ZllH/ePPAmmiOukFicO+NTrtI4UcX179kQJk40FQYPrDBZFnwo5xACUtxxJGJlGecsQBFyMCmC174IrYDOzMyx/JLk4HvLhvR0DI719NFizqAMQuMaCzYBe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718172787; c=relaxed/simple;
	bh=eSLvOmalzdcJlCBTYgSLmcvJpyhgU8wN7sUtelwJmB0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KdLXgs1eRdwERHKi7t/ULfyVSYk4wkr6/+sCzzdWOC3MEXH7ZvzO1oa87eiVY8VulUgXJWzwI7HW3/4KWq+8SyPOTXzGQJJvX21nHUfYQI5WGqHe9oh3Bg5IOFLLd+7r4mbrjJgOy0bpG+7EqA5B1DRQiRVXTZOJia8mHIpC5+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=h/e2MtQW; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a68b41ef3f6so729318066b.1
        for <linux-leds@vger.kernel.org>; Tue, 11 Jun 2024 23:13:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718172784; x=1718777584; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=H+0nSB8ZtcBhQ3V/YzOcmbm9Frlqarxiqy6OjKZhljQ=;
        b=h/e2MtQWB9W814xMflzTB/gL3AcBYWTEOdYg0Jf+3gNuNLjzQBD9QwpnppiL75+M+j
         XeNDAagqxHkQDwfI17rt+eCS0lev/1b+JKEc3YNY5unh+E7F2bwOcaQn/cfOTdeVlbW6
         OMweAquf6FafiEshyVItZYfUmVMH37MoYeCQYxXYB7SaxnTJWlRPSK0MkTsmVDT2Vx3G
         whoarU30hRfTyKiuaK6QJJyw5RRI3+XnIqy4UbbglsAmFN4r0szovpOaDDXRxK0PwmA7
         FTB53Yt/cxC807hCAXwfwhNlEo/2D9TcV+QGsHtxC6YipfRiKV0wiml4gwIdLafDdhRj
         Qu6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718172784; x=1718777584;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H+0nSB8ZtcBhQ3V/YzOcmbm9Frlqarxiqy6OjKZhljQ=;
        b=lt/BGHgvjLzyipbrP6qeMn8IFMDUoqrvoty+KsBhBu7WdtmPVDjVyQ/p8ealz8kl6E
         Fb+prFkKvRT7rKoWKGQZDepJ/eL82/NB+O5e7l9ODEb59EUCfxWi0LlBCeKBkbAujOSS
         rKtK+xoGmQpPoVp/8Xwsc9Y2/F0Cp04EgFfDO7BCKfBq8gj5b6VlL5WjVjDQzl5/s3um
         IRSVy/JBC4RpNQ6+pk3ILwVQ/Rb2ri5bNngmw68yQIRJwDeU5SRo3XxjB7SToWO57P/o
         kKfCe89WYs5zODQpyeot5BTBYhfXd7u9n0QZdNkNAREOgeue+z02nJ49NzRjh45PnyKy
         H/6A==
X-Gm-Message-State: AOJu0YzzLbT2BekiXp8AeJCV+HzWTypbVAPAop1pHa97PuYW1Aa5DzMY
	pU+QylvYmvd2BDGwPP9y6ytKKLIYAewFSR6B8QHnbgNe6jBVXZmfT7+gtBeIICY=
X-Google-Smtp-Source: AGHT+IGLmBCp9E+RgQKpYewKejbd5sntmqSWXLiE4LchETy2v6Ls6ZOIR6j/wWm4RHGRwX4C0RtyAQ==
X-Received: by 2002:a17:906:b2d5:b0:a6f:27e2:812c with SMTP id a640c23a62f3a-a6f47d524abmr40862266b.22.1718172784413;
        Tue, 11 Jun 2024 23:13:04 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6f000a11c0sm546716966b.66.2024.06.11.23.13.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Jun 2024 23:13:03 -0700 (PDT)
Message-ID: <e7052800-d787-4b7f-a3f6-fc85359ab763@linaro.org>
Date: Wed, 12 Jun 2024 08:13:02 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 0/2] leds: Add a driver for MP3326
To: "Yuxi (Yuxi) Wang" <Yuxi.Wang@monolithicpower.com>,
 "pavel@ucw.cz" <pavel@ucw.cz>, "lee@kernel.org" <lee@kernel.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "wyx137120466@gmail.com" <wyx137120466@gmail.com>
Cc: "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20240611083236.1609-1-Yuxi.Wang@monolithicpower.com>
 <170c14c9-e1c7-4252-a550-4f9a8cef3a27@linaro.org>
 <SN4PR13MB53105EE4DEB0E5EE42160627F6C02@SN4PR13MB5310.namprd13.prod.outlook.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <SN4PR13MB53105EE4DEB0E5EE42160627F6C02@SN4PR13MB5310.namprd13.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/06/2024 04:26, Yuxi (Yuxi) Wang wrote:
> 
>> On 11/06/2024 10:32, Yuxi Wang wrote:
>>> Add the binding description and the corresponding driver for
>>> the MPS MP3326.
>>>
>>> Signed-off-by: Yuxi Wang <Yuxi.Wang@monolithicpower.com>
>>>
>>> Changes in V2:
>>>   - Fix patch format error
>>
>> Only this? So all other feedback - like 10 comments - were ignored?
>>
>> Sorry, please go to previous discussion and implement entire feedback.
>> Then document in changelog what did you do.
>>
>> Best regards,
>> Krzysztof
> Hi krzysztof,
> 
> I think previous discussions can be summarized by this log.

No, it cannot. It tells me nothing.

> 
> Ok,  I will write all my changes in the next version.



Best regards,
Krzysztof


