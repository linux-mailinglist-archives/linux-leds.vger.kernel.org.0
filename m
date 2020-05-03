Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F8231C2C4D
	for <lists+linux-leds@lfdr.de>; Sun,  3 May 2020 14:41:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728477AbgECMlC (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 3 May 2020 08:41:02 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:43882 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728257AbgECMlC (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 3 May 2020 08:41:02 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 043CewmU098917;
        Sun, 3 May 2020 07:40:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1588509658;
        bh=JbS5R0zrGzqjMx/vR0u2+fgwvuDwYatQZxqNGA47CI0=;
        h=From:To:CC:Subject:Date;
        b=Gh7TJh6JWyFUBMK4Y4hpYm9gElqnE/oeMqkt7DW/Msz7t9Q0roCHgaPXdPcoY0H4l
         1tBxjwn6LwlWrDN1OCHpAb9jK6yCmCZ9AV+S8e5p7dS//yeeXQXfbLVXTk+BXfx1Pp
         r5enFv8xqHa3i+OFPzjox1W0QlJnC5uOYVLUmIQk=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 043CewPu124070
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Sun, 3 May 2020 07:40:58 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Sun, 3 May
 2020 07:40:57 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Sun, 3 May 2020 07:40:57 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 043CevtW017684;
        Sun, 3 May 2020 07:40:57 -0500
From:   Dan Murphy <dmurphy@ti.com>
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Dan Murphy <dmurphy@ti.com>
Subject: [PATCH v24 00/16] Multicolor Framework v24
Date:   Sun, 3 May 2020 07:31:59 -0500
Message-ID: <20200503123215.6449-1-dmurphy@ti.com>
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
 .../bindings/leds/leds-class-multicolor.yaml  |  71 ++
 .../devicetree/bindings/leds/leds-lp50xx.yaml | 179 ++++
 .../devicetree/bindings/leds/leds-lp55xx.txt  | 163 +++-
 Documentation/leds/index.rst                  |   1 +
 Documentation/leds/leds-class-multicolor.rst  |  86 ++
 MAINTAINERS                                   |   8 +
 arch/arm/boot/dts/imx6dl-yapp4-common.dtsi    |  14 +-
 arch/arm/boot/dts/omap3-n900.dts              |  29 +-
 arch/arm/boot/dts/ste-href.dtsi               |  22 +-
 drivers/leds/Kconfig                          |  23 +
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
 24 files changed, 1972 insertions(+), 159 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-class-led-multicolor
 create mode 100644 Documentation/devicetree/bindings/leds/leds-class-multicolor.yaml
 create mode 100644 Documentation/devicetree/bindings/leds/leds-lp50xx.yaml
 create mode 100644 Documentation/leds/leds-class-multicolor.rst
 create mode 100644 drivers/leds/led-class-multicolor.c
 create mode 100644 drivers/leds/leds-lp50xx.c
 create mode 100644 include/linux/led-class-multicolor.h

-- 
2.25.1

