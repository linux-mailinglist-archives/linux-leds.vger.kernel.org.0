Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 75FB72770C8
	for <lists+linux-leds@lfdr.de>; Thu, 24 Sep 2020 14:20:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727534AbgIXMU3 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 24 Sep 2020 08:20:29 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:37306 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727530AbgIXMU3 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 24 Sep 2020 08:20:29 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 063311C0BDD; Thu, 24 Sep 2020 14:20:28 +0200 (CEST)
Date:   Thu, 24 Sep 2020 14:20:27 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Marek Behun <marek.behun@nic.cz>
Cc:     Dan Murphy <dmurphy@ti.com>, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] leds: lm3552: Fix warnings for undefined parameters
Message-ID: <20200924122027.GH3933@duo.ucw.cz>
References: <20200922190638.5323-1-dmurphy@ti.com>
 <20200923151443.595e7b43@nic.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="kHRd/tpU31Zn62xO"
Content-Disposition: inline
In-Reply-To: <20200923151443.595e7b43@nic.cz>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--kHRd/tpU31Zn62xO
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed 2020-09-23 15:14:43, Marek Behun wrote:
> Wrong subject, it says
>   lm3552
> but driver is called
>   lm3532
>=20
> Besides this:
>=20
> Reviewed-by: Marek Beh=FAn <kabel@kernel.org>

Thanks for review!

Best regards,
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--kHRd/tpU31Zn62xO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCX2yPCwAKCRAw5/Bqldv6
8oGuAKCQt03rbSVOgdaHU/1qQwkY8dlLrACfULyXFnjTJqkBW/vU9zT3s0JlXgg=
=y2R3
-----END PGP SIGNATURE-----

--kHRd/tpU31Zn62xO--
