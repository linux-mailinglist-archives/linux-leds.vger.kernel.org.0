Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D23822E829
	for <lists+linux-leds@lfdr.de>; Mon, 27 Jul 2020 10:45:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726151AbgG0IpE (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 27 Jul 2020 04:45:04 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:35272 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726228AbgG0IpD (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 27 Jul 2020 04:45:03 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id CC3631C0BDE; Mon, 27 Jul 2020 10:45:00 +0200 (CEST)
Date:   Mon, 27 Jul 2020 10:45:00 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     marek.behun@nic.cz, jacek.anaszewski@gmail.com, dmurphy@ti.com,
        linux-leds@vger.kernel.org
Subject: We have multicolor, but should we turn it into RGB?
Message-ID: <20200727084500.GA15237@amd>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="Dxnq1zWXvFF0Q93v"
Content-Disposition: inline
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--Dxnq1zWXvFF0Q93v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

Multicolor is a bit too abstract. Yes, we can have
Green-Magenta-Ultraviolet LED, but so far all the LEDs we support are
RGB, and not even RGB-White or RGB-Yellow variants emerged.

Multicolor is not a good fit for RGB LED. It does not really know
about LED color.  In particular, there's no way to make LED "white".

Userspace is interested in knowing "this LED can produce arbitrary
color", which not all multicolor LEDs can.

	Proposal: let's add "rgb" to led_colors in
	drivers/leds/led-core.c, add corresponding device tree
	defines, and use that, instead of multicolor for RGB LEDs.

	We really need to do that now; "white" stuff can wait.

RGB LEDs are quite common, and it would be good to be able to turn LED
white and to turn it into any arbitrary color. It is essential that
userspace is able to set arbitrary colors, and it might be good to
have that ability from kernel, too... to allow full-color triggers.

Best regads,
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--Dxnq1zWXvFF0Q93v
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl8elAwACgkQMOfwapXb+vJUuwCggeiJPOu/l3+ayxLi6DY50zXq
6LQAnRy20Y0iz9FiAfY/ZaZ5qD5xWRop
=UarI
-----END PGP SIGNATURE-----

--Dxnq1zWXvFF0Q93v--
