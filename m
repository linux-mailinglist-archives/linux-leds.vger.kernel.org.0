Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0D84912AB93
	for <lists+linux-leds@lfdr.de>; Thu, 26 Dec 2019 11:15:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726075AbfLZKPN (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 26 Dec 2019 05:15:13 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:42680 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726023AbfLZKPN (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 26 Dec 2019 05:15:13 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 83D341C213B; Thu, 26 Dec 2019 11:15:11 +0100 (CET)
Date:   Thu, 26 Dec 2019 11:15:10 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Dan Murphy <dmurphy@ti.com>, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] leds: lm3692x: Move lm3692x_init and rename to
 lm3692x_leds_enable
Message-ID: <20191226101510.GF4033@amd>
References: <cover.1577272495.git.agx@sigxcpu.org>
 <cb9618ccc777ddf1c4abf62d6d49af20251f5497.1577272495.git.agx@sigxcpu.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="gneEPciiIl/aKvOT"
Content-Disposition: inline
In-Reply-To: <cb9618ccc777ddf1c4abf62d6d49af20251f5497.1577272495.git.agx@sigxcpu.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--gneEPciiIl/aKvOT
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed 2019-12-25 12:16:37, Guido G=FCnther wrote:
> This moves lm3692x_init so it can be used from
> lm3692x_brightness_set. Rename to lm3692_leds_enable to pair up
> with lm3692x_leds_disable. No functional change.
>=20
> Signed-off-by: Guido G=FCnther <agx@sigxcpu.org>

Acked-by: Pavel Machek <pavel@ucw.cz>

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--gneEPciiIl/aKvOT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl4EiC4ACgkQMOfwapXb+vIbkwCglvy/WjYt2jrv5+ZQ9fuYDfTS
ZRwAoJQSVbUVqUtWgyeNOZyhlWm/PjXn
=u4NE
-----END PGP SIGNATURE-----

--gneEPciiIl/aKvOT--
