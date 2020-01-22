Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E557B145CF6
	for <lists+linux-leds@lfdr.de>; Wed, 22 Jan 2020 21:17:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725933AbgAVURO (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 22 Jan 2020 15:17:14 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:52140 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725911AbgAVURO (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 22 Jan 2020 15:17:14 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id A85F71C0357; Wed, 22 Jan 2020 21:17:12 +0100 (CET)
Date:   Wed, 22 Jan 2020 21:17:11 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Linus Torvalds <torvalds@linux-foundation.org>,
        kernel list <linux-kernel@vger.kernel.org>,
        jacek.anaszewski@gmail.com, linux-leds@vger.kernel.org
Subject: [GIT PULL] LEDs changes for 5.5-rc8
Message-ID: <20200122201711.GA29496@amd>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="y0ulUmNC+osPPQO6"
Content-Disposition: inline
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--y0ulUmNC+osPPQO6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

The following changes since commit d1eef1c619749b2a57e514a3fa67d9a516ffa919:

  Linux 5.5-rc2 (2019-12-15 15:16:08 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/pavel/linux-leds.git/ tags/=
leds-5.5-rc8

for you to fetch changes up to 43108c72cf1d518f3ce62d3b1c8a9ffa38ddc28b:

  leds: lm3532: add pointer to documentation and fix typo (2020-01-22 21:08=
:24 +0100)

----------------------------------------------------------------
Changes for Linus for -rc8.

Jacek's commit is why I'm requesting this pull; it fixes regression in
debugging output in sysfs. Others are just bugfixes that should be
safe. Everything was in -next for while.

Now, I noticed one commit is from "Pavel" and it is supposed to be
=66rom "Pavel Machek". Can you pull it anyway, or should I redo the
request? Or feel free to edit/drop that commit.

Best regards,
								Pavel

----------------------------------------------------------------
Bartosz Golaszewski (1):
      led: max77650: add of_match table

Jacek Anaszewski (1):
      leds: gpio: Fix uninitialized gpio label for fwnode based probe

Pavel (1):
      leds: lm3532: add pointer to documentation and fix typo

Pavel Machek (2):
      ledtrig-pattern: fix email address quoting in MODULE_AUTHOR()
      leds: rb532: cleanup whitespace

Sakari Ailus (1):
      leds-as3645a: Drop fwnode reference on ignored node

 drivers/leds/leds-as3645a.c            |  3 ++-
 drivers/leds/leds-gpio.c               | 10 +++++++++-
 drivers/leds/leds-lm3532.c             |  3 ++-
 drivers/leds/leds-max77650.c           |  7 +++++++
 drivers/leds/leds-rb532.c              |  1 -
 drivers/leds/trigger/ledtrig-pattern.c |  4 ++--
 6 files changed, 22 insertions(+), 6 deletions(-)

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--y0ulUmNC+osPPQO6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl4orccACgkQMOfwapXb+vIhHACfUZ9wQ9GkIKpyxLKk2Rz93ne0
GSMAn3v/CdOgceIvlx3tgc4WSrYfAEnb
=VROh
-----END PGP SIGNATURE-----

--y0ulUmNC+osPPQO6--
