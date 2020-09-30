Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 070E227EFFC
	for <lists+linux-leds@lfdr.de>; Wed, 30 Sep 2020 19:11:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725872AbgI3RLw (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 30 Sep 2020 13:11:52 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:57188 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725385AbgI3RLw (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 30 Sep 2020 13:11:52 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 4CA231C0B81; Wed, 30 Sep 2020 19:11:48 +0200 (CEST)
Date:   Wed, 30 Sep 2020 19:11:47 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>
Cc:     Tobias Jordan <kernel@cdqe.de>, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org, Dan Murphy <dmurphy@ti.com>,
        Jean-Jacques Hiblot <jjhiblot@ti.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH v2] leds: tlc591xx: fix leak of device node iterator
Message-ID: <20200930171147.GG27760@duo.ucw.cz>
References: <20200926005117.GA32209@agrajag.zerfleddert.de>
 <20200926032406.00c7cfb2@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="doKZ0ri6bHmN2Q5y"
Content-Disposition: inline
In-Reply-To: <20200926032406.00c7cfb2@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--doKZ0ri6bHmN2Q5y
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > In one of the error paths of the for_each_child_of_node loop in
> > tlc591xx_probe, add missing call to of_node_put.
> >=20
> > Fixes: 1ab4531ad132 ("leds: tlc591xx: simplify driver by using the
> > managed led API")
> >=20
> > Signed-off-by: Tobias Jordan <kernel@cdqe.de>
>=20
> Reviewed-by: Marek Beh=FAn <kabel@kernel.org>

Thanks, applied.

Marek: Thanks for review. If I can get you to trim parts not
interesting for the email, I'll be even happier.

:-).

Best regards,

									Pavel

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--doKZ0ri6bHmN2Q5y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCX3S8UwAKCRAw5/Bqldv6
8sGjAJ4p4WWc5e3h1dnOH15zoZ6BkKqEuwCgj4CZR2QoQTFl1EemE7FZu+L781s=
=2qtW
-----END PGP SIGNATURE-----

--doKZ0ri6bHmN2Q5y--
