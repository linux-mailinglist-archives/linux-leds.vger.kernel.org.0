Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C5671ADE94
	for <lists+linux-leds@lfdr.de>; Fri, 17 Apr 2020 15:42:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730725AbgDQNjv (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 17 Apr 2020 09:39:51 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:33552 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730601AbgDQNjv (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 17 Apr 2020 09:39:51 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id A10DB1C01FA; Fri, 17 Apr 2020 15:39:49 +0200 (CEST)
Date:   Fri, 17 Apr 2020 15:39:49 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Dan Murphy <dmurphy@ti.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        linux-leds@vger.kernel.org
Subject: Re: [PATCH] leds: tlc591xxt: hide error on EPROBE_DEFER
Message-ID: <20200417133948.GD19028@duo.ucw.cz>
References: <20200417113758.24924-1-tomi.valkeinen@ti.com>
 <4deb542b-211e-edb3-637b-c3939fb26fa3@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="FFoLq8A0u+X9iRU8"
Content-Disposition: inline
In-Reply-To: <4deb542b-211e-edb3-637b-c3939fb26fa3@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--FFoLq8A0u+X9iRU8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri 2020-04-17 07:55:25, Dan Murphy wrote:
> Tomi
>=20
> On 4/17/20 6:37 AM, Tomi Valkeinen wrote:
> > If devm_led_classdev_register_ext() fails with EPROBE_DEFER, we get:
> >=20
> > tlc591xx 0-0040: couldn't register LED (null)
> >=20
> > Only print the error if the error is something else than EPROBE_DEFER.
> >=20
> > Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>

> Reviewed-by: Dan Murphy <dmurphy@ti.com>

Thanks, applied.
									Pavel

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--FFoLq8A0u+X9iRU8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCXpmxpAAKCRAw5/Bqldv6
8nAvAKCDMh7NS1iIOoPNo3SmBjZzuL405gCggDhX0nrqzMfo25O3B9jhXs1SBlI=
=BRrN
-----END PGP SIGNATURE-----

--FFoLq8A0u+X9iRU8--
