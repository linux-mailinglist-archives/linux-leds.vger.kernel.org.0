Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 82A051ADD99
	for <lists+linux-leds@lfdr.de>; Fri, 17 Apr 2020 14:50:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727877AbgDQMuS (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 17 Apr 2020 08:50:18 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:56980 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729876AbgDQMuR (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 17 Apr 2020 08:50:17 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 426E21C01FA; Fri, 17 Apr 2020 14:50:16 +0200 (CEST)
Date:   Fri, 17 Apr 2020 14:50:15 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Dan Murphy <dmurphy@ti.com>, linux-leds@vger.kernel.org,
        NeilBrown <neilb@suse.com>
Subject: Re: [PATCH] leds: tca6507: Include the right header
Message-ID: <20200417125015.GB19028@duo.ucw.cz>
References: <20200415150837.188659-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="tjCHc7DPkfUGtrlw"
Content-Disposition: inline
In-Reply-To: <20200415150837.188659-1-linus.walleij@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--tjCHc7DPkfUGtrlw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> The TCA6507 optionally presents a GPIO controller, so include
> <linux/gpio/driver.h> instead of the legacy <linux/gpio.h>.
>=20
> Cc: NeilBrown <neilb@suse.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

I applied this and other include fixes.

Thanks,
									Pavel
								=09

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--tjCHc7DPkfUGtrlw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCXpmmBwAKCRAw5/Bqldv6
8r1VAKCZghyu5XeDAJpcWwx33nmzOPTvxgCeIpSs5qntCwqKNowarRj2UXk3Beg=
=QP3O
-----END PGP SIGNATURE-----

--tjCHc7DPkfUGtrlw--
