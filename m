Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 52208BE394
	for <lists+linux-leds@lfdr.de>; Wed, 25 Sep 2019 19:42:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2439879AbfIYRlh (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 25 Sep 2019 13:41:37 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:50782 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2443113AbfIYRlb (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 25 Sep 2019 13:41:31 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8PHfFM4029456;
        Wed, 25 Sep 2019 12:41:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1569433275;
        bh=LB2/mEfQyYVK6iE8q9uOLAkmUrKRQZdWqraPFhfOHBg=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=P1eOPFC+8HuzwBAlhiJe8s4P22vlSR3kdfobl3h6K8T5Nr7GTsUYy7pUCxORW0LsX
         t+n8AAT+EUYs7LT0ibOBXUqsy3WkUDqk/09MnOO6S6okP3wTtxWbITimFUQqU6/BNq
         hRNF7AwY+oMIYFB3ZxF0Q+3yPNk1bDtuylGrJfGc=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8PHfE5p048301
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 25 Sep 2019 12:41:15 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 25
 Sep 2019 12:41:07 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 25 Sep 2019 12:41:14 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8PHfEqf031148;
        Wed, 25 Sep 2019 12:41:14 -0500
From:   Dan Murphy <dmurphy@ti.com>
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Dan Murphy <dmurphy@ti.com>, <linus.walleij@linaro.org>,
        <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Tony Lindgren <tony@atomide.com>,
        =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>
Subject: [PATCH v9 01/15] leds: multicolor: Add sysfs interface definition
Date:   Wed, 25 Sep 2019 12:46:02 -0500
Message-ID: <20190925174616.3714-2-dmurphy@ti.com>
X-Mailer: git-send-email 2.22.0.214.g8dca754b1e
In-Reply-To: <20190925174616.3714-1-dmurphy@ti.com>
References: <20190925174616.3714-1-dmurphy@ti.com>
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

Add multicolor framework class documentation describing the
usage of the files created.

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 .../ABI/testing/sysfs-class-led-multicolor    | 35 +++++++
 Documentation/leds/index.rst                  |  1 +
 Documentation/leds/leds-class-multicolor.rst  | 96 +++++++++++++++++++
 3 files changed, 132 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-class-led-multicolor
 create mode 100644 Documentation/leds/leds-class-multicolor.rst

diff --git a/Documentation/ABI/testing/sysfs-class-led-multicolor b/Documentation/ABI/testing/sysfs-class-led-multicolor
new file mode 100644
index 000000000000..65cb43de26e6
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-class-led-multicolor
@@ -0,0 +1,35 @@
+What:		/sys/class/leds/<led>/brightness
+Date:		Sept 2019
+KernelVersion:	5.5
+Contact:	Dan Murphy <dmurphy@ti.com>
+Description:	read/write
+		Writing to this file will update all LEDs within the group to a
+		calculated percentage of what each color LED intensity is set
+		to. The percentage is calculated via the equation below:
+
+		led_brightness = brightness * <color>_intensity/<color>_max_intensity
+
+		For additional details please refer to
+		Documentation/leds/leds-class-multicolor.rst.
+
+		The value of the color is from 0 to
+		/sys/class/leds/<led>/max_brightness.
+
+What:		/sys/class/leds/<led>/colors/<color>_intensity
+Date:		Sept 2019
+KernelVersion:	5.5
+Contact:	Dan Murphy <dmurphy@ti.com>
+Description:	read/write
+		The <color>_intensity file is created based on the color
+		defined by the registrar of the class.
+		There is one file per color presented.
+
+		The value of the color is from 0 to
+		/sys/class/leds/<led>/colors/<color>_max_intensity.
+
+What:		/sys/class/leds/<led>/colors/<color>_max_intensity
+Date:		Sept 2019
+KernelVersion:	5.5
+Contact:	Dan Murphy <dmurphy@ti.com>
+Description:	read only
+		Maximum intensity level for the LED color.
diff --git a/Documentation/leds/index.rst b/Documentation/leds/index.rst
index 060f4e485897..bc70c6aa7138 100644
--- a/Documentation/leds/index.rst
+++ b/Documentation/leds/index.rst
@@ -9,6 +9,7 @@ LEDs
 
    leds-class
    leds-class-flash
+   leds-class-multicolor
    ledtrig-oneshot
    ledtrig-transient
    ledtrig-usbport
diff --git a/Documentation/leds/leds-class-multicolor.rst b/Documentation/leds/leds-class-multicolor.rst
new file mode 100644
index 000000000000..87a1588d7619
--- /dev/null
+++ b/Documentation/leds/leds-class-multicolor.rst
@@ -0,0 +1,96 @@
+====================================
+Multi Color LED handling under Linux
+====================================
+
+Description
+===========
+The multi color class groups monochrome LEDs and allows controlling two
+aspects of the final combined color: hue and lightness. The former is
+controlled via <color>_intensity files and the latter is controlled
+via brightness file.
+
+For more details on hue and lightness notions please refer to
+https://en.wikipedia.org/wiki/CIECAM02.
+
+Note that intensity files only cache the written value and the actual
+change of hardware state occurs upon writing brightness file. This
+allows for changing many factors of the perceived color in a virtually
+unnoticeable way for the human observer.
+
+Multicolor Class Control
+========================
+The multicolor class presents the LED groups under a directory called "colors".
+This directory is a child under the LED parent node created by the led_class
+framework.  The led_class framework is documented in led-class.rst within this
+documentation directory.
+
+Each colored LED will have two files created under the colors directory
+<color>_intensity and <color>_max_intensity. These files will contain
+one of LED_COLOR_ID_* definitions from the header
+include/dt-bindings/leds/common.h.
+
+Directory Layout Example
+========================
+root:/sys/class/leds/rgb:grouped_leds# ls -lR colors/
+-rw-rwxr-- 1 root root 4096 Jul 7 03:10 red_max_intensity
+--w--wx-w- 1 root root 4096 Jul 7 03:10 red_intensity
+-rw-rwxr-- 1 root root 4096 Jul 7 03:10 green_max_intensity
+--w--wx-w- 1 root root 4096 Jul 7 03:10 green_intensity
+-rw-rwxr-- 1 root root 4096 Jul 7 03:10 blue_max_intensity
+--w--wx-w- 1 root root 4096 Jul 7 03:10 blue_intensity
+
+Multicolor Class Brightness Control
+===================================
+The multiclor class framework will calculate each monochrome LEDs intensity.
+
+The brightness level for each LED is calculated based on the color LED
+intensity setting divided by the color LED max intensity setting multiplied by
+the requested brightness.
+
+led_brightness = brightness * <color>_intensity/<color>_max_intensity
+
+Example:
+Three LEDs are present in the group as defined in "Directory Layout Example"
+within this document.
+
+A user first writes the color LED brightness file with the brightness level that
+is necessary to achieve a blueish violet output from the RGB LED group.
+
+echo 138 > /sys/class/leds/rgb:grouped_leds/red_intensity
+echo 43 > /sys/class/leds/rgb:grouped_leds/green_intensity
+echo 226 > /sys/class/leds/rgb:grouped_leds/blue_intensity
+
+red -
+	intensity = 138
+	max_intensity = 255
+green -
+	intensity = 43
+	max_intensity = 255
+blue -
+	intensity = 226
+	max_intensity = 255
+
+The user can control the brightness of that RGB group by writing the parent
+'brightness' control.  Assuming a parent max_brightness of 255 the user may want
+to dim the LED color group to half.  The user would write a value of 128 to the
+parent brightness file then the values written to each LED will be adjusted
+base on this value
+
+cat /sys/class/leds/rgb:grouped_leds/max_brightness
+255
+echo 128 > /sys/class/leds/rgb:grouped_leds/brightness
+
+adjusted_red_value = 128 * 138/255 = 69
+adjusted_green_value = 128 * 43/255 = 21
+adjusted_blue_value = 128 * 226/255 = 113
+
+Reading the parent brightness file will return the current brightness value of
+the color LED group.
+
+cat /sys/class/leds/rgb:grouped_leds/max_brightness
+255
+
+echo 128 > /sys/class/leds/rgb:grouped_leds/brightness
+
+cat /sys/class/leds/rgb:grouped_leds/brightness
+128
-- 
2.22.0.214.g8dca754b1e

