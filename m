Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F60422C329
	for <lists+linux-leds@lfdr.de>; Fri, 24 Jul 2020 12:32:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726520AbgGXKcB (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 24 Jul 2020 06:32:01 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:45022 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726329AbgGXKcA (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 24 Jul 2020 06:32:00 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 6BD571C0BD2; Fri, 24 Jul 2020 12:31:58 +0200 (CEST)
Date:   Fri, 24 Jul 2020 12:31:58 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     linux-leds@vger.kernel.org
Subject: TODO list for LED subsystem in near future
Message-ID: <20200724103158.g32wtdmirki3urlr@duo.ucw.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="iwpish57cw2ikszx"
Content-Disposition: inline
User-Agent: NeoMutt/20180716
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--iwpish57cw2ikszx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

Here's a bit of todos. I'm thinking about putting in into the tree as
drivers/leds/TODO. Comments? Someone willing to help?

Best regards,
								Pavel

-*- org -*-

* Review atomicity requirements in LED subsystem

Calls that may and that may not block are mixed in same structure, and
semantics is sometimes non-intuitive. (For example blink callback may
not sleep.) Review the requirements for any bugs and document them
clearly.

* LED names are still a mess

No two LEDs have same name, so the names are probably unusable for the
userland. Nudge authors into creating common LED names for common
functionality.

? Perhaps check for known LED names during boot, and warn if there are
LEDs not on the list?

* Split drivers into subdirectories

The number of drivers is getting big, and driver for on/off LED on a
i/o port is really quite different from camera flash LED, which is
really different from driver for RGB color LED that can run its own
microcode. Split the drivers somehow.

* Figure out what to do with RGB leds

Multicolor does not really know about LED color. In particular,
there's no way to make LED "white".

RGB LEDs are quite common, and it would be good to be able to turn LED
white and to turn it into any arbitrary color. It is essential that
userspace is able to set arbitrary colors, and it might be good to
have that ability from kernel, too... to allow full-color triggers.

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--iwpish57cw2ikszx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCXxq4ngAKCRAw5/Bqldv6
8m+6AJ4xguNsi+XVKciX89XDZR714EaWOgCeNVAGPtj+1rO64kHMQj6MnXfpfDE=
=SgCN
-----END PGP SIGNATURE-----

--iwpish57cw2ikszx--
