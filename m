Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D025D26381A
	for <lists+linux-leds@lfdr.de>; Wed,  9 Sep 2020 22:59:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726883AbgIIU7A (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 9 Sep 2020 16:59:00 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:39914 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726414AbgIIU67 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 9 Sep 2020 16:58:59 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 0A6141C0B8C; Wed,  9 Sep 2020 22:58:56 +0200 (CEST)
Date:   Wed, 9 Sep 2020 22:58:55 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc:     linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        Dan Murphy <dmurphy@ti.com>, Rob Herring <robh+dt@kernel.org>,
        linux-kernel@vger.kernel.org, Alexander Dahl <ada@thorsis.com>
Subject: Re: [PATCH v3 1/2] leds: pwm: Allow automatic labels for DT based
 devices
Message-ID: <20200909205855.GC20388@amd>
References: <20200907043459.2961-1-post@lespocky.de>
 <20200907043459.2961-2-post@lespocky.de>
 <20200909090736.GE10891@amd>
 <20200909202907.3z425uujvu532qxs@falbala.internal.home.lespocky.de>
 <9e78d793-d0d5-737c-163e-30736c1c7bdf@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="YD3LsXFS42OYHhNZ"
Content-Disposition: inline
In-Reply-To: <9e78d793-d0d5-737c-163e-30736c1c7bdf@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--YD3LsXFS42OYHhNZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> >>>  	pwm_init_state(led_data->pwm, &led_data->pwmstate);
> >>>-	ret =3D devm_led_classdev_register(dev, &led_data->cdev);
> >>>+	if (fwnode) {
> >>>+		init_data.fwnode =3D fwnode;
> >>>+		ret =3D devm_led_classdev_register_ext(dev, &led_data->cdev,
> >>>+						     &init_data);
> >>>+	} else {
> >>>+		ret =3D devm_led_classdev_register(dev, &led_data->cdev);
> >>>+	}
> >>
> >>Can you always use _ext version, even with null fwnode?
> >
> >I did not try on real hardware, but from reading the code I would say
> >the following would happen: led_classdev_register_ext() calls
> >led_compose_name(parent, init_data, composed_name) which itself calls
> >led_parse_fwnode_props(dev, fwnode, &props); that returns early due to
> >fwnode=3D=3DNULL without changing props, thus this stays as initialized
> >with {}, so led_compose_name() would return -EINVAL which would let
> >led_classdev_register_ext() fail, too.
> >
> >>If not, can you fix the core to accept that? Having that conditional
> >>in driver is ugly.
> >
> >It is ugly, although the approach is inspired by the leds-gpio driver.
> >I'll see if I can come up with a change to led-core, but I'm also open
> >for suggestions. ;-)
>=20
> devm_led_classdev_register() calls devm_led_classdev_register_ext()
> with NULL passed in place of init_data, so you could do something like
> below to achieve the same without touching LED core:
>=20
> struct led_init_data init_data_impl =3D { .fwnode =3D fwnode };
> struct led_init_data *init_data =3D NULL;
>=20
> if (fwnode)
> 	init_data =3D &init_data_impl;
>=20
> devm_led_classdev_register_ext(dev, &led_data->cdev, init_data);

Umm.. This is not too great, either. Maybe I'd really prefer the
change to the LED core.

> >fyi: Peter Ujfalusi answered and would give his Ack to the changed
> >dual license for the yaml file.  You can expect that for v4.

Good :-).

Best regards,
									pavel

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--YD3LsXFS42OYHhNZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl9ZQg8ACgkQMOfwapXb+vL3CQCfQDic/R/0EPuqdZppwuv6RMsq
0BMAn2rBwwlrIBuBpn2c87MeB4P04Hsj
=tb6i
-----END PGP SIGNATURE-----

--YD3LsXFS42OYHhNZ--
