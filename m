Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8C8F522935
	for <lists+linux-leds@lfdr.de>; Sun, 19 May 2019 23:32:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725947AbfESVcv (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 19 May 2019 17:32:51 -0400
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:59850 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725784AbfESVcv (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 19 May 2019 17:32:51 -0400
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
        id BC55A80378; Sun, 19 May 2019 23:32:39 +0200 (CEST)
Date:   Sun, 19 May 2019 23:32:49 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     oss@c-mauderer.de
Cc:     linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Dan Murphy <dmurphy@ti.com>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH v4 2/2] leds: spi-byte: add single byte SPI LED driver
Message-ID: <20190519213249.GF31403@amd>
References: <20190513193307.11591-1-oss@c-mauderer.de>
 <20190513193307.11591-2-oss@c-mauderer.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="Mjqg7Yu+0hL22rav"
Content-Disposition: inline
In-Reply-To: <20190513193307.11591-2-oss@c-mauderer.de>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--Mjqg7Yu+0hL22rav
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon 2019-05-13 21:33:07, oss@c-mauderer.de wrote:
> From: Christian Mauderer <oss@c-mauderer.de>
>=20
> This driver adds support for simple SPI based LED controller which use
> only one byte for setting the brightness.
>=20
> Signed-off-by: Christian Mauderer <oss@c-mauderer.de>

Acked-by: Pavel Machek <pavel@ucw.cz>

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--Mjqg7Yu+0hL22rav
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlzhy4EACgkQMOfwapXb+vKDKACgxNRyxY6xzXQ/1E9RBsSMlnt7
9HAAn0XbUsYArq2KtoyTCD4ZYUNL/aKK
=spwh
-----END PGP SIGNATURE-----

--Mjqg7Yu+0hL22rav--
