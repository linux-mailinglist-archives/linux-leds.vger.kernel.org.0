Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0567C301A2
	for <lists+linux-leds@lfdr.de>; Thu, 30 May 2019 20:16:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726518AbfE3SQl (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 30 May 2019 14:16:41 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:36002 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726461AbfE3SQl (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 30 May 2019 14:16:41 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x4UIGVuL114706;
        Thu, 30 May 2019 13:16:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1559240191;
        bh=oRaCzpkhU9F+bh07oXIPESTr239zaKBUXyVW0YXCdGs=;
        h=From:To:CC:Subject:Date;
        b=IhxIFiTlpl3MpZ5YNOyritLcMANh010TLRRdSYvQGL9NKu3QbE6yT7XG9SjlyZ5pb
         ECCgzi/wzUpLXwRFNBSK4v0dYc5fCL+sgjJ24cR7TkWJhENsyM7APz0xbyXeO4TSAE
         etbD8t0eeHc2HiUl2XMKYsCgQ5lIIl+n3MannB/4=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x4UIGVVS089727
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 30 May 2019 13:16:31 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 30
 May 2019 13:16:31 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 30 May 2019 13:16:30 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x4UIGUGj035678;
        Thu, 30 May 2019 13:16:31 -0500
From:   Dan Murphy <dmurphy@ti.com>
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Dan Murphy <dmurphy@ti.com>
Subject: [PATCH v4 1/2] leds: multicolor: Add sysfs interface definition
Date:   Thu, 30 May 2019 13:16:28 -0500
Message-ID: <20190530181630.30373-1-dmurphy@ti.com>
X-Mailer: git-send-email 2.21.0.5.gaeb582a983
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

v4 - Add LED class parent brightness definition to the text - https://lore.kernel.org/patchwork/patch/1078398/

 .../ABI/testing/sysfs-class-led-multicolor    | 74 +++++++++++++++++++
 1 file changed, 74 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-class-led-multicolor

diff --git a/Documentation/ABI/testing/sysfs-class-led-multicolor b/Documentation/ABI/testing/sysfs-class-led-multicolor
new file mode 100644
index 000000000000..ec2b6ac63ecc
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-class-led-multicolor
@@ -0,0 +1,74 @@
+What:		/sys/class/leds/<led>/brightness
+Date:		April 2019
+KernelVersion:	5.2
+Contact:	Dan Murphy <dmurphy@ti.com>
+Description:	read/write
+		The multicolor class will redirect the device drivers call back
+		function for brightness control to the multicolor class
+		brightness control function.
+
+		Writing to this file will update all LEDs within the group to a
+		calculated percentage of what each color LED in the group is set
+		to.  Please refer to the leds-class-multicolor.txt in the
+		Documentation directory for a complete description.
+
+		The value of the color is from 0 to
+		/sys/class/leds/<led>/max_brightness.
+
+What:		/sys/class/leds/<led>/colors/sync_enable
+Date:		April 2019
+KernelVersion:	5.2
+Contact:	Dan Murphy <dmurphy@ti.com>
+Description:	read/write
+		Writing a 1 to this file will enable the synchronization of all
+		the defined color LEDs within the LED node.  Brightness values
+		for each LED will be stored and written when sync is set to 1.
+		Writing a 0 to this file will disable syncing and allow
+		individual control of the LEDs brightness settings.
+
+What:		/sys/class/leds/<led>/colors/sync
+Date:		April 2019
+KernelVersion:	5.2
+Contact:	Dan Murphy <dmurphy@ti.com>
+Description:	write only
+		Writing a 1 to this file while sync_enable is set to 1 will
+		write the current brightness values to all defined LEDs within
+		the LED node.  All LEDs defined will be configured based
+		on the brightness that has been requested.
+
+		If sync_enable is set to 0 then writing a 1 to sync has no
+		affect on the LEDs.
+
+What:		/sys/class/leds/<led>/colors/<led_color>/brightness
+Date:		April 2019
+KernelVersion:	5.2
+Contact:	Dan Murphy <dmurphy@ti.com>
+Description:	read/write
+		The led_color directory is dynamically created based on the
+		colors defined by the registrar of the class.
+		The led_color can be but not limited to red, green, blue,
+		white, amber, yellow and violet.  Drivers can also declare a
+		LED color for presentation.  There is one directory per color
+		presented.  The brightness file is created under each
+		led_color directory and controls the individual LED color
+		setting.
+
+		If sync is enabled then	writing the brightness value of the LED
+		is deferred until a 1 is written to
+		/sys/class/leds/<led>/color/sync.  If syncing is
+		disabled then the LED brightness value will be written
+		immediately to the LED driver.
+
+		The value of the color is from 0 to
+		/sys/class/leds/<led>/colors/<led_color>/max_brightness.
+
+What:		/sys/class/leds/<led>/colors/<led_color>/max_brightness
+Date:		April 2019
+KernelVersion:	5.2
+Contact:	Dan Murphy <dmurphy@ti.com>
+Description:	read only
+		Maximum brightness level for the LED color, default is
+		255 (LED_FULL).
+
+		If the LED does not support different brightness levels, this
+		should be 1.
-- 
2.21.0.5.gaeb582a983

