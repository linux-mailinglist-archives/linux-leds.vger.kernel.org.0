Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 65D92228A2B
	for <lists+linux-leds@lfdr.de>; Tue, 21 Jul 2020 22:52:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730281AbgGUUwc (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 21 Jul 2020 16:52:32 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:43168 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726029AbgGUUwc (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 21 Jul 2020 16:52:32 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 171A31C0BD8; Tue, 21 Jul 2020 22:52:28 +0200 (CEST)
Date:   Tue, 21 Jul 2020 22:52:27 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Dan Murphy <dmurphy@ti.com>
Cc:     jacek.anaszewski@gmail.com, robh@kernel.org, marek.behun@nic.cz,
        devicetree@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] leds: multicolor: Fix camel case in documentation
Message-ID: <20200721205227.GA5966@amd>
References: <20200720190547.4735-1-dmurphy@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="zYM0uCDKw75PZbzx"
Content-Disposition: inline
In-Reply-To: <20200720190547.4735-1-dmurphy@ti.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--zYM0uCDKw75PZbzx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon 2020-07-20 14:05:47, Dan Murphy wrote:
> Fix the camel case of MultiColor to Multicolor.
>=20
> Fixes: f5a6eb5c5e38 ("leds: multicolor: Introduce a multicolor class defi=
nition")
> Signed-off-by: Dan Murphy <dmurphy@ti.com>

Thanks, applied.
							Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--zYM0uCDKw75PZbzx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl8XVYsACgkQMOfwapXb+vKn9ACgnPc4IRCwATpdgz5zZSpXaqwM
140AoKU6TS0fDjuLSdkFd/edguixYGd0
=LJ9R
-----END PGP SIGNATURE-----

--zYM0uCDKw75PZbzx--
