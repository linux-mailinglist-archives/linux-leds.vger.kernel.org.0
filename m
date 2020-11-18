Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C2C812B7B7E
	for <lists+linux-leds@lfdr.de>; Wed, 18 Nov 2020 11:39:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725781AbgKRKjA (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 18 Nov 2020 05:39:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725613AbgKRKjA (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 18 Nov 2020 05:39:00 -0500
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com [IPv6:2607:f8b0:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A34BC0613D4;
        Wed, 18 Nov 2020 02:39:00 -0800 (PST)
Received: by mail-oi1-x241.google.com with SMTP id m143so1666898oig.7;
        Wed, 18 Nov 2020 02:39:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=gdGRlc/c7mQOKpv4Mq/akqz0zWoZvuK0RDkcZAi09eo=;
        b=IGMZ6pRyo0o/6cCRapb81/ZraXlfnBtIB3IdBumayynNPbA1GI46w0gOBEPXmwjTT3
         CllYSwmZ+W2sHoeRkZd0t6VqtQ365qXMQWLv8lijZB1Q90S9modYQiVHd35BV/OEWyDK
         ET3cyfcnLVSnldIofB2QYzpBByY1cTC6f/xva1VmnbpVcGAnDnF8647z9+EVxMoFSJ+R
         UXHypvuibugqCf+zfZ0/grQgmsdWdBxSeWEqUhKt9vRx6Vz4iiz6ke/rIfJyy4X6JAGs
         Mqg6LTWhW58OC5jRPY88zUUdx/zlrgW8xFn7h1ch465BU18I++HiwOzvMG/MnUaeUGx3
         3kug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=gdGRlc/c7mQOKpv4Mq/akqz0zWoZvuK0RDkcZAi09eo=;
        b=cxxEZp7fZjqZzBlfcpj6N1BEqMRKDQ8/q9jRYgvFKLyMegP9M2sjaMB6UBGsRlfBAI
         dGARQA8IJbpS5eqpTPltWDeBUDbYzKqwim4pQBVUqXPALzlAB7dG8gK5Z9vEpM8Mcq8B
         1jfx0GCReE8U8wCATYkWTyrGL3b4N4pfXJO83v+iz/7hPpuNqLsh/H9FNYlvOH2JXi2c
         vh7BwoAN2plLDNFB0pRlb1UjForm5mf85N1pwF+NT3OuNAqCCO5xltGtPPIehqyY9Lkc
         spcNLaDNnjzXme+Nfts7oVt396uBC8qfm0h0NRp5Ax3nDMGP/GfaLqWWFjQjB8CM4cVr
         CKdw==
X-Gm-Message-State: AOAM530cwcWS0/ytwB7cFVZWAyTK9I2TwebxZVL40D9yzhVBHu3gq+Fi
        MvItgde368uUPBnLV0V+OWNgP3Y5Zg5/RkuNxrxVzYzJ
X-Google-Smtp-Source: ABdhPJy5LiGa3WuRLLpKjNLBb36Dr+6EOB0Jevnf/bcIxHJ5lgkE2uNPHfL3Zf6ryE031Ve66rH7MC0KSg1pCUXvr4Y=
X-Received: by 2002:aca:4783:: with SMTP id u125mr2309892oia.23.1605695939755;
 Wed, 18 Nov 2020 02:38:59 -0800 (PST)
MIME-Version: 1.0
References: <1605610537-18085-1-git-send-email-gene.chen.richtek@gmail.com>
 <1605610537-18085-2-git-send-email-gene.chen.richtek@gmail.com> <ff327630-d919-c26c-30ca-066ad8e826bb@gmail.com>
In-Reply-To: <ff327630-d919-c26c-30ca-066ad8e826bb@gmail.com>
From:   Gene Chen <gene.chen.richtek@gmail.com>
Date:   Wed, 18 Nov 2020 18:38:47 +0800
Message-ID: <CAE+NS345g6gokjpBn0G9uR2azA9p2ZCgujC2cM5pWmrmmwqYjA@mail.gmail.com>
Subject: Re: [PATCH v6 1/2] dt-bindings: leds: Add bindings for MT6360 LED
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc:     Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Dan Murphy <dmurphy@ti.com>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Gene Chen <gene_chen@richtek.com>, Wilma.Wu@mediatek.com,
        shufan_lee@richtek.com, cy_huang@richtek.com,
        benjamin.chao@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Jacek Anaszewski <jacek.anaszewski@gmail.com> =E6=96=BC 2020=E5=B9=B411=E6=
=9C=8818=E6=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8A=E5=8D=886:24=E5=AF=AB=E9=81=
=93=EF=BC=9A
>
> Hi Gene,
>
> Thank you for the patch.
>
> On 11/17/20 11:55 AM, Gene Chen wrote:
> > From: Gene Chen <gene_chen@richtek.com>
> >
> > Add bindings document for LED support on MT6360 PMIC
> >
> > Signed-off-by: Gene Chen <gene_chen@richtek.com>
> > ---
> >   .../devicetree/bindings/leds/leds-mt6360.yaml      | 114 ++++++++++++=
+++++++++
> >   1 file changed, 114 insertions(+)
> >   create mode 100644 Documentation/devicetree/bindings/leds/leds-mt6360=
.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/leds/leds-mt6360.yaml b/=
Documentation/devicetree/bindings/leds/leds-mt6360.yaml
> > new file mode 100644
> > index 0000000..871db4d
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/leds/leds-mt6360.yaml
> > @@ -0,0 +1,114 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/leds/leds-mt6360.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: LED driver for MT6360 PMIC from MediaTek Integrated.
> > +
> > +maintainers:
> > +  - Gene Chen <gene_chen@richtek.com>
> > +
> > +description: |
> > +  This module is part of the MT6360 MFD device.
> > +  see Documentation/devicetree/bindings/mfd/mt6360.yaml
> > +  Add MT6360 LED driver include 2-channel Flash LED with torch/strobe =
mode,
> > +  and 4-channel RGB LED support Register/Flash/Breath Mode
>
> What actually is the Register mode?
>

Register mode is equal to S/W mode.
Red LED indicator ic default is H/W mode. LED enable when charger plug in.

> > +
> > +properties:
> > +  compatible:
> > +    const: mediatek,mt6360-led
> > +
> > +  "#address-cells":
> > +    const: 1
> > +
> > +  "#size-cells":
> > +    const: 0
> > +
> > +patternProperties:
> > +  "^led@[0-6]$":
> > +    type: object
> > +    $ref: common.yaml#
> > +    description:
> > +      Properties for a single LED.
> > +
> > +    properties:
> > +      reg:
> > +        description: Index of the LED.
> > +        enum:
> > +          - 0 # LED output INDICATOR1_RED
> > +          - 1 # LED output INDICATOR1_GREEN
> > +          - 2 # LED output INDICATOR1_BLUE
> > +          - 3 # LED output INDICATOR2_ML
> > +          - 4 # LED output FLED1
> > +          - 5 # LED output FLED2
> > +          - 6 # LED output MULTICOLOR
> > +
> > +unevaluatedProperties: false
> > +
> > +required:
> > +  - compatible
> > +  - "#address-cells"
> > +  - "#size-cells"
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > + - |
> > +   #include <dt-bindings/leds/common.h>
> > +   led-controller {
> > +     compatible =3D "mediatek,mt6360-led";
> > +     #address-cells =3D <1>;
> > +     #size-cells =3D <0>;
> > +
> > +     led@0 {
> > +       reg =3D <0>;
> > +       function =3D LED_FUNCTION_INDICATOR;
> > +       color =3D <LED_COLOR_ID_RED>;
> > +       led-max-microamp =3D <24000>;
> > +     };
> > +     led@3 {
> > +       reg =3D <3>;
> > +       function =3D LED_FUNCTION_INDICATOR;
> > +       color =3D <LED_COLOR_ID_AMBER>;
>
> You should really have here LED_COLOR_ID_MOONLIGHT if this is
> a moonlight LED. You'll need to add it to dt-bindings/leds/common.h.
>
> > +       led-max-microamp =3D <150000>;
> > +     };
> > +     led@4 {
> > +       reg =3D <4>;
> > +       function =3D LED_FUNCTION_FLASH;
> > +       color =3D <LED_COLOR_ID_WHITE>;
> > +       function-enumerator =3D <1>;
> > +       led-max-microamp =3D <200000>;
> > +       flash-max-microamp =3D <500000>;
> > +       flash-max-timeout-us =3D <1024000>;
> > +     };
> > +     led@5 {
> > +       reg =3D <5>;
> > +       function =3D LED_FUNCTION_FLASH;
> > +       color =3D <LED_COLOR_ID_WHITE>;
> > +       function-enumerator =3D <2>;
> > +       led-max-microamp =3D <200000>;
> > +       flash-max-microamp =3D <500000>;
> > +       flash-max-timeout-us =3D <1024000>;
> > +     };
> > +     led@6 {
> > +       reg =3D <6>;
> > +       function =3D LED_FUNCTION_INDICATOR;
> > +       color =3D <LED_COLOR_ID_MULTI>;
> > +       led-max-microamp =3D <24000>;
> > +       #address-cells =3D <1>;
> > +       #size-cells =3D <0>;
> > +
> > +       led@1 {
> > +         reg =3D <1>;
> > +         function =3D LED_FUNCTION_INDICATOR;
> > +         color =3D <LED_COLOR_ID_GREEN>;
> > +       };
> > +       led@2 {
> > +         reg =3D <2>;
> > +         function =3D LED_FUNCTION_INDICATOR;
> > +         color =3D <LED_COLOR_ID_BLUE>;
> > +       };
> > +     };
>
> It is of little avail to have multicolor LED with only two LEDs.
> I propose not to allow such setup - i.e. you should have either
> one multicolor LED comprising three sub-LEDs (regs: 0, 1, 2),
> and with main color property set to LED_COLOR_ID_RGB, or three separate
> LEDs.
>
> Effectively, you should have two separate DT examples here to make it
> clear: one for the case with three LED class devices and one with
> LED multicolor class device.
>

ACK

> > +   };
> > +...
> >
>
> --
> Best regards,
> Jacek Anaszewski
