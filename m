Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D25727E648
	for <lists+linux-leds@lfdr.de>; Wed, 30 Sep 2020 12:12:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728367AbgI3KMz (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 30 Sep 2020 06:12:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725779AbgI3KMy (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 30 Sep 2020 06:12:54 -0400
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com [IPv6:2607:f8b0:4864:20::d44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DBCDC061755;
        Wed, 30 Sep 2020 03:12:54 -0700 (PDT)
Received: by mail-io1-xd44.google.com with SMTP id z25so1163261iol.10;
        Wed, 30 Sep 2020 03:12:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=/f1OTAWLOFyQByyjBp7gKJkQqlf7y1fR2nEKKjF+R7k=;
        b=Gebb9eMcJ5yfFkylfLya/CB5BMiRp5tp3l3JfanfE2Q5D3UuPDShghq8AzqYauqHiY
         lvCgPqczUI1NuPx6anNfKsaWsFyBC/pNXy9AwZmYhv8cLvAxvmUlTELJX909iZCe7riV
         HHVvV+ZcDn6rGzB5K9NxiPtNIwsYTh5XTZIF+TLzvXmbQBSmD/4Krgqsc2/mtdhA/Q2j
         GcHtLIgtzqEein0lGF3TP8bE+VmZTCZ9xxNieMfyN2TThaz0m7GcXximmRfjkZ4yogOh
         2IpL/XlrtKwXdZR9WB1EKjYIIgGq6eeRC1NrRvMwi0K9cDWf3vQvyJhk9zkhVeyyrusP
         Gqmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=/f1OTAWLOFyQByyjBp7gKJkQqlf7y1fR2nEKKjF+R7k=;
        b=ZJSBuNqe8xqhrOsLBMsX0OR7dQLtF0/HdZz51KnwvBlsBFw1M3F/L0nRpv2aypXtoP
         yWMq1+qvnyKjtyv6Uvu7CRkYVLQx5hLUlcpLFpBr4TFBIFUXRgUp1d4sSqOXbnFz7Gdd
         4lF+WqOfKAo6+Ip1so8rGcaSaXLTnJWVkjnH4PmV7lHF6/34ig4Ws+OC783ULcgUDC+G
         IGSEo21ZIaPU9Lc6hLL5C54zowDaSLYjbS5V95pIkUyuQa0ZUI/tBdG2cllkrbOZjW4d
         8h1LwcQsKD/B0rwp0/pLF3c0AIbqiKRAQRzcVVSg7Wtlb4dGzyLSEWEQWqaKkIG17Azh
         E3OA==
X-Gm-Message-State: AOAM531b1yA0RtSuUKWBNTvmn7f72X45VThzjTd3DCsvgn/T3N7CSlaw
        PEo2ejL/9t3Cvsu0nPLn3Tye7jfWPyJ927Y+Xn2JxGuZqi0=
X-Google-Smtp-Source: ABdhPJzlpDbnNL0UhpMZoIhJBBA7VIiOiuC/U8CgBNOJi1IM8RoCYebPmYNG9DDqVJacuMaeZPty304jCUrO7dWNP7c=
X-Received: by 2002:a05:6638:218d:: with SMTP id s13mr1298088jaj.125.1601460773363;
 Wed, 30 Sep 2020 03:12:53 -0700 (PDT)
MIME-Version: 1.0
References: <1600865452-19649-1-git-send-email-gene.chen.richtek@gmail.com>
 <1600865452-19649-2-git-send-email-gene.chen.richtek@gmail.com>
 <20200928184423.GA3041988@bogus> <CAE+NS35qEzfixkBJn17Ookqf8NZDwr+2RmDGGZTThMUHy=Yttg@mail.gmail.com>
In-Reply-To: <CAE+NS35qEzfixkBJn17Ookqf8NZDwr+2RmDGGZTThMUHy=Yttg@mail.gmail.com>
From:   Gene Chen <gene.chen.richtek@gmail.com>
Date:   Thu, 1 Oct 2020 18:12:39 +0800
Message-ID: <CAE+NS36tG3H=MKU1Ewo=9m36j0D6G6GhQDGDkHuGkRn7Wjrqjg@mail.gmail.com>
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

Gene Chen <gene.chen.richtek@gmail.com> =E6=96=BC 2020=E5=B9=B49=E6=9C=8830=
=E6=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=8811:17=E5=AF=AB=E9=81=93=EF=
=BC=9A
>
> Rob Herring <robh@kernel.org> =E6=96=BC 2020=E5=B9=B49=E6=9C=8829=E6=97=
=A5 =E9=80=B1=E4=BA=8C =E4=B8=8A=E5=8D=882:44=E5=AF=AB=E9=81=93=EF=BC=9A
> >
> > On Wed, Sep 23, 2020 at 08:50:51PM +0800, Gene Chen wrote:
> > > From: Gene Chen <gene_chen@richtek.com>
> > >
> > > Add bindings document for LED support on MT6360 PMIC
> > >
> > > Signed-off-by: Gene Chen <gene_chen@richtek.com>
> > > ---
> > >  .../devicetree/bindings/leds/leds-mt6360.yaml      | 107 +++++++++++=
++++++++++
> > >  1 file changed, 107 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/leds/leds-mt636=
0.yaml
> > >
> > > diff --git a/Documentation/devicetree/bindings/leds/leds-mt6360.yaml =
b/Documentation/devicetree/bindings/leds/leds-mt6360.yaml
> > > new file mode 100644
> > > index 0000000..a356a1f
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/leds/leds-mt6360.yaml
> > > @@ -0,0 +1,107 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/leds/leds-mt6360.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: LED driver for MT6360 PMIC from MediaTek Integrated.
> >
> > Where's the PMIC schema? This file needs to be referenced from it and
> > that means it all needs to be one series.
> >
>
> Do you means as regulator/max77650-regulator.yaml?
>
> description: |
>   This module is part of the MAX77650 MFD device. For more details
>   "see Documentation/devicetree/bindings/mfd/max77650.yaml"
>

According to jacek suggestion, I merge fled0~2 to one RGB multicolor
device as below,
     led@0 {
       reg =3D <0>;
       function =3D LED_FUNCTION_INDICATOR;
       color =3D <LED_COLOR_ID_RGB>;
       led-max-microamp =3D <24000>;
     };

But I see make dt_binding_check error,
/media/gene_chen/WD/upstream/linux/Documentation/devicetree/bindings/leds/l=
eds-mt6360.example.dt.yaml:
led-controller: led@0:color:0:0: 9 is greater than the maximum of 8

Maybe the maximum color need set from 8 to 9, which define
LED_COLOR_ID_RGB in include/dt-bindings/leds/common.h
  color:
    description:
      Color of the LED. Use one of the LED_COLOR_ID_* prefixed definitions =
from
      the header include/dt-bindings/leds/common.h. If there is no
matching
      LED_COLOR_ID available, add a new one.
    $ref: /schemas/types.yaml#definitions/uint32
    minimum: 0
    maximum: 9

> > > +
> > > +maintainers:
> > > +  - Gene Chen <gene_chen@richtek.com>
> > > +
> > > +description: |
> > > +  This module is part of the MT6360 MFD device.
> > > +  Add MT6360 LED driver include 2-channel Flash LED with torch/strob=
e mode,
> > > +  and 4-channel RGB LED support Register/Flash/Breath Mode
> > > +
> > > +properties:
> > > +  compatible:
> > > +    const: mediatek,mt6360-led
> > > +
> > > +  "#address-cells":
> > > +    const: 1
> > > +
> > > +  "#size-cells":
> > > +    const: 0
> > > +
> > > +patternProperties:
> > > +  "^led@[0-5]$":
> > > +    type: object
> > > +    $ref: common.yaml#
> > > +    description:
> > > +      Properties for a single LED.
> > > +
> > > +    properties:
> > > +      reg:
> > > +        description: Index of the LED.
> > > +        enum:
> > > +          - 0 # LED output INDICATOR1
> > > +          - 1 # LED output INDICATOR2
> > > +          - 2 # LED output INDICATOR3
> > > +          - 3 # LED output INDICATOR4
> > > +          - 4 # LED output FLED1
> > > +          - 5 # LED output FLED2
> > > +
> > > +unevaluatedProperties: false
> > > +
> > > +required:
> > > +  - compatible
> > > +  - "#address-cells"
> > > +  - "#size-cells"
> > > +
> > > +additionalProperties: false
> > > +
> > > +examples:
> > > + - |
> > > +   #include <dt-bindings/leds/common.h>
> > > +   led-controller {
> > > +     compatible =3D "mediatek,mt6360-led";
> > > +     #address-cells =3D <1>;
> > > +     #size-cells =3D <0>;
> > > +
> > > +     led@0 {
> > > +       reg =3D <0>;
> > > +       function =3D LED_FUNCTION_INDICATOR;
> > > +       color =3D <LED_COLOR_ID_RED>;
> > > +       default-state =3D "off";
> > > +     };
> > > +     led@1 {
> > > +       reg =3D <1>;
> > > +       function =3D LED_FUNCTION_INDICATOR;
> > > +       color =3D <LED_COLOR_ID_GREEN>;
> > > +       default-state =3D "off";
> > > +     };
> > > +     led@2 {
> > > +       reg =3D <2>;
> > > +       function =3D LED_FUNCTION_INDICATOR;
> > > +       color =3D <LED_COLOR_ID_BLUE>;
> > > +       default-state =3D "off";
> > > +     };
> > > +     led@3 {
> > > +       reg =3D <3>;
> > > +       function =3D LED_FUNCTION_INDICATOR;
> > > +       color =3D <LED_COLOR_ID_AMBER>;
> > > +       default-state =3D "off";
> > > +     };
> > > +     led@4 {
> > > +       reg =3D <4>;
> > > +       function =3D LED_FUNCTION_FLASH;
> > > +       color =3D <LED_COLOR_ID_WHITE>;
> > > +       function-enumerator =3D <1>;
> > > +       default-state =3D "off";
> > > +       led-max-microamp =3D <200000>;
> > > +       flash-max-microamp =3D <500000>;
> > > +       flash-max-timeout-us =3D <1024000>;
> > > +     };
> > > +     led@5 {
> > > +       reg =3D <5>;
> > > +       function =3D LED_FUNCTION_FLASH;
> > > +       color =3D <LED_COLOR_ID_WHITE>;
> > > +       function-enumerator =3D <2>;
> > > +       default-state =3D "off";
> > > +       led-max-microamp =3D <200000>;
> > > +       flash-max-microamp =3D <500000>;
> > > +       flash-max-timeout-us =3D <1024000>;
> > > +     };
> > > +   };
> > > +...
> > > --
> > > 2.7.4
> > >
