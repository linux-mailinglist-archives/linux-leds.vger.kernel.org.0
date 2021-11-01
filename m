Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F153441A85
	for <lists+linux-leds@lfdr.de>; Mon,  1 Nov 2021 12:14:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231560AbhKALQd (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 1 Nov 2021 07:16:33 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:49698 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230520AbhKALQd (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 1 Nov 2021 07:16:33 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 029C31C0B87; Mon,  1 Nov 2021 12:13:59 +0100 (CET)
Date:   Mon, 1 Nov 2021 12:13:54 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Linus Torvalds <torvalds@linux-foundation.org>,
        kernel list <linux-kernel@vger.kernel.org>,
        jacek.anaszewski@gmail.com, linux-leds@vger.kernel.org
Subject: [GIT PULL] LEDs changes for v5.16-rc1
Message-ID: <20211101111354.GA29161@duo.ucw.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="h31gzZEtNLTqOjlF"
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--h31gzZEtNLTqOjlF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:

  Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/pavel/linux-leds.git/ tags/=
leds-5.16-rc1

for you to fetch changes up to 97b31c1f8eb865bc3aa5f4a08286a6406d782ea8:

  leds: trigger: Disable CPU trigger on PREEMPT_RT (2021-10-13 20:07:57 +02=
00)

----------------------------------------------------------------
Johannes pointed out that locking is still problematic with triggers
list, attempt to solve that by using RCU.

----------------------------------------------------------------
Arnd Bergmann (1):
      led-class-flash: fix -Wrestrict warning

Johannes Berg (1):
      leds: trigger: use RCU to protect the led_cdevs list

Sebastian Andrzej Siewior (1):
      leds: trigger: Disable CPU trigger on PREEMPT_RT

 drivers/leds/led-class-flash.c |  2 +-
 drivers/leds/led-triggers.c    | 41 +++++++++++++++++++++-----------------=
---
 drivers/leds/trigger/Kconfig   |  1 +
 include/linux/leds.h           |  2 +-
 4 files changed, 24 insertions(+), 22 deletions(-)

--=20
http://www.livejournal.com/~pavelmachek

--h31gzZEtNLTqOjlF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCYX/L8gAKCRAw5/Bqldv6
8g8VAJ4vn7jrW2sw1nmFXw/+Y/c05pI1rACfX5LlBlnk9zm9DCLrg5pXY2Fszg4=
=C8Y1
-----END PGP SIGNATURE-----

--h31gzZEtNLTqOjlF--
