Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0B661E43F8
	for <lists+linux-leds@lfdr.de>; Wed, 27 May 2020 15:39:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388503AbgE0Njv (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 27 May 2020 09:39:51 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:46978 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387682AbgE0Nju (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 27 May 2020 09:39:50 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 2EB6E1C0300; Wed, 27 May 2020 15:39:49 +0200 (CEST)
Date:   Wed, 27 May 2020 15:39:48 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Rob Herring <robh@kernel.org>
Cc:     Dan Murphy <dmurphy@ti.com>, jacek.anaszewski@gmail.com,
        devicetree@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v25 01/16] dt: bindings: Add multicolor class dt bindings
 documention
Message-ID: <20200527133948.GA5011@amd>
References: <20200526164652.2331-1-dmurphy@ti.com>
 <20200526164652.2331-2-dmurphy@ti.com>
 <20200527014902.GA859634@bogus>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="liOOAslEiF7prFVr"
Content-Disposition: inline
In-Reply-To: <20200527014902.GA859634@bogus>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--liOOAslEiF7prFVr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

Thanks for reviews!

> > +additionalProperties: false
> > +...
> > diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c
>=20
> This isn't a binding file. Belongs in another patch.

These constants are directly related to the binding. It makes sense to
go in one patch...

Best regards,
								Pavel

> > index f1f718dbe0f8..846248a0693d 100644
> > --- a/drivers/leds/led-core.c
> > +++ b/drivers/leds/led-core.c
> > @@ -34,6 +34,7 @@ const char * const led_colors[LED_COLOR_ID_MAX] =3D {
> >  	[LED_COLOR_ID_VIOLET] =3D "violet",
> >  	[LED_COLOR_ID_YELLOW] =3D "yellow",
> >  	[LED_COLOR_ID_IR] =3D "ir",
> > +	[LED_COLOR_ID_MULTI] =3D "multicolor",
> >  };
> >  EXPORT_SYMBOL_GPL(led_colors);
> > =20
> > diff --git a/include/dt-bindings/leds/common.h b/include/dt-bindings/le=
ds/common.h
> > index 0ce7dfc00dcb..a463ce6a8794 100644
> > --- a/include/dt-bindings/leds/common.h
> > +++ b/include/dt-bindings/leds/common.h
> > @@ -30,7 +30,8 @@
> >  #define LED_COLOR_ID_VIOLET	5
> >  #define LED_COLOR_ID_YELLOW	6
> >  #define LED_COLOR_ID_IR		7
> > -#define LED_COLOR_ID_MAX	8
> > +#define LED_COLOR_ID_MULTI	8
> > +#define LED_COLOR_ID_MAX	9
> > =20
> >  /* Standard LED functions */
> >  /* Keyboard LEDs, usually it would be input4::capslock etc. */
> > --=20
> > 2.25.1
> >=20

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--liOOAslEiF7prFVr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl7ObaQACgkQMOfwapXb+vKDUQCgvKwSBIpK3Ho7ZIPhCUNgU/kp
toUAnjGIr5U3J+haA7vXpJm0QHecHNkG
=Ow+v
-----END PGP SIGNATURE-----

--liOOAslEiF7prFVr--
