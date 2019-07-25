Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 65E90756E1
	for <lists+linux-leds@lfdr.de>; Thu, 25 Jul 2019 20:28:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726207AbfGYS2Z (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 25 Jul 2019 14:28:25 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:55926 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726190AbfGYS2Z (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 25 Jul 2019 14:28:25 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x6PISLaq018031;
        Thu, 25 Jul 2019 13:28:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1564079301;
        bh=q9zTQE45kbN2ycPF4qFe0CzwfZebyiVg0U8gXs++/9A=;
        h=From:To:CC:Subject:Date;
        b=cgc4hDhSBKSQ9RG3m+Lr3Wp6BVe/naHe8EDnce6Iou5tS5Phyo7QpIBR2n7ujGMfi
         uV08y1ehX/ruI1fjq0ESW9FA/dxhshxZCaHDiZ8OqguxsGC1ZR4a5sPkTg8PU10ft+
         jraBPpEN/UbuNp7I1RBXzx1F79BjLSzU7gs/kb9M=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x6PISLJU123611
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 25 Jul 2019 13:28:21 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 25
 Jul 2019 13:28:21 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 25 Jul 2019 13:28:21 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x6PISKvt126291;
        Thu, 25 Jul 2019 13:28:21 -0500
From:   Dan Murphy <dmurphy@ti.com>
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Dan Murphy <dmurphy@ti.com>
Subject: [PATCH v4 0/9] Multicolor Framwork
Date:   Thu, 25 Jul 2019 13:28:09 -0500
Message-ID: <20190725182818.29556-1-dmurphy@ti.com>
X-Mailer: git-send-email 2.22.0.214.g8dca754b1e
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hello!

Here is the multicolor framework reworked with numerous changes.
Most importantly is the ABI to produce a color.

brightness file controls the cluster based on the color intensity set.
The color intensity can be set either through the colors/color_mix file,
which requires all LED values within the cluster to be written or the LED's
intensity can be controlled individually via the colors/<color>/intensity file.

This code has been tested using the LP5523 EVM and the LP50xx evms.  Triggers
work in this model.  I have performed tests to confirm that the color requested
stays consistent when ramping from LED_OFF to LED_FULL and back down to LED_OFF.

I anticipate another round of patches but I would like to get comments on all
the code.

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

 .../ABI/testing/sysfs-class-led-multicolor    |  67 ++
 .../bindings/leds/leds-class-multicolor.txt   |  96 +++
 .../devicetree/bindings/leds/leds-lp50xx.txt  | 148 ++++
 Documentation/leds/leds-class-multicolor.txt  | 152 ++++
 drivers/leds/Kconfig                          |  17 +
 drivers/leds/Makefile                         |   2 +
 drivers/leds/led-class-multicolor.c           | 402 +++++++++
 drivers/leds/led-core.c                       |   1 +
 drivers/leds/leds-lp50xx.c                    | 789 ++++++++++++++++++
 drivers/leds/leds-lp5523.c                    |  13 +
 drivers/leds/leds-lp55xx-common.c             | 153 +++-
 drivers/leds/leds-lp55xx-common.h             |  10 +
 include/dt-bindings/leds/common.h             |   3 +-
 include/linux/led-class-multicolor.h          |  96 +++
 include/linux/platform_data/leds-lp55xx.h     |   6 +
 modules.builtin.modinfo                       | Bin 0 -> 43550 bytes
 16 files changed, 1931 insertions(+), 24 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-class-led-multicolor
 create mode 100644 Documentation/devicetree/bindings/leds/leds-class-multicolor.txt
 create mode 100644 Documentation/devicetree/bindings/leds/leds-lp50xx.txt
 create mode 100644 Documentation/leds/leds-class-multicolor.txt
 create mode 100644 drivers/leds/led-class-multicolor.c
 create mode 100644 drivers/leds/leds-lp50xx.c
 create mode 100644 include/linux/led-class-multicolor.h
 create mode 100644 modules.builtin.modinfo

-- 
2.22.0.214.g8dca754b1e

