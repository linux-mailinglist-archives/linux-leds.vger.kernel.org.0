Return-Path: <linux-leds+bounces-6916-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8ONwGiH+imlyPAAAu9opvQ
	(envelope-from <linux-leds+bounces-6916-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Tue, 10 Feb 2026 10:45:05 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B8D71190B5
	for <lists+linux-leds@lfdr.de>; Tue, 10 Feb 2026 10:45:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 67EA0306974E
	for <lists+linux-leds@lfdr.de>; Tue, 10 Feb 2026 09:42:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FA53341ADF;
	Tue, 10 Feb 2026 09:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MZwFvb4z"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73502342148
	for <linux-leds@vger.kernel.org>; Tue, 10 Feb 2026 09:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770716546; cv=pass; b=FRglY3sU+BK2PaXvKRy+TbqzQFIVZ3yh6I/geeHejPxySpDd7GOlM+ehriM0CT9D9btuBp3M1RA5HiuukgNRzLgNGvTi3bmx7PJxRoOJUUvdxRuWHZWSBMvHmTmTBmPjZL2nyEIoyzBe/nFQcmOatab/fkK8hxRu2K1VnddZp/s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770716546; c=relaxed/simple;
	bh=oOjICXJg7ZpifL4ZDE4Mvkawuzo2HaLZVgTlYB0pvHs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rP4Uh7cGs63XcJdMhmTaa2JFGLcjfIPhiOGf+iYHL+CFCjAKbEVZ7BwzLJ6jcyaNH4hi43w0DFl8ALpgks/2eXwtf3WuhvlniONlCzC3YOyu1vgty57yLLGNnobGe5IHLpVzkBEm/XHQKAc+D7F7kGUlCEJlXnBFk7R7hdSdtL0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MZwFvb4z; arc=pass smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-436317c80f7so1804996f8f.1
        for <linux-leds@vger.kernel.org>; Tue, 10 Feb 2026 01:42:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770716543; cv=none;
        d=google.com; s=arc-20240605;
        b=fYSE7vyop4/bh0phXzBzp+KbMDuTZCD4E6v0XQ9SPXxpewdd+0lI0jkqOmkpi9dZj2
         HbiqBKMf46+ZVs21QQn/cSEFOjeFG5zSgAAh8SuWYaY6mde5pR9sceXFt1LiXAGrbcwB
         vh7CoAI9o/G46od+5VwzCG+QV0fnFGSn8wcPCn140hYWa9jA6If61Niolvh9NwkwjSKo
         A2sUwlgEtxT8eJo2VbDebsxpv7/DKSt0w+sVrSaMxX8IcytHZwzRYYnYLJhD4ruZM+wG
         dGag8h0bWtfnCEg92Raeaf3fcQ4b98fvztdWFzLFLQBc7zqwzOcqJos1aGzwjyKeOi84
         0RaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ze1c4tMfcpX491+6mPiJXsJlYkup8lMt/xtrcGpqjuI=;
        fh=p1ZXf9T1ZoCSM6VC2NmNMpcZa0spbuHk3NilGjBzzlY=;
        b=VywwqdTp7acxAMvfkdeANbRHq5S0jsaQrSI2Erzkv5xf4NLXzhHwhR1zutEzLmswNT
         Fwu8jihcoqiIzGSo6jQDctNQH02/AR62nZzLpkAI0KBNXTpOvqi4/RRh+gvWfSlDFAFP
         mHPE+5eZIgEXpYkKTHG7wuO00ru1KlUPpDV6hQdWujAW/PcrOaf9PUbkaGiDuX7M2EHH
         S8M0yBTn2XCc8YYpe/cXtjhDd8VR6gznwUkmRXI4geYyBmmHX+rTvIBquvBpJhLublrn
         Pnhd+kgsMJ6nOiZa5w9KYaQObKr+rYclqNZu51tY1RHLg39Cn14c35t6TnZJCvMEXrLQ
         miKw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770716543; x=1771321343; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ze1c4tMfcpX491+6mPiJXsJlYkup8lMt/xtrcGpqjuI=;
        b=MZwFvb4zWxnfekjl+a8fsLfYtrscT0ebMy+djosDK9zMn1NLXNNuNkeJQ+YZDUZQSh
         tcLsWoxPOHXM5b/VVpDIbtS9/eMQysU7DEuHttnRlEIfhi72G94wQcIDA7I3fwtUs6rj
         nteoasqj8yMgzfcoesAhg58ZN4/uNGulmZC/d67iSwERAp7Mt+Jkxa2JWURr4iEkYGFy
         oWBK9pnh/KpCD9NvHu7tDrSq5ISoB9FqNFpd0X2E75oWHDjPuoLdvUe22FRymBGnvtBr
         cQthSGiuHgb/OH0zZ5bRLvrG3MUTNNcN1zPQOw4y/lRDOibeI+JZU3YRdmS7oBTm9slr
         OHQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770716543; x=1771321343;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ze1c4tMfcpX491+6mPiJXsJlYkup8lMt/xtrcGpqjuI=;
        b=fy/8591SLrUrgce0At85Nuli/WXYK7tlz3z2APgL3hCkPB30wlYP5N5LNev1zSLNgo
         JdFg+VFOYc6/0xdiUkNXsWNRYUEvng6QGHnpf0JCTgfVqMuWl3ansp5Gk778CkCsOgRP
         6PbFUQksxjlFZicr2CIzWYZ+8zs4g0re9iKL183nJZd2w6ArEBhzT5KoTMZ42lAxIqLA
         9wuDbdYF0l3SVPiXG4PN8JNA7h0Iqz6yhfTWUzhw9Ivx9SslrwLIihdIEByubNTghb/4
         MHSGkDwudjyqXct5TwXideL7NKMOCKHDRZ/eKbDpHHS5WD/ClAxZhsy1tzYv3apg6bkf
         nozg==
X-Forwarded-Encrypted: i=1; AJvYcCVosoZFz7y+YGGVSGqSaAMYk1PYB86HkddUTXHZMTX69vKzmjD0AyJpqDzCQR7TAkeGwdQPdhrCr0od@vger.kernel.org
X-Gm-Message-State: AOJu0YwjsuHinmSthzX5VGBCTOSwoJzuD7pYC2WFV1Sm+63Wb4xnwAxM
	WovA7gLV5epC9eMcuqausKDvWbWdRP+9FhlWwrjxbcRKXwLO9jlOlBsrUnzpg84XXkvRUMhf4l5
	eo2dFaZxFITyR9ov0mIb0ykGbYMZoXHU=
X-Gm-Gg: AZuq6aJHlAmmmjGcSdcRUgx67Mc99aJbucm5o2dSs2V+eTPlOrzY+JIWu7FjTsx+cyP
	HgK/Ijehw9nVD/jAmkcSwG8dAyeBA8kcESQJhevUyWHPVt7CdqnExXS8bCfpObmblKTIu7azu5j
	a0tHK7n4vNggtnjZuTwatRjB3T/y2jznjjfOdQSYj8XyQBK5YsTCKjllMT15KVUX6Pns7mcCUYt
	mK9nsjmwP1meTy0X4fFFbSLlq5VNCrSCmv56KYBNRK4IvLUymwV3Uc15RGGuy0Jt9KonJuDJIOn
	IsGIavTH
X-Received: by 2002:a05:6000:3111:b0:435:db9b:5881 with SMTP id
 ffacd0b85a97d-4377a1f2a30mr2055191f8f.25.1770716542552; Tue, 10 Feb 2026
 01:42:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260209104407.116426-1-clamor95@gmail.com> <20260209104407.116426-2-clamor95@gmail.com>
 <20260210-hidden-swinging-galago-fdcfa3@quoll>
In-Reply-To: <20260210-hidden-swinging-galago-fdcfa3@quoll>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Tue, 10 Feb 2026 11:42:11 +0200
X-Gm-Features: AZwV_Qhn-R0xjZTEGY6wy39uV3chiY2pUKepim55rxxDwQzXQ4tGrjUlByAc-JY
Message-ID: <CAPVz0n3Pzvzt+LmOH_peCtpx8DP2-GiRv--6-ppQUaa51AXRFw@mail.gmail.com>
Subject: Re: [PATCH v2 1/9] dt-bindings: misc: document ASUS Transformers EC DockRAM
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Pavel Machek <pavel@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Sebastian Reichel <sre@kernel.org>, =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>, 
	Ion Agorria <ion@agorria.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-leds@vger.kernel.org, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6916-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-leds@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,arndb.de,linuxfoundation.org,rere.qmqm.pl,agorria.com,vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0B8D71190B5
X-Rspamd-Action: no action

=D0=B2=D1=82, 10 =D0=BB=D1=8E=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 11:25 Krzy=
sztof Kozlowski <krzk@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Mon, Feb 09, 2026 at 12:43:59PM +0200, Svyatoslav Ryhel wrote:
> > Documenting an I2C device used in conjunction with the EC on ASUS
> > Transformers. The main function of DockRAM (the name used by downstream
> > ASUS sources) is to provide power-related functions, such as battery an=
d
> > charger communication. The device is exposed as an individual entity
> > because multiple embedded controllers can utilize the same DockRAM
> > instance.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  .../bindings/misc/asus,dockram.yaml           | 40 +++++++++++++++++++
> >  1 file changed, 40 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/misc/asus,dockram=
.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/misc/asus,dockram.yaml b=
/Documentation/devicetree/bindings/misc/asus,dockram.yaml
> > new file mode 100644
> > index 000000000000..0cfde619ba01
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/misc/asus,dockram.yaml
>
> Not a misc device. Find appropriate place, e.g. for EC or docking or
> laptop devices or power-related.
>

Why not misc? be more specific pls where you want it to be.

> > @@ -0,0 +1,40 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/misc/asus,dockram.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Asus Transformer EC DockRAM
> > +
> > +maintainers:
> > +  - Svyatoslav Ryhel <clamor95@gmail.com>
> > +
> > +description:
> > +  Dedicated i2c device used to provide power related functions of the
> > +  embedded controller used in ASUS Transformer device family.
> > +
> > +properties:
> > +  compatible:
> > +    const: asus,dockram
>
> Way too generic compatible. You are not documenting here all ASUS
> laptops/devices dockram. For example this implies dockram is also on
> ASUS Vivobook... or on any other asus device.
>

Asus were not so generous to provide more specific data, they call
this device dockram in their sources.

> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +
>
> Device looks weirdly empty. Probably you have it only to instantiate I2C
> handle, so what you really wanted is i2c-parent. This is not a real
> device.
>

WDYM? it is a real physical i2c device located on a i2c bus and probed
by i2c driver just fine. Maybe you will deny RTC being a real device
like it was done for example for max77663 which now causes a massive
issues since it can occupy different i2c addresses?

> Best regards,
> Krzysztof
>

