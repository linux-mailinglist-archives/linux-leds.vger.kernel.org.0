Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BDCB7B8F37
	for <lists+linux-leds@lfdr.de>; Fri, 20 Sep 2019 13:47:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2438251AbfITLrp (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 20 Sep 2019 07:47:45 -0400
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:35183 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2438250AbfITLro (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 20 Sep 2019 07:47:44 -0400
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
        id D44FE814A7; Fri, 20 Sep 2019 13:47:28 +0200 (CEST)
Date:   Fri, 20 Sep 2019 13:47:43 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Dan Murphy <dmurphy@ti.com>, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/5] leds: lm3692x: Don't overwrite return value in
 error path
Message-ID: <20190920114743.GA21835@amd>
References: <cover.1568957104.git.agx@sigxcpu.org>
 <e3ee36845c1555bd722807f85329341d5ec9728e.1568957104.git.agx@sigxcpu.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="Qxx1br4bt0+wmkIi"
Content-Disposition: inline
In-Reply-To: <e3ee36845c1555bd722807f85329341d5ec9728e.1568957104.git.agx@sigxcpu.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--Qxx1br4bt0+wmkIi
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu 2019-09-19 22:27:04, Guido G=FCnther wrote:
> The driver currently reports successful initialization on every failure
> as long as it's able to power off the regulator. Don't check the return
> value of regulator_disable to avoid that.
>=20
> Signed-off-by: Guido G=FCnther <agx@sigxcpu.org>

Acked-by: Pavel Machek <pavel@ucw.cz>
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--Qxx1br4bt0+wmkIi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl2EvF8ACgkQMOfwapXb+vL38ACfYAEHteQpE9xQEhFdMg1L5EpJ
e8cAn3bR4zgHOl0VqlkyAhhqaBR59NzF
=nvK3
-----END PGP SIGNATURE-----

--Qxx1br4bt0+wmkIi--
