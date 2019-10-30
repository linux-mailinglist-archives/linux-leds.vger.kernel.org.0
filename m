Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2EE0AE9E79
	for <lists+linux-leds@lfdr.de>; Wed, 30 Oct 2019 16:09:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727002AbfJ3PJC (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 30 Oct 2019 11:09:02 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:38729 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726741AbfJ3PJB (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 30 Oct 2019 11:09:01 -0400
Received: by mail-pf1-f196.google.com with SMTP id c13so1786486pfp.5;
        Wed, 30 Oct 2019 08:09:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=9nddN7wfNRlE+v6wcF/T5qBXO6tmY1PFVwgUjMaVKnc=;
        b=P60S1ubTxJ9GiDwTGoXAXk9IypUVRPA2YN3RMytaxX8zah7Lqz3Cn39lZ9gfLHrASS
         avgQVpIt1n3tqM69a8VCFgpigGHD/INz/BI7x2qOYI9qRbbHwkEphEER0Hv1he7+o0O0
         3HvEOvdsgx3ziMZLryNmn/ouxIebP7Cjv6iJbkWXRsiC/egzNj3klgO1nZcfqVtSISdW
         fW5yFPKDwjijudj5Uhrb1PMYbMsPpxNL4Xn/VsfSYHuUtnLQ04U80cjDAwHn1vz2i/Pa
         nP7V1a0pCiavDVPAJz/+GZRuKl/uS8YwMFnbCfnSR1VGInEXr21k0qjUUu3rjE4aRexW
         oAkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=9nddN7wfNRlE+v6wcF/T5qBXO6tmY1PFVwgUjMaVKnc=;
        b=PwpygSoRjO5ICvhY56ES+I81o8+4nUwpqV19IkSm3zxGs5Kuvy4aMEX4AMmV3SAzfv
         TnOvXjoqCgwfFDFcIrlOMVjPnn/CqzORufkEkTOLj9H1O6EAtST4TnLVaarnIyYyVV5b
         ji5oMbgf3+RNogCyAHOHV7pO6bF2ivxGgEtz28bVeeOr4jZ8OFS/5BIljszK4n2s07A0
         Cp/BU68gsb4KvGpD2ejWI+JEbm7rJydsBEN2u7vgRNol1XwjdcxuLq6JJu4Ec7De8T8I
         cJPWnKL7idc+EvTPx8+YS3C1HoBA1e87EU70juvs0g+kNAfcSCzgsMLs9azydEEhIsZb
         SIPA==
X-Gm-Message-State: APjAAAXsyN4B2ZYAAd6z6zRnCf8px/MOFjDuHlCnMwfIilpacMLuUTUO
        DTIuA5/FxOtnDW7gu4FOzJ/R1RumfJxwlqktu+g=
X-Google-Smtp-Source: APXvYqz4rDyED/tjNZGUG+eM3rgQC0HhkJrrk0jnhYwgkm5vnAXZulVCbE9UHEuLJfVlq3LbbyICRwxaLPUXASu/HWA=
X-Received: by 2002:a17:90a:f48f:: with SMTP id bx15mr1515547pjb.115.1572448140595;
 Wed, 30 Oct 2019 08:09:00 -0700 (PDT)
MIME-Version: 1.0
References: <1572185379-21537-1-git-send-email-akinobu.mita@gmail.com>
 <1572185379-21537-2-git-send-email-akinobu.mita@gmail.com> <20078e40-7e58-a6b7-5b23-7c4201057506@ti.com>
In-Reply-To: <20078e40-7e58-a6b7-5b23-7c4201057506@ti.com>
From:   Akinobu Mita <akinobu.mita@gmail.com>
Date:   Thu, 31 Oct 2019 00:08:49 +0900
Message-ID: <CAC5umyi+2VfrGYLoioYVmVJv7_zyrOy5gS-oFtYheWESJSmaOQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: leds: Add leds-meter binding
To:     Dan Murphy <dmurphy@ti.com>
Cc:     Linux LED Subsystem <linux-leds@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND..." <devicetree@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Bjorn Andersson <bjorn@kryo.se>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Jean-Jacques Hiblot <jjhiblot@ti.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

2019=E5=B9=B410=E6=9C=8829=E6=97=A5(=E7=81=AB) 21:06 Dan Murphy <dmurphy@ti=
.com>:
>
> Akinobu
>
> On 10/27/19 9:09 AM, Akinobu Mita wrote:
> > Add DT binding for generic LED level meter which consists of multiple L=
ED
> > devices by different drivers.
> >
> > Cc: Rob Herring <robh+dt@kernel.org>
> > Cc: Mark Rutland <mark.rutland@arm.com>
> > Cc: Bjorn Andersson <bjorn@kryo.se>
> > Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
> > Cc: Jean-Jacques Hiblot <jjhiblot@ti.com>
> > Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> > Cc: Pavel Machek <pavel@ucw.cz>
> > Cc: Dan Murphy <dmurphy@ti.com>
> > Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>
> > ---
> >   .../devicetree/bindings/leds/leds-meter.yaml       | 67 +++++++++++++=
+++++++++
> >   1 file changed, 67 insertions(+)
> >   create mode 100644 Documentation/devicetree/bindings/leds/leds-meter.=
yaml
> >
> > diff --git a/Documentation/devicetree/bindings/leds/leds-meter.yaml b/D=
ocumentation/devicetree/bindings/leds/leds-meter.yaml
> > new file mode 100644
> > index 0000000..b5fcd98
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/leds/leds-meter.yaml
> > @@ -0,0 +1,67 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/leds/leds-meter.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Generic LED level meter
> > +
> > +maintainers:
> > +  - Akinobu Mita <akinobu.mita@gmail.com>
> > +
> > +description:
> > +  Generic LED level meter consists of multiple LED devices by differen=
t drivers.
> > +
> > +properties:
> > +  $nodename:
> > +    pattern: "^meter-leds(@.*)?"
> > +
> > +  compatible:
> > +    const: meter-leds
> > +
> > +  leds:
> > +    allOf:
> > +      - $ref: /schemas/types.yaml#/definitions/phandle-array
> > +    description: List of phandles to LED node that are members of a le=
vel meter.
> > +
> > +  brightness-weights:
> > +    allOf:
> > +      - $ref: /schemas/types.yaml#/definitions/uint32-array
> > +    description: |
> > +      By default, the brightness of the LED level meter is proportiona=
l to the
> > +      number of actual LEDs that are turned on.  We can optionally spe=
cify
> > +      the contribution ratio for each LED within a level meter by this
> > +      property.  The example below shows how to setup an exponential
> > +      relationship between the number of LEDs turned on and the bright=
ness of
> > +      meter-leds.
> > +
> > +required:
> > + - compatible
> > + - leds
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    // Example 1: LED level meter with four LEDs
> > +    meter-leds {
> > +        compatible =3D "meter-leds";
> > +        leds =3D <&led0>, <&led1>, <&led2>, <&led3>;
> > +    };
> > +
> > +    // Example 2: Exponential relationship between the number of LEDs =
turned on
> > +    // and the brightness of meter-leds
> > +    //
> > +    // When the maximum brightness is 255
> > +    // - No LEDs are turned on if brightness =3D=3D 0
> > +    // - led0 is turned on if 0 < brightness <=3D 32
> > +    // - led0 and led1 are turned on if 32 < brightness <=3D 64
> > +    // - led0, led1, and led2 are turned on if 64 < brightness <=3D 12=
8
> > +    // - All LEDs are turned on if 128 < brightness <=3D 255
> > +    meter-leds {
> > +        compatible =3D "meter-leds";
> > +        leds =3D <&led0>, <&led1>, <&led2>, <&led3>;
> > +        brightness-weights =3D <32 32 64 127>;
> > +    };
> > +
> > +...
>
> Fails binding check
>
> Documentation/devicetree/bindings/leds/leds-meter.example.dts:32.20-36.11=
:
> ERROR (duplicate_node_names): /example-0/meter-leds: Duplicate node name
> ERROR: Input tree has errors, aborting (use -f to force output)
> scripts/Makefile.lib:314: recipe for target
> 'Documentation/devicetree/bindings/leds/leds-meter.example.dt.yaml' faile=
d
> make[1]: ***
> [Documentation/devicetree/bindings/leds/leds-meter.example.dt.yaml] Error=
 2
> Makefile:1284: recipe for target 'dt_binding_check' failed
> make: *** [dt_binding_check] Error 2
>

Thanks for reporting.  This is because the two examples have the same
node name, so we need a '- |' line between the two examples.

And I noticed that current implementation doesn't follow the common leds
properties described in Documentation/devicetree/bindings/leds/common.txt.

i.e. when we define two level meters in the system, we need to describe
them like below.

  meter-leds-4seg {
    compatible =3D "meter-leds";
    leds =3D <&led0>, <&led1>, <&led2>, <&led3>;
  };

  meter-leds-2seg {
    compatible =3D "meter-leds";
    leds =3D <&led4>, <&led5>;
  };

But, the description should be like this:

  led-controller@0 {
    compatible =3D "meter-leds";

    meter-leds-4seg {
      leds =3D <&led0>, <&led1>, <&led2>, <&led3>;
    };

    meter-leds-2seg {
      leds =3D <&led4>, <&led5>;
    };
  };
