Return-Path: <linux-leds+bounces-556-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 76BE38282A0
	for <lists+linux-leds@lfdr.de>; Tue,  9 Jan 2024 10:02:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8404BB24229
	for <lists+linux-leds@lfdr.de>; Tue,  9 Jan 2024 09:02:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8C262FE09;
	Tue,  9 Jan 2024 09:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IvlVN49Z"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03BE82E636
	for <linux-leds@vger.kernel.org>; Tue,  9 Jan 2024 09:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-50e8ca6c76dso2867731e87.3
        for <linux-leds@vger.kernel.org>; Tue, 09 Jan 2024 01:02:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704790925; x=1705395725; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dmKJthFhVOou9KKrVg2JFMqpT7yA4StgzCUJOH3eEHA=;
        b=IvlVN49Z8G4qM0+cCTLtOdwdUZ5ske2Q5c3sR6Pb9IdWPyi/msirCsA4lyuQrpk2qk
         ixW4HlikZXbNM2ytSl49evE+uw9RPZN9ovJfeIOMQyqLiZvpOvAqPlkINGtUAx6I9wFX
         wG3AAOL/gqx8QyGuAhM2zZ+9UQaIPtFf9byDXzm0HIdUQEe+Q5iliNLBDP0Gy0LKeywS
         ya7ieU0duA1KJ8mMQS0frgl/y7Eo42Xoaf2zU1282s71sDLY3wR0fqtzDw0jtIlKsm2a
         f5hpNe8bSjHW0+Du1VKaJd6qFVnDR6MXW13uvwyt7rBAuyzziMi8tRCdorgeEzzgylj7
         hFTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704790925; x=1705395725;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dmKJthFhVOou9KKrVg2JFMqpT7yA4StgzCUJOH3eEHA=;
        b=JhBPg8vcLKsxsT5cKjJY1c5RJ7Ne4YDirQW3tkhfVe8+KbVeWGHhTblSsAnPWpG7XT
         l713UR7u7HOSwkJ//lE49XCgtOV8GiDY1rarcJABmQNmCmg5LM2WJjMpp/HLDl9roNpH
         AmF01p7j6iYQzmBq0iTSpskqps4FK5lvOcI2Ad8htUM2fbd4V/hoLY8ZvdUjIClkWh6o
         MD5AmPYJz1rnbHICRFr8FN1EoMJ1k5Y1eFPV9BaAnLyecDRnChs5TINyupglCTR0asLu
         QNPGHLMI1ASAQNEzVZkJoTmUWY8+kiPjUfun6Dq4/mIkZPy6PK1W6e5iR4l8qlWajyOd
         skDQ==
X-Gm-Message-State: AOJu0YwYurinaGtNElQV1tG64ZKegnZK2ezEiTZzVFK2wsfyKyU5B7Nm
	qsOu/H2ls2Xn+7Rj4XyHk8zxv3vbIXhA2g==
X-Google-Smtp-Source: AGHT+IFZs7mrQzr79oiwI8osl6pO6UORl1DU8niY3fb4O4s4/ASXtP6lUz9a9FSsu2miKXJbJiBYxA==
X-Received: by 2002:a05:6512:20d:b0:50e:76f7:a74c with SMTP id a13-20020a056512020d00b0050e76f7a74cmr1968763lfo.67.1704790924815;
        Tue, 09 Jan 2024 01:02:04 -0800 (PST)
Received: from [192.168.1.20] ([178.197.223.112])
        by smtp.gmail.com with ESMTPSA id p17-20020a170906785100b00a2b09bfb648sm801178ejm.5.2024.01.09.01.02.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jan 2024 01:02:04 -0800 (PST)
Message-ID: <1b90c50c-0a09-4627-83cd-1794dae7ed9b@linaro.org>
Date: Tue, 9 Jan 2024 10:02:02 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH dt-schema] schemas: chosen: Add OpenWrt LEDs properties
 for system states
Content-Language: en-US
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Cc: linux-leds@vger.kernel.org, openwrt-devel@lists.openwrt.org,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
References: <20240109082312.9989-1-zajec5@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240109082312.9989-1-zajec5@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 09/01/2024 09:23, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> OpenWrt project provides downstream support for thousands of embedded
> home network devices. Its custom requirement for DT is to provide info
> about LEDs roles. Currently it does it by using custom non-documented
> aliases. While formally valid (aliases.yaml doesn't limit names or
> purposes of aliases) it's quite a loose solution.
> 
> Document 4 precise "chosen" biding properties with clearly documented
> OpenWrt usage. This will allow upstreaming tons of DTS files that noone

typo: none

> cared about so far as those would need to be patched downstream anyway.

From all this description I understand why you want to add it, but I
don't understand what are you exactly adding and how it is being used by
the users/OS.

> 
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
> ---
> A few weeks ago I was seeking for a help regarding OpenWrt's need for
> specifing LEDs roles in DT, see:
> 
> Describing LEDs roles in device tree?
> https://lore.kernel.org/linux-devicetree/ee912a89-4fd7-43c3-a79b-16659a035fe1@gmail.com/T/#u
> 
> I DON'T think OpenWrt's current solution with aliases is good enough:
> * It's not clearly documented
> * It may vary from other projects usa case
> * It may be refused by random maintainers I think
> 
> I decided to suggest 4 OpenWrt-prefixed properties for "chosen". I'm
> hoping this small custom binding is sth we could go with. I'm really
> looking forward to upstreaming OpenWrt's downstream DTS files so other
> projects (e.g. Buildroot) can use them.
> 
> If you have any better fitting solution in mind please let me know. I
> should be fine with anything that lets me solve this downstream mess
> situation.
> 
>  dtschema/schemas/chosen.yaml | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/dtschema/schemas/chosen.yaml b/dtschema/schemas/chosen.yaml
> index 6d5c3f1..96d0db7 100644
> --- a/dtschema/schemas/chosen.yaml
> +++ b/dtschema/schemas/chosen.yaml
> @@ -264,4 +264,13 @@ properties:
>  patternProperties:
>    "^framebuffer": true
>  
> +  "^openwrt,led-(boot|failsafe|running|upgrade)$":
> +    $ref: types.yaml#/definitions/string
> +    description:
> +      OpenWrt choice of LED for a given role.

Neither this explains it. What is "OpenWrt choice"? Choice like what?
What are the valid choices?

> Value must be a full path (encoded
> +      as a string) to a relevant LED node.

What do you mean by full path? DT node path? Then no, use phandles.

Anyway, we have existing properties for this - LED functions. Just
choose LED with given function (from sysfs) and you are done. If
function is missing in the header: feel free to go, least for me.

Also: please Cc LED maintainers on all future submissions of this.

Best regards,
Krzysztof


