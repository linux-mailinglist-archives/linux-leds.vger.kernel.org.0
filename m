Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F10AD3E0598
	for <lists+linux-leds@lfdr.de>; Wed,  4 Aug 2021 18:13:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234549AbhHDQNf (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 4 Aug 2021 12:13:35 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:40240 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234305AbhHDQNZ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 4 Aug 2021 12:13:25 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 5416C1C0B7A; Wed,  4 Aug 2021 18:13:10 +0200 (CEST)
Date:   Wed, 4 Aug 2021 18:13:09 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     lqhua06@163.com
Cc:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        "quanah.li_cp" <liqinghua@yulong.com>
Subject: Re: [PATCH] leds: led-core: The value of delay_on and delay_off
 remains when led off
Message-ID: <20210804161309.GF25072@amd>
References: <20210429125908.8308-1-lqhua06@163.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="pyE8wggRBhVBcj8z"
Content-Disposition: inline
In-Reply-To: <20210429125908.8308-1-lqhua06@163.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--pyE8wggRBhVBcj8z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu 2021-04-29 20:59:08, lqhua06@163.com wrote:
> From: "quanah.li_cp" <liqinghua@yulong.com>
>=20
> The LED connect to pmic gpio, and the LED can blinking during
> AP goto sleep.
>=20
> When the LED is turned off and the hardware blinking will be disabled,
> but the value of delay_on and delay_off still remains.

Is that a problem?

It seems this is a feature, not a bug.

Best regards,
								Pavel
--=20
http://www.livejournal.com/~pavelmachek

--pyE8wggRBhVBcj8z
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAmEKvJUACgkQMOfwapXb+vJ+nACfYBzw2nHQO6fhVJKdiVW0E6Ca
gVwAn1vOfXku+O4+u7Q9LPO2EBFzvzs3
=GSLC
-----END PGP SIGNATURE-----

--pyE8wggRBhVBcj8z--
