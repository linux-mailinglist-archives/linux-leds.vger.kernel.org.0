Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B71623079D
	for <lists+linux-leds@lfdr.de>; Tue, 28 Jul 2020 12:26:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728493AbgG1K0l (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 28 Jul 2020 06:26:41 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:59262 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728424AbgG1K0l (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 28 Jul 2020 06:26:41 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id A05491C0BEC; Tue, 28 Jul 2020 12:26:38 +0200 (CEST)
Date:   Tue, 28 Jul 2020 12:26:37 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     LKML <linux-kernel@vger.kernel.org>, linux-leds@vger.kernel.org,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Dan Murphy <dmurphy@ti.com>, Milo Kim <milo.kim@ti.com>,
        Mathias Nyman <mathias.nyman@nokia.com>
Subject: Re: [PATCH -next] leds: fix LEDS_LP55XX_COMMON dependency and build
 errors
Message-ID: <20200728102637.GA30718@amd>
References: <dba79c02-b7f1-dd75-b364-93d90538cc5e@infradead.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="zhXaljGHf11kAtnf"
Content-Disposition: inline
In-Reply-To: <dba79c02-b7f1-dd75-b364-93d90538cc5e@infradead.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--zhXaljGHf11kAtnf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> From: Randy Dunlap <rdunlap@infradead.org>
>=20
> Make LEDS_LP55XX_COMMON depend on I2C to fix build errors:
>=20
> leds-lp55xx-common.c:(.text+0x9d): undefined reference to `i2c_smbus_read=
_byte_data'
> leds-lp55xx-common.c:(.text+0x8fc): undefined reference to `i2c_smbus_wri=
te_byte_data'
>=20
> These errors happened when I2C=3Dm and LEDS_LP55XX_COMMON=3Dy, so
> prevent that from being possible.
>=20
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> Cc: Pavel Machek <pavel@ucw.cz>
> Cc: Dan Murphy <dmurphy@ti.com>
> Cc: linux-leds@vger.kernel.org
> Cc: Milo Kim <milo.kim@ti.com>
> Cc: Mathias Nyman <mathias.nyman@nokia.com>

git is unhappy with your patch for some reason:

Applying: leds: fix LEDS_LP55XX_COMMON dependency and build errors
error: corrupt patch at line 14
Patch failed at 0001 leds: fix LEDS_LP55XX_COMMON dependency and build
errors
The copy of the patch that failed is found in: .git/rebase-apply/patch
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am
--abort".

I somehow applied it by hand and pushed out. Thanks!

								Pavel
							=09
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--zhXaljGHf11kAtnf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl8f/V0ACgkQMOfwapXb+vIKEACcC2B6Tdxfc+eAnHH4bVH0ZrPb
coUAnRusk7r2wgRTKIYQ5M64wF1LqD/l
=2yqt
-----END PGP SIGNATURE-----

--zhXaljGHf11kAtnf--
