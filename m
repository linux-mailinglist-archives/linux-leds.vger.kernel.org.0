Return-Path: <linux-leds+bounces-6169-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 42777C64F65
	for <lists+linux-leds@lfdr.de>; Mon, 17 Nov 2025 16:50:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 6FF054EDD0C
	for <lists+linux-leds@lfdr.de>; Mon, 17 Nov 2025 15:48:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9D32299AAA;
	Mon, 17 Nov 2025 15:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="COEwFccW"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CBB2298CA6
	for <linux-leds@vger.kernel.org>; Mon, 17 Nov 2025 15:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763394496; cv=none; b=kVxXdQDD+J7WLk8DZ5mNEesYYISx3Rz4gknlMXpll73PXkNkVKQwbRwOl3SuFf+fTZ7u1VR2fJLej3pwIB9qAdFTFTLouDnv6A03HMX0fnOtVT1Br/8P1UJNVI3D2kWlY8mYcbuJuD8uar6zQcUnNQBWNlZINXEK5yuAFCkRSGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763394496; c=relaxed/simple;
	bh=ROYTcX0lToNnERFrzzVSCpniaTAJj6i4Bcg2Nx6hBo0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=blqQYQkctJffhzDt/peiHr5EkwzgddbuFmM+/psR9MP7t7gJyC0eF+EtLdxJ5yPDUu3F2YsIPIHXNLivNMT1Di2g/oK8SazIbLkZVsQ6jwn03Lgez5P46dFBaQE8gcal3hPxcpzuMjiu8329hJsWVr3fythbEdUcg0gTpZOP/xA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=COEwFccW; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-37902f130e1so35463311fa.1
        for <linux-leds@vger.kernel.org>; Mon, 17 Nov 2025 07:48:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763394491; x=1763999291; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=c/DUma0uZd8iCNzJFNlwxYelZvsQPcM9gT0Fu/UGP5Y=;
        b=COEwFccWnTSZZhfIMmxf9dxlSNeit2WGTrtffdB+zcsa5PeFEl+Ewx6wVLeYeTJf7I
         R8HNcH3LTQuaCYbIPHINb4jbHhK2d0Lcb/JGCjDkDm1BmoizG3cJf3PeJ5p0sVX8o3c/
         SdmOXYZIs6WAWS8jFVnPko0njBkg5sMY96DOL8ZuMirBrs+iBCYzkPva2BvkAfDsbBa5
         F6Dk2ClIzu1W0nE52d2rVOi6odN60iWsoii10RtMvpyJ00k3LKJMRQ7Sgrsh2XnV2EDV
         iSoqf0pODs+pklwWmxVhw1oaLenrRALUGhvA8jwUxZb5v3L87wZ+ZsH3DvSv01DFZW80
         koiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763394491; x=1763999291;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c/DUma0uZd8iCNzJFNlwxYelZvsQPcM9gT0Fu/UGP5Y=;
        b=h6MsmerYde/aJtX8VU2QaxNO4mQUEy6giyu3QQKZLwO+Odf3rJfLkD2Y6KVvnHztQw
         rFqKTzdX9qYLc+xRO11u/E3tGDTmIhcIU+JRCK/OAmA5EI4/F4hBwBN93ScVViYSuClj
         kUFLlM+RAYHtk4fFrgd9DvftX9uN6L5RnMlCS9F5s4Ng16HmZMoe1qFZSZz2q0vXJCJF
         M117qDgVbKcOj7Cg9ZPLCZXy4H/X8oBK6DSze/Bu0+po86KBJDG+ZLl13O17ILLvnynD
         jYsSt4OzXqvJySDpTU45fo0PzGyRIoHQCd9akIUI8W3/xn6OHmE35uuCG+h4ceMCtg5D
         hdgg==
X-Forwarded-Encrypted: i=1; AJvYcCXYKyq02QYItxDXkEjtKCGyM0h6XePXYODGIlqRtf9hI7NKfZRSI4c+BjnrjkdFRQUxg8T6fUn6D34X@vger.kernel.org
X-Gm-Message-State: AOJu0YwOAQEahz6C43vlapRx8hT2Y46QaqjSPZ9mpH5Xt64rkMyZv+Yv
	MB8CeV1Dua0/II7N3v35eVcNJDQu2/POjDMZvP43EayXi6KiO8+9VT7A
X-Gm-Gg: ASbGncsFYzUj2z0roYxIoLi+zgea6lFwvyqpBJOL56eL6L6778rxTxN+myjaVcaOlDL
	n1MdQt4hjVHuo4RKjYPHRb/FEj3rrO5BvqhP6t9CXCuWCOS+3J298nVDsns+Y/1Uz/esxS6cHvy
	0Eb6pNF/aaFScFk6d8WMkcU8HAyMr89x9PkgPC04dB6rCbkbnKpMCPZg6PT6mbNLVwfksz6hs3F
	rLbDmvR4kuHNCHmhtzDv/RPiyjPP7SNWgWo8HBCAVye8RYc+uaulS5iTDhFmR9sUDRBsRCJKBRE
	695YbDlrbNpdQtFA5OSoGWYhC/Ikspx2S7YaBSVfhh3ZBQDfAIK8SdMPYjvfdG7tP/x7eLvv5x4
	ZkU8SL9NZ1n2xHxpHb7i2a2c99WUNeX/QFGEsUJaYJV6Esx2NjN9MkE8KxVaR/ZDhY+OLmV7cfo
	6pYHpisNQJXomyTDceLPk2QgwgsW5j8+LuZ6DpSO1AtLWqKQNJQpyWVCS2qw==
X-Google-Smtp-Source: AGHT+IEz1qxf+9MTduFUs5dbOjZ/dHS2S6pFFr0IgbhUuNlZhrUTtDy15iSqTT9lE0arzv+pzqRA9A==
X-Received: by 2002:a2e:b052:0:b0:37a:75c6:b44 with SMTP id 38308e7fff4ca-37babb47988mr26872821fa.3.1763394490823;
        Mon, 17 Nov 2025 07:48:10 -0800 (PST)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37b9ce25408sm28328821fa.20.2025.11.17.07.48.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Nov 2025 07:48:10 -0800 (PST)
Message-ID: <52b99bf7-bfea-4cee-aa57-4c13e87eaa0d@gmail.com>
Date: Mon, 17 Nov 2025 17:48:08 +0200
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
 <32303b95-3fd5-44c4-bb7d-e2957a6064fc@gmail.com>
 <20251117152341.GA1944698-robh@kernel.org>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20251117152341.GA1944698-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17/11/2025 17:23, Rob Herring wrote:
> On Mon, Nov 17, 2025 at 10:12:01AM +0200, Matti Vaittinen wrote:
>> On 14/11/2025 18:39, Rob Herring wrote:
>>> On Fri, Nov 14, 2025 at 11:04:27AM +0200, Matti Vaittinen wrote:
>>>> On 13/11/2025 12:53, Rob Herring (Arm) wrote:
>>>>>
>>>>> On Thu, 13 Nov 2025 10:52:19 +0200, Matti Vaittinen wrote:
>>>>>> From: Matti Vaittinen <mazziesaccount@gmail.com>
>>
>> //snip
>>
>>>>

>> For VDR there are only:
>>
>> rohm,voltage-vdr-thresh-microvolt,
> 
> So "voltage voltage drop rate"? And '-microvolt' says this is voltage
> too. :)

Hm. Yes. This is a threshold voltage for applying the "zero-correction" 
algorithm, which uses these "VDR" (a.k.a voltage drop rate) tables. Eg, 
the algorithm should only used for the correction when battery voltage 
drops below this threshold. AFAICS, this is usually designed to be 
slightly higher than the voltage where the system stays still operable. 
I suppose this could also be "zero-correction-threshold", but this would 
introduce another "buzzword".

>> rohm,volt-drop-soc-bp,
>> rohm,volt-drop-temperatures-millicelsius
>>
>> and
>>
>> patternProperties:
>>    '^rohm,volt-drop-[0-9]-microvolt':
>>
>> So, from the binding point of view (.yaml), it's not _that_ lot. In the .dts
>> there will be quite some noise as the tables have several values.
>>
>>
>>> If that
>>> happens, either we are doing a poor job of generically describing
>>> battery parameters or chargers and batteries are tightly coupled and
>>> can't be described independently.
>>
>> I am under impression that chargers tend to be pretty flexible, and they can
>> be configured to work with many different batteries by altering the charging
>> profiles. Most of the battery properties (like and charging phases [like
>> pre, CC, CV], their limits, currents and voltages etc) are very generally
>> usable. So, large subset of charging functionality can be handled with
>> standard properties. I believe it is only the fuel-gauging where things get
>> more hairy.
>>
>> I did prepare a series which does the split and adds new compatible for the
>> 'rohm,vdr-battery'. (The power-supply class is not yet modified in the
>> series, but we would probably want to modify the battery-info getters to
>> also accept the 'rohm,vdr-battery' -compatible.)
> 
> I don't think that's the right direction. It's not a Rohm battery.
> 
>> I wonder if I should actually prepare also a series where these properties
>> are just placed in the existing static battery node without adding new
>> compatible. That way it would be easier to see which way is better.
> 
> That seems like the right thing to do here.
> 
> The main question for me is whether these should even be Rohm specific?
> That would probably require a 2nd user to answer for sure.
> 

This is a question Linus W asked as well :)
I believe this technique could be applied to other batteries. I, 
however, am not aware of any other than ROHM charger drivers which 
implement the algorithm. Furthermore, I was told that the mechanism to 
measure these "VDR-tables" for batteries is one of those things which 
should be "kept under your hat". I think ROHM has also patented some 
stuff related to that. Hence I prefixed these tables by "rohm,".

I have no strong objections to dropping the "rohm," though - but I doubt 
these tables will be heavily used by any other but ROHM chargers.

>> If I do that, should I only spin these bindings as RFC to avoid the
>> unnecessary noise?
> 
> Only if you think something is not complete and/or the patches should
> not be applied.

Oh, Ok. Then I will send only one of the approaches - probably the one 
where properties are added to the simple-battery.

Thanks for all the support!

Yours,
	-- Matti

---
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~

