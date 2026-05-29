Return-Path: <linux-leds+bounces-8369-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CDMvOxhyGWqNwggAu9opvQ
	(envelope-from <linux-leds+bounces-8369-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 29 May 2026 13:01:44 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F10E660139D
	for <lists+linux-leds@lfdr.de>; Fri, 29 May 2026 13:01:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6CD54303130A
	for <lists+linux-leds@lfdr.de>; Fri, 29 May 2026 10:56:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20E013CCFAE;
	Fri, 29 May 2026 10:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lbu8DpMo"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52B143C98B9
	for <linux-leds@vger.kernel.org>; Fri, 29 May 2026 10:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780052193; cv=pass; b=pmK5RqKEPRN1yM0NzU17VhkIcsC0kDZguEI3LvJT9ejwcEkB5/jiWCrVgQ8rGRCm6FpV+ULg+eC7U1M9sgOCL6PFrYYRgeKmkW2LScAsvQwYR4G79KLHa4SUjfcae01xS1CPVnjGiZz3rR5kh0vHm2eqrQMQRjcvXXb92/Fzahc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780052193; c=relaxed/simple;
	bh=Y7dc5LHP74ZYKK/a6Hv5SvYo8Aw44DNxbmzdGSGer2o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BDdDEWTo1pRqbw+i8/kD2nRwbyCqjG5UcnpbB/f/YzyGVEL3IsvFzWLMuY5nH8Q2/BTh1fT2ROVjSq1kTUIEdHn/HKHY9DkGEAwY8l6HKn9sx6o1ohGQaEi5lH+DC21JhuvKvmw7OR5mGAd4CGJ5SzjdrraITkX0zZQnMseOaAw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lbu8DpMo; arc=pass smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-304d0ac5e3cso200353eec.0
        for <linux-leds@vger.kernel.org>; Fri, 29 May 2026 03:56:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780052189; cv=none;
        d=google.com; s=arc-20240605;
        b=FVPBDtBof8g+lcMFvfn+OJ9ErjCf1/xeFxXesDRSiqBzBAkUycwgpy1FFznT15msug
         w6OKLI6JiHP2xOXcIO+s0i/cmLXr+QnkkaAjFUdCuIA8mxg+w0Ugg4vUR9WZpAHyBWuJ
         8LfHpNJnSOn5Vo7WxIpVzoyLst2k+yoTCbMrQsZKddK+eDUjEMyx+BX+8EK8HN1sziPJ
         cO/EVQ9pa+xPRBY+78d+VzlniHmk93VzVBSOghbZBokc+4ZUqRxCk3BDSbMJBznewzkt
         kBNKoWEij4UHnp0gBFN/lr86TNAtdD0e6biY69NKJ/7oiALuTw5kwIthhGNo+DXTBsL2
         DHFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QT9o7z8njCzuauXIRpTZNkDYlGBM5NI3aWAig5/bi7I=;
        fh=GctDOw2yjoqBbFisQiAAv7MXrQNtSH0yyBAuUZW+QFE=;
        b=JTSAAu6d8C3eiA33yAsK0vvWnF5dTl2dx5vSsxMI6u2oq/pftEP36s4OPvn85OkSIc
         Rc9ca/JtG3meJH0FHfVsCXZEZiAZZBFT7A8NXg0v0HKHxrK/ta1Mjro5mpN4q3dA1HUe
         UIg1YRWRRkXOIZo2+tFqfKbzaqitVkIL/frr0uWbHkl240I2We+Xtm9JKeg4DPwYJYOK
         a77smKT4KgCAbfBptQSIlNfSjq7zvfCup2qoTEdffQ+aK/AaczHRUsYTAljViMcOaaEM
         aqBFBkfbtMXnHcIN6j46dTZFXgSh+VFVgz3VItg7Lr2uXnHiCh3FuvITtEgpcHLV021J
         M2KA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780052189; x=1780656989; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QT9o7z8njCzuauXIRpTZNkDYlGBM5NI3aWAig5/bi7I=;
        b=Lbu8DpMo4pxqcsBXVtbqLe0NhbTjFp50POcVMm48mQVhtTSnx0CscTWnpEanSdshzS
         RkLGTJ2ta28nxAuIvrp/aTEswQScWUYjm2RxHPRwWmXJAvbtQeAnstVlu3d0C4lLms3s
         8F8Jn7/FHkuu7Jkm6ytH94infdSRNx1jXu6eKBu2CpGJIpQdNBZLvNzWQIUlaqfZMUV2
         tNZpqfBXzY7Or/6IYF342HTinVEb1ATIF9GPqXibUvuNqanXTqcVEwda5B89Dv4jxmMG
         9hNy6Hsht1Qc4oCp0EV9sIb0FtTtNCgIKdPRUZQBZ6COtvZjFvzJ96rgyTuVsB0s19r6
         OthA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780052189; x=1780656989;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QT9o7z8njCzuauXIRpTZNkDYlGBM5NI3aWAig5/bi7I=;
        b=bMIo5OfZxhDW6QKMK6/iIU2WLi7yg3PsK/2TMxNa9QAWurEKr3nEqXxYXmPrjW89Iq
         SM38OPYWEtCBRoORK99dy6upz9Os67TEUAjVzlFgDVXtnzsVkfOPjyw9vuNQai9r30gj
         L/kfcqg1yYbnd6C4+TLL+GfTe1NTGkUVBCUOo0mak/qWEEGFaEoC/VFeNnttKQ3DgxTO
         TzDhn8pFd+w8bVl5fGddySEQgyApFsuD+ayNMPn3kYPt8s/k0ne4F8GyyvJpqz5HYHGV
         vAl8mlpzfK8I1UOj2ttfrtB8qAN143TnhDbeGXb5E9qxxthz2qonqQhxBXDKDkt9Z1BO
         ljfw==
X-Forwarded-Encrypted: i=1; AFNElJ8fLgqruTFSwgcdLxwOeyfAsEEy2L8LMgp6WwH4Tbyblej2A9LDhrzODXW+nZUVTRHwYZqoXetyQK7f@vger.kernel.org
X-Gm-Message-State: AOJu0YzbB4VvpD0bL4HbYxU0odM/zoBy9TyDlqyfPOt86vvt9+0WtmYP
	QGsBxRj7fYnTy/rDAMAI2Ig2w6XX28Tel+d6uttYIyQfy552d5fudxOZnEmJVqPIZ8Qb4MYJNKn
	Q3eKHWP+dvVwrOOLqHAozl1Rn6JnXA1M=
X-Gm-Gg: Acq92OFhtEiCxEiSBSTXYnN/eSBFMlvtdgSqjsNQzhpCFGHaqNptPEcZxC4G+JYbdhN
	ipRRPIry/SO1dGsixsZ0hT57INXbf7lv0+YvBDztAOXmQVXoo9ibTuP8bFOEQhijatGXz1eQn/6
	cTp03AnTrHNWnnvr/rBKlheLft2e44NYemUy8r+KexLq1GOKPjpdlIiV6/jg31swCRBWJ2Rxtw5
	POLNDu95q6tD2pJBcPBzisahL71LKbV2MdjpGrurTEtcId6/57ksKDSkiBbPUO/nSbGKmXymRbi
	An8Fir/YJ1cfv88BHFujaABiQ0Yhqg==
X-Received: by 2002:a05:7301:688a:b0:2da:4216:7ea3 with SMTP id
 5a478bee46e88-304eb16c784mr1065135eec.14.1780052189412; Fri, 29 May 2026
 03:56:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260528135123.103745-1-clamor95@gmail.com> <20260528135123.103745-2-clamor95@gmail.com>
 <ahlhinOh3NxB7FY_@aspen.lan> <CAPVz0n3C8D+amSRkF=Koj6Niu6u8uz4LbMoRYEX32_ECm5-tSQ@mail.gmail.com>
 <ahludIZPMUlPDTG_@aspen.lan>
In-Reply-To: <ahludIZPMUlPDTG_@aspen.lan>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Fri, 29 May 2026 13:56:16 +0300
X-Gm-Features: AVHnY4J2FFsbeePVzhdaZr1L7xTMY9M_-IQ9RntYfCEGWE3LHkP9pzzQ1jAxVDc
Message-ID: <CAPVz0n0XvQwLd6gv2kiVHfSTyM_jF142beSwWb3L9sBLEQDzZA@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] dt-bindings: leds: Document TI LM3533 LED controller
To: Daniel Thompson <daniel@riscstar.com>
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>, 
	Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Helge Deller <deller@gmx.de>, Johan Hovold <johan@kernel.org>, 
	dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-iio@vger.kernel.org, linux-fbdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-8369-lists,linux-leds=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	RSPAMD_URIBL_FAIL(0.00)[riscstar.com:query timed out,devicetree.org:query timed out];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[20];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-leds@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,baylibre.com,analog.com,gmx.de,lists.freedesktop.org,vger.kernel.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,devicetree.org:url,mail.gmail.com:mid]
X-Rspamd-Queue-Id: F10E660139D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

=D0=BF=D1=82, 29 =D1=82=D1=80=D0=B0=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE 13:4=
6 Daniel Thompson <daniel@riscstar.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Fri, May 29, 2026 at 01:07:50PM +0300, Svyatoslav Ryhel wrote:
> > =D0=BF=D1=82, 29 =D1=82=D1=80=D0=B0=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE =
12:51 Daniel Thompson <daniel@riscstar.com> =D0=BF=D0=B8=D1=88=D0=B5:
> > >
> > > On Thu, May 28, 2026 at 04:51:18PM +0300, Svyatoslav Ryhel wrote:
> > > > Document the LM3533 - a complete power source for backlight, keypad=
 and
> > > > indicator LEDs in smartphone handsets. The high-voltage inductive b=
oost
> > > > converter provides the power for two series LED strings display bac=
klight
> > > > and keypad functions.
> > > >
> > > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > > ---
> > > >  .../leds/backlight/ti,lm3533-backlight.yaml   |  68 +++++++
> > > >  .../bindings/leds/ti,lm3533-leds.yaml         |  66 +++++++
> > > >  .../devicetree/bindings/leds/ti,lm3533.yaml   | 170 ++++++++++++++=
++++
> > > >  3 files changed, 304 insertions(+)
> > > >  create mode 100644 Documentation/devicetree/bindings/leds/backligh=
t/ti,lm3533-backlight.yaml
> > > >  create mode 100644 Documentation/devicetree/bindings/leds/ti,lm353=
3-leds.yaml
> > > >  create mode 100644 Documentation/devicetree/bindings/leds/ti,lm353=
3.yaml
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/leds/backlight/ti,lm=
3533-backlight.yaml b/Documentation/devicetree/bindings/leds/backlight/ti,l=
m3533-backlight.yaml
> > > > new file mode 100644
> > > > index 000000000000..866b0fb8ed04
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/leds/backlight/ti,lm3533-ba=
cklight.yaml
> > > > @@ -0,0 +1,68 @@
> > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > +%YAML 1.2
> > > > +---
> > > > +$id: http://devicetree.org/schemas/leds/backlight/ti,lm3533-backli=
ght.yaml#
> > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > +
> > > > +title: TI LM3533 high voltage series LED strings
> > > > +
> > > > +description:
> > > > +  This is part of the TI LM3533 MFD device. It represents two high=
 voltage series
> > > > +  LED strings for display backlight controlled by the TI LM3533.
> > > > +
> > > > +maintainers:
> > > > +  - Svyatoslav Ryhel <clamor95@gmail.com>
> > > > +
> > > > +allOf:
> > > > +  - $ref: /schemas/leds/backlight/common.yaml#
> > > > +
> > > > +properties:
> > > > +  compatible:
> > > > +    const: ti,lm3533-backlight
> > > > +
> > > > +  reg:
> > > > +    description: Control bank selection (0 =3D bank A, 1 =3D bank =
B).
> > > > +    maximum: 1
> > > >    <snip>
> > > > +  ti,pwm-config-mask:
> > > > +    $ref: /schemas/types.yaml#/definitions/uint32
> > > > +    description: |
> > > > +      Control Bank PWM Configuration Register mask that allows to =
configure
> > > > +      PWM input in Zones 0-4
> > > > +      BIT(0) - PWM Input is enabled
> > > > +      BIT(1) - PWM Input is enabled in Zone 0
> > > > +      BIT(2) - PWM Input is enabled in Zone 1
> > > > +      BIT(3) - PWM Input is enabled in Zone 2
> > > > +      BIT(4) - PWM Input is enabled in Zone 3
> > > > +      BIT(5) - PWM Input is enabled in Zone 4
> > >
> > > This is optional and the drive implements a default (zero) that is no=
t
> > > documented here.
> > >
> > > Is zero a sane default from a DT binding point of view?
> > >
> >
> > Yes, if property is missing then PWM input is disabled which is
> > equivalent to setting all bits to 0.
>
> So the default should be documented in the bindings?
>

Ye, sure, I can do that.

>
> Daniel.

