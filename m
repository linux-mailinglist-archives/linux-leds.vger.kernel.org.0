Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9367BEE008
	for <lists+linux-leds@lfdr.de>; Mon,  4 Nov 2019 13:38:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727322AbfKDMiK (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 4 Nov 2019 07:38:10 -0500
Received: from lelv0143.ext.ti.com ([198.47.23.248]:47270 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727267AbfKDMiK (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 4 Nov 2019 07:38:10 -0500
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id xA4Cc4s2120133;
        Mon, 4 Nov 2019 06:38:04 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1572871084;
        bh=80Ujrxh59YIdl0c8EW5l8V71RKfeIEOfP7GMFqoR7a8=;
        h=From:To:CC:Subject:Date;
        b=vcSmjX61mrXMXHsDRinqxtQpLIgtBRU2oEf7ZMT/J44HJCJCbcd83zgSjIG8TgUWr
         3r42IIHiJtsN762jxXVd7cChYzdUph7/YtnwWSk+RwDnYPvBOYUz9POLXqonkyDUgu
         Cj2bSC8MDYYLstkduVgggzu3oO26NAl6SpPBOYi0=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id xA4Cc4G7067018;
        Mon, 4 Nov 2019 06:38:04 -0600
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 4 Nov
 2019 06:37:50 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 4 Nov 2019 06:37:50 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id xA4Cc4Ai053578;
        Mon, 4 Nov 2019 06:38:04 -0600
From:   Dan Murphy <dmurphy@ti.com>
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Dan Murphy <dmurphy@ti.com>
Subject: [PATCH v16 00/19] Multicolor Framework
Date:   Mon, 4 Nov 2019 06:36:48 -0600
Message-ID: <20191104123707.31930-1-dmurphy@ti.com>
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

Minor updates
https://lore.kernel.org/patchwork/project/lkml/list/?series=416199

LP50xx - Fixed const definition

Documentation - Change RGB -> multicolor

Dan

Dan Murphy (19):
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
  leds: lp55xx: Convert LED class registration to devm_*
  leds: lp55xx: Add multicolor framework support to lp55xx
  leds: lp5523: Update the lp5523 code to add multicolor brightness
    function
  leds: lp5521: Add multicolor framework multicolor brightness support
  leds: lp55xx: Fix checkpatch file permissions issues
  leds: lp5523: Fix checkpatch issues in the code
  dt: bindings: Update lp55xx binding to recommended LED naming
  leds: lp55xx-common: Remove extern from lp55xx-common header

 .../ABI/testing/sysfs-class-led-multicolor    |  36 +
 .../bindings/leds/leds-class-multicolor.txt   |  98 +++
 .../devicetree/bindings/leds/leds-lp50xx.txt  | 148 ++++
 .../devicetree/bindings/leds/leds-lp55xx.txt  | 163 +++-
 Documentation/leds/index.rst                  |   1 +
 Documentation/leds/leds-class-multicolor.rst  | 100 +++
 arch/arm/boot/dts/imx6dl-yapp4-common.dtsi    |  14 +-
 arch/arm/boot/dts/omap3-n900.dts              |  29 +-
 arch/arm/boot/dts/ste-href.dtsi               |  22 +-
 drivers/leds/Kconfig                          |  22 +
 drivers/leds/Makefile                         |   2 +
 drivers/leds/led-class-multicolor.c           | 271 ++++++
 drivers/leds/led-core.c                       |   1 +
 drivers/leds/leds-lp50xx.c                    | 799 ++++++++++++++++++
 drivers/leds/leds-lp5521.c                    |  43 +-
 drivers/leds/leds-lp5523.c                    |  62 +-
 drivers/leds/leds-lp5562.c                    |  22 +-
 drivers/leds/leds-lp55xx-common.c             | 235 ++++--
 drivers/leds/leds-lp55xx-common.h             |  36 +-
 drivers/leds/leds-lp8501.c                    |  23 +-
 include/dt-bindings/leds/common.h             |   3 +-
 include/linux/led-class-multicolor.h          | 139 +++
 include/linux/platform_data/leds-lp55xx.h     |   8 +
 23 files changed, 2105 insertions(+), 172 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-class-led-multicolor
 create mode 100644 Documentation/devicetree/bindings/leds/leds-class-multicolor.txt
 create mode 100644 Documentation/devicetree/bindings/leds/leds-lp50xx.txt
 create mode 100644 Documentation/leds/leds-class-multicolor.rst
 create mode 100644 drivers/leds/led-class-multicolor.c
 create mode 100644 drivers/leds/leds-lp50xx.c
 create mode 100644 include/linux/led-class-multicolor.h

-- 
2.22.0.214.g8dca754b1e

