Return-Path: <linux-leds+bounces-6793-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +Fe0AK1cfmniXgIAu9opvQ
	(envelope-from <linux-leds+bounces-6793-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sat, 31 Jan 2026 20:49:01 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B55EC3B4E
	for <lists+linux-leds@lfdr.de>; Sat, 31 Jan 2026 20:49:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id BE1A13005142
	for <lists+linux-leds@lfdr.de>; Sat, 31 Jan 2026 19:48:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06BBF36AB7D;
	Sat, 31 Jan 2026 19:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="E0yl4gOO"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com [209.85.167.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8467F36AB58
	for <linux-leds@vger.kernel.org>; Sat, 31 Jan 2026 19:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769888933; cv=none; b=s7A8Ly56DYceq0Elc+dGHISZ54rLfTVmzA65V0a1IhC9ZWuggn8ddhPhVeGYaIg+430j5tqQlDbElFCHQvYWU+xcTWqdEi0M2ERuE4hwiRwlpV2D/YQZuXZd8O0blPNmwvMShHHgqNioJ6tZLuT3Ug6DJGQq6UvEAxAiK3XsCZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769888933; c=relaxed/simple;
	bh=dPpm3l3WPw7+UtDy3mOZiDg1GUUhyRC4lyTEv3mW62I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ISzfBol5u2AdH2jhAp1j2bLw9jyYuOkkQorlFQSYyQnu2L+FBYOTzOhpmYBue1hszUItqptw9ygzy+aC17G5h/K2Y8+lNTzNZIZHdSAHnUt20/5qBBnd76R3eRHiyzbwQ1pXhzq7rwgampRK5YZ95svRaJ90sVpqV8csFkQo+7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=E0yl4gOO; arc=none smtp.client-ip=209.85.167.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-oi1-f196.google.com with SMTP id 5614622812f47-45f015a3259so1275948b6e.2
        for <linux-leds@vger.kernel.org>; Sat, 31 Jan 2026 11:48:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1769888931; x=1770493731; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xQ+TaOsJS1d5at3UMn582LZcj7u6OHzNvDSFQmdpmyc=;
        b=E0yl4gOOFJpyySVsDmn/hpM5PSAkXhwDmN9vu9ibhwoX3SIpxHFAmf2pflTYaKtDtm
         AYu4l00lCHJz1k7nAYHzHA58SXe6YDVPOgq3+K6ygl84RCCfWQNYwj1fCbmIVYcJ6QG6
         urTM6ZT+706m23jvUGoDLMc2HgpxbbwWVqQpNXevw0ffTzxpQPaI5lqJK7qvVf3F8iYJ
         T9ZDnE1wyUl96tjA1xkw26atNQphlfRMD9+EyoMYas37+ojq0jc3ZB2px2e90PpVQ2d+
         J/2ClZEYAFJZjDkVIFqR40XT6+zEsnciAbNGJUVcJV3ZYTh2RveYHNroMvyjhaA4EgB1
         qegg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769888931; x=1770493731;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xQ+TaOsJS1d5at3UMn582LZcj7u6OHzNvDSFQmdpmyc=;
        b=cpUm480JG+rfYoswMl+ErfbE8OqykJPhTQjtdFNTaWuMctZG4TxydrJ4H/tiN6nMoS
         bSfAAjk2qujJD8eXa0DQn52poMi277KPhe2dQz5yEllwXn/5jqmC84P3KmLfIgygjsLS
         f1uc2nwUldYXf9tecMFaqvzbwRp7E1eUuo229zCHLxie1mjnbI7wRUqWMeKwOcp4y0sy
         sMbx+GcfHsHp+3AQ9sfaskOjJ5BghXbls4vy4bprmxrPNCsTaSwqxLbZYWHDNbtBoApR
         LTqT0qtCXnXP4taZmmEdYCCYrFdZtKDhNLBsKu4pJZQazQ6rvu11AOzKDAfFn3Xcf+dK
         PoNw==
X-Forwarded-Encrypted: i=1; AJvYcCWCglN+B6EFOeXdfXJWEt3PZgpHy5NmGDbEXCEkiY76MchKe7vrfsahMVXZzyzJjbEIOJ4Gqp+rtnBq@vger.kernel.org
X-Gm-Message-State: AOJu0YygjVk9zRaKWeAGlHWgFaxyzqqtd9fjXtZPjqMxRQe/6GjIYoJu
	xwa1AiCnTX5zybU4Oac9odvHGYv77EqMIxzyp4qxVCsxaySQ3EJ0bJMErtFXdy+NGi8=
X-Gm-Gg: AZuq6aJc5kuTUD2xmw/NGgsIoeeSrMtsFFskgdHwOCiiEbt5Oq3tUN0DwhK9mqffZsN
	eu42KdHUZJvky2vNUC8RJwNs2qqCLrbLeRTL8zuy3yo9wIo8LxsdRBgfO4wQl5TXmZXpzEZOLXG
	qzVEH8t5hPl5Uy3j7CfkAawqY4WSa1rU1LOZ8qHOcnpWdhce0ZJIc557DxP1iMjU0NrDwmsBCcT
	0dadTHcl4r4FpvJYHZZSSLdgkADfxoAOwn8qDLIp/NEwLVDf+OGnr1BS7qW8f9oObQzssE2KmIp
	8o/NdKzWBTgnpmmMPjW/QsRjoWUfRJ4GkpwLKlIpjvTwrqtGdUu4SEb07mjPoVbmC+RvDaOQnP8
	zQbEzP5CZSsuFUzI5hBPVCd9yBWKIusFHDmpuw20cVommKcn5pLrwq3fZLv/owD2zottFSzXg27
	hT++oXDG0a3/rzNb8WKnYeu45A3FkYeFGDHiz2k6+L7HHgMVzoePIzox828J/J
X-Received: by 2002:a05:6830:82a7:b0:7d1:91c9:9e5a with SMTP id 46e09a7af769-7d1a5232569mr4532126a34.8.1769888931469;
        Sat, 31 Jan 2026 11:48:51 -0800 (PST)
Received: from ?IPV6:2600:8803:e7e4:500:c7ef:51f2:4f7a:6cd7? ([2600:8803:e7e4:500:c7ef:51f2:4f7a:6cd7])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d18c67065esm7778648a34.6.2026.01.31.11.48.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 Jan 2026 11:48:50 -0800 (PST)
Message-ID: <92858c73-1e11-4283-8ab6-1188e8bae0df@baylibre.com>
Date: Sat, 31 Jan 2026 13:48:49 -0600
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 03/10] dt-bindings: iio: adc: cpcap-adc: document Mot
 ADC
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
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260125134302.45958-4-clamor95@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[baylibre-com.20230601.gappssmtp.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6793-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,analog.com,bootlin.com,atomide.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[baylibre.com];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[baylibre-com.20230601.gappssmtp.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dlechner@baylibre.com,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[baylibre.com:mid,baylibre-com.20230601.gappssmtp.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2B55EC3B4E
X-Rspamd-Action: no action

On 1/25/26 7:42 AM, Svyatoslav Ryhel wrote:
> Add compatible for ADC used in Mot board. Separate compatible is required
> since ADC in the Mot board uses a unique set of configurations.
> 
Logically, it makes more sense to readers to put the DT binding patch
before the driver change in the series.

