Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E8461BDCF5
	for <lists+linux-leds@lfdr.de>; Wed, 29 Apr 2020 15:02:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726812AbgD2NCe (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 29 Apr 2020 09:02:34 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:44578 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726516AbgD2NCe (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 29 Apr 2020 09:02:34 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 03TD2Vx1076720;
        Wed, 29 Apr 2020 08:02:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1588165351;
        bh=HCwltAknPB+t+/cMwubIh9W2fiumLUfk6umoPrrhN0I=;
        h=From:To:CC:Subject:Date;
        b=FjespuxXxLLBBQPkkEgIh5CsRfgRXr3d2WZDvd3XJEUdAvecxLoD2E49VH0Z1VZNb
         j5ru5eSVzvlT8H88G3Up0oM37Zw3ORYV7a4eEHT0hB04Q2HA8NTtz1ghqejWRop1F6
         R6FW4TQth1GqaXJ3G5wG+D534zp/Aj22C+JoiYss=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 03TD2V1A112558;
        Wed, 29 Apr 2020 08:02:31 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 29
 Apr 2020 08:02:30 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 29 Apr 2020 08:02:30 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 03TD2USs089168;
        Wed, 29 Apr 2020 08:02:30 -0500
From:   Dan Murphy <dmurphy@ti.com>
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Dan Murphy <dmurphy@ti.com>
Subject: [PATCH v22 00/16] Multicolor Framework v22
Date:   Wed, 29 Apr 2020 07:56:15 -0500
Message-ID: <20200429125631.7044-1-dmurphy@ti.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hello

This is the multi color LED framework.   This framework presents clustered
colored LEDs into an array and allows the user space to adjust the brightness
of the cluster using a single file write.  The individual colored LEDs
intensities are controlled via a single file that is an array of LEDs

Dan

Dan Murphy (16):
  dt: bindings: Add multicolor class dt bindings documention
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

 .../ABI/testing/sysfs-class-led-multicolor    |  34 +
 .../bindings/leds/leds-class-multicolor.yaml  |  34 +
 .../devicetree/bindings/leds/leds-lp50xx.yaml | 117 +++
 .../devicetree/bindings/leds/leds-lp55xx.txt  | 163 +++-
 Documentation/leds/index.rst                  |   1 +
 Documentation/leds/leds-class-multicolor.rst  |  86 ++
 MAINTAINERS                                   |   8 +
 arch/arm/boot/dts/imx6dl-yapp4-common.dtsi    |  14 +-
 arch/arm/boot/dts/omap3-n900.dts              |  29 +-
 arch/arm/boot/dts/ste-href.dtsi               |  22 +-
 drivers/leds/Kconfig                          |  22 +
 drivers/leds/Makefile                         |   2 +
 drivers/leds/led-class-multicolor.c           | 210 +++++
 drivers/leds/led-core.c                       |   1 +
 drivers/leds/leds-lp50xx.c                    | 777 ++++++++++++++++++
 drivers/leds/leds-lp5521.c                    |  43 +-
 drivers/leds/leds-lp5523.c                    |  62 +-
 drivers/leds/leds-lp5562.c                    |  22 +-
 drivers/leds/leds-lp55xx-common.c             | 213 +++--
 drivers/leds/leds-lp55xx-common.h             |  16 +-
 drivers/leds/leds-lp8501.c                    |  23 +-
 include/dt-bindings/leds/common.h             |   3 +-
 include/linux/led-class-multicolor.h          | 121 +++
 include/linux/platform_data/leds-lp55xx.h     |   8 +
 24 files changed, 1872 insertions(+), 159 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-class-led-multicolor
 create mode 100644 Documentation/devicetree/bindings/leds/leds-class-multicolor.yaml
 create mode 100644 Documentation/devicetree/bindings/leds/leds-lp50xx.yaml
 create mode 100644 Documentation/leds/leds-class-multicolor.rst
 create mode 100644 drivers/leds/led-class-multicolor.c
 create mode 100644 drivers/leds/leds-lp50xx.c
 create mode 100644 include/linux/led-class-multicolor.h

-- 
2.25.1

