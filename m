Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7999D14FED4
	for <lists+linux-leds@lfdr.de>; Sun,  2 Feb 2020 20:09:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726912AbgBBTJq (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 2 Feb 2020 14:09:46 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:57726 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726909AbgBBTJq (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 2 Feb 2020 14:09:46 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 8210C1C036E; Sun,  2 Feb 2020 20:09:44 +0100 (CET)
Date:   Sun, 2 Feb 2020 20:09:43 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Linus Torvalds <torvalds@linux-foundation.org>,
        kernel list <linux-kernel@vger.kernel.org>,
        jacek.anaszewski@gmail.com, linux-leds@vger.kernel.org
Subject: [GIT PULL] LEDs changes for v5.6-rc1
Message-ID: <20200202190943.GA4506@duo.ucw.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="IJpNTDwzlM2Ie8A6"
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--IJpNTDwzlM2Ie8A6
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

The following changes since commit d1eef1c619749b2a57e514a3fa67d9a516ffa919:

  Linux 5.5-rc2 (2019-12-15 15:16:08 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/pavel/linux-leds.git/ tags/=
leds-5.6-rc1

for you to fetch changes up to 260718b3a35d23fe89d27cc7b5e8bd30f4bba1aa:

  leds: lm3692x: Disable chip on brightness 0 (2020-01-07 14:09:27 +0100)

----------------------------------------------------------------
LED updates for 5.6-rc1.

Some of these changes are bugfixes already merged in v5.5, but I'd
have to rebase the for-next branch, and git merge handles that ok, so
I did not do that.

Best regards,
								Pavel

----------------------------------------------------------------
Bartosz Golaszewski (1):
      led: max77650: add of_match table

Guido G=FCnther (7):
      dt: bindings: lm3692x: Add ti,ovp-microvolt property
      leds: lm3692x: Allow to configure over voltage protection
      dt: bindings: lm3692x: Add led-max-microamp property
      leds: lm3692x: Make sure we don't exceed the maximum LED current
      leds: lm3692x: Move lm3692x_init and rename to lm3692x_leds_enable
      leds: lm3692x: Split out lm3692x_leds_disable
      leds: lm3692x: Disable chip on brightness 0

Jacek Anaszewski (1):
      leds: gpio: Fix uninitialized gpio label for fwnode based probe

Jean-Jacques Hiblot (2):
      leds: Add managed API to get a LED from a device driver
      leds: populate the device's of_node

Linus Walleij (1):
      leds: bd2802: Convert to use GPIO descriptors

Pavel (2):
      leds: lm3532: use extended registration so that LED can be used for b=
acklight
      leds: lm3532: add pointer to documentation and fix typo

Pavel Machek (3):
      ledtrig-pattern: fix email address quoting in MODULE_AUTHOR()
      leds: rb532: cleanup whitespace
      leds: lm3642: remove warnings for bad strtol, cleanup gotos

Sakari Ailus (1):
      leds-as3645a: Drop fwnode reference on ignored node

Sven Van Asbroeck (2):
      leds: tps6105x: add driver for MFD chip LED mode
      dt-bindings: mfd: update TI tps6105x chip bindings

Tomi Valkeinen (1):
      leds: Add of_led_get() and led_put()

Zahari Petkov (1):
      leds: pca963x: Fix open-drain initialization

 .../devicetree/bindings/leds/leds-lm3692x.txt      |   8 +
 Documentation/devicetree/bindings/mfd/tps6105x.txt |  47 +++++-
 drivers/leds/Kconfig                               |  10 ++
 drivers/leds/Makefile                              |   1 +
 drivers/leds/led-class.c                           |  97 ++++++++++-
 drivers/leds/leds-as3645a.c                        |   3 +-
 drivers/leds/leds-bd2802.c                         |  27 ++--
 drivers/leds/leds-gpio.c                           |  10 +-
 drivers/leds/leds-lm3532.c                         |  11 +-
 drivers/leds/leds-lm3642.c                         |  37 ++---
 drivers/leds/leds-lm3692x.c                        | 180 ++++++++++++++---=
----
 drivers/leds/leds-max77650.c                       |   7 +
 drivers/leds/leds-pca963x.c                        |   8 +-
 drivers/leds/leds-rb532.c                          |   1 -
 drivers/leds/leds-tps6105x.c                       |  89 ++++++++++
 drivers/leds/trigger/ledtrig-pattern.c             |   4 +-
 include/linux/leds-bd2802.h                        |   1 -
 include/linux/leds.h                               |   6 +
 18 files changed, 447 insertions(+), 100 deletions(-)
 create mode 100644 drivers/leds/leds-tps6105x.c


--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--IJpNTDwzlM2Ie8A6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCXjcedwAKCRAw5/Bqldv6
8tzMAJ9EBhERsZAkXBI3gtdxfgo7ImxnGACgmbf6TYHBhosnircPzkfwiNE6os8=
=6qGe
-----END PGP SIGNATURE-----

--IJpNTDwzlM2Ie8A6--
