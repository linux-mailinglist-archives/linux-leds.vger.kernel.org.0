Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1360714267
	for <lists+linux-leds@lfdr.de>; Sun,  5 May 2019 23:11:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726905AbfEEVLU (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 5 May 2019 17:11:20 -0400
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:50272 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726636AbfEEVLU (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 5 May 2019 17:11:20 -0400
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
        id CF8CC803A9; Sun,  5 May 2019 23:11:08 +0200 (CEST)
Date:   Sun, 5 May 2019 23:11:17 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     linux-leds@vger.kernel.org, jacek.anaszewski@gmail.com
Subject: LEDs on thinkpad
Message-ID: <20190505211117.GA30428@amd>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="ZGiS0Q5IWpPtfppv"
Content-Disposition: inline
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--ZGiS0Q5IWpPtfppv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

Thinking about standartized names... would we have good mapping for
thinkpad in the "new" framework?

									Pavel

tpacpi::power -- system is on
tpacpi::standby -- system is sleeping, blinking when system is
		   entering hibernation
tpacpi:green:batt -- battery LED, off when battery is not present,
		     yellow / blinking when it is low.
tpacpi:orange:batt

tpacpi::thinklight -- keyboard light (on top of display) -- would we
call it kbd_backlight even if it is not technically a backlight?

It also has these leds not controlled by software (in my config):

"AC is connected"
"disk activity"
"bluetooth"
"wifi"

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--ZGiS0Q5IWpPtfppv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlzPUXUACgkQMOfwapXb+vKwIgCfT8zAy/6BL9ooc6bIsdbwx/4q
LA4AoLa6uq0cvTGbRFxMruHSHah3tyKt
=OjVq
-----END PGP SIGNATURE-----

--ZGiS0Q5IWpPtfppv--
