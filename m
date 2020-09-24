Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 34BE92770A5
	for <lists+linux-leds@lfdr.de>; Thu, 24 Sep 2020 14:10:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727669AbgIXMKf (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 24 Sep 2020 08:10:35 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:36100 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727651AbgIXMKd (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 24 Sep 2020 08:10:33 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id CE0D01C0BCF; Thu, 24 Sep 2020 14:10:29 +0200 (CEST)
Date:   Thu, 24 Sep 2020 14:10:29 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Marek =?iso-8859-1?Q?Beh=FAn?= <marek.behun@nic.cz>
Cc:     linux-leds@vger.kernel.org, Dan Murphy <dmurphy@ti.com>
Subject: Re: [PATCH leds v3 9/9] leds: parse linux,default-trigger DT
 property in LED core
Message-ID: <20200924121029.GD3933@duo.ucw.cz>
References: <20200919180304.2885-1-marek.behun@nic.cz>
 <20200919180304.2885-10-marek.behun@nic.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="veXX9dWIonWZEC6h"
Content-Disposition: inline
In-Reply-To: <20200919180304.2885-10-marek.behun@nic.cz>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--veXX9dWIonWZEC6h
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> Do the parsing of `linux,default-trigger` DT property to LED core.
> Currently it is done in many different drivers and the code is repeated.
>=20
> This patch removes the parsing from 23 drivers:
>   an30259a, aw2013, bcm6328, bcm6358, cr0014114, el15203000, gpio,
>   is31fl32xx, lm3532, lm36274, lm3692x, lm3697, lp50xx, lp8860, lt3593,
>   max77650, mt6323, ns2, pm8058, pwm, syscon, tlc591xx and turris-omnia.
>=20
> There is one driver in drivers/input which parses this property on it's
> own. I shall send a separate patch there after this is applied.
>=20
> There are still 8 drivers that parse this property on their own because
> they do not pass the led_init_data structure to the registering
> function. I will try to refactor those in the future.
>=20
> Signed-off-by: Marek Beh=FAn <marek.behun@nic.cz>

Thanks, I applied the series.

Best regards,
								Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--veXX9dWIonWZEC6h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCX2yMtQAKCRAw5/Bqldv6
8oZ8AJ0bVmy4ln8NBWmfH3Z8zCUcaVlzlwCgrGgWG/SXwkKfI5WzK2Bj98P2H1s=
=YIND
-----END PGP SIGNATURE-----

--veXX9dWIonWZEC6h--
