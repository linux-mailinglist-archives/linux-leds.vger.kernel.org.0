Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F040AC3845
	for <lists+linux-leds@lfdr.de>; Tue,  1 Oct 2019 16:58:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389512AbfJAO46 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 1 Oct 2019 10:56:58 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:33286 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389345AbfJAO4J (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 1 Oct 2019 10:56:09 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x91Eu4Dv056667;
        Tue, 1 Oct 2019 09:56:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1569941764;
        bh=ibI9NPF0/8nT61WRodw7jAKN9UVtkJDo9RpvHCu3aJA=;
        h=From:To:CC:Subject:Date;
        b=bQYPqwn5nh8ae9IXSqVST24TOdQrHXHEeH4vfGoot4iSe3Tvm+f/1WH4gEB8B9x3t
         BVN7ub/OXBgn1eTJaxABda9QuJs9aaUlkRr4TYfVyEsD2pctwficG+MKGlSCsOvzh1
         Zv3C2hvJ2HgdGszeABYh6GtJGqCBN+gqSS2ISwtk=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x91Eu4Ih052838
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 1 Oct 2019 09:56:04 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 1 Oct
 2019 09:55:54 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 1 Oct 2019 09:56:04 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x91Eu44h014646;
        Tue, 1 Oct 2019 09:56:04 -0500
From:   Dan Murphy <dmurphy@ti.com>
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Dan Murphy <dmurphy@ti.com>
Subject: [PATCH v10 00/16] Multicolor Framework
Date:   Tue, 1 Oct 2019 09:56:04 -0500
Message-ID: <20191001145620.11123-1-dmurphy@ti.com>
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

I have updated the code per v9 review comments
https://lore.kernel.org/patchwork/project/lkml/list/?series=411824

Some notable changes:

MC framework 4/16
 - Added a color structure for device drivers to use to associate color IDs with
 brightness values
 - Name of structure may need some work but this is for proof of concept.
 - Added back in the devm_* APIs
 - Inlined function led_classdev_multicolor_register

LP55xx
 - Fixed binding doc to add "@" to nodes [8/16]
 - Fixed associated DT file to add the "@" to each node [9,10,11/16]
 - Separate the LP5523 code changes from the LP55xx common code change
 - Added channel to color ID mapping for LP55xx [12/16]

LP5523
 - Separated out this code from LP55xx

LP5521
 - New patch adding multicolor framework support for this device

Dan

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
 drivers/leds/led-class-multicolor.c           | 268 ++++++
 drivers/leds/led-core.c                       |   1 +
 drivers/leds/leds-lp50xx.c                    | 784 ++++++++++++++++++
 drivers/leds/leds-lp5521.c                    |  14 +
 drivers/leds/leds-lp5523.c                    |  33 +-
 drivers/leds/leds-lp55xx-common.c             | 191 ++++-
 drivers/leds/leds-lp55xx-common.h             |  11 +
 include/dt-bindings/leds/common.h             |   3 +-
 include/linux/led-class-multicolor.h          |  88 ++
 include/linux/platform_data/leds-lp55xx.h     |   6 +
 21 files changed, 1928 insertions(+), 93 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-class-led-multicolor
 create mode 100644 Documentation/devicetree/bindings/leds/leds-class-multicolor.txt
 create mode 100644 Documentation/devicetree/bindings/leds/leds-lp50xx.txt
 create mode 100644 Documentation/leds/leds-class-multicolor.rst
 create mode 100644 drivers/leds/led-class-multicolor.c
 create mode 100644 drivers/leds/leds-lp50xx.c
 create mode 100644 include/linux/led-class-multicolor.h

-- 
2.22.0.214.g8dca754b1e

