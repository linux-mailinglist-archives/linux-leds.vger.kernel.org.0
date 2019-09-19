Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3A880B80EC
	for <lists+linux-leds@lfdr.de>; Thu, 19 Sep 2019 20:35:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404068AbfISSeg (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 19 Sep 2019 14:34:36 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:50528 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732829AbfISSeL (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 19 Sep 2019 14:34:11 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8JIY60d112778;
        Thu, 19 Sep 2019 13:34:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1568918046;
        bh=aDnoBFWDPH5yf3sUpD6y2qhxVdVUCRPez/c5umpomos=;
        h=From:To:CC:Subject:Date;
        b=g6tejj/5cbfsk5ewvI6x3pu4cG/xwSSB6z8Ajq7xXlTRx5hD3unXhXkgFeRWMB2j0
         HDJvqQJlMchsT/XiIHVGHpKOHCzN5tttDQEK+7mzymLs+G11NTmc5eRMUQXvys1SmR
         PrWusqYG5uAXMW3sZu+gv9aPlVatjRShIBSz4pSE=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8JIY6GX109542
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 19 Sep 2019 13:34:06 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 19
 Sep 2019 13:34:02 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 19 Sep 2019 13:34:06 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8JIY6Ig095505;
        Thu, 19 Sep 2019 13:34:06 -0500
From:   Dan Murphy <dmurphy@ti.com>
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Dan Murphy <dmurphy@ti.com>
Subject: [PATCH v7 0/9] Multicolor Framework updates
Date:   Thu, 19 Sep 2019 13:36:48 -0500
Message-ID: <20190919183657.1339-1-dmurphy@ti.com>
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

This is the v7 of the multicolor framework.

Updated the code and documentation for v7:
* Removed monochrome LED color directories.
* Added <led_color>_intensity and <led_color>_max_intensity files to the colors
directory.

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

 .../ABI/testing/sysfs-class-led-multicolor    |  43 +
 .../bindings/leds/leds-class-multicolor.txt   |  95 +++
 .../devicetree/bindings/leds/leds-lp50xx.txt  | 148 ++++
 Documentation/leds/index.rst                  |   1 +
 Documentation/leds/leds-class-multicolor.rst  |  91 ++
 drivers/leds/Kconfig                          |  17 +
 drivers/leds/Makefile                         |   2 +
 drivers/leds/led-class-multicolor.c           | 326 +++++++
 drivers/leds/led-core.c                       |   1 +
 drivers/leds/leds-lp50xx.c                    | 807 ++++++++++++++++++
 drivers/leds/leds-lp5523.c                    |  13 +
 drivers/leds/leds-lp55xx-common.c             | 131 ++-
 drivers/leds/leds-lp55xx-common.h             |   9 +
 include/dt-bindings/leds/common.h             |   3 +-
 include/linux/led-class-multicolor.h          |  84 ++
 include/linux/platform_data/leds-lp55xx.h     |   6 +
 16 files changed, 1754 insertions(+), 23 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-class-led-multicolor
 create mode 100644 Documentation/devicetree/bindings/leds/leds-class-multicolor.txt
 create mode 100644 Documentation/devicetree/bindings/leds/leds-lp50xx.txt
 create mode 100644 Documentation/leds/leds-class-multicolor.rst
 create mode 100644 drivers/leds/led-class-multicolor.c
 create mode 100644 drivers/leds/leds-lp50xx.c
 create mode 100644 include/linux/led-class-multicolor.h

-- 
2.22.0.214.g8dca754b1e

