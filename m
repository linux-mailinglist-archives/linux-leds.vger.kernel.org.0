Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6431A10616
	for <lists+linux-leds@lfdr.de>; Wed,  1 May 2019 10:26:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726090AbfEAI0a (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 1 May 2019 04:26:30 -0400
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:44174 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726014AbfEAI03 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 1 May 2019 04:26:29 -0400
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
        id 5CE3A80555; Wed,  1 May 2019 10:26:18 +0200 (CEST)
Date:   Wed, 1 May 2019 10:26:27 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Dan Murphy <dmurphy@ti.com>
Cc:     Brian Masney <masneyb@onstation.org>, lee.jones@linaro.org,
        daniel.thompson@linaro.org, jingoohan1@gmail.com,
        robh+dt@kernel.org, jacek.anaszewski@gmail.com,
        mark.rutland@arm.com, b.zolnierkie@samsung.com,
        dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-fbdev@vger.kernel.org, jonathan@marek.ca
Subject: Re: [PATCH v3 3/3] backlight: lm3630a: add firmware node support
Message-ID: <20190501082627.GA2971@amd>
References: <20190415072905.2861-1-masneyb@onstation.org>
 <20190415072905.2861-4-masneyb@onstation.org>
 <0e5e26ba-cf98-913e-8e76-e988a86dc0d1@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="6TrnltStXW4iwmi0"
Content-Disposition: inline
In-Reply-To: <0e5e26ba-cf98-913e-8e76-e988a86dc0d1@ti.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--6TrnltStXW4iwmi0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > @@ -396,13 +506,20 @@ static int lm3630a_probe(struct i2c_client *clien=
t,
> >  				     GFP_KERNEL);
> >  		if (pdata =3D=3D NULL)
> >  			return -ENOMEM;
> > +
> >  		/* default values */
> > -		pdata->leda_ctrl =3D LM3630A_LEDA_ENABLE;
> > -		pdata->ledb_ctrl =3D LM3630A_LEDB_ENABLE;
> > +		pdata->leda_ctrl =3D LM3630A_LEDA_DISABLE;
> > +		pdata->ledb_ctrl =3D LM3630A_LEDB_DISABLE;
>=20
> This is not needed since default is disabled and kzalloc will set these t=
o 0

Let compiler do this kind of optimalizations. Code makes sense as-is.

									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--6TrnltStXW4iwmi0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlzJWDMACgkQMOfwapXb+vK/6QCguYAgoaGIpYPAGtybTC9vIfZi
p4UAn2Haq8zwV7EpVgAkDZlkZ4x+gZWb
=7kTY
-----END PGP SIGNATURE-----

--6TrnltStXW4iwmi0--
