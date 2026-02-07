Return-Path: <linux-leds+bounces-6881-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CL7tFOEDh2mpSwQAu9opvQ
	(envelope-from <linux-leds+bounces-6881-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sat, 07 Feb 2026 10:20:33 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id DF951105501
	for <lists+linux-leds@lfdr.de>; Sat, 07 Feb 2026 10:20:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 336EF30065E3
	for <lists+linux-leds@lfdr.de>; Sat,  7 Feb 2026 09:20:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69BC430E0F9;
	Sat,  7 Feb 2026 09:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M9mit3MZ"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 131442FDC26
	for <linux-leds@vger.kernel.org>; Sat,  7 Feb 2026 09:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770456030; cv=pass; b=dNd/hhkOWjbKd2Er2dh9HSsEziUd8Jz66kxKnjCexT6lO4AD354rw46J1g+6d6ws63J4GRJeUHkgqpXoCXVIMy1RejTzeXfpJGD4OCuikYPML+H8hSbNEQUw6pOrpmESMfBtUW5e6JDCnm1WzGhTELNcZLUno1TnmjdEvW8Gf8k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770456030; c=relaxed/simple;
	bh=cy4A7rvGum9/P7zJXPm/8IWM6o1KPiGpFPtqRktj2bo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GCsInZ7aDYThWCjHAEFxNE1yuLRgXv0g/ppb2t5c5AyLyqLBe8bn3BQbJwyR1OJGtDEFpUkooqrRFvAcMK1dMxJYBqbODUHppjWXwtsmEWHOEBuCuDCaiprkqQ0kULKhssEucZnIBhF0Q2u1+Z+QINRURuYJA7kpvBW3At+UNYk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M9mit3MZ; arc=pass smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-436e87589e8so31211f8f.3
        for <linux-leds@vger.kernel.org>; Sat, 07 Feb 2026 01:20:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770456028; cv=none;
        d=google.com; s=arc-20240605;
        b=ksjLSyBhx7k9o7yi6YU5n4dVf8MEFozNUwxLRffvwGUuaKwkxmJzG5HCB2NbZzLEGR
         rFJjK4iWixzx5TCTWr4F7En5LF3l6ALckMGAk+R+S015yGChTfSc9/guU8uzsAdjHhsk
         pD3fOmkk3Jw0fYt8h0Em1hS6pLisRr221BHp3/IIvJjG2FZoobjwJRKJtKK3n7ZPcDSr
         iOWMDAcQH6HMmxEVoeJL6CjttwNkpn6oAcOio6KEPd/NxNEtNodXZ/irxFxyogp4zCQb
         q0LQIhQNeCUFGIke/y+VFRAC1LK+Q9lGHKKLls1mHCrzzimEi8ljvbON7Ycra8N2gFhq
         J/tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5IniXECrOUfTc9Ybm/eSbm1Y2H5SJTil/wMGC8X/eL8=;
        fh=xEUpKdUNHqcFKC5BAcuD6n1FFW/VKh3O6iCqnOlvVms=;
        b=KMGJWBVCDV72QunPuU+kf4FXSddhKdEo3RgUqZJs3Y0lmo+lW6HXClDX5JCd9lbN8y
         rRQkZgkGQJZMDfCCFzgP5yVMzzGeDXebCq1PgtTECIqNnhhf8rJeSCPi1oxEyrhSegGW
         vpTYcZTjWqEAkwnFNuuiCahE4EtPcIk2ANcREAccc9CtFjn1gAAd5gPk3R6kUXD8dJ8P
         0V8AKKZIFMP+OaQI0oDfmFxMaCJHDgrkskpK8tzukSImOnfekH6QbdqGIEP2iKM8ulsY
         eK9CdIjAM6uuk14fTNCc27qA+0LTnuaOD8YXu6BYupwmHa+CCczZFO3S03cA0L4Qdytw
         By1g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770456028; x=1771060828; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5IniXECrOUfTc9Ybm/eSbm1Y2H5SJTil/wMGC8X/eL8=;
        b=M9mit3MZkAsemcuc0rx+tkFJRXH41lDCpolqqqmcfzoAziQ7iZjf2hNp14NjkNGi1e
         znDdtO0EsfcFMPJAJIWhvEVpNaCnsyuiR57grujXQ5NF9fqX20NFe1Ch8YFN5B9/sBCw
         gMrIDDWMJxD9JuwQwGVloWUymTCZ0LF2Mpvou8kyZM6G0u1KGsj2aXyZW9vqyoFj3v6s
         Rch6GLnAEiCjUIryml15QasvQ9USVuZrScLw5bmRGBMGB0O3eX8UR0w3M/kBrQi2d8vl
         zke/BRX+BwQuwOwBfdvH/auRKEAdwyn+LVR924ZdSMzCvWGTsRfBXcx72p0i1Co5zynU
         Hz9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770456028; x=1771060828;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5IniXECrOUfTc9Ybm/eSbm1Y2H5SJTil/wMGC8X/eL8=;
        b=H/9Goevz57olpVrFS8+rlLIK7gZfhhDj2bQL7LUTzwiouao65rub/1Kjj+qNQqW1eC
         fD0qjlkCjdbdhwgs99ejElEuDgp/zylaURwxehyarVwdd9BwGJkzG20unhceDyCqMFBy
         lRIA+kvnnexh8I3w47OvWG8s4yyO1mYiYawcfBk6jKm5VQ0x64KEzTZs7Xm2c5p8yi81
         8ldReVE6pS7AfRehtXAtDMmo2zk3w1cZIC2dpjth3VqMw40mdFBZ0JlSYueK7KbuvtCM
         IJ9r+KjAy9gBBfBh1aGH5ErOOczKCmhnRnuTmSPy4H4kaLCkLkU0aDEU3Vq+MfOxpPAm
         mW0g==
X-Forwarded-Encrypted: i=1; AJvYcCVNDWc9T08tIhBe6pt92s8pD8RUAOl9GCRoGvOOk8R5xRbgd2powvmIX+VGjXl9W4XxbACWM0kvI/lW@vger.kernel.org
X-Gm-Message-State: AOJu0YwhCyKglUP1XNTWJR5VJCzgoJF2+jW7ubGDA15ySpLOt/iNuGnp
	g0KMqkv0RCV+FiNTXwiFpvdRYD0nCfXMxnBbabCa9khJzDfURha2Tiqo2/qS06/5x857CNpmfCX
	qD9PioYnttyKZyMnEmTsPkv9mmOVuFK4=
X-Gm-Gg: AZuq6aIlcbMmnTo7d5gUSMCEzx5Rx26bAUr9U5SyYsvwY74biKnJZN5rzyiP3V2s7Kk
	E0VUPkVxuCQHFYJeiAVDqCLePbJmckXa64FcacmiGjKiRIZ/mQZBZVw0xmgZzsBw+1MdalzHTBc
	ATCpBUMzOrmP7FfFDZvaVF3ncLJgIgCITH4tOox3z7YmHamaUKFcQgcTWF6rsZNdp6SPRM6HRuK
	ToXWSiGSIkkA3ebgCzNxQpw8JceT9RexkAvq4WTTmjYp0bv+M1x8Fo2qAukZAUbV5jaMC4b
X-Received: by 2002:a05:6000:420e:b0:435:d84f:4853 with SMTP id
 ffacd0b85a97d-4362938b24dmr7580007f8f.35.1770456028155; Sat, 07 Feb 2026
 01:20:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260206172845.145407-1-clamor95@gmail.com> <20260206172845.145407-2-clamor95@gmail.com>
 <20260206230922.GA254792-robh@kernel.org>
In-Reply-To: <20260206230922.GA254792-robh@kernel.org>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Sat, 7 Feb 2026 11:20:15 +0200
X-Gm-Features: AZwV_QgS3-zSft7PiK4Y7AUbYQceyqA5VWBqSZgT2tr_s54EIIDfm21b-58zfy0
Message-ID: <CAPVz0n3EGCSLUX7jTLve0x0z4uW1yexViCwkSQLY2d_4r4qkjg@mail.gmail.com>
Subject: Re: [PATCH v2 01/11] dt-bindings: regulator: cpcap-regulator: convert
 to DT schema
To: Rob Herring <robh@kernel.org>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Lee Jones <lee@kernel.org>, 
	Pavel Machek <pavel@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Dixit Parmar <dixitparmar19@gmail.com>, Tony Lindgren <tony@atomide.com>, linux-iio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-leds@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6881-lists,linux-leds=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_CC(0.00)[kernel.org,baylibre.com,analog.com,gmail.com,atomide.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,devicetree.org:url]
X-Rspamd-Queue-Id: DF951105501
X-Rspamd-Action: no action

=D1=81=D0=B1, 7 =D0=BB=D1=8E=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 01:09 Rob H=
erring <robh@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Fri, Feb 06, 2026 at 07:28:35PM +0200, Svyatoslav Ryhel wrote:
> > Convert devicetree bindings for the Motorola CPCAP MFD regulator subnod=
e
> > from TXT to YAML format. Main functionality preserved.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  .../bindings/regulator/cpcap-regulator.txt    | 35 -------------
> >  .../regulator/motorola,cpcap-regulator.yaml   | 50 +++++++++++++++++++
> >  2 files changed, 50 insertions(+), 35 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/regulator/cpcap-r=
egulator.txt
> >  create mode 100644 Documentation/devicetree/bindings/regulator/motorol=
a,cpcap-regulator.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/regulator/cpcap-regulato=
r.txt b/Documentation/devicetree/bindings/regulator/cpcap-regulator.txt
> > deleted file mode 100644
> > index 36f5e2f5cc0f..000000000000
> > --- a/Documentation/devicetree/bindings/regulator/cpcap-regulator.txt
> > +++ /dev/null
> > @@ -1,35 +0,0 @@
> > -Motorola CPCAP PMIC voltage regulators
> > -------------------------------------
> > -
> > -Requires node properties:
> > -- "compatible" value one of:
> > -    "motorola,cpcap-regulator"
> > -    "motorola,mapphone-cpcap-regulator"
> > -    "motorola,xoom-cpcap-regulator"
> > -
> > -Required regulator properties:
> > -- "regulator-name"
> > -- "regulator-enable-ramp-delay"
> > -- "regulator-min-microvolt"
> > -- "regulator-max-microvolt"
> > -
> > -Optional regulator properties:
> > -- "regulator-boot-on"
> > -
> > -See Documentation/devicetree/bindings/regulator/regulator.txt
> > -for more details about the regulator properties.
> > -
> > -Example:
> > -
> > -cpcap_regulator: regulator {
> > -     compatible =3D "motorola,cpcap-regulator";
> > -
> > -     cpcap_regulators: regulators {
> > -             sw5: SW5 {
> > -                     regulator-min-microvolt =3D <5050000>;
> > -                     regulator-max-microvolt =3D <5050000>;
> > -                     regulator-enable-ramp-delay =3D <50000>;
> > -                     regulator-boot-on;
> > -             };
> > -     };
> > -};
> > diff --git a/Documentation/devicetree/bindings/regulator/motorola,cpcap=
-regulator.yaml b/Documentation/devicetree/bindings/regulator/motorola,cpca=
p-regulator.yaml
> > new file mode 100644
> > index 000000000000..50bc57f06b51
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/regulator/motorola,cpcap-regula=
tor.yaml
> > @@ -0,0 +1,50 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/regulator/motorola,cpcap-regulator.=
yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Motorola CPCAP PMIC regulators
> > +
> > +maintainers:
> > +  - Svyatoslav Ryhel <clamor95@gmail.com>
> > +
> > +description:
> > +  This module is part of the Motorola CPCAP MFD device. For more detai=
ls
> > +  see Documentation/devicetree/bindings/mfd/motorola,cpcap.yaml. The
> > +  regulator controller is represented as a sub-node of the PMIC node
> > +  on the device tree.
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - motorola,cpcap-regulator
> > +      - motorola,mapphone-cpcap-regulator
> > +      - motorola,xoom-cpcap-regulator
> > +
> > +  regulators:
> > +    type: object
> > +
> > +    patternProperties:
> > +      "$[A-Z0-9]+^":
>
> I thought it was said on the last version to list the names. Considering
> you already have them below, better to put them in schema than prose.
> And pretty much all regulator bindings define the names.
>

What exactly do you propose? All those names will not fit into a
single unbreakable line (more than 125 columns in length btw). Patch
checker will complain about this. Duplicate pattern properties for
every few names? Please be a bit more specific. Thank you!

> > +        $ref: /schemas/regulator/regulator.yaml#
> > +        type: object
> > +        description:
> > +          Valid regulator names are SW1, SW2, SW3, SW4, SW5, VCAM, VCS=
I,
> > +          VDAC, VDIG, VFUSE, VHVIO, VSDIO, VPLL, VRF1, VRF2, VRFREF, V=
WLAN1,
> > +          VWLAN2, VSIM, VSIMCARD, VVIB, VUSB, VAUDIO
> > +
> > +        required:
> > +          - regulator-name
> > +          - regulator-enable-ramp-delay
> > +          - regulator-min-microvolt
> > +          - regulator-max-microvolt
> > +
> > +        unevaluatedProperties: false
> > +
> > +required:
> > +  - compatible
> > +
> > +additionalProperties: false
> > +
> > +...
> > --
> > 2.51.0
> >

