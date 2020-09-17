Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C70E26E8DA
	for <lists+linux-leds@lfdr.de>; Fri, 18 Sep 2020 00:36:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726250AbgIQWeB (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 17 Sep 2020 18:34:01 -0400
Received: from lists.nic.cz ([217.31.204.67]:35328 "EHLO mail.nic.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725987AbgIQWd4 (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Thu, 17 Sep 2020 18:33:56 -0400
Received: from dellmb.labs.office.nic.cz (unknown [IPv6:2001:1488:fffe:6:cac7:3539:7f1f:463])
        by mail.nic.cz (Postfix) with ESMTP id 5E0D1140A46;
        Fri, 18 Sep 2020 00:33:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
        t=1600382032; bh=TJuUID/L9eaDnNRsRdqcK0Cxl9UEdL6iLjD3qM5pZTs=;
        h=From:To:Date;
        b=EomSSvdO1o33fzVItTb4OJuriitP+/LnsNdlUuTNyoOP3XGJY6Edm8M9YVDA8vxL4
         H74xSIGK/PJBrfKmnIJtrilTwmGK39TFHjDHsJwROakmcWDbGblKejg7wpDLyQwxnq
         GB/w+wUkZ98VuTz26zPlICIRc9PKjfJVesgTFsGI=
From:   =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>
To:     linux-leds@vger.kernel.org
Cc:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        =?UTF-8?q?Ond=C5=99ej=20Jirman?= <megous@megous.com>,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org,
        =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>,
        =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
        Andrey Utkin <andrey_utkin@fastmail.com>,
        Baolin Wang <baolin.wang7@gmail.com>,
        Baolin Wang <baolin.wang@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Christian Mauderer <oss@c-mauderer.de>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Daniel Mack <daniel@caiaq.de>,
        David Rivshin <drivshin@allworx.com>,
        Grant Feng <von81@163.com>,
        Haojian Zhuang <haojian.zhuang@marvell.com>,
        "H . Nikolaus Schaller" <hns@goldelico.com>,
        Jaedon Shin <jaedon.shin@gmail.com>,
        John Crispin <john@phrozen.org>,
        Kevin Cernekee <cernekee@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Milo Kim <milo.kim@ti.com>, NeilBrown <neilb@suse.de>,
        Nikita Travkin <nikitos.tr@gmail.com>,
        Orson Zhai <orsonzhai@gmail.com>,
        Paul Mackerras <paulus@samba.org>,
        Philippe Retornaz <philippe.retornaz@epfl.ch>,
        Riku Voipio <riku.voipio@iki.fi>,
        Rod Whitby <rod@whitby.id.au>,
        Ryder Lee <ryder.lee@mediatek.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Sean Wang <sean.wang@mediatek.com>,
        Sebastian Reichel <sre@kernel.org>,
        Simon Guinot <sguinot@lacie.com>,
        Simon Guinot <simon.guinot@sequanux.org>,
        Simon Shields <simon@lineageos.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Thomas Bogendoerfer <tbogendoerfer@suse.de>,
        Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Vasant Hegde <hegdevasant@linux.vnet.ibm.com>,
        Vincent Donnefort <vdonnefort@gmail.com>,
        Xiaotong Lu <xiaotong.lu@spreadtrum.com>
Subject: [PATCH leds v2 00/50] Start moving parsing of `linux,default-trigger` to LED core (a cleanup of LED drivers)
Date:   Fri, 18 Sep 2020 00:32:48 +0200
Message-Id: <20200917223338.14164-1-marek.behun@nic.cz>
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

this series is also available at [1].

This is v2, you can read cover letter of v1 at [2] (togehter with
explanation of why I did this).

Changes since v1:
- split big changes into several patches of little changes
- added many cosmetic fixes (helper variables, reversal christmas tree
  variables declaration, ...)
- fixed some bugs in various drivers (memory leaks, iteration over
  unavailable OF nodes)
- made some drivers compilable when COMPILE_TEST=y (since allyesconfig
  did not compile them). Not all though, some still don't compile with
  allyesconfig
- the commit that moves parsing of `linux,default-trigger` property from
  drivers to LED core is now last in the series, instead of first

Marek

[1] https://git.kernel.org/pub/scm/linux/kernel/git/kabel/linux.git/log/?h=leds-cleanup-for-pavel
[2] https://lore.kernel.org/linux-leds/20200916231650.11484-1-marek.behun@nic.cz/T/#m826493318174b0f38a3d4ba107092b5420ce440c

Cc: Álvaro Fernández Rojas <noltari@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>
Cc: Andrey Utkin <andrey_utkin@fastmail.com>
Cc: Baolin Wang <baolin.wang7@gmail.com>
Cc: Baolin Wang <baolin.wang@linaro.org>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Christian Mauderer <oss@c-mauderer.de>
Cc: Chunyan Zhang <zhang.lyra@gmail.com>
Cc: Daniel Mack <daniel@caiaq.de>
Cc: Dan Murphy <dmurphy@ti.com>
Cc: David Rivshin <drivshin@allworx.com>
Cc: Grant Feng <von81@163.com>
Cc: Haojian Zhuang <haojian.zhuang@marvell.com>
Cc: H. Nikolaus Schaller <hns@goldelico.com>
Cc: Jaedon Shin <jaedon.shin@gmail.com>
Cc: John Crispin <john@phrozen.org>
Cc: Kevin Cernekee <cernekee@gmail.com>
Cc: Lee Jones <lee.jones@linaro.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Mark Brown <broonie@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Milo Kim <milo.kim@ti.com>
Cc: NeilBrown <neilb@suse.de>
Cc: Nikita Travkin <nikitos.tr@gmail.com>
Cc: Orson Zhai <orsonzhai@gmail.com>
Cc: Paul Mackerras <paulus@samba.org>
Cc: Pavel Machek <pavel@ucw.cz>
Cc: Philippe Retornaz <philippe.retornaz@epfl.ch>
Cc: Riku Voipio <riku.voipio@iki.fi>
Cc: Rod Whitby <rod@whitby.id.au>
Cc: Ryder Lee <ryder.lee@mediatek.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Sean Wang <sean.wang@mediatek.com>
Cc: Sebastian Reichel <sre@kernel.org>
Cc: Simon Guinot <sguinot@lacie.com>
Cc: Simon Guinot <simon.guinot@sequanux.org>
Cc: Simon Shields <simon@lineageos.org>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Thomas Bogendoerfer <tbogendoerfer@suse.de>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: "Uwe Kleine-König" <u.kleine-koenig@pengutronix.de>
Cc: Vasant Hegde <hegdevasant@linux.vnet.ibm.com>
Cc: Vincent Donnefort <vdonnefort@gmail.com>
Cc: Xiaotong Lu <xiaotong.lu@spreadtrum.com>

Marek Behún (50):
  leds: various: compile if COMPILE_TEST=y
  leds: ip30: compile if COMPILE_TEST=y
  leds: fsg: compile if COMPILE_TEST=y
  leds: various: use device_get_match_data
  leds: various: guard of_match_table member value with of_match_ptr
  leds: various: use dev_of_node(dev) instead of dev->of_node
  leds: lt3593: do not rewrite .of_node of new LED device to wrong value
  leds: various: use only available OF children
  leds: various: fix OF node leaks
  leds: bcm6328, bcm6358: use devres LED registering function
  leds: bcm6328, bcm6358: use struct led_init_data when registering
  leds: bcm6328: cosmetic: use reverse christmas tree
  leds: bcm6358: cosmetic: use reverse christmas tree
  leds: lm3697: use struct led_init_data when registering
  leds: lm3697: cosmetic change: use helper variable, reverse christmas
    tree
  leds: max77650: use struct led_init_data when registering
  leds: max77650: use reverse christmas tree
  leds: mt6323: use struct led_init_data when registering
  leds: mt6323: cosmetic change: use helper variable
  leds: pm8058: use struct led_init_data when registering
  leds: pm8058: cosmetic change: use helper variable
  leds: pm8058: cosmetic change: no need to return in if guard
  leds: pm8058: cosmetic: use reverse christmas tree
  leds: is31fl32xx: use struct led_init_data when registering
  leds: is31fl319x: compute aggregated max current separately
  leds: is31fl319x: don't store shutdown gpio descriptor
  leds: is31fl319x: don't store audio gain value, simply set it
  leds: is31fl319x: refactor to register LEDs while parsing DT
  leds: is31fl319x: cosmetic: use reverse christmas tree
  leds: is31fl319x: use struct led_init_data when registering
  leds: lm36274: use devres LED registering function
  leds: lm36274: cosmetic: rename lm36274_data to chip
  leds: lm36274: don't iterate through children since there is only one
  leds: lm36274: use struct led_init_data when registering
  leds: lm36274: do not set chip settings in DT parsing function
  leds: ns2: use devres LED registering function
  leds: ns2: alloc simple array instead of struct ns2_led_priv
  leds: ns2: support OF probing only, forget platdata
  leds: ns2: move parsing of one LED into separate function
  leds: ns2: use devres API for getting GPIO descriptors
  leds: ns2: cosmetic structure rename
  leds: ns2: cosmetic variable rename
  leds: ns2: cosmetic change
  leds: ns2: cosmetic change: use helper variable
  leds: ns2: register LED immediately after parsing DT properties
  leds: ns2: remove unneeded variable
  leds: ns2: cosmetic: use reverse christmas tree
  leds: ns2: reorder headers alphabetically
  leds: ns2: use struct led_init_data when registering
  leds: parse linux,default-trigger DT property in LED core

 drivers/leds/Kconfig              |  14 +-
 drivers/leds/led-class.c          |   5 +
 drivers/leds/leds-88pm860x.c      |   6 +-
 drivers/leds/leds-aat1290.c       |   4 +-
 drivers/leds/leds-an30259a.c      |   7 +-
 drivers/leds/leds-as3645a.c       |   2 +-
 drivers/leds/leds-aw2013.c        |  11 +-
 drivers/leds/leds-bcm6328.c       |  28 ++-
 drivers/leds/leds-bcm6358.c       |  20 +-
 drivers/leds/leds-cpcap.c         |   9 +-
 drivers/leds/leds-cr0014114.c     |   5 +-
 drivers/leds/leds-el15203000.c    |   5 +-
 drivers/leds/leds-fsg.c           |   6 +
 drivers/leds/leds-gpio.c          |   5 +-
 drivers/leds/leds-ip30.c          |   1 +
 drivers/leds/leds-is31fl319x.c    | 260 +++++++++++-----------
 drivers/leds/leds-is31fl32xx.c    |  35 ++-
 drivers/leds/leds-ktd2692.c       |   6 +-
 drivers/leds/leds-lm3532.c        |   5 +-
 drivers/leds/leds-lm3601x.c       |   2 +-
 drivers/leds/leds-lm36274.c       | 122 +++++------
 drivers/leds/leds-lm3692x.c       |   5 +-
 drivers/leds/leds-lm3697.c        |  96 ++++----
 drivers/leds/leds-lp50xx.c        |   2 +-
 drivers/leds/leds-lp5521.c        |   2 +-
 drivers/leds/leds-lp5523.c        |   2 +-
 drivers/leds/leds-lp5562.c        |   2 +-
 drivers/leds/leds-lp55xx-common.c |  14 +-
 drivers/leds/leds-lp8501.c        |   2 +-
 drivers/leds/leds-lp8860.c        |   8 +-
 drivers/leds/leds-lt3593.c        |   6 +-
 drivers/leds/leds-max77650.c      |  28 +--
 drivers/leds/leds-max77693.c      |   4 +-
 drivers/leds/leds-mc13783.c       |   8 +-
 drivers/leds/leds-mt6323.c        |  22 +-
 drivers/leds/leds-netxbig.c       |   8 +-
 drivers/leds/leds-ns2.c           | 349 ++++++++++--------------------
 drivers/leds/leds-pca9532.c       |   4 +-
 drivers/leds/leds-pca955x.c       |   2 +-
 drivers/leds/leds-pca963x.c       |   2 +-
 drivers/leds/leds-pm8058.c        |  43 ++--
 drivers/leds/leds-powernv.c       |   4 +-
 drivers/leds/leds-pwm.c           |   2 +-
 drivers/leds/leds-sc27xx-bltc.c   |   8 +-
 drivers/leds/leds-sgm3140.c       |   2 +-
 drivers/leds/leds-spi-byte.c      |  13 +-
 drivers/leds/leds-syscon.c        |   6 +-
 drivers/leds/leds-tca6507.c       |   8 +-
 drivers/leds/leds-tlc591xx.c      |  16 +-
 drivers/leds/leds-turris-omnia.c  |  10 +-
 50 files changed, 511 insertions(+), 725 deletions(-)

-- 
2.26.2

