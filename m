Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 135DE394031
	for <lists+linux-leds@lfdr.de>; Fri, 28 May 2021 11:39:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234476AbhE1JlB (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 28 May 2021 05:41:01 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:58588 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233627AbhE1Jk7 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 28 May 2021 05:40:59 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id E44FD1C0B76; Fri, 28 May 2021 11:39:22 +0200 (CEST)
Date:   Fri, 28 May 2021 11:39:22 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, Dan Murphy <dmurphy@ti.com>,
        linux-leds@vger.kernel.org
Subject: Re: [PATCH 14/15] leds: leds-lm3692x: Demote non-complete kernel-doc
Message-ID: <20210528093921.GA2209@amd>
References: <20210528090629.1800173-1-lee.jones@linaro.org>
 <20210528090629.1800173-15-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="4Ckj6UjgE2iN1+kY"
Content-Disposition: inline
In-Reply-To: <20210528090629.1800173-15-lee.jones@linaro.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--4Ckj6UjgE2iN1+kY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> Needs updating by the author to re-promote.
>=20
> Fixes the following W=3D1 kernel build warning(s):
>=20
>  drivers/leds/leds-lm3692x.c:121: warning: Function parameter or member '=
boost_ctrl' not described in 'lm3692x_led'
>  drivers/leds/leds-lm3692x.c:121: warning: Function parameter or member '=
brightness_ctrl' not described in 'lm3692x_led'
>  drivers/leds/leds-lm3692x.c:121: warning: Function parameter or member '=
enabled' not described in 'lm3692x_led'
>

I'm not taking this one. I wanted to take the rest, but "leds:
tlc591xx: fix return value check in tlc591xx_probe()" did not apply.

I took the rest.

Thanks and best regards,
								Pavel
--=20
http://www.livejournal.com/~pavelmachek

--4Ckj6UjgE2iN1+kY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAmCwukkACgkQMOfwapXb+vI91ACfQbSkHe/ZYkBaPogXoqAsD1zO
ymgAn0iABKM8GbWDUwFIY8Iruu9Gq4Pu
=lPHc
-----END PGP SIGNATURE-----

--4Ckj6UjgE2iN1+kY--
