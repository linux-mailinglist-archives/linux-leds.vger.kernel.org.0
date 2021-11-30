Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C250463E04
	for <lists+linux-leds@lfdr.de>; Tue, 30 Nov 2021 19:49:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245587AbhK3SxG (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 30 Nov 2021 13:53:06 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:49392 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245602AbhK3Swi (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 30 Nov 2021 13:52:38 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id D1F431C0B7C; Tue, 30 Nov 2021 19:49:16 +0100 (CET)
Date:   Tue, 30 Nov 2021 19:49:15 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Dan Murphy <dmurphy@ti.com>, linux-leds@vger.kernel.org,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Krzysztof =?utf-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>,
        Rod Whitby <rod@whitby.id.au>
Subject: Re: [PATCH] leds: leds-fsg: Drop FSG3 LED driver
Message-ID: <20211130184915.GC30113@duo.ucw.cz>
References: <20211122102851.3139238-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="kfjH4zxOES6UT95V"
Content-Disposition: inline
In-Reply-To: <20211122102851.3139238-1-linus.walleij@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--kfjH4zxOES6UT95V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon 2021-11-22 11:28:51, Linus Walleij wrote:
> The board file using this driver has been deleted and the
> FSG3 LEDs can be modeled using a system controller and some
> register bit LEDs in the device tree so this driver is no
> longer needed.

Thank you, applied.

Best regards,
							Pavel
						=09
--=20
http://www.livejournal.com/~pavelmachek

--kfjH4zxOES6UT95V
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCYaZyKwAKCRAw5/Bqldv6
8pYvAJ9Glqp2RTt7SR9Y3idQn6VVA95flACfUj5d1TwURw8BouBzRiG5CqSBTlY=
=h6Ni
-----END PGP SIGNATURE-----

--kfjH4zxOES6UT95V--
