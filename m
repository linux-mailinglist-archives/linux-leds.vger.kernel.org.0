Return-Path: <linux-leds+bounces-9081-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xlkrKxQ7VmqT1wAAu9opvQ
	(envelope-from <linux-leds+bounces-9081-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Tue, 14 Jul 2026 15:35:16 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 65F9E75534E
	for <lists+linux-leds@lfdr.de>; Tue, 14 Jul 2026 15:35:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=HAMoLggN;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-9081-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-9081-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 44D123064AAC
	for <lists+linux-leds@lfdr.de>; Tue, 14 Jul 2026 13:28:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5ACE33446DA;
	Tue, 14 Jul 2026 13:28:44 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA38B353A96
	for <linux-leds@vger.kernel.org>; Tue, 14 Jul 2026 13:28:39 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784035723; cv=pass; b=s3gvCIww4B4y1vLcIFkOWAT40YGm0aXxD5prUiwiDUCrXJ4hLtHKUwkgNx6aj+ChLvdvesC+AQaQqUg+VZVwgzci2iGavvpx8hNYRsqutM8KUAKoFKcnJB+OF7xHN2nyxT1cO3/sohrXHdcNnP1OCt9ReluI7eEbYpbENnhsaV0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784035723; c=relaxed/simple;
	bh=ue6jFvPPvjqPgIpHsXNu6T7RM+b3RNh8Y6zW7p+85hQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QJxGrYEeAhUhYLAZ5YTfvyWO+iyOttk/TWgpr56M54fMo5jTyKrwF7YGF5wdNxyyaQNSWwiuJZJh3CAapI6Z7Ej9xhM5aL+ZZKzAn9bdfPku25EvpIC4JnFIfgofwLeqkSTZ/D5B9qksJwn/6P+7htFhXSvKwa+6d/0/Kgc9Sy4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HAMoLggN; arc=pass smtp.client-ip=209.85.214.179
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2cc891373e0so51219825ad.2
        for <linux-leds@vger.kernel.org>; Tue, 14 Jul 2026 06:28:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784035717; cv=none;
        d=google.com; s=arc-20260327;
        b=Z2fQAj1vnM1QoobgExxBV16/vl7EMlcrrm6iUEbjXrfi8e40pAFX9pSWwVeFbylpIl
         J+QRuUUl3BjnmRBllYkbk4R8NaES9maqplMjDk2hRGtgKdn8nSEMr2FuWDxQK9M5G3ja
         2EAY5SwWfzxT9UsBLtun8nL+yfWk8FX1jc26bsNIbFI3KYu3r69g5iscFV4r6KMBTR84
         /0OSS8YercAxNybAkHRveioUCT1M7Voy/RHLrpGAY9rYS3g5+ZzV/lJIa0GnKYIOs7WL
         M5SZ+QjRC7wAjjjJTrDGu8g+BlQsXIi7epS1EnGchnemfUiv2+UBxMOnTPStAryeGYuZ
         IOUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ue6jFvPPvjqPgIpHsXNu6T7RM+b3RNh8Y6zW7p+85hQ=;
        fh=rtah2NOZMRff4ydf38vwsjV2TPeDtwZMmIHPTU0VY64=;
        b=WwInUswDbbcqNXmneW9/G2u+P/LxBhb7taMKFWAlpZSAkcbVM3uCp20iMEnyiP89XU
         EZcbpoeg1eM0PLW4V3AB5OSih0b4DOuLpgquyqHfb4M3sOZJmRRkMnxVRUQb1Px4ADKm
         c+Rspm7yR+vJ9oJVFb7kcDNpg4BGTmQzdRRKjsZZgpTpYvg1WghLrCXThw8u0mTMyMcd
         XhLeaLQtYZ2CxjoWjuc6J30vU9+kWbH/Lw53G8Ox6Y3pph8OAML0XxESeGzb4g07chPr
         YoizdQWIiGnbKD86ec29qQ3vJ09D6oJsDijruUAuiW569BJCHzm6sHtfFYV4E8HWWfx8
         7mTw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784035717; x=1784640517; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ue6jFvPPvjqPgIpHsXNu6T7RM+b3RNh8Y6zW7p+85hQ=;
        b=HAMoLggNikNfjMaUSjRVs0LKsdZLYv3PPjXr/y1n/bgfeuEWuMbtBEeSeu3Mo4dpnb
         xBWJuI9zz+8g/MpuGUW6WoFposV5HBQV4iEtgMSAkhvsuNGWlsSPZJ+Fq4weUHTdF1ht
         XldyK/rSwsiVV3E4u9TlNCjlt3Ou2fkoLA8RZMEXYqBzcpAXQghG1Qs88zaAroZ2yqX1
         KfYl0+I7ARIkLrHU0obMlW/vLijtNhknmn+ZjZif4tfwcvWHHaYWf5/HzYpfEvh+Ad63
         +uKJ5fbN33gdlEzUd3aolfkrLr4UALNV4xPZv1zsgyrd7pe6vjxEn/lPRxc7yPMrnTkh
         cEsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784035717; x=1784640517;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ue6jFvPPvjqPgIpHsXNu6T7RM+b3RNh8Y6zW7p+85hQ=;
        b=ghVg7sGgRmtQnmZ6PqoVUkuko8wJENT+Mr8C0QshPw+WfK65dKavJIG+iQgQC6fiK/
         MTT/KAKflS5RV0kW04jgvYmCEHC4YtNFMtYfwmp3uHulfpL/8x+WVFiIG1sDXCVlr9yc
         w2oB9oUd+1x/oprnHSouDxueQKP19We4UwD8YnfSxfSe/VKErXYYz3sdHd/9XWeMOoSE
         XoCOw9UWyau9mWez8BWJA3jnw0irZqWHxFtZcLw5wYloJYJN+vDLPVvNq9PoDsO7cK3t
         55j+iy+MKSiEtyLdiiE9tF0DQaOjhGlaKDhy0QHjQZa8zt1weD7X553hMNmrKNLrDkfD
         vnQg==
X-Forwarded-Encrypted: i=1; AHgh+RobMKd6nHcctvTrq1Yn5A4p+FgFEUIaHQ12ydQKrqImeKOoNMAn9CF3d53cGa2Uh5RI8A3d4apZWJeS@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2Vwig6tCdVUEiV1Y5ASaBwtQi3hZbvARmKFzQUsvlD4RuWKox
	ccKnH3FG/mQs84PPeBwhtXDwEV/nBXQsoiPGj1a5qaXVbqRVdCORgkqNWW1KECKGq7oI1zgxlLF
	oqUBCuADd7/df2eDOQUuYJRsK3o9lJ6g=
X-Gm-Gg: AfdE7cnq9u+KiK0XgUOeayMIFIg7ryIITfUw+YM8RP2ErgvKwpLXKtV2ZjGkaNSZlxS
	CGuuNKgA/z0yElT7t3pu9rOCmc5ugpGVYpbiqytUxXZ7f3rkTvcRLQMmout8tyl1f83StkuoV4p
	Ofd8zU5hKZ0dzVx+/zqaIw9tKjxysEbNRCY4usmwaOc6c8ZZQPHPnucC4xcN0IZwNXYhh3QMdoQ
	izWQKwBCBIrufu6y42h4aVrwr/I069gSKGu9s6bb3/qjb3LYRRSqbhgDfADDT0DP3wU5oKZ9BRK
	RCwFYJPVZV9O3A+Q/Wc7NyKG/RwPiA==
X-Received: by 2002:a05:6a21:7486:b0:3b4:b6d7:a992 with SMTP id
 adf61e73a8af0-3c11062f70cmr15032381637.8.1784035717203; Tue, 14 Jul 2026
 06:28:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260617080031.99156-1-clamor95@gmail.com> <20260617080031.99156-5-clamor95@gmail.com>
 <akeF_VrijPbebz3I@hovoldconsulting.com>
In-Reply-To: <akeF_VrijPbebz3I@hovoldconsulting.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Tue, 14 Jul 2026 16:28:24 +0300
X-Gm-Features: AUfX_mzREZozvqJIpCZw-bv1kiFlmVezGQdepbPdfuQMwUIt-LOogON_yq372Iw
Message-ID: <CAPVz0n1+wrq+g3p3UTc3hzHcsz8k02=QsvmseBD45d+SoSFsBw@mail.gmail.com>
Subject: Re: [PATCH v5 04/14] mfd: lm3533: Pass only regmap and light sensor
 presence to child devices
To: Johan Hovold <johan@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>, 
	Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Helge Deller <deller@gmx.de>, dri-devel@lists.freedesktop.org, 
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, 
	linux-fbdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:johan@kernel.org,m:lee@kernel.org,m:danielt@kernel.org,m:jingoohan1@gmail.com,m:pavel@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:jic23@kernel.org,m:dlechner@baylibre.com,m:nuno.sa@analog.com,m:andy@kernel.org,m:deller@gmx.de,m:dri-devel@lists.freedesktop.org,m:linux-leds@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-iio@vger.kernel.org,m:linux-fbdev@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-9081-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[clamor95@gmail.com,linux-leds@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-leds@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,baylibre.com,analog.com,gmx.de,lists.freedesktop.org,vger.kernel.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 65F9E75534E

=D0=BF=D1=82, 3 =D0=BB=D0=B8=D0=BF. 2026=E2=80=AF=D1=80. =D0=BE 12:50 Johan=
 Hovold <johan@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Wed, Jun 17, 2026 at 11:00:21AM +0300, Svyatoslav Ryhel wrote:
> > Instead of passing the entire lm3533 core data structure, only pass the
> > regmap and the light sensor presence flag to child devices.
>
> Again, why?
>

Because none of the child cells needs entire parents private
structure, regmap is all that is used.

> Johan

