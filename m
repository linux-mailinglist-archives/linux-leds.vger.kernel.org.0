Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5EE1D31F767
	for <lists+linux-leds@lfdr.de>; Fri, 19 Feb 2021 11:38:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229524AbhBSKha (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 19 Feb 2021 05:37:30 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:46076 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229636AbhBSKh0 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 19 Feb 2021 05:37:26 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 380671C0B80; Fri, 19 Feb 2021 11:36:29 +0100 (CET)
Date:   Fri, 19 Feb 2021 11:36:28 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Abanoub Sameh <abanoubsameh8@gmail.com>
Cc:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abanoub Sameh <abanoubsameh@protonmail.com>
Subject: Re: [PATCH] leds: led-core: Get rid of enum led_brightness
Message-ID: <20210219103628.GA19207@duo.ucw.cz>
References: <20201211204208.179981-1-abanoubsameh@protonmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="dDRMvlgZJXvWKvBx"
Content-Disposition: inline
In-Reply-To: <20201211204208.179981-1-abanoubsameh@protonmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--dDRMvlgZJXvWKvBx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> This gets rid of enum led_brightness in the main led files,
> because it is deprecated, and an unsigned int can be used instead.
>=20
> We can get rid of led_brightness completely and
> patches can also be supplied for the other drivers' files.
>=20
> Signed-off-by: Abanoub Sameh <abanoubsameh@protonmail.com>

Ok, thanks for doing this!

I applied the patch... and let's see what happens.

Best regards,
									Pavel
--=20
http://www.livejournal.com/~pavelmachek

--dDRMvlgZJXvWKvBx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCYC+UrAAKCRAw5/Bqldv6
8kawAJ9iJA9pCnERB6z5MHvj6amk+dBf8wCfS1gJHIFWKZeM2D0bJuZYCiaLT7g=
=Ge0J
-----END PGP SIGNATURE-----

--dDRMvlgZJXvWKvBx--
