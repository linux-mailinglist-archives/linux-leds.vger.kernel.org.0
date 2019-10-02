Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0509AC9058
	for <lists+linux-leds@lfdr.de>; Wed,  2 Oct 2019 20:03:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728000AbfJBSDc (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 2 Oct 2019 14:03:32 -0400
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:45141 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727268AbfJBSDc (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 2 Oct 2019 14:03:32 -0400
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
        id B49EE802D9; Wed,  2 Oct 2019 20:03:14 +0200 (CEST)
Date:   Wed, 2 Oct 2019 20:03:28 +0200
From:   Pavel Machek <pavel@denx.de>
To:     Akinobu Mita <akinobu.mita@gmail.com>
Cc:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Dan Murphy <dmurphy@ti.com>
Subject: Re: [PATCH -next 0/2] leds: add substitutes for
 /sys/class/leds/<led>/trigger
Message-ID: <20191002180327.GA13492@amd>
References: <1570029181-11102-1-git-send-email-akinobu.mita@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="X1bOJ3K7DJ5YkBrT"
Content-Disposition: inline
In-Reply-To: <1570029181-11102-1-git-send-email-akinobu.mita@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--X1bOJ3K7DJ5YkBrT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> Reading /sys/class/leds/<led>/trigger returns all available LED triggers.
> However, this violates the "one value per file" rule of sysfs.
>=20
> This series provides a new /sys/devices/virtual/led-trigger/ directory and
> /sys/class/leds/<led>/current-trigger. The new api follows the "one value
> per file" rule of sysfs.

Lets not do this. We'll have to maintain the old interface, anyway, so
it does not really help.

Thanks,

									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--X1bOJ3K7DJ5YkBrT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl2U5m8ACgkQMOfwapXb+vJLOQCfaC+bQibVCrwNnM1twZAhfV6K
/vgAn0/ANRXMC6faiGgSOvA8tZyh1z8Y
=1/Zv
-----END PGP SIGNATURE-----

--X1bOJ3K7DJ5YkBrT--
