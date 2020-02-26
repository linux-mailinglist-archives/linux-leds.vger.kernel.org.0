Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 372791700F6
	for <lists+linux-leds@lfdr.de>; Wed, 26 Feb 2020 15:19:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727237AbgBZOTU (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 26 Feb 2020 09:19:20 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:44008 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726278AbgBZOTU (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 26 Feb 2020 09:19:20 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id F0B3C1C0411; Wed, 26 Feb 2020 15:19:18 +0100 (CET)
Date:   Wed, 26 Feb 2020 15:19:18 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Nicolas Belin <nbelin@baylibre.com>
Cc:     Dan Murphy <dmurphy@ti.com>, linux-kernel@vger.kernel.org,
        linux-leds@vger.kernel.org, jacek.anaszewski@gmail.com
Subject: Re: [PATCH 0/3] leds: add support for apa102c leds
Message-ID: <20200226141918.GL4080@duo.ucw.cz>
References: <1582018657-5720-1-git-send-email-nbelin@baylibre.com>
 <04642127-0e68-43b1-9b6c-0dbb56dc9bfe@ti.com>
 <CAJZgTGGREREnozgwsm26EwSoM6hXawNfOK7hF0soOkKzMqwD7Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="lHuqAdgBYNjQz/wy"
Content-Disposition: inline
In-Reply-To: <CAJZgTGGREREnozgwsm26EwSoM6hXawNfOK7hF0soOkKzMqwD7Q@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--lHuqAdgBYNjQz/wy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > Is this something that can benefit from the Multicolor framework patche=
s?
> >
> > https://lore.kernel.org/patchwork/project/lkml/list/?series=3D427513
> >
> > Can you RFC the APA102C driver on top of the Multicolor FW to see how it
> > blends?
>=20
> Sure, the Multicolor framework will probably improve my driver !
> I'll send you a new version once I have tested it.

If you want to submit basic version of your driver that does _not_
support RGB, that may help get the driver merged early.

Best regards,
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--lHuqAdgBYNjQz/wy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCXlZ+ZgAKCRAw5/Bqldv6
8ubLAKC/zxELG/sjtYapgLz3thR0rxQxDQCffuNVCxcgiCng/wx6h0D/cSGV3UE=
=bSVB
-----END PGP SIGNATURE-----

--lHuqAdgBYNjQz/wy--
