Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A9BD2770DF
	for <lists+linux-leds@lfdr.de>; Thu, 24 Sep 2020 14:24:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727683AbgIXMYZ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 24 Sep 2020 08:24:25 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:37664 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727468AbgIXMYZ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 24 Sep 2020 08:24:25 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id D3F871C0BCB; Thu, 24 Sep 2020 14:24:21 +0200 (CEST)
Date:   Thu, 24 Sep 2020 14:24:21 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Markus Moll <moll.markus@arcor.de>
Cc:     Riku Voipio <riku.voipio@iki.fi>, Dan Murphy <dmurphy@ti.com>,
        linux-leds@vger.kernel.org
Subject: Re: [PATCH v1] leds: pca9532: correct shift computation in
 pca9532_getled
Message-ID: <20200924122421.GI3933@duo.ucw.cz>
References: <718260256.101908.1600802915869@mail.vodafone.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="u/L2/WlOHZg+YGU4"
Content-Disposition: inline
In-Reply-To: <718260256.101908.1600802915869@mail.vodafone.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--u/L2/WlOHZg+YGU4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue 2020-09-22 21:28:35, Markus Moll wrote:
> Each led setting occupies two bits in a corresponding led register.
> Accessing these bits requires shifting and masking, which was
> implemented incorrectly in pca9532_getled. Two new helper macros
> concentrate the computation of those masks in one place.
>=20
> Signed-off-by: Markus Moll <mmoll@de.pepperl-fuchs.com>

Thanks, applied.

Note that default-state =3D keep should _not_ be supported unless
someone needs it.

Best regards,
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--u/L2/WlOHZg+YGU4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCX2yP9QAKCRAw5/Bqldv6
8l5XAJ4jgcSoAfGpdVeZSOT5DWPAYIc7xwCfUIEpTxumigwGfhNmz9TpKrdgBMs=
=AAGr
-----END PGP SIGNATURE-----

--u/L2/WlOHZg+YGU4--
