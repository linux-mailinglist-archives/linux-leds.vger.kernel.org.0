Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BAAFB756F0
	for <lists+linux-leds@lfdr.de>; Thu, 25 Jul 2019 20:29:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726087AbfGYS2y (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 25 Jul 2019 14:28:54 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:33760 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725800AbfGYS2Z (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 25 Jul 2019 14:28:25 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x6PISLYR047413;
        Thu, 25 Jul 2019 13:28:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1564079301;
        bh=qcr4ypaaLHe8OTM4DOVLX6D4nuqeZQhIdKwIxRRQijo=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=pdqOpuIkJ17R2xNaLP7mxDQI9OiFnGQa2KzmFPdrVW+OAsIBST1tsGKaUwNdQdqwS
         S2KYC0lHdyQPTy1mTMvlK74Lt4mvov4c7DhdEugg2g17iEjkaxrC+4A1WnCout2oiu
         0NEXai8foeJKDid8RafMLg4yAi7+JuQmrwlbyiWc=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x6PISL3h061764
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 25 Jul 2019 13:28:21 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 25
 Jul 2019 13:28:21 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 25 Jul 2019 13:28:21 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x6PISL3K025715;
        Thu, 25 Jul 2019 13:28:21 -0500
From:   Dan Murphy <dmurphy@ti.com>
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Dan Murphy <dmurphy@ti.com>
Subject: [PATCH v4 1/9] leds: multicolor: Add sysfs interface definition
Date:   Thu, 25 Jul 2019 13:28:10 -0500
Message-ID: <20190725182818.29556-2-dmurphy@ti.com>
X-Mailer: git-send-email 2.22.0.214.g8dca754b1e
In-Reply-To: <20190725182818.29556-1-dmurphy@ti.com>
References: <20190725182818.29556-1-dmurphy@ti.com>
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
 .../ABI/testing/sysfs-class-led-multicolor    | 67 +++++++++++++++++++
 1 file changed, 67 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-class-led-multicolor

diff --git a/Documentation/ABI/testing/sysfs-class-led-multicolor b/Documentation/ABI/testing/sysfs-class-led-multicolor
new file mode 100644
index 000000000000..59839f0eae76
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-class-led-multicolor
@@ -0,0 +1,67 @@
+What:		/sys/class/leds/<led>/brightness
+Date:		Sept 2019
+KernelVersion:	TBD
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
+What:		/sys/class/leds/<led>/colors/color_mix
+Date:		Sept 2019
+KernelVersion:	TBD
+Contact:	Dan Murphy <dmurphy@ti.com>
+Description:	read/write
+		The color_mix file allows writing all registered multicolor LEDs
+		virtually at the same time.  The value(s) written to this file
+		contain the intensity values for each multicolor LED within
+		the colors directory.  The color indexes are reported in the
+		color_id file as defined in this document.
+		Please refer to the leds-class-multicolor.txt in the
+		Documentation directory for a complete description.
+
+What:		/sys/class/leds/<led>/colors/<led_color>/color_id
+Date:		Sept 2019
+KernelVersion:	TBD
+Contact:	Dan Murphy <dmurphy@ti.com>
+Description:	read only
+		This file when read will return the index of the color in the
+		color_mix.
+		Please refer to the leds-class-multicolor.txt in the
+		Documentation directory for a complete description.
+
+What:		/sys/class/leds/<led>/colors/<led_color>/intensity
+Date:		Sept 2019
+KernelVersion:	TBD
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
+		The value of the color is from 0 to
+		/sys/class/leds/<led>/colors/<led_color>/max_intensity.
+
+What:		/sys/class/leds/<led>/colors/<led_color>/max_intensity
+Date:		Sept 2019
+KernelVersion:	TBD
+Contact:	Dan Murphy <dmurphy@ti.com>
+Description:	read only
+		Maximum intensity level for the LED color, default is
+		255 (LED_FULL).
+
+		If the LED does not support different intensity levels, this
+		should be 1.
-- 
2.22.0.214.g8dca754b1e

