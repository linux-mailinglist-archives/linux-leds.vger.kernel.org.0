Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0070B27EFDB
	for <lists+linux-leds@lfdr.de>; Wed, 30 Sep 2020 19:01:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726335AbgI3RBH (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 30 Sep 2020 13:01:07 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:55954 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725892AbgI3RBH (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 30 Sep 2020 13:01:07 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id BE9291C0B85; Wed, 30 Sep 2020 19:01:05 +0200 (CEST)
Date:   Wed, 30 Sep 2020 19:01:05 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Marek =?iso-8859-1?Q?Beh=FAn?= <marek.behun@nic.cz>
Cc:     linux-leds@vger.kernel.org, Dan Murphy <dmurphy@ti.com>,
        NeilBrown <neilb@suse.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        "H . Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: [PATCH leds + devicetree 06/13] leds: tca6507: cosmetic change:
 use helper variable
Message-ID: <20200930170105.GC27760@duo.ucw.cz>
References: <20200919221548.29984-1-marek.behun@nic.cz>
 <20200919221548.29984-7-marek.behun@nic.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="L6iaP+gRLNZHKoI4"
Content-Disposition: inline
In-Reply-To: <20200919221548.29984-7-marek.behun@nic.cz>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--L6iaP+gRLNZHKoI4
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> Use helper variable dev instead of always writing &client->dev.
>=20
> Signed-off-by: Marek Beh=FAn <marek.behun@nic.cz>

I applied series up to here, plus the "leds: tca6507: remove binding
comment". I got rejects on the others.

Best regards,
								Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--L6iaP+gRLNZHKoI4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCX3S50QAKCRAw5/Bqldv6
8vLlAKCHJEc7AhKbT5Bqbsg5jc+MKEHYJQCdHTQnvil5VSf3y9PIfzrVeO/ENWI=
=GdaZ
-----END PGP SIGNATURE-----

--L6iaP+gRLNZHKoI4--
