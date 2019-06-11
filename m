Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 58C163C852
	for <lists+linux-leds@lfdr.de>; Tue, 11 Jun 2019 12:13:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405234AbfFKKNY (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 11 Jun 2019 06:13:24 -0400
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:32863 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404766AbfFKKNY (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 11 Jun 2019 06:13:24 -0400
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
        id 6BDCC8023A; Tue, 11 Jun 2019 12:13:12 +0200 (CEST)
Date:   Tue, 11 Jun 2019 12:13:22 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Oleh Kravchenko <oleg@kaa.org.ua>
Cc:     linux-leds@vger.kernel.org
Subject: Re: [PATCH v3 2/2] Simplify LED registeration by
 devm_led_classdev_register()
Message-ID: <20190611101322.GB7526@amd>
References: <20190610173206.8060-1-oleg@kaa.org.ua>
 <20190610173206.8060-2-oleg@kaa.org.ua>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="LpQ9ahxlCli8rRTG"
Content-Disposition: inline
In-Reply-To: <20190610173206.8060-2-oleg@kaa.org.ua>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--LpQ9ahxlCli8rRTG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon 2019-06-10 20:32:06, Oleh Kravchenko wrote:
> Because of devm_led_classdev_register() doesn't require device node point=
er.
> This patch reduce little bit code size and complexity.
>=20
> Signed-off-by: Oleh Kravchenko <oleg@kaa.org.ua>

Acked-by: Pavel Machek <pavel@ucw.cz>

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--LpQ9ahxlCli8rRTG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlz/fsIACgkQMOfwapXb+vISawCcCYZdNLFim7KKb7FhuqpoElU1
2kcAoJNDhwKSFcg8AoAvbZRt3DF48bAu
=cjf3
-----END PGP SIGNATURE-----

--LpQ9ahxlCli8rRTG--
