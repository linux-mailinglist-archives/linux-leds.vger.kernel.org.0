Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0FD55D0273
	for <lists+linux-leds@lfdr.de>; Tue,  8 Oct 2019 22:49:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730888AbfJHUsY (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 8 Oct 2019 16:48:24 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:43484 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730720AbfJHUsX (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 8 Oct 2019 16:48:23 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x98KmJkr114884;
        Tue, 8 Oct 2019 15:48:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1570567699;
        bh=RIZPdNpg2SdM20WeHFZIe6JMySom0l5iF39chY3wOfA=;
        h=From:To:CC:Subject:Date;
        b=uUTt0VTR8oGBsLBmETsFyURpPQGu+fvjqfNKWaJdMqR9lyFmFCF1LVaCdFSrAUHl7
         HPk26fdc/PzG07G4MXX294lD6hu2GVyXIL6ouqHitwvHl9uq9p51xWKTVEMc+pW6PE
         m3NrlFeKA/BGuULDkfgzUG4oIAMVXJ+eC2yWUrdQ=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x98KmIx2110702;
        Tue, 8 Oct 2019 15:48:19 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 8 Oct
 2019 15:48:16 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 8 Oct 2019 15:48:18 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x98KmIFh073086;
        Tue, 8 Oct 2019 15:48:18 -0500
From:   Dan Murphy <dmurphy@ti.com>
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Dan Murphy <dmurphy@ti.com>
Subject: [PATCH v11 00/16] Multicolor Framework v11
Date:   Tue, 8 Oct 2019 15:47:44 -0500
Message-ID: <20191008204800.19870-1-dmurphy@ti.com>
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

This is v11 of the multicolor framework patchset.

This patchet has been tested on LP5523, LP5521, and the LP5012,24 and 36 evms
connected to a beagle bone black.  For the LP5523/5521 I have tested with both
MC and non-MC DT as well as an intermixed DT with color and white LEDs.

Changes made based on this series:
https://lore.kernel.org/patchwork/project/lkml/list/?series=412400

MC framework:
- Added inline functions for when CONFIG_LEDS_CLASS_MULTI_COLOR is not set
- Added the output number to the color conversion struct
- Fixed devm_* structure function
- Fixed permissions for MC files.  Also the document.

LP50xx:
- Added range checking for banked LEDs

LP55xx:
- Removed grouped_channels and channel_color arrays in favor of the new color
coversion structure.
- Changed the intensity function to perform all the writing to the device within
the childs intensity fn so now the intensity and brightness functions have a
similar design but function different.


Dan Murphy (16):
  dt: bindings: Add multicolor class dt bindings documention
  dt-bindings: leds: Add multicolor ID to the color ID list
  leds: Add multicolor ID to the color ID list
  leds: multicolor: Introduce a multicolor class definition
  dt: bindings: lp50xx: Introduce the lp50xx family of RGB drivers
  leds: lp50xx: Add the LP50XX family of the RGB LED driver
  dt: bindings: lp55xx: Be consistent in the document with LED acronym
  dt: bindings: lp55xx: Update binding for Multicolor Framework
  ARM: dts: n900: Add reg property to the LP5523 channel node
  ARM: dts: imx6dl-yapp4: Add reg property to the lp5562 channel node
  ARM: dts: ste-href: Add reg property to the LP5521 channel nodes
  leds: lp55xx: Add multicolor framework support to lp55xx
  leds: lp5523: Update the lp5523 code to add intensity function
  leds: lp5521: Add multicolor framework intensity support
  leds: lp55xx: Fix checkpatch file permissions issues
  leds: lp5523: Fix checkpatch issues in the code

 .../ABI/testing/sysfs-class-led-multicolor    |  35 +
 .../bindings/leds/leds-class-multicolor.txt   |  98 +++
 .../devicetree/bindings/leds/leds-lp50xx.txt  | 148 ++++
 .../devicetree/bindings/leds/leds-lp55xx.txt  | 155 +++-
 Documentation/leds/index.rst                  |   1 +
 Documentation/leds/leds-class-multicolor.rst  |  96 +++
 arch/arm/boot/dts/imx6dl-yapp4-common.dtsi    |  14 +-
 arch/arm/boot/dts/omap3-n900.dts              |  29 +-
 arch/arm/boot/dts/ste-href.dtsi               |  22 +-
 drivers/leds/Kconfig                          |  22 +
 drivers/leds/Makefile                         |   2 +
 drivers/leds/led-class-multicolor.c           | 271 ++++++
 drivers/leds/led-core.c                       |   1 +
 drivers/leds/leds-lp50xx.c                    | 799 ++++++++++++++++++
 drivers/leds/leds-lp5521.c                    |  20 +
 drivers/leds/leds-lp5523.c                    |  39 +-
 drivers/leds/leds-lp55xx-common.c             | 198 ++++-
 drivers/leds/leds-lp55xx-common.h             |  11 +
 include/dt-bindings/leds/common.h             |   3 +-
 include/linux/led-class-multicolor.h          | 143 ++++
 include/linux/platform_data/leds-lp55xx.h     |   5 +
 21 files changed, 2019 insertions(+), 93 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-class-led-multicolor
 create mode 100644 Documentation/devicetree/bindings/leds/leds-class-multicolor.txt
 create mode 100644 Documentation/devicetree/bindings/leds/leds-lp50xx.txt
 create mode 100644 Documentation/leds/leds-class-multicolor.rst
 create mode 100644 drivers/leds/led-class-multicolor.c
 create mode 100644 drivers/leds/leds-lp50xx.c
 create mode 100644 include/linux/led-class-multicolor.h

-- 
2.22.0.214.g8dca754b1e

