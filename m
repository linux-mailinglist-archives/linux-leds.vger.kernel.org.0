Return-Path: <linux-leds+bounces-6801-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eNBtJrD7fmk3hwIAu9opvQ
	(envelope-from <linux-leds+bounces-6801-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sun, 01 Feb 2026 08:07:28 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DFE46C511C
	for <lists+linux-leds@lfdr.de>; Sun, 01 Feb 2026 08:07:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 473A03010DA0
	for <lists+linux-leds@lfdr.de>; Sun,  1 Feb 2026 07:07:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABC412E2EF9;
	Sun,  1 Feb 2026 07:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jIY8ZJP3"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C72FF2DC337
	for <linux-leds@vger.kernel.org>; Sun,  1 Feb 2026 07:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769929642; cv=pass; b=ur1uQE7OaHO9IprNTjDXO62+4oiFIcKTyIqUybDQNHJgF3JuBJ3PGkQjRn+IbzXRBUsGmmv/hCGSb+dpiemERqU+6cpMMq51PkoBp4Y6mIUvEcQnh70WwY7Man0hTgCBfvNRWCIAc6UIVRz5Ww4tcQVAbuEwX5ShM2f0Ook44Vc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769929642; c=relaxed/simple;
	bh=m43UbkmbLBc3R/MOJSbzoCwEFQ3lxNZqdfln+hRLhHI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X9sXreIwsqCVSkzQ4oLR4JudSRiWaj3ZifwxzY6YE3DzguVFqSa7Bv+TSUbGJVkkq3N/6rw9GB6HO6SFZ5l3dMBR0vu9LZUnP5NZbgJajJVheibdzB27qtw3wS3HLj9DBDN3BdoDGPMZ8UESoMYzeTlRtK1BSYJ1gNlqtNn4b/I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jIY8ZJP3; arc=pass smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4806ce0f97bso28676805e9.0
        for <linux-leds@vger.kernel.org>; Sat, 31 Jan 2026 23:07:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769929639; cv=none;
        d=google.com; s=arc-20240605;
        b=Pll6AAmJMkMSPv3sWymPruc5YbarhZz6OIltybGP0Fsvw6yCG5fuAfUTGbmMNtzxbk
         VmKxRkr5yqFI7B6Nx78RxJeJCrQIuzyu/3nf0bSVligZKboTbiXznBvPxXgzygUufS20
         qGY18lFQqN7lkANyGGraB0rliRhsByGp5O3zS0EuJgUg1InsGo77v+kyctqnGtX1goaj
         i9izIj6U7ggzfb1VA+unIwrPDmiMEHIl2C7Hu0ec61lapQd2MckBaPsMiJ5A2RFOWG6G
         W7L1+ecV2PmfH8VfpnR5w7uF/w4OsuIvuarDO8ic96MS0gFcMLD31jCyaAYfVtgn+8z7
         0Gvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VgA1XtNopgDhPd28c1FlWpyjNQUNZlwtx4L9F82W03M=;
        fh=zWYU8pxD4RNZrlNccr4H6Tfrdrh6VDTsxmsmRLl3WcA=;
        b=akwNR/Y20AD7Pl8wTwxph9mIQRj7h9xcvnk3LjN0wJJBeZhGcNaZtITeKks9tTTZep
         6GaqSmINdrx4kF1Le70zpYna8a9adxtwXZTvQPcx2rQpT2fLLWx4f2tl8PdOxxw+vbx4
         lDP6bxp5wyRBokPhKMsTbwgTMbeQ/rrH0MrcBUm5p3afWF42ppwalfzACt5kfRZXF/YD
         OVpxfqo6r5G8HYpQCDYgiM0CvDMnJdYz/e97UwQ/VDkmDTZuRorN99ywEJY6VxPDFcrV
         PjFETUVz+sd38lfMpT0/wRNMA3rqAWno7PUm5Eh+76zeyudRqBlbceiAOfvypAcxG8Xj
         yuPg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769929639; x=1770534439; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VgA1XtNopgDhPd28c1FlWpyjNQUNZlwtx4L9F82W03M=;
        b=jIY8ZJP3nRcpBxAvG6e4g5y/0jzG2yQja7zNQQwx0ztOh3n4P49jiYL9GbTx11wHjD
         hbS0CAjHHYArQfTGirQGaM1u6uNbwpcv7QK0M/Onoq7aQBcS01uHg46DLIVPiRd5oY8u
         1q1UPrgCB9TwrMJ12g73KCeA0d57kCCi6wVONFCAnkHGzYYWF11m8BogQDZGrj4Udn5P
         o9m8EY3WyadvMbmsRKnRC0X6VO72Es9JRQNIxim/MRb/3v91ZTssIO3WD2igXDg6sWP8
         sXGtjy+Oyx7SfzY+Q4pCHPjCqdHkmxBsJndOJQvTagzfa2DQwyBGxnr0eNVC/4UHXSJB
         s+Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769929639; x=1770534439;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VgA1XtNopgDhPd28c1FlWpyjNQUNZlwtx4L9F82W03M=;
        b=eezL9xs2+TDmVymXOyQOlhoLS/bNc1VOqWUD4g869zOyDydoKFIMBYoYAR39cUqZw8
         xjWLXkkquIdSEXg6n45FAvHrzgMaOIshR6K+u+9/v5Jp9onRo38zBYDUdrWy53I7Cw37
         6KOJf44g4sy5z0Ex9LBYSUVc/gjl9l1Lx6SRL4o3nS0//Ww6fzjpADEJJfBfRRvGy1FW
         NpgFCoQYVuAaBwPiwhF88trFya/trOfmV2VtByoSXYU2eCHds6ilDYa2o69gZW0uCyi5
         vOf8IKrHMSqTqQLmeZeqdQlAo4EbFjAxY1jYzsLjyNDnUucz5TbDk6hvg26jhX2sClAs
         oFSA==
X-Forwarded-Encrypted: i=1; AJvYcCU4X1I47qiLk/lnmpZIGIMr2KSVDkkk7kRN9+b7hLltbmzORyuckKbNI+RZ7nDe6BPmAKRqcZMh/Djz@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9HtP4v5Khc9H50jSICL3BT8P7cUt4ycCrRCGi1JaWnufissYR
	+/C8dKy1oeGRRZ5TgtVSCCpzeIpDfTXFQCMTdKWZsIUxdZ1MgDSuv9DSrC0jnbS/uYgMRC10ETL
	DWqHDdCytWrBk8GS4MGuIX+UOcl3nXOM=
X-Gm-Gg: AZuq6aLwgEevdVWz0HIBJR5jbKeZgBZyAAvtzmqDFjzSVWv8j6OkoIhwCMde43B6A85
	rLqcpH3GbsaEbt9PIFFrxh9pgzwGd8XB5o8VPTKPPz90zQrl66ot/4QuCM9GtoO+zT+5CGe3OxH
	efQcX0lAxJerk5WXdikfZG5uSjSESoBW35eMXpdBuqG0+y7mhhvWr/40N6BanQ2stcRTrJQ/Brq
	KBIH+FacqbMhHASLEv7mJ50gEEcWhwVQ5L3y1vZLNpObDxp+myE7XbLlN7YEOOigt0I/gef
X-Received: by 2002:a05:600c:6092:b0:47a:7fdd:2906 with SMTP id
 5b1f17b1804b1-482db45441fmr96523965e9.12.1769929638889; Sat, 31 Jan 2026
 23:07:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260125134302.45958-1-clamor95@gmail.com> <20260125134302.45958-8-clamor95@gmail.com>
 <8bd89524-dfc3-43b0-b0f2-cdb1cd51e1ac@baylibre.com>
In-Reply-To: <8bd89524-dfc3-43b0-b0f2-cdb1cd51e1ac@baylibre.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Sun, 1 Feb 2026 09:07:07 +0200
X-Gm-Features: AZwV_QgiEH1CnR4Y5eJqYT3-6LdT1ghmK5ngGD3UdwSwjKt6ss6U4z-A2BxtD6Q
Message-ID: <CAPVz0n25ukBJ6=hmmR9nd4MBoPkHaHQ+ZHMXYxghYZdkB28_sg@mail.gmail.com>
Subject: Re: [PATCH v1 07/10] dt-bindings: input: cpcap-pwrbutton: convert to schema
To: David Lechner <dlechner@baylibre.com>
Cc: Jonathan Cameron <jic23@kernel.org>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Lee Jones <lee@kernel.org>, 
	Pavel Machek <pavel@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Dixit Parmar <dixitparmar19@gmail.com>, 
	Tony Lindgren <tony@atomide.com>, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, 
	linux-leds@vger.kernel.org, linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6801-lists,linux-leds=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[21];
	FREEMAIL_CC(0.00)[kernel.org,analog.com,gmail.com,bootlin.com,atomide.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,mail.gmail.com:mid,baylibre.com:email]
X-Rspamd-Queue-Id: DFE46C511C
X-Rspamd-Action: no action

=D1=81=D0=B1, 31 =D1=81=D1=96=D1=87. 2026=E2=80=AF=D1=80. =D0=BE 22:02 Davi=
d Lechner <dlechner@baylibre.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On 1/25/26 7:42 AM, Svyatoslav Ryhel wrote:
> > Convert power button devicetree bindings for the Motorola CPCAP MFD fro=
m
> > TXT to YAML format. This patch does not change any functionality; the
> > bindings remain the same.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  .../bindings/input/cpcap-pwrbutton.txt        | 20 ------------
> >  .../input/motorola,cpcap-pwrbutton.yaml       | 32 +++++++++++++++++++
> >  2 files changed, 32 insertions(+), 20 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/input/cpcap-pwrbu=
tton.txt
> >  create mode 100644 Documentation/devicetree/bindings/input/motorola,cp=
cap-pwrbutton.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/input/cpcap-pwrbutton.tx=
t b/Documentation/devicetree/bindings/input/cpcap-pwrbutton.txt
> > deleted file mode 100644
> > index 0dd0076daf71..000000000000
> > --- a/Documentation/devicetree/bindings/input/cpcap-pwrbutton.txt
> > +++ /dev/null
> > @@ -1,20 +0,0 @@
> > -Motorola CPCAP on key
> > -
> > -This module is part of the CPCAP. For more details about the whole
> > -chip see Documentation/devicetree/bindings/mfd/motorola-cpcap.txt.
> > -
> > -This module provides a simple power button event via an Interrupt.
> > -
> > -Required properties:
> > -- compatible: should be one of the following
> > -   - "motorola,cpcap-pwrbutton"
> > -- interrupts: irq specifier for CPCAP's ON IRQ
> > -
> > -Example:
> > -
> > -&cpcap {
> > -     cpcap_pwrbutton: pwrbutton {
> > -             compatible =3D "motorola,cpcap-pwrbutton";
> > -             interrupts =3D <23 IRQ_TYPE_NONE>;
> > -     };
> > -};
> > diff --git a/Documentation/devicetree/bindings/input/motorola,cpcap-pwr=
button.yaml b/Documentation/devicetree/bindings/input/motorola,cpcap-pwrbut=
ton.yaml
> > new file mode 100644
> > index 000000000000..643f6b2b1f13
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/input/motorola,cpcap-pwrbutton.=
yaml
> > @@ -0,0 +1,32 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/input/motorola,cpcap-pwrbutton.yaml=
#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Motorola CPCAP PMIC power key
> > +
> > +maintainers:
> > +  - Svyatoslav Ryhel <clamor95@gmail.com>
> > +
> > +description:
> > +  This module is part of the Motorola CPCAP MFD device. For more detai=
ls
> > +  see Documentation/devicetree/bindings/mfd/motorola,cpcap.yaml. The
> > +  power key is represented as a sub-node of the PMIC node on the devic=
e
> > +  tree.
> > +
> > +properties:
> > +  compatible:
> > +    const: motorola,cpcap-pwrbutton
> > +
> > +  interrupts:
> > +    minItems: 1
>
> Should this be maxItems: 1?
>
> > +    description: CPCAP's ON interrupt
>
> Or I suppose:
>
>   items:
>     - description: ...
>

Both options are perfectly fine for me, and I lean towards using
"items: desc" but I would like to hear what schema maintainers would
say, which layout is preferred in this case.

>
> > +
> > +required:
> > +  - compatible
> > +  - interrupts
> > +
> > +additionalProperties: false
> > +
>
> example: ...
>
> > +...
>

