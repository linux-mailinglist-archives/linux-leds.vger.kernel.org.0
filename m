Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B579427EFD8
	for <lists+linux-leds@lfdr.de>; Wed, 30 Sep 2020 19:00:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728744AbgI3RAI (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 30 Sep 2020 13:00:08 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:55836 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725892AbgI3RAH (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 30 Sep 2020 13:00:07 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id AE1371C0B81; Wed, 30 Sep 2020 19:00:06 +0200 (CEST)
Date:   Wed, 30 Sep 2020 19:00:06 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Marek =?iso-8859-1?Q?Beh=FAn?= <marek.behun@nic.cz>
Cc:     linux-leds@vger.kernel.org, Dan Murphy <dmurphy@ti.com>,
        NeilBrown <neilb@suse.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        "H . Nikolaus Schaller" <hns@goldelico.com>,
        Tony Lindgren <tony@atomide.com>,
        Adam Ford <aford173@gmail.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH leds + devicetree 04/13] ARM: dts: omap3: gta04: rename
 LED controlled subnodes
Message-ID: <20200930170006.GB27760@duo.ucw.cz>
References: <20200919221548.29984-1-marek.behun@nic.cz>
 <20200919221548.29984-5-marek.behun@nic.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="z6Eq5LdranGa6ru8"
Content-Disposition: inline
In-Reply-To: <20200919221548.29984-5-marek.behun@nic.cz>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--z6Eq5LdranGa6ru8
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun 2020-09-20 00:15:39, Marek Beh=FAn wrote:
> Rename LED controller subnodes to format "led@[0-6]" or "gpio@[0-6]" to
> conform to the new YAML defined binding.
>=20
> Use the `gpio-line-names` property to define GPIO names.
>=20
> Signed-off-by: Marek Beh=FAn <marek.behun@nic.cz>

Not for me, dt maintainers should take this.

									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--z6Eq5LdranGa6ru8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCX3S5lgAKCRAw5/Bqldv6
8j3pAJoCu2GfO/KmD/WBfOSFTZ09GOYOJwCglSWjCWX2jFQ6r+WzpmRdn3kkJkk=
=UEd5
-----END PGP SIGNATURE-----

--z6Eq5LdranGa6ru8--
