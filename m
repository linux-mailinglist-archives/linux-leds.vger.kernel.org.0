Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0A103B21B9
	for <lists+linux-leds@lfdr.de>; Wed, 23 Jun 2021 22:20:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229759AbhFWUWd (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 23 Jun 2021 16:22:33 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:35944 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229688AbhFWUWd (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 23 Jun 2021 16:22:33 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id D5A261C0B76; Wed, 23 Jun 2021 22:20:14 +0200 (CEST)
Date:   Wed, 23 Jun 2021 22:20:14 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Zhen Lei <thunder.leizhen@huawei.com>
Cc:     Jan-Simon Moeller <jansimon.moeller@gmx.de>,
        linux-leds <linux-leds@vger.kernel.org>
Subject: Re: [PATCH 1/1] leds: blinkm: remove unused variable 'ret' in
 blinkm_init_hw()
Message-ID: <20210623202014.GF8540@amd>
References: <20210519124136.7938-1-thunder.leizhen@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="0hHDr/TIsw4o3iPK"
Content-Disposition: inline
In-Reply-To: <20210519124136.7938-1-thunder.leizhen@huawei.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--0hHDr/TIsw4o3iPK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed 2021-05-19 20:41:36, Zhen Lei wrote:
> GCC reports the following warning with W=3D1:
>=20
> drivers/leds/leds-blinkm.c:483:6: warning:
>  variable 'ret' set but not used [-Wunused-but-set-variable]
>   483 |  int ret;
>       |      ^~~
>=20
> This variable is not used, remove it to fix the warning.
>=20
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>

Sounds like valid warning, and likely function should just propagate
the error value.

It would be good if someone with the hardware could take a look.

Best regards,
								Pavel
							=09
--=20
http://www.livejournal.com/~pavelmachek

--0hHDr/TIsw4o3iPK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAmDTl34ACgkQMOfwapXb+vKnjwCePJg1SjYu0V8I5vHdL0OE1DK3
2DwAn3gl0Hkco7w1cE5yxHt/yRFlHxmR
=dX+S
-----END PGP SIGNATURE-----

--0hHDr/TIsw4o3iPK--
