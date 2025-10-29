Return-Path: <linux-leds+bounces-5935-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id ED5B0C1A782
	for <lists+linux-leds@lfdr.de>; Wed, 29 Oct 2025 14:02:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D938B503C8D
	for <lists+linux-leds@lfdr.de>; Wed, 29 Oct 2025 12:55:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A455346774;
	Wed, 29 Oct 2025 12:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MTdj887y"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 085B93054E8
	for <linux-leds@vger.kernel.org>; Wed, 29 Oct 2025 12:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761741013; cv=none; b=e5oDJfWZrtMDGedP+l+Ma7k0pYxODouInfJEH0bv4vPaK3LBWFoJbJeVkDWSQSr7zW2TDZSD2HNUR7tR9QDq9nv2A2YNDq1ViAsK98p0GMoOOWbmKSB/3aCTW29TSZ0JYZoXSSIQVKXQK3UGaePb4TmluP5PTbAnWhMHMvcO+38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761741013; c=relaxed/simple;
	bh=yfVwVTerZPk2NHZzlK1pqB6FPkQ/oXmjoq1IP210Xts=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p85LIQkbU4c7t9BNxYkoTcc+SEmN14PKvhIaMHTHNJfFdNbrW1qcgcGze49Z6VFqQlL1MbSkOlGCYVcOsxNtfIYoXLPQS2yupRZ0jClA45Lhgu7z1+wDPcbOmBx/SyEUVOqWaT5so5ExFGszyJ5QGYpih6LPbipNeaBoGh6JTQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MTdj887y; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-57e8e67aa3eso1492225e87.1
        for <linux-leds@vger.kernel.org>; Wed, 29 Oct 2025 05:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761741009; x=1762345809; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ui8ftKpD8oJJMrnzjOA4xyfnszlxAAkwMFpTMiFGLGY=;
        b=MTdj887yxeCcg1+C9KOyxLpebLhYr4D3K4eae5EfsfBGLwZZaS7Uj2ic8cnzWCTU7c
         IzDZJTUda9Dvxy9J5Ui1yoEikVYbDqL39O+PKS1dezNKm61QNf1wZNBlcM+VNzQJtXnI
         5XNeIjnuk0QhhBptDvDRRgmbQJn8DvHYe/mdGW4jDNXPOtGvVQfUmBGu07Z6Zz+d06eN
         cxaQvO57e9cHFFKyixZfLrNOowWwpk+t9vnwkrlIffJV2SxKUUSMPK026sep3ZpeneqU
         Ea5iLQsvlqmiCfkltQzcYCnop2zDNCtCpJG0JV8WdaZZC9THxxsag1m5tnOCP2COdXTs
         Mxog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761741009; x=1762345809;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ui8ftKpD8oJJMrnzjOA4xyfnszlxAAkwMFpTMiFGLGY=;
        b=XC7VKU9vCXRU93qrYIjnoWfPVkoIhXpVOkTDj7Qh1/tGeyjyIGNIjmMXs1P+SBzcrY
         vs4vD81DJOrsx/3EB4Ev/I2oQv0UYhCmQ/Dm7yLpvZdV4WTBghcCRBLLI+UNI8PHGTdJ
         W4O0Ufv3RA+1gl5jnKDSEuDyfqFqa155OQEnv4zKPj2FokYeG6DWkXiSpZHSaBVWtikC
         zEHoqbm+BGsvk2Bm0VkkbL6RAs0m1zy7ZDvNW2YGXmBU1DisMce94ggtkdgqPODJr8ir
         Jv46ZXD857rEcpLabYYUK0QPBfBeDdQwnRVBWLv2s75/95chOdrWSFoe+EuhOO36mml6
         0FHQ==
X-Forwarded-Encrypted: i=1; AJvYcCUbuBXK/bX6InkfW4B66h522s5qshXtjpJuTwjt21wQy8u2MiS1N2MWWa934E7zxdwmoT4uDkPaf9XH@vger.kernel.org
X-Gm-Message-State: AOJu0YxsK9pl/VaAgA8qS+TI3ObZakUJDOTgjiT/pWngnO+xaNnAWSWk
	2I5/GX44IOuyy04hvkhlVyiOB6+XGNFD2eK2FGyTnW0zZOloElERhVW+
X-Gm-Gg: ASbGnctFIsLwFSuRtXgZIOBu1b66iU29NYFmjuT4dbAKvQW/ws3TNQ4sExRzEEDQxni
	Zs9RDDYvQ7Wj64sCj2Wcr3ZnAe12BTbqixwyMJybJxJ3iDDRI40OmU1yAuxLYLkNmsRBWwv7Goe
	3Mnb56S7wQRXE4ci/pwNcGZY0lxWiz6gaZiaOXl6rZptSbSp8X6gihkdEa6Yp/rYuG1jdQ5dbke
	0XCSKqY0aZHrUqJw9+l08qeKnHcHjg1CLu4jeKjZ3HoSQ3ZmbJy7fOfoxHKvmFc4k6Z8SBe2bid
	cojhrfm1SL4ZzROp+oHWANaRR8g7zTH071B69mQK0du+MPxlEcAaoSDgfkYRwnNqB2uK5+4yTBA
	z0JYQ+e1mC23+xf/ttXf52N8G+44x+55NfMgVoy54fBmmBz4PWNCc0Ym1z+BNdiwocM0ksZUM85
	RDeNPVuBlA+A==
X-Google-Smtp-Source: AGHT+IGoOBmpR56r91eNxNa3niN5na4xSuldumEKqunNvTbGH3/QMdmFRTjv+fJgOEfNR9uGhYfhgA==
X-Received: by 2002:a05:6512:3a8e:b0:591:ec58:ec7c with SMTP id 2adb3069b0e04-5930ee07801mr2415382e87.25.1761741008581;
        Wed, 29 Oct 2025 05:30:08 -0700 (PDT)
Received: from [10.38.18.54] ([213.255.186.37])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59301f50a7asm3782619e87.34.2025.10.29.05.30.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Oct 2025 05:30:07 -0700 (PDT)
Message-ID: <8b5dbbf6-bbde-4015-b0d1-12d6ec770ceb@gmail.com>
Date: Wed, 29 Oct 2025 14:30:06 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/15] dt-bindings: mfd: ROHM BD72720
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Sebastian Reichel <sre@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Andreas Kemnade <andreas@kemnade.info>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-rtc@vger.kernel.org
References: <cover.1761564043.git.mazziesaccount@gmail.com>
 <a5957c4f83724d4f32527fb892fc340af4eeddde.1761564043.git.mazziesaccount@gmail.com>
 <CACRpkdYEUdJRvNPKhxx7orYHH3OE6BXXjrG9JVJo5MDHGKE88A@mail.gmail.com>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <CACRpkdYEUdJRvNPKhxx7orYHH3OE6BXXjrG9JVJo5MDHGKE88A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 28/10/2025 00:42, Linus Walleij wrote:
> Hi Matti,
> 
> thanks for your patch!
> 
> On Mon, Oct 27, 2025 at 12:45 PM Matti Vaittinen
> <mazziesaccount@gmail.com> wrote:
> 
>> +  rohm,clkout-open-drain:
>> +    description: clk32kout mode. Set to 1 for "open-drain" or 0 for "cmos".
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    minimum: 0
>> +    maximum: 1
> 
> I think CMOS is the same as "push-pull" ( I could be wrong, but I think I've
> seen that before) so I would probably try to use the pin config standard
> names as strings here but I'm not sure.
> 
> rohm,clkout-bias-open-drain;
> rohm,clkout-bias-push-pull;
> 
> Mutually exclusive.
> 
> Or maybe use the pattern from rohm,pin-dvs0
> with string enumerators?
> 
> rohm,clkout-bias = "open-drain";
> rohm,clkout-bias = "push-pull";
> 

Hmm. I kind of agree with you. Still, the way it was done in this patch 
is used by the other existing ROHM PMICs (bd71815, bd71828, bd71879). I 
am kind of reluctant to support another way in the same driver - and I 
am also reluctant to change the existing bindings as that sounds a bit 
like asking for a nose-bleed :) (I've in the past worked with some 
devices which didn't update the device-trees when kernel was updated...)

Do you think you could live with using this existing convention? :)

Yours,
	-- Matti

