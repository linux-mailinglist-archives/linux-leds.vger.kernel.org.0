Return-Path: <linux-leds+bounces-6795-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gJlAGTZefmkjXwIAu9opvQ
	(envelope-from <linux-leds+bounces-6795-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sat, 31 Jan 2026 20:55:34 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FCC9C3BFD
	for <lists+linux-leds@lfdr.de>; Sat, 31 Jan 2026 20:55:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4572130160E0
	for <lists+linux-leds@lfdr.de>; Sat, 31 Jan 2026 19:55:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2382A36C0BA;
	Sat, 31 Jan 2026 19:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="rmw5E5Of"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C05D36C0A5
	for <linux-leds@vger.kernel.org>; Sat, 31 Jan 2026 19:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769889330; cv=none; b=Q6oMGxNQ/mtqKIy0b3ybvWrgcAI4EowZuJlNYIg9L7Bbw8jR02MARJyiCiz9MERUpUq8UhAhkq/i7dHHBAUhOvf2VHXBBjIqEOeGNlG1sU37M11yAcrxlrk8OkWVaRod6FVOUOwt1FBzyNKGYtxwuzeKhxqT5qjB/El+YDbO4c0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769889330; c=relaxed/simple;
	bh=t24mKOVNxxmWMKS1t9FekxYrZBCi//zHUHXDdl8G0I4=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=ToBKrWDRQe/npEKfoddc4GnGHIlAc/iiNiw9mbYSjhqcrc3fDngkEzFW0kcdrE2TNnlxmeR0Qj4Lr28hJ1YYh2yOhbXETeeg/Ehq9fTzI6NCSVooiFusXj25HyccNQ7/5LJG4zkYdimBN4l/pv3KqFPSNzmdqbd6gh+00e0QesY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=rmw5E5Of; arc=none smtp.client-ip=209.85.167.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-45f18e8f2f5so2151303b6e.3
        for <linux-leds@vger.kernel.org>; Sat, 31 Jan 2026 11:55:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1769889327; x=1770494127; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=H+VFD3n9uqCeuR5oa2hiu8NEEffv6cHN447B+eVXKTM=;
        b=rmw5E5OfI+f9amD6CdjrhJUpCNx27t7LETFfGMwZRE2lrMnm+9y2OQjwmxPrPW3man
         V+6nlU0IVqBn+5Th+W5/mcOEgfotdTkizpd2otLJePaCosTzUajbyhOjOr03lyvDqS1L
         0vGmSifl5cJkBqZKsOoRj7Ni7bioYTOOF+lhA0tesl//JzQduo+CUjDj4rbSKrgb7CpN
         NG8VoLCp2bpkgTW7tN+JFY0GA8HV7zzcDFzp/LKq/NFzgTcHbwav50ItqfJBXsGFtsXk
         oHeBuJ63edbLWvskebiTUHsHfVdTs+Wz7SVoouNmPdwCAO0HOuudFCchDS1w8pa1xZTF
         lefg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769889327; x=1770494127;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H+VFD3n9uqCeuR5oa2hiu8NEEffv6cHN447B+eVXKTM=;
        b=pLS1F7+v8c6dhj/zgNFJLEjDGdu2mF5AfqEW3ui0U+kA9qX1yaP3H9XJHHCqkABD36
         hlVSiu9GgnKUie9Fg+zOF0z1ah6QZcoBCwPYAFdw+xBug2Kng2SSijMCIUMSE37LhQB8
         KCv2AlvHy6nzaxeHD4aXMzxu2wvT2loh4ZM9lOTlfEJrbAyOQDYEc/2O6VGP6JRyPVg0
         uzhwFoOqfwFIDCNP1IL/EgcI5c5mbhwqCQUScbcc2iA4EEcFdIsHkMrw+vUA+cwNSume
         5ZvD70iLY6EsetjOmIbD2bkoGi7/TOBOhKUmzSt0YprMip78Rd5G142NRUHzCaHi0V3q
         7u3A==
X-Forwarded-Encrypted: i=1; AJvYcCUN5zt1KAGG5wRfCZtSVxAyIUXMf4wYje0bS/H8jxEvZ6Ubo/jEma2otn2+gZ4IaDTJY5QSyZDzVsK9@vger.kernel.org
X-Gm-Message-State: AOJu0YwAwqQP59aE44vxUwCZQAWY5x3PR2cQiJV7dsQ4eLIqG/kwLXUk
	fl5+XVYxUYjqPs+eFlNqgMXHJS87LLbV1hijVUkxezRSBn3RU/h6WZUl12UGzDeYaCo=
X-Gm-Gg: AZuq6aJqgOvTGMLGUDRhh5lqD8VLmXVZsqaXgZkF1D0lYHqn7oY5y+2NKneW+5OqXou
	dTtAUz9+ukkZbXZ/moutXzGGm88hyyoCrgd1sle5q/Y21MnBNaHInnYNQ2PFEsvA5WpiGC9gypK
	z2eI8rjgbDK5gL56I4MPWFbYcB7xw18hJce9Bo8LctxlQosiXAY7Id5LfrgV9e0JmxwTuT5Qjeq
	ZojgHw7LeQOrBZaP90c0Y+BMeqkAvOq52v/xoC/j+OyJ95IVz670wFDuXmEW4Rkbj8Y78W5WvF/
	t521qEADf4X3/aJY/aUcLH7mGtdyUyTuIieTLC26RGC2FX4Dk6HUvfNps71KNFPUgp6EEQWsWe3
	0FP/bVgk13f2UBA62ABdOYIDTVB2Z4EvNioD/X4i6kajV0jzLTkXjis9wjynj6Fz4BOmgAztRTv
	3orWUi1X+0PTrNwsVuHcOi5PhXzXwaTVESTZV/KmuxnRnCfbcI71+E0ABK62Vj
X-Received: by 2002:a05:6820:2228:b0:663:8c2:feed with SMTP id 006d021491bc7-6630f3d4c04mr3300269eaf.83.1769889326973;
        Sat, 31 Jan 2026 11:55:26 -0800 (PST)
Received: from ?IPV6:2600:8803:e7e4:500:c7ef:51f2:4f7a:6cd7? ([2600:8803:e7e4:500:c7ef:51f2:4f7a:6cd7])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-662f9a49769sm6775854eaf.15.2026.01.31.11.55.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 Jan 2026 11:55:25 -0800 (PST)
Message-ID: <8cedbb9c-9f72-43ae-a23e-705b3feb85fb@baylibre.com>
Date: Sat, 31 Jan 2026 13:55:24 -0600
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 01/10] dt-bindings: regulator: cpcap-regulator: convert
 to schema
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
 <20260125134302.45958-2-clamor95@gmail.com>
 <d7938728-fded-4d5e-b23d-a8346e3fab46@baylibre.com>
Content-Language: en-US
In-Reply-To: <d7938728-fded-4d5e-b23d-a8346e3fab46@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[baylibre-com.20230601.gappssmtp.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6795-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,analog.com,bootlin.com,atomide.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[baylibre.com];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[baylibre-com.20230601.gappssmtp.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dlechner@baylibre.com,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,baylibre-com.20230601.gappssmtp.com:dkim,baylibre.com:mid]
X-Rspamd-Queue-Id: 0FCC9C3BFD
X-Rspamd-Action: no action

On 1/31/26 1:46 PM, David Lechner wrote:
> On 1/25/26 7:42 AM, Svyatoslav Ryhel wrote:
>> Convert devicetree bindings for the Motorola CPCAP MFD regulator subnode
>> from TXT to YAML format. Main functionality preserved and added compatible
>> for CPCAP regulator set found in the Mot board.
>>

...

>> +properties:
>> +  compatible:
>> +    enum:
>> +      - motorola,cpcap-regulator
>> +      - motorola,mapphone-cpcap-regulator
>> +      - motorola,mot-cpcap-regulator

This is what caused me to get confused on the order of the later patches.

motorola,mot-cpcap-regulator is a new compatible, so would be better as
a separate patch.


