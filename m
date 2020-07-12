Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 09DCB21C7EE
	for <lists+linux-leds@lfdr.de>; Sun, 12 Jul 2020 09:52:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728137AbgGLHwz (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 12 Jul 2020 03:52:55 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:48660 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725974AbgGLHwy (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 12 Jul 2020 03:52:54 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id BE05E1C0BD2; Sun, 12 Jul 2020 09:52:51 +0200 (CEST)
Date:   Sun, 12 Jul 2020 09:52:51 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Dan Murphy <dmurphy@ti.com>, linux-leds@vger.kernel.org,
        Milo Kim <milo.kim@ti.com>
Subject: Re: [PATCH] leds: lp55xx: Convert to use GPIO descriptors
Message-ID: <20200712075251.GB8295@amd>
References: <20200626224011.379368-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="xgyAXRrhYN0wYx8y"
Content-Disposition: inline
In-Reply-To: <20200626224011.379368-1-linus.walleij@linaro.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--xgyAXRrhYN0wYx8y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat 2020-06-27 00:40:11, Linus Walleij wrote:
> The LP55xx driver is already using the of_gpio() functions to
> pick a global GPIO number for "enable" from the device tree and
> request the line. Simplify it by just using a GPIO descriptor.
>=20
> Make sure to keep the enable GPIO line optional, change the
> naming from "lp5523_enable" to "LP55xx enable" to reflect that
> this is used on all LP55xx LED drivers.
>=20
> Cc: Milo Kim <milo.kim@ti.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Thanks, applied to for-next.

Not sure if Milo's address is still valid.

							Pavel

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--xgyAXRrhYN0wYx8y
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl8KwVMACgkQMOfwapXb+vKBXgCgjPnGmIN+XR9YwFbOuLtDydhM
Ff4An2jaLO/DXLm5N3veieiVoyKVEhto
=Lm1C
-----END PGP SIGNATURE-----

--xgyAXRrhYN0wYx8y--
