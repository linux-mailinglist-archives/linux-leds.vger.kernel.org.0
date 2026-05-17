Return-Path: <linux-leds+bounces-8171-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aL3mNNKUCWqOgQQAu9opvQ
	(envelope-from <linux-leds+bounces-8171-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sun, 17 May 2026 12:13:38 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 788E25606A7
	for <lists+linux-leds@lfdr.de>; Sun, 17 May 2026 12:13:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 40BF33004D2C
	for <lists+linux-leds@lfdr.de>; Sun, 17 May 2026 10:13:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38A2335E1AF;
	Sun, 17 May 2026 10:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DpiZQz5C"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C587B355F22
	for <linux-leds@vger.kernel.org>; Sun, 17 May 2026 10:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779012816; cv=pass; b=POOhAxTRioSF8U01X3fNMk8kPdglGDiwDY4aN7FaW6Fge/vPiYJgRVM8jb1TWn/SpX6RUj/NVJTuE7vjTWVogSn8b9unxYguVfY1za1CGlUm5WTIT8F83NaYZbOksFufccMrb+ujXP3y8YfwXO+JvTYxMK8+/aRK/UEKrGcto3U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779012816; c=relaxed/simple;
	bh=Ah355/SrzZrFxRMEDg0nnxbwUFNinnvYb3ZHH5bVd7Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QGMaFf6NX7YlNlrRprTsFezLLHZEw0uorsY5WOA2V3AGmlaAXZLikaYyF3mUXtCsNA0PZmHEOqJRf1g6o+vfc5QtKEM+mOeeTH5aMaV3LOdnlOH8mGn3dPpFSxkm4Y9QZGpEbEZLPAJJ++8BC4KtUdPv4+1IStWmLPkqHRO7gcg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DpiZQz5C; arc=pass smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-2c156c4a9efso1493143eec.1
        for <linux-leds@vger.kernel.org>; Sun, 17 May 2026 03:13:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779012814; cv=none;
        d=google.com; s=arc-20240605;
        b=i1EAE+gW7TjiMt8bGQnz0KZVpQRIiiqFuHOTj7kPzbheZjFdh5Velm79T5nbArcCI2
         hTzVoYNiLE4xR5E2SzVHfxH2OO5zRmsDmjnQbYh55xkK2izEVX2L1GEI20GcHWMyJJxO
         0NCHMQ1+eRysFTqF3apSLRappNwbnNNFg0vFqS6aSgm4Nv/2Yhm90PS0ANIIgEeHcMz0
         OHMJCa0+BBOgYTiLoWAeLsWJwCOBM7MbCuFAY2Q9KJlLK5hMA4+Ztf6DbxtgAjBcPTye
         f6tlKVPkEnWoIhFQ9OEh/PYG0VLkU2A9MtM+3GXtnqEVGPWmsD/xWTiocfu8LTb86viI
         7azA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ah355/SrzZrFxRMEDg0nnxbwUFNinnvYb3ZHH5bVd7Y=;
        fh=UmspkwocEvrrC/IJrgfm7ggyJoscw7oqldbQIvHkec0=;
        b=bUQ/wLCglqqQJf+Cv2DZZE2lrSy5JNkQrgQ/w+UIdLE26SXr+4A+/wpg96bJIvKM3t
         toHfSuRxaM3bu8OqEgZ+NiIt82kPDs31clyEu183fNO2clssOy107k2w8EGxstaWqqqA
         zjrvaWkrepQv6RMx1W1m0WxquOao/gBk5lpL3CaU35m7Hl7XRJBjfh+6/bdqd9qpe92C
         ZOl4XQS/6Pcgth96xwsfT5b8Q7M2OgYuTd4zcx4XDCJ9c8Rw0LM95D7m+9Sr7qDWOPnv
         6vXpNDLBwpahY4sHtCu6jItQYUEh0IObxtVqiy3TOuKD9xMQa/PhoVJqHdasT1hipPtG
         MQ2w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779012814; x=1779617614; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ah355/SrzZrFxRMEDg0nnxbwUFNinnvYb3ZHH5bVd7Y=;
        b=DpiZQz5CG8ZsaOTOglNTkpxyCrOL2GT7MM2PeQzjC+91XVAbmvolTcCxLU63eB8NbQ
         WEI6T07V2j1xZObTgOmqSnbrokDXpO6061B+NXhy4sDdEPgT5a+ubEBxizQ9myDYGlWC
         O62zgIwpFxpPyLkH4EhPQqjEIdOWArEJXc7t0mML/K9fj+90Q+Qw71nRr09oxaXeqquh
         J7egeAQ7ppT4Va5M2I63q2c6XcGN9klLocWjLb7ZYA9A4LNa6W9Uh2Bm5Y2nQku6s9lA
         TgqsXMrnoAr8q01O+m4luSM4rbXjhePOOY7jxaFcDRXNkWopcSeGTB6F6pa6n0Qh3K1N
         t1Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779012814; x=1779617614;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ah355/SrzZrFxRMEDg0nnxbwUFNinnvYb3ZHH5bVd7Y=;
        b=p59LHZERb+TJQs3TytL3ohw/4reyQEoSG9Td8lKOQS96L2OPIKPWnJSn2v9wu3dhcy
         0BiaLwi6sFhHV+mdyZbcFPobttGKGgbiMWLU1C1W4aVUJXbwh8Nq79mCA2hRocN2tNMx
         ZFr8Gdhv4Hwa8Tk5RNcu596JCPXK0aWv4u/Dt/ovm6xRmbiFiXQH+385sCZVb7uhKzgC
         XbacqhgjiE3dKycVhpCHqnDhdVb+rqCXOZBbE7a30NO6VAYIWh1LFPluf6FYz2NEuhQ1
         U3RR72CLy18siea0vEwyvOQapsEj/7C4VoOuTN0dhioqnAGjtDe6qo2tf59zRA0p4nhw
         9ahw==
X-Forwarded-Encrypted: i=1; AFNElJ8cZZxbl4OWuO9Jk/xpCno0hcJpAd7W4JewZGagQgVyERbkSDczNxW6OIZnLGEhSI8qSg9b+Pxt94rM@vger.kernel.org
X-Gm-Message-State: AOJu0Yxf2KcNmWERhFhEevrGJua9Ecqfl2l17xBsC8jBenBHhSHHK1w0
	1ZtepzNHxclwXzHbd94A3eggtYJVOCa41Um6Xfxbw8D/Oy7F8lFvoa25GtyIyMlIeetnG3dCcs5
	tBgmXc+ffwbU/NT+Aq4RnT3wyo7H46lA=
X-Gm-Gg: Acq92OEHq9c6zrtNLiB2EnUQgBkZpLGBwCu4ur743dtHY+mkd/37RvyOOdMSCTb1unD
	b5gTSxRFp8v2Q4I2we7UzefyGFAtF9C70GWnX2bK1AIzXwe+tGbJCQd2luwe0yLPSbGuVsBnQ8f
	NkkYrkUyXm65M+QU08NmY/BDiQlBi5iMV3g7UUzXgzh34CN40/5QxIy6JrPKoXfv7gmiWCqNqFI
	yGwMwPjJwIOspWNTFYZBLAxrKTKEB9RFQlui4BOFydoKBb70WBVsZdcyDBye4KWykvFo0g21LiS
	wgekC/sSNXbJIZNaqEg=
X-Received: by 2002:a05:7300:8b95:b0:2e0:1f09:d924 with SMTP id
 5a478bee46e88-3039813cab5mr5237843eec.5.1779012813884; Sun, 17 May 2026
 03:13:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260517074306.30937-1-clamor95@gmail.com> <agl1T8O6kwP7SFZ1@ashevche-desk.local>
In-Reply-To: <agl1T8O6kwP7SFZ1@ashevche-desk.local>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Sun, 17 May 2026 13:13:22 +0300
X-Gm-Features: AVHnY4IqE6FsGFbbFI5FSmJMlyOUEK62QOSOEKabbR3m07ZeyolRt90bM2zxkWg
Message-ID: <CAPVz0n0tfbwa1AbgO4eKrmNunHvmTFLDqXDFd1=VfLayuafH8w@mail.gmail.com>
Subject: Re: [PATCH v1 0/6] mfd: lm3533: convert to OF bindings, improve support
To: Andy Shevchenko <andriy.shevchenko@intel.com>
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
X-Rspamd-Queue-Id: 788E25606A7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8171-lists,linux-leds=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,baylibre.com,analog.com,gmx.de,lists.freedesktop.org,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.995];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,mail.gmail.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action

=D0=BD=D0=B4, 17 =D1=82=D1=80=D0=B0=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE 10:5=
9 Andy Shevchenko <andriy.shevchenko@intel.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Sun, May 17, 2026 at 10:43:00AM +0300, Svyatoslav Ryhel wrote:
> > Convert LM3533 to OF bindings, add missing VIN supply, add support for
> > setting mapping mode and LED sources based on device tree.
>
> How is this being different to
> https://lore.kernel.org/lkml/20250218132702.114669-1-clamor95@gmail.com/
> ?
>

I have decided to have a fresh look, this is continuation.

> What about this comment
> https://lore.kernel.org/lkml/ZmBcvtLCzllQDWVX@hovoldconsulting.com/
> ? Have you talked to Bjorn A and Johan?
>

No, but since grep -r "lm3533_platform_data" * gives 0 results there
are no platform_data users of lm3533.

> --
> With Best Regards,
> Andy Shevchenko
>
>

