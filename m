Return-Path: <linux-leds+bounces-5934-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id A4A0CC1A564
	for <lists+linux-leds@lfdr.de>; Wed, 29 Oct 2025 13:46:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 0CD835830DA
	for <lists+linux-leds@lfdr.de>; Wed, 29 Oct 2025 12:33:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB317368F47;
	Wed, 29 Oct 2025 12:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aKusNya+"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FDD835BDD4
	for <linux-leds@vger.kernel.org>; Wed, 29 Oct 2025 12:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761740592; cv=none; b=cj9V2FQkwXH9C3D/7B6LVd9gYOsu2enb1Pd8oFBxYeo9dAPTIhvLlvhBoWqoptITQ6SZ/4d/lVbRiXyzb76P9uKYyCSj9SprpI/tTmZCXSSgm8fOs2/HHr0hDPBvl0Pv+pa0PCPHJqHJz3yLF9iBvNYXyPgmQ+o76Th84Oyx+bI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761740592; c=relaxed/simple;
	bh=4q7J4aubuQWsGwr0ektsFotDhPgrwX82ZQ+g0OMBrag=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tkFiJvSHo6PnlrEQNI7rUsXE4hN8PjRJCm3F4oiiAspmUagO1TuRdPAClcl69dUEldRvzPaNHgFK1azpTNb+1EpzgO4ZRYS/BqCzAGoBfqavMX1EK2FH0ySYqav8iXGDzi64k6WVpuJv0f4uPe+47PJWFU0Qfj9Of4w9xQzy7xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aKusNya+; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-378cfd75fb0so76359501fa.1
        for <linux-leds@vger.kernel.org>; Wed, 29 Oct 2025 05:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761740588; x=1762345388; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UwOTcdAl6vDZ/MWyMdXE0a7QobEAic8ni59wBqX8fPs=;
        b=aKusNya+J1epch69ax/IhqtTcFFpOXJlXycJ3taG2vAOmbfp5vZwMNwAwBFguwg3/Z
         iA5ZMqVWcGfEE/fkTY2j6W8/t6u/Amc3PuCCNe8K3HEP9bi88kUMQEnLT50SmA0xR8oz
         kjgeFGRrAQY7/0L/g/TilJzqMIeIakGJOXRFkr3nWwMw69QcKH4JjpCPNH/8JsOMzS/K
         G//42m3pFRCNn1P2pYqDJZZ7i0fwtn36IiINOJPRcWNJ7n5RPen4uWKfsa00ir6XNTiv
         s4+BR3zF4LXbN2b/x5+DHA325CzYi4Y9bsxThtoQgnfy0Y14RIJAMO5CBUtgcTLfo4Dc
         lfcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761740588; x=1762345388;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UwOTcdAl6vDZ/MWyMdXE0a7QobEAic8ni59wBqX8fPs=;
        b=ECx4I7qyQQ0eRPIJw0yQ1nP9WdqBMAeB9fKfUlK8n0L/xR0XjczbpvIIoEZsjgyqsH
         g6V8tiK6p/SziibogU7fJWXdtVtsqllv33NNCQDEPm95yn1a1ksfqQt5j8qb4PgpSZBK
         PCtiENtaBAJxgwcJ3DFMaZRjxSiTD0anjHWP5G2Gq0r1iOeeyPWbDJA3zA3/ppAe1fN3
         NKR5PDPQkPt1RSyoVKPFjuO0EjMZzlF/ohn8264EC+9MjsrvpAVX8KyR1jmARB29mnWp
         uaDW9ApLrWTvLTVq55Ex+NAIRLqSFQ9H25CmDZDX3/iro8o8pcO7tWIfBtVbqnqqBhHA
         drXw==
X-Forwarded-Encrypted: i=1; AJvYcCVvytPB7+dPX6PQgb2IGwOt9bG/r/2HTq1l8DiNVXr/T9FbdDsEAszOlnKqd/kkfD5TNUE7AcKuEmnf@vger.kernel.org
X-Gm-Message-State: AOJu0YyzRtxMPe56sVoRsPcKCMnQpOoSUieHkutaEuWa+XY6/Z0ig8Un
	cXg581Af9igkGB46bchvlP2gHBIWMJqkegHkGW2pKMVWbsvOb1xczg8i
X-Gm-Gg: ASbGncufubf9/T0sTitjJZr25HBB5u81ERnn+iDjgn9GYx0TogZSBsGo2Qf/kXjAGHY
	tvmP+g8tLKShlAVTT84z6YsaW8zuXuRhGVEyFMheYeS0HJQTNfyq/a0d+Zc21j0mmlNKXlmwxSO
	x3kxVp3p5aVy4NHBnoHaPVg7wccHUnL6gNEwu5Gi7Z2m+ZwXVSS8zlVehvFIw7slXWU7LESSxzI
	a2zudBGzq5tcm7rUY51/I1So4k2W0qxhSQgx8TCgvCygtYiwnuuChTbQ1bcsPolw4uzu/cSE6oX
	HuolkXVC0WJ47VLPxdzEuWldHiw6HMTm1XU6djssbUEIvgUyQrzrzjHLi+bGjPVBfO3F5LN7cXZ
	rIpfr8dM4qOzn+L5DBHqbwduh7r3vIzd7XjTRwxPn6BnvNZ6tbn8I4vsB3+S0MBz6R7DcZJR2lN
	NVO9jr9VdZqA==
X-Google-Smtp-Source: AGHT+IFFUkHYksyaF7YXcZrhW6iSWoG+pahPESVLSjEUcjb9W1AN2WMoPe9CQ3dBxP/T6OWyot0tAg==
X-Received: by 2002:a05:651c:1ca:b0:378:ec26:bac with SMTP id 38308e7fff4ca-37a023c5e6fmr9540811fa.15.1761740588247;
        Wed, 29 Oct 2025 05:23:08 -0700 (PDT)
Received: from [10.38.18.54] ([213.255.186.37])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59301f5f98esm3814707e87.57.2025.10.29.05.23.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Oct 2025 05:23:07 -0700 (PDT)
Message-ID: <49612d39-e2ba-4cf1-8bd2-3da1e9869069@gmail.com>
Date: Wed, 29 Oct 2025 14:23:06 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/15] dt-bindings: mfd: ROHM BD72720
To: Andreas Kemnade <andreas@kemnade.info>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Sebastian Reichel <sre@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-rtc@vger.kernel.org
References: <cover.1761564043.git.mazziesaccount@gmail.com>
 <a5957c4f83724d4f32527fb892fc340af4eeddde.1761564043.git.mazziesaccount@gmail.com>
 <20251027222030.560def67@kemnade.info>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20251027222030.560def67@kemnade.info>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27/10/2025 23:20, Andreas Kemnade wrote:
> On Mon, 27 Oct 2025 13:45:46 +0200
> Matti Vaittinen <mazziesaccount@gmail.com> wrote:
> 
>> The ROHM BD72720 is a power management IC integrating regulators, GPIOs,
>> charger, LEDs, RTC and a clock gate.
>>
>> Add dt-binding doc for ROHM BD72720.
>>
>> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
>>
> [...]
>> +
>> +  rohm,charger-sense-resistor-milli-ohms:
>> +    minimum: 10
>> +    maximum: 50
>> +    description: |
>> +      BD72720 has a SAR ADC for measuring charging currents. External sense
>> +      resistor (RSENSE in data sheet) should be used. If some other but
>> +      30 mOhm resistor is used the resistance value should be given here in
>> +      milli Ohms.
>> +
> rohm,bd71828.yaml has rohm,charger-sense-resistor-micro-ohms, lets
> keep that unified.

Absolutely! Good catch, thanks!

Yours,
	-- Matti

