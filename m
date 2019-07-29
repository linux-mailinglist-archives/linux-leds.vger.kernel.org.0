Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 61D0978A7C
	for <lists+linux-leds@lfdr.de>; Mon, 29 Jul 2019 13:27:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387638AbfG2L1a (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 29 Jul 2019 07:27:30 -0400
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:55886 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387629AbfG2L1a (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 29 Jul 2019 07:27:30 -0400
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
        id 49605802A0; Mon, 29 Jul 2019 13:27:16 +0200 (CEST)
Date:   Mon, 29 Jul 2019 13:27:28 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Akinobu Mita <akinobu.mita@gmail.com>
Cc:     linux-block@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-scsi@vger.kernel.org,
        Frank Steiner <fsteiner-mail1@bio.ifi.lmu.de>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Dan Murphy <dmurphy@ti.com>, Jens Axboe <axboe@kernel.dk>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        GOTO Masanori <gotom@debian.or.jp>,
        YOKOTA Hiroshi <yokota@netlab.is.tsukuba.ac.jp>
Subject: Re: [PATCH 3/3] scsi: nsp32: rename LED_* macros to EXT_PORT_LED_*
Message-ID: <20190729112728.GB396@amd>
References: <1564322446-28255-1-git-send-email-akinobu.mita@gmail.com>
 <1564322446-28255-4-git-send-email-akinobu.mita@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="gj572EiMnwbLXET9"
Content-Disposition: inline
In-Reply-To: <1564322446-28255-4-git-send-email-akinobu.mita@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--gj572EiMnwbLXET9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun 2019-07-28 23:00:46, Akinobu Mita wrote:
> The nsp32 driver defines LED_ON and LED_OFF macros for EXT_PORT_DDR or
> EXT_PORT register values.  The LED_OFF and LED_ON macros conflict with
> the LED subsystem's LED_OFF and LED_ON enums.
>=20
> This renames these LED_* macros to EXT_PORT_LED_* in nsp32 driver.
>=20
> Cc: Frank Steiner <fsteiner-mail1@bio.ifi.lmu.de>
> Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>

Acked-by: Pavel Machek <pavel@ucw.cz>

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--gj572EiMnwbLXET9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl0+2B8ACgkQMOfwapXb+vKNrQCfV6ovrkayd3uO5M4FskCe/Maq
xNIAoKzQtQP1KbG8Doy2R8Ple3GU+K5X
=bZYr
-----END PGP SIGNATURE-----

--gj572EiMnwbLXET9--
