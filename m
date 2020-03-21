Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 24C9A18E2A6
	for <lists+linux-leds@lfdr.de>; Sat, 21 Mar 2020 16:46:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726955AbgCUPqY (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 21 Mar 2020 11:46:24 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:56340 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726652AbgCUPqY (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 21 Mar 2020 11:46:24 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 134041C032C; Sat, 21 Mar 2020 16:46:22 +0100 (CET)
Date:   Sat, 21 Mar 2020 16:46:21 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Colin King <colin.king@canonical.com>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Dan Murphy <dmurphy@ti.com>, linux-leds@vger.kernel.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] leds: lm3532: make bitfield 'enabled' unsigned
Message-ID: <20200321154621.GG8386@duo.ucw.cz>
References: <20200313171937.220884-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="GUPx2O/K0ibUojHx"
Content-Disposition: inline
In-Reply-To: <20200313171937.220884-1-colin.king@canonical.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--GUPx2O/K0ibUojHx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri 2020-03-13 17:19:37, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
>=20
> The bitfield 'enabled' should bit unsigned, so make it unsigned.
>=20
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Thanks, applied.
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--GUPx2O/K0ibUojHx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCXnY2zQAKCRAw5/Bqldv6
8mk4AJ9gp0fhjV3eJslDQl+7vsTyWVpkFACgttrxg5o1SM8dFpFCBKlNFhfbsLY=
=kzCS
-----END PGP SIGNATURE-----

--GUPx2O/K0ibUojHx--
