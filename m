Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 28DCC1A08C2
	for <lists+linux-leds@lfdr.de>; Tue,  7 Apr 2020 09:57:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726030AbgDGH54 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 7 Apr 2020 03:57:56 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:39888 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727384AbgDGH54 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 7 Apr 2020 03:57:56 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id B75CA1C4A77; Tue,  7 Apr 2020 09:57:53 +0200 (CEST)
Date:   Tue, 7 Apr 2020 09:57:53 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Linus Torvalds <torvalds@linux-foundation.org>,
        kernel list <linux-kernel@vger.kernel.org>,
        jacek.anaszewski@gmail.com, linux-leds@vger.kernel.org
Subject: [GIT PULL] LEDs changes for v5.7-rc1
Message-ID: <20200407075753.GA19187@amd.ucw.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="tThc/1wpZn/ma/RB"
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--tThc/1wpZn/ma/RB
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


The following changes since commit 11a48a5a18c63fd7621bb050228cebf13566e4d8:

  Linux 5.6-rc2 (2020-02-16 13:16:59 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/pavel/linux-leds.git/ tags/=
leds-5.7-rc1

for you to fetch changes up to 64ed6588c2ea618d3f9ca9d8b365ae4c19f76225:

  leds: core: Fix warning message when init_data (2020-04-06 23:12:08 +0200)

----------------------------------------------------------------
LED tree changes for 5.7-rc1.

One new driver, some driver changes, and some late minute cleanups --
but those are just whitespace so should be okay. There are some major
changes being prepared (multicolor, triggers) so next releas likely
will be more interesting.

----------------------------------------------------------------
Colin Ian King (2):
      leds: lm3697: fix spelling mistake "To" -> "Too"
      leds: lm3532: make bitfield 'enabled' unsigned

Denis Osterland-Heim (2):
      leds: pwm: remove header
      leds: pwm: remove useless pwm_period_ns

Gustavo A. R. Silva (2):
      leds: leds-is31fl32xx: Replace zero-length array with flexible-array =
member
      leds: leds-pwm: Replace zero-length array with flexible-array member

Linus Walleij (2):
      leds: ns2: Absorb platform data
      leds: ns2: Convert to GPIO descriptors

Pavel Machek (4):
      leds: ip30: label power LED as such
      leds: old enums are not really applicable to new code
      leds: sort Makefile entries
      leds: make functions easier to understand

Ricardo Ribalda Delgado (1):
      leds: core: Fix warning message when init_data

Thomas Bogendoerfer (1):
      leds: add SGI IP30 led support

Uwe Kleine-K=F6nig (2):
      leds: pwm: simplify if condition
      leds: pwm: convert to atomic PWM API

YueHaibing (1):
      leds: leds-bd2802: remove set but not used variable 'pdata'

 drivers/leds/Kconfig                            | 11 +++
 drivers/leds/Makefile                           | 99 +++++++++++++--------=
----
 drivers/leds/led-class.c                        |  2 +-
 drivers/leds/leds-bd2802.c                      |  2 -
 drivers/leds/leds-ip30.c                        | 86 +++++++++++++++++++++
 drivers/leds/leds-is31fl32xx.c                  |  2 +-
 drivers/leds/leds-lm3532.c                      |  2 +-
 drivers/leds/leds-lm3697.c                      |  2 +-
 drivers/leds/leds-ns2.c                         | 99 ++++++++++++++-------=
----
 drivers/leds/leds-pwm.c                         | 55 +++++---------
 include/dt-bindings/leds/common.h               | 36 ++++++---
 include/linux/leds.h                            |  1 +
 include/linux/leds_pwm.h                        | 22 ------
 include/linux/platform_data/leds-kirkwood-ns2.h | 38 ----------
 14 files changed, 254 insertions(+), 203 deletions(-)
 create mode 100644 drivers/leds/leds-ip30.c
 delete mode 100644 include/linux/leds_pwm.h
 delete mode 100644 include/linux/platform_data/leds-kirkwood-ns2.h

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--tThc/1wpZn/ma/RB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCXowygQAKCRAw5/Bqldv6
8ma8AJ4nXcNAuACUV/G5Z9gmgewPDLMsmgCeO05Hob0TYW0vbAwC3qw6leeQhsY=
=u6Zu
-----END PGP SIGNATURE-----

--tThc/1wpZn/ma/RB--
