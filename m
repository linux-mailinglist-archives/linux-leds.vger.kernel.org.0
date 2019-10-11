Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 108CDD406D
	for <lists+linux-leds@lfdr.de>; Fri, 11 Oct 2019 15:07:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728235AbfJKNHY (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 11 Oct 2019 09:07:24 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:41592 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728147AbfJKNHX (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 11 Oct 2019 09:07:23 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9BD7IHf033359;
        Fri, 11 Oct 2019 08:07:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1570799238;
        bh=N3d4fsd58jS0rKBNueYjJBO2F8q1L3xywii7E5kK4rY=;
        h=From:To:CC:Subject:Date;
        b=V9mkCl7MuO8MWTdmkrPK92QHGvVI9m8E3R89+4xZTEBRtahNG0WjzZCmHhX4FaHpb
         0hqgfP9nv3S7kk2u5XFCG4vpSrouZBtTEa6Xh99a9Z7N7zZ0U+5U1pXS3Acj4wjV5Y
         WUYMu/sv/9nHvcUhc3Ilt+9nIlWLf371KRs/daXI=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9BD7IDK078673
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 11 Oct 2019 08:07:18 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 11
 Oct 2019 08:07:14 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 11 Oct 2019 08:07:18 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9BD7IeT106100;
        Fri, 11 Oct 2019 08:07:18 -0500
From:   Dan Murphy <dmurphy@ti.com>
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Dan Murphy <dmurphy@ti.com>
Subject: [PATCH v12 00/16] Multicolor Framework v12
Date:   Fri, 11 Oct 2019 08:06:41 -0500
Message-ID: <20191011130657.4713-1-dmurphy@ti.com>
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

Minor changes per review comments.
https://lore.kernel.org/patchwork/project/lkml/list/?series=413385

Rebased the series on top of Pavel's next branch.

Multicolor changes:
Rename led_mc_calc_brightness to led_mc_calc_color_components
Updated the binding example for the function from STATUS to CHARGING

LP50xx changes:
None

LP55xx changes:
Changed color_component array allocation from COLOR_MAX_ID to MAX_GROUPED_CHANNELS
Updated MC API to call led_mc_calc_color_components

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

 .../ABI/testing/sysfs-class-led-multicolor    |  36 +
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
 drivers/leds/leds-lp55xx-common.h             |   9 +
 include/dt-bindings/leds/common.h             |   3 +-
 include/linux/led-class-multicolor.h          | 143 ++++
 include/linux/platform_data/leds-lp55xx.h     |   7 +
 21 files changed, 2020 insertions(+), 93 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-class-led-multicolor
 create mode 100644 Documentation/devicetree/bindings/leds/leds-class-multicolor.txt
 create mode 100644 Documentation/devicetree/bindings/leds/leds-lp50xx.txt
 create mode 100644 Documentation/leds/leds-class-multicolor.rst
 create mode 100644 drivers/leds/led-class-multicolor.c
 create mode 100644 drivers/leds/leds-lp50xx.c
 create mode 100644 include/linux/led-class-multicolor.h

-- 
2.22.0.214.g8dca754b1e

