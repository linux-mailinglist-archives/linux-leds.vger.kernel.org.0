Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 03EA6170065
	for <lists+linux-leds@lfdr.de>; Wed, 26 Feb 2020 14:48:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726440AbgBZNsn (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 26 Feb 2020 08:48:43 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:39574 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726988AbgBZNsn (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 26 Feb 2020 08:48:43 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 68F881C0411; Wed, 26 Feb 2020 14:48:41 +0100 (CET)
Date:   Wed, 26 Feb 2020 14:48:41 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Colin King <colin.king@canonical.com>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Dan Murphy <dmurphy@ti.com>, linux-leds@vger.kernel.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] leds: lm3697: fix spelling mistake "To" -> "Too"
Message-ID: <20200226134840.GE4080@duo.ucw.cz>
References: <20200122233749.2829246-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="ffoCPvUAPMgSXi6H"
Content-Disposition: inline
In-Reply-To: <20200122233749.2829246-1-colin.king@canonical.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--ffoCPvUAPMgSXi6H
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed 2020-01-22 23:37:49, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
>=20
> There is a spelling mistake in a dev_err message. Fix it.
>=20
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Thanks, applied.
									Pavel

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--ffoCPvUAPMgSXi6H
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCXlZ3OAAKCRAw5/Bqldv6
8uGrAJ45ARIKfSQPYi/LrqCFYxiNr4SgoACcCmJgukixOzQX2U524fIsjBAxtzo=
=pjb0
-----END PGP SIGNATURE-----

--ffoCPvUAPMgSXi6H--
