Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DEDFFB033F
	for <lists+linux-leds@lfdr.de>; Wed, 11 Sep 2019 20:02:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729856AbfIKSBX (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 11 Sep 2019 14:01:23 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:36754 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729753AbfIKSBW (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 11 Sep 2019 14:01:22 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8BI1Gam040429;
        Wed, 11 Sep 2019 13:01:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1568224877;
        bh=/wxi3Ble2IRwzoGt/NZ3bTLxzbC82fxNt8d4oO8Smtk=;
        h=From:To:CC:Subject:Date;
        b=aGnQ/XE6OA4Ow8uQqTXjdvexhRxGup+lawV4ZYY5QvTKnCcoZ2ZVxykMTf4+o//B4
         Sho7GX75gYbXwAH88mlLPPBu5I+ni9uzU8eDJnOp4OKuRp29kCBEenvGvk/VRAC51x
         yuVivbzfhF+FGPbRpkjGZV98tGS9B3iFj0IJSxXo=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8BI1Gbl102520;
        Wed, 11 Sep 2019 13:01:16 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 11
 Sep 2019 13:01:16 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 11 Sep 2019 13:01:16 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8BI1GeY011087;
        Wed, 11 Sep 2019 13:01:16 -0500
From:   Dan Murphy <dmurphy@ti.com>
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>
CC:     <robh+dt@kernel.org>, <linux-leds@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Dan Murphy <dmurphy@ti.com>
Subject: [PATCH v5 0/9] Multicolor FW update
Date:   Wed, 11 Sep 2019 13:01:06 -0500
Message-ID: <20190911180115.21035-1-dmurphy@ti.com>
X-Mailer: git-send-email 2.22.0.214.g8dca754b1e
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hello

Lots of changes went into this update.  The main change was that when writing to
the colors/intensity or colors/color_mix file for a specific color the LED 
intensity will not change until the brightness file is written.

Added the LP5012/9 LED devices to the LP50xx code.
Converted the class doc to rst format.

Dan

Dan Murphy (9):
  leds: multicolor: Add sysfs interface definition
  documention: leds: Add multicolor class documentation
  dt: bindings: Add multicolor class dt bindings documention
  dt-bindings: leds: Add multicolor ID to the color ID list
  leds: Add multicolor ID to the color ID list
  leds: multicolor: Introduce a multicolor class definition
  dt: bindings: lp50xx: Introduce the lp50xx family of RGB drivers
  leds: lp50xx: Add the LP50XX family of the RGB LED driver
  leds: Update the lp55xx to use the multi color framework

 .../ABI/testing/sysfs-class-led-multicolor    |  73 ++
 .../bindings/leds/leds-class-multicolor.txt   |  96 +++
 .../devicetree/bindings/leds/leds-lp50xx.txt  | 148 ++++
 Documentation/leds/index.rst                  |   1 +
 Documentation/leds/leds-class-multicolor.rst  | 149 ++++
 drivers/leds/Kconfig                          |  17 +
 drivers/leds/Makefile                         |   2 +
 drivers/leds/led-class-multicolor.c           | 387 +++++++++
 drivers/leds/led-core.c                       |   1 +
 drivers/leds/leds-lp50xx.c                    | 807 ++++++++++++++++++
 drivers/leds/leds-lp5523.c                    |  13 +
 drivers/leds/leds-lp55xx-common.c             | 131 ++-
 drivers/leds/leds-lp55xx-common.h             |   9 +
 include/dt-bindings/leds/common.h             |   3 +-
 include/linux/led-class-multicolor.h          |  96 +++
 include/linux/platform_data/leds-lp55xx.h     |   6 +
 modules.builtin.modinfo                       | Bin 0 -> 43550 bytes
 17 files changed, 1916 insertions(+), 23 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-class-led-multicolor
 create mode 100644 Documentation/devicetree/bindings/leds/leds-class-multicolor.txt
 create mode 100644 Documentation/devicetree/bindings/leds/leds-lp50xx.txt
 create mode 100644 Documentation/leds/leds-class-multicolor.rst
 create mode 100644 drivers/leds/led-class-multicolor.c
 create mode 100644 drivers/leds/leds-lp50xx.c
 create mode 100644 include/linux/led-class-multicolor.h
 create mode 100644 modules.builtin.modinfo

-- 
2.22.0.214.g8dca754b1e

