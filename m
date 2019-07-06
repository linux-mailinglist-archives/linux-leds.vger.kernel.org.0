Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A2F02611D8
	for <lists+linux-leds@lfdr.de>; Sat,  6 Jul 2019 17:19:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726672AbfGFPTv (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 6 Jul 2019 11:19:51 -0400
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:39571 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726446AbfGFPTv (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 6 Jul 2019 11:19:51 -0400
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
        id 7EDDF803E2; Sat,  6 Jul 2019 17:19:37 +0200 (CEST)
Date:   Sat, 6 Jul 2019 17:19:41 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc:     Jean-Jacques Hiblot <jjhiblot@ti.com>, devicetree@vger.kernel.org,
        linux-leds@vger.kernel.org, robh@kernel.org,
        "Valkeinen, Tomi" <tomi.valkeinen@ti.com>
Subject: Re: devicetree bindings for a generic led-based backlight driver
Message-ID: <20190706151941.GB9856@amd>
References: <69f3a300-9e37-448d-e6fa-49c1c9ca0dd6@ti.com>
 <400ac00b-d3c7-b58f-52fa-8b18b6c7e4a2@gmail.com>
 <283a3b7c-c3ed-719e-14e3-fc73e08af880@ti.com>
 <e7c5a500-4107-8895-d0fc-377c71cd3b34@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="b5gNqxB1S1yM7hjW"
Content-Disposition: inline
In-Reply-To: <e7c5a500-4107-8895-d0fc-377c71cd3b34@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--b5gNqxB1S1yM7hjW
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> >>> A few years ago (2015), Tomi Valkeinen posted a series implementing a
> >>> backlight driver on top of a LED device.
> >>>
> >>> https://patchwork.kernel.org/patch/7293991/
> >>> https://patchwork.kernel.org/patch/7294001/
> >>> https://patchwork.kernel.org/patch/7293981/
> >>>
> >>> The discussion stopped=A0 because he lacked the time to work on it.
> >>>
> >>> I will be taking over the task and, before heading in the wrong
> >>> direction, wanted a confirmation that the binding Tomi last proposed =
in
> >>> hist last email was indeed the preferred option.
> >>>
> >>> It will probably require some modifications in the LED core to create
> >>> the right kind of led-device (normal, flash or backlight) based on the
> >>> compatible option.
> >> I recall that discussion. I gave my ack for the LED changes but
> >> now we have more LED people that might want to look into that.
> >=20
> > Regarding the LED bindings as discussed by Tom and Rob in
> > https://patchwork.kernel.org/patch/7293991/, what do you think of using
> > a 'compatible' string to make a LED device also a backlight or a flash =
LED ?
>=20
> After going through the referenced discussion and refreshing my memory
> it looks to me the most reasonable way to go for backlight case.
>=20
> Nevertheless I'd not tamper at LED flash support - if it's not broken,
> don't fix it.
>=20
> Best regards,
> Jacek Anaszewski
>=20
> > Here is the example from Tomi at the end of the discussion:
> >=20
> > /* tlc59108 is an i2c device */
> > tlc59116@40 {
> > 	#address-cells =3D <1>;
> > 	#size-cells =3D <0>;
> > 	compatible =3D "ti,tlc59108";
> > 	reg =3D <0x40>;
> >=20
> > 	wan@0 {
> > 		label =3D "wrt1900ac:amber:wan";
> > 		reg =3D <0x0>;
> > 	};
> >=20
> > 	bl@2 {
> > 		label =3D "backlight";
> > 		reg =3D <0x2>;
> >=20
> > 		compatible =3D "led-backlight";
> > 		brightness-levels =3D <0 243 245 247 248 249 251 252 255>;
> > 		default-brightness-level =3D <8>;
> >=20
> > 		enable-gpios =3D <&pcf_lcd 13 GPIO_ACTIVE_LOW>;

So... this needs some kind of reference to display it belongs to,
right?

									Pavel

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--b5gNqxB1S1yM7hjW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl0gvA0ACgkQMOfwapXb+vLuAgCgkcxncs9hK9t8jdQD36OCNME+
Xc8An1qdPMdEZT4o/7K4z1UaqQXEberG
=6Egk
-----END PGP SIGNATURE-----

--b5gNqxB1S1yM7hjW--
