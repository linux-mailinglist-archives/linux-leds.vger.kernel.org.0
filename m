Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF87B1EE453
	for <lists+linux-leds@lfdr.de>; Thu,  4 Jun 2020 14:19:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728321AbgFDMTI (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 4 Jun 2020 08:19:08 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:43626 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727944AbgFDMTH (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 4 Jun 2020 08:19:07 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 1D19A1C0BD2; Thu,  4 Jun 2020 14:19:06 +0200 (CEST)
Date:   Thu, 4 Jun 2020 14:19:05 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Linus Torvalds <torvalds@linux-foundation.org>,
        kernel list <linux-kernel@vger.kernel.org>,
        jacek.anaszewski@gmail.com, linux-leds@vger.kernel.org
Subject: [GIT PULL] LEDs changes for v5.8-rc1
Message-ID: <20200604121905.GA4931@duo.ucw.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="nFreZHaLTZJo0R7j"
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--nFreZHaLTZJo0R7j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

The following changes since commit 8f3d9f354286745c751374f5f1fcafee6b3f3136:

  Linux 5.7-rc1 (2020-04-12 12:35:55 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/pavel/linux-leds.git/ tags/=
leds-5.8-rc1

for you to fetch changes up to 59ea3c9faf3235b66bc31ca883d59ce58b8b2b27:

  leds: add aw2013 driver (2020-05-25 12:56:39 +0200)

----------------------------------------------------------------
LEDs pull request for 5.8-rc1.

New drivers: aw2013, sgm3140, ariel, and some fixes. Nothing much to
see here, next release should be more interesting.

----------------------------------------------------------------
Colin Ian King (1):
      leds: trigger: remove redundant assignment to variable ret

Denis Osterland-Heim (1):
      leds: pwm: check result of led_pwm_set() in led_pwm_add()

Linus Walleij (5):
      leds: lm355x: Drop surplus include
      leds: lp3952: Include the right header
      leds: lt3593: Drop surplus include
      leds: tca6507: Include the right header
      leds: netxbig: Convert to use GPIO descriptors

Lubomir Rintel (1):
      leds: ariel: Add driver for status LEDs on Dell Wyse 3020

Luca Weiss (2):
      dt-bindings: leds: Add binding for sgm3140
      leds: add sgm3140 driver

Nikita Travkin (2):
      dt-bindings: leds: Add binding for aw2013
      leds: add aw2013 driver

Tomi Valkeinen (1):
      leds: tlc591xxt: hide error on EPROBE_DEFER

 .../devicetree/bindings/leds/leds-aw2013.yaml      |  91 +++++
 .../devicetree/bindings/leds/leds-sgm3140.yaml     |  62 +++
 drivers/leds/Kconfig                               |  29 ++
 drivers/leds/Makefile                              |   3 +
 drivers/leds/leds-ariel.c                          | 133 +++++++
 drivers/leds/leds-aw2013.c                         | 436 +++++++++++++++++=
++++
 drivers/leds/leds-lm355x.c                         |   1 -
 drivers/leds/leds-lp3952.c                         |   2 +-
 drivers/leds/leds-lt3593.c                         |   1 -
 drivers/leds/leds-netxbig.c                        | 148 +++----
 drivers/leds/leds-pwm.c                            |  16 +-
 drivers/leds/leds-sgm3140.c                        | 320 +++++++++++++++
 drivers/leds/leds-tca6507.c                        |   2 +-
 drivers/leds/leds-tlc591xx.c                       |   5 +-
 drivers/leds/trigger/ledtrig-timer.c               |   4 +-
 15 files changed, 1173 insertions(+), 80 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-aw2013.yaml
 create mode 100644 Documentation/devicetree/bindings/leds/leds-sgm3140.yaml
 create mode 100644 drivers/leds/leds-ariel.c
 create mode 100644 drivers/leds/leds-aw2013.c
 create mode 100644 drivers/leds/leds-sgm3140.c

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--nFreZHaLTZJo0R7j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCXtjmuQAKCRAw5/Bqldv6
8u48AJ47Nco4fZbvtuQJwKDHcNHcgKOSRwCgtQoaxP2tbH7XobuH4CGyLtEFCNY=
=Asf1
-----END PGP SIGNATURE-----

--nFreZHaLTZJo0R7j--
