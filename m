Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A24F83FD872
	for <lists+linux-leds@lfdr.de>; Wed,  1 Sep 2021 13:10:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238369AbhIALKy (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 1 Sep 2021 07:10:54 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:46274 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237050AbhIALKc (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 1 Sep 2021 07:10:32 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 220871C0B76; Wed,  1 Sep 2021 13:09:30 +0200 (CEST)
Date:   Wed, 1 Sep 2021 13:09:29 +0200
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
Message-ID: <20210901110929.GA18522@duo.ucw.cz>
References: <DBAPR10MB42195CA4E52FDD30F0598AE98ACD9@DBAPR10MB4219.EURPRD10.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="EeQfGwPcQSOJBaQU"
Content-Disposition: inline
In-Reply-To: <DBAPR10MB42195CA4E52FDD30F0598AE98ACD9@DBAPR10MB4219.EURPRD10.PROD.OUTLOOK.COM>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--EeQfGwPcQSOJBaQU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> I am toying with the idea of writing a multicolor LED GPIO driver. What w=
ould be the right way to define mixed color LEDs (for leds-gpio), in device=
 tree or ACPI?
> Consider the following:
>=20
> leds {
> 	compatible =3D "gpio-leds";
> 	led0 {
> 		gpios =3D <&mcu_pio 0 GPIO_ACTIVE_LOW>;
> 		color =3D <LED_COLOR_ID_RED>;
> 	};
>=20
> 	led1 {
> 		gpios =3D <&mcu_pio 1 GPIO_ACTIVE_HIGH>;
> 		color =3D <LED_COLOR_ID_GREEN>;
> 	};
> 	led2 {
> 		gpios =3D <&mcu_pio 0 GPIO_ACTIVE_LOW
> 			&mcu_pio 1 GPIO_ACTIVE_LOW>;
> 		color =3D <LED_COLOR_ID_AMBER>;
> 	};
> };
>=20
> This probably won't work as "gpios" seem to be single object in gpio-leds=
 driver code, but what can I do to achieve something similar?
> It is important to define this LED in DT/ACPI in order for the user app t=
o see it in the /sys/class/led folder, without having to write platform-spe=
cific driver.
>=20

So you have one package with red and green LED, each connected to one
GPIO?

Can you take a look at Documentation/leds/leds-class-multicolor.rst?

Best regards,
								Pavel
--=20
http://www.livejournal.com/~pavelmachek

--EeQfGwPcQSOJBaQU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCYS9faQAKCRAw5/Bqldv6
8nVoAKCrWFL/Byw2H13dqN2vky8qfvlLnQCcD5X4J8/q3K060nGud0YOCgjvmt4=
=TOrG
-----END PGP SIGNATURE-----

--EeQfGwPcQSOJBaQU--
