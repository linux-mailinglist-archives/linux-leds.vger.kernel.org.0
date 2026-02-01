Return-Path: <linux-leds+bounces-6799-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6O1gKFX6fmnlhgIAu9opvQ
	(envelope-from <linux-leds+bounces-6799-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sun, 01 Feb 2026 08:01:41 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B4FBAC50C1
	for <lists+linux-leds@lfdr.de>; Sun, 01 Feb 2026 08:01:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 619F93004DAE
	for <lists+linux-leds@lfdr.de>; Sun,  1 Feb 2026 07:01:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E61D2DFA5B;
	Sun,  1 Feb 2026 07:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jn9EfSA6"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 638EE25F98A
	for <linux-leds@vger.kernel.org>; Sun,  1 Feb 2026 07:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769929293; cv=pass; b=LfJTEFipejiKOBIlJGPKfRoH8M55lW6CbBo70UOoF9LsnelznZ562EWhjLXUroq9Y5s/PfvuRvHy7xyNcksy+Rf8Jg3u02E5bYc4Dtcjt4PZKvrtsHc3hLDfQRc82CeQQ5Q08imvuv/sLgMe/4tR5T35nVvEDAHNOnsixC4JaqY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769929293; c=relaxed/simple;
	bh=4lwxL+MX5lYgnvQjumgh4AurnaGrE32hCgCl0vhDOYM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TpFp6ZyxzFCCvTdhK0Z87DlkmdBjCwEUMcEa77iKq0BDYXj8+7e7BVEevh4B4d6VRVsNQHqOxSXAIKzyTkoIhbugmRZBk/xnLvO3Ihnhx6DQzTqsSN/0MiqjbK3gV1mlDTQxYcvYWA4MDrdPT/OM8p75a0PT24WfVOkMnQqu+fk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jn9EfSA6; arc=pass smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-42fbc305882so2153457f8f.0
        for <linux-leds@vger.kernel.org>; Sat, 31 Jan 2026 23:01:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769929290; cv=none;
        d=google.com; s=arc-20240605;
        b=FR8z61HZraZALaYzvcP/QvViYtzYJK2a9gtUxr1kSmv2V3NaOCfdXAg9nt6b6v4nJY
         esy8aZ8rY600c3Vgjn/0KaxXxdouWUMmOqCf+MIM38RfBv+RPOuB6TvsRsqY+M3eUTIe
         4cw9kcR2yjUf1mu8745tWIbzhyW3Kev4u36bDI8QQar9iA50aWGazI7B0Kd2ZAGiT0dc
         mJ89LADtBQvvXf36Bancb4FACt+X0Dpy+o9+KWdLLWryjTdyt4zTgEGauUnw8QEaqeCC
         6Q1Hd0rrrK/nPW9E8iRQU87UbZucElpdpJ/7uxpvo1+J/mJx/pKUDOMboTpGYYp849aT
         ymBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ru6T+Kx+o+wF1O0sdT4WJIlvaSW/GAs5TSwcPEqdU2s=;
        fh=WFGYrljkj8C+m0NUy1IK0p40JQnhmWW+SKz8g2hksDo=;
        b=IkIjwfrEkWZ2SPSsGqM4xVC2pT/LZ2eV7HqOR9+/Rf8dB3c++mDfpE2rMXvvUNpNXe
         UG1+DAlnhS0dfaePdaazhR6BB3xIlsGz6vcGua4DccmMwzGPPnm7tddAULjL45zDlhr+
         TAOMnsiwQz7SYH6/Hx5KqHUra6iPwuxLThXVc2VFP/QXaa/FW3zWpRHN9xb2BlTAlmhQ
         H1vCwYh09s9Z11GoYbPFp5hTHwt/OsbIkI69eUDOAYLY3w6O0AdLrRHFIHts6XDJsORL
         erGchRg0yIkH0oWnnSCvrG6H0MBgv6eyKdvoN8C1pGxjo+qmuHUhf8EwUsF5JKNlrIry
         AEZQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769929290; x=1770534090; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ru6T+Kx+o+wF1O0sdT4WJIlvaSW/GAs5TSwcPEqdU2s=;
        b=Jn9EfSA6fRuIVKLr4AaDLNSKBNL8pNLIzAn3ZvhMvVaTDKFsq+ipWeCMRNkekMrUgb
         A0Ln5mZ3LggiURzzV2WBXJxP6cuuWXb9TNIlrGVNUxwCIIaEem1gpptyrSPCZ5IlMDzt
         5fUbTS5GA6rBJL/oI1+pxmc1I/uBvhnJp+aO2sGBmNMcyl/Xyo7jAV9n5GbMdfk+o807
         NMKhRMYdWew37MtphMm6TqfcCIju0X+RKLvk8Vsd43Yo681J0zRY+sepZFOjGN7tkDRF
         PWC+YPRkx8zVPqfVGZwbFfwyirHPDJ+z/+3WyyRp0uY1XpuaRpWj7vuJVPrx6xv4dztz
         aa4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769929290; x=1770534090;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ru6T+Kx+o+wF1O0sdT4WJIlvaSW/GAs5TSwcPEqdU2s=;
        b=tZj9Htl5n4TGamhwIOvNCNQwc3pHC89FhFRg/iXtzUn7iR3OY9RSCLpbGxZGXcQfjt
         r7uqi7DNKQm/uiOZUAwhbvkp9gsdnh8eTNWIKDlMOsiKyWJvHiFT3tqDOPehD9GcUOof
         vtcVKddnENy2RVkeHuj/cto+9vVdUjVcu1M41CZkcALVuFaVHzbSdSwMn6yBj/1wEvyU
         d4Z/YM+otG6AFmAt4wqx2Afs8OWpX14RxeIDBlYwvzYMLqAQgufC2ClBLi13z8QQfaYi
         imrkrNU/5FfjwvHb6/GR6rfuWEoEubNNJyRsrXLSeUdNn17P8rmBu7pReUAF0Puyh1Z6
         8Nig==
X-Forwarded-Encrypted: i=1; AJvYcCUa58qczyi97LNT5BAQoDPihzKk8Qx6okWlzzo21weuZOota8ev+7bPuTj8qRt+oxQ32gGgoxZQll5w@vger.kernel.org
X-Gm-Message-State: AOJu0YyJKdOjiem0QXY7ghOCXBGjA/6591bc9rtgCNPePYNYYaVXFdB+
	4kgH8RFwYJJFeLvgTDFxCmgaPLl+YRw2LUmx4ICVV4BTBv0fb2PS3zFhzooSAVyKOVZwNO1z3+7
	YWUYjXgQtbxxxLJ9CTMkNbMUH9bCH+jY=
X-Gm-Gg: AZuq6aII9WetbY2uBHZ5vbcRnh1Mo7R+qeA48khTAZY7W/+yp2U55iJZ5V7HQQVdOEs
	kBGyVCNjxzulzWH3DLiCxUeGTZT/n7Ni1B8HEvisqbB0IFJX6Yfzx9eOfEAcpDV8EDFBI8rz8Co
	C0i4Nmm4l6eSkUsAqA018SzrZC8schtHIpEzB6ZYfTkiEUc0p3lTMsr0daNnEoSKSMNLqErcYKf
	ntT8qojf8pUiplfteYqHmNJr7Z90Ca/YSEFowrbH91D3cHgQEpHWnu2U7kCwAitUlGKVJrz
X-Received: by 2002:a5d:5f54:0:b0:435:693e:c03e with SMTP id
 ffacd0b85a97d-435f3a7e60emr11130004f8f.19.1769929289499; Sat, 31 Jan 2026
 23:01:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260125134302.45958-1-clamor95@gmail.com> <20260125134302.45958-2-clamor95@gmail.com>
 <d7938728-fded-4d5e-b23d-a8346e3fab46@baylibre.com>
In-Reply-To: <d7938728-fded-4d5e-b23d-a8346e3fab46@baylibre.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Sun, 1 Feb 2026 09:01:18 +0200
X-Gm-Features: AZwV_QgtHi-_En-5pR0mvFW293XW7g0IV-2szoIz-T-UyTapQDFggPFL8QY1fqE
Message-ID: <CAPVz0n205rKSAq2Jbtahn6xW2MYgSm61qxjRbsSs_4RBSEs34Q@mail.gmail.com>
Subject: Re: [PATCH v1 01/10] dt-bindings: regulator: cpcap-regulator: convert
 to schema
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6799-lists,linux-leds=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,mail.gmail.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B4FBAC50C1
X-Rspamd-Action: no action

=D1=81=D0=B1, 31 =D1=81=D1=96=D1=87. 2026=E2=80=AF=D1=80. =D0=BE 21:46 Davi=
d Lechner <dlechner@baylibre.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On 1/25/26 7:42 AM, Svyatoslav Ryhel wrote:
> > Convert devicetree bindings for the Motorola CPCAP MFD regulator subnod=
e
> > from TXT to YAML format. Main functionality preserved and added compati=
ble
> > for CPCAP regulator set found in the Mot board.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  .../bindings/regulator/cpcap-regulator.txt    | 35 -------------
> >  .../regulator/motorola,cpcap-regulator.yaml   | 51 +++++++++++++++++++
> >  2 files changed, 51 insertions(+), 35 deletions(-)
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
>
> Old example is missing the required regulator-names property.
>
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
> > index 000000000000..b73d32a86904
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/regulator/motorola,cpcap-regula=
tor.yaml
> > @@ -0,0 +1,51 @@
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
> > +      - motorola,mot-cpcap-regulator
> > +      - motorola,xoom-cpcap-regulator
> > +
> > +  regulators:
> > +    type: object
> > +
> > +    patternProperties:
> > +      "$[A-Z0-9]+^":
>
> Why not put the valid names here? Or does the node name not actually matt=
er?
> (in which case lower case could be allowed too.)
>
>          "^(SW1|SW2|...)$":
>
> And $,^ are swapped.
>

This is an interesting suggestion, maybe schema maintainers can
suggest how to approach this? Node name and case matters, list of
possible names is in the description.

> > +        $ref: /schemas/regulator/regulator.yaml#
> > +        type: object
> > +        description:
> > +          Valid regulator names are SW1, SW2, SW3, SW4, SW5, VCAM, VCS=
I,
> > +          VDAC, VDIG, VFUSE, VHVIO, VSDIO, VPLL, VRF1, VRF2, VRFREF, V=
WLAN1,
> > +          VWLAN2, VSIM, VSIMCARD, VVIB, VUSB, VAUDIO
> > +
>
> If these apply to the regulator-name property, it can be written instead =
as:
>

Regulator name does not matter, any name is acceptible.

>   properties:
>     regulator-name:
>       enum:
>         - SW1
>         - SW2
>         ...
>
>
> Not sure if it is strictly needed, but this would document the optional
> property:
>
>     regulator-boot-on: true
>

this is covered by common regulator schema, along with other possible
regulator properties

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
>
> Example should go here.
>
> > +...
>

