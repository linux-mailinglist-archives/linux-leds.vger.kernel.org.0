Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C32EC3BAA38
	for <lists+linux-leds@lfdr.de>; Sat,  3 Jul 2021 22:15:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229548AbhGCUSK (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 3 Jul 2021 16:18:10 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:33792 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229473AbhGCUSK (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 3 Jul 2021 16:18:10 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 5B2EA1C0B79; Sat,  3 Jul 2021 22:15:35 +0200 (CEST)
Date:   Sat, 3 Jul 2021 22:15:34 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-leds@vger.kernel.org,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH 1/6] leds: aat1290: Move driver to flash subdirectory
Message-ID: <20210703201534.GA6707@amd>
References: <20210528202404.431859-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="C7zPtVaVf+AK4Oqc"
Content-Disposition: inline
In-Reply-To: <20210528202404.431859-1-linus.walleij@linaro.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--C7zPtVaVf+AK4Oqc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri 2021-05-28 22:23:59, Linus Walleij wrote:
> We created a subdirectory for LED drivers that depend on
> CONFIG_LEDS_CLASS_FLASH, and this driver does so let's
> move it there.
>=20
> Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Thanks, applied.

Best regards,
								Pavel
							=09
--=20
http://www.livejournal.com/~pavelmachek

--C7zPtVaVf+AK4Oqc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAmDgxWYACgkQMOfwapXb+vLMAACgokQ3DDsTqGMXRBIj0xNzgeBo
VfwAoJzI4j+ZFMwOcuvbqITa/zVT470G
=52F5
-----END PGP SIGNATURE-----

--C7zPtVaVf+AK4Oqc--
