Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5C5FA3AB8B
	for <lists+linux-leds@lfdr.de>; Sun,  9 Jun 2019 21:10:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730121AbfFITKQ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 9 Jun 2019 15:10:16 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:33254 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729916AbfFITIn (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 9 Jun 2019 15:08:43 -0400
Received: by mail-wr1-f66.google.com with SMTP id n9so7018384wru.0;
        Sun, 09 Jun 2019 12:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=GlUyoQyc0BU9oVUv/DfQ4Z6slE81WzZDTAKX1CMK7zc=;
        b=MmbPl9YoW1Yky0rI8Q1txbPjsvNPHg9p2FcQC2T00GLT5rgq26Gc5CAa+JkD3kh3KP
         qsOl8cAQi6Kmjeyto7BZ7AFhilkAJztWUU0Dmd30T+gGiBKxGUl0XerL7O6Jg7/3lY9a
         VIBypPe2Q+BklpyijCUPI6LFfTfp1oypBaIvdZnduhukQlPccPiH3+7l8YWmrrCVh4p5
         IvxxopHI6+BVKU0nicA3WGDrVcTFj6a+Xv8JWUbSqBO5PpqcRBGYQdjL7ttkxICaer7Q
         +7qg5xHVYkIDQ0gt8fn1w9MfNm0MOf0wH3CGJyRuOj72A/xXvY+Pbxjliyvv7U9GA92N
         aTNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=GlUyoQyc0BU9oVUv/DfQ4Z6slE81WzZDTAKX1CMK7zc=;
        b=q3ccuIVwR4cCdQxFhlBskCgd4IsVysPizNYU/nilCyp2+i+AkqjIsjiNYjPlJ/91E6
         Tcm/jB/01oAEFL+Ra9qSsc0QZpMSNGvKdxWw/OpLOCI9XlBF4k3Hy2IoM8eXrrbkakzn
         4XxWZ0OJVPJtlULOfR8oZV4QefK+P2XSf/jES+h76/0pHa+ssT3Ki58LDli9baL/fzME
         DxzKSkZ34L3SsCd4eDDE1EcUY2vzfHraeDYLcNbDq68Epg31KJmfpvWGBMg3dUcabIAn
         74Jww3uY0Y5mlUul1o+W9fQXpJHzVYUkceDcwUzCcRrD8L4lU/SQzGNo7thr4j2jvak/
         UVRw==
X-Gm-Message-State: APjAAAWVSxzD9vwhvMgdEK6gFU8pOEohuhz+4xj0rn+PxkH+kBmA87Kn
        OuIoN4cncC4w8UfapiCuApEA1Hg+
X-Google-Smtp-Source: APXvYqxWaFU2IFGl/XP69ngZRDw8Te35FnBPAtYgcjZEZzgExMBCBdA0FhWIFiOJw5OnwkpQ7GKzKw==
X-Received: by 2002:adf:e843:: with SMTP id d3mr33485972wrn.249.1560107321034;
        Sun, 09 Jun 2019 12:08:41 -0700 (PDT)
Received: from myhost.home (ckm12.neoplus.adsl.tpnet.pl. [83.31.88.12])
        by smtp.gmail.com with ESMTPSA id y38sm14725041wrd.41.2019.06.09.12.08.39
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 09 Jun 2019 12:08:40 -0700 (PDT)
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
To:     linux-leds@vger.kernel.org
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        pavel@ucw.cz, robh@kernel.org, dtor@google.com, linux@roeck-us.net,
        dmurphy@ti.com, jacek.anaszewski@gmail.com,
        Daniel Mack <daniel@zonque.org>
Subject: [PATCH v5 08/26] dt-bindings: lt3593: Add function and color properties
Date:   Sun,  9 Jun 2019 21:07:45 +0200
Message-Id: <20190609190803.14815-9-jacek.anaszewski@gmail.com>
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
Cc: Daniel Mack <daniel@zonque.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/leds/leds-lt3593.txt | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/leds/leds-lt3593.txt b/Documentation/devicetree/bindings/leds/leds-lt3593.txt
index 6b2cabc36c0c..24eccdaa6322 100644
--- a/Documentation/devicetree/bindings/leds/leds-lt3593.txt
+++ b/Documentation/devicetree/bindings/leds/leds-lt3593.txt
@@ -9,8 +9,10 @@ The hardware supports only one LED. The properties of this LED are
 configured in a sub-node in the device node.
 
 Optional sub-node properties:
-- label:	A label for the LED. If none is given, the LED will be
-		named "lt3595::".
+- function:		See Documentation/devicetree/bindings/leds/common.txt
+- color:		See Documentation/devicetree/bindings/leds/common.txt
+- label:		A label for the LED. If none is given, the LED will be
+			named "lt3595::" (deprecated)
 - linux,default-trigger: The default trigger for the LED.
 			See Documentation/devicetree/bindings/leds/common.txt
 - default-state:	The initial state of the LED.
@@ -21,12 +23,15 @@ be handled by its own device node.
 
 Example:
 
+#include <dt-bindings/leds/common.h>
+
 led-controller {
 	compatible = "lltc,lt3593";
 	lltc,ctrl-gpios = <&gpio 0 GPIO_ACTIVE_HIGH>;
 
 	led {
-		label = "white:backlight";
+		function = LED_FUNCTION_BACKLIGHT;
+		color = <LED_COLOR_ID_WHITE>;
 		default-state = "on";
 	};
 };
-- 
2.11.0

