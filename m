Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E5E376AFB7
	for <lists+linux-leds@lfdr.de>; Tue, 16 Jul 2019 21:25:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728137AbfGPTZn (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 16 Jul 2019 15:25:43 -0400
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:47269 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726213AbfGPTZn (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 16 Jul 2019 15:25:43 -0400
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
        id 39AD780596; Tue, 16 Jul 2019 21:25:30 +0200 (CEST)
Date:   Tue, 16 Jul 2019 21:25:40 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     "Enrico Weigelt, metux IT consult" <info@metux.net>
Cc:     linux-kernel@vger.kernel.org, jacek.anaszewski@gmail.com,
        dmurphy@ti.com, linux-leds@vger.kernel.org
Subject: Re: [PATCH 2/6] leds: apu: drop enum_apu_led_platform_types
Message-ID: <20190716192540.GB10400@amd>
References: <1563202653-20994-1-git-send-email-info@metux.net>
 <1563202653-20994-3-git-send-email-info@metux.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="DBIVS5p969aUjpLe"
Content-Disposition: inline
In-Reply-To: <1563202653-20994-3-git-send-email-info@metux.net>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--DBIVS5p969aUjpLe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon 2019-07-15 16:57:29, Enrico Weigelt, metux IT consult wrote:
> From: Enrico Weigelt <info@metux.net>
>=20
> As this driver now only supports the APU1 boards, we don't need
> to differenciate between board types anymore. Therefore optimize
> away the now obsolete code.
>=20
> Signed-off-by: Enrico Weigelt <info@metux.net>

Acked-by: Pavel Machek <pavel@ucw.cz>

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--DBIVS5p969aUjpLe
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl0uJLQACgkQMOfwapXb+vL4YACgiCMEIRxi6f/W/VvJcSkEyG+R
w9UAoJ6WM3eL1Hdvz042Qxq3AsX8Ve3c
=4fLX
-----END PGP SIGNATURE-----

--DBIVS5p969aUjpLe--
