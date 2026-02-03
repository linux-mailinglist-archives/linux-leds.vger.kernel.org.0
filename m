Return-Path: <linux-leds+bounces-6830-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GHFaDWMOgmkKOwMAu9opvQ
	(envelope-from <linux-leds+bounces-6830-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Tue, 03 Feb 2026 16:04:03 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CA801DB007
	for <lists+linux-leds@lfdr.de>; Tue, 03 Feb 2026 16:04:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8A8D930465CC
	for <lists+linux-leds@lfdr.de>; Tue,  3 Feb 2026 15:03:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A56CB30C370;
	Tue,  3 Feb 2026 15:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L26QmPr3"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C58D02D47EF
	for <linux-leds@vger.kernel.org>; Tue,  3 Feb 2026 15:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770130998; cv=pass; b=ObloO5MxP033COG8KjWI9PBuSy7I8MRFNBJ1Kmyfedw3/XDi8owbyxKuhvwjr93CgEZ+z2uRcLIseKKKynrsx3dUu6RIFC5Y9CxW16JCx3jsH9CBJCGvr5NA3dfkirCzA6GF/fTvogISqqtDruUfhLFB7OzBumNSQd8T6ojfk5w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770130998; c=relaxed/simple;
	bh=s6TMw/t8TwmZ9hTFL0cXJhHoIVq+ti2CBVZ7v8bG9vo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CBwegytzEkAVSZ22YwNsgOD7QkKVrEi8oEV2BjQGvLmgLvfLrmupvvei2L9zkf/ZtKoq/405edR3BNcYb1EdeYZ8SB5y9WeL1eis4RbikS+crSJJzHAFewnc34VP6JfJIwE6++AatqZubczZA/jRT4pAAqxGUYlbWxpBcSD8gmc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L26QmPr3; arc=pass smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-47edd9024b1so46474955e9.3
        for <linux-leds@vger.kernel.org>; Tue, 03 Feb 2026 07:03:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770130994; cv=none;
        d=google.com; s=arc-20240605;
        b=hz3n1h57hAQmWaKDzoNyeWJXLz507lpn/hlzkNdjIFakTzLlbPinVwUM7/RtLNcS9e
         gDNWuwLsDiJtCLGX3nrV4+f7OvdhKk6XqWsJCCRkFx/wVAAkWw4MUKDCpu8P4VntD9o1
         jda2cxgeOy4grKqWQXo3A/EYhCRMmnoTl+wUJ5/RoGiUHE7uMNxTLIi8A8mqH8QzQ6eB
         Kn8dWR7KnAk+e5VkacJgWU3SAjD28xqQYFrtl0W60qSQFWLRhTRdYkEasEbT4Py4cwsX
         53se2mTTeDWmWg1Q2XJnemQdpujfOn/eNu7nX6xPU/LQjya28z2NIhLwEsvIdpNvxYcG
         di9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VGIYTuEUulJeU0/OSREhm3zUfZwfDji51fjUfoXxiEM=;
        fh=q2vBwEkT6yhvC6KZnfUNcl+Z1690e1P9ql6gI/Glgo4=;
        b=GX+cSCMnp4sMW9EZOmyM94wH9rO+Qnk8z+SNX4DI3mjfaSu4RDNvlEO9wqUh8Xpzv0
         hpX9lxFU5Sv5T8vNNqAggw3ksnSxAT26UmF5Hv/zqsZ3diAD97uICJOE2d6ZNaht5aT6
         0IZAE21UfMaDIMhGQmrwzyDYfneYO93etjCf0MELjLlV026UDTenz3tQC27lhZVuvMKc
         wumpIpwozGDELDUiIzNAx8xdG1VN+rih4AMQADd5C5qCJvzAqCeeuqrxiwnXXQPv4Upz
         MYNIo++kRUcyUIhwYs+HwwqlgbgGcUnvP0PNGPDuH6lYLzQGEm0t6iPJpbR2UghoIoxi
         ExaQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770130994; x=1770735794; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VGIYTuEUulJeU0/OSREhm3zUfZwfDji51fjUfoXxiEM=;
        b=L26QmPr3F2q4pZ10zq18C2Zy/c+5gclgQWPEw3YiAjWIFfHdVu3mMc5tlVwMrA+DCr
         V3duTPPiPCJv5jbIddMXKjwyc+0ThfFfnNetQMq3i0vvskDtUB61AEt2ejE6wlxhyrHT
         I+WCwkHgRlH8hgxJdfA58sc36mH5NS816iQv8CwxHJK4xuxv580QrVoj53btHyu9kIlJ
         u5aC2S/18T3MVNWgwobOJvegNRouijG1I9cJ6d++XXjSw2Ubqt/Vmr3s1a8KyYRcZqpV
         /hyYFwwAqSwFFSLq5slW8ZmJ5U0vKqACnguiOTZe2w//Hws/1DXUaJGStvWdDuFx4KTw
         ieJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770130994; x=1770735794;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VGIYTuEUulJeU0/OSREhm3zUfZwfDji51fjUfoXxiEM=;
        b=HNXgSx71gH/sredhkgn64E62pMj1zQFEQBEyFBoi0BAx9rwq3kNs+z4wuwnO6hXDCM
         VuxJZrlt2Fpqy26AvnprB3jDvFvSNuvqpZ4cdwRM4128sXZtJeDcHKZ+zcG+yp5w1UYb
         4EauXNtmpTcjptNFxizPYR+kdJWJMU2jf695+C5PC4b0cPdyjaK9OH5jXaHe6B98aQ5R
         vB+dYlYP2FiwgdQ6gqIqtVUV4daAgkLGRcpac10rBSb37MjHcKgHzHj0892imRpZ5xAd
         Ba/VJuF+FjFD270wXy+4G8RjgH0PtTPYmG+JL2iCVQd+Zx0ilgKGBsNA/T29sDo/xsdo
         72Cw==
X-Forwarded-Encrypted: i=1; AJvYcCVbIQApmWS3KrF3hYvlMgs09ovDIpTzS/npn3SJGKQNNhvnNcBoFVHJLJA5uo/eg8dbmWj5taq1lHBh@vger.kernel.org
X-Gm-Message-State: AOJu0YwHysa69rAAisQQnX1/AFWbLS//H1xJom2Jy3TyJX7XDcD//REP
	c2IuuNoccGl2y8CjCvFRET407F2Mf+ARjLTGq664pJojSwpSWKRNuxS4JK7oNYhbP6JMPTURFHY
	yb/GFkAaj9AhMkGrzanFcmSUpqkExXPY=
X-Gm-Gg: AZuq6aKSp8uSuE5ljX7rhqgEJG34Q4wWI5i+COzqFk2baUC338k6whu9J4UUE2Nzbuj
	pVD6BBDOOYyJi6Glw0AWPdRemq3RIoUQXn/sHVSP5O1FJCDzSlHVmE8xfFfoOlMXpY0Vp13JXtE
	0lVDjmb6OWe+AVrqdhTwt6Q5wL0rFk0dTHoNqeAogRVjU+zUCsIRJfTbTqazhnPKObt7HzTqNuk
	7Gnb1PLt6Y5PrIyZKclyFITvkR7F5nCQzlY+oXHdAlT5Tq+0f+SAhlxfJTaDG0wox25MWFw1cKt
	Sskarww=
X-Received: by 2002:a05:6000:2892:b0:432:8504:b8a9 with SMTP id
 ffacd0b85a97d-435f3ab4f69mr24923375f8f.62.1770130993838; Tue, 03 Feb 2026
 07:03:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260125134302.45958-1-clamor95@gmail.com> <20260125134302.45958-8-clamor95@gmail.com>
 <8bd89524-dfc3-43b0-b0f2-cdb1cd51e1ac@baylibre.com> <CAPVz0n25ukBJ6=hmmR9nd4MBoPkHaHQ+ZHMXYxghYZdkB28_sg@mail.gmail.com>
 <20260203150136.GA2294714-robh@kernel.org>
In-Reply-To: <20260203150136.GA2294714-robh@kernel.org>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Tue, 3 Feb 2026 17:03:02 +0200
X-Gm-Features: AZwV_QhOrUmL6-YXtCaWdQ-PpGGpcikpM7Wb1yHtElG5VPVf7VhpylKKUQiQ_9M
Message-ID: <CAPVz0n0rG5XDUi-sr75rw_++kBbfyAfpMH0DoONZPmUKHfLfCg@mail.gmail.com>
Subject: Re: [PATCH v1 07/10] dt-bindings: input: cpcap-pwrbutton: convert to schema
To: Rob Herring <robh@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>, Jonathan Cameron <jic23@kernel.org>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
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
	TAGGED_FROM(0.00)[bounces-6830-lists,linux-leds=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[21];
	FREEMAIL_CC(0.00)[baylibre.com,kernel.org,analog.com,gmail.com,bootlin.com,atomide.com,vger.kernel.org];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,devicetree.org:url,mail.gmail.com:mid,baylibre.com:email]
X-Rspamd-Queue-Id: CA801DB007
X-Rspamd-Action: no action

=D0=B2=D1=82, 3 =D0=BB=D1=8E=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 17:01 Rob H=
erring <robh@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Sun, Feb 01, 2026 at 09:07:07AM +0200, Svyatoslav Ryhel wrote:
> > =D1=81=D0=B1, 31 =D1=81=D1=96=D1=87. 2026=E2=80=AF=D1=80. =D0=BE 22:02 =
David Lechner <dlechner@baylibre.com> =D0=BF=D0=B8=D1=88=D0=B5:
> > >
> > > On 1/25/26 7:42 AM, Svyatoslav Ryhel wrote:
> > > > Convert power button devicetree bindings for the Motorola CPCAP MFD=
 from
> > > > TXT to YAML format. This patch does not change any functionality; t=
he
> > > > bindings remain the same.
> > > >
> > > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > > ---
> > > >  .../bindings/input/cpcap-pwrbutton.txt        | 20 ------------
> > > >  .../input/motorola,cpcap-pwrbutton.yaml       | 32 +++++++++++++++=
++++
> > > >  2 files changed, 32 insertions(+), 20 deletions(-)
> > > >  delete mode 100644 Documentation/devicetree/bindings/input/cpcap-p=
wrbutton.txt
> > > >  create mode 100644 Documentation/devicetree/bindings/input/motorol=
a,cpcap-pwrbutton.yaml
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/input/cpcap-pwrbutto=
n.txt b/Documentation/devicetree/bindings/input/cpcap-pwrbutton.txt
> > > > deleted file mode 100644
> > > > index 0dd0076daf71..000000000000
> > > > --- a/Documentation/devicetree/bindings/input/cpcap-pwrbutton.txt
> > > > +++ /dev/null
> > > > @@ -1,20 +0,0 @@
> > > > -Motorola CPCAP on key
> > > > -
> > > > -This module is part of the CPCAP. For more details about the whole
> > > > -chip see Documentation/devicetree/bindings/mfd/motorola-cpcap.txt.
> > > > -
> > > > -This module provides a simple power button event via an Interrupt.
> > > > -
> > > > -Required properties:
> > > > -- compatible: should be one of the following
> > > > -   - "motorola,cpcap-pwrbutton"
> > > > -- interrupts: irq specifier for CPCAP's ON IRQ
> > > > -
> > > > -Example:
> > > > -
> > > > -&cpcap {
> > > > -     cpcap_pwrbutton: pwrbutton {
> > > > -             compatible =3D "motorola,cpcap-pwrbutton";
> > > > -             interrupts =3D <23 IRQ_TYPE_NONE>;
> > > > -     };
> > > > -};
> > > > diff --git a/Documentation/devicetree/bindings/input/motorola,cpcap=
-pwrbutton.yaml b/Documentation/devicetree/bindings/input/motorola,cpcap-pw=
rbutton.yaml
> > > > new file mode 100644
> > > > index 000000000000..643f6b2b1f13
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/input/motorola,cpcap-pwrbut=
ton.yaml
> > > > @@ -0,0 +1,32 @@
> > > > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > > > +%YAML 1.2
> > > > +---
> > > > +$id: http://devicetree.org/schemas/input/motorola,cpcap-pwrbutton.=
yaml#
> > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > +
> > > > +title: Motorola CPCAP PMIC power key
> > > > +
> > > > +maintainers:
> > > > +  - Svyatoslav Ryhel <clamor95@gmail.com>
> > > > +
> > > > +description:
> > > > +  This module is part of the Motorola CPCAP MFD device. For more d=
etails
> > > > +  see Documentation/devicetree/bindings/mfd/motorola,cpcap.yaml. T=
he
> > > > +  power key is represented as a sub-node of the PMIC node on the d=
evice
> > > > +  tree.
> > > > +
> > > > +properties:
> > > > +  compatible:
> > > > +    const: motorola,cpcap-pwrbutton
> > > > +
> > > > +  interrupts:
> > > > +    minItems: 1
> > >
> > > Should this be maxItems: 1?
> > >
> > > > +    description: CPCAP's ON interrupt
> > >
> > > Or I suppose:
> > >
> > >   items:
> > >     - description: ...
> > >
> >
> > Both options are perfectly fine for me, and I lean towards using
> > "items: desc" but I would like to hear what schema maintainers would
> > say, which layout is preferred in this case.
>
> Either is fine. 'description' is fine if you have something specific
> about the interrupt to say. Saying what the interrupt is for is
> specific. So 'description' is good in this case.
>

Noted, thank you.

> Rob

