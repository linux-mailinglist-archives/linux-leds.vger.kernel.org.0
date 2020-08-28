Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 870942554BF
	for <lists+linux-leds@lfdr.de>; Fri, 28 Aug 2020 09:01:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726571AbgH1HBF (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 28 Aug 2020 03:01:05 -0400
Received: from mail.thorsis.com ([92.198.35.195]:37491 "EHLO mail.thorsis.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725858AbgH1HBE (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Fri, 28 Aug 2020 03:01:04 -0400
Received: from localhost (localhost [127.0.0.1])
        by mail.thorsis.com (Postfix) with ESMTP id C04F9412D;
        Fri, 28 Aug 2020 09:00:59 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.thorsis.com
Received: from mail.thorsis.com ([127.0.0.1])
        by localhost (mail.thorsis.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id GemdL7l_63G6; Fri, 28 Aug 2020 09:00:59 +0200 (CEST)
Received: by mail.thorsis.com (Postfix, from userid 109)
        id DCEB335D1; Fri, 28 Aug 2020 09:00:57 +0200 (CEST)
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,NO_RECEIVED,
        NO_RELAYS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
        version=3.4.2
From:   Alexander Dahl <ada@thorsis.com>
To:     linux-leds@vger.kernel.org
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        linux-kernel@vger.kernel.org, Alexander Dahl <post@lespocky.de>
Subject: Re: [PATCH] leds: pwm: Allow automatic labels for DT based devices
Date:   Fri, 28 Aug 2020 09:00:52 +0200
Message-ID: <7920560.iacgkFlgr8@ada>
In-Reply-To: <d6f69d4a-3e46-cad4-5756-4d15e5ef95ba@gmail.com>
References: <20200826093737.29008-1-ada@thorsis.com> <d6f69d4a-3e46-cad4-5756-4d15e5ef95ba@gmail.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hello Jacek,

Am Donnerstag, 27. August 2020, 23:28:45 CEST schrieb Jacek Anaszewski:
> On 8/26/20 11:37 AM, Alexander Dahl wrote:
> > From: Alexander Dahl <post@lespocky.de>
> >=20
> > If LEDs are configured through device tree and the property 'label' is
> > omitted, the label is supposed to be generated from the properties
> > 'function' and 'color' if present.  While this works fine for e.g. the
> > 'leds-gpio' driver, it did not for 'leds-pwm'.
> >=20
> > The reason is, you get this label naming magic only if you add a LED
> > device through 'devm_led_classdev_register_ext()' and pass a pointer to
> > the current device tree node.  The approach to fix this was adopted from
> > the 'leds-gpio' driver.
> >=20
> > For the following node from dts the LED appeared as 'led5' in sysfs
> > before and as 'red:debug' after this change.
> >=20
> >          pwm_leds {
> >         =20
> >                  compatible =3D "pwm-leds";
> >                 =20
> >                  led5 {
> >                 =20
> >                          function =3D LED_FUNCTION_DEBUG;
> >                          color =3D <LED_COLOR_ID_RED>;
> >                          pwms =3D <&pwm0 2 10000000 0>;
> >                          max-brightness =3D <127>;
> >                         =20
> >                          linux,default-trigger =3D "heartbeat";
> >                          panic-indicator;
> >                 =20
> >                  };
> >         =20
> >          };
> >=20
> > Signed-off-by: Alexander Dahl <post@lespocky.de>
> > ---
> >=20
> > Notes:
> >      v1: based on v5.9-rc2, backport on v5.4.59 also works
> >  =20
> >   drivers/leds/leds-pwm.c | 9 ++++++++-
> >   1 file changed, 8 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/leds/leds-pwm.c b/drivers/leds/leds-pwm.c
> > index ef7b91bd2064..a27a1d75a3e9 100644
> > --- a/drivers/leds/leds-pwm.c
> > +++ b/drivers/leds/leds-pwm.c
> > @@ -65,6 +65,7 @@ static int led_pwm_add(struct device *dev, struct
> > led_pwm_priv *priv,>=20
> >   		       struct led_pwm *led, struct fwnode_handle *fwnode)
> >  =20
> >   {
> >  =20
> >   	struct led_pwm_data *led_data =3D &priv->leds[priv->num_leds];
> >=20
> > +	struct led_init_data init_data =3D {};
> >=20
> >   	int ret;
> >   =09
> >   	led_data->active_low =3D led->active_low;
> >=20
> > @@ -90,7 +91,13 @@ static int led_pwm_add(struct device *dev, struct
> > led_pwm_priv *priv,>=20
> >   	pwm_init_state(led_data->pwm, &led_data->pwmstate);
> >=20
> > -	ret =3D devm_led_classdev_register(dev, &led_data->cdev);
> > +	if (fwnode) {
> > +		init_data.fwnode =3D fwnode;
> > +		ret =3D devm_led_classdev_register_ext(dev, &led_data->cdev,
> > +						     &init_data);
> > +	} else {
> > +		ret =3D devm_led_classdev_register(dev, &led_data->cdev);
> > +	}
> >=20
> >   	if (ret) {
> >   =09
> >   		dev_err(dev, "failed to register PWM led for %s: %d\n",
> >   	=09
> >   			led->name, ret);
>=20
> This part looks good, but corresponding update of
> Documentation/devicetree/bindings/leds/leds-pwm.txt is needed as well.

I'm not sure, what needs updating. The properties 'function' and 'color' ar=
e=20
already documented in Documentation/devicetree/bindings/leds/common.yaml =
=E2=80=A6 the=20
only thing I can think of here is updating the examples? That would be nice=
,=20
as would be updating to yaml, but I don't see the strong relation, yet.

> It would be good to switch to yaml by this occassion.

Is there some guidance on that in general?

Greets
Alex



