Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A0C826CF81
	for <lists+linux-leds@lfdr.de>; Thu, 17 Sep 2020 01:18:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726610AbgIPXQz (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 16 Sep 2020 19:16:55 -0400
Received: from mail.nic.cz ([217.31.204.67]:53728 "EHLO mail.nic.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726338AbgIPXQy (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Wed, 16 Sep 2020 19:16:54 -0400
Received: from dellmb.labs.office.nic.cz (unknown [IPv6:2001:1488:fffe:6:cac7:3539:7f1f:463])
        by mail.nic.cz (Postfix) with ESMTP id EE03A14087C;
        Thu, 17 Sep 2020 01:16:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
        t=1600298212; bh=Qzc2oeb5j3zVH60aJj9N0ARs+prgEmmPeOQqVCkt/KE=;
        h=From:To:Date;
        b=SLUTaYh2xQ9QgjWtW1B+v0AoTBW9QbFJefLZ+s7jVFr0pyu2inlJNRAdlDeNGlqX8
         ZqjibhVIwWjLoOX+Rdd59vQfjronAaTPxPhdJGzL7cn7POB4xCu2C2Hs/cSh03ReUD
         JmLz+PnowTwfplSWZjsfd3VG5z/vUrMw5TA2BTVk=
From:   =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>
To:     linux-leds@vger.kernel.org
Cc:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        =?UTF-8?q?Ond=C5=99ej=20Jirman?= <megous@megous.com>,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org,
        =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>,
        =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        David Rivshin <drivshin@allworx.com>,
        "H . Nikolaus Schaller" <hns@goldelico.com>,
        Jaedon Shin <jaedon.shin@gmail.com>,
        John Crispin <john@phrozen.org>,
        Kevin Cernekee <cernekee@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Ryder Lee <ryder.lee@mediatek.com>,
        Sean Wang <sean.wang@mediatek.com>,
        Simon Guinot <sguinot@lacie.com>,
        Simon Guinot <simon.guinot@sequanux.org>,
        Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
        Vincent Donnefort <vdonnefort@gmail.com>
Subject: [PATCH leds v1 00/10] Start moving parsing of `linux,default-trigger` to LED core (a cleanup of LED drivers)
Date:   Thu, 17 Sep 2020 01:16:40 +0200
Message-Id: <20200916231650.11484-1-marek.behun@nic.cz>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.nic.cz
X-Spam-Status: No, score=0.00
X-Spamd-Bar: /
X-Virus-Scanned: clamav-milter 0.102.2 at mail
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi,

this series is also available at
  https://git.kernel.org/pub/scm/linux/kernel/git/kabel/linux.git/log/?h=leds-cleanup-for-pavel

this is a cleanup of some LED subsystem drivers. The main reason behind
this is that I wanted to avoid code repetition by moving the parsing
of `linux,default-trigger` DT property from specific drivers to LED
core. Before this series 32 drivers parse this property (31 in
drivers/leds and one in drivers/input/keyboard/cap11xx.c).
After applying this series only 10 drivers are parsing this property.

The reason is that in discussion [1] Rob Herring says that
`linux,default-trigger` DT property is deprecated in favor of the
`function` DT property. This makes sense in a way since DT should not
be Linux specific.

After all drivers are converted we can maybe start work on slow
deprecation of this property. I do realize that we can't take it away,
but we can at least convert device trees in Linux repository to stop
using it in favor of `function` (and for default-on trigger in favor
of the `default-state` DT property), and print a deprecation warning
to the user when this `linux,default-trigger` property is present.

I wanted to prepare the way for slow deprecation of the DT property,
but it turns out that it is more difficult.

The first thing I wanted to do was to move the parsing of the
`linux,default-trigger` property to LED core. Currently many drivers
do this themselves. But it can't be moved that simply.

The first patch in this series adds the parsing of this DT property
into led_classdev_register_ext. If fwnode is given in init_data, the
property is read. This patch also removes the parsing of this property
from drivers where led_classdev_register_ext is already called. These
are:
  an30259a, aw2013, cr0014114, el15203000, gpio, lm3532, lm3692x,
  lp8860, lt3593, tlc591xx and turris-omnia.

Patches 2 to 6 do a simple conversion of some drivers to use
led_classdev_register_ext. These drivers are:
  bcm6328, bcm6358, lm3697, max77650, mt6323 and pm8058.

In patches 7 to 10 I did a bigger refactor: either they first parsed
all LED nodes and only after that started registering them, or they
used too deep nesting or were weird in some other ways:
  is31fl32xx, is31fl319x, lm36274 and ns2.

There is still a long way to go: some drivers still use the old
platform_data framework (which has a different structure for every
driver) instead of device properties via fwnode_* functions or OF).

Some of these can be changed to use device tree only, since they
already support it and the platform_data isn't used by anything in
the kernel (for example tca6507 can work with platform_data but
there is no board definition using it, all usage is via DT).

Some will be harder, because the platform_data code is still used
(pca9532 is used in arch/arm/mach-iop32x/n2100.c). Even this can
be done by converting the drivers to use fwnode_* API and converting
the mach code to use swnodes. I shall look into this later.

This series is compile tested on top of Pavel's tree. Since I
obviously don't have the various hardware that this code touches,
I am unable to test it. I therefore add maintainers and authors of
these drivers to Cc.

Marek

[1] https://lore.kernel.org/linux-leds/20200909235819.0b0fe7ce@nic.cz/T/#m3b6c154f49d0467a707c0f9a552ec87bcbd89df2

Cc: Álvaro Fernández Rojas <noltari@gmail.com>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Dan Murphy <dmurphy@ti.com>
Cc: David Rivshin <drivshin@allworx.com>
Cc: H. Nikolaus Schaller <hns@goldelico.com>
Cc: Jaedon Shin <jaedon.shin@gmail.com>
Cc: John Crispin <john@phrozen.org>
Cc: Kevin Cernekee <cernekee@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Ryder Lee <ryder.lee@mediatek.com>
Cc: Sean Wang <sean.wang@mediatek.com>
Cc: Simon Guinot <sguinot@lacie.com>
Cc: Simon Guinot <simon.guinot@sequanux.org>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Vincent Donnefort <vdonnefort@gmail.com>

Marek Behún (10):
  leds: parse linux,default-trigger DT property in LED core
  leds: bcm6328, bcm6358: use struct led_init_data when registering
  leds: lm3697: use struct led_init_data when registering
  leds: max77650: use struct led_init_data when registering
  leds: mt6323: use struct led_init_data when registering
  leds: pm8058: use struct led_init_data when registering
  leds: is31fl32xx: use struct led_init_data when registering
  leds: is31fl319x: use struct led_init_data when registering
  leds: lm36274: use struct led_init_data when registering
  leds: ns2: refactor and use struct led_init_data

 drivers/leds/Kconfig             |   2 +-
 drivers/leds/led-class.c         |   5 +
 drivers/leds/leds-an30259a.c     |   3 -
 drivers/leds/leds-aw2013.c       |   3 -
 drivers/leds/leds-bcm6328.c      |  10 +-
 drivers/leds/leds-bcm6358.c      |  10 +-
 drivers/leds/leds-cr0014114.c    |   3 -
 drivers/leds/leds-el15203000.c   |   3 -
 drivers/leds/leds-gpio.c         |   3 -
 drivers/leds/leds-is31fl319x.c   | 204 ++++++++---------
 drivers/leds/leds-is31fl32xx.c   |  95 +++-----
 drivers/leds/leds-lm3532.c       |   3 -
 drivers/leds/leds-lm36274.c      | 100 +++++----
 drivers/leds/leds-lm3692x.c      |   3 -
 drivers/leds/leds-lm3697.c       |  18 +-
 drivers/leds/leds-lp8860.c       |   4 -
 drivers/leds/leds-lt3593.c       |   3 -
 drivers/leds/leds-max77650.c     |  24 +-
 drivers/leds/leds-mt6323.c       |  13 +-
 drivers/leds/leds-ns2.c          | 361 ++++++++++---------------------
 drivers/leds/leds-pm8058.c       |  38 ++--
 drivers/leds/leds-tlc591xx.c     |   2 -
 drivers/leds/leds-turris-omnia.c |   2 -
 23 files changed, 337 insertions(+), 575 deletions(-)

-- 
2.26.2

