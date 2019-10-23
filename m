Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5C556E1E7A
	for <lists+linux-leds@lfdr.de>; Wed, 23 Oct 2019 16:45:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392318AbfJWOpe (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 23 Oct 2019 10:45:34 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:33078 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390038AbfJWOpe (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 23 Oct 2019 10:45:34 -0400
Received: by mail-pl1-f195.google.com with SMTP id y8so1685630plk.0;
        Wed, 23 Oct 2019 07:45:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=UfkRvTHI0TSo8+R107qzTfBUu8VqMHSbtU9EyUrYSU0=;
        b=joIZ9tzVLAYTKuiLxokdZttIrssP4jwkkfFd/xB45y2sDx5bkrc30Pt3K1AZAfio4I
         wSutl2X7g7aqA3qUwAnvko4pDpu302OOoVsXZV8IvapHvmUcHx4ahWsWXWH0wvTPXNUF
         o9gUoHfMigDP3ReX9uhhTvP1ypreqwYfE/BjUnWlePFAFVCDPyfZVrbIUO2sEtjVa8qI
         uU2GfeL2IB931GpvH1mQ6lEfCGofoqOIklXxRiujMqX6PmF/SUMP2p2Kq1t87TU4xTtI
         AE8NOI9qdfCxYTqLl8D+Z8/cqTGmL+4m6fpTHiNDZGtMrkwN0WwhLTio2KjZzS3Fj1VA
         82Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=UfkRvTHI0TSo8+R107qzTfBUu8VqMHSbtU9EyUrYSU0=;
        b=UF5fnhJYSt6C+HI9HyX4ffT/l6QOc/WbEiuNZRswpRQafuEpqxtraPjEuY4wlagg2V
         pqrc4wi/Mv6tynJ4b7DfJ9LM09Kt7Bp8ScPGYtHUXT10PMUxgk+58bNFZ/zx8tIZwIJ+
         d+k/jGAI7MOc09c34JFMhIBVJw6Ul9QPGRftdNW6jlbeiN+TzqlcopXt44xCi+mw1t1B
         lNsyFE9vt/rIovYYSTPmMx7CiIh+/4RgA4+fG3fnU3ptcakq1MkG0/CIgr9leMXcF59T
         7Katsx0cUWXh2wLpZgACFiuCMSe6XxEgFYk8BoDUH3jDv43zH+YXGH/1TYUuUbVyJRwC
         eKGA==
X-Gm-Message-State: APjAAAUKv1R9mBOY7xwBiGwlS72mgIWFhUTRirjvMLL+my2W+ll4xwR6
        oQVk3dAxtAatO47vV/aTLblgGccyMg90QKQegMw=
X-Google-Smtp-Source: APXvYqzE51JWBiCAWVsJuS9s05A3RmWCs7VMEuyNVjtdUTRivBrpN5FJhh7XBhl3+fgy2ziv6xrtvArXc+CYDR30HbA=
X-Received: by 2002:a17:902:6b8a:: with SMTP id p10mr10292296plk.192.1571841933501;
 Wed, 23 Oct 2019 07:45:33 -0700 (PDT)
MIME-Version: 1.0
References: <1571756812-19005-1-git-send-email-akinobu.mita@gmail.com>
 <1571756812-19005-3-git-send-email-akinobu.mita@gmail.com> <0f58e263-7e56-b4f7-51c1-a37e107a1afe@ti.com>
In-Reply-To: <0f58e263-7e56-b4f7-51c1-a37e107a1afe@ti.com>
From:   Akinobu Mita <akinobu.mita@gmail.com>
Date:   Wed, 23 Oct 2019 23:45:21 +0900
Message-ID: <CAC5umyjr+NNxi=LDf-DCKL0yUEHYWQ5D_on1SP_9V+P56mY3EA@mail.gmail.com>
Subject: Re: [PATCH 2/2] leds: meter: add leds-meter binding
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

2019=E5=B9=B410=E6=9C=8823=E6=97=A5(=E6=B0=B4) 21:35 Dan Murphy <dmurphy@ti=
.com>:
>
> Akinobu
>
> On 10/22/19 10:06 AM, Akinobu Mita wrote:
> > Add DT binding for leds-meter.
>
> $subject should be
>
>   dt-bindings: leds: Add leds-meter binding
>
> And this patch should be first in the series

OK.

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
> >   .../devicetree/bindings/leds/leds-meter.yaml       | 42 +++++++++++++=
+++++++++
> >   1 file changed, 42 insertions(+)
> >   create mode 100644 Documentation/devicetree/bindings/leds/leds-meter.=
yaml
> >
> > diff --git a/Documentation/devicetree/bindings/leds/leds-meter.yaml b/D=
ocumentation/devicetree/bindings/leds/leds-meter.yaml
> > new file mode 100644
> > index 0000000..d5dfa261
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/leds/leds-meter.yaml
> > @@ -0,0 +1,42 @@
> > +# SPDX-License-Identifier: GPL-2.0
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
> > +  compatible:
> > +    const: meter-leds
> > +
> > +  leds:
>
> This seems a bit generic for the property name

I have no problem with changing to more descriptive name like "meter-leds".
But this property is parsed by of_led_get(), so we need to change of_led_ge=
t()
to take additional 'prefix' parameter.  I would like to hear led-backlight
authors' opinion.

> > +    $ref: /schemas/types.yaml#/definitions/phandle-array
> > +    minItems: 1
> > +    description: List of phandles to LED node that are members of a le=
vel meter.
> > +
> > +  brightness-weights:
> > +    $ref: /schemas/types.yaml#/definitions/uint32-array
> > +    minItems: 1
> > +    description: Each integer represents a contribution ratio within a=
 level
> > +      meter.
>
> This description is a bit vague I would not be sure what I would set
> this to.

OK.  I'll add some description and examples like I wrote in the commit
message for patch 1/2.
