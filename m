Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B97222138C
	for <lists+linux-leds@lfdr.de>; Wed, 15 Jul 2020 19:36:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726431AbgGORgR (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 15 Jul 2020 13:36:17 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:48236 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725900AbgGORgR (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 15 Jul 2020 13:36:17 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id E53971C0BD5; Wed, 15 Jul 2020 19:36:11 +0200 (CEST)
Date:   Wed, 15 Jul 2020 19:36:10 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Marek =?iso-8859-1?Q?Beh=FAn?= <marek.behun@nic.cz>
Cc:     Dan Murphy <dmurphy@ti.com>, jacek.anaszewski@gmail.com,
        robh@kernel.org, devicetree@vger.kernel.org,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v30 04/16] leds: Add multicolor ID to the color ID list
Message-ID: <20200715173610.GA31327@amd>
References: <20200713154544.1683-1-dmurphy@ti.com>
 <20200713154544.1683-5-dmurphy@ti.com>
 <20200715152056.3505e181@dellmb.labs.office.nic.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="jRHKVT23PllUwdXP"
Content-Disposition: inline
In-Reply-To: <20200715152056.3505e181@dellmb.labs.office.nic.cz>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--jRHKVT23PllUwdXP
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed 2020-07-15 15:20:56, Marek Beh=FAn wrote:
> On Mon, 13 Jul 2020 10:45:32 -0500
> Dan Murphy <dmurphy@ti.com> wrote:
>=20
> > Add a new color ID that is declared as MULTICOLOR as with the
> > multicolor framework declaring a definitive color is not accurate
> > as the node can contain multiple colors.
> >=20
> > Signed-off-by: Dan Murphy <dmurphy@ti.com>
> > ---
> >  drivers/leds/led-core.c | 1 +
> >  1 file changed, 1 insertion(+)
>=20
> Reviewed-by: Marek Beh=FAn <marek.behun@nic.cz>

Thanks for patches, thanks for reviews, 1-4 applied.
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--jRHKVT23PllUwdXP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl8PPooACgkQMOfwapXb+vKzPQCgkeYcvh2P2Yt02B1/uG5cNRWX
NzoAn2OYFBLFmx2AzOBIY7UIVxkp9EdQ
=+HiT
-----END PGP SIGNATURE-----

--jRHKVT23PllUwdXP--
