Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2E790B80F1
	for <lists+linux-leds@lfdr.de>; Thu, 19 Sep 2019 20:35:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403909AbfISSfo (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 19 Sep 2019 14:35:44 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:58384 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732693AbfISSeL (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 19 Sep 2019 14:34:11 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8JIY6dY087601;
        Thu, 19 Sep 2019 13:34:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1568918046;
        bh=3r8NrvCOTUy6K4oFLHF2BYQC94/INWkCD7dFECGXy+E=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=mbJUV2oQx7w6UiaVCX/wlRsQMfAled5A1HyV2Ny9AB7ByDxMqzMaxp3itiNeILoXy
         N0Qe9PB2CW65YuSPjuAxck7c7aAtKniT2wAfFVp6cJ4BxKIy1dqBOmiVlU6TOOX7o+
         fQIVURUYg2rTt0x2wJMCK0WuDGDbTRYC1Qc2EVgI=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8JIY6pU107046
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 19 Sep 2019 13:34:06 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 19
 Sep 2019 13:34:02 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 19 Sep 2019 13:34:06 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8JIY6H7034151;
        Thu, 19 Sep 2019 13:34:06 -0500
From:   Dan Murphy <dmurphy@ti.com>
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Dan Murphy <dmurphy@ti.com>
Subject: [PATCH v7 1/9] leds: multicolor: Add sysfs interface definition
Date:   Thu, 19 Sep 2019 13:36:49 -0500
Message-ID: <20190919183657.1339-2-dmurphy@ti.com>
X-Mailer: git-send-email 2.22.0.214.g8dca754b1e
In-Reply-To: <20190919183657.1339-1-dmurphy@ti.com>
References: <20190919183657.1339-1-dmurphy@ti.com>
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
 .../ABI/testing/sysfs-class-led-multicolor    | 43 +++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-class-led-multicolor

diff --git a/Documentation/ABI/testing/sysfs-class-led-multicolor b/Documentation/ABI/testing/sysfs-class-led-multicolor
new file mode 100644
index 000000000000..39fc73becfec
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
+What:		/sys/class/leds/<led>/colors/<led_color>_intensity
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
+		/sys/class/leds/<led>/colors/<led_color>_max_intensity.
+
+What:		/sys/class/leds/<led>/colors/<led_color>_max_intensity
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

