Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 11452441B0E
	for <lists+linux-leds@lfdr.de>; Mon,  1 Nov 2021 13:18:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232417AbhKAMVV (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 1 Nov 2021 08:21:21 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:55540 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232036AbhKAMVT (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 1 Nov 2021 08:21:19 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id BCB8F1C0B76; Mon,  1 Nov 2021 13:18:44 +0100 (CET)
Date:   Mon, 1 Nov 2021 13:18:40 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     "hamza.farooq@siemens.com" <hamza.farooq@siemens.com>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        "henning.schild@siemens.com" <henning.schild@siemens.com>,
        "jan.kiszka@siemens.com" <jan.kiszka@siemens.com>,
        "Haeussler, Gerd" <gerd.haeussler.ext@siemens.com>
Subject: Re: Define LEDs with mixed colors
Message-ID: <20211101121840.GB2571@duo.ucw.cz>
References: <DBAPR10MB42195CA4E52FDD30F0598AE98ACD9@DBAPR10MB4219.EURPRD10.PROD.OUTLOOK.COM>
 <20210901110929.GA18522@duo.ucw.cz>
 <DBAPR10MB42198EA968C14B13B510834D8ACD9@DBAPR10MB4219.EURPRD10.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="gatW/ieO32f1wygP"
Content-Disposition: inline
In-Reply-To: <DBAPR10MB42198EA968C14B13B510834D8ACD9@DBAPR10MB4219.EURPRD10.PROD.OUTLOOK.COM>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--gatW/ieO32f1wygP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > > I am toying with the idea of writing a multicolor LED GPIO driver. Wh=
at
> > would be the right way to define mixed color LEDs (for leds-gpio), in d=
evice
> > tree or ACPI?
> > > Consider the following:
> > >
> > > leds {
> > > 	compatible =3D "gpio-leds";
> > > 	led0 {
> > > 		gpios =3D <&mcu_pio 0 GPIO_ACTIVE_LOW>;
> > > 		color =3D <LED_COLOR_ID_RED>;
> > > 	};
> > >
> > > 	led1 {
> > > 		gpios =3D <&mcu_pio 1 GPIO_ACTIVE_HIGH>;
> > > 		color =3D <LED_COLOR_ID_GREEN>;
> > > 	};
> > > 	led2 {
> > > 		gpios =3D <&mcu_pio 0 GPIO_ACTIVE_LOW
> > > 			&mcu_pio 1 GPIO_ACTIVE_LOW>;
> > > 		color =3D <LED_COLOR_ID_AMBER>;
> > > 	};
> > > };
> > >
> > > This probably won't work as "gpios" seem to be single object in gpio-=
leds
> > driver code, but what can I do to achieve something similar?
> > > It is important to define this LED in DT/ACPI in order for the user a=
pp to see
> > it in the /sys/class/led folder, without having to write platform-speci=
fic
> > driver.
> > >
> >=20
> > So you have one package with red and green LED, each connected to one
> > GPIO?
> Right. It is possible to create orange color, and I want to use DT/ACPI t=
o present this info to the userland.
>=20
> >=20
> > Can you take a look at Documentation/leds/leds-class-multicolor.rst?
> Couldn't find a hint there therefore this email thread. I might eventuall=
y write a multicolor led-gpio driver so want to know how to handle mixed LE=
D.
>

There's no similar driver in the tree, and we don't have estabilished
API. You are mostly on your own.

Best regards,
								Pavel

--=20
http://www.livejournal.com/~pavelmachek

--gatW/ieO32f1wygP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCYX/bIAAKCRAw5/Bqldv6
8gCYAKCik3wlhPUjpN2F5+JM+sE50MdvDQCfY8J4qNKz1Fe7aNa+pxyM+0OVVOo=
=ki/h
-----END PGP SIGNATURE-----

--gatW/ieO32f1wygP--
