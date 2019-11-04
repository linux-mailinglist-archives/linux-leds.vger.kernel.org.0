Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 364C9EDB64
	for <lists+linux-leds@lfdr.de>; Mon,  4 Nov 2019 10:16:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728143AbfKDJQG (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 4 Nov 2019 04:16:06 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:33890 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727989AbfKDJQG (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 4 Nov 2019 04:16:06 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 9DB8E1C06CF; Mon,  4 Nov 2019 10:09:48 +0100 (CET)
Date:   Mon, 4 Nov 2019 10:09:48 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Riku Voipio <riku.voipio@iki.fi>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Dan Murphy <dmurphy@ti.com>, linux-leds@vger.kernel.org
Subject: Re: [PATCH 01/10] leds: pca953x: Use of_device_get_match_data()
Message-ID: <20191104090948.GH12355@duo.ucw.cz>
References: <20191004214334.149976-1-swboyd@chromium.org>
 <20191004214334.149976-2-swboyd@chromium.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="tT3UgwmDxwvOMqfu"
Content-Disposition: inline
In-Reply-To: <20191004214334.149976-2-swboyd@chromium.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--tT3UgwmDxwvOMqfu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> This driver can use the of_device_get_match_data() API to simplify the
> code. Replace calls to of_match_device() with this newer API under the
> assumption that where it is called will be when we know the device is
> backed by a DT node. This nicely avoids referencing the match table when
> it is undefined with configurations where CONFIG_OF=3Dn.


> Please ack or pick for immediate merge so the last patch can be
  merged.

I see nothing obviously wrong, so...

Acked-by: Pavel Machek <pavel@ucw.cz>

=2E.. but it did not apply on top of leds-next tree.

Best regards,
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--tT3UgwmDxwvOMqfu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCXb/q3AAKCRAw5/Bqldv6
8s7OAJ9ckVxuB03nzIBp5YGyOjKGWbJUbwCbBI3dtPnhr0M5qongHi/gtWVsHX0=
=+nqt
-----END PGP SIGNATURE-----

--tT3UgwmDxwvOMqfu--
