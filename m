Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AF9D3B969E
	for <lists+linux-leds@lfdr.de>; Fri, 20 Sep 2019 19:39:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393236AbfITRi5 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 20 Sep 2019 13:38:57 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:60786 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392269AbfITRia (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 20 Sep 2019 13:38:30 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8KHcQkp019944;
        Fri, 20 Sep 2019 12:38:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1569001106;
        bh=WmQo8kEFq//i7IWrs59n0bNmz9XqwB+1jjfjGqIiooY=;
        h=From:To:CC:Subject:Date;
        b=ht1k1ec+GhexCpCwoE76mdeq/tqxQhYL6kNW5zwF6uIWJIRlPudLMadU21r14hWBI
         YtzbALdwo3Rjg1pyBi83XlZcnNkjhNg0/xhGfU9CMOSoRWksBHpCuSsUNvEEIcdcmh
         IMoVWR9uCQ5M817kX4pQpa/plhvMQkm8L/QW5BmE=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8KHcQxm013162
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 20 Sep 2019 12:38:26 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 20
 Sep 2019 12:38:21 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 20 Sep 2019 12:38:22 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8KHcQdD107406;
        Fri, 20 Sep 2019 12:38:26 -0500
From:   Dan Murphy <dmurphy@ti.com>
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Dan Murphy <dmurphy@ti.com>
Subject: [PATCH v8 0/9] Multicolor FW v8 update
Date:   Fri, 20 Sep 2019 12:41:30 -0500
Message-ID: <20190920174139.30079-1-dmurphy@ti.com>
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

Per request I removed the ops structure.  But there is a potential need for some
device drivers to have a call back that sets the intesity of the LED color
without modifying the hardware register.  The hardware registers are only updated
when the brightness_set<op> is called.  The need arises with the LP50xx chip
series where the chip has 2 control knobs to modify the output current to the
LED.  In most cases drivers only have a single brightness register for a given
iOUT pin.  But the LP50xx has a brightness register that controls cluster
brightness and individual registers to control the monochrome LED intensity.

The set_color_brightness call back has been simplified in the LP50xx device
driver so that it can cache the LED intensity in it's stack for a specific color
as opposed to having to call back into the MC FW for the current intensity which
made the driver complex.
Once the set_brightness<op> is called the driver can set the brightness and then
set the LED intensity registers if the driver has that ability.

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

 .../ABI/testing/sysfs-class-led-multicolor    |  43 +
 .../bindings/leds/leds-class-multicolor.txt   |  95 +++
 .../devicetree/bindings/leds/leds-lp50xx.txt  | 148 ++++
 Documentation/leds/index.rst                  |   1 +
 Documentation/leds/leds-class-multicolor.rst  |  91 ++
 drivers/leds/Kconfig                          |  17 +
 drivers/leds/Makefile                         |   2 +
 drivers/leds/led-class-multicolor.c           | 316 +++++++
 drivers/leds/led-core.c                       |   1 +
 drivers/leds/leds-lp50xx.c                    | 785 ++++++++++++++++++
 drivers/leds/leds-lp5523.c                    |  13 +
 drivers/leds/leds-lp55xx-common.c             | 131 ++-
 drivers/leds/leds-lp55xx-common.h             |   9 +
 include/dt-bindings/leds/common.h             |   3 +-
 include/linux/led-class-multicolor.h          |  76 ++
 include/linux/platform_data/leds-lp55xx.h     |   6 +
 16 files changed, 1714 insertions(+), 23 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-class-led-multicolor
 create mode 100644 Documentation/devicetree/bindings/leds/leds-class-multicolor.txt
 create mode 100644 Documentation/devicetree/bindings/leds/leds-lp50xx.txt
 create mode 100644 Documentation/leds/leds-class-multicolor.rst
 create mode 100644 drivers/leds/led-class-multicolor.c
 create mode 100644 drivers/leds/leds-lp50xx.c
 create mode 100644 include/linux/led-class-multicolor.h

-- 
2.22.0.214.g8dca754b1e

