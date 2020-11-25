Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 020C12C4017
	for <lists+linux-leds@lfdr.de>; Wed, 25 Nov 2020 13:28:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729009AbgKYM0C (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 25 Nov 2020 07:26:02 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:43268 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729299AbgKYM0B (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 25 Nov 2020 07:26:01 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 849B71C0B7D; Wed, 25 Nov 2020 13:25:59 +0100 (CET)
Date:   Wed, 25 Nov 2020 13:25:59 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>
Cc:     linux-leds@vger.kernel.org, Dan Murphy <dmurphy@ti.com>
Subject: Re: [PATCH leds 5/5] leds: turris-omnia: check for LED_COLOR_ID_RGB
 instead LED_COLOR_ID_MULTI
Message-ID: <20201125122559.GG29328@amd>
References: <20201030023906.24259-1-kabel@kernel.org>
 <20201030023906.24259-5-kabel@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="/Zw+/jwnNHcBRYYu"
Content-Disposition: inline
In-Reply-To: <20201030023906.24259-5-kabel@kernel.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--/Zw+/jwnNHcBRYYu
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> LED core does not allow LED_COLOR_ID_MULTI for now and instead for RGB
> LEDs prefers LED_COLOR_ID_RGB.
>=20
> Signed-off-by: Marek Beh=FAn <kabel@kernel.org>
> Fixes: 77dce3a22e89 ("leds: disallow /sys/class/leds/*:multi:* for
> now")

Thanks for patches. I have applied all but 4/, that is for Rob I
guess.

Best regards,
								Pavel
							=09
--=20
http://www.livejournal.com/~pavelmachek

--/Zw+/jwnNHcBRYYu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl++TVcACgkQMOfwapXb+vI+wgCfWEHBbVCSosQK8637I9iMFH0S
k9cAoLSNF5g3eHL+JAOBII2UE7z0wcbd
=UkpK
-----END PGP SIGNATURE-----

--/Zw+/jwnNHcBRYYu--
