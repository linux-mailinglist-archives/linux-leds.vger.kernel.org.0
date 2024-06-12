Return-Path: <linux-leds+bounces-1880-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C88EE904B61
	for <lists+linux-leds@lfdr.de>; Wed, 12 Jun 2024 08:12:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3E2BE284DDC
	for <lists+linux-leds@lfdr.de>; Wed, 12 Jun 2024 06:12:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AD5513CAA4;
	Wed, 12 Jun 2024 06:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CoGld2Vr"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A11AA208A4
	for <linux-leds@vger.kernel.org>; Wed, 12 Jun 2024 06:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718172771; cv=none; b=SDzyypfzkop3vWfAhTGoT4L529y45ANB84zhLPhKmgPZNvlg3yS9fhz5TJ74l84rJhpGAKB9ycUbF6YGFfR27ESS5TK7nAtihlETrzgP/+FmqZWBLeEcUoxcUx9wxI2Rb6BRzziIsRAS7+EQCqvQ1jtl2LCniF8tOxDcCtNd7yI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718172771; c=relaxed/simple;
	bh=bMHNn5K5SdcsmFeGjk+EH0zYqXn/MYJ+ePkN09KC/PI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IxH7SIJLSzLg0KRD88M3hQV2RFSLseyZSavny9TMey0AsjetVM2EbMGO7hmjGriBLz0PL4AenfZi5l8680utBScICkZitquN25YAnXNnivMCqmHa2b/XpTC+hhWi7QwlA9/jQcAVsFdrzrWm+a31ekhWGBsleCy4OIDuaaZkbDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CoGld2Vr; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-57c68c3f8adso2330849a12.1
        for <linux-leds@vger.kernel.org>; Tue, 11 Jun 2024 23:12:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718172768; x=1718777568; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=g5h7rK0sr+2BxDz/k9zC8M7ipcnnpqL/bNRXKRcGg18=;
        b=CoGld2VrgUUzAEX4FisL2Ee2H1ekfSLcYRELx3FhQjRi0ZEVTAgDKns1CetdNhffQd
         pzs6t++8a65/d0RrFLLjpm2EKWNzqKczGPDek+zSmyzC0Ulx39G0B2SwGtp+OyzRn7jl
         MSuKrX8H7sYfLHQTi/9XFHskPYDnD5mKv115+ULTV+epvgfuNKGURrLGaa2k0JHCzyI6
         j2VuSPZjcuwVWlu5m/F5LtVtC2H64Wvd+XcM8oXZ/gFsyG1hSG9OLLWHL6PKm10dVAku
         rCSu4GDMqXifn4hlLmrlkGU6ZmM5xilqgE693HGAlRYCSyAI7j2FoojLy9fUaCAKHAlD
         5UkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718172768; x=1718777568;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g5h7rK0sr+2BxDz/k9zC8M7ipcnnpqL/bNRXKRcGg18=;
        b=IuwTFQ/RdsF/UTTSfyKorQ/jCGXN39SWtj+8HqWr1VCENqEIVutyZYoMJjwBWr0/KR
         QQbLbA2Q7Aslz0tNnrfs3JdAk/GcSQHW6Xmg32EY4/ME//QFXqgiHC40LbMQYhDrQO52
         Bf8mYVzppxVwVoyoW+f+dnxTFqA46XvslXa1YaJ1IRI3GnXJwIlL9m4DOawAFAye3a2m
         87z/dfi96kiA+bgjh5W/ChBCosOYC0UswEGQ8hIBKs/0DH/XZ5Yk5uJUZvzXauSzECBO
         eTAK82His5yBiY0Bh0dbY+ZqLHtHKH2+LgO2cx0vs9gdMOSorOhjkIvMYznv5E0NVWpi
         uP3w==
X-Gm-Message-State: AOJu0YysoaOZzqArB4p64x1PUt4wAK+ARWFINLhCcrrIEjg8/ybaGkKk
	dJ5ICevMw7fC36OGnW3gINSKpislzK5hY9BG+WRX7sNVPa2pGwOSVnywkglqOaQ=
X-Google-Smtp-Source: AGHT+IHN7OLZJUykbo/Z/aU26XIBCzrO1SYvoeEqCSDfm2b0Ciy65f+R7CfT6NO0SIhfkE7duxBVzA==
X-Received: by 2002:a50:d494:0:b0:57c:ad11:e759 with SMTP id 4fb4d7f45d1cf-57cad11f283mr293326a12.28.1718172767944;
        Tue, 11 Jun 2024 23:12:47 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57c55d8aca8sm8664613a12.97.2024.06.11.23.12.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Jun 2024 23:12:47 -0700 (PDT)
Message-ID: <c99d8df2-84ce-4b26-941e-b8a1413b8156@linaro.org>
Date: Wed, 12 Jun 2024 08:12:44 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 2/2] leds: add mp3326 driver
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
 <20240611083236.1609-3-Yuxi.Wang@monolithicpower.com>
 <c510fd3f-a55a-4ac9-bbc1-d2392027724c@linaro.org>
 <SN4PR13MB53103D139D9F816E5F4930EAF6C02@SN4PR13MB5310.namprd13.prod.outlook.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <SN4PR13MB53103D139D9F816E5F4930EAF6C02@SN4PR13MB5310.namprd13.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/06/2024 04:23, Yuxi (Yuxi) Wang wrote:
>>
>>> +/*
>>> + * PWM in the range of [0 255]
>>> + */
>>> +static int led_pwm_store(struct device *dev, struct device_attribute *attr,
>>> +			     const char *buf, size_t count)
>>
>> Nope.
> Hi Krzysztof,
> 
> What do you mean this Nope?
> Is it  format or function?

As sorry, you are reimplementing kernel interfaces, so that's a no.
> 
>>
>> ...
>>
>>> +	}
>>> +	r_val = r_val * 255 / 4095 + (r_val * 255 % 4095) / (4095 / 2);
>>> +	g_val = g_val * 255 / 4095 + (g_val * 255 % 4095) / (4095 / 2);
>>> +	b_val = b_val * 255 / 4095 + (b_val * 255 % 4095) / (4095 / 2);
>>> +	if (led->num_colors == 1)
>>> +		return sysfs_emit(buf, "0x%x\n", r_val);
>>> +	else
>>> +		return sysfs_emit(buf, "0x%x 0x%x 0x%x\n", r_val, g_val, b_val);
>>> +}
>>> +
>>> +static int led_enable_store(struct device *dev,
>>> +				struct device_attribute *attr, const char *buf,
>>> +				size_t count)
>>
>> Eeeee? store to enable LED? Really?
> Yes. The users need this function and we provide it.

NAK, I don't care about your users. You re-implemented existing ABI.
Without any ABI docs that's just pure duplication.

> 
> 
>>
>> ...
>>
>>> +{
>>> +	struct led_classdev *lcdev = dev_get_drvdata(dev);
>>> +	struct mp3326_led *led = container_of(lcdev, struct mp3326_led, cdev);
>>> +	struct mp3326 *chip = led->private_data;
>>> +	int ret;
>>> +	uint val, i;
>>
>>
>>> +
>>> +static DEVICE_ATTR_RW(led_pwm);
>>> +static DEVICE_ATTR_RW(led_enable);
>>> +static DEVICE_ATTR_RO(led_short_fault);
>>> +static DEVICE_ATTR_RO(led_open_fault);
>>
>> No, for multiple reasons:
>> 1. Where ABI documentation?
>> 2. There is a standard sysfs interface. No need for most of that. Please
>> explain why standard interface does not fit your needs - for each new
>> interface.
> Hi krzysztof,
> 
> 1. Where ABI documentation?
> A: 
> Sorry, the abi is insufficient.

Which one is insufficient?

> 
> Can I add it as comment above the function?
> 
> 2. There is a standard sysfs interface. No need for most of that. Please
> explain why standard interface does not fit your needs - for each new
>  interface.
> A:
> Leds has two ways to light dim. One is analog dimming, another pwm dimming.
> They are different in practice. 
> 
> In RGB module, pwm dimming can control color and analog dimming can control intensity.
> 
> Mp3326 supports the two ways which can operate contemporary.
> 
> In practice, I have needs below.
> 1. Operate rgb color and intensity.
> 2. enable/disable some channel
> 3. short/open fault notice.
> 
> However, The standard interface only has three functions below, they are not fit my needs.
> 1. multi_index
> 2. multi_intensity(only can dim using one way, so I use it as analog dimming)
> 3. led_mc_calc_color
> 

Please point to which ABI is not sufficient.

> 
> In order to fit my needs, I add the interface below.
> led_pwm       
> led_enable

Because especially this one sounds like you are mocking us.

> led_short_fault
> led_open_fault
> 


Best regards,
Krzysztof


