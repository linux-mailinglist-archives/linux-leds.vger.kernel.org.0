Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7140DB54BC
	for <lists+linux-leds@lfdr.de>; Tue, 17 Sep 2019 19:58:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731380AbfIQR5j (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 17 Sep 2019 13:57:39 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:33722 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726494AbfIQR5j (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 17 Sep 2019 13:57:39 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8HHvYbk113127;
        Tue, 17 Sep 2019 12:57:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1568743054;
        bh=6Z2cBqLsJ0iVJLVLuc89fOae+4wo06v0RLtO0VcnawI=;
        h=From:To:CC:Subject:Date;
        b=GS1CC/tzJMOmOQwapiZKKmPeJRCZmV9pmBdtb6CjZaaBdDcw+qCFp1Mx6vIwMFcCG
         IHYcb6v2ZVbz2CB6modbSt/lZrMYLI92BBcztXdylNcspxiBGlwISoMxaQ7u19T6xg
         fdbNyOXfIcMt1IAzJZs/H8ayUDYcnmtqOCrdiqvg=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8HHvYBt116911
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 17 Sep 2019 12:57:34 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 17
 Sep 2019 12:57:33 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 17 Sep 2019 12:57:30 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8HHvX2K109328;
        Tue, 17 Sep 2019 12:57:33 -0500
From:   Dan Murphy <dmurphy@ti.com>
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Dan Murphy <dmurphy@ti.com>
Subject: [PATCH v6 1/9] leds: multicolor: Add sysfs interface definition
Date:   Tue, 17 Sep 2019 12:59:29 -0500
Message-ID: <20190917175937.13872-1-dmurphy@ti.com>
X-Mailer: git-send-email 2.22.0.214.g8dca754b1e
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Add a documentation of LED Multicolor LED class specific
sysfs attributes.

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---

v6 - Removed color_mix and color_id files

 .../ABI/testing/sysfs-class-led-multicolor    | 43 +++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-class-led-multicolor

diff --git a/Documentation/ABI/testing/sysfs-class-led-multicolor b/Documentation/ABI/testing/sysfs-class-led-multicolor
new file mode 100644
index 000000000000..b8f459f97919
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-class-led-multicolor
@@ -0,0 +1,43 @@
+What:		/sys/class/leds/<led>/brightness
+Date:		Sept 2019
+KernelVersion:	5.5
+Contact:	Dan Murphy <dmurphy@ti.com>
+Description:	read/write
+		Writing to this file will update all LEDs within the group to a
+		calculated percentage of what each color LED intensity is set
+		to. The percentage is calculated via the equation below:
+
+		led_brightness = requested_value * led_color_intensity/led_color_max_intensity
+
+		For additional details please refer to
+		Documentation/leds/leds-class-multicolor.rst.
+
+		The value of the color is from 0 to
+		/sys/class/leds/<led>/max_brightness.
+
+What:		/sys/class/leds/<led>/colors/<led_color>/intensity
+Date:		Sept 2019
+KernelVersion:	5.5
+Contact:	Dan Murphy <dmurphy@ti.com>
+Description:	read/write
+		The led_color directory is dynamically created based on the
+		colors defined by the registrar of the class.
+		The value for the led_color is defined in the
+		include/dt-bindings/leds/common.h. There is one directory per
+		color presented.  The intensity file is created under each
+		led_color directory and controls the individual LED color
+		setting.
+
+		The value of the color is from 0 to
+		/sys/class/leds/<led>/colors/<led_color>/max_intensity.
+
+What:		/sys/class/leds/<led>/colors/<led_color>/max_intensity
+Date:		Sept 2019
+KernelVersion:	5.5
+Contact:	Dan Murphy <dmurphy@ti.com>
+Description:	read only
+		Maximum intensity level for the LED color, default is
+		255 (LED_FULL).
+
+		If the LED does not support different intensity levels, this
+		should be 1.
-- 
2.22.0.214.g8dca754b1e

