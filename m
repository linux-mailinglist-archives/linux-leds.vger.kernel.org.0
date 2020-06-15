Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6F311FA10F
	for <lists+linux-leds@lfdr.de>; Mon, 15 Jun 2020 22:15:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729692AbgFOUPu (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 15 Jun 2020 16:15:50 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:51458 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728346AbgFOUPt (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 15 Jun 2020 16:15:49 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 05FKFhin094396;
        Mon, 15 Jun 2020 15:15:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1592252143;
        bh=p3el6r3iFT6tyZHvcT3VOEaphwFqZKjosskfvLkSjGk=;
        h=From:To:CC:Subject:Date;
        b=Qd+VOY29E02Kv5KpVAvk4QMZ70WZAWUmLoxDY4jIxM9g3oYmD8Kh64CQq/UjjCtZi
         zXSJlKdlImxStqe8PKLHGEozdx1oVUC53InG+pYIA/zrPqeduBOakjAFNWXWjiWQ6E
         /ClqtbL5QD7DBGcr6x6ybeG0ZiZMk4SnjJW8jc1E=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 05FKFhCQ044828;
        Mon, 15 Jun 2020 15:15:43 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 15
 Jun 2020 15:15:43 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 15 Jun 2020 15:15:43 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 05FKFhAT061823;
        Mon, 15 Jun 2020 15:15:43 -0500
From:   Dan Murphy <dmurphy@ti.com>
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>, <robh@kernel.org>
CC:     <devicetree@vger.kernel.org>, <linux-leds@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Dan Murphy <dmurphy@ti.com>
Subject: [RESEND PATCH v27 00/15] Multicolor Framework v27
Date:   Mon, 15 Jun 2020 15:15:07 -0500
Message-ID: <20200615201522.19677-1-dmurphy@ti.com>
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

Dan

Dan Murphy (15):
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
  leds: lp5523: Update the lp5523 code to add multicolor brightness
    function
  leds: lp5521: Add multicolor framework multicolor brightness support
  leds: lp55xx: Fix file permissions to use DEVICE_ATTR macros
  leds: lp5523: Fix various formatting issues in the code

 .../ABI/testing/sysfs-class-led-multicolor    |  36 +
 .../bindings/leds/leds-class-multicolor.yaml  |  37 +
 .../devicetree/bindings/leds/leds-lp50xx.yaml | 130 +++
 .../devicetree/bindings/leds/leds-lp55xx.txt  | 228 -----
 .../devicetree/bindings/leds/leds-lp55xx.yaml | 218 +++++
 Documentation/leds/index.rst                  |   1 +
 Documentation/leds/leds-class-multicolor.rst  |  88 ++
 arch/arm/boot/dts/imx6dl-yapp4-common.dtsi    |  14 +-
 arch/arm/boot/dts/omap3-n900.dts              |  29 +-
 arch/arm/boot/dts/ste-href.dtsi               |  22 +-
 drivers/leds/Kconfig                          |  24 +
 drivers/leds/Makefile                         |   2 +
 drivers/leds/led-class-multicolor.c           | 210 +++++
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
 24 files changed, 1978 insertions(+), 355 deletions(-)
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

