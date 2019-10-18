Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2ADA9DC4DC
	for <lists+linux-leds@lfdr.de>; Fri, 18 Oct 2019 14:28:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728735AbfJRM2p (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 18 Oct 2019 08:28:45 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:48392 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392707AbfJRMZ7 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 18 Oct 2019 08:25:59 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9ICPti9066211;
        Fri, 18 Oct 2019 07:25:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1571401555;
        bh=WYbItaF+PhoT25Xi4tBJupjh3c8kvM30RcC17GuTSik=;
        h=From:To:CC:Subject:Date;
        b=f+ks6zQgX+efJr2uq/08DLlF1zblCnTii1x2O8L4NmLr3q5pbTAJoFbLjdfLKmdph
         5M4yr9gs1bzN10i9tPSuyf7jwAWLF4JgsUNAKJhcOtLvMc3HMxPmeIvmYJilqDiK+a
         OW3lhrQi3kGvbYgvyuiCDUFiYtZ7e0bbU3H6zS/U=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9ICPtYF053618
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 18 Oct 2019 07:25:55 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 18
 Oct 2019 07:25:46 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 18 Oct 2019 07:25:46 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9ICPshL073298;
        Fri, 18 Oct 2019 07:25:54 -0500
From:   Dan Murphy <dmurphy@ti.com>
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Dan Murphy <dmurphy@ti.com>
Subject: [PATCH v14 00/19] MultiColor Framework v14
Date:   Fri, 18 Oct 2019 07:25:02 -0500
Message-ID: <20191018122521.6757-1-dmurphy@ti.com>
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

Changes made from v13:
https://lore.kernel.org/patchwork/project/lkml/list/?series=414566

Added 1 patch for removing extern from lp55xx-common header

MC Class:
Updated documentation to include statement on keeping max_intensity consistent
across all clustered LEDs.

LP55xx:
Renamed color_component to color_components
ifdef out multicolor class code when CONFIG_MULTI_COLOR is not selected
Removed devm_*_unregister code from LP55xx/21/23 and LP8501

n900:
Fixed commit message

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
 Documentation/leds/leds-class-multicolor.rst  |  96 +++
 arch/arm/boot/dts/imx6dl-yapp4-common.dtsi    |  14 +-
 arch/arm/boot/dts/omap3-n900.dts              |  29 +-
 arch/arm/boot/dts/ste-href.dtsi               |  22 +-
 drivers/leds/Kconfig                          |  22 +
 drivers/leds/Makefile                         |   2 +
 drivers/leds/led-class-multicolor.c           | 271 ++++++
 drivers/leds/led-core.c                       |   1 +
 drivers/leds/leds-lp50xx.c                    | 799 ++++++++++++++++++
 drivers/leds/leds-lp5521.c                    |  29 +-
 drivers/leds/leds-lp5523.c                    |  48 +-
 drivers/leds/leds-lp55xx-common.c             | 220 +++--
 drivers/leds/leds-lp55xx-common.h             |  35 +-
 drivers/leds/leds-lp8501.c                    |   9 +-
 include/dt-bindings/leds/common.h             |   3 +-
 include/linux/led-class-multicolor.h          |  97 +++
 include/linux/platform_data/leds-lp55xx.h     |   7 +
 22 files changed, 2008 insertions(+), 142 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-class-led-multicolor
 create mode 100644 Documentation/devicetree/bindings/leds/leds-class-multicolor.txt
 create mode 100644 Documentation/devicetree/bindings/leds/leds-lp50xx.txt
 create mode 100644 Documentation/leds/leds-class-multicolor.rst
 create mode 100644 drivers/leds/led-class-multicolor.c
 create mode 100644 drivers/leds/leds-lp50xx.c
 create mode 100644 include/linux/led-class-multicolor.h

-- 
2.22.0.214.g8dca754b1e

