Return-Path: <linux-leds+bounces-6162-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E57AFC62DB9
	for <lists+linux-leds@lfdr.de>; Mon, 17 Nov 2025 09:12:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sea.lore.kernel.org (Postfix) with ESMTPS id 983A1242CC
	for <lists+linux-leds@lfdr.de>; Mon, 17 Nov 2025 08:12:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D70131B83B;
	Mon, 17 Nov 2025 08:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mIM3ltO1"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7CE831B823
	for <linux-leds@vger.kernel.org>; Mon, 17 Nov 2025 08:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763367129; cv=none; b=MGQYAESGX5P+iebCz1KwZBRYQiCdF72GQmnVgdq7vKBsbLB1u2yyVpMnqjMeknJzCl+RQvK7TxIWzmdT/IGyvkkc5BqOeDLsGEgdL8+56SUSnoq2hfv9Y61ziZoiEB8vy4SuYSOvWmOZzoZdAHkeTvQCeY+U8KSApMjB+k1F11U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763367129; c=relaxed/simple;
	bh=XHwbf6AOIUXsOmRYZriTih9VqIVu3akhJh3HAnKtjAI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O15wceGFggAOlwXj9PqzQGidee5X3E9a0mUBQLynYAkpa0ibmElWuJLTS+t6p7kr0OaYptDRMWRednp/fiz6jLfrB+y6q5KrJTuuy2qRc6e2aBsz64dknthbtRwUrtkjzii5L+fIXfQgMDX4y/iO5DqT49H0FQcTPUayQFjwsGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mIM3ltO1; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5958232f806so3724704e87.0
        for <linux-leds@vger.kernel.org>; Mon, 17 Nov 2025 00:12:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763367125; x=1763971925; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yNezKY4OK1RUkmmO61fiaJ8SOz15t0AD4hDvMzPpJVU=;
        b=mIM3ltO1JCXOTXPJfKEXWf2BSZG2mBHB68G8pBekQdqxWaXxcaf7dto27e8WEippb2
         3wAfyQ8nOvqjsUPIbEglFnCA6DWI9UoQRbsKMqnHNR4QvG7Mp+UzZ0ZADADwx1XrS/t9
         QD+h+UN7jm+heHmecqTGEKdoO1OnubPj7o6cBg7s7ghR1djfIJeZQrDVKxOkVeovEhyQ
         HDVI/XC7kMQw2Ic00mu1TrAzhcCF2vsMVVET4usBPfv9gRuMyBQPdtbi40ScNtC9DTpq
         J6Wjr16nWOf1E/Vm7JRy1m4TW78h5kTzA2HNsMo0Jv8hZwqUiDNuIjyhWQio0BA1o1Rq
         69Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763367125; x=1763971925;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yNezKY4OK1RUkmmO61fiaJ8SOz15t0AD4hDvMzPpJVU=;
        b=QUbrgw+Dlj4+PZNhS+J0Cq+x4ZstABZKQPzYE5tfwutG0YhfWBsU9iGIrTIsjofdco
         Ol258pOxQMQBR/QW01iMilHQlOJrUVUvVlERzTSHhk1WLH4DAfCqJSr3a1qfgBThFrtQ
         rNte5H5ZJ/SRbtfddj+KDSUgMgXNundZ61kti2i+qN2sVh4fBTzXIKcAlAQj7cLLKEKK
         FR4hUcnj4/ruX+frxgzu1h4w3GRdYXbNy7WmVfjaogkXXYsHfp/hwRDEc7Leh3GlX1Zg
         JheCTONos1A5+QrkvCGNRmTaZIfEcCFEUTTgzO6dd7dkES11PlVORzaf7pg9GYY8iWAf
         KeWA==
X-Forwarded-Encrypted: i=1; AJvYcCVcSQ4N3z9d34iYFos99XbJ+FjnVhuwjY2Zxvv5qmFyBiPf9f+eGFxbfgkqxKMWxHd4DwAMvJs1l8y5@vger.kernel.org
X-Gm-Message-State: AOJu0YwLfBoSp0BkXfA4ZkCtek83XlZcqkwUI0YUDMdCKixtYVK4voR1
	R8r8ZewmLk+awbeMLFxGID+2OYP3yCFiV1nhQZ6UIe7VbSJEtUoa40FP
X-Gm-Gg: ASbGnctfboNGAxIv8YyM0HJoYKykK8JVUM70dg4afRmaJdcwiWFec05c9X4TwkdcmiX
	d6/z2la3/TlvGuUkSGBM/acoye6nc10e2jJ2lT/rp7Iwy9i8vuwW552qD8vaRzWOgna6v/dmnmm
	iPXZv70cGYy2Cd+S9Qz4YuLgovWp8pDwokG0tS9Mps+GV4V2DBgX3d2PjwwrWmTeRIJSV+YMvKK
	c210jLhT/EbynEbb4QQbsCjqcc+RW8jFE13RaGDdyVuMqCaSwDG5yv/Ood4Y7pE9YWuADvXvC5V
	Vx5x0MvHATABKX8Mib8gqwQlI9DT37SDN/9z3PxUXlxMs0bC5DM7BCO5KKELRBr7sSRVRTmt6YZ
	Z8MFQnQ220ryGbIIWuI+JoYGFw1X3UoT24isCO0BS/Jf7ElwxEmtM7wuLd5yIXdvqW8Km0o9b+M
	GHxyUJjM80sPE/W+liaJ3A
X-Google-Smtp-Source: AGHT+IEluVZi6T3T+marIDimIkV/AzoU/n4XMrn+z0vTNbD0dmB4jEXr6UBisTSPipCj2YPh+iwoQw==
X-Received: by 2002:a05:6512:2342:b0:595:8200:9f8f with SMTP id 2adb3069b0e04-595841b7044mr3304921e87.18.1763367124335;
        Mon, 17 Nov 2025 00:12:04 -0800 (PST)
Received: from [10.38.18.54] ([213.255.186.37])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-595803ac88bsm3067407e87.12.2025.11.17.00.12.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Nov 2025 00:12:03 -0800 (PST)
Message-ID: <32303b95-3fd5-44c4-bb7d-e2957a6064fc@gmail.com>
Date: Mon, 17 Nov 2025 10:12:01 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 04/16] dt-bindings: power: supply: BD72720 managed
 battery
To: Rob Herring <robh@kernel.org>
Cc: Matti Vaittinen <matti.vaittinen@linux.dev>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org,
 Sebastian Reichel <sre@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 linux-leds@vger.kernel.org, Pavel Machek <pavel@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-gpio@vger.kernel.org,
 linux-pm@vger.kernel.org, Andreas Kemnade <andreas@kemnade.info>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-rtc@vger.kernel.org, Lee Jones <lee@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>
References: <cover.1763022807.git.mazziesaccount@gmail.com>
 <ac5a4e992e4fb9c7bffb1e641a7cd61f74af4cba.1763022807.git.mazziesaccount@gmail.com>
 <176303119683.3716572.16868393928566655866.robh@kernel.org>
 <ee36d7d1-ef47-4a35-9aff-baa6ed32105a@gmail.com>
 <20251114163954.GA3399895-robh@kernel.org>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20251114163954.GA3399895-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14/11/2025 18:39, Rob Herring wrote:
> On Fri, Nov 14, 2025 at 11:04:27AM +0200, Matti Vaittinen wrote:
>> On 13/11/2025 12:53, Rob Herring (Arm) wrote:
>>>
>>> On Thu, 13 Nov 2025 10:52:19 +0200, Matti Vaittinen wrote:
>>>> From: Matti Vaittinen <mazziesaccount@gmail.com>

//snip

>>
>> So, as far as I understand, the only viable options are expanding the
>> existing battery.yaml with these properties (which I hoped to avoid, see
>> below)
>>
>>>> The right place for them is the battery node, which is described by the
>>>> generic "battery.yaml". I was not comfortable with adding these
>>>> properties to the generic battery.yaml because they are:
>>>>     - Meaningful only for those charger drivers which have the VDR
>>>>       algorithm implemented. (And even though the algorithm is not charger
>>>>       specific, AFAICS, it is currently only used by some ROHM PMIC
>>>>       drivers).
>>>>     - Technique of measuring the VDR tables for a battery is not widely
>>>>       known. AFAICS, only folks at ROHM are measuring those for some
>>>>       customer products. We do have those tables available for some of the
>>>>       products though (Kobo?).
>>
>> or, to add new compatible for the "vdr-battery".
>> AFAICS, adding new compatible would require us to wither duplicate the used
>> properties from battery.yaml here (as battery.yaml mandates the
>> "simple-battery" - compatible) - or to split the battery.yaml in two files,
>> one containing the generic properties, other containing the "simple-battery"
>> -compatible and referencing the generic one. Then the "vdr-battery" could
>> also reference the generic one.
>>
>> Any suggestions for the next path to follow?
> 
> Probably the latter option. You could do the former and make the new
> properties conditional on the "vdr-battery" compatible. That's fine with
> small differences, but gets messy as there are more properties and
> variations.
> 
> But is "VDR" a type of battery though? Is there a certain type/chemistry
> of battery we should be describing where VDR is applicable?

No. Not that I know. My understanding is that the "VDR (voltage drop 
rate)" refers to measured voltage drop-rates under certain conditions - 
which can be used to (more accurately) estimate the remaining capacity 
when battery is nearly depleted. As far as I know, this is only used 
with Lithium-ion batteries (I am not at all sure of this) - but I 
_assume_ the technique could be applied to other type of batteries as well.

> I don't
> think it scales well if we define battery compatibles for every
> variation of charger algorithm. Honestly I don't mind just adding 1
> property. I care more if we allow undocumented properties than
> allowing documented but invalid for the platform properties.

I see. The "VDR" stuff is really tightly bound to the fuel-gauging 
algorithm. It is measured characteristics of the battery - but those 
values are only usable by the "VDR" algorithm. I don't really have a 
good insight in the amount of fuel-gauging algorithm related properties 
suggested to be added during the years - but don't think there have been 
that many of them. So, I am not that worried about adding the 
compatible. On the other hand, there is no technical reason (other than 
adding properties which are unused on many platforms) why not to add the 
vdr tables in the static-battey node without adding own compatible. And, 
reading reply from Andreas (I'll copy it here to answer it in same mail)

/// Below text is form Andreas:
 > just keep in mind, that several kobo devices have one pmic in one board
 > revision and another one in the other (e.g. Kobo Nia rev A vs rev C).
 > But probably the same battery. So if the "vdr-battery" is a compatible
 > just to allow a more properties,
 > then "simple-battery" should be allowed as fallback.

I didn't know Kobos use multiple chargers. Thanks Andreas! So, in that 
sense, adding the "vdr" tables in static-battery node, without new 
compatible, would maybe be simplest solution. Then the charger(s) 
(fuel-gauge(s)) which implement VDR algorithm, can pick the tables while 
those chargers which don't implement the VDR will just ignore these tables.

> When it
> becomes 10, 20, 30 properties, then I might start to care. 

For VDR there are only:

rohm,voltage-vdr-thresh-microvolt,
rohm,volt-drop-soc-bp,
rohm,volt-drop-temperatures-millicelsius

and

patternProperties:
   '^rohm,volt-drop-[0-9]-microvolt':

So, from the binding point of view (.yaml), it's not _that_ lot. In the 
.dts there will be quite some noise as the tables have several values.


> If that
> happens, either we are doing a poor job of generically describing
> battery parameters or chargers and batteries are tightly coupled and
> can't be described independently.

I am under impression that chargers tend to be pretty flexible, and they 
can be configured to work with many different batteries by altering the 
charging profiles. Most of the battery properties (like and charging 
phases [like pre, CC, CV], their limits, currents and voltages etc) are 
very generally usable. So, large subset of charging functionality can be 
handled with standard properties. I believe it is only the fuel-gauging 
where things get more hairy.

I did prepare a series which does the split and adds new compatible for 
the 'rohm,vdr-battery'. (The power-supply class is not yet modified in 
the series, but we would probably want to modify the battery-info 
getters to also accept the 'rohm,vdr-battery' -compatible.)

I wonder if I should actually prepare also a series where these 
properties are just placed in the existing static battery node without 
adding new compatible. That way it would be easier to see which way is 
better.

If I do that, should I only spin these bindings as RFC to avoid the 
unnecessary noise?

Oh, and a big thanks to both of you Rob and Andreas!  I feel this gained 
more clarity after your feedback :)

Yours,
	-- Matti

---
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~

