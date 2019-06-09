Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F33DA3AB71
	for <lists+linux-leds@lfdr.de>; Sun,  9 Jun 2019 21:10:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730754AbfFITJK (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 9 Jun 2019 15:09:10 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:52118 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730747AbfFITJJ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 9 Jun 2019 15:09:09 -0400
Received: by mail-wm1-f65.google.com with SMTP id 207so1605755wma.1;
        Sun, 09 Jun 2019 12:09:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=upv7Vbgo1coKBDMdyJd/ZMbCzxChHqvQBd/9Rl/akWc=;
        b=ExK2Xy+sxNIo3xn/+KSiczarC/ApP0W/S48WwXlWx144elZvp9zA3pUNyewsoUoXK6
         ExSH09vPTFDt17vBSy19pMvSQWUwpgNkSUuKvNH/1pXzSQJUglfO60rOa8COBycBK6NN
         9VCsk0XFBefpMrjZowQsswdSxWYYGltFjCqxR2BN6W8rfgX80iU/AU3Ci/4XV2fRykFe
         gGbTux2q7gjMvsSEhAm0TcD7crCmbw5JfYNwTxJCLbpZVCg4nMOSYl6y04g6E1/oi5mn
         Y84ZWNfFL9bFe94x5Us1Ebv6qagfZI0P/f6vqG00j9lQfMIYquvkVHahXytIM8dct+u4
         VOeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=upv7Vbgo1coKBDMdyJd/ZMbCzxChHqvQBd/9Rl/akWc=;
        b=cfLLwMyQ5boAPsjfGfQdMFwT3/22hG3e7QdLhWNN00ChRfwN4AqVRKt86DclCAEMLO
         BHY/tBWtSP8Gu+Pon1R11HSZIRu39x7pJgQ9sZBlMzhTA4F+RXWIiJdB82foGRGy+VMT
         16VH2ONYgw7O8/xALPKIgNLdft9Ddq3XdcDorf8SDBfRhkwRmvZmxbuE30ZIezF1nwfN
         dGmMqAEBLoh/l3e0Xg8DVjWiYZXM172U3MdVZatUG6xr5XR7Thoz9ALYpFqA+hZes3pQ
         wH9n2YS8ynRbLxqzcOK3XlbAPtlP22tq31Yz6cOBKoIMn1P7cWIU9g3PPSnOs35mJPEH
         bzaw==
X-Gm-Message-State: APjAAAVIkobeQbleYJIAhPglYZHFQz3l5z10+re3POVDqV0UsYXJXUXA
        OeCH0ylWsEcggUIpFSB2yP1WGhP8
X-Google-Smtp-Source: APXvYqzZCUaxyEQrhAwrEah/nB2Ua3qI5B8xSyUhtJo1Kx9aH/+WoZfln9IZ3y5ZhII2wM3v4b51RA==
X-Received: by 2002:a1c:a483:: with SMTP id n125mr10706425wme.172.1560107346937;
        Sun, 09 Jun 2019 12:09:06 -0700 (PDT)
Received: from myhost.home (ckm12.neoplus.adsl.tpnet.pl. [83.31.88.12])
        by smtp.gmail.com with ESMTPSA id y38sm14725041wrd.41.2019.06.09.12.09.05
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 09 Jun 2019 12:09:06 -0700 (PDT)
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
To:     linux-leds@vger.kernel.org
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        pavel@ucw.cz, robh@kernel.org, dtor@google.com, linux@roeck-us.net,
        dmurphy@ti.com, jacek.anaszewski@gmail.com,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v5 22/26] dt-bindings: leds-gpio: Add function and color properties
Date:   Sun,  9 Jun 2019 21:07:59 +0200
Message-Id: <20190609190803.14815-23-jacek.anaszewski@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190609190803.14815-1-jacek.anaszewski@gmail.com>
References: <20190609190803.14815-1-jacek.anaszewski@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Refer to new "function" and "color" properties and mark "label"
as deprecated.

Signed-off-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/leds/leds-gpio.txt         | 23 +++++++++++++++-------
 1 file changed, 16 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/leds/leds-gpio.txt b/Documentation/devicetree/bindings/leds/leds-gpio.txt
index a48dda268f81..d21281b63d38 100644
--- a/Documentation/devicetree/bindings/leds/leds-gpio.txt
+++ b/Documentation/devicetree/bindings/leds/leds-gpio.txt
@@ -10,8 +10,12 @@ LED sub-node properties:
 - gpios :  Should specify the LED's GPIO, see "gpios property" in
   Documentation/devicetree/bindings/gpio/gpio.txt.  Active low LEDs should be
   indicated using flags in the GPIO specifier.
-- label :  (optional)
+- function :  (optional)
+  see Documentation/devicetree/bindings/leds/common.txt
+- color :  (optional)
   see Documentation/devicetree/bindings/leds/common.txt
+- label :  (optional)
+  see Documentation/devicetree/bindings/leds/common.txt (deprecated)
 - linux,default-trigger :  (optional)
   see Documentation/devicetree/bindings/leds/common.txt
 - default-state:  (optional) The initial state of the LED.
@@ -27,30 +31,34 @@ LED sub-node properties:
 Examples:
 
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/leds/common.h>
 
 leds {
 	compatible = "gpio-leds";
-	hdd {
-		label = "Disk Activity";
+	led0 {
 		gpios = <&mcu_pio 0 GPIO_ACTIVE_LOW>;
 		linux,default-trigger = "disk-activity";
+		function = LED_FUNCTION_DISK;
 	};
 
-	fault {
+	led1 {
 		gpios = <&mcu_pio 1 GPIO_ACTIVE_HIGH>;
 		/* Keep LED on if BIOS detected hardware fault */
 		default-state = "keep";
+		function = LED_FUNCTION_FAULT;
 	};
 };
 
 run-control {
 	compatible = "gpio-leds";
-	red {
+	led0 {
 		gpios = <&mpc8572 6 GPIO_ACTIVE_HIGH>;
+		color = <LED_COLOR_ID_RED>;
 		default-state = "off";
 	};
-	green {
+	led1 {
 		gpios = <&mpc8572 7 GPIO_ACTIVE_HIGH>;
+		color = <LED_COLOR_ID_GREEN>;
 		default-state = "on";
 	};
 };
@@ -58,9 +66,10 @@ run-control {
 leds {
 	compatible = "gpio-leds";
 
-	charger-led {
+	led0 {
 		gpios = <&gpio1 2 GPIO_ACTIVE_HIGH>;
 		linux,default-trigger = "max8903-charger-charging";
 		retain-state-suspended;
+		function = LED_FUNCTION_CHARGE;
 	};
 };
-- 
2.11.0

