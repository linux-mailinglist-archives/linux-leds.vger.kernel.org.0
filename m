Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4B51E78A75
	for <lists+linux-leds@lfdr.de>; Mon, 29 Jul 2019 13:27:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387664AbfG2L1N (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 29 Jul 2019 07:27:13 -0400
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:55872 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387638AbfG2L1N (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 29 Jul 2019 07:27:13 -0400
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
        id 6D52B8029D; Mon, 29 Jul 2019 13:26:58 +0200 (CEST)
Date:   Mon, 29 Jul 2019 13:27:10 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Akinobu Mita <akinobu.mita@gmail.com>
Cc:     linux-block@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-scsi@vger.kernel.org,
        Frank Steiner <fsteiner-mail1@bio.ifi.lmu.de>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Dan Murphy <dmurphy@ti.com>, Jens Axboe <axboe@kernel.dk>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>
Subject: Re: [PATCH 2/3] scsi: mvsas: rename LED_* enums to SGPIO_LED_*
Message-ID: <20190729112710.GA396@amd>
References: <1564322446-28255-1-git-send-email-akinobu.mita@gmail.com>
 <1564322446-28255-3-git-send-email-akinobu.mita@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="qDbXVdCdHGoSgWSk"
Content-Disposition: inline
In-Reply-To: <1564322446-28255-3-git-send-email-akinobu.mita@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--qDbXVdCdHGoSgWSk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun 2019-07-28 23:00:45, Akinobu Mita wrote:
> The mvsas driver declares LED_* enums for enum sgpio_led_status. The
> LED_OFF and LED_ON enums cause redeclaration of enumerator with the
> LED subsystem's LED_OFF and LED_ON enums.
>=20
> This adds 'SGPIO_' prefix to these enums in mvsas driver.
>=20
> Cc: Frank Steiner <fsteiner-mail1@bio.ifi.lmu.de>
> Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>

Acked-by: Pavel Machek <pavel@ucw.cz>

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--qDbXVdCdHGoSgWSk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl0+2A0ACgkQMOfwapXb+vLLWwCbBY/opz3nYX9aGyOOPWePoT7O
w9QAn2P6Oxn9LYQobZLWPiYUDA+30eeU
=2B3X
-----END PGP SIGNATURE-----

--qDbXVdCdHGoSgWSk--
