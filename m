Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E587EE9EE9
	for <lists+linux-leds@lfdr.de>; Wed, 30 Oct 2019 16:27:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727193AbfJ3P17 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 30 Oct 2019 11:27:59 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:42184 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726453AbfJ3P17 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 30 Oct 2019 11:27:59 -0400
Received: by mail-pl1-f194.google.com with SMTP id c16so1134004plz.9;
        Wed, 30 Oct 2019 08:27:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=t/9ltqPrGMOrlhxr07284zt7KpdDNbgtyM/pqI5YH2A=;
        b=Bei8itfYqKCzUuf0RZVeWaCqrSfSLOsLT9kVTZaEWWxrWbfyUPmuw0TdyTDkWT3aty
         6KOPt+fxGJ6i488NHVPjrud0ftzs5ULt0SoHQud1nPEtlbDqlTrte/X2zb+mOgylLMxF
         2qUfAO3PqYzWlOyYsHYxo1kbgl8N9ur3cS2JqX6/YKXX6wh//4JMe54zIc2yda7C0WWv
         kam4/tylQhd3H82PoiZbxN/3MJ5O2HiNo60Wr3hHLmt5giPKoOiw1dE6c0hxgNIZVPT4
         cA4vkaDFeFh6G+R4o0hDrQwEDOg2JrWDLHv+9aBvw+g5WwTW/TFAqTccADSVgCT29Jh6
         fuDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=t/9ltqPrGMOrlhxr07284zt7KpdDNbgtyM/pqI5YH2A=;
        b=LjI5uCpAu0iihG+5SNhkLAIR6t2aW0LvO7qQZzsR8fGlYZ77gbfvWjP6osFFBrsFQP
         ZhA6f88bTxEV5Wvg6CVhrM9mKmB01Xhz+1OJV/bVFgMTKlom56A34vPsePGZkx3BSEj7
         eKrGiOXKY+/8+aVryXVmJZURy6Ic/J3BJpvdBObgvXOTUyIwVWO+0PzheNUjHFaxaI9W
         3zG1RbmZxP/tulX6BPzGJdcNyPFuLiST5ulc4GY8LYWRevUWU2l9xbHG8myvbodEzJ6B
         ahZipdZGbAZ03I+HvzdowlRSdOeitjunysgNKb9h1O3KgAo+e+5C6yoXle6YafDbjNCT
         cYgA==
X-Gm-Message-State: APjAAAUKjyCx3b4b6Hhj7gVQUC/ZMJ/D8wsGmJ4U4reWGTlSp0jlbBxA
        UWgu3AxD9Fb8RLN43R9WX27Lw9IqkNg0NLckXb0=
X-Google-Smtp-Source: APXvYqyyaimEb/VV2kY7rBsoY4DewEqMwsSyJyKPIDvVeNkyWewLX1wxGHvplkMWWM5ol/jvZoSOIMSnVdTUIMcwvjw=
X-Received: by 2002:a17:902:44d:: with SMTP id 71mr577750ple.274.1572449278092;
 Wed, 30 Oct 2019 08:27:58 -0700 (PDT)
MIME-Version: 1.0
References: <1572185379-21537-1-git-send-email-akinobu.mita@gmail.com>
 <1572185379-21537-2-git-send-email-akinobu.mita@gmail.com> <20191030142417.GA8919@bogus>
In-Reply-To: <20191030142417.GA8919@bogus>
From:   Akinobu Mita <akinobu.mita@gmail.com>
Date:   Thu, 31 Oct 2019 00:27:47 +0900
Message-ID: <CAC5umyhZ+w9b7M=gWGDynoMerZ7FiP3+U_RXyQ2P_p7cuLVRgA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: leds: Add leds-meter binding
To:     Rob Herring <robh@kernel.org>
Cc:     Linux LED Subsystem <linux-leds@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND..." <devicetree@vger.kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Bjorn Andersson <bjorn@kryo.se>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Jean-Jacques Hiblot <jjhiblot@ti.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

2019=E5=B9=B410=E6=9C=8830=E6=97=A5(=E6=B0=B4) 23:24 Rob Herring <robh@kern=
el.org>:
>
> On Sun, Oct 27, 2019 at 11:09:38PM +0900, Akinobu Mita wrote:
> > Add DT binding for generic LED level meter which consists of multiple L=
ED
> > devices by different drivers.
>
> Do you have some pointers to actual h/w?

This doesn't require a specific hardware.
If there are more than two LEDs that can be described by devicetree,
it can be an LED level meter by bundling them up with this binding.

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
> >  .../devicetree/bindings/leds/leds-meter.yaml       | 67 ++++++++++++++=
++++++++
> >  1 file changed, 67 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/leds/leds-meter.y=
aml
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
>
> Googling this, the only thing I see is audio level meters though those
> are all just a voltage level input, so it could be any source I guess.
>
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
>
> This seems oddly named if this is a bar graph. Yes, more LEDs on is
> brighter, but it's really a piecewise linear graph you want.

OK.  I'll rewrite the description.

> Each LED could have variable brightness, so you could also ramp the
> brightness for an individual LED.

For now, each LED is set to 0 or max brightness.  Maybe we should
set middle brightness value for an LED on the border line.
