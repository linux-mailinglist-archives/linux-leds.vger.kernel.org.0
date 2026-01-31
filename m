Return-Path: <linux-leds+bounces-6798-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iLv6JRdhfmn0XwIAu9opvQ
	(envelope-from <linux-leds+bounces-6798-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sat, 31 Jan 2026 21:07:51 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D2FFC3D4C
	for <lists+linux-leds@lfdr.de>; Sat, 31 Jan 2026 21:07:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0FB17301E207
	for <lists+linux-leds@lfdr.de>; Sat, 31 Jan 2026 20:07:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97F3D37418F;
	Sat, 31 Jan 2026 20:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="x1U/1PC8"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CB11372B3F
	for <linux-leds@vger.kernel.org>; Sat, 31 Jan 2026 20:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769890063; cv=none; b=tqivmxKRk0qfM8cjfZQlnzmfOt7mNrA6uQVZ+gYz2v+GTKWw5fjZs+6XcRntwaxd+mATEVaMX3mjqye/DqiyjYeYPiGX7Fdo3r3eLA10g6USTl8XtMTATifxk0bnKpAFBQwkId/kk9DP94iHQdB0Ph3LTs42RPZYdeB2ZorPllU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769890063; c=relaxed/simple;
	bh=xS3e8ju4KxAE1UqhUQJUikGXCG5dy7ygEKTrRJaBpbU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CQ5pzGa/z/2Zo+zhlUNK5+MXTJLgy+/VWdbZfj4VdwlgsrpaGYwsYQlYnHFqY7KcCHd/gU0+EmDUE+yRRurs52RIIFlUkSygn+qpkZHxeS/4HoMMtuLwvKnY+5o/+FO4QXbHbUIHR/f1wBrdEnP2JnayN6C8UW/s1+uc2bMsl0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=x1U/1PC8; arc=none smtp.client-ip=209.85.161.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-6630b08ad60so1417555eaf.2
        for <linux-leds@vger.kernel.org>; Sat, 31 Jan 2026 12:07:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1769890061; x=1770494861; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BPQweXePAIgWPUeP+4oPc8F9cW9X2kvvTvA2qMgRij0=;
        b=x1U/1PC8ypQ4/og95JWhBiybXRCyCtAVDSF0MrFdDFk9ftLe16ejZ1nRXgeaQsrafB
         xfYoiael/UebDWkNXf8t/1+z5uBTnIOl9e42uM9S98Vk68INVX1OrV/KucZ1hc2ZRh7p
         H+/pGdou2cPu7csl5U9WXidEYeg5bbG+lTZpwzStpJhsCxLcmNvmz3TAG7vpnOD4lMoK
         XVIlXmni7tFVE5hdL+vN/rn9F8AAoTqAoLrZTSyF/Ak0MYseO1yeusQ+9C2MJzclylds
         5q90dFtW7SyqZ7s77L1jPxULnMcBvUCVocsQRmcsGZZaxkZHd4D/Qkpou2I4F9gOcpmg
         V6rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769890061; x=1770494861;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BPQweXePAIgWPUeP+4oPc8F9cW9X2kvvTvA2qMgRij0=;
        b=rGTV7skZ+KXUqh0WhfAGPDWEkIjHxmCfzvaoKB+DDTcdPOR6fC5TbPMLJScQhijnoN
         mdkaXXZyqWsT6UnAqO5T/h9Ee2HlrJ3EN1f6NnH4ns2lK225+R9buTORkTiOU26aX0WV
         MADBm55SPf3Dh3wBRruLWjnP8MXBKCTTAPyWT3+hErD8G4TUV4qGDrlErnbW1DBNom6E
         xmQrHYP1BN9+iRHIiy0kj+rb21FfsV3qng1S9MCRFLJ4nQVCT0KSPvl7vvHa6YGJS6By
         fxLMIhjS7i0OlIGCZO/q1T5gsQP82OG3yfxvSWNYtx3BK4wU7LKX/Tvls5tUWvEnaPiu
         AEkw==
X-Forwarded-Encrypted: i=1; AJvYcCU1xJqxRMgMsH4tELWQc1/PDLOj0jfn/wcE3OJrVAo1tXj8BQ8apLP4lx5mVKkoiQz+fvEdMUbSgYYo@vger.kernel.org
X-Gm-Message-State: AOJu0Yxxv+jNuCkfahQx6Xw76+88D/iTWZTSDASjQ3fK7DBDvnuCnpK2
	zsrz6173fMPz0aC0fF6+Re6+JihTIADU6I+fLhfWPVmvB/Euu0J9bvVtpdyYuc9SbgI=
X-Gm-Gg: AZuq6aIaK12gY6Nk0wZsTIkyUrEU7J4hcKfDortstRwq0WYCcnH2FtPs70hmm0pR2CS
	jz/dDROJB17ctN3fPZRlAZiCwJ8codCc/tXk042ZEF67YYyRPkgBYRoPRP7B2Fkf5dkT6/h9GKF
	/TZDJPwLJ1JdgjUOK5pvB9USVw0ET61AW8JZaC105Wo52C4Rx4pFc7YLe7ai0DmP1zB9deZ5PRb
	0PGxy/Y+RXcAsPzLB2iLv0jQ/nG4qxpqo2UK9sOnGvyrw95sRn5y9YMr3KVOhadQZUCiCFnyM1J
	wkQitUR3uAM+CewHYLt2fztkYZ11qqwQVmiQqh7I5y5NWXWiOnpoDnsS+2p679L6lKXmJbH+DFp
	nNyKO/+Vc/wtysd16LyEZQrau8uBd0Ch4TNV4v99BxCRa/2071Wil/ac4hDn9YJdnjxGyGMJpvA
	sw/3zsGevXEt1Iry9rnMfZTe888CtFLPlwXtIUdi/WUEqSQcMY0K27Z/tXq21x
X-Received: by 2002:a05:6820:623:b0:662:ff14:58e3 with SMTP id 006d021491bc7-6630f02bd08mr3021888eaf.25.1769890061056;
        Sat, 31 Jan 2026 12:07:41 -0800 (PST)
Received: from ?IPV6:2600:8803:e7e4:500:c7ef:51f2:4f7a:6cd7? ([2600:8803:e7e4:500:c7ef:51f2:4f7a:6cd7])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-409570f63b4sm8571762fac.3.2026.01.31.12.07.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 Jan 2026 12:07:39 -0800 (PST)
Message-ID: <fca2c04b-fe1c-4685-9c80-b0d7d37ced60@baylibre.com>
Date: Sat, 31 Jan 2026 14:07:38 -0600
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 08/10] dt-bindings: mfg: motorola-cpcap: convert to
 schema
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
 <20260125134302.45958-9-clamor95@gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260125134302.45958-9-clamor95@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[baylibre-com.20230601.gappssmtp.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6798-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,analog.com,bootlin.com,atomide.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[baylibre.com];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[baylibre-com.20230601.gappssmtp.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dlechner@baylibre.com,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,0.0.0.1:email,baylibre-com.20230601.gappssmtp.com:dkim,0.0.0.0:email,baylibre.com:mid]
X-Rspamd-Queue-Id: 3D2FFC3D4C
X-Rspamd-Action: no action

On 1/25/26 7:43 AM, Svyatoslav Ryhel wrote:
> Convert devicetree bindings for the Motorola CPCAP MFD from TXT to YAML.
> Audio codec bindings adjusted with common ports node for port@0 and
> port@1. Added compatible for Mot board CPCAP. Other bindings remain the
> same.
> 

...

> +examples:

Ah, I guess this covers all of the missing examples. The other commit
messages should say that was the plan so we know why the examples were
omitted in the other patches.


