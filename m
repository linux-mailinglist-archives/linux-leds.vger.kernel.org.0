Return-Path: <linux-leds+bounces-6952-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gLueOYtgk2m64AEAu9opvQ
	(envelope-from <linux-leds+bounces-6952-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 16 Feb 2026 19:23:07 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ABA8146F77
	for <lists+linux-leds@lfdr.de>; Mon, 16 Feb 2026 19:23:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DE6E3302D084
	for <lists+linux-leds@lfdr.de>; Mon, 16 Feb 2026 18:22:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7D8F2DC34E;
	Mon, 16 Feb 2026 18:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mrn4c/f9"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD7C12BEC4E
	for <linux-leds@vger.kernel.org>; Mon, 16 Feb 2026 18:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771266174; cv=pass; b=lJfU0OAdHbtBROsfLjH/NrOb6SRcQVlmNm6fXldsUx5SIb67ikJnryU0+W5IDvaUMl1vBDjv77zJAxUOfRIS4oI1pWMkDGz+LOIWrD2vft3U/IQ6W0czU6/F5XnaJ8o72T2RUlfVqOICNG7xbE3ULbWWhsOYXM3aJRa2Z/nyXm8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771266174; c=relaxed/simple;
	bh=cm1yxjwH9Z28ptmYFhe3IeX8mFESDp5HLnpkx6ZPfcw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ckDb1b9BzsIpe2fKQFFI4CtQmn9FThXcZwOj6JX77NctqJOhvyFYax81Ls4nbqNNPqBjx3YO5Uestxt/eU2zDWSUJhuWuvP8uGvqTW+q1OnHIYlnmiq1Kq74YkKbuIDzSllY/h//eoGJJYB311lA4wdKvcs6ZhHp3Q9cckWvyZ8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mrn4c/f9; arc=pass smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-4359a16a400so3453041f8f.1
        for <linux-leds@vger.kernel.org>; Mon, 16 Feb 2026 10:22:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771266171; cv=none;
        d=google.com; s=arc-20240605;
        b=L1VtZfwazQPwA+dSXE8ooNbL7As7sKrNbXvp0azCvjWkEea0SX73De47S8pfoXjHFI
         hDkozwMBmjtRwtoR2EJZBJWpel+tP2JvnmNL+7SDoB2ATOhI1Xt3VCHJsBfkobqZCKK2
         5N3xAMbjY1Z0KqEbavEmpO9D+HfmwFFw+QAO3sBTFthol4+dquih9bT6/d5bSxZII1+H
         LhWVYdhRG7K0iZB6dAyleYGShwI+JgOiDdd2fZ4CEIfKO/rcsAIeVDOKsnqzY3stSPb9
         3Klf8LvszX65NA7bDvhxOKT7oZFk4S7gM8s6P8WKr+zXW8vxvEb+NCp1Uu7Skx/JlAoa
         XsXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lx9sMXC6RQXXITKl7w/e4T7ej5sF4JRPpHYSQw3vBPo=;
        fh=Sjzb/U848obxYEyM72y+qxzqiW6Lm+vuEN1DHCR3JKE=;
        b=YCMdy208YXDdnmE+2Dps8Yu6vAad9IKcGIRkTUU1586eOxYWpbTGbzIx6VybN0IQhi
         RWTxxD64EDQFDrRJIEw41jK83B5DazVV5CZ2zNxCWTs0nrsCRLizm934LB1eSqhJrU4M
         JJV1ol07zb+ps4brWRX4G6vWOvAmmSt0BjSqTtiKCpdoXwwhC7xL03A9pmUMl48/lMEe
         c+agH0gwJENyHNb964EpzgvAMqrOZOAApSQwuC0Ox1PIZUKhSTXayHU9gVlDhzKX42KY
         /Qsp9r+UhKJIjeUJnNkDzt0nkfPyMgkpTWDtgo2QToeRIjQWVH5SUovVMO6cbB9GeY+V
         RGqw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771266171; x=1771870971; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lx9sMXC6RQXXITKl7w/e4T7ej5sF4JRPpHYSQw3vBPo=;
        b=mrn4c/f9C8iG3KjzBr7WeyIuFe4HbDBR1txqEj8X8i15dnw9KiSGR8KMIrQzttndlj
         mhb3drp9n8nnz3LWvST2aRgAlVQ9V64/xpS1DhR/l1J2RSirIpgmiVCt1SKYdZG0XERx
         GAS+1Nd0P1jdknc7jfxebO9TkTOZfQlv7HXPolkFjS6IF5tBQsYVGijYuS15jgAVtrdd
         Gd52bf+ebNmQeoh0/Ng4lP0kGIVeA9icjrzVqf8HGNk+AZ/5IHVm3VgGrp2Z7XUcpm4c
         IvpX6+6trK50UJVV8xgbhfJ2r55K9Y6E772E1VjnL7FI1VfUJ9s1yHbhhNt2QC0EnXOw
         ZxDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771266171; x=1771870971;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lx9sMXC6RQXXITKl7w/e4T7ej5sF4JRPpHYSQw3vBPo=;
        b=G+Dq1CWn5eV91fu48IYxVb9mxZMcm+xJnGgFboCToiMAXVFXxZyGT/vgU5i9QHdbUe
         WyPoKnnIWPRML2cJxf1WM5JbmWrlc6GFMdX7+XFNITHzYMsh83Qm0MKM+uYLyFoRhQM3
         uAo47Q/gkL4eq8s7daGcUZJEnzeeTQPJWQUH6qex9EvD7FsM1SjvTbX0Gw0Y8JoJJtEC
         f7NHRj2pd0cJ/R3J0BREmUgx8wheQ10TQVmoUKLQe3SW56oavzd21rzMpe7hLw5emro6
         AFg/eBM3jX6POSIdyvpEFbqUQWqyfb4KI0LIvV7ncGFpy7a8SgJo9XfCalsPrqYbvM5K
         AXVg==
X-Forwarded-Encrypted: i=1; AJvYcCXWFoi3cz0gSzRvqGaPkr/FYRElrOyZGna5o5+8OW3uqu16l2Jl4cofDP4Z4Lq0oj8iKYLWgNV8ew99@vger.kernel.org
X-Gm-Message-State: AOJu0YwEdbSJhqTmmz6fB1nroMEnygbY+5BxAxt0y9LvFwpqhEOfMdMS
	dWSTJUhbGt3prBKryyolBbbaOZYZhrAYiuRZ78RGpM9/Z42QnQXGYHdLfod3uNuhU+4f9dWTbeV
	jfpKD2P5WaETsvaNCXi1c98tAwOpJaog=
X-Gm-Gg: AZuq6aISSirMtwzEN6xU2L2IH33zu1G0t4NBlwXXziqf6z2WOenAmTgaT08CkrjnFQQ
	LYyBqLd++xwDF8m490v4+UnQM4gUnOBwEUlzIweKkawicKhfZSYoMBOyRnaY50hbbfK1ezgRny9
	u2TbWz7voFOILGLmlg3kfHL8jbxjmhtUU0TJp4GGwWrzkkYedl4hGzv/a2+dpdLniLcIf+aeHaA
	+xGrl973APVZj4ZE56n01DCAs+SvPH1a8xwxv/Vo5sIUbusD9XF85oOt81RAS6SNVG1T/ovXeuI
	za3b6udj
X-Received: by 2002:a05:6000:1a8b:b0:437:8f37:881 with SMTP id
 ffacd0b85a97d-4379791904emr22365422f8f.32.1771266170899; Mon, 16 Feb 2026
 10:22:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260214180959.30714-1-clamor95@gmail.com> <20260214180959.30714-2-clamor95@gmail.com>
 <20260216-sprung-scallop-de7b64bf528c@spud>
In-Reply-To: <20260216-sprung-scallop-de7b64bf528c@spud>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Mon, 16 Feb 2026 20:22:38 +0200
X-Gm-Features: AaiRm51tYAHBz4R8xs0e14b6OB9K4x6nBDeDJNAKVOoJXReY0VIDDmGSWevQOtk
Message-ID: <CAPVz0n06+uLCSfY_bYS9v7KJ-hXotye7ej-rze6-Q8_JAF7XVA@mail.gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6952-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-leds@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,agorria.com,rere.qmqm.pl,vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,0.0.0.19:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 8ABA8146F77
X-Rspamd-Action: no action

=D0=BF=D0=BD, 16 =D0=BB=D1=8E=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 20:04 Cono=
r Dooley <conor@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Sat, Feb 14, 2026 at 08:09:53PM +0200, Svyatoslav Ryhel wrote:
> > Document embedded controller used in ASUS Transformer device series.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  .../asus,transformer-ec.yaml                  | 98 +++++++++++++++++++
> >  1 file changed, 98 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/embedded-controll=
er/asus,transformer-ec.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/embedded-controller/asus=
,transformer-ec.yaml b/Documentation/devicetree/bindings/embedded-controlle=
r/asus,transformer-ec.yaml
> > new file mode 100644
> > index 000000000000..670c4c2d339d
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/embedded-controller/asus,transf=
ormer-ec.yaml
> > @@ -0,0 +1,98 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/embedded-controller/asus,transforme=
r-ec.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: ASUS Transformer's Embedded Controller
> > +
> > +description:
> > +  Several Nuvoton based Embedded Controllers attached to an I2C bus,
> > +  running a custom ASUS firmware, specific to the ASUS Transformer
> > +  device series.
> > +
> > +maintainers:
> > +  - Svyatoslav Ryhel <clamor95@gmail.com>
> > +
> > +allOf:
> > +  - $ref: /schemas/power/supply/power-supply.yaml
> > +
> > +properties:
> > +  compatible:
> > +    oneOf:
> > +      - enum:
> > +          - asus,p1801-t-ec-pad
> > +          - asus,sl101-ec-dock
> > +          - asus,tf600t-ec-pad
> > +          - asus,tf701t-ec-pad
> > +
> > +      - items:
> > +          - enum:
> > +              - asus,tf101-ec-dock
> > +              - asus,tf101g-ec-dock
> > +              - asus,tf201-ec-dock
> > +              - asus,tf300t-ec-dock
> > +              - asus,tf300tg-ec-dock
> > +              - asus,tf300tl-ec-dock
> > +              - asus,tf700t-ec-dock
> > +          - const: asus,transformer-ec-dock
> > +
> > +      - items:
> > +          - enum:
> > +              - asus,tf201-ec-pad
> > +              - asus,tf300t-ec-pad
> > +              - asus,tf300tg-ec-pad
> > +              - asus,tf300tl-ec-pad
> > +              - asus,tf700t-ec-pad
> > +          - const: asus,transformer-ec-pad
>
> Can you explain somewhere here what the "dock" and "pad" devices are and
> how they differ? For example, I am currently wondering why tf700t has bot=
h
> "dock" and "pad".

"pad" is used for the controller in the tablet itself in the pad
"dock" is used for the controller in the mobile dock keyboard.
Seems quite obvious.

> Also, why are some of the compatibles permitted standalone? That should
> be mentioned in your commit message too. Also, other than the sl101, the
> standalone ones seem to have the same match data in the mfd driver. Why
> are fallbacks not made use of there?
>

Because standalone compatibles describe a unique hw configuration
which cannot be grouped into something meaningful. asus,p1801-t-ec-pad
is for EC of Tegra30/Intel based p1801-t AIO, asus,sl101-ec-dock is
for EC of Tegra20 slider tablet, asus,tf600t-ec-pad is for altered EC
in Win8 Tegra30 tablet, asus,tf701t-ec-pad is for Tegra114 tablet.
Different generations, different form-factors.

> Since this transformer series seems to have multiple programming models
> for "ec-pad" devices, it calls into question your use of the generic
> fallback compatibles is appropriate and makes it seem like you should be
> using device compatibles as a fallback.

That is redundant.

>
> The rest looks okay other than the filename, which doesn't match any of
> the compatibles that you've got here.
>

How should I call it then?

> Cheers,
> Conor.
>
> > +
> > +  reg:
> > +    description:
> > +      The ASUS Transformer EC has a main I2C address and an associated
> > +      DockRAM device, which provides power-related functions for the
> > +      embedded controller. Both addresses are required for operation.
> > +    minItems: 2
> > +
> > +  reg-names:
> > +    items:
> > +      - const: ec
> > +      - const: dockram
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  request-gpios:
> > +    maxItems: 1
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - reg-names
> > +  - interrupts
> > +  - request-gpios
> > +
> > +unevaluatedProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/gpio/gpio.h>
> > +    #include <dt-bindings/interrupt-controller/irq.h>
> > +
> > +    i2c {
> > +      #address-cells =3D <1>;
> > +      #size-cells =3D <0>;
> > +
> > +      embedded-controller@19 {
> > +        compatible =3D "asus,tf201-ec-dock", "asus,transformer-ec-dock=
";
> > +        reg =3D <0x19>, <0x1b>;
> > +        reg-names =3D "ec", "dockram";
> > +
> > +        interrupt-parent =3D <&gpio>;
> > +        interrupts =3D <151 IRQ_TYPE_LEVEL_LOW>;
> > +
> > +        request-gpios =3D <&gpio 134 GPIO_ACTIVE_LOW>;
> > +
> > +        monitored-battery =3D <&dock_battery>;
> > +      };
> > +    };
> > +...
> > --
> > 2.51.0
> >

