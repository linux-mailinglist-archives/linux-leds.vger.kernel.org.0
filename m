Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 74EAD921A0
	for <lists+linux-leds@lfdr.de>; Mon, 19 Aug 2019 12:48:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726784AbfHSKsG (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 19 Aug 2019 06:48:06 -0400
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:34659 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726477AbfHSKsG (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 19 Aug 2019 06:48:06 -0400
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
        id EE46F815F5; Mon, 19 Aug 2019 12:47:51 +0200 (CEST)
Date:   Mon, 19 Aug 2019 12:48:04 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Dan Murphy <dmurphy@ti.com>
Cc:     jacek.anaszewski@gmail.com, tony@atomide.com, sre@kernel.org,
        nekit1000@gmail.com, mpartap@gmx.net, merlijn@wizzup.org,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/4] leds: lm3532: Fix brightness control for i2c mode
Message-ID: <20190819104804.GD21072@amd>
References: <20190813181154.6614-1-dmurphy@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="gE7i1rD7pdK0Ng3j"
Content-Disposition: inline
In-Reply-To: <20190813181154.6614-1-dmurphy@ti.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--gE7i1rD7pdK0Ng3j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue 2019-08-13 13:11:51, Dan Murphy wrote:
> Fix the brightness control for I2C mode.  Instead of
> changing the full scale current register update the ALS target
> register for the appropriate banks.
>=20
> In addition clean up some code errors and random misspellings found
> during coding.
>=20
> Tested on Droid4 as well as LM3532 EVM connected to a BeagleBoneBlack
>=20
> Fixes: e37a7f8d77e1 ("leds: lm3532: Introduce the lm3532 LED driver")
> Reported-by: Pavel Machek <pavel@ucw.cz>
> Signed-off-by: Dan Murphy <dmurphy@ti.com>

I may prefer register renames to come separately, but ...

Acked-by: Pavel Machek <pavel@ucw.cz>
								Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--gE7i1rD7pdK0Ng3j
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl1afmQACgkQMOfwapXb+vJyWQCfU/tZGXYDv0Yg5ikdrFBOljiQ
6PwAniBhpvUOZcimMKQvPK7ofeM4efQz
=9Rkl
-----END PGP SIGNATURE-----

--gE7i1rD7pdK0Ng3j--
