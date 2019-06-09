Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A7B2B3AB8E
	for <lists+linux-leds@lfdr.de>; Sun,  9 Jun 2019 21:10:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731217AbfFITKW (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 9 Jun 2019 15:10:22 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:36003 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729703AbfFITIf (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 9 Jun 2019 15:08:35 -0400
Received: by mail-wr1-f66.google.com with SMTP id n4so7000979wrs.3;
        Sun, 09 Jun 2019 12:08:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=5j1XQ8rfqrXErkgucOeAqpFjUsZLBc2+5LXQsnyyy3w=;
        b=r95z8gnVUwNeLz80ImqfjlZHdLHvaTeFDs8UGybHxFWKMJ16AXby3Egw8X/pS/w500
         7SvcwzdrOg5xvzXQo1sp9OhdLVklwWGL9wGl+PJ3Iu6+bmG/6D04c0ktP3I6a9mRSUl2
         P9EBm+NRKTsODLkYS9+V8Q2RAyD6M4vyy/dWbvlfV0Nvt2zI4MuYSg6fAAaPIkuZjm6E
         d6xyTkCu3CA3GB/kLvGlncXKWVhiP410rSS4kivu1KpWeKaS3m3ea11imgOLi3zVi+aH
         8sm8v3OjEcwXVQgt1wWFT1mP4yJVwfSb+7mJieYkhj/9qJpyAgcHZA23gjG5boj0z7WH
         CWaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=5j1XQ8rfqrXErkgucOeAqpFjUsZLBc2+5LXQsnyyy3w=;
        b=kR242CMki6L97I8g8dc6gvAVDS4flx6FF/rcav5ajh+DPtGBcMA96azvdI3Q0wigr3
         x4LPMaVs3g4l8kZS8g/paJKKyCdya0L1mUjf9CJ1Bp9udX0gVfY1uBSp01wfCYoqb8RV
         5NIOt6o19Wgh8UwHKzw0v2q3NC282D4K3nW64FO0IPDQlA5P2P+k16zN049pTqMH4Ael
         HglBh3Nd97msHioGA2tx8XivaUbJNZ08KxmbdGpifVHhQOhBw+wr2Y4xvW+f+/Kh//Jz
         gYbjwRjlGZmX0sz7vwkjf56Qx67VSp2L9QcTBeG9o9MSdZlQD9rZR3wCBUbl58y+l4Qi
         Ft0Q==
X-Gm-Message-State: APjAAAV+105f4QXAb6bI/q7koaZ4+eMPHiTh+BcSJcDZhfabbZ01oL/C
        8RU4DFmXmCdfpS+W/0Jt+UZqqe1z
X-Google-Smtp-Source: APXvYqyaJRS5EQ1ZgUkX31eUsiq+U2ZFUokjrRqsx7ONqzORiVQA0FYlqF9DckOUzb/e+mN9JSsWzw==
X-Received: by 2002:adf:fb8a:: with SMTP id a10mr5796189wrr.235.1560107313033;
        Sun, 09 Jun 2019 12:08:33 -0700 (PDT)
Received: from myhost.home (ckm12.neoplus.adsl.tpnet.pl. [83.31.88.12])
        by smtp.gmail.com with ESMTPSA id y38sm14725041wrd.41.2019.06.09.12.08.31
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 09 Jun 2019 12:08:32 -0700 (PDT)
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
To:     linux-leds@vger.kernel.org
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        pavel@ucw.cz, robh@kernel.org, dtor@google.com, linux@roeck-us.net,
        dmurphy@ti.com, jacek.anaszewski@gmail.com,
        Baolin Wang <baolin.wang@linaro.org>,
        Daniel Mack <daniel@zonque.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Oleh Kravchenko <oleg@kaa.org.ua>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Simon Shields <simon@lineageos.org>
Subject: [PATCH v5 04/26] dt-bindings: leds: Add properties for LED name construction
Date:   Sun,  9 Jun 2019 21:07:41 +0200
Message-Id: <20190609190803.14815-5-jacek.anaszewski@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190609190803.14815-1-jacek.anaszewski@gmail.com>
References: <20190609190803.14815-1-jacek.anaszewski@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Introduce dedicated properties for conveying information about
LED function and color. Mark old "label" property as deprecated.

Additionally function-enumerator property is being provided
for the cases when neither function nor color can be used
for LED differentiation.

Signed-off-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Baolin Wang <baolin.wang@linaro.org>
Cc: Pavel Machek <pavel@ucw.cz>
Cc: Dan Murphy <dmurphy@ti.com>
Cc: Daniel Mack <daniel@zonque.org>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Oleh Kravchenko <oleg@kaa.org.ua>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Simon Shields <simon@lineageos.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/leds/common.txt | 62 ++++++++++++++++++++---
 1 file changed, 54 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/leds/common.txt b/Documentation/devicetree/bindings/leds/common.txt
index 70876ac11367..9fa6f9795d50 100644
--- a/Documentation/devicetree/bindings/leds/common.txt
+++ b/Documentation/devicetree/bindings/leds/common.txt
@@ -10,14 +10,30 @@ can influence the way of the LED device initialization, the LED components
 have to be tightly coupled with the LED device binding. They are represented
 by child nodes of the parent LED device binding.
 
+
 Optional properties for child nodes:
 - led-sources : List of device current outputs the LED is connected to. The
 		outputs are identified by the numbers that must be defined
 		in the LED device binding documentation.
+
+- function: LED functon. Use one of the LED_FUNCTION_* prefixed definitions
+	    from the header include/dt-bindings/leds/common.h.
+	    If there is no matching LED_FUNCTION available, add a new one.
+
+- color : Color of the LED. Use one of the LED_COLOR_ID_* prefixed definitions
+	  from the header include/dt-bindings/leds/common.h.
+	  If there is no matching LED_COLOR_ID available, add a new one.
+
+- function-enumerator: Integer to be used when more than one instance
+                       of the same function is needed, differing only with
+		       an ordinal number.
+
 - label : The label for this LED. If omitted, the label is taken from the node
 	  name (excluding the unit address). It has to uniquely identify
 	  a device, i.e. no other LED class device can be assigned the same
-	  label.
+	  label. This property is deprecated - use 'function' and 'color'
+	  properties instead. function-enumerator has no effect when this
+	  property is present.
 
 - default-state : The initial state of the LED. Valid values are "on", "off",
   and "keep". If the LED is already on or off and the default-state property is
@@ -99,29 +115,59 @@ Required properties for trigger source:
 
 * Examples
 
-gpio-leds {
+#include <dt-bindings/leds/common.h>
+
+led-controller@0 {
 	compatible = "gpio-leds";
 
-	system-status {
-		label = "Status";
+	led0 {
+		function = LED_FUNCTION_STATUS;
 		linux,default-trigger = "heartbeat";
 		gpios = <&gpio0 0 GPIO_ACTIVE_HIGH>;
 	};
 
-	usb {
+	led1 {
+		function = LED_FUNCTION_USB;
 		gpios = <&gpio0 1 GPIO_ACTIVE_HIGH>;
 		trigger-sources = <&ohci_port1>, <&ehci_port1>;
 	};
 };
 
-max77693-led {
+led-controller@0 {
 	compatible = "maxim,max77693-led";
 
-	camera-flash {
-		label = "Flash";
+	led {
+		function = LED_FUNCTION_FLASH;
+		color = <LED_COLOR_ID_WHITE>;
 		led-sources = <0>, <1>;
 		led-max-microamp = <50000>;
 		flash-max-microamp = <320000>;
 		flash-max-timeout-us = <500000>;
 	};
 };
+
+led-controller@30 {
+        compatible = "panasonic,an30259a";
+        reg = <0x30>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        led@1 {
+		reg = <1>;
+		linux,default-trigger = "heartbeat";
+		function = LED_FUNCTION_INDICATOR;
+		function-enumerator = <1>;
+        };
+
+        led@2 {
+		reg = <2>;
+		function = LED_FUNCTION_INDICATOR;
+		function-enumerator = <2>;
+        };
+
+        led@3 {
+		reg = <3>;
+		function = LED_FUNCTION_INDICATOR;
+		function-enumerator = <3>;
+        };
+};
-- 
2.11.0

