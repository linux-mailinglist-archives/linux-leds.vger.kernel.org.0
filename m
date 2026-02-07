Return-Path: <linux-leds+bounces-6884-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8NyXLFF0h2ksYQQAu9opvQ
	(envelope-from <linux-leds+bounces-6884-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sat, 07 Feb 2026 18:20:17 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 487F0106A89
	for <lists+linux-leds@lfdr.de>; Sat, 07 Feb 2026 18:20:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 09D4B301F9CB
	for <lists+linux-leds@lfdr.de>; Sat,  7 Feb 2026 17:19:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A2F2337BB3;
	Sat,  7 Feb 2026 17:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="bFv0bPUA"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9489F2D3EEA
	for <linux-leds@vger.kernel.org>; Sat,  7 Feb 2026 17:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770484783; cv=none; b=hQTOxDg7iNoFYvJX7kHImuyNWHyvTI/YmtMJ7SStmNY3sk0nYPR3tSe0J2UL4Nzs1t2lHQLl0t9PQsA3vDzw+6xW6JcDwBjRzjQQZmais3nsCuYyAWj1+UuzpYunqREbnWdqvbloapadLm6gU5YLJw6kJDebhhyGV0N8EUYVsnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770484783; c=relaxed/simple;
	bh=5tSv0K2xPLmp03qZ0ySPg6fhMYjNHkDNBp7DBZrnlwI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qxYpAOMsszOxKYAELgZg3o79n0od7UqM1IWPESz25zyr03no6KNsK/Z7TPgDhGBH8PgcqNiwpqEpbj4WcaeL2D3HjtO33y92Ro5+qC4s/KCUkrFBMsgBmQWpIaqyu2luq1+D77qpHjfWy/Zzm3FO/DnEVfYqDzdqS2bx/z7S72U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=bFv0bPUA; arc=none smtp.client-ip=209.85.161.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-662f91bba0fso2631064eaf.0
        for <linux-leds@vger.kernel.org>; Sat, 07 Feb 2026 09:19:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1770484781; x=1771089581; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1W00zz5qVNYTH6MgjHmIYO/oSZsXOTum5yin9z3CGMg=;
        b=bFv0bPUA4Ofv6wEr0EqxOkBc+vmD3AnYnxyA0Qk678SHkvpIeT6265hZHeFxKWvqHB
         01AQi+I05chJ8BXxIclTtCpvXTyjdDUDIglhdoIkn2IzXlgc+A4WtlE3sfbQCHcB4P4e
         e9DWPSGSpzONL2PwMxYgjUej94lrrTfGtO+HtaiuVdK8tnUPLBe53VkTm8HPaJjmVnr9
         HKKUhDfweDqql9FQ68HGL5mLyMuOW4IWlwwBNSCcv+Gcchy2/oejnt/W2y7gSnZgKj1Q
         xd3VHBk9S6FMfPANuG66d6cea1hLt7aeWCdBRykH6AGPjbaQWNNgeHmTFiII45/LSvAx
         7DaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770484781; x=1771089581;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1W00zz5qVNYTH6MgjHmIYO/oSZsXOTum5yin9z3CGMg=;
        b=YvtBb1yFCQKTpmnsOaVS0CepXh/VH7FNsjfFMtSPZ+5YskGl5BYGJTi2as01v+TlGG
         wS/gGmHGis67HTSLWnK0O6exB8qGrEZxAjj2hTBWsI6+3Nb8Tu1kQNqowEuraeic2SHb
         mZonUeiJTh3tjvfRotBbhKa+0Yk1O/I8s/NP4Mp7QefReXlnsbs/lQ2rZZJAjUAXP07a
         NHA4zFrC1aHKdxjwK6oOQm8UkOxhkP0XYpthaFoS1/T/hAqqy6qF+O3fVMG1eIO+pOEj
         Op/DGnlXTkQ/06QnBbeOeE9GcMo4YeficJ4dahY/uaUEIdrbVSQ+xZo8igHlnvnNopwu
         kQnQ==
X-Forwarded-Encrypted: i=1; AJvYcCW0HewDLeeEI25Dd9bo0zoPaSjDHoc4XYHaHVrxR/C5stKS5Q5usmPjcPYdKw6LwWte21tYgxsbQWWl@vger.kernel.org
X-Gm-Message-State: AOJu0YwS5IhCmOXQj0psqXyEOXiQ+y5tuIGFP63ikdfftNBvHmYFnypI
	f1YZ8zERr8YbUI3RrkZnfbGegl2q7Z9DtNEpPZAadY/jHDjZpWxb0Papl3wvbkCuunY=
X-Gm-Gg: AZuq6aJaW56wtKB1aRtN71Ru5vF9guNgxoqh88od6ZYB6MV8DlB9hPYnmWvrzil2oem
	G/RtTrJcYoyrjsK8QATz2AwiXWtSna/+gpi6IzNKPqlSSARiexNkv7Wzpr9p6AAXHVBcQWxH+EL
	TZ++5nQhTJdqNFeNbJnN0O29lqaXuV0Q+f6RMv34ZnJpU7VGpkdg8u7AQLz633/rZurWUZrPsAa
	O0ngwpSNI3wsDHSuDURQBuyDmOpSHKdpAquXXA6z/s9Cm6VazLLB/93kJWVd6yGEGtdXpihg5H8
	J6FKsIrNmsh1YCk12lXkL5HBX6e5eyWSG1QPuqP2fRwrhEpWU9gbPPdGlyLMJ7ArkjXbVDxYUhj
	eEQ6rYIquX9CQH9H0/5snVBXmjdpd0WGMX3FTKodRB9sWnA3F7F3s/0yJolABbl2IjtXsTd9oCE
	nUntPwQ6s3jwQl5WBi9DBzI+rmFsP+SKvhS48J2MhvSq37BTtOcicSrE0JJz3X+q/MSQK0Ow==
X-Received: by 2002:a05:6820:3101:b0:662:bffb:41fc with SMTP id 006d021491bc7-66d13059c28mr2419479eaf.15.1770484781465;
        Sat, 07 Feb 2026 09:19:41 -0800 (PST)
Received: from ?IPV6:2600:8803:e7e4:500:74a6:843b:f33:21ae? ([2600:8803:e7e4:500:74a6:843b:f33:21ae])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-66d38bdeed5sm3004756eaf.4.2026.02.07.09.19.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Feb 2026 09:19:39 -0800 (PST)
Message-ID: <db9115ca-2c8f-4b5e-89ce-f3b934071a59@baylibre.com>
Date: Sat, 7 Feb 2026 11:19:37 -0600
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/11] dt-bindings: regulator: cpcap-regulator: convert
 to DT schema
To: Svyatoslav Ryhel <clamor95@gmail.com>, Rob Herring <robh@kernel.org>
Cc: Jonathan Cameron <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Dixit Parmar <dixitparmar19@gmail.com>, Tony Lindgren <tony@atomide.com>,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
 linux-leds@vger.kernel.org
References: <20260206172845.145407-1-clamor95@gmail.com>
 <20260206172845.145407-2-clamor95@gmail.com>
 <20260206230922.GA254792-robh@kernel.org>
 <CAPVz0n3EGCSLUX7jTLve0x0z4uW1yexViCwkSQLY2d_4r4qkjg@mail.gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <CAPVz0n3EGCSLUX7jTLve0x0z4uW1yexViCwkSQLY2d_4r4qkjg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[baylibre-com.20230601.gappssmtp.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6884-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[baylibre.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,analog.com,gmail.com,atomide.com,vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dlechner@baylibre.com,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[baylibre-com.20230601.gappssmtp.com:+];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,baylibre-com.20230601.gappssmtp.com:dkim,baylibre.com:mid]
X-Rspamd-Queue-Id: 487F0106A89
X-Rspamd-Action: no action

On 2/7/26 3:20 AM, Svyatoslav Ryhel wrote:
> сб, 7 лют. 2026 р. о 01:09 Rob Herring <robh@kernel.org> пише:
>>
>> On Fri, Feb 06, 2026 at 07:28:35PM +0200, Svyatoslav Ryhel wrote:
>>> Convert devicetree bindings for the Motorola CPCAP MFD regulator subnode
>>> from TXT to YAML format. Main functionality preserved.
>>>

...

>>> +properties:
>>> +  compatible:
>>> +    enum:
>>> +      - motorola,cpcap-regulator
>>> +      - motorola,mapphone-cpcap-regulator
>>> +      - motorola,xoom-cpcap-regulator
>>> +
>>> +  regulators:
>>> +    type: object
>>> +
>>> +    patternProperties:
>>> +      "$[A-Z0-9]+^":
>>
>> I thought it was said on the last version to list the names. Considering
>> you already have them below, better to put them in schema than prose.
>> And pretty much all regulator bindings define the names.
>>
> 
> What exactly do you propose? All those names will not fit into a
> single unbreakable line (more than 125 columns in length btw). Patch
> checker will complain about this. Duplicate pattern properties for
> every few names? Please be a bit more specific. Thank you!

Making checkpatch happy is not a hard requirement. If you have to
go over 125 characters for technical reasons, no one is going to
complain.

I already gave an example on the last version. It is just a regex
expression. (And note that you didn't fix the $ and ^ either. ^
means beginning of the line and $ means the end of the line. So
the pattern currently won't match anything.)

patternProperties:
  "^(SW1|SW2|SW3|SW4|SW5|...)$":


And I hope it is obvious that you are meant to replace ... with the
rest of the names separated by |.


