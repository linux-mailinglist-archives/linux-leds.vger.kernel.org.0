Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 05FD01ADD9C
	for <lists+linux-leds@lfdr.de>; Fri, 17 Apr 2020 14:52:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729638AbgDQMwV (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 17 Apr 2020 08:52:21 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:57154 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729034AbgDQMwV (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 17 Apr 2020 08:52:21 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 85A721C01FB; Fri, 17 Apr 2020 14:52:19 +0200 (CEST)
Date:   Fri, 17 Apr 2020 14:52:19 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Dan Murphy <dmurphy@ti.com>, linux-leds@vger.kernel.org,
        Simon Guinot <simon.guinot@sequanux.org>
Subject: Re: [PATCH] leds: netxbig: Convert to use GPIO descriptors
Message-ID: <20200417125219.GC19028@duo.ucw.cz>
References: <20200415145139.155663-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="lCAWRPmW1mITcIfM"
Content-Disposition: inline
In-Reply-To: <20200415145139.155663-1-linus.walleij@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--lCAWRPmW1mITcIfM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> This converts the NetXbig LED driver to use GPIO descriptors
> instead of using the legacy interfaces in <linux/of_gpio.h>
> and <linux/gpio.h> to iteratively parse the device tree for
> global GPIO numbers.
>=20
> Cc: Simon Guinot <simon.guinot@sequanux.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Nothing obviously wrong here, but I'd not mind some testing.

Best regards,
									Pavel

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--lCAWRPmW1mITcIfM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCXpmmggAKCRAw5/Bqldv6
8sG0AJ4hPqPjq4nTcrCfiRMiea8E1SDwIgCgnotfz70cQYH3qQGN0VlTYi2Z6xU=
=GXZF
-----END PGP SIGNATURE-----

--lCAWRPmW1mITcIfM--
