Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A5B1D247815
	for <lists+linux-leds@lfdr.de>; Mon, 17 Aug 2020 22:28:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728021AbgHQU2c (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 17 Aug 2020 16:28:32 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:39672 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727027AbgHQU2c (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 17 Aug 2020 16:28:32 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 7D8651C0BB6; Mon, 17 Aug 2020 22:28:29 +0200 (CEST)
Date:   Mon, 17 Aug 2020 22:28:29 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     LKML <linux-kernel@vger.kernel.org>, linux-leds@vger.kernel.org,
        Dan Murphy <dmurphy@ti.com>, Milo Kim <milo.kim@ti.com>
Subject: Re: [PATCH] leds: LP55XX_COMMON needs to depend on LEDS_CLASS
Message-ID: <20200817202829.GA14094@amd>
References: <0ad9338b-e2da-e269-db49-b448977bdc83@infradead.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="YiEDa0DAkWCtVeE4"
Content-Disposition: inline
In-Reply-To: <0ad9338b-e2da-e269-db49-b448977bdc83@infradead.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--YiEDa0DAkWCtVeE4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> From: Randy Dunlap <rdunlap@infradead.org>
>=20
> With these kernel configs:
> CONFIG_LEDS_CLASS=3Dm
> # CONFIG_LEDS_CLASS_MULTICOLOR is not set
> CONFIG_LEDS_LP55XX_COMMON=3Dy
> CONFIG_LEDS_LP5521=3Dm
> CONFIG_LEDS_LP5562=3Dm
>=20
> leds-lp55xx-common.c has a build error because it is builtin and
> calls an interface that is built as a loadable module (due to
> LEDS_CLASS=3Dm). By making LEDS_LP55XX_COMMON depend on LEDS_CLASS,
> this config combination cannot happen, thus preventing the build error.
>=20
> ld: drivers/leds/leds-lp55xx-common.o: in function `lp55xx_register_leds':
> leds-lp55xx-common.c:(.text+0xc5f): undefined reference to `devm_led_clas=
sdev_register_ext'
>=20
> Fixes: 33b3a561f417 ("leds: support new LP8501 device - another LP55xx co=
mmon")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Pavel Machek <pavel@ucw.cz>
> Cc: Dan Murphy <dmurphy@ti.com>
> Cc: Milo Kim <milo.kim@ti.com>
> Cc: linux-leds@vger.kernel.org
> ---
> The Fixes: tag might be incorrect...  I also considered:
> 92a81562e695 ("leds: lp55xx: Add multicolor framework support to
> lp55xx")

Thanks, makes sense, I'll take this one. I believe the second fixes
tag is correct; not that it matters.

Thanks and best regards,
								Pavel
							=09
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--YiEDa0DAkWCtVeE4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl866G0ACgkQMOfwapXb+vJP0ACaAjGL6iWTlMJgZWv/0GstL3Jo
teYAn1/ww9G4UvzjCi/vXaTiUmKaGfd2
=OYmR
-----END PGP SIGNATURE-----

--YiEDa0DAkWCtVeE4--
