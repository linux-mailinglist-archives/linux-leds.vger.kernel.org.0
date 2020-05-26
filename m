Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18A7B1E276B
	for <lists+linux-leds@lfdr.de>; Tue, 26 May 2020 18:47:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388690AbgEZQrH (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 26 May 2020 12:47:07 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:59582 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388295AbgEZQrH (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 26 May 2020 12:47:07 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 04QGkxF0017070;
        Tue, 26 May 2020 11:46:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1590511619;
        bh=5kTwSm0j/nEYWnnOPT/V2sI+wVlLQJbo67RSZQQIUOA=;
        h=From:To:CC:Subject:Date;
        b=vvReaFyc70E9nYKqSQVRhKLsmaidETVtpIFB3UZs06Z8bEjLHtglL4WexmoLBt87u
         6Y0qvLDvsBQamm6SNhpB5W/t9MB6A0Kz4Jn991b1Y9s/qb8Doit1QrIGZnwMJLsOoW
         maca62Yo1VkecTxZUKbmfNyfMYKLs8wLEnz3dmtg=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 04QGkxPd060512
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 26 May 2020 11:46:59 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 26
 May 2020 11:46:58 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 26 May 2020 11:46:58 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04QGkwFD129478;
        Tue, 26 May 2020 11:46:58 -0500
From:   Dan Murphy <dmurphy@ti.com>
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>, <robh@kernel.org>
CC:     <devicetree@vger.kernel.org>, <linux-leds@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Dan Murphy <dmurphy@ti.com>
Subject: [PATCH v25 00/16] Multicolor Framework v25
Date:   Tue, 26 May 2020 11:46:36 -0500
Message-ID: <20200526164652.2331-1-dmurphy@ti.com>
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
 .../bindings/leds/leds-class-multicolor.yaml  |  71 ++
 .../devicetree/bindings/leds/leds-lp50xx.yaml | 180 ++++
 .../devicetree/bindings/leds/leds-lp55xx.txt  | 163 +++-
 Documentation/leds/index.rst                  |   1 +
 Documentation/leds/leds-class-multicolor.rst  |  88 ++
 MAINTAINERS                                   |   8 +
 arch/arm/boot/dts/imx6dl-yapp4-common.dtsi    |  14 +-
 arch/arm/boot/dts/omap3-n900.dts              |  29 +-
 arch/arm/boot/dts/ste-href.dtsi               |  22 +-
 drivers/leds/Kconfig                          |  24 +
 drivers/leds/Makefile                         |   2 +
 drivers/leds/led-class-multicolor.c           | 210 +++++
 drivers/leds/led-core.c                       |   1 +
 drivers/leds/leds-lp50xx.c                    | 778 ++++++++++++++++++
 drivers/leds/leds-lp5521.c                    |  43 +-
 drivers/leds/leds-lp5523.c                    |  62 +-
 drivers/leds/leds-lp5562.c                    |  22 +-
 drivers/leds/leds-lp55xx-common.c             | 213 +++--
 drivers/leds/leds-lp55xx-common.h             |  16 +-
 drivers/leds/leds-lp8501.c                    |  23 +-
 include/dt-bindings/leds/common.h             |   3 +-
 include/linux/led-class-multicolor.h          | 121 +++
 include/linux/platform_data/leds-lp55xx.h     |   8 +
 24 files changed, 1977 insertions(+), 159 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-class-led-multicolor
 create mode 100644 Documentation/devicetree/bindings/leds/leds-class-multicolor.yaml
 create mode 100644 Documentation/devicetree/bindings/leds/leds-lp50xx.yaml
 create mode 100644 Documentation/leds/leds-class-multicolor.rst
 create mode 100644 drivers/leds/led-class-multicolor.c
 create mode 100644 drivers/leds/leds-lp50xx.c
 create mode 100644 include/linux/led-class-multicolor.h

-- 
2.25.1

