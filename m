Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54FBD2DC353
	for <lists+linux-leds@lfdr.de>; Wed, 16 Dec 2020 16:42:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726544AbgLPPmj (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 16 Dec 2020 10:42:39 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:39916 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726543AbgLPPmj (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 16 Dec 2020 10:42:39 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 31C6D1C0B78; Wed, 16 Dec 2020 16:41:56 +0100 (CET)
Date:   Wed, 16 Dec 2020 16:41:55 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Linus Torvalds <torvalds@linux-foundation.org>,
        kernel list <linux-kernel@vger.kernel.org>,
        jacek.anaszewski@gmail.com, linux-leds@vger.kernel.org
Subject: [GIT PULL] LEDs changes for v5.11-rc1
Message-ID: <20201216154155.GA10814@duo.ucw.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="DocE+STaALJfprDB"
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--DocE+STaALJfprDB
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:

  Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/pavel/linux-leds.git/ tags/=
leds-5.11-rc1

for you to fetch changes up to 98650b0874171cc443251f7b369d3b1544db9d4e:

  leds: turris-omnia: check for LED_COLOR_ID_RGB instead LED_COLOR_ID_MULTI=
 (2020-11-25 13:25:28 +0100)

----------------------------------------------------------------
Changes for 5.11-rc1. Small cleanups/fixes mostly thanks to Marek,
nothing major made it in this time.

----------------------------------------------------------------
Alexander Dahl (1):
      dt-bindings: leds: Convert pwm to yaml

Christophe JAILLET (1):
      leds: lp50xx: Fix an error handling path in 'lp50xx_probe_dt()'

Marek Beh=FAn (5):
      Documentation: leds: remove invalidated information
      leds: turris-omnia: use constants instead of macros for color command
      leds: turris-omnia: wrap to 80 columns
      leds: turris-omnia: fix checkpatch warning
      leds: turris-omnia: check for LED_COLOR_ID_RGB instead LED_COLOR_ID_M=
ULTI

Yu Kuai (1):
      leds: netxbig: add missing put_device() call in netxbig_leds_get_of_p=
data()

 .../devicetree/bindings/leds/leds-pwm.txt          | 50 -------------
 .../devicetree/bindings/leds/leds-pwm.yaml         | 70 ++++++++++++++++++
 Documentation/leds/leds-class.rst                  | 10 ---
 drivers/leds/leds-lp50xx.c                         |  6 +-
 drivers/leds/leds-netxbig.c                        | 35 ++++++---
 drivers/leds/leds-turris-omnia.c                   | 85 +++++++++++-------=
----
 6 files changed, 139 insertions(+), 117 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/leds/leds-pwm.txt
 create mode 100644 Documentation/devicetree/bindings/leds/leds-pwm.yaml


--=20
http://www.livejournal.com/~pavelmachek

--DocE+STaALJfprDB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCX9oqwwAKCRAw5/Bqldv6
8slfAJ0RnK7eafd3cjyExcbvK4onptwZLgCfYbeqJ7zeRT1rwyH7khZJxzIepA8=
=JnjS
-----END PGP SIGNATURE-----

--DocE+STaALJfprDB--
