Return-Path: <linux-leds+bounces-9079-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id uwgiDFc6VmpQ1wAAu9opvQ
	(envelope-from <linux-leds+bounces-9079-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Tue, 14 Jul 2026 15:32:07 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 79E8875529D
	for <lists+linux-leds@lfdr.de>; Tue, 14 Jul 2026 15:32:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=LZf1aXd0;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-9079-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-9079-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 503A03096211
	for <lists+linux-leds@lfdr.de>; Tue, 14 Jul 2026 13:27:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A2A93191CE;
	Tue, 14 Jul 2026 13:27:03 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B65503368BF
	for <linux-leds@vger.kernel.org>; Tue, 14 Jul 2026 13:27:01 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784035623; cv=pass; b=iAqSgi7Y1WEOA2yJc+33T/dIJzweHViq7RbwxKWXGhJNLZ1Dl1AurzOZc0Meya4RgfKeYuehsoufcgT2QtenINCBwX0RYQAmM5iyc9bIVtQ9aJprNmCk8yyOFIlzLDgeBMvIrCmLN7m7j4Gn7VS0xtk4gmcfNz5suLfsB0r6wKU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784035623; c=relaxed/simple;
	bh=nO1TZgVYGZMERjIgcqsTAqDB/ZWtf6AUfRwRoLJPVvc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nQpjbf+jGUNrchYLm0YO5qaVpZESLsxYdPfPffObS2XE57xQqbGH+pLACgT999KcG1j7KlZ48uNCc9wddSVZmcuJTnKTAEKB9+cNQntUG5N89oJkd57nfIcEU2MKAucvwrCy2LKqdfIn93LC3z/VkBghLlUOG2hzTk2FGKbDBc8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LZf1aXd0; arc=pass smtp.client-ip=209.85.210.172
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-848d21bbaffso3254039b3a.0
        for <linux-leds@vger.kernel.org>; Tue, 14 Jul 2026 06:27:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784035621; cv=none;
        d=google.com; s=arc-20260327;
        b=sCtVY4UiL+h5b+vUIagjlHk0ZgRv0aTPRxThYIKgQOqMZxCkB4dPrfm7t8OFmNYB3o
         FXR4X001dGuD2qZQJgpfUT8EaeONu8Phq+mShK4gcexXIPctPJz5c4+wxM93T6CUmpDL
         ECJKd3DHyIUFfm7ScKyCaq0FbF2KkNZeSC+ifNHls876VrLUjYLmBCYSv/xKo7IGeAr1
         EH0dTbpTcSQIfNpEbENa3qs1xriLWdZ6Q7QRhawedtlOTVzBnja5HWHJOi+3AyjAv9G1
         W/AWtWoKDx9/QsjTWsh2cE9ubnEKxJla7nXXR0TTLqJjMvqckYboC2Ac44RbpmEFRgP1
         XxTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nO1TZgVYGZMERjIgcqsTAqDB/ZWtf6AUfRwRoLJPVvc=;
        fh=31+N2Exzf/5A/oZPD8vInQ5fsFailXAvCkPla4O079c=;
        b=moo8WEyqVuFVpemc/BjfP4idrOTFjdx+W2GAyu+C0ZlWXCY5nfHXhAd8GloriL454j
         WmNtC6RXo8xAKyZqPzMRmOJluv8EUhrGH2GmCkNNnIPE03ew8gsYMDrqJB7qzS8umOB4
         p+69VklWKXwqMgXLuJiYqQdKv0pC4YTi0/Fc7Z6xYCcXyFDy5yKEfi7J67tVvbAplYct
         Q+LiRsUkvk5Vuw5fMbjd/riTezo/S/5/I+2vIelMYm6vztuNxRr1CLlEDeUdd8+AEOpq
         9fZTmVHiVnR6lwFAO+avhNEA1xMuJugs/6NnIUzmyipeksTy7DYDHd6B+t5v/kQHtZNc
         U3zw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784035621; x=1784640421; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nO1TZgVYGZMERjIgcqsTAqDB/ZWtf6AUfRwRoLJPVvc=;
        b=LZf1aXd0NDZy+HyoV9fvHRsX5BLLkFdBKmoUP+hsams104OkhJru3dmMG/oz6E0o9P
         0rBAvVrCSCSIhCrYr1gNqDhOAvm3PLyO58snWKTApbRtlPeiTym32NPpIKOblXD7z4Au
         XPt5nXHEqkOwfqPqyrJhnwospmkSKWhwS0H/L5pvhr62cA74ZAcmldmq8cvN3/FhWLda
         ubfOxB4awH73kFJIDmWFoVzv1PT8p7cjjTzZTp67yTxK32oHIm+PEFbUlkuQtf0pJRUo
         ZYu+Ih1/KqqwSaHohotBUtpxiEb1E2iGPgYnM25zKGGTr25K0BBTuVvChnaBs+5J/TMp
         A2zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784035621; x=1784640421;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nO1TZgVYGZMERjIgcqsTAqDB/ZWtf6AUfRwRoLJPVvc=;
        b=SrM03o3yheWVduNOmVwgw9cxnjFYkmo2HCouh6crfjBeatM4YThjvPkQHQmlN4n+t5
         FQVhP8kGu6m2eeq1pdYD41AtIYseGkG+FylDFeh4O3sdGPucLZtoSeJYdtEDFljdNeTa
         RC1KYW3gPrqGJNYbHTO2APkKjBh4vfBnljnLwtw7ylUcX2TQHTsY5e8nVc0jmgWq/FLQ
         Kr1UGqxsMEPHJXplMIib4e6GFUUxqqdMMlXTAik75TfN66JIDB5Z2QB3gUc9LujBdC1C
         fgz0QWNvyXhsgyK+gDRgzhZ7XD+adBBxeN61qKpCY7tFhctcwW7J65Mv2ccrRCDpdv+3
         PVdg==
X-Forwarded-Encrypted: i=1; AHgh+RoiG/wwPrui7I2vZYG7+uH7wn1kidi0X0i9IXB83jp/SDk0oaMkibIE2yDLRDyBOU6tP0Nh5D/onQo8@vger.kernel.org
X-Gm-Message-State: AOJu0Yzm4VvKZyI9ssaW9QjBYgwvqw0inr2iFxPDy61JhYgAiniQuGsp
	b5N6a4U4Ibe8NfGeCXJOVj1GOATpzZrc0dRUCyulZpHw6Qm0Dx2DmixrA8ZywbwA3lhEnJNk0EI
	+EoChiiaTtqJSUeDv95JSqd6gdMt+KvY=
X-Gm-Gg: AfdE7cmfwKGPzWrQEyGhjcz52bqvvAqGHv9mU02y7//p8Wc60g9jyT6YK2CH4+XRP/p
	KbqRFvuvWIjjRN2yO6RjOB5oPpjFOm2w+aVZvhYcu/aTgZTRcIuNyNhhMe3FCs4lKAzimEc9QP0
	0HcXiGa37r5sIr9dxPYi9QYC6Ke+mZ7Vb41dZ1IPhFLy9LQP1RbyYfdqObI+ueiElPEjr+Mm+KZ
	Gy9gPIkOBwdrq2yMFrwvlrf98vWT6eE/DizvAZ3cDZLppJqgXnJHlPWLKdQV/rDuOt25OKalwZ8
	5SpDpMQ7OQU3PNOPkp97ozbhTVmQNQ==
X-Received: by 2002:a05:6a21:730e:b0:3c1:279c:526c with SMTP id
 adf61e73a8af0-3c3576426d3mr2584439637.63.1784035620851; Tue, 14 Jul 2026
 06:27:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260617080031.99156-1-clamor95@gmail.com> <20260617080031.99156-3-clamor95@gmail.com>
 <akeEd0GcHSqScGIl@hovoldconsulting.com>
In-Reply-To: <akeEd0GcHSqScGIl@hovoldconsulting.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Tue, 14 Jul 2026 16:26:49 +0300
X-Gm-Features: AUfX_mylEu9Yyzm1iZHwnL_3qQ4wX-qy21nMalz6S1BYQvhN4kmLF8d5IT5che8
Message-ID: <CAPVz0n1aYREgo9Mqb2fioQKTKa478rhMYPJJjcUagjCGNTzMgw@mail.gmail.com>
Subject: Re: [PATCH v5 02/14] mfd: lm3533: Remove driver specific regmap wrappers
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
	TAGGED_FROM(0.00)[bounces-9079-lists,linux-leds=lfdr.de];
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
X-Rspamd-Queue-Id: 79E8875529D

=D0=BF=D1=82, 3 =D0=BB=D0=B8=D0=BF. 2026=E2=80=AF=D1=80. =D0=BE 12:44 Johan=
 Hovold <johan@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Wed, Jun 17, 2026 at 11:00:19AM +0300, Svyatoslav Ryhel wrote:
> > Remove driver-specific regmap wrappers in favor of using regmap helpers
> > directly.
>
> The commit message should explain why you think this is a good idea.
>

Removing custom wrappers over standard regmap helpers is always a good
idea, that is self explanatory.

> Based on a quick look you lose the errnos that were logged on errors and
> also the register debugging provided by those helpers.
>

That is not true, regmap helpers will provide logging and you should
not include debug stuff into the final submitted driver unless you
have a extremely valid justification for this, debug logs should have
been removed once the driver development was completed.

> Johan

