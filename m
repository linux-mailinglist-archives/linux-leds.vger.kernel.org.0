Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 423541B895F
	for <lists+linux-leds@lfdr.de>; Sat, 25 Apr 2020 22:31:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726201AbgDYUbr (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 25 Apr 2020 16:31:47 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:55800 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726190AbgDYUbr (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 25 Apr 2020 16:31:47 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 8F1A51C023A; Sat, 25 Apr 2020 22:31:45 +0200 (CEST)
Date:   Sat, 25 Apr 2020 22:31:45 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Dan Murphy <dmurphy@ti.com>
Cc:     jacek.anaszewski@gmail.com, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>
Subject: Re: [PATCH v20 09/17] ARM: dts: imx6dl-yapp4: Add reg property to
 the lp5562 channel node
Message-ID: <20200425203145.GC23926@amd>
References: <20200423155524.13971-1-dmurphy@ti.com>
 <20200423155524.13971-10-dmurphy@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="uXxzq0nDebZQVNAZ"
Content-Disposition: inline
In-Reply-To: <20200423155524.13971-10-dmurphy@ti.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--uXxzq0nDebZQVNAZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu 2020-04-23 10:55:16, Dan Murphy wrote:
> Add the reg property to each channel node.  This update is
> to accomodate the multicolor framework.  In addition to the
> accomodation this allows the LEDs to be placed on any channel
> and allow designs to skip channels as opposed to requiring
> sequential order.
>=20
> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> CC: Shawn Guo <shawnguo@kernel.org>
> CC: Sascha Hauer <s.hauer@pengutronix.de>
> CC: Pengutronix Kernel Team <kernel@pengutronix.de>
> CC: Fabio Estevam <festevam@gmail.com>
> CC: NXP Linux Team <linux-imx@nxp.com>

Acked-by: Pavel Machek <pavel@ucw.cz>

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--uXxzq0nDebZQVNAZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl6knjEACgkQMOfwapXb+vIRywCeLrJr9C+6ZAAzd/E0Rk1K1Iy4
N/QAn01TeJXasIUxngFjU1pyDUYXGNG4
=Yboa
-----END PGP SIGNATURE-----

--uXxzq0nDebZQVNAZ--
