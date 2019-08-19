Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AD4E6921A4
	for <lists+linux-leds@lfdr.de>; Mon, 19 Aug 2019 12:49:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726717AbfHSKs4 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 19 Aug 2019 06:48:56 -0400
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:34849 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726477AbfHSKs4 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 19 Aug 2019 06:48:56 -0400
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
        id 8AF2D8075E; Mon, 19 Aug 2019 12:48:41 +0200 (CEST)
Date:   Mon, 19 Aug 2019 12:48:54 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Dan Murphy <dmurphy@ti.com>
Cc:     jacek.anaszewski@gmail.com, tony@atomide.com, sre@kernel.org,
        nekit1000@gmail.com, mpartap@gmx.net, merlijn@wizzup.org,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/4] leds: lm3532: Fixes for the driver for stability
Message-ID: <20190819104854.GE21072@amd>
References: <20190813181154.6614-1-dmurphy@ti.com>
 <20190813181154.6614-2-dmurphy@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="PPYy/fEw/8QCHSq3"
Content-Disposition: inline
In-Reply-To: <20190813181154.6614-2-dmurphy@ti.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--PPYy/fEw/8QCHSq3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue 2019-08-13 13:11:52, Dan Murphy wrote:
> Fixed misspelled words, added error check during probe
> on the init of the registers, and fixed ALS/I2C control
> mode.
>=20
> Fixes: e37a7f8d77e1 ("leds: lm3532: Introduce the lm3532 LED driver")
> Reported-by: Pavel Machek <pavel@ucw.cz>
> Signed-off-by: Dan Murphy <dmurphy@ti.com>

Acked-by: Pavel Machek <pavel@ucw.cz>
								Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--PPYy/fEw/8QCHSq3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl1afpYACgkQMOfwapXb+vILMwCgxOF5yTypLCBKpGph2SuD29Wl
rKQAoIz+Dr/rXh2h4qBAYipqm5g8A9HT
=7Onr
-----END PGP SIGNATURE-----

--PPYy/fEw/8QCHSq3--
