Return-Path: <linux-leds+bounces-4523-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 217FDA97E10
	for <lists+linux-leds@lfdr.de>; Wed, 23 Apr 2025 07:30:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2A965189BF63
	for <lists+linux-leds@lfdr.de>; Wed, 23 Apr 2025 05:30:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4032F263F38;
	Wed, 23 Apr 2025 05:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yoseli.org header.i=@yoseli.org header.b="FPivEqvB"
X-Original-To: linux-leds@vger.kernel.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7BC726659B;
	Wed, 23 Apr 2025 05:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745386214; cv=none; b=Y0limrKqbb7oKQmb9EwsPcKwTLS7dNjGwyhWUx+iTFBvWuLYNgyeenzkiECbetV5l2IQwRPU8zXLzLXLnMXkJLs1kC+GzQdPV9gGdXpRdVkmqRwFEaPaDvI+zBJXAzBj95dIg4nuJVLPVjDdRoL3Yt/8D9Ik60CHviiRA7Qz1jA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745386214; c=relaxed/simple;
	bh=FlriVym+Js+dNVuPnyNYfAgam4ZC1vp+i/CRui2G3sg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EiNFPI4B4B53Cr1eG4IRUw/RYD9KoZsyr6N4py2kyEediSE5z/B10Bb0K8wuZ2wE5u9/d33mbVM90bdv0Dv13TDCb21cIYz3jTZYv47OzAM8j8ImXjJZxz7J9kBc4r+M2WMpJFnTqiMBnzMbHDAiqIGWI1EELoAOkDBlCYnhz5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=yoseli.org; spf=none smtp.mailfrom=yoseli.org; dkim=pass (2048-bit key) header.d=yoseli.org header.i=@yoseli.org header.b=FPivEqvB; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=yoseli.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=yoseli.org
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0424743A3A;
	Wed, 23 Apr 2025 05:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yoseli.org; s=gm1;
	t=1745386209;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RvQcDheIAFurSmOQdGUk8xpL5w1EwUFvHhEtcJWMar4=;
	b=FPivEqvBosI4uRVdEGLIEh6h9o8eGiBwF9OwgqoFKwYP9oTRB38ocxcOCxJL7odPXt5VIU
	AlFvtorWE6gagqPL5GG47uMYpfQQPiqTBYLdnE0xI/qP+QtjERYfytjy9HF5KH2zDoF+zf
	gfVeMXLD1ms0Cng4um79k7TVBMT3n/z4pzR6F3kem8v45wVTg+qE05mlEwVAJP18HTwYzw
	EtBNkuFonQ81SEGnVm7ax1Au8KXts3nFpluOQdsSwQX48BDMDKQo5kM2Sfq+UcmMs+R8Dj
	1zbM0tP2PDonalESMZPlhXt0r+uHXnlrUY4P3TMW3iufmxJGaOQt0ruItgyREA==
Message-ID: <a1c58126-8a1e-41dd-8bf7-b2d721421dbb@yoseli.org>
Date: Wed, 23 Apr 2025 07:30:08 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Documentation: leds: improve readibility of multicolor
 doc
To: Bagas Sanjaya <bagasdotme@gmail.com>, Lee Jones <lee@kernel.org>,
 Pavel Machek <pavel@kernel.org>, Jonathan Corbet <corbet@lwn.net>
Cc: linux-leds@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250421-leds-doc-v1-1-9a32df7fc6f4@yoseli.org>
 <aAhYDY2DBxFW0yI_@archie.me>
Content-Language: en-US
From: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
In-Reply-To: <aAhYDY2DBxFW0yI_@archie.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgeehjeeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthejredttddvjeenucfhrhhomheplfgvrghnqdfoihgthhgvlhcujfgruhhtsghoihhsuceojhgvrghnmhhitghhvghlrdhhrghuthgsohhisheshihoshgvlhhirdhorhhgqeenucggtffrrghtthgvrhhnpeefieetgeehvdeggffgffetheehhfetkeefhefhgeeuheetueffueeikefgffffteenucfkphepledurdduieehrdduieehrdduleejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledurdduieehrdduieehrdduleejpdhhvghloheplgduledvrdduieekrddurdeingdpmhgrihhlfhhrohhmpehjvggrnhhmihgthhgvlhdrhhgruhhtsghoihhsseihohhsvghlihdrohhrghdpnhgspghrtghpthhtohepjedprhgtphhtthhopegsrghgrghsughothhmvgesghhmrghilhdrtghomhdprhgtphhtthhopehlvggvsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehprghvvghlsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhrsggvtheslhifnhdrnhgvthdprhgtphhtthhopehlihhnuhigqdhlvggushesvhhgvghrrdhkvghrnhgvlhdro
 hhrghdprhgtphhtthhopehlihhnuhigqdguohgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: jeanmichel.hautbois@yoseli.org

Hi Bagas,

On 23/04/2025 05:01, Bagas Sanjaya wrote:
> On Mon, Apr 21, 2025 at 06:48:10PM +0200, Jean-Michel Hautbois wrote:
>> +.. code-block:: console
>> +
>> +    root:/sys/class/leds/multicolor:status# ls -lR
> 
> The equivalent is ``ls -lR /sys/class/leds/multicolor``.
> 

This patch was only to add markups, I did not want to change the content 
more than that. The result of ls -lR must also be in the same 
code-block, so I am not certain your proposal is equivalent ?

>> +    -rw-r--r--    1 root     root          4096 Oct 19 16:16 brightness
>> +    -r--r--r--    1 root     root          4096 Oct 19 16:16 max_brightness
>> +    -r--r--r--    1 root     root          4096 Oct 19 16:16 multi_index
>> +    -rw-r--r--    1 root     root          4096 Oct 19 16:16 multi_intensity
>> +
>> +..
>>   
>> <snipped>...
>>
>> @@ -71,16 +79,28 @@ may want to dim the LED color group to half.  The user would write a value of
>>   128 to the global brightness file then the values written to each LED will be
>>   adjusted base on this value.
>>   
>> -cat /sys/class/leds/multicolor:status/max_brightness
>> -255
>> -echo 128 > /sys/class/leds/multicolor:status/brightness
>> +.. code-block:: console
>> +
>> +    # cat /sys/class/leds/multicolor:status/max_brightness
>> +    255
>> +    # echo 128 > /sys/class/leds/multicolor:status/brightness
>>   
>> -adjusted_red_value = 128 * 138/255 = 69
>> -adjusted_green_value = 128 * 43/255 = 21
>> -adjusted_blue_value = 128 * 226/255 = 113
>> +..
>> +
>> +.. code-block:: none
>> +
>> +    adjusted_red_value = 128 * 138/255 = 69
>> +    adjusted_green_value = 128 * 43/255 = 21
>> +    adjusted_blue_value = 128 * 226/255 = 113
>> +
>> +..
> 
> Are these adjusted values intended to be part of previous block on brightness
> status? If not, I'd like to interleave these two blocks with "The adjusted
> values are now::".

Interesting, yes, it could be added.

Thanks !
JM

