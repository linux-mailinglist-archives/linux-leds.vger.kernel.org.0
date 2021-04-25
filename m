Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 498DC36A9A2
	for <lists+linux-leds@lfdr.de>; Mon, 26 Apr 2021 00:00:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231300AbhDYWBA (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 25 Apr 2021 18:01:00 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:53390 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231231AbhDYWBA (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 25 Apr 2021 18:01:00 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 904231C0B77; Mon, 26 Apr 2021 00:00:14 +0200 (CEST)
Date:   Mon, 26 Apr 2021 00:00:14 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Stefan Riedmueller <s.riedmueller@phytec.de>
Cc:     Riku Voipio <riku.voipio@iki.fi>, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] leds: pca9532: Assign gpio base dynamically
Message-ID: <20210425220013.GJ10996@amd>
References: <20210414115124.91416-1-s.riedmueller@phytec.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="9aCKuHbn5v2q3RVc"
Content-Disposition: inline
In-Reply-To: <20210414115124.91416-1-s.riedmueller@phytec.de>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--9aCKuHbn5v2q3RVc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> When using devicetree, gpio_base holds its initial zero value which can
> lead to a rejection if another gpio controller already occupies this
> base. To prevent that collision let the gpio base be assigned dynamically.
>=20
> Signed-off-by: Stefan Riedmueller <s.riedmueller@phytec.de>

Thanks, applied.
								Pavel
--=20
http://www.livejournal.com/~pavelmachek

--9aCKuHbn5v2q3RVc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAmCF5m0ACgkQMOfwapXb+vK8tgCfYM7i2KTE4oWlU0YCkTkcCraQ
c/AAoKulybmr3zSXjYG8zS1zzqWS+LOw
=EfYi
-----END PGP SIGNATURE-----

--9aCKuHbn5v2q3RVc--
