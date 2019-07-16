Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1B2F96AFC4
	for <lists+linux-leds@lfdr.de>; Tue, 16 Jul 2019 21:26:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388666AbfGPT0g (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 16 Jul 2019 15:26:36 -0400
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:47284 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726213AbfGPT0g (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 16 Jul 2019 15:26:36 -0400
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
        id 3DB1E80597; Tue, 16 Jul 2019 21:26:23 +0200 (CEST)
Date:   Tue, 16 Jul 2019 21:26:33 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     "Enrico Weigelt, metux IT consult" <info@metux.net>
Cc:     linux-kernel@vger.kernel.org, jacek.anaszewski@gmail.com,
        dmurphy@ti.com, linux-leds@vger.kernel.org
Subject: Re: [PATCH 4/6] leds: apu: drop profile field from priv data
Message-ID: <20190716192633.GD10400@amd>
References: <1563202653-20994-1-git-send-email-info@metux.net>
 <1563202653-20994-5-git-send-email-info@metux.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="bjuZg6miEcdLYP6q"
Content-Disposition: inline
In-Reply-To: <1563202653-20994-5-git-send-email-info@metux.net>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--bjuZg6miEcdLYP6q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon 2019-07-15 16:57:31, Enrico Weigelt, metux IT consult wrote:
> From: Enrico Weigelt <info@metux.net>
>=20
> As this driver now only supports the APU1 boards, we don't need
> to handle profiles anymore and just can use the only one global
> array directly.
>=20
> Signed-off-by: Enrico Weigelt <info@metux.net>

Acked-by: Pavel Machek <pavel@ucw.cz>

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--bjuZg6miEcdLYP6q
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl0uJOkACgkQMOfwapXb+vJlxwCfTe0X3Kn5pvy1kzHuSGI1cLP/
Gf0AnilJ2914KBqSCHlUzbf1SO05dsQI
=AES0
-----END PGP SIGNATURE-----

--bjuZg6miEcdLYP6q--
