Return-Path: <linux-leds+bounces-3580-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D64D99ED1C9
	for <lists+linux-leds@lfdr.de>; Wed, 11 Dec 2024 17:30:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9F0351888EE9
	for <lists+linux-leds@lfdr.de>; Wed, 11 Dec 2024 16:30:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DDF91DD866;
	Wed, 11 Dec 2024 16:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HZMl9/Do"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43D20132111;
	Wed, 11 Dec 2024 16:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733934633; cv=none; b=qbpl/lupWaYg69yV3fpwBpi23vS+jtWyoDnrHZ4iIMB73/Old9zaf5gQazvRlmNH2IIsJhdaG0+/2Ct28lCzH/WIB8sEDTzguIADwj1buNw7aEW1GDwFweucRHdrHfi1Y07tGu3jKUwuv4yNsEoXI1AMJP1NbxJZs7VFbKlfjOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733934633; c=relaxed/simple;
	bh=3/jm22/tohnG6rM042xvVnRl8MCx4o5+LTddYTYPNgM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HqwI7rdM1vLhSRY4UCjjqQRPVRCI7tFZP4kaZYZjvOwHT8zP/EnY1ZevURBDZQZ9e7O5Ilk77cCQD0fXn4pz0phtYejjnQNBMGuB05OzGHg7RUlPDo+6yukNxnj2ldrax37vlpr1AunadiwzBd4/AzFiEH5VO+CjhxqwiAh1qa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HZMl9/Do; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA164C4CED2;
	Wed, 11 Dec 2024 16:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733934632;
	bh=3/jm22/tohnG6rM042xvVnRl8MCx4o5+LTddYTYPNgM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=HZMl9/Do1u1QKRvc1Qzw66fUiJkY9/mzukWiT/mcgOpmbZhHHGdX4k96r+zySjJ75
	 Yvodn3eb7xM0E16YzASNoDYbm8gkAT02/mEPA0OV7mYYPUrdLiTNN7c8WbU7at0p4N
	 Y7rhlHaJwPGInNF7Ut12z/tfKxIvDZhru/3Uz52LnYucOJMQLtKj2zhvsk8uBZAsM0
	 OylbvFiU87Q8KTQNGxHMJ4PYDASDQHmjSHzQ+EAQvpfvvIXMaayRG1krUG4zBPbj/h
	 SxvfNI7o2MK06eOl7/0sLYXGpi4RiD2LDQeuVWnHevZGHjHC8T7dnWDjGh8j3T8nyU
	 onml7FZMAcAPA==
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-6ef7640e484so81214847b3.3;
        Wed, 11 Dec 2024 08:30:32 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU0/lEZTrdmT/RT0QItHhBkux2//sitEDkHL2TB2xI587QM9jD6iMiBCOJ6aXiXUUpAccoZNUn8ngkn@vger.kernel.org, AJvYcCWOOiTUPsueRgcrMZshgrxOQcOcsbCkOfGlUow8/cb1JUy+Gy+x393uLSzHX544PC3WeH3XX+znxYFB9w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyOnDiODAtHdCGygPMagTej1+cNJX5WiPzqUZD/HZRvjHABZ1CX
	GTND5UcMPIqWEYXS6pd57ruGd3uMflo7hp8yGUoaC/aHORcd0LQfiRI3nIpMw2CWmOND44MWhh2
	tpMNUNd6W3YkSGlrME0t2BYSoyg==
X-Google-Smtp-Source: AGHT+IGvdv9S+ZPKC2b+1/sGgOTG9iTS2T6vjsnAOtbdTlfJ07QbNV7aJ1spSpDEO2AhVu38aZsoYrtgr8gOpWMh13I=
X-Received: by 2002:a05:690c:dd1:b0:6ef:7c8e:eff8 with SMTP id
 00721157ae682-6f19e87161fmr805317b3.39.1733934631965; Wed, 11 Dec 2024
 08:30:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241206203103.1122459-1-alexander.sverdlin@siemens.com>
 <de6039a6-b7e6-4960-afcc-5f0d29fb27a8@ti.com> <20241211162622.GA3242096-robh@kernel.org>
In-Reply-To: <20241211162622.GA3242096-robh@kernel.org>
From: Rob Herring <robh@kernel.org>
Date: Wed, 11 Dec 2024 10:30:20 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLWvs0rRiSA5KM=ACMqrCbQNB+9-5MOCMMfp8jXLSGjbg@mail.gmail.com>
Message-ID: <CAL_JsqLWvs0rRiSA5KM=ACMqrCbQNB+9-5MOCMMfp8jXLSGjbg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: leds: Convert LP8860 into YAML format
To: Andrew Davis <afd@ti.com>
Cc: "A. Sverdlin" <alexander.sverdlin@siemens.com>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org, Lee Jones <lee@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-leds@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 11, 2024 at 10:26=E2=80=AFAM Rob Herring <robh@kernel.org> wrot=
e:
>
> On Mon, Dec 09, 2024 at 08:29:00AM -0600, Andrew Davis wrote:
> > On 12/6/24 2:31 PM, A. Sverdlin wrote:
> > > From: Alexander Sverdlin <alexander.sverdlin@siemens.com>
> > >
> > > Convert Texas Instruments' LP8860 LED driver bindings into YAML forma=
t.
> > >
> > > Signed-off-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
> > > ---
> > > The patch is now separated from the LP8864 series:
> > > https://patchwork.ozlabs.org/project/devicetree-bindings/patch/202412=
06170717.1090206-2-alexander.sverdlin@siemens.com/
> > >
> > >   .../devicetree/bindings/leds/leds-lp8860.txt  | 50 ----------
> > >   .../devicetree/bindings/leds/ti,lp8860.yaml   | 95 ++++++++++++++++=
+++
> > >   2 files changed, 95 insertions(+), 50 deletions(-)
> > >   delete mode 100644 Documentation/devicetree/bindings/leds/leds-lp88=
60.txt
> > >   create mode 100644 Documentation/devicetree/bindings/leds/ti,lp8860=
.yaml
> > >
> > > diff --git a/Documentation/devicetree/bindings/leds/leds-lp8860.txt b=
/Documentation/devicetree/bindings/leds/leds-lp8860.txt
> > > deleted file mode 100644
> > > index 8bb25749a3da3..0000000000000
> > > --- a/Documentation/devicetree/bindings/leds/leds-lp8860.txt
> > > +++ /dev/null
> > > @@ -1,50 +0,0 @@
> > > -* Texas Instruments - lp8860 4-Channel LED Driver
> > > -
> > > -The LP8860-Q1 is an high-efficiency LED
> > > -driver with boost controller. It has 4 high-precision
> > > -current sinks that can be controlled by a PWM input
> > > -signal, a SPI/I2C master, or both.
> > > -
> > > -Required properties:
> > > -   - compatible :
> > > -           "ti,lp8860"
> > > -   - reg : I2C slave address
> > > -   - #address-cells : 1
> > > -   - #size-cells : 0
> > > -
> > > -Optional properties:
> > > -   - enable-gpios : gpio pin to enable (active high)/disable the dev=
ice.
> > > -   - vled-supply : LED supply
> > > -
> > > -Required child properties:
> > > -   - reg : 0
> > > -
> > > -Optional child properties:
> > > -   - function : see Documentation/devicetree/bindings/leds/common.tx=
t
> > > -   - color : see Documentation/devicetree/bindings/leds/common.txt
> > > -   - label : see Documentation/devicetree/bindings/leds/common.txt (=
deprecated)
> > > -   - linux,default-trigger :
> > > -      see Documentation/devicetree/bindings/leds/common.txt
> > > -
> > > -Example:
> > > -
> > > -#include <dt-bindings/leds/common.h>
> > > -
> > > -led-controller@2d {
> > > -   compatible =3D "ti,lp8860";
> > > -   #address-cells =3D <1>;
> > > -   #size-cells =3D <0>;
> > > -   reg =3D <0x2d>;
> > > -   enable-gpios =3D <&gpio1 28 GPIO_ACTIVE_HIGH>;
> > > -   vled-supply =3D <&vbatt>;
> > > -
> > > -   led@0 {
> > > -           reg =3D <0>;
> > > -           function =3D LED_FUNCTION_BACKLIGHT;
> > > -           color =3D <LED_COLOR_ID_WHITE>;
> > > -           linux,default-trigger =3D "backlight";
> > > -   };
> > > -}
> > > -
> > > -For more product information please see the link below:
> > > -https://www.ti.com/product/lp8860-q1
> > > diff --git a/Documentation/devicetree/bindings/leds/ti,lp8860.yaml b/=
Documentation/devicetree/bindings/leds/ti,lp8860.yaml
> > > new file mode 100644
> > > index 0000000000000..62f133006fd0e
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/leds/ti,lp8860.yaml
> > > @@ -0,0 +1,95 @@
> > > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/leds/ti,lp8860.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Texas Instruments - lp8860 4-Channel LED Driver
> > > +
> > > +maintainers:
> > > +  - Andrew Davis <afd@ti.com>
> > > +
> > > +description: |
> > > +  The LP8860-Q1 is an high-efficiency LED driver with boost controll=
er.
> > > +  It has 4 high-precision current sinks that can be controlled by a =
PWM input
> > > +  signal, a SPI/I2C master, or both.
> > > +
> > > +  For more product information please see the link below:
> > > +    https://www.ti.com/product/lp8860-q1
> > > +
> > > +properties:
> > > +  compatible:
> > > +    const: ti,lp8860
> > > +
> > > +  reg:
> > > +    maxItems: 1
> > > +    description: I2C slave address
> > > +
> > > +  "#address-cells":
> > > +    const: 1
> > > +
> > > +  "#size-cells":
> > > +    const: 0
> > > +
> > > +  enable-gpios:
> > > +    maxItems: 1
> > > +    description: GPIO pin to enable (active high) / disable the devi=
ce
> > > +
> > > +  vled-supply:
> > > +    description: LED supply
> > > +
> > > +patternProperties:
> > > +  "^led@[0]$":
> > > +    type: object
> > > +    $ref: common.yaml#
> > > +    unevaluatedProperties: false
> > > +
> > > +    properties:
> > > +      reg:
> > > +        description:
> > > +          Index of the LED.
> > > +        const: 0
> > > +
> > > +      function: true
> > > +      color: true
> > > +      label: true
> > > +      linux,default-trigger: true
> > > +
> > > +    required:
> > > +      - reg
> > > +
> > > +required:
> > > +  - compatible
> > > +  - reg
> > > +  - "#address-cells"
> > > +  - "#size-cells"
> > > +
> > > +additionalProperties: false
> > > +
> > > +examples:
> > > +  - |
> > > +    #include <dt-bindings/gpio/gpio.h>
> > > +    #include <dt-bindings/leds/common.h>
> > > +
> > > +    i2c {
> > > +        #address-cells =3D <1>;
> > > +        #size-cells =3D <0>;
> > > +
> > > +        led-controller@2d {
> > > +            compatible =3D "ti,lp8860";
> > > +            #address-cells =3D <1>;
> > > +            #size-cells =3D <0>;
> > > +            reg =3D <0x2d>;
> > > +            enable-gpios =3D <&gpio1 28 GPIO_ACTIVE_HIGH>;
> > > +            vled-supply =3D <&vbatt>;
> > > +
> > > +            led@0 {
> >
> > So same comment I made in the pre-public review, lets see what the DT
> > folks think:
> >
> > I don't think we want to have the "@0" node naming. It forces us to
> > add the "reg =3D" below, and that then forces us to add the #*-cells ab=
ove.
> > All this to work around not just calling the node "led-0". The driver
> > doesn't care either way, and there are no in-tree users of the old way,
> > so now should be a safe time to fix this while converting the binding.
>
> Just 'led' should be allowed for the single child case.
>
> However, as there are 4 channels, shouldn't the schema be '^led@[0-3]$'?
> If you want to support both that and just 'led', then that can be done
> too.

Well, those are the options if this was a new binding. But it is not,
so perhaps just stick with what you have here. Expanding it to 4 child
nodes would be fine, but changing to 'led' may be an ABI issue (though
we tend to treat 'led' vs. 'led@0' the same).

Rob

