Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EF51DB4E17
	for <lists+linux-leds@lfdr.de>; Tue, 17 Sep 2019 14:42:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727930AbfIQMmN (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 17 Sep 2019 08:42:13 -0400
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:60884 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727308AbfIQMmN (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 17 Sep 2019 08:42:13 -0400
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
        id 41C9981D0B; Tue, 17 Sep 2019 14:41:57 +0200 (CEST)
Date:   Tue, 17 Sep 2019 14:42:11 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc:     Tony Lindgren <tony@atomide.com>,
        kernel list <linux-kernel@vger.kernel.org>, sre@kernel.org,
        nekit1000@gmail.com, mpartap@gmx.net, merlijn@wizzup.org,
        Dan Murphy <dmurphy@ti.com>, linux-leds@vger.kernel.org
Subject: Re: [FYI] lm3532: right registration to work with LED-backlight
Message-ID: <20190917124210.GB27465@amd>
References: <20190827215205.59677-1-tony@atomide.com>
 <20190828085339.GB2923@amd>
 <c3ac1863-9cdb-1ba6-d5a4-df1c4cfecbe1@gmail.com>
 <20190908080305.GC25459@amd>
 <390760c1-de39-9328-bb23-cbf791094718@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="aVD9QWMuhilNxW9f"
Content-Disposition: inline
In-Reply-To: <390760c1-de39-9328-bb23-cbf791094718@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--aVD9QWMuhilNxW9f
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> >>> +++ b/drivers/leds/leds-lm3532.c
> >>> @@ -629,7 +629,7 @@ static int lm3532_parse_node(struct lm3532_data *=
priv)
> >>> =20
> >>>  		lm3532_init_registers(led);
> >>> =20
> >>> -		ret =3D devm_led_classdev_register(priv->dev, &led->led_dev);
> >>> +		ret =3D devm_of_led_classdev_register(priv->dev, to_of_node(child)=
, &led->led_dev);
> >>
> >> We no longer have devm_of_led_classdev_register(). You must use
> >> devm_led_classdev_register_ext().
> >=20
> > Something like this (untested)?

> If you want to properly switch to the new extended LED registration
> API, then you need:
>=20
> .default_label =3D ":",
> .devicename =3D led->client->name;
>=20
> and in addition to that you need to remove old way of composing
> the LED name. Something like patch [0] for leds-lm3692x.c.
> And also patch for DT for consistency would be needed (like [1]).
>=20
> However it will not change anything in LED naming in comparison
> to the existing code, except that it will enable the possibility
> of using 'function' and 'color' DT properties instead of deprecated
> 'label'.
>=20
> I suppose that you expected some extra bonus by passing
> DT node, but I'm not sure what exactly. Possibly you confused
> this with the patch set [2] that allows for instantiating
> backlight device on top of LED class device (it has been forgotten
> btw and will miss 5.4).

Yes, it is for LED backlight. Thanks for hints, you have corrected
version in your inbox.

Best regards,
								Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--aVD9QWMuhilNxW9f
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl2A1KIACgkQMOfwapXb+vKSiQCfSaOpmsMXHTUxjI7o+3uBZlgG
Q08Amwb3v228sOb8lFX/gWhvInqTSOwS
=oOu0
-----END PGP SIGNATURE-----

--aVD9QWMuhilNxW9f--
