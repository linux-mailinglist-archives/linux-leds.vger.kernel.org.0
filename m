Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 51DE6203FC5
	for <lists+linux-leds@lfdr.de>; Mon, 22 Jun 2020 21:01:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730627AbgFVTAq (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 22 Jun 2020 15:00:46 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:42320 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730364AbgFVS7j (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 22 Jun 2020 14:59:39 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 05MIxLjs024873;
        Mon, 22 Jun 2020 13:59:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1592852361;
        bh=InpfokpcHvxst0aloJHqneofL5sbf/wxlm0qbf5N9VU=;
        h=From:To:CC:Subject:Date;
        b=TuE6N3uMYKEeHqwIBR20XCMeWfcbheiRSlSq++5FYLGFgV6inx5x7lJefTPRM/r44
         atLzbVcEa2jBDPlpYRjOTYclj6c0KwzeruoHzUteHdpt8YdIoGw3McgVZHHtoi9tWT
         XUhQK5CtdSfyee5WIbrjELLRE7g7MtqUCXt9pIPo=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 05MIxLkB095937;
        Mon, 22 Jun 2020 13:59:21 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 22
 Jun 2020 13:59:21 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 22 Jun 2020 13:59:21 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 05MIxLkW025060;
        Mon, 22 Jun 2020 13:59:21 -0500
From:   Dan Murphy <dmurphy@ti.com>
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>, <robh@kernel.org>
CC:     <devicetree@vger.kernel.org>, <linux-leds@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, Dan Murphy <dmurphy@ti.com>
Subject: [PATCH v29 00/16] Multicolor Framework v29
Date:   Mon, 22 Jun 2020 13:59:03 -0500
Message-ID: <20200622185919.2131-1-dmurphy@ti.com>
X-Mailer: git-send-email 2.26.2
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

Change to the LEDs Kconfig to fix dependencies on the LP55XX_COMMON.
Added update to the u8500_defconfig

Dan

Dan Murphy (16):
  dt: bindings: Add multicolor class dt bindings documention
  leds: Add multicolor ID to the color ID list
  leds: multicolor: Introduce a multicolor class definition
  dt: bindings: lp50xx: Introduce the lp50xx family of RGB drivers
  leds: lp50xx: Add the LP50XX family of the RGB LED driver
  dt-bindings: leds: Convert leds-lp55xx to yaml
  ARM: dts: n900: Add reg property to the LP5523 channel node
  ARM: dts: imx6dl-yapp4: Add reg property to the lp5562 channel node
  ARM: dts: ste-href: Add reg property to the LP5521 channel nodes
  leds: lp55xx: Convert LED class registration to devm_*
  leds: lp55xx: Add multicolor framework support to lp55xx
  ARM: defconfig: u8500: Add LP55XX_COMMON config flag
  leds: lp5523: Update the lp5523 code to add multicolor brightness
    function
  leds: lp5521: Add multicolor framework multicolor brightness support
  leds: lp55xx: Fix file permissions to use DEVICE_ATTR macros
  leds: lp5523: Fix various formatting issues in the code

 .../ABI/testing/sysfs-class-led-multicolor    |  36 +
 .../bindings/leds/leds-class-multicolor.yaml  |  37 +
 .../devicetree/bindings/leds/leds-lp50xx.yaml | 130 +++
 .../devicetree/bindings/leds/leds-lp55xx.txt  | 228 -----
 .../devicetree/bindings/leds/leds-lp55xx.yaml | 220 +++++
 Documentation/leds/index.rst                  |   1 +
 Documentation/leds/leds-class-multicolor.rst  |  88 ++
 arch/arm/boot/dts/imx6dl-yapp4-common.dtsi    |  14 +-
 arch/arm/boot/dts/omap3-n900.dts              |  29 +-
 arch/arm/boot/dts/ste-href.dtsi               |  22 +-
 arch/arm/configs/u8500_defconfig              |   1 +
 drivers/leds/Kconfig                          |  32 +-
 drivers/leds/Makefile                         |   2 +
 drivers/leds/led-class-multicolor.c           | 208 +++++
 drivers/leds/led-core.c                       |   1 +
 drivers/leds/leds-lp50xx.c                    | 783 ++++++++++++++++++
 drivers/leds/leds-lp5521.c                    |  43 +-
 drivers/leds/leds-lp5523.c                    |  62 +-
 drivers/leds/leds-lp5562.c                    |  22 +-
 drivers/leds/leds-lp55xx-common.c             | 212 +++--
 drivers/leds/leds-lp55xx-common.h             |  16 +-
 drivers/leds/leds-lp8501.c                    |  23 +-
 include/dt-bindings/leds/common.h             |   3 +-
 include/linux/led-class-multicolor.h          | 121 +++
 include/linux/platform_data/leds-lp55xx.h     |   8 +
 25 files changed, 1982 insertions(+), 360 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-class-led-multicolor
 create mode 100644 Documentation/devicetree/bindings/leds/leds-class-multicolor.yaml
 create mode 100644 Documentation/devicetree/bindings/leds/leds-lp50xx.yaml
 delete mode 100644 Documentation/devicetree/bindings/leds/leds-lp55xx.txt
 create mode 100644 Documentation/devicetree/bindings/leds/leds-lp55xx.yaml
 create mode 100644 Documentation/leds/leds-class-multicolor.rst
 create mode 100644 drivers/leds/led-class-multicolor.c
 create mode 100644 drivers/leds/leds-lp50xx.c
 create mode 100644 include/linux/led-class-multicolor.h

-- 
2.26.2

