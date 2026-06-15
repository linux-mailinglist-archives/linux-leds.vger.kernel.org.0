Return-Path: <linux-leds+bounces-8592-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id MiBDElGbL2qSDAUAu9opvQ
	(envelope-from <linux-leds+bounces-8592-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 15 Jun 2026 08:27:29 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 94FA7683C8A
	for <lists+linux-leds@lfdr.de>; Mon, 15 Jun 2026 08:27:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="l6/470yY";
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8592-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-leds+bounces-8592-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 057FA30078DF
	for <lists+linux-leds@lfdr.de>; Mon, 15 Jun 2026 06:23:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A099C2BE02C;
	Mon, 15 Jun 2026 06:23:29 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74AA22F83A2
	for <linux-leds@vger.kernel.org>; Mon, 15 Jun 2026 06:23:28 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781504609; cv=pass; b=Q35YukwY4aQLfe2Q8abLGcYEz0VQkiW0d7VMQFGMiXhpqW7RUah06RI3mxu66fOwyr0IBdsDZN748SpvYfG7YRWgRODf6RFxzyZJnWAxulfCehR+zLPpUyYXeEtTPYUkoMh79JrCgR6k+7/gQjiViVbgAtazFhrI0GrJIhf49q0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781504609; c=relaxed/simple;
	bh=6RrxEbtdY1URcRhqUHuv6rRPkusZoYqTLT3CjAAQOGM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bS37sgcFHZBlIbMI4g73t4pPQfjSId9zAkFlVXgEwcA0Dhv/fYhGAV39iGUuOtgYuza1yY4F2YB08qAqaYRyyIkQ5Ud4CdQ+qGp9tvwRiwFtjfWdzhGkMFYqcJaBLERDhgMoSVfrwJPQxltj1CiYQgwvio2FdaOhXmTueGczA8w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l6/470yY; arc=pass smtp.client-ip=74.125.82.171
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-30749947917so453400eec.1
        for <linux-leds@vger.kernel.org>; Sun, 14 Jun 2026 23:23:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781504608; cv=none;
        d=google.com; s=arc-20240605;
        b=JQ9xmLdLpw3OxuVbP5Wi/tJLmfnqEnrRqMkjbEWGDBM6LYTgrhfM0krGLQTe3yR00/
         a/7KAZqj0BvARNPnKmqJstFPHMV7N71lhf/nA/wtYGvbu4jB8xvIQMXhE3hwdw0wNAf/
         pa9luM87HWqE6hBrJU3c6rATo9LzA0Vi6KJtswcBciGRY2eXZLsz5YksPTnjlvdEjhEp
         KNDdLgPkOC/D5ALSetxZFZfbsPBFYujyLxaomjBTM0Mb1qf4r65tQ/ggKa5gcrFmv6BY
         JdsE7D5RO5nTdhnsTqbCMTYRvQzCWO5osUO9hpicNhNlCrCsDoKCOvoQME14CgTbueQK
         ThFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=76EcjshEI0S52XWKwaYtOS0vh7v35QH2XSqyWXuOjik=;
        fh=Q5tpXm80qYh5L9WZLZrIqZ9R7bhl5OpCkZw1ge50x2w=;
        b=THIYf8Ms/PIIa8ixoOgosO15jh5rF8DlLNyClcK4pHdJN7hk2rjK2F88DSEJ9lSAY1
         4C0glFcfK0BDsqMnl5RicVQ0Kk/nuiAbhG9oZH1Zh3QKUplnUQlxbNbmVguNcykbEiFB
         fF6+P7r5NS5fA/TSB8qexr/NX04oSlDwW5N1I0qN7I0VABLrSFbPsJgrI9Xvk3EH6EfB
         DqGQHo3cqBCHw60ym/s7IPtBytXAE59lQlgSC3psXfazm2JI6yneSNo+sY85SH1fGdc7
         CaBH1owCG7hCrHoVGNVHNXqyuFVIaW+6149O68BVPplzMfu8bKhhWPb9hlefatpfa6Gl
         bpNA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781504608; x=1782109408; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=76EcjshEI0S52XWKwaYtOS0vh7v35QH2XSqyWXuOjik=;
        b=l6/470yYabGu6XgvM5OFyCNHNsAhvW6UJ4Siw90FNHfR3fvG+Wlux3PZPKM/ki02sS
         WZ+rhn4nFhT9cxcq8Ymo2usB1z/IJxQGtqsxPVDNAfCnhN2NqPoyAOkxywhZRYTc2Yl6
         aGhHgsUblQwTZzBuykJBzxWok4HF3USQ4LSvHr1cwLnrdYsp9gm1SZqV9JuLA9OhJAFS
         THwcGloLyjqtvfUmiF5A1qqRfV2r3oPfvk2VIGyUeNUKJj38+KQK1/aiHMu1J0ekpwrs
         7JguB3zU53LVT83ZAfLghEE8TTaB6QChcwY9tDxiqKOPG/JEeIBWRm0c/DkobKb/7Uh3
         t85A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781504608; x=1782109408;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=76EcjshEI0S52XWKwaYtOS0vh7v35QH2XSqyWXuOjik=;
        b=HywrM957d9DsKVOzIpKZSvB1LgnEEt+rt/7afl9BrpvBG5fLG/HAxDfJTtsAbfCBr4
         nHxAJVkLy4y0IipaDivIq1kwkZ/Rqbt0+ssy0ZmopUGTi5P0JGniYh9BW5hV9jWPvJzC
         9CJcrsJXPDndQBCTOmu1SCCEXtahkW3ui13U/5rVt3JswIhzj5UfAcjF4gVDYinLs1vI
         MC3uG41zRzdz8PQq51v/CBXaFRAUJeJUH7HTjhEt8auV26t7q84ge50gIo4TGzHj054+
         aTuNuBYxl1SuD2rNeE+s0jDZSncAEgLWeEQ0Hx6C4GmkQB2OcnPRyfe5pFd1QonSeJgy
         T29A==
X-Forwarded-Encrypted: i=1; AFNElJ91ibuFZQ0TDfhhb0Iy/xqobty6uYa0F3X/IhyC9bsuVT5M2I+OrkU1mlfIgChI8/8g6OSsR5aesC2q@vger.kernel.org
X-Gm-Message-State: AOJu0YwDcv7bVEht63cz0pgEUFkLghTJgXiZ6ES6MtRXtazApvaTkWxL
	vWnGngJAK464DD+KC7rtwlYCUlf+pbt4GkPGKHkZKy4FDyhq0FJ2oNxNiGLlHKYZf5hfq5KLGbu
	qxR29qdU/64cqJ2hQmXmoFptgn1QRgxbBcKdtf/Q=
X-Gm-Gg: Acq92OHrZimJ6axmt+DJ0u5G90Ir6H/O+QrEaBB4jacNkur0d21M93S2k6paCN0EG83
	jCXoM8RUD/epo13vZRinq+2DxJ91BdGf95bov1YUr1RtO32QlK4GCT2fDfXamROMRnW8qcLey9x
	BGWshp94XGUt5A8s19zaQc5ZtnyiyR/OcqXd7A0llzzzxRjsWgzWXz1lHE8tfTTwOewBrTnBqdd
	c6SWLJEORMC8sXSZkq1IOyQLEzSvFlfdc0ykhHX+HnAmQKNRamhufRvGThP9ck5JWvX/liR8cWC
	vZKrE2Nu
X-Received: by 2002:a05:7300:3723:b0:2ed:e15:c922 with SMTP id
 5a478bee46e88-3094197a175mr4911122eec.30.1781504607592; Sun, 14 Jun 2026
 23:23:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260528053203.9339-1-clamor95@gmail.com> <20260528053203.9339-5-clamor95@gmail.com>
In-Reply-To: <20260528053203.9339-5-clamor95@gmail.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Mon, 15 Jun 2026 09:23:16 +0300
X-Gm-Features: AVVi8CfYtPBR17uEYmSCkdqsGtwveF8FuLfNiOAFFFOH2flEclU8yKRNkxPiLtw
Message-ID: <CAPVz0n0cgb=ht+uW9+g8q9524BBQdPLNczK_9nSdrk=8kZSV7Q@mail.gmail.com>
Subject: Re: [PATCH v8 4/7] input: keyboard: Add driver for ASUS Transformer
 dock multimedia keys
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	=?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>, 
	Ion Agorria <ion@agorria.com>, Svyatoslav Ryhel <clamor95@gmail.com>, Sebastian Reichel <sre@kernel.org>, 
	Pavel Machek <pavel@kernel.org>, Lee Jones <lee@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-leds@vger.kernel.org, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:dmitry.torokhov@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:mirq-linux@rere.qmqm.pl,m:ion@agorria.com,m:clamor95@gmail.com,m:sre@kernel.org,m:pavel@kernel.org,m:lee@kernel.org,m:conor+dt@kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-input@vger.kernel.org,m:linux-leds@vger.kernel.org,m:linux-pm@vger.kernel.org,m:dmitrytorokhov@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-8592-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER(0.00)[clamor95@gmail.com,linux-leds@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-leds@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,rere.qmqm.pl,agorria.com,gmail.com,vger.kernel.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 94FA7683C8A

=D1=87=D1=82, 28 =D1=82=D1=80=D0=B0=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE 08:3=
2 Svyatoslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> From: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>
>
> Add support for multimedia top button row of ASUS Transformer's Mobile
> Dock keyboard. Driver is made that function keys (F1-F12) are used by
> default which suits average Linux use better and with pressing
> ScreenLock + AltGr function keys layout is switched to multimedia keys.
> Since this only modifies codes sent by asus-ec-keys it doesn't affect
> normal keyboards at all.
>
> Co-developed-by: Ion Agorria <ion@agorria.com>
> Signed-off-by: Ion Agorria <ion@agorria.com>
> Signed-off-by: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  drivers/input/keyboard/Kconfig                |  10 +
>  drivers/input/keyboard/Makefile               |   1 +
>  .../input/keyboard/asus-transformer-ec-keys.c | 286 ++++++++++++++++++
>  3 files changed, 297 insertions(+)
>  create mode 100644 drivers/input/keyboard/asus-transformer-ec-keys.c
>

Hello Dmitry! May you please take a look and Ack it if you are fine
this this driver or tell what I should adjust? That would be very
helpful. Thank you.

