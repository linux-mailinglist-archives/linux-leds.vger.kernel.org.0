Return-Path: <linux-leds+bounces-8179-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4OQVL0zQCWoOqwQAu9opvQ
	(envelope-from <linux-leds+bounces-8179-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sun, 17 May 2026 16:27:24 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 24056561A68
	for <lists+linux-leds@lfdr.de>; Sun, 17 May 2026 16:27:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D33AD30177AA
	for <lists+linux-leds@lfdr.de>; Sun, 17 May 2026 14:27:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 110A6272801;
	Sun, 17 May 2026 14:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LFi8kcNN"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91A3630BBB8
	for <linux-leds@vger.kernel.org>; Sun, 17 May 2026 14:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779028041; cv=pass; b=AOJ8k5alJ9I+MasPDF4hbdHxyFxgXJrSqCeIWktKqxDzA74yaiD6kKJmRVviUGY/cD+nC3lcvrq/FpUCE3a/UOsO5G4jDraYZHohgYkoS15Fj8kpo2NK2OsrShiyZo9FC31mOwMYNA8YQSnNC0K8DiuI2ATtpqNp2f44ydITseM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779028041; c=relaxed/simple;
	bh=IZHMWs+8Cp/KOe0MB2/iet7ivwJo1nP+BQO/cuxTsWA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kGzd8owZnPjceBSpozSJDeIuKmzay4C5O/DFq/ZM/yxaeItTQm09t4s4FazHmM2XZFgSwn/XM+IaYga/NJWQUYcomPW+MLrT2p3s9Hz74OQTU6qykFbiC9GNJvKBfiQacGS1Eoc7ZWtvx/dX4S6vcJzVc4my71qoWcCcPribACQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LFi8kcNN; arc=pass smtp.client-ip=74.125.82.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-135200bc7d2so3425545c88.0
        for <linux-leds@vger.kernel.org>; Sun, 17 May 2026 07:27:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779028029; cv=none;
        d=google.com; s=arc-20240605;
        b=WWaUPYO0G/Tjg7GdNV94vvPWhlv79QTkl+c263nuDCpezRadigCvioZZ+OVfdrAa/V
         58gtTP5v21ZyNfdHOxLARsJdH2xpnumRWoe+C698RL2znycY+JMDwWfDFzumRyefh58F
         UCJRTUfmNEH57TlKsF6jPzgnwzxUi05B0aN+uRBsJBoyclKN3znWMyvvO7oYFlummLx6
         I3dHg90a7SPnpntUHY5csUNDlUO6/2X8nFujekJ7kQTUQ/WPhBAi1QJABebRqDeGDr/K
         eqliG0Hwl9ZWIXAkQHlxQS97KUVlVwGVjBzw0kbk3IEOV/4t0zR1GanJ3LvDxm2bKzA5
         IBEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/a8k6USexvPeSs3shg8rdzm72XqtvkOnD2zVZ13eQgA=;
        fh=YsZJABCaieq54//AbRevUdF3dKB1Z36FQU0acxoKDRY=;
        b=KzmsrK4WhtDMgQKCWFFYRwwFWVoV37nyJDia3Aw6W1Z3g1gCQ5KNIAglrQbXIFf1ps
         isEbI1PLs0fpBmQNUPa5tkmLZYJa82hZJR0KOaDKCqvhkb7+sPXB/WZXXvFEqiEgdtOx
         gVa2EFmpGoyFC1h3M16dxpdvqJxb4O2W+SBrD2ZjWsm4N7VB4jHvo+0BUm8hCUprRDL1
         pBrQWugGjl5zIYfgQkOvsdWISr7ZcEtKN1Z9otRLcQvOZSLq+QWqmGfu5geZvHDYTAXS
         R25WZCLBH/1kGh8Am7aA5oD4hf8l5RayxPxuw8iObi8GBGejpoZEZKqwvrM99TiSPrk7
         NVyQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779028029; x=1779632829; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/a8k6USexvPeSs3shg8rdzm72XqtvkOnD2zVZ13eQgA=;
        b=LFi8kcNN3DmGtdifJZsCdIXVMuz9BXu6AWo42tERT5aeZAQajuOZObh9y4TqR/I8EX
         AT/seDSYZr0I1pYQMHeN49IMfkGU6SzEdMNVep2hXD7/zUWvmdNAlUC/Sj+Fx24bkJzo
         MbVFCm8aiBsZ9y1otZ5s6ul5RtqaW5S8iFW4kLPFcdUJ0GaBqx1L7Siu79N1FB6SDlBi
         15YF7TI3oYyD9jBmbH+WxspMMvcU56xqagV17S0cK4XGnZIsPmPSzwmAnZhzGa1YMQBB
         HZh7yFZ3OMkOKwz5EUoG79Gz0FC1CcuvOuoLcmiQ5WrC0hWen/gJkWOjzgmjcP8hKdNs
         Xb2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779028029; x=1779632829;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/a8k6USexvPeSs3shg8rdzm72XqtvkOnD2zVZ13eQgA=;
        b=fArd1xSEs7FgK9zX6nWlLJBoHQxDqIjbGEOgH0JSq4Y2yyIVAH1zYr7xZVXhQFhoco
         2t+43Ue3qivlYzmt6PLPbQr7QTHGo79OnCB4NQT5/nL75DLrb0pInrXn9mPegLBJIZv1
         jDammOg904w2EZ1F4AF9vKJyLIQD0+0fCZNl0s/se3Osx83Ys/tMIF+3Y3BfAA7aHBSk
         2J9iD+ssSqw/lLqjHy/Fd0yD9vjYH2VCtaD+C+8laPkVs6syPRz01f8nNrWhNmtBDpDv
         HMbfM9fT0Nb0haPxVO3+Cmf7Cbl4Pm3UrYHOuvtLF/xLB4hGnoyS+t4S190lDVxfrzlx
         Jz1Q==
X-Forwarded-Encrypted: i=1; AFNElJ/yX/POcqD5MZtF/UpbBHblRFMzAiRR0IRw/Hei8sEvHJd90mA4r/ZAJKSTduXuJzRzHJkZPXYiy4nl@vger.kernel.org
X-Gm-Message-State: AOJu0YzzP4yqAoYlEwCPBS5cMps5LCxnoo6+0y6if3/5fkQvwZC2U7pp
	yrqMwPzU4HZw8JonnjDFqdrvhPXmHVj0qz7ci3CSH49S9oNESnS4LKsnJg463eDfLs88QmitNg+
	VY/lihFLUuJDWKVCnm2c2OTqaa/DYAmw=
X-Gm-Gg: Acq92OG2RFBgPLsaXFWMydFmaal440hI/rf+RC8ZP/CxggQV0x7lVHmgKvEd4FgHPu8
	UJ7N2GdCRhr40fBrI2Ximlb3BT3Od5gTuKMmieKQgFTae4WNApO/Hxx51B+dMFpXgXTuQvQvwOP
	mE9drVQxpK0WfqUCZauzrf238W35sY7Q9jM+NtJWE6zm9i95FJQKTUhfVcC69IgNVxcHWQqIBPM
	lOR485AMAUMnWyvP/0H0mcrjRI42ping6miBdMPgpCKMXIPE5wbXAHmdwBi9UXMS1oNYKW8vHnf
	NLRvq7Ya
X-Received: by 2002:a05:7300:a907:b0:2f0:c8b5:3dc7 with SMTP id
 5a478bee46e88-30398680c36mr5240683eec.22.1779028029014; Sun, 17 May 2026
 07:27:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260517074306.30937-1-clamor95@gmail.com> <20260517074306.30937-2-clamor95@gmail.com>
 <20260517144453.61cc210c@jic23-huawei>
In-Reply-To: <20260517144453.61cc210c@jic23-huawei>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Sun, 17 May 2026 17:26:57 +0300
X-Gm-Features: AVHnY4IEMjYjQh2-EeqHWPNZxgaMpOfNHnP0k3ytWy1tFi4KeKl3gs6PRb7odls
Message-ID: <CAPVz0n10naSo_1n99orPGM4U8iDkOn1DW9Xe_RGE56CMpLm8kQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/6] dt-bindings: leds: Document TI LM3533 LED controller
To: Jonathan Cameron <jic23@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>, 
	Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Helge Deller <deller@gmx.de>, dri-devel@lists.freedesktop.org, 
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, 
	linux-fbdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 24056561A68
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-8179-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,baylibre.com,analog.com,gmx.de,lists.freedesktop.org,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.1:email];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,0.0.0.4:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,0.0.0.5:email,devicetree.org:url,0.0.0.2:email,0.0.0.3:email]
X-Rspamd-Action: no action

=D0=BD=D0=B4, 17 =D1=82=D1=80=D0=B0=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE 16:4=
5 Jonathan Cameron <jic23@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Sun, 17 May 2026 10:43:01 +0300
> Svyatoslav Ryhel <clamor95@gmail.com> wrote:
>
> > Document the LM3533 - a complete power source for backlight, keypad and
> > indicator LEDs in smartphone handsets. The high-voltage inductive boost
> > converter provides the power for two series LED strings display backlig=
ht
> > and keypad functions.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> Hi Svyatoslav,
>
> I focused on the ALS part.. A few comments.
>
> > +# see ti,lm3533.yaml for an example
> > diff --git a/Documentation/devicetree/bindings/leds/ti,lm3533.yaml b/Do=
cumentation/devicetree/bindings/leds/ti,lm3533.yaml
> > new file mode 100644
> > index 000000000000..2e200f172400
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/leds/ti,lm3533.yaml
> > @@ -0,0 +1,190 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/leds/ti,lm3533.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: TI LM3533 Complete Lighting Power Solution
> > +
> > +description: >
> > +  The LM3533 is a complete power source for backlight, keypad, and ind=
icator LEDs
> > +  in smartphone handsets. The high-voltage inductive boost converter p=
rovides the
> > +  power for two high voltage series LED strings for display backlight =
and four low
> > +  voltage control banks for individual LEDs. Additionally, LM3533 feat=
ures an ALS
> > +  sensor support.
> Mention it is an interface for an external ALS.
>

Noted, thank you!

> > +  light-sensor:
> > +    type: object
> > +    additionalProperties: false
> > +
> > +    properties:
> > +      compatible:
> > +        const: ti,lm3533-als
> > +
> > +      interrupts:
> > +        maxItems: 1
> > +
> > +      ti,resistor-ohm:
> > +        $ref: /schemas/types.yaml#/definitions/uint32
> > +        description:
> > +          Internal configuration resister value when ALS is in Analog =
Sensor
> > +          mode and PWM mode is disabled.
>
> Good to note why this is a firmware thing rather than a userspace control=
led
> thing. I looked it up, it's because expectation is the input is a current=
 from
> the external analog ALS and these are used to convert it to a voltage wit=
h target
> range.
>

I will include your explanation.

> > +        minimum: 1575
> > +        maximum: 200000
> > +
> > +      ti,pwm-mode:
> > +        type: boolean
> > +        description:
> > +          Switch for mode in which ALS is running. If this property is=
 set
> > +          then ALS is running in PWM mode, internal resistor value is =
set to
> > +          high-impedance (0) and ti,resistor-ohm property is ignored.
> I'd mention the ALS is an external device - so this is saying what interf=
ace thing
> thing connected is using.
>

Noted

> > +
> > +    required:
> > +      - compatible
> > +
> > +    anyOf:
> > +      - required:
> > +          - ti,resistor-ohm
> > +      - required:
> > +          - ti,pwm-mode
> > +
> > +patternProperties:
> > +  "^backlight@[01]$":
> > +    $ref: /schemas/leds/backlight/ti,lm3533-backlight.yaml#
> > +
> > +  "^led@[2-5]$":
> > +    $ref: /schemas/leds/ti,lm3533-leds.yaml#
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - light-sensor
> > +  - backlight@0
> > +  - backlight@1
>
> Similar for the led nodes.
>
> > +  - led@2
> > +  - led@3
> > +  - led@4
> > +  - led@5
>
> Curious - why are all the led nodes required?  What if some aren't wired =
to anything?
>

This is limitations of mfd devices. If it has subnodes, all subnodes
must be present to reflect mfd composition. Unused nodes should be
disabled.

However, I have asked Lee if he is fine if I will program dynamic mfd
composition based on the device tree. If he is fine, "required"
props/nodes list will be reduced.

> > +
> > +additionalProperties: false
>

