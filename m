Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89B11262A7D
	for <lists+linux-leds@lfdr.de>; Wed,  9 Sep 2020 10:37:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726440AbgIIIhj (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 9 Sep 2020 04:37:39 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:47960 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726293AbgIIIhj (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 9 Sep 2020 04:37:39 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 482B01C0B87; Wed,  9 Sep 2020 10:37:36 +0200 (CEST)
Date:   Wed, 9 Sep 2020 10:37:35 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Dan Murphy <dmurphy@ti.com>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        newbytee@protonmail.com, Stephan Gerhold <stephan@gerhold.net>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: leds: Add DT binding for Richtek RT8515
Message-ID: <20200909083735.GA10891@amd>
References: <20200812090711.2644688-1-linus.walleij@linaro.org>
 <e8d27b57-ac17-29e4-0e43-b72d7447d43a@gmail.com>
 <CACRpkdYcKthp9_482ptL7YSitN-YUU4_u57ra25Ko4_-102JaQ@mail.gmail.com>
 <e4ac5ea8-916d-1270-c9ae-64870b2f7c8d@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="UugvWAfsgieZRqgk"
Content-Disposition: inline
In-Reply-To: <e4ac5ea8-916d-1270-c9ae-64870b2f7c8d@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--UugvWAfsgieZRqgk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> >>>+        led {
> >>>+            function =3D LED_FUNCTION_FLASH;
> >>>+            color =3D <LED_COLOR_ID_WHITE>;
> >>>+            flash-max-timeout-us =3D <250000>;
> >>
> >>Constraints for this property are needed above.
> >
> >Can you elaborate on what you expect this to look like?
> >The property is from common.yaml, so should that be
> >extended with a constraint?
>=20
> Constraints are specific to the hardware, so those should
> be provided in the related bindings.
> Generally it is customary in similar cases to give min, max
> and step values.

This looks okay to me.

Driver already knows what the step is, so there's no need to specify
it in the device tree. I was always wondering why minimum is useful. I
guess most hardware can just use first step as a minimum, again no
need to specify that.

Best regards,
								Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--UugvWAfsgieZRqgk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl9YlE8ACgkQMOfwapXb+vLshACfeTnYPFKn8obOuFJOgCVnpULJ
I2gAnjEoUf6/ABw6SWFFt9C/FFZypw47
=gvo+
-----END PGP SIGNATURE-----

--UugvWAfsgieZRqgk--
