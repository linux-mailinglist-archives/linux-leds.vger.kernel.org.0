Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E16EF102F8
	for <lists+linux-leds@lfdr.de>; Wed,  1 May 2019 01:02:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726123AbfD3XCS (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 30 Apr 2019 19:02:18 -0400
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:58655 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726105AbfD3XCS (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 30 Apr 2019 19:02:18 -0400
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
        id D8070803F5; Wed,  1 May 2019 01:02:06 +0200 (CEST)
Date:   Wed, 1 May 2019 01:02:15 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc:     Marek =?iso-8859-1?Q?Beh=FAn?= <marek.behun@nic.cz>,
        linux-leds@vger.kernel.org
Subject: Re: [PATCH leds/for-next v2 2/2] leds: turris-omnia: Add support for
 256 brightness values
Message-ID: <20190430230215.GF20410@amd>
References: <20190429212944.15643-1-marek.behun@nic.cz>
 <20190429212944.15643-3-marek.behun@nic.cz>
 <d2a11183-896c-679f-27c9-4abbba1cb087@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="twz1s1Hj1O0rHoT0"
Content-Disposition: inline
In-Reply-To: <d2a11183-896c-679f-27c9-4abbba1cb087@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--twz1s1Hj1O0rHoT0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> >@@ -166,10 +174,19 @@ static int omnia_leds_probe(struct i2c_client *cli=
ent,
> >  static int omnia_leds_remove(struct i2c_client *client)
> >  {
> >+	u8 buf[5];
> >+
> >  	/* put all LEDs into default (HW triggered) mode */
> >  	i2c_smbus_write_byte_data(client, CMD_LED_MODE,
> >  				  CMD_LED_MODE_LED(OMNIA_BOARD_LEDS));
> >+	/* set all LEDs color to [255, 255, 255] */
> >+	buf[0] =3D CMD_LED_COLOR;
> >+	buf[1] =3D OMNIA_BOARD_LEDS;
> >+	buf[2] =3D buf[3] =3D buf[4] =3D 255;
> >+
> >+	i2c_master_send(client, buf, 5);
> >+
> >  	return 0;
> >  }
>=20
> I wonder if we're doing right merging this driver in this form.
> We break the rule one-led-class-device-per-one-channel.
> We don't have LED multi color support yet, so this should support
> RGB LEDs in the old manner. Or switch to using LED multi color
>  class.

Fair point.

We treat it as a white LED instead of RGB LED at this
point. One-led-per-channel would be problematic, as hardware
"triggers" are common for all three channels.

So I thought we could go from "white" led to multicolor, when it
becomes available, without going through One-led-per-channel...

I agree this is not quite standard.

									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--twz1s1Hj1O0rHoT0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlzI0/cACgkQMOfwapXb+vJsqQCfYnIvooIzllx9+UvX3Wif6G44
f0kAni64+fqZTFehpUEzYGQZjCh/9fuv
=Inww
-----END PGP SIGNATURE-----

--twz1s1Hj1O0rHoT0--
