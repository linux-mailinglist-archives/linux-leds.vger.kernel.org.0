Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4F2D4BE383
	for <lists+linux-leds@lfdr.de>; Wed, 25 Sep 2019 19:41:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2443118AbfIYRlb (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 25 Sep 2019 13:41:31 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:50780 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2443107AbfIYRl3 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 25 Sep 2019 13:41:29 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8PHfEiP029452;
        Wed, 25 Sep 2019 12:41:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1569433274;
        bh=saG1qiWu8GrejbxOinZJfusKmJXkN8e5NleZ7JLxNDw=;
        h=From:To:CC:Subject:Date;
        b=pcv6NTvJCxhCNkmIK8236OuNdQ5d7gQNMj0Jct6/aE/DWuJTv2G2+OYYfBJI8ZkXN
         h9v33q3aMdBrh/7QPv7XfRtws1ArCzHn7ij9mSrfOhjKEDaK+sM6Y/viOqWBwShuY1
         l9aQ4I88Q4plOTfNd6dnGF1Px5f4DC9xq170/t2w=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8PHfEVV018179;
        Wed, 25 Sep 2019 12:41:14 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 25
 Sep 2019 12:41:07 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 25 Sep 2019 12:41:14 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8PHfE4h073729;
        Wed, 25 Sep 2019 12:41:14 -0500
From:   Dan Murphy <dmurphy@ti.com>
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Dan Murphy <dmurphy@ti.com>, <linus.walleij@linaro.org>,
        <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Tony Lindgren <tony@atomide.com>,
        =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>
Subject: [PATCH v9 00/15] Multicolor Framework
Date:   Wed, 25 Sep 2019 12:46:01 -0500
Message-ID: <20190925174616.3714-1-dmurphy@ti.com>
X-Mailer: git-send-email 2.22.0.214.g8dca754b1e
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hello

For those I have added to this patchset this is a new LED framework that will
group monochrome LEDs into a directory under the parent LED class device. I have
CC'd you on this because you maintain a device tree file that contains one of
the devices affected by this change.  Most notably the change is to add the
reg property to each LED child node to denote the output channel that the node
is to use.  This not only is required for the Multicolor framework but also gives
flexibilty in DT design to be able to not be bound to sequential channel
numbering.

There are many changes from v8 to this patchset from Jacek's comments.
v8 series
https://lore.kernel.org/patchwork/project/lkml/list/?series=411331

Most notably
Removal of get/set_brightness ops
Dereferencing the monochrome LED intensity from the multicolor structure as
opposed to the ops.
Update for LP55xx DT properties to include the reg property to identify the
output channel for multicolor and non-multicolor use cases.  This also allows
HW designers to skip output channels if they desire.
Updated the corresponding affect device tree files to add the reg property
Checkpatch error fixes for the lp55xx common

These changes were tested using the LP50xx evms and LP5523 EVM connected to a
BeagleBone black device.

Dan

Dan Murphy (15):
  leds: multicolor: Add sysfs interface definition
  dt: bindings: Add multicolor class dt bindings documention
  dt-bindings: leds: Add multicolor ID to the color ID list
  leds: Add multicolor ID to the color ID list
  leds: multicolor: Introduce a multicolor class definition
  dt: bindings: lp50xx: Introduce the lp50xx family of RGB drivers
  leds: lp50xx: Add the LP50XX family of the RGB LED driver
  dt: bindings: lp55xx: Be consistent in the document with LED
  dt: bindings: lp55xx: Update binding for Multicolor Framework
  ARM: dts: n900: Add reg property to the LP5523 channel node
  ARM: dts: imx6dl-yapp4: Add reg property to the lp5562 channel node
  ARM: dts: ste-href: Add reg property to the LP5521 channel nodes
  leds: lp55xx: Update the lp55xx to use the multi color framework
  leds: lp55xx: Fix checkpatch file permissions issues
  leds: lp5523: Fix checkpatch issues in the code

 .../ABI/testing/sysfs-class-led-multicolor    |  35 +
 .../bindings/leds/leds-class-multicolor.txt   |  98 +++
 .../devicetree/bindings/leds/leds-lp50xx.txt  | 148 ++++
 .../devicetree/bindings/leds/leds-lp55xx.txt  | 105 ++-
 Documentation/leds/index.rst                  |   1 +
 Documentation/leds/leds-class-multicolor.rst  |  96 +++
 arch/arm/boot/dts/imx6dl-yapp4-common.dtsi    |   6 +
 arch/arm/boot/dts/omap3-n900.dts              |  11 +
 arch/arm/boot/dts/ste-href.dtsi               |  10 +
 drivers/leds/Kconfig                          |  22 +
 drivers/leds/Makefile                         |   2 +
 drivers/leds/led-class-multicolor.c           | 220 +++++
 drivers/leds/led-core.c                       |   1 +
 drivers/leds/leds-lp50xx.c                    | 767 ++++++++++++++++++
 drivers/leds/leds-lp5523.c                    |  32 +-
 drivers/leds/leds-lp55xx-common.c             | 172 +++-
 drivers/leds/leds-lp55xx-common.h             |  11 +
 include/dt-bindings/leds/common.h             |   3 +-
 include/linux/led-class-multicolor.h          |  74 ++
 include/linux/platform_data/leds-lp55xx.h     |   6 +
 20 files changed, 1771 insertions(+), 49 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-class-led-multicolor
 create mode 100644 Documentation/devicetree/bindings/leds/leds-class-multicolor.txt
 create mode 100644 Documentation/devicetree/bindings/leds/leds-lp50xx.txt
 create mode 100644 Documentation/leds/leds-class-multicolor.rst
 create mode 100644 drivers/leds/led-class-multicolor.c
 create mode 100644 drivers/leds/leds-lp50xx.c
 create mode 100644 include/linux/led-class-multicolor.h

-- 
2.22.0.214.g8dca754b1e

