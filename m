Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE10627E275
	for <lists+linux-leds@lfdr.de>; Wed, 30 Sep 2020 09:18:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728377AbgI3HSG (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 30 Sep 2020 03:18:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725440AbgI3HSF (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 30 Sep 2020 03:18:05 -0400
Received: from mail-il1-x141.google.com (mail-il1-x141.google.com [IPv6:2607:f8b0:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F7F3C061755;
        Wed, 30 Sep 2020 00:18:04 -0700 (PDT)
Received: by mail-il1-x141.google.com with SMTP id e5so607974ils.10;
        Wed, 30 Sep 2020 00:18:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=psbw7i3MjIvoS2hf9QWQDtYAJuKq8vzar3Jam1ZH0Hc=;
        b=Bo38yM+jEIXzcswNHY6Gromdckl+k/MJVOjA1MHzuDkQoT9nQBpD0amEjmmzjtnVre
         sXXyFzsFmjOmI4EF68WdzDlaxszOdtuW7OMWv9OdjvZKyeBiPaJQDI/cN51W+owyDrX/
         2DKOi8S1lRxu/wgUVjp8SxE5C0YR8QKPvUeIbPoMiQUlMK0if16AAB5e7S5o3kRitlbk
         Y0DeD1ppuhY9LyV4A3RcfHyM+OfCvE9ZeCtp708rRlBlRft6cCmnnpMMzrRTrD8iwApe
         V1gheB01BXK8/vXN1zqZWpOhKbIKT46gN5o3cEslAAyfzXcV5qh9fk8CRfWnVU9c26nc
         Wukg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=psbw7i3MjIvoS2hf9QWQDtYAJuKq8vzar3Jam1ZH0Hc=;
        b=hU6IQNMe/DoIWiMslcqAEKpAl0pT6tJQQicaTw2Nh5OXkyuX994+PClFhR7smUhSjM
         3dQR/IIC7X8h4U6P2sDJYDE82G7KwK17bhnwToMzMKrMM6dn1fzQWlE1AXvqgafdIgy2
         d0nk8UuWmJf5pMpIiRtApkK5mnzwsCOzpx1tmnc+ECa7iVVotLjWvLQfWnAsFhvUZqqD
         H+kjr0g9enmPcbzE+kzA7yVXnFeZcE320rZZDfC/HtUqoiXb7cFRVhc13Z68I3Zkj3Ff
         SCVY+2HUVKAhttvygBNw2YEdvNGhFeEgqZKmz0oVpQgJooMpgW4BtEUaaFo1eSYlyEEE
         GtEQ==
X-Gm-Message-State: AOAM530uOR4LkCeMwYMJ8HyuvVLYhzPJ+XreGkAzbBLPPk5jRw6qrLit
        p1nKicF2rVsZLFHbMRnkdU4fl8+VXM/+0P5quNKccEs2+xM=
X-Google-Smtp-Source: ABdhPJwqQ8KMmr3JDuN8zpHdfHPUqvbHvZzb65j8t8gjstpZRO17wytTnMH0Il3P/9PcrXkOUf0BUof0KeQ4RlVi+8I=
X-Received: by 2002:a92:1589:: with SMTP id 9mr960077ilv.292.1601450283511;
 Wed, 30 Sep 2020 00:18:03 -0700 (PDT)
MIME-Version: 1.0
References: <1600865452-19649-1-git-send-email-gene.chen.richtek@gmail.com>
 <1600865452-19649-2-git-send-email-gene.chen.richtek@gmail.com> <20200928184423.GA3041988@bogus>
In-Reply-To: <20200928184423.GA3041988@bogus>
From:   Gene Chen <gene.chen.richtek@gmail.com>
Date:   Wed, 30 Sep 2020 23:17:51 +0800
Message-ID: <CAE+NS35qEzfixkBJn17Ookqf8NZDwr+2RmDGGZTThMUHy=Yttg@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: leds: Add bindings for MT6360 LED
To:     Rob Herring <robh@kernel.org>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>,
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

Rob Herring <robh@kernel.org> =E6=96=BC 2020=E5=B9=B49=E6=9C=8829=E6=97=A5 =
=E9=80=B1=E4=BA=8C =E4=B8=8A=E5=8D=882:44=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Wed, Sep 23, 2020 at 08:50:51PM +0800, Gene Chen wrote:
> > From: Gene Chen <gene_chen@richtek.com>
> >
> > Add bindings document for LED support on MT6360 PMIC
> >
> > Signed-off-by: Gene Chen <gene_chen@richtek.com>
> > ---
> >  .../devicetree/bindings/leds/leds-mt6360.yaml      | 107 +++++++++++++=
++++++++
> >  1 file changed, 107 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/leds/leds-mt6360.=
yaml
> >
> > diff --git a/Documentation/devicetree/bindings/leds/leds-mt6360.yaml b/=
Documentation/devicetree/bindings/leds/leds-mt6360.yaml
> > new file mode 100644
> > index 0000000..a356a1f
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/leds/leds-mt6360.yaml
> > @@ -0,0 +1,107 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/leds/leds-mt6360.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: LED driver for MT6360 PMIC from MediaTek Integrated.
>
> Where's the PMIC schema? This file needs to be referenced from it and
> that means it all needs to be one series.
>

Do you means as regulator/max77650-regulator.yaml?

description: |
  This module is part of the MAX77650 MFD device. For more details
  "see Documentation/devicetree/bindings/mfd/max77650.yaml"

> > +
> > +maintainers:
> > +  - Gene Chen <gene_chen@richtek.com>
> > +
> > +description: |
> > +  This module is part of the MT6360 MFD device.
> > +  Add MT6360 LED driver include 2-channel Flash LED with torch/strobe =
mode,
> > +  and 4-channel RGB LED support Register/Flash/Breath Mode
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
> > +  "^led@[0-5]$":
> > +    type: object
> > +    $ref: common.yaml#
> > +    description:
> > +      Properties for a single LED.
> > +
> > +    properties:
> > +      reg:
> > +        description: Index of the LED.
> > +        enum:
> > +          - 0 # LED output INDICATOR1
> > +          - 1 # LED output INDICATOR2
> > +          - 2 # LED output INDICATOR3
> > +          - 3 # LED output INDICATOR4
> > +          - 4 # LED output FLED1
> > +          - 5 # LED output FLED2
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
> > +       default-state =3D "off";
> > +     };
> > +     led@1 {
> > +       reg =3D <1>;
> > +       function =3D LED_FUNCTION_INDICATOR;
> > +       color =3D <LED_COLOR_ID_GREEN>;
> > +       default-state =3D "off";
> > +     };
> > +     led@2 {
> > +       reg =3D <2>;
> > +       function =3D LED_FUNCTION_INDICATOR;
> > +       color =3D <LED_COLOR_ID_BLUE>;
> > +       default-state =3D "off";
> > +     };
> > +     led@3 {
> > +       reg =3D <3>;
> > +       function =3D LED_FUNCTION_INDICATOR;
> > +       color =3D <LED_COLOR_ID_AMBER>;
> > +       default-state =3D "off";
> > +     };
> > +     led@4 {
> > +       reg =3D <4>;
> > +       function =3D LED_FUNCTION_FLASH;
> > +       color =3D <LED_COLOR_ID_WHITE>;
> > +       function-enumerator =3D <1>;
> > +       default-state =3D "off";
> > +       led-max-microamp =3D <200000>;
> > +       flash-max-microamp =3D <500000>;
> > +       flash-max-timeout-us =3D <1024000>;
> > +     };
> > +     led@5 {
> > +       reg =3D <5>;
> > +       function =3D LED_FUNCTION_FLASH;
> > +       color =3D <LED_COLOR_ID_WHITE>;
> > +       function-enumerator =3D <2>;
> > +       default-state =3D "off";
> > +       led-max-microamp =3D <200000>;
> > +       flash-max-microamp =3D <500000>;
> > +       flash-max-timeout-us =3D <1024000>;
> > +     };
> > +   };
> > +...
> > --
> > 2.7.4
> >
