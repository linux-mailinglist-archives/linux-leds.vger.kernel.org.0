Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 391B9271860
	for <lists+linux-leds@lfdr.de>; Mon, 21 Sep 2020 00:25:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726126AbgITWZS (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 20 Sep 2020 18:25:18 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:52162 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726239AbgITWZS (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 20 Sep 2020 18:25:18 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 522241C0B7A; Mon, 21 Sep 2020 00:25:13 +0200 (CEST)
Date:   Mon, 21 Sep 2020 00:25:12 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Marek Behun <marek.behun@nic.cz>
Cc:     linux-leds@vger.kernel.org,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>, dmurphy@ti.com,
        linux-kernel@vger.kernel.org, Antonio Ospite <ao2@ao2.it>
Subject: Re: [PATCH leds] leds: regulator: remove driver
Message-ID: <20200920222512.GD31397@duo.ucw.cz>
References: <20200920204203.17148-1-marek.behun@nic.cz>
 <20200920214647.GC31397@duo.ucw.cz>
 <20200920235312.7da1dd51@nic.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="n/aVsWSeQ4JHkrmm"
Content-Disposition: inline
In-Reply-To: <20200920235312.7da1dd51@nic.cz>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--n/aVsWSeQ4JHkrmm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > > The leds-regulator driver only supports the old platform data binding
> > > and no in-tree code uses it. It also seems that no OpenWRT board uses
> > > it.
> > >=20
> > > Remove this driver. =20
> >=20
> > Lets keep this one.
>=20
> Very well.
>=20
> > Connecting LED directly to regulator simply makes sense.
>=20
> It does makes sence to me as well, but at least it needs to be
> rewritten to use OF instead of platdata. The way it is written now it
> is not used by anyone, apparently.

I'd say that first person that needs it gets to fix it for their needs
:-). I'd suggest simply ignoring it for now.

Best regards,
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--n/aVsWSeQ4JHkrmm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCX2fWyAAKCRAw5/Bqldv6
8jqbAJ9Ftt5Uv9mlhyhmb+uzoa0dCxwdlwCeMGHlCcAlBYyjWr1HSbvlKgyTrdk=
=wJHY
-----END PGP SIGNATURE-----

--n/aVsWSeQ4JHkrmm--
