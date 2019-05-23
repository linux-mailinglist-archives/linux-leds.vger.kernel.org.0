Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A5DBE28B0C
	for <lists+linux-leds@lfdr.de>; Thu, 23 May 2019 21:58:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387428AbfEWTwB (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 23 May 2019 15:52:01 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:56298 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731840AbfEWTIm (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 23 May 2019 15:08:42 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x4NJ8bcv092481;
        Thu, 23 May 2019 14:08:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1558638517;
        bh=pVZocLlK6FwBNcQR7i4409JPN7kIWTMb5k5JK/XjDDY=;
        h=From:To:CC:Subject:Date;
        b=oo4cMjTq51aQlWO2MQlLJ86GWlh+lt9R0+VZlVOf2tk4nHQDOaTRNPcFOc6y5svx0
         vBlNWCY5joaXrsZmnzNHBu9bzPkNzmYVNzr3sV3o4owJ3E6cbQLcuV+YfjXU7i7OUD
         Sswrrb5C99NzKbfX6HXnsItESnxXnoBExhIGibnc=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x4NJ8bnd123847
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 23 May 2019 14:08:37 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 23
 May 2019 14:08:36 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 23 May 2019 14:08:36 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x4NJ8a3A027514;
        Thu, 23 May 2019 14:08:36 -0500
From:   Dan Murphy <dmurphy@ti.com>
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>, <robh+dt@kernel.org>
CC:     <devicetree@vger.kernel.org>, <linux-leds@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Dan Murphy <dmurphy@ti.com>
Subject: [PATCH v3 0/9] Multicolor Framework update
Date:   Thu, 23 May 2019 14:08:11 -0500
Message-ID: <20190523190820.29375-1-dmurphy@ti.com>
X-Mailer: git-send-email 2.21.0.5.gaeb582a983
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hello

In this series I have done quite a bit of rework and since there was not to
many review comments we can pretty much treat this as unreviewed.

I have removed the brightness-model definition from this series as it is an
enhancement to the multi color framework but is not required in the initial
submission.  And this seems to be the biggest source of contention in the patch
set.  So the idea is to get the base MC FW in place and let developers play with
it.

I have converted the LP5523 to use the MC framework and will update a couple
more drivers once I have the test harnesses to verify the implementation.

The biggest change to this series is that the parent brightness file now controls
all the color LEDs brightness within the directory.

I have written a script that writes brightness values to the colors and then
proceeds to write the parent brightness from 0->255 and then back to 0.
Basically pulsing the LED group.  I found that the color is uniform across the
brightness ranges.

Dan

Dan Murphy (9):
  leds: multicolor: Add sysfs interface definition
  dt: bindings: Add multicolor class dt bindings documention
  documention: leds: Add multicolor class documentation
  dt-bindings: leds: Add multicolor ID to the color ID  list
  leds: Add multicolor ID to the color ID list
  leds: multicolor: Introduce a multicolor class definition
  dt: bindings: lp50xx: Introduce the lp50xx family of RGB drivers
  leds: lp50xx: Add the LP50XX family of the RGB LED driver
  leds: Update the lp55xx to use the multi color framework

 .../ABI/testing/sysfs-class-led-multicolor    |  57 ++
 .../bindings/leds/leds-class-multicolor.txt   |  97 +++
 .../devicetree/bindings/leds/leds-lp50xx.txt  | 142 ++++
 Documentation/leds/leds-class-multicolor.txt  |  99 +++
 drivers/leds/Kconfig                          |  17 +
 drivers/leds/Makefile                         |   2 +
 drivers/leds/led-class-multicolor.c           | 421 +++++++++++
 drivers/leds/led-core.c                       |   1 +
 drivers/leds/leds-lp50xx.c                    | 714 ++++++++++++++++++
 drivers/leds/leds-lp5523.c                    |  13 +
 drivers/leds/leds-lp55xx-common.c             | 133 +++-
 drivers/leds/leds-lp55xx-common.h             |  10 +
 include/dt-bindings/leds/common.h             |   3 +-
 include/linux/led-class-multicolor.h          |  95 +++
 include/linux/platform_data/leds-lp55xx.h     |   5 +
 15 files changed, 1789 insertions(+), 20 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-class-led-multicolor
 create mode 100644 Documentation/devicetree/bindings/leds/leds-class-multicolor.txt
 create mode 100644 Documentation/devicetree/bindings/leds/leds-lp50xx.txt
 create mode 100644 Documentation/leds/leds-class-multicolor.txt
 create mode 100644 drivers/leds/led-class-multicolor.c
 create mode 100644 drivers/leds/leds-lp50xx.c
 create mode 100644 include/linux/led-class-multicolor.h

-- 
2.21.0.5.gaeb582a983

