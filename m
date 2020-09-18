Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE417270095
	for <lists+linux-leds@lfdr.de>; Fri, 18 Sep 2020 17:12:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726121AbgIRPMM (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 18 Sep 2020 11:12:12 -0400
Received: from mail.thorsis.com ([92.198.35.195]:47283 "EHLO mail.thorsis.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725941AbgIRPMM (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Fri, 18 Sep 2020 11:12:12 -0400
X-Greylist: delayed 531 seconds by postgrey-1.27 at vger.kernel.org; Fri, 18 Sep 2020 11:12:10 EDT
Received: from localhost (localhost [127.0.0.1])
        by mail.thorsis.com (Postfix) with ESMTP id 248323F0C;
        Fri, 18 Sep 2020 17:03:18 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.thorsis.com
Received: from mail.thorsis.com ([127.0.0.1])
        by localhost (mail.thorsis.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 0JmBXd8FvHA9; Fri, 18 Sep 2020 17:03:18 +0200 (CEST)
Received: by mail.thorsis.com (Postfix, from userid 109)
        id C89E64904; Fri, 18 Sep 2020 17:03:17 +0200 (CEST)
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,NO_RECEIVED,
        NO_RELAYS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
        version=3.4.2
From:   Alexander Dahl <ada@thorsis.com>
To:     linux-leds@vger.kernel.org
Cc:     Rob Herring <robh@kernel.org>, Alexander Dahl <post@lespocky.de>,
        devicetree@vger.kernel.org,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        linux-kernel@vger.kernel.org,
        Peter Ujfalusi <peter.ujfalusi@ti.com>
Subject: Re: [PATCH v4 3/3] dt-bindings: leds: Convert pwm to yaml
Date:   Fri, 18 Sep 2020 17:03:08 +0200
Message-ID: <4676987.BC07iakZNo@ada>
In-Reply-To: <20200915203735.GB2453633@bogus>
References: <20200911154004.28354-1-post@lespocky.de> <20200911154004.28354-4-post@lespocky.de> <20200915203735.GB2453633@bogus>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hello Rob,

thanks for your feedback. I have some questions/remarks on this new yaml=20
binding stuff before sending v5 (which will also replace patch 1/3 with a=20
different approach btw).

Am Dienstag, 15. September 2020, 22:37:35 CEST schrieb Rob Herring:
> On Fri, Sep 11, 2020 at 05:40:04PM +0200, Alexander Dahl wrote:
> > The example was adapted slightly to make use of the 'function' and
> > 'color' properties.  License discussed with the original author.
> >=20
> > Suggested-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> > Signed-off-by: Alexander Dahl <post@lespocky.de>
> > Acked-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> > Cc: Peter Ujfalusi <peter.ujfalusi@ti.com>
> > ---
> >=20
> > Notes:
> >     v3 -> v4:
> >       * added Cc to original author of the binding
> >    =20
> >     v2 -> v3:
> >       * changed license identifier to recommended one
> >       * added Acked-by
> >    =20
> >     v2:
> >       * added this patch to series (Suggested-by: Jacek Anaszewski)
> > =20
> >  .../devicetree/bindings/leds/leds-pwm.txt     | 50 -----------
> >  .../devicetree/bindings/leds/leds-pwm.yaml    | 85 +++++++++++++++++++
> >  2 files changed, 85 insertions(+), 50 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/leds/leds-pwm.txt
> >  create mode 100644 Documentation/devicetree/bindings/leds/leds-pwm.yaml
> >=20
> > diff --git a/Documentation/devicetree/bindings/leds/leds-pwm.txt
> > b/Documentation/devicetree/bindings/leds/leds-pwm.txt deleted file mode
> > 100644
> > index 6c6583c35f2f..000000000000
> > --- a/Documentation/devicetree/bindings/leds/leds-pwm.txt
> > +++ /dev/null
> > @@ -1,50 +0,0 @@
> > -LED connected to PWM
> > -
> > -Required properties:
> > -- compatible : should be "pwm-leds".
> > -
> > -Each LED is represented as a sub-node of the pwm-leds device.  Each
> > -node's name represents the name of the corresponding LED.
> > -
> > -LED sub-node properties:
> > -- pwms : PWM property to point to the PWM device (phandle)/port (id) a=
nd
> > to -  specify the period time to be used: <&phandle id period_ns>;
> > -- pwm-names : (optional) Name to be used by the PWM subsystem for the =
PWM
> > device -  For the pwms and pwm-names property please refer to:
> > -  Documentation/devicetree/bindings/pwm/pwm.txt
> > -- max-brightness : Maximum brightness possible for the LED
> > -- active-low : (optional) For PWMs where the LED is wired to supply
> > -  rather than ground.
> > -- label :  (optional)
> > -  see Documentation/devicetree/bindings/leds/common.txt
> > -- linux,default-trigger :  (optional)
> > -  see Documentation/devicetree/bindings/leds/common.txt
> > -
> > -Example:
> > -
> > -twl_pwm: pwm {
> > -	/* provides two PWMs (id 0, 1 for PWM1 and PWM2) */
> > -	compatible =3D "ti,twl6030-pwm";
> > -	#pwm-cells =3D <2>;
> > -};
> > -
> > -twl_pwmled: pwmled {
> > -	/* provides one PWM (id 0 for Charing indicator LED) */
> > -	compatible =3D "ti,twl6030-pwmled";
> > -	#pwm-cells =3D <2>;
> > -};
> > -
> > -pwmleds {
> > -	compatible =3D "pwm-leds";
> > -	kpad {
> > -		label =3D "omap4::keypad";
> > -		pwms =3D <&twl_pwm 0 7812500>;
> > -		max-brightness =3D <127>;
> > -	};
> > -
> > -	charging {
> > -		label =3D "omap4:green:chrg";
> > -		pwms =3D <&twl_pwmled 0 7812500>;
> > -		max-brightness =3D <255>;
> > -	};
> > -};
> > diff --git a/Documentation/devicetree/bindings/leds/leds-pwm.yaml
> > b/Documentation/devicetree/bindings/leds/leds-pwm.yaml new file mode
> > 100644
> > index 000000000000..c74867492424
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/leds/leds-pwm.yaml
> > @@ -0,0 +1,85 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/leds/leds-pwm.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: LEDs connected to PWM
> > +
> > +maintainers:
> > +  - Pavel Machek <pavel@ucw.cz>
> > +
> > +description:
> > +  Each LED is represented as a sub-node of the pwm-leds device.  Each
> > +  node's name represents the name of the corresponding LED.
> > +
> > +properties:
> > +  compatible:
> > +    const: pwm-leds
> > +
> > +patternProperties:
>=20
> > +  "^pwm-led-([0-9a-f])$":
> '^led-([0-9a-f])' would be my preference. A bit more on that below.

=46ine for me.

> What about a single child case?

One child or multiple childs.  I found .dts files with one to four sub-node=
s=20
of the pwm-leds device in current master.

> > +    type: object
> > +
> > +    $ref: common.yaml#
> > +
> > +    properties:
> > +      pwms:
> > +        description:
> > +          "PWM property to point to the PWM device (phandle)/port (id)
> > +          and to specify the period time to be used:
> > +          <&phandle id period_ns>;"
>=20
> No need to redefine a common property.

Should this look like in 'Documentation/devicetree/bindings/leds/backlight/
pwm-backlight.yaml' then?

> What is needed is how many pwms? I'd assume 1 only: 'maxItems: 1'

Yes, one pwm channel per LED.

> > +
> > +      pwm-names:
> > +        description:
> > +          "Name to be used by the PWM subsystem for the PWM device For
> > +          the pwms and pwm-names property please refer to:
> > +          Documentation/devicetree/bindings/pwm/pwm.txt"
>=20
> Same here.
>=20
> > +
> > +      max-brightness:
> > +        description:
> > +          Maximum brightness possible for the LED
>=20
> Needs a type $ref.

fwnode_property_read_u32() is used to read this.

>=20
> > +
> > +      active-low:
> > +        description:
> > +          For PWMs where the LED is wired to supply rather than ground.
>=20
> type: boolean
>=20
> > +
> > +    required:
> > +      - pwms
> > +      - max-brightness
>=20
> additionalProperties: false
>=20
> That will cause errors if child node names were not consistent (no one
> checked, so they won't be). We could just allow anything, but I prefer
> to move things to be consistent yet try to capture any existing pattern.

Child node names follow no scheme at all currently as far as I could see,=20
examples from real current .dts files:

  panel, led-red, blueled, kpad, front, green, pwm_blue, ds1, network_red,=
=20
alarm-brightness, pmu_stat, overo, heartbeat, power, =E2=80=A6

Greets
Alex

>=20
> > +
> > +examples:
> > +  - |
> > +
> > +    #include <dt-bindings/leds/common.h>
> > +
> > +    twl_pwm: pwm {
> > +        /* provides two PWMs (id 0, 1 for PWM1 and PWM2) */
> > +        compatible =3D "ti,twl6030-pwm";
> > +        #pwm-cells =3D <2>;
> > +    };
> > +
> > +    twl_pwmled: pwmled {
> > +        /* provides one PWM (id 0 for Charing indicator LED) */
> > +        compatible =3D "ti,twl6030-pwmled";
> > +        #pwm-cells =3D <2>;
> > +    };
> > +
> > +    pwm_leds {
> > +        compatible =3D "pwm-leds";
> > +
> > +        pwm-led-1 {
> > +            label =3D "omap4::keypad";
> > +            pwms =3D <&twl_pwm 0 7812500>;
> > +            max-brightness =3D <127>;
> > +        };
> > +
> > +        pwm-led-2 {
> > +            color =3D <LED_COLOR_ID_GREEN>;
> > +            function =3D LED_FUNCTION_CHARGING;
> > +            pwms =3D <&twl_pwmled 0 7812500>;
> > +            max-brightness =3D <255>;
> > +        };
> > +    };
> > +
> > +...




