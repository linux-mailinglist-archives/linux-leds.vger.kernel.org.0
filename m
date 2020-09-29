Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F27FF27BE35
	for <lists+linux-leds@lfdr.de>; Tue, 29 Sep 2020 09:39:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727622AbgI2HjL (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 29 Sep 2020 03:39:11 -0400
Received: from mail.thorsis.com ([92.198.35.195]:50670 "EHLO mail.thorsis.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725787AbgI2HjL (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Tue, 29 Sep 2020 03:39:11 -0400
Received: from localhost (localhost [127.0.0.1])
        by mail.thorsis.com (Postfix) with ESMTP id CA69E1B36;
        Tue, 29 Sep 2020 09:39:09 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.thorsis.com
Received: from mail.thorsis.com ([127.0.0.1])
        by localhost (mail.thorsis.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id VnJuFt-eA-Tp; Tue, 29 Sep 2020 09:39:09 +0200 (CEST)
Received: by mail.thorsis.com (Postfix, from userid 109)
        id 08DFF36B5; Tue, 29 Sep 2020 09:39:07 +0200 (CEST)
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,NO_RECEIVED,
        NO_RELAYS autolearn=unavailable autolearn_force=no version=3.4.2
From:   Alexander Dahl <ada@thorsis.com>
To:     Rob Herring <robh@kernel.org>
Cc:     Alexander Dahl <post@lespocky.de>, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        linux-kernel@vger.kernel.org,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Marek =?ISO-8859-1?Q?Beh=FAn?= <marek.behun@nic.cz>
Subject: Re: [PATCH v5 3/3] dt-bindings: leds: Convert pwm to yaml
Date:   Tue, 29 Sep 2020 09:39:01 +0200
Message-ID: <23920329.U7EUVLB22C@ada>
In-Reply-To: <20200922155747.GA2734659@bogus>
References: <20200919053145.7564-1-post@lespocky.de> <20200919053145.7564-4-post@lespocky.de> <20200922155747.GA2734659@bogus>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hei hei,

Am Dienstag, 22. September 2020, 17:57:47 CEST schrieb Rob Herring:
> Use generic node names:
>=20
> led-controller {
>=20
> > +        compatible =3D "pwm-leds";
> > +
> > +        led-1 {
> > +            label =3D "omap4::keypad";
> > +            pwms =3D <&twl_pwm 0 7812500>;
> > +            max-brightness =3D <127>;
> > +        };
> > +
> > +        led-2 {
> > +            color =3D <LED_COLOR_ID_GREEN>;
> > +            function =3D LED_FUNCTION_CHARGING;
> > +            pwms =3D <&twl_pwmled 0 7812500>;
> > +            max-brightness =3D <255>;
> > +        };
> > +    };
> > +
> > +...

This is clear for the "one led-controller" case.  However, when trying to f=
ix=20
those node names in existing .dts files, I wondered how those should be nam=
ed=20
for multiple, different led-controllers, e.g. one using "pwm-leds" and anot=
her=20
one using "gpio-leds"? =20

See arch/arm/boot/dts/at91-kizbox3-hs.dts for example, the nodes are called=
=20
"pwm_leds" and "leds" currently.  If both were part of a .dtsi and both nam=
ed=20
the same, you could not overwrite/complement those in a .dts file including=
=20
that .dtsi due to a name conflict.=20

Just append a numerical index like this?

  led-controller-1 {
    =E2=80=A6
  };
 =20
  led-controller-2 {
    =E2=80=A6
  };

Greets=20
Alex



