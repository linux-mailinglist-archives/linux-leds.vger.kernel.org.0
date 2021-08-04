Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E67F63E04E3
	for <lists+linux-leds@lfdr.de>; Wed,  4 Aug 2021 17:52:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239555AbhHDPwh (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 4 Aug 2021 11:52:37 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:38684 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239206AbhHDPwg (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 4 Aug 2021 11:52:36 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id C331D1C0B7A; Wed,  4 Aug 2021 17:52:22 +0200 (CEST)
Date:   Wed, 4 Aug 2021 17:52:21 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Hermes Zhang <chenhui.zhang@axis.com>
Cc:     Dan Murphy <dmurphy@ti.com>, kernel@axis.com,
        Hermes Zhang <chenhuiz@axis.com>, linux-kernel@vger.kernel.org,
        linux-leds@vger.kernel.org
Subject: Re: [PATCH v3] leds: leds-multi-gpio: Add multiple GPIOs LED driver
Message-ID: <20210804155221.GB25072@amd>
References: <20210329055847.13293-1-chenhui.zhang@axis.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="ftEhullJWpWg/VHq"
Content-Disposition: inline
In-Reply-To: <20210329055847.13293-1-chenhui.zhang@axis.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--ftEhullJWpWg/VHq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> From: Hermes Zhang <chenhuiz@axis.com>
>=20
> Introduce a new multiple GPIOs LED driver. This LED will made of
> multiple GPIOs (up to 8) and will map different brightness to different
> GPIOs states which defined in dts file.
>=20
> Signed-off-by: Hermes Zhang <chenhuiz@axis.com>

Thank you, it looks simple and mostly ok.

Acked-by: Pavel Machek <pavel@ucw.cz>

But it really needs to go in with devicetree documentation changes,
and they need to be acked by devicetree maintainers. If you have that,
please send it in series.

Best regards,
								Pavel
--=20
http://www.livejournal.com/~pavelmachek

--ftEhullJWpWg/VHq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAmEKt7UACgkQMOfwapXb+vLJywCgiemcjYUjxfA4EdkBgJQdrtR0
HRoAn1xk+ExD8HSuIE0ahTIgAQ2IWYnd
=tLaS
-----END PGP SIGNATURE-----

--ftEhullJWpWg/VHq--
