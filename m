Return-Path: <linux-leds+bounces-6794-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CFvXEB1dfmniXgIAu9opvQ
	(envelope-from <linux-leds+bounces-6794-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sat, 31 Jan 2026 20:50:53 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 72682C3BBA
	for <lists+linux-leds@lfdr.de>; Sat, 31 Jan 2026 20:50:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 24C14300533B
	for <lists+linux-leds@lfdr.de>; Sat, 31 Jan 2026 19:50:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D790136BCEC;
	Sat, 31 Jan 2026 19:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="GWIiRwE0"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com [209.85.167.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E490836AB5F
	for <linux-leds@vger.kernel.org>; Sat, 31 Jan 2026 19:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769889046; cv=none; b=Dpj6+KbACpsjARugtU5T3bZIab+WGzW3F/5eE5T+RlIGJkhyIb6JmNTS3ke7O0H6xO7NDunBESshYOppONjVmLXQYbxlj0hhYLX1rshpQ9oMduBEhv3UDZ8xRKWwO55CxnMBRD6vzaAj+JJ+xTyo+y1/RIxxERriFrY2ZVbs2o0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769889046; c=relaxed/simple;
	bh=C5HuJP/IjeG8MYwSuwdaWDcjCmDjLCEPWCcLYeFqHpM=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=KMRnT9H32vo3FhlHmWc59R5aPf2c6DILAbPpu3bCifLPKi4wzVVK2GHBXZKIXGc6gBBRiiYPCOCQcV7TWdk61vgbTFRYmAGMYVP5qrh0m60RsT9jmFVQgaZgJjEUQvauVAWSGJxv2gPEi10DU+F+h7uBDP2xf8OvU7tgb1fN2Dg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=GWIiRwE0; arc=none smtp.client-ip=209.85.167.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-oi1-f195.google.com with SMTP id 5614622812f47-45f171cb842so2145377b6e.1
        for <linux-leds@vger.kernel.org>; Sat, 31 Jan 2026 11:50:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1769889044; x=1770493844; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=C5HuJP/IjeG8MYwSuwdaWDcjCmDjLCEPWCcLYeFqHpM=;
        b=GWIiRwE0swLPJFHbUxLmcXD7uZZgmXuGeN7oQvIG4uVEg+WJvCel0i0OAaks2afL9L
         6uezKwjBgoreIu/valrw15ASQ53++7OzIN4roQntTgf7bq6IfTpp9hM7d0/S6d0Xfegy
         cIgLOwoSZsv52q4SkXUrHLn4tqxBRjJAPrcwxYM1AdjdWfUtsQA1jz4qLp8E64gKgSOu
         Sl3xyJDu0Hxz6aQZty2j9HO/8SGDs6t0YgYdwpX5wNwf29Xwnisl1QW39KwYSA4smoE5
         uy8b7xlgItHHF/E/Ze27LEOd1ULSr9UK14LWeo5WqIJHH7pklFAzGSwJxO4n4cpQ+bna
         i3gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769889044; x=1770493844;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C5HuJP/IjeG8MYwSuwdaWDcjCmDjLCEPWCcLYeFqHpM=;
        b=ufLGbSKUH3nr2YLZtWf7VJnKZ4GufiMwCAU6zJcr18OaJ2xkMTMxb7qHP4vzi7wYRp
         WCL2509h9RD9cVLogiIpsDG/2FpTg9T9v/sQP262R4ZYdHUUjP9VCb0diAFP5yV/mxpD
         atwWycmKksND4tVis7W74cAOZ/trIKmyOZ7aXPeP9ZJKhdn/g+pPWw8W80zSmpHv5Ycd
         HCmyrUDikNHBd6gXk20ZzdOoXHTsOxRJc5aGUuWa2TcngDguNzVNBicEQERGStRA0DvK
         u9DOiajVRPLV/Q/c2evBG7w9b6wo4b+t53HaPdrq65CfLZbSh6l4gKybIh3x7Sv9VKtG
         1MIw==
X-Forwarded-Encrypted: i=1; AJvYcCUU74SOMXb2CVPRyoplgSw5ZJ/EptC+MUFV2Gm6gt2xJ2UqqZW28m6Qw0x9gMSmi2Orulvp+t2zvOm/@vger.kernel.org
X-Gm-Message-State: AOJu0YxF1fuqrkUUl+m3cMKEJVJJjMFpMgD+w2pUaufYflpJccHGuuaI
	mmG3EI2pdTK+tUSP88av6i9j7GTSpDxKxBtZjTyPIH1l1JuSfwLRLbblggjkkg3Nj5s=
X-Gm-Gg: AZuq6aIeBFX344FGCPTNrsFDdwnW/2ARPNSRU+PF7ROs/odBYJoxg6yu1eqarlQBafv
	FoBRnVAd6M4YUj9DGVArVVWdE4YCmABTRVTHBobyVvX3rpyg1eJRy3vk7aHBPmUHU+TohTiQBov
	ZE0uOBmA7fHxYPONQ+QZz19YzRstzvyCbQo71YritzRCETLjxXBagGduSHLXiMqQnBvcCngGzkN
	beaKHEMTZu7m/3rWndX/puKM12WSwhjrX5hITAAtF3YMHml8nldKi2mO8pyQ4CaqBoU9CCR8dU2
	5uwpTftAYJjdVu7kEBja8BywScNtBzP7Q9vRE8VmdVt0zN8mC3xlLoiO8OuXxxPVkUAFNMY0AEM
	LeohLRO95OSFU4Rrs4mb367tp45v80O+Sht7sl7aZLBgEvholKn+HCJzThK/yCykhCqOwRPyBHT
	5haRzl8m9DzZbd1AsRq79fiiKzUgKSEy/yMVaxyJ3wX9+e1ZdzQDnarj0KIFjD
X-Received: by 2002:a05:6808:2222:b0:45e:fff5:89b4 with SMTP id 5614622812f47-45f1e280e98mr5623957b6e.10.1769889043924;
        Sat, 31 Jan 2026 11:50:43 -0800 (PST)
Received: from ?IPV6:2600:8803:e7e4:500:c7ef:51f2:4f7a:6cd7? ([2600:8803:e7e4:500:c7ef:51f2:4f7a:6cd7])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d18c7ffa49sm7655737a34.20.2026.01.31.11.50.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 Jan 2026 11:50:43 -0800 (PST)
Message-ID: <1ae1f69b-8a72-4831-a6f4-cd7dcf38f793@baylibre.com>
Date: Sat, 31 Jan 2026 13:50:42 -0600
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 03/10] dt-bindings: iio: adc: cpcap-adc: document Mot
 ADC
From: David Lechner <dlechner@baylibre.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>, Jonathan Cameron
 <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Dixit Parmar <dixitparmar19@gmail.com>, Tony Lindgren <tony@atomide.com>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
 linux-leds@vger.kernel.org, linux-rtc@vger.kernel.org
References: <20260125134302.45958-1-clamor95@gmail.com>
 <20260125134302.45958-4-clamor95@gmail.com>
 <92858c73-1e11-4283-8ab6-1188e8bae0df@baylibre.com>
Content-Language: en-US
In-Reply-To: <92858c73-1e11-4283-8ab6-1188e8bae0df@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[baylibre-com.20230601.gappssmtp.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6794-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,analog.com,bootlin.com,atomide.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[baylibre.com];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[baylibre-com.20230601.gappssmtp.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dlechner@baylibre.com,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[baylibre-com.20230601.gappssmtp.com:dkim,baylibre.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 72682C3BBA
X-Rspamd-Action: no action

On 1/31/26 1:48 PM, David Lechner wrote:
> On 1/25/26 7:42 AM, Svyatoslav Ryhel wrote:
>> Add compatible for ADC used in Mot board. Separate compatible is required
>> since ADC in the Mot board uses a unique set of configurations.
>>
> Logically, it makes more sense to readers to put the DT binding patch
> before the driver change in the series.

OK, I didn't read carefully enough that there are multiple devices
in this series. So you already did what I suggested. :-)


