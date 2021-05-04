Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E618D372429
	for <lists+linux-leds@lfdr.de>; Tue,  4 May 2021 03:10:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229634AbhEDBLq (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 3 May 2021 21:11:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229499AbhEDBLp (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 3 May 2021 21:11:45 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54383C061574;
        Mon,  3 May 2021 18:10:50 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id a36so9105055ljq.8;
        Mon, 03 May 2021 18:10:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=D0lgtfaP36ZfPSmKmpzztfbLyB0QiqQgCwN8TsaLltg=;
        b=tuiePi9pQIXkzFP/Sr+4ROFrb/qdBenxHHU/ZnVcX7TNAl5W7xgk3zzYAPK75pjZMu
         CCjhyfQwlf+CZhLMB0HIAZGsLL6ee4yyiUDTTgUUaurWSaRyzEiWPLxy9+Zkhl1DlPXb
         gHQfhcRR/PAL3E8kr6e2cBzuL1yXRdXRev4q/An6jGabUJ/IcscZS+VewUcw6aMfVE8a
         4VS298j8UqbOSIy9XNlytitQhjtcjDvJ4WUwqvH6MDU9K0tryLnK/rXpggBvh43PyRc8
         ngIwg8vdRNez/Q2+eY0+OPFqcDkEen7fEALxoxMkdd9QIFuXsgIYCkwBYp+BefLYNyoV
         3Kyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=D0lgtfaP36ZfPSmKmpzztfbLyB0QiqQgCwN8TsaLltg=;
        b=XmrkXkbd8CdNvBAzDwKlxmZXbRpM8tlJQ68zN7G680//A+FGERk2KvAS82Ggm0Tjb2
         s/SiOrevt3BTnaTiTSs7D0Re2pfBLgpoiXrTyv3g+lTQG5xL0poqj71uIxghx3FG6hUz
         dMAttVtphCRH8NoKGChKGOLArY1ncrfvcP9Lj3QsuhCqcEXTQpXxyekjMULplKcKiINB
         jh/O+S2BC8hze6Gv+5jiO5JqIrGqlDIHKWS84Xq2hG76UGOmuBiR+xDT2YZJiTuRqwFL
         zmqFU2NWXHX8Q04N50PsB/n5C3QXTwuArdTHnSbc+3E3wOFhCiIUyTXshXSJYzF/nq2n
         VWzA==
X-Gm-Message-State: AOAM532G9VOD3XVWdoKrEbeE0TPKb4FMxlaea8d7wztCE8YCv5BZEb8H
        8EypEUiUv61A6QDq1GjX0IQ0Dw0OcG4XOR4MTEo=
X-Google-Smtp-Source: ABdhPJwplQJLbixrjN9+9axcR9bQKfoPeg6i3Y5l5tzT/Nh5XywoIkSxDJumBrQMN0HMJvZnXJEZvzHKvPhqiiBwjwU=
X-Received: by 2002:a2e:bc25:: with SMTP id b37mr15621353ljf.342.1620090648633;
 Mon, 03 May 2021 18:10:48 -0700 (PDT)
MIME-Version: 1.0
References: <1619421491-31494-1-git-send-email-u0084500@gmail.com>
 <1619421491-31494-2-git-send-email-u0084500@gmail.com> <20210430201026.GA3797206@robh.at.kernel.org>
In-Reply-To: <20210430201026.GA3797206@robh.at.kernel.org>
From:   ChiYuan Huang <u0084500@gmail.com>
Date:   Tue, 4 May 2021 09:10:37 +0800
Message-ID: <CADiBU3_SkXL1F5O6G+n=qjokmqLhbUuJNeRPGfWUqVRbcB=acA@mail.gmail.com>
Subject: Re: [RESEND PATCH v6 2/4] backlight: rt4831: Adds DT binding document
 for Richtek RT4831 backlight
To:     Rob Herring <robh@kernel.org>
Cc:     Lee Jones <lee.jones@linaro.org>, lgirdwood@gmail.com,
        Mark Brown <broonie@kernel.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        jingoohan1@gmail.com, b.zolnierkie@samsung.com,
        Pavel Machek <pavel@ucw.cz>, dri-devel@lists.freedesktop.org,
        linux-fbdev@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, cy_huang <cy_huang@richtek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi,

Rob Herring <robh@kernel.org> =E6=96=BC 2021=E5=B9=B45=E6=9C=881=E6=97=A5 =
=E9=80=B1=E5=85=AD =E4=B8=8A=E5=8D=884:10=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Mon, Apr 26, 2021 at 03:18:09PM +0800, cy_huang wrote:
> > From: ChiYuan Huang <cy_huang@richtek.com>
> >
> > Adds DT binding document for Richtek RT4831 backlight.
> >
> > Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
> > Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
> > ---
> > Resend this v6 patch series to loop devicetree reviewers.
> >
> > For next, need to add the below line
> > Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
> > ---
> >  .../leds/backlight/richtek,rt4831-backlight.yaml   | 65 ++++++++++++++=
++++++++
> >  include/dt-bindings/leds/rt4831-backlight.h        | 23 ++++++++
> >  2 files changed, 88 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/leds/backlight/ri=
chtek,rt4831-backlight.yaml
> >  create mode 100644 include/dt-bindings/leds/rt4831-backlight.h
> >
> > diff --git a/Documentation/devicetree/bindings/leds/backlight/richtek,r=
t4831-backlight.yaml b/Documentation/devicetree/bindings/leds/backlight/ric=
htek,rt4831-backlight.yaml
> > new file mode 100644
> > index 00000000..4da6a66
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/leds/backlight/richtek,rt4831-b=
acklight.yaml
> > @@ -0,0 +1,65 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/leds/backlight/richtek,rt4831-backl=
ight.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Richtek RT4831 Backlight
> > +
> > +maintainers:
> > +  - ChiYuan Huang <cy_huang@richtek.com>
> > +
> > +description: |
> > +  RT4831 is a mutifunctional device that can provide power to the LCD =
display
> > +  and LCD backlight.
> > +
> > +  For the LCD backlight, it can provide four channel WLED driving capa=
bility.
> > +  Each channel driving current is up to 30mA
> > +
> > +  Datasheet is available at
> > +  https://www.richtek.com/assets/product_file/RT4831A/DS4831A-05.pdf
> > +
>
> Need to reference common backlight schema:
>
> allOf:
>   - $ref: common.yaml#
>
> > +properties:
> > +  compatible:
> > +    const: richtek,rt4831-backlight
> > +
> > +  default-brightness:
> > +    description: |
> > +      The default brightness that applied to the system on start-up.
> > +    $ref: /schemas/types.yaml#/definitions/uint32
>
> Drop description and $ref. Covered in common.yaml.
>
OK
> > +    minimum: 0
> > +    maximum: 2048
> > +
> > +  max-brightness:
> > +    description: |
> > +      The max brightness for the H/W limit
> > +    $ref: /schemas/types.yaml#/definitions/uint32
>
> And here.
>
OK

The above changes will be merged in next, thanks.
After mfd code patch reviewed, I'll send v7 for all of review comments.
> > +    minimum: 0
> > +    maximum: 2048
> > +
> > +  richtek,pwm-enable:
> > +    description: |
> > +      Specify the backlight dimming following by PWM duty or by SW con=
trol.
> > +    type: boolean
> > +
> > +  richtek,bled-ovp-sel:
> > +    description: |
> > +      Backlight OVP level selection, currently support 17V/21V/25V/29V=
.
> > +    $ref: /schemas/types.yaml#/definitions/uint8
> > +    default: 1
> > +    minimum: 0
> > +    maximum: 3
> > +
> > +  richtek,channel-use:
> > +    description: |
> > +      Backlight LED channel to be used.
> > +      BIT 0/1/2/3 is used to indicate led channel 1/2/3/4 enable or di=
sable.
> > +    $ref: /schemas/types.yaml#/definitions/uint8
> > +    minimum: 1
> > +    maximum: 15
> > +
> > +required:
> > +  - compatible
> > +  - richtek,channel-use
> > +
> > +additionalProperties: false
> > diff --git a/include/dt-bindings/leds/rt4831-backlight.h b/include/dt-b=
indings/leds/rt4831-backlight.h
> > new file mode 100644
> > index 00000000..125c635
> > --- /dev/null
> > +++ b/include/dt-bindings/leds/rt4831-backlight.h
> > @@ -0,0 +1,23 @@
> > +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> > +/*
> > + * This header provides constants for rt4831 backlight bindings.
> > + *
> > + * Copyright (C) 2020, Richtek Technology Corp.
> > + * Author: ChiYuan Huang <cy_huang@richtek.com>
> > + */
> > +
> > +#ifndef _DT_BINDINGS_RT4831_BACKLIGHT_H
> > +#define _DT_BINDINGS_RT4831_BACKLIGHT_H
> > +
> > +#define RT4831_BLOVPLVL_17V  0
> > +#define RT4831_BLOVPLVL_21V  1
> > +#define RT4831_BLOVPLVL_25V  2
> > +#define RT4831_BLOVPLVL_29V  3
> > +
> > +#define RT4831_BLED_CH1EN    (1 << 0)
> > +#define RT4831_BLED_CH2EN    (1 << 1)
> > +#define RT4831_BLED_CH3EN    (1 << 2)
> > +#define RT4831_BLED_CH4EN    (1 << 3)
> > +#define RT4831_BLED_ALLCHEN  ((1 << 4) - 1)
> > +
> > +#endif /* _DT_BINDINGS_RT4831_BACKLIGHT_H */
> > --
> > 2.7.4
> >
