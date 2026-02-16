Return-Path: <linux-leds+bounces-6954-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QPQCGbZsk2kb4gEAu9opvQ
	(envelope-from <linux-leds+bounces-6954-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 16 Feb 2026 20:15:02 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D269147335
	for <lists+linux-leds@lfdr.de>; Mon, 16 Feb 2026 20:15:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id F281E3004047
	for <lists+linux-leds@lfdr.de>; Mon, 16 Feb 2026 19:14:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 778842E5B05;
	Mon, 16 Feb 2026 19:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gBraj7yv"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAADF26158C
	for <linux-leds@vger.kernel.org>; Mon, 16 Feb 2026 19:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771269295; cv=pass; b=JA3cFuQgAb6JmY1Hr/YFIja7zzEEnjzCLrAaOmJgvIv4Aw2iTs+O+DQyn0cEsM+z4rOtKHxdJdDCdCbZ3Uq7PUmJSmm7A4Uf8wxjBtQj0Hrmjy4puAAuhmOimmaWS28zB7Gn/JTfcGkAl/GuEiWfiRKuhTQUiPVfspBB82ZBtLw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771269295; c=relaxed/simple;
	bh=6roQzUPN6oF3NP6XZiyAscAXoZCFMtBPdLph18EvMsQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YIqOdxogD3iEgKaHxsZw3z3DLWVIGg7npbxzlG3f8u6Pfop53Lzey9GKhWm9cUJkLRTwm9MpW9vxyo+Y19eG2Iaevllg5mdbPR8cdxFPg028zvZAA9gs3aeMW3UMtXMWH77B0ZDYP4IJ1cbMdColiemKfeaXwSuSMoVXtGYdKQQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gBraj7yv; arc=pass smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-483487335c2so33159405e9.2
        for <linux-leds@vger.kernel.org>; Mon, 16 Feb 2026 11:14:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771269292; cv=none;
        d=google.com; s=arc-20240605;
        b=Me0Z/pOBofZ3bKXU8TPY/i3uTsHGAkvEhCBtMkFiSuI8qk2opn5KYYLvmn+RpvLlXA
         xztnwwhbwVlGgKZN/e8VatQhK4Gr3ycT5cqmbKhxKyKDVpnmthJ99zVIzNSg8wLfCjpR
         oHOVq0pcpcXjlxiuWFxbBBeuopgCpkML210pKCo6jrvk0HLt9dj6fjGSj3fYjvp38F7z
         OxfbHvQWMa3ayt/wVhQ5S69mG0N6fCL7poxl3JkJVRxhmqex9YR9XnAWHtl0dd0k9ZSk
         8xhPdpTpH5aUko3vmaCI7rHGJr+JITVz4QhUiNcXQ6X4/fbNNPCatFOfh5n4bAugcgaz
         QAiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8HzOcCRMFSbyhDqPBsCkdLqSYse4L0GDbUboaIwjmC0=;
        fh=lkR9FJyaEkpz0a3XXdsM6pD/A9+yZOMaT+rI1mDpPMA=;
        b=iQTnR7ahGEKhvYsP6jbF9tMst6r4T2t0Na/aN2AjkdBG4ihJBlqvGrgyNdOqgDCsdk
         zrZToFfITqaT4f7sGKmHopYaRWv2tRCVKOUoCx3lp0p7Avw490YZhAHqOIQ0eFs29+Ju
         ImjV2a3Pigj500uGX0WUyuzvZClWW9aUYskvLTHVt5Pp0WeT2HqgO3gocnNLvfhah4Md
         NV1wVbHlraMVEkVjLsu1yFRRQKOwJalloz3FkSAy4a1MlTeA1V6pE4+IvplVl1RgipND
         nrzwxhMYPWqVJRUoxVP1sPq+RbKDo//iAkQZTPcOpmPs19OPQRrX0yj1rbWTG2kr7PZg
         9FyQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771269292; x=1771874092; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8HzOcCRMFSbyhDqPBsCkdLqSYse4L0GDbUboaIwjmC0=;
        b=gBraj7yvq+F0JdwUJQGHi4JwvgYHX8PH+X4t8HtCuAQ0MX6rh0TxmgG7XZcamn5M/7
         pNyAMs4ysjDh3rD1Zbnw2niCR29cCHjIwUgnh0pG+0yub7kWA44vmiGZcmRqwvBRQTnE
         kyL6bUN2OUdP0VeNwbzytm8+luO1vUgRk0sq4GPcz6ikxpB7jGHYdusz58VOTbZFJfx6
         SM153meyBkL+zq08mPcj+KpaRd32z7XbntEgJ3NJzb/aU9u4KEIAjg+Ns4KHdeU/zUT+
         W6PfHFSD7BiB/kbNHoHX42pXTHcUp0oau9UnwKBzjZ/LOWgXXI6b1sw09yHmm/nhSm4J
         ikZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771269292; x=1771874092;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8HzOcCRMFSbyhDqPBsCkdLqSYse4L0GDbUboaIwjmC0=;
        b=PumplaQSu9rR4yebyWkySAxGuojCllSH4EFqgdv4dGBCNG8e3KIK85zKaqtfmwDJ5e
         b1eyLWCOAWSxnjEIjxJCE3VH8DOlOL9lIlDgaQfoS5nfFLzhNbIsoEAfk1BbQikBBCAx
         gSqzOTUepg9KKOkUP2iTIv1c7VLireOZKUQQbYxOKVYUzU8RHrKMXJYdz8Ull9LOl7NQ
         iPYZDlh4P+rePI/GBImaG1WFIvz6iMP9wECOar4VK70JYcd7CVz56ERBaAKnafX55vHM
         +D7JvWEYGTkvHF8dxGRUTIe3bd75gwTGsla3DPkuwhdUAhKBfHQDsmXblLQjiNmnQN3m
         T3kQ==
X-Forwarded-Encrypted: i=1; AJvYcCU4YJmJAuNrmANEpY473/avYvrrx59zlB9divKcc0z+G91i+pS1Fz0vJCEhbwmKd4Kp/Wvr3FdrDkGN@vger.kernel.org
X-Gm-Message-State: AOJu0YwATrN+HyAYABCdcagKof9UD1y160BbWkNNF7jIvD3T9BHzwNAo
	Mq8NuOex3pqGdiZAct55qKk87Kqio1KWdtmPQPyGKz2yGwf/+V+wDBEeArkJ8EPaSdNJrjSVSuM
	2L2mA1AAPNEfBbeafHEDME6NUOZqvHMw=
X-Gm-Gg: AZuq6aLEw8Jn8jimbpXsKmz4NXY+r/C48xhAwYSDC5csvI+dqRPOkmHfu9rebad0e5B
	JN9BvqB8uLReVI8Wuq1x5zl/9ahU4SIzImvtZBhloArgjC0VCJJxbVszl26+TpLji6BPEjhTVIB
	aJayr052TOXPBhWkUg5hn6WMGU1Oi9cOkniESZBVyK015pPBwofJS2obUFDh873thOMatzJLftD
	88IoUJNPzH2AbQEYaQK+PHNBuj2fVSCasuZ/ecJ7+rM2Ba0rHw/ylIo4fy648xDeTHizSAXIMcA
	aDsVhnCZ
X-Received: by 2002:a05:600d:6413:20b0:483:79ad:f3b9 with SMTP id
 5b1f17b1804b1-48379adf60amr118355585e9.28.1771269292113; Mon, 16 Feb 2026
 11:14:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260214180959.30714-1-clamor95@gmail.com> <20260214180959.30714-2-clamor95@gmail.com>
 <20260216-sprung-scallop-de7b64bf528c@spud> <CAPVz0n06+uLCSfY_bYS9v7KJ-hXotye7ej-rze6-Q8_JAF7XVA@mail.gmail.com>
 <20260216-plunder-defense-de11cf56dd3d@spud>
In-Reply-To: <20260216-plunder-defense-de11cf56dd3d@spud>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Mon, 16 Feb 2026 21:14:40 +0200
X-Gm-Features: AaiRm53pjJr4DTXWQu3qeK8s5InrNWpSnyhcexyGL2cJPzW4JG4-eMOhlmVuupI
Message-ID: <CAPVz0n0-LbTUZBCaO=oN3PpPLpwAqzNo29r687pKY8NbEE9giA@mail.gmail.com>
Subject: Re: [PATCH v3 1/7] dt-bindings: embedded-controller: document ASUS
 Transformer EC
To: Conor Dooley <conor@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, Sebastian Reichel <sre@kernel.org>, 
	Ion Agorria <ion@agorria.com>, =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-leds@vger.kernel.org, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6954-lists,linux-leds=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,agorria.com,rere.qmqm.pl,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 8D269147335
X-Rspamd-Action: no action

=D0=BF=D0=BD, 16 =D0=BB=D1=8E=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 20:50 Cono=
r Dooley <conor@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Mon, Feb 16, 2026 at 08:22:38PM +0200, Svyatoslav Ryhel wrote:
> > =D0=BF=D0=BD, 16 =D0=BB=D1=8E=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 20:04 =
Conor Dooley <conor@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
> > >
> > > On Sat, Feb 14, 2026 at 08:09:53PM +0200, Svyatoslav Ryhel wrote:
> > > > Document embedded controller used in ASUS Transformer device series=
.
> > > >
> > > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > > ---
> > > >  .../asus,transformer-ec.yaml                  | 98 +++++++++++++++=
++++
> > > >  1 file changed, 98 insertions(+)
> > > >  create mode 100644 Documentation/devicetree/bindings/embedded-cont=
roller/asus,transformer-ec.yaml
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/embedded-controller/=
asus,transformer-ec.yaml b/Documentation/devicetree/bindings/embedded-contr=
oller/asus,transformer-ec.yaml
> > > > new file mode 100644
> > > > index 000000000000..670c4c2d339d
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/embedded-controller/asus,tr=
ansformer-ec.yaml
> > > > @@ -0,0 +1,98 @@
> > > > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > > > +%YAML 1.2
> > > > +---
> > > > +$id: http://devicetree.org/schemas/embedded-controller/asus,transf=
ormer-ec.yaml#
> > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > +
> > > > +title: ASUS Transformer's Embedded Controller
> > > > +
> > > > +description:
> > > > +  Several Nuvoton based Embedded Controllers attached to an I2C bu=
s,
> > > > +  running a custom ASUS firmware, specific to the ASUS Transformer
> > > > +  device series.
> > > > +
> > > > +maintainers:
> > > > +  - Svyatoslav Ryhel <clamor95@gmail.com>
> > > > +
> > > > +allOf:
> > > > +  - $ref: /schemas/power/supply/power-supply.yaml
> > > > +
> > > > +properties:
> > > > +  compatible:
> > > > +    oneOf:
> > > > +      - enum:
> > > > +          - asus,p1801-t-ec-pad
> > > > +          - asus,sl101-ec-dock
> > > > +          - asus,tf600t-ec-pad
> > > > +          - asus,tf701t-ec-pad
> > > > +
> > > > +      - items:
> > > > +          - enum:
> > > > +              - asus,tf101-ec-dock
> > > > +              - asus,tf101g-ec-dock
> > > > +              - asus,tf201-ec-dock
> > > > +              - asus,tf300t-ec-dock
> > > > +              - asus,tf300tg-ec-dock
> > > > +              - asus,tf300tl-ec-dock
> > > > +              - asus,tf700t-ec-dock
> > > > +          - const: asus,transformer-ec-dock
> > > > +
> > > > +      - items:
> > > > +          - enum:
> > > > +              - asus,tf201-ec-pad
> > > > +              - asus,tf300t-ec-pad
> > > > +              - asus,tf300tg-ec-pad
> > > > +              - asus,tf300tl-ec-pad
> > > > +              - asus,tf700t-ec-pad
> > > > +          - const: asus,transformer-ec-pad
> > >
> > > Can you explain somewhere here what the "dock" and "pad" devices are =
and
> > > how they differ? For example, I am currently wondering why tf700t has=
 both
> > > "dock" and "pad".
> >
> > "pad" is used for the controller in the tablet itself in the pad
> > "dock" is used for the controller in the mobile dock keyboard.
> > Seems quite obvious.
>
> To someone intimately familiar with the devices maybe. Not to the people
> you have to justify your patches to. Your response implies that this is
> some sort of thing that's like a surface, but please put an explicit
> explanation into the binding somewhere as to what each compatible is
> for.

Ok, fair.

>
> > > Also, why are some of the compatibles permitted standalone? That shou=
ld
> > > be mentioned in your commit message too. Also, other than the sl101, =
the
> > > standalone ones seem to have the same match data in the mfd driver. W=
hy
> > > are fallbacks not made use of there?
> > >
> >
> > Because standalone compatibles describe a unique hw configuration
> > which cannot be grouped into something meaningful. asus,p1801-t-ec-pad
> > is for EC of Tegra30/Intel based p1801-t AIO, asus,sl101-ec-dock is
> > for EC of Tegra20 slider tablet, asus,tf600t-ec-pad is for altered EC
> > in Win8 Tegra30 tablet, asus,tf701t-ec-pad is for Tegra114 tablet.
> > Different generations, different form-factors.
>
> I don't see any reasons here that eliminate fallback compatibles.
> +       { .compatible =3D "asus,p1801-t-ec-pad", .data =3D &asus_ec_pad_c=
harger_data },
> +       { .compatible =3D "asus,tf600t-ec-pad", .data =3D &asus_ec_pad_ch=
arger_data },
> +       { .compatible =3D "asus,tf701t-ec-pad", .data =3D &asus_ec_pad_ch=
arger_data },
> +       { }
> Three of them use the same match data, so you need to explain why you've
> made these three standalone when all the others that share a programming
> model got a generic fallback. Fallback usage is based on programming
> model, not based on whether the devices are a physically different, so
> your explanation must reflect this.
>
> > > Since this transformer series seems to have multiple programming mode=
ls
> > > for "ec-pad" devices, it calls into question your use of the generic
> > > fallback compatibles is appropriate and makes it seem like you should=
 be
> > > using device compatibles as a fallback.
> >
> > That is redundant.
>
> I don't understand how that is a response to what I said.
>

in other words you propose this:

properties:
  compatible:
    oneOf:
      - items:
          - enum:
              - asus,sl101-ec-dock
              - asus,tf101-ec-dock
              - asus,tf101g-ec-dock
              - asus,tf201-ec-dock
              - asus,tf300t-ec-dock
              - asus,tf300tg-ec-dock
              - asus,tf300tl-ec-dock
              - asus,tf700t-ec-dock
          - const: asus,transformer-ec-dock

      - items:
          - enum:
              - asus,p1801-t-ec-pad
              - asus,tf201-ec-pad
              - asus,tf300t-ec-pad
              - asus,tf300tg-ec-pad
              - asus,tf300tl-ec-pad
              - asus,tf700t-ec-pad
              - asus,tf600t-ec-pad
              - asus,tf701t-ec-pad
          - const: asus,transformer-ec-pad

And in the driver add match to every single entry of enums?

> > > The rest looks okay other than the filename, which doesn't match any =
of
> > > the compatibles that you've got here.
> > >
> >
> > How should I call it then?
>
> Make it match a compatible, just like any other binding.

