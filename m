Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F150270128
	for <lists+linux-leds@lfdr.de>; Fri, 18 Sep 2020 17:36:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726221AbgIRPgO (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 18 Sep 2020 11:36:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:43076 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726044AbgIRPgO (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Fri, 18 Sep 2020 11:36:14 -0400
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1DBB222208;
        Fri, 18 Sep 2020 15:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600443373;
        bh=ioSr4RUMgwEtF4GQs3qxG3d4Z1XOMNstf8JGn9xlT2Q=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=WbjlpD5LTq9k7Sf1N0QWRfTO8VlU7eKkf+5KC2IneiZfgtGbJBsQPPczIfqBPTOaK
         YeQMal8rvoXk08cPbK2JBR1vo4UZz/cehqqlD+NiLjztk8EjNZmG81oN2MP/gcBrMw
         VeihVvj9Ni4CQYKBajgT0Mbx66VUl4f/om8RxKbI=
Received: by mail-oo1-f48.google.com with SMTP id s17so1522600ooe.6;
        Fri, 18 Sep 2020 08:36:13 -0700 (PDT)
X-Gm-Message-State: AOAM531qvkywFHGt/fziAqi837EXC/dl4bzU7IiwdeAkhzBxp1Yd+CZv
        mL8mfag7Gk10hWIo9zjHiBsF9HUnuhYTJaKMUQ==
X-Google-Smtp-Source: ABdhPJwaNmplyhbL9ZZkhg3gsZ4yWwcfCyiPNhijxsnAzD2PsWil/W/tZCTbumQWjh0J1DxfW0sB1xIJ+ijilzOi29k=
X-Received: by 2002:a4a:d306:: with SMTP id g6mr24544764oos.25.1600443372327;
 Fri, 18 Sep 2020 08:36:12 -0700 (PDT)
MIME-Version: 1.0
References: <20200911154004.28354-1-post@lespocky.de> <20200911154004.28354-4-post@lespocky.de>
 <20200915203735.GB2453633@bogus> <4676987.BC07iakZNo@ada>
In-Reply-To: <4676987.BC07iakZNo@ada>
From:   Rob Herring <robh@kernel.org>
Date:   Fri, 18 Sep 2020 09:35:59 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq++aTK=Us1_z0qh_q_iS8UJHnOLHzgzey3KZMSMSo9jzw@mail.gmail.com>
Message-ID: <CAL_Jsq++aTK=Us1_z0qh_q_iS8UJHnOLHzgzey3KZMSMSo9jzw@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] dt-bindings: leds: Convert pwm to yaml
To:     Alexander Dahl <ada@thorsis.com>
Cc:     Linux LED Subsystem <linux-leds@vger.kernel.org>,
        Alexander Dahl <post@lespocky.de>, devicetree@vger.kernel.org,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Fri, Sep 18, 2020 at 9:12 AM Alexander Dahl <ada@thorsis.com> wrote:
>
> Hello Rob,
>
> thanks for your feedback. I have some questions/remarks on this new yaml
> binding stuff before sending v5 (which will also replace patch 1/3 with a
> different approach btw).
>
> Am Dienstag, 15. September 2020, 22:37:35 CEST schrieb Rob Herring:
> > On Fri, Sep 11, 2020 at 05:40:04PM +0200, Alexander Dahl wrote:
> > > The example was adapted slightly to make use of the 'function' and
> > > 'color' properties.  License discussed with the original author.
> > >
> > > Suggested-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> > > Signed-off-by: Alexander Dahl <post@lespocky.de>
> > > Acked-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> > > Cc: Peter Ujfalusi <peter.ujfalusi@ti.com>
> > > ---
> > >
> > > Notes:
> > >     v3 -> v4:
> > >       * added Cc to original author of the binding
> > >
> > >     v2 -> v3:
> > >       * changed license identifier to recommended one
> > >       * added Acked-by
> > >
> > >     v2:
> > >       * added this patch to series (Suggested-by: Jacek Anaszewski)
> > >
> > >  .../devicetree/bindings/leds/leds-pwm.txt     | 50 -----------
> > >  .../devicetree/bindings/leds/leds-pwm.yaml    | 85 +++++++++++++++++=
++
> > >  2 files changed, 85 insertions(+), 50 deletions(-)
> > >  delete mode 100644 Documentation/devicetree/bindings/leds/leds-pwm.t=
xt
> > >  create mode 100644 Documentation/devicetree/bindings/leds/leds-pwm.y=
aml
> > >
> > > diff --git a/Documentation/devicetree/bindings/leds/leds-pwm.txt
> > > b/Documentation/devicetree/bindings/leds/leds-pwm.txt deleted file mo=
de
> > > 100644
> > > index 6c6583c35f2f..000000000000
> > > --- a/Documentation/devicetree/bindings/leds/leds-pwm.txt
> > > +++ /dev/null
> > > @@ -1,50 +0,0 @@
> > > -LED connected to PWM
> > > -
> > > -Required properties:
> > > -- compatible : should be "pwm-leds".
> > > -
> > > -Each LED is represented as a sub-node of the pwm-leds device.  Each
> > > -node's name represents the name of the corresponding LED.
> > > -
> > > -LED sub-node properties:
> > > -- pwms : PWM property to point to the PWM device (phandle)/port (id)=
 and
> > > to -  specify the period time to be used: <&phandle id period_ns>;
> > > -- pwm-names : (optional) Name to be used by the PWM subsystem for th=
e PWM
> > > device -  For the pwms and pwm-names property please refer to:
> > > -  Documentation/devicetree/bindings/pwm/pwm.txt
> > > -- max-brightness : Maximum brightness possible for the LED
> > > -- active-low : (optional) For PWMs where the LED is wired to supply
> > > -  rather than ground.
> > > -- label :  (optional)
> > > -  see Documentation/devicetree/bindings/leds/common.txt
> > > -- linux,default-trigger :  (optional)
> > > -  see Documentation/devicetree/bindings/leds/common.txt
> > > -
> > > -Example:
> > > -
> > > -twl_pwm: pwm {
> > > -   /* provides two PWMs (id 0, 1 for PWM1 and PWM2) */
> > > -   compatible =3D "ti,twl6030-pwm";
> > > -   #pwm-cells =3D <2>;
> > > -};
> > > -
> > > -twl_pwmled: pwmled {
> > > -   /* provides one PWM (id 0 for Charing indicator LED) */
> > > -   compatible =3D "ti,twl6030-pwmled";
> > > -   #pwm-cells =3D <2>;
> > > -};
> > > -
> > > -pwmleds {
> > > -   compatible =3D "pwm-leds";
> > > -   kpad {
> > > -           label =3D "omap4::keypad";
> > > -           pwms =3D <&twl_pwm 0 7812500>;
> > > -           max-brightness =3D <127>;
> > > -   };
> > > -
> > > -   charging {
> > > -           label =3D "omap4:green:chrg";
> > > -           pwms =3D <&twl_pwmled 0 7812500>;
> > > -           max-brightness =3D <255>;
> > > -   };
> > > -};
> > > diff --git a/Documentation/devicetree/bindings/leds/leds-pwm.yaml
> > > b/Documentation/devicetree/bindings/leds/leds-pwm.yaml new file mode
> > > 100644
> > > index 000000000000..c74867492424
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/leds/leds-pwm.yaml
> > > @@ -0,0 +1,85 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/leds/leds-pwm.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: LEDs connected to PWM
> > > +
> > > +maintainers:
> > > +  - Pavel Machek <pavel@ucw.cz>
> > > +
> > > +description:
> > > +  Each LED is represented as a sub-node of the pwm-leds device.  Eac=
h
> > > +  node's name represents the name of the corresponding LED.
> > > +
> > > +properties:
> > > +  compatible:
> > > +    const: pwm-leds
> > > +
> > > +patternProperties:
> >
> > > +  "^pwm-led-([0-9a-f])$":
> > '^led-([0-9a-f])' would be my preference. A bit more on that below.
>
> Fine for me.
>
> > What about a single child case?
>
> One child or multiple childs.  I found .dts files with one to four sub-no=
des
> of the pwm-leds device in current master.

For the single child case, you need to allow for just 'led' then. So
this I think: '^led(-[0-9a-f]+)?$'

> > > +    type: object
> > > +
> > > +    $ref: common.yaml#
> > > +
> > > +    properties:
> > > +      pwms:
> > > +        description:
> > > +          "PWM property to point to the PWM device (phandle)/port (i=
d)
> > > +          and to specify the period time to be used:
> > > +          <&phandle id period_ns>;"
> >
> > No need to redefine a common property.
>
> Should this look like in 'Documentation/devicetree/bindings/leds/backligh=
t/
> pwm-backlight.yaml' then?

Yes.

>
> > What is needed is how many pwms? I'd assume 1 only: 'maxItems: 1'
>
> Yes, one pwm channel per LED.
>
> > > +
> > > +      pwm-names:
> > > +        description:
> > > +          "Name to be used by the PWM subsystem for the PWM device F=
or
> > > +          the pwms and pwm-names property please refer to:
> > > +          Documentation/devicetree/bindings/pwm/pwm.txt"
> >
> > Same here.
> >
> > > +
> > > +      max-brightness:
> > > +        description:
> > > +          Maximum brightness possible for the LED
> >
> > Needs a type $ref.
>
> fwnode_property_read_u32() is used to read this.

$ref: /schemas/types.yaml#/definitions/uint32

>
> >
> > > +
> > > +      active-low:
> > > +        description:
> > > +          For PWMs where the LED is wired to supply rather than grou=
nd.
> >
> > type: boolean
> >
> > > +
> > > +    required:
> > > +      - pwms
> > > +      - max-brightness
> >
> > additionalProperties: false
> >
> > That will cause errors if child node names were not consistent (no one
> > checked, so they won't be). We could just allow anything, but I prefer
> > to move things to be consistent yet try to capture any existing pattern=
.
>
> Child node names follow no scheme at all currently as far as I could see,
> examples from real current .dts files:
>
>   panel, led-red, blueled, kpad, front, green, pwm_blue, ds1, network_red=
,
> alarm-brightness, pmu_stat, overo, heartbeat, power, =E2=80=A6

So you can do this to allow any child node name:

additonalProperties:
  type: object
  $ref: common.yaml#

  ... everything you have under pwm-led-*

Or how gpio-keys.yaml was done also works.

Rob
