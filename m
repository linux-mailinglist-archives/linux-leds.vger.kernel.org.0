Return-Path: <linux-leds+bounces-4493-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 02D98A91170
	for <lists+linux-leds@lfdr.de>; Thu, 17 Apr 2025 04:06:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F21FA441CB1
	for <lists+linux-leds@lfdr.de>; Thu, 17 Apr 2025 02:06:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F28C6199EB2;
	Thu, 17 Apr 2025 02:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l+VjPAos"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CBD114885D;
	Thu, 17 Apr 2025 02:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744855611; cv=none; b=lV3DgF0LX8vYvrX1Enz3wpoeurDuUe8WVrZ0SwV6119XvhCssxy5/IWkPfIUhDEpObxUIYBwxNmNjkvbMq/OZzavZiMx682KMM2CpeuESLdxRFygYlSEkbjRFDixGEXGsa+s2ShYcoOyqA4B6KG3tx6RcRrpcjJQhFssUUEaf4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744855611; c=relaxed/simple;
	bh=8Vy9aCztAXdVgTN3k4KwowRPP5iUfC36QefL0nSXbdg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=owu4UTCsbMC3c0RAtZqcFrrUou1dd8s+YkU1HIcUzwN+xhlZFLrtsu+2CPnfcgeOYz098X4ducAWE1rSDpaf9KiTKq3BkA574hzUPrDs5KifgWTpf4CoOY3Zyw4DDa0kEFjkmTG9834pq6uP+OKin+4d++Ix6vXvYM7XaktWhqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l+VjPAos; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-225477548e1so2874435ad.0;
        Wed, 16 Apr 2025 19:06:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744855610; x=1745460410; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5S0Rc5OUApAJHdSC6yQdEbbcqqj1NWTeaGJIvpD8DrQ=;
        b=l+VjPAosXdFYSJtNVwXmVslZBPhdF5KcPysrCxF7QlbB9Sy9E0SncDmWrHExyg0/UJ
         jf76LC6VrT7sai/Y5S+4NpBX9uby2r+YsRgS/aEPf+wM93wDF6GgcdN2eXJDb6opnP9s
         egzkK7stm30e/PRkIq5dEgcJ1qGqBE1x1D5IhBMSf05kgaPTPzbjfBDqxfTApcoxBokx
         6X19mBqn25QSS3XTZJp99HcFEqPOfC2ATNQhqgarQ6NnpUGUBE9wLvOzDiE5cZH0O+YV
         /xJa9/etGcJ9o3gLKoWNA33R+ZAoff+p6CzuiQ01Zr8zb4UVOrrHX+ygavlLzF2CHlo7
         ONqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744855610; x=1745460410;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5S0Rc5OUApAJHdSC6yQdEbbcqqj1NWTeaGJIvpD8DrQ=;
        b=X0pmwMNEqU0P5mP2tp4e/eo/85m9mmolvdh5GiO/D8NJIGb+tHxuS9YkybQhK9+7r7
         qag8fuDbxa5NqUliWQuizTPo6eh4gV98FQM2h5P2dCzC0fyrPWLq+6JgXRMe5F+Y6ogE
         r2M9G3752kEzeLVD9wGlXrsulyKXJtVXylrhINv66d3iYgGTKj3QCETFKKk0Hyk6IjR+
         GewurtSCK0iTE/qU1NuAosy/cQyvXHfhX3WSiNBFVBIOOrQF+nL/Oqis1DEnFhzn6Woz
         +FUcAUdVh6TNPE+BAAd7jWDChYKbM/uv0Rs8jnDZJw2RC0i2rmDEQJOQewhW5ix1edYC
         xmXg==
X-Forwarded-Encrypted: i=1; AJvYcCWP1ymU7ALzwxTc81DAhCrpXJNt4gBMVjZQDiLmOKFT8xL1CiT9k09qWTe6qKrfYpe+kkHIL331/AmVDFUg@vger.kernel.org, AJvYcCXDMNkRQmPkPOr1ozZrBG+Q26LbUq1iCaakDHF4EVXDlIZ55lu3RB3mBo1/44xqmUYhaFVSWKM1j6ETaQ==@vger.kernel.org, AJvYcCXcN6Zsxpa3pE8Y/QEcUU3FJhcord8mcFcuXwhaoDqqDrAk8dBHP2iND0N/eo7xV+VRirKADyxYTBBY@vger.kernel.org
X-Gm-Message-State: AOJu0YzZDmx1XlNg2+Zjlwcnhgmw9U/evNt06xbijSpGhord2/5tC/07
	Vnz9U3yTkzSBw6BNtA4xTgOB5tUv9FI6xrorV/628roKuyxRfn2C
X-Gm-Gg: ASbGncvJzJHcDGcH/cTcJ8Fp+9sqrhgMVQvv8gTG5GXAZiv6ULDYkVIw7TX+fjKnPUS
	VbzKtje4KQgOpwy5FM5VRP6yfLpVQj9wgsbdL4Zq7sxZIqQHpyvFWa8MBi/u7CFmv6McVAFU8eL
	/raftauFAk+e9NiubuSl9MhBinlij0Ek/Ca0XocpwQ/uo4LlGOxquJRkZQCTn9ErjMI6rXeVAqs
	DVB+fnhM0AfyNv2xRJ2sKuXjF/IL+QCi5HGlNo/7vlPd/jiKrJXJDgAq1h+JN7o8xakquZXFA9A
	wyMDOfRJsjvGXpMB7Pa75tJ/zwHvb1G1I+IpdmuoOmZQ2B0TjAE+yQ==
X-Google-Smtp-Source: AGHT+IHOSSVJxwJFTvqTyirKYLKDkNN1HsuII60LpoJlqemuqX/oIQnI0UNsOszF22K4816pi4+qdg==
X-Received: by 2002:a17:902:dac7:b0:220:d601:a704 with SMTP id d9443c01a7336-22c358d71admr50793935ad.18.1744855609467;
        Wed, 16 Apr 2025 19:06:49 -0700 (PDT)
Received: from localhost.localdomain ([171.255.57.44])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c33fcea58sm21612685ad.199.2025.04.16.19.06.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 19:06:48 -0700 (PDT)
From: Nam Tran <trannamatk@gmail.com>
To: krzk+dt@kernel.org
Cc: pavel@kernel.org,
	lee@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net,
	devicetree@vger.kernel.org,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/5] dt-bindings: leds: add TI/National Semiconductor LP5812 LED Driver
Date: Thu, 17 Apr 2025 09:06:22 +0700
Message-Id: <20250417020622.1562-1-trannamatk@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <a22eff98-86db-47db-a310-5d00dcba14fa@kernel.org>
References: <a22eff98-86db-47db-a310-5d00dcba14fa@kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Tue, 15 Apr 2025, Krzysztof Kozlowski wrote:

>On 15/04/2025 11:53, Nam Tran wrote:
>> On Mon, 14 Apr 2025, Krzysztof Kozlowski wrote:
>> 
>>> On 14/04/2025 16:57, Nam Tran wrote:
>>>> +
>>>> +description: |
>>>> +  The LP5812 is an I2C LED Driver that can support LED matrix 4x3.
>>>> +  For more product information please see the link below:
>>>> +  https://www.ti.com/product/LP5812#tech-docs
>>>> +
>>>> +properties:
>>>> +  compatible:
>>>> +    const: ti,lp5812
>>>> +
>>>> +  reg:
>>>> +    maxItems: 1
>>>> +
>>>> +  "#address-cells":
>>>> +    const: 1
>>>> +
>>>> +  "#size-cells":
>>>> +    const: 0
>>>
>>> No need for supply?
>> 
>> Since the hardware uses an external power supply,
>> we decide not to include the supply property in the binding.
>
>So there is power supply? If so, must be in the binding. Bindings
>describe given hardware (LP5812), not your particular board/setup.

Thank you for the clarification.
The LP5812 is externally powered and has a dedicated VCC pin.
I'll update the binding to include a `vcc-supply` property.

>> 
>>>> +
>>>> +patternProperties:
>>>> +  "^led@[0-9a-b]$":
>>>> +    type: object
>>>> +    $ref: common.yaml#
>>>> +    unevaluatedProperties: false
>>>> +
>>>> +    properties:
>>>> +      reg:
>>>> +        minimum: 0
>>>> +        maximum: 0xb
>>>> +
>>>> +      chan-name:
>>>> +        $ref: /schemas/types.yaml#/definitions/string
>>>> +        description: LED channel name
>>>
>>> My comment stay valid. I don't think LEDs have channels, datasheet also
>>> has nothing about channels, so again - use existing properties. Or
>>> better drop it - I don't see any point in the name. The reg already
>>> defines it.
>> 
>> The channel was named for the output channel to each LED, not the LED channels.
>
>I don't understand what you want to say. Please explain why existing
>label property is not correct here.

I understand that the label property is deprecated and that the preferred approach now is to use function and color instead.
However, in the case of the LP5812, which is a matrix LED driver, these properties are not a good fit.
The LP5812 does not associate each output with a specific function (like "status", "activity"),
and the LEDs driven by LP5812 are not fixed to a particular color.

>> but the person who wants to develop LP5812's matrix-related features can use the "channels" for easy mapping.
>
>easy mapping of what? Please show me the usage.

You're right — I cannot provide a meaningful usage example for chan-name.
The chan-name property was intended to give a more descriptive name for each LED channel, mainly for convenience in user space.
But since this isn’t standard and you advised against introducing such a property, we’ve decided to drop it.

>> 
>>>
>>> However after dropping this, your example has nodes with only reg -
>>> what's the point of them? Why no properties from common.yaml are
>>> applicable? If they are not applicable, then the entire subnode should
>>> be dropped - you don't need them to describe the hardware.
>> 
>> Actually, the "color" property can be applied, but the LP5812 is a matrix LED,
>> so specifying a particular LED color is not necessary when developing LP5812 features.
>
>This does not help me much and based on this I see no points in
>describing individual LEDs, because the only missing information is
>number of them but even that is fixed for given device, isn't it?

Actually, the number of LED outputs on the LP5812 is not strictly fixed — it depends on the selected operating mode.
This mode is configurable by the end user at runtime through sysfs interfaces provided by the driver.

I understand your point — if no additional properties from common.yaml are applicable, these subnodes may not be necessary.
Therefore, we’ve decided to drop them.

Best regards,
Nam Tran

