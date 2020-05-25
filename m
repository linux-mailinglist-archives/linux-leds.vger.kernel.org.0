Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 756F91E0C50
	for <lists+linux-leds@lfdr.de>; Mon, 25 May 2020 12:56:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389975AbgEYKzu (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 25 May 2020 06:55:50 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:41456 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389930AbgEYKzu (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 25 May 2020 06:55:50 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 782EA1C02C5; Mon, 25 May 2020 12:55:48 +0200 (CEST)
Date:   Mon, 25 May 2020 12:55:47 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     nikitos.tr@gmail.com
Cc:     dmurphy@ti.com, robh+dt@kernel.org, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH v2 3/3] leds: add aw2013 driver
Message-ID: <20200525105547.GC27989@amd>
References: <20200511111128.16210-1-nikitos.tr@gmail.com>
 <20200511111128.16210-3-nikitos.tr@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="oTHb8nViIGeoXxdp"
Content-Disposition: inline
In-Reply-To: <20200511111128.16210-3-nikitos.tr@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--oTHb8nViIGeoXxdp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon 2020-05-11 16:11:28, nikitos.tr@gmail.com wrote:
> From: Nikita Travkin <nikitos.tr@gmail.com>
>=20
> This commit adds support for AWINIC AW2013 3-channel LED driver.
> The chip supports 3 PWM channels and is controlled with I2C.
>=20
> Signed-off-by: Nikita Travkin <nikitos.tr@gmail.com>

Thanks, I applied 2 and 3/. 1/ should go through Rob AFAICT.

Best regards,
								Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--oTHb8nViIGeoXxdp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl7LpDMACgkQMOfwapXb+vLfGgCffVjAQxbtcjOMV17IsjPvNNzl
PjIAn1PkP5gjYYstKT2AHgLKF3zu4gTs
=1aDF
-----END PGP SIGNATURE-----

--oTHb8nViIGeoXxdp--
