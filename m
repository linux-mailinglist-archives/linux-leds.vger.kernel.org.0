Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B3B7C37B04A
	for <lists+linux-leds@lfdr.de>; Tue, 11 May 2021 22:49:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230145AbhEKUuk (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 11 May 2021 16:50:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230118AbhEKUue (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 11 May 2021 16:50:34 -0400
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com [IPv6:2607:f8b0:4864:20::d32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADE97C061763;
        Tue, 11 May 2021 13:49:27 -0700 (PDT)
Received: by mail-io1-xd32.google.com with SMTP id n10so19488195ion.8;
        Tue, 11 May 2021 13:49:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TCRm+X3nhvMYe35x2rhH5oz8R/ZSTy1qZF2DFipC4Jo=;
        b=K2nyq0RpKVJJwdTEn+Dnow5QyMUdob0Ed9bUNFIKCMek6WtOM4MpamTfEBenpXZO1Y
         cmZbJIp3L1PqR16OWm0sYg6Y0RV/WsGJ6asYNakWP+L4FxiqdA9j9+CvZI9NKPsskF7J
         4mcV7xaMSSlkir6OOXDYpRnnFmNkjxi1sWXhzB+zoyZc4tofLvrWvbn2Sh9LX0t+UzbA
         ARu/SXs2zZBITB0qTFeLC1QuDR5EoVD4IJdYjFZY7EoYDlyp4WmQQvtktSpvEe+DThir
         1lwvs/aK/HIlRCEDtRSHm0ly0nbOMQ1cIMdpbvNcuvklc/fI2ZbenH81m2CT0gO82orP
         D2ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TCRm+X3nhvMYe35x2rhH5oz8R/ZSTy1qZF2DFipC4Jo=;
        b=OkkXygM6Cc6RC55PH/FXg25u7Ladl86Fi3atr9NhKQq70H1UqFyp4SIa/4/tw6q6Lv
         +9AlULS15+B0KnwCFrOcbLl9oWAxR3hlJLCRFOkIUsRQKk746gq2mGJI1ao0Fn1/7W76
         DWrSZ2Y2wguVLKPQp4dcegoIq05XlkfGke4WHbN2Pa5wrbHmT3jgrXH9N3CjzlBAU98j
         vb1LZPiN7AN3MkXKSZ5y/0RmahyPrxt6bNDDb1u3mx7/1WVKP2oqFMfII3mB0Nrfj6Uu
         xXJz4bNvf07njMb18pp1e2qkvxtTLmCDGBDf8uzNVskFioRu6aK4MSKVs/8cN8vZiXdc
         5Lsw==
X-Gm-Message-State: AOAM530uu3T5zurSnPm5f9Nmi/6G8hLuAGOpsXJmsd+3pNJdi19Ayy5H
        fslhGJ659SVgBEx0wFz5hCk=
X-Google-Smtp-Source: ABdhPJwuYDLxPb1SqSzQU3+Ka/DFP8y6WufGXCsMNf/B8WOdqcSK2MF7Wy4r7TKavQP5id8TdVAnTw==
X-Received: by 2002:a05:6638:a48:: with SMTP id 8mr8976001jap.38.1620766167236;
        Tue, 11 May 2021 13:49:27 -0700 (PDT)
Received: from zobel.corp.climate.com ([76.232.4.204])
        by smtp.gmail.com with ESMTPSA id p25sm4535851ioh.39.2021.05.11.13.49.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 May 2021 13:49:26 -0700 (PDT)
From:   Doug Zobel <dougdev334@gmail.com>
To:     Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Doug Zobel <dougdev334@gmail.com>
Subject: [PATCH 2/2] dt: bindings: lp55xx: Add predefined LED pattern
Date:   Tue, 11 May 2021 15:48:34 -0500
Message-Id: <20210511204834.2675271-3-dougdev334@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210511204834.2675271-1-dougdev334@gmail.com>
References: <20210511204834.2675271-1-dougdev334@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Add a new device tree object for LP5562 predfined led patterns.

Signed-off-by: Doug Zobel <dougdev334@gmail.com>
---
 .../devicetree/bindings/leds/leds-lp55xx.yaml | 103 +++++++++++++++++-
 1 file changed, 102 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/leds/leds-lp55xx.yaml b/Documentation/devicetree/bindings/leds/leds-lp55xx.yaml
index f552cd143d5b..2524a84fe688 100644
--- a/Documentation/devicetree/bindings/leds/leds-lp55xx.yaml
+++ b/Documentation/devicetree/bindings/leds/leds-lp55xx.yaml
@@ -100,6 +100,31 @@ patternProperties:
         $ref: /schemas/types.yaml#/definitions/string
         description: name of channel
 
+  "(^pattern@[0-9a-f]$|pattern)":
+    type: object
+    $ref: common.yaml#
+    description: |
+      LP5562 sepcific object.  LED pattern program saved to and run on LP5562.
+    properties:
+      pat-name:
+        $ref: /schemas/types.yaml#/definitions/string
+        description: Name of pattern program
+
+      pat-r:
+        $ref: /schemas/types.yaml#/definitions/uint8-array
+        description: |
+          Program data for red channel.  See LP5562 datasheet for program format specification.
+
+      pat-g:
+        $ref: /schemas/types.yaml#/definitions/uint8-array
+        description: |
+          Program data for green channel.  See LP5562 datasheet for program format specification.
+
+      pat-b:
+        $ref: /schemas/types.yaml#/definitions/uint8-array
+        description: |
+          Program data for blue channel.  See LP5562 datasheet for program format specification.
+
 required:
   - compatible
   - reg
@@ -223,6 +248,82 @@ examples:
                };
             };
         };
-    };
 
+        led-controller@30 {
+            #address-cells = <1>;
+            #size-cells = <0>;
+            compatible = "ti,lp5562";
+            reg = <0x30>;
+
+            led@0 {
+                reg = <0>;
+                chan-name = "red";
+                color = <LED_COLOR_ID_RED>;
+            };
+
+            led@1 {
+                reg = <1>;
+                chan-name = "green";
+                color = <LED_COLOR_ID_GREEN>;
+            };
+
+            led@2 {
+                reg = <2>;
+                chan-name = "blue";
+                color = <LED_COLOR_ID_BLUE>;
+            };
+
+            pattern@1 {
+                /* Pulsing blue pattern
+                 *   Blue:
+                 *     027F: Ramp up 50%
+                 *     027F: Ramp up 50%
+                 *     4600: Wait 100ms
+                 *     02FF: Ramp down 50%
+                 *     02FF: Ramp down 50%
+                 *     4600: Wait 100ms
+                 *     0000: Goto start
+                 */
+                pat-name = "Pulsing Blue";
+                pat-b = [02 7f 02 7f 46 00 02 ff 02 ff 46 00 00 00];
+            };
+
+            pattern@2 {
+                /*
+                 * HSV rainbow
+                 *   Red:
+                 *     40FF: Set PWM 255
+                 *     41FF: Ramp down 50%
+                 *     41FF: Ramp down 50%
+                 *     41FF: Wait 1/2 ramp time
+                 *     41FF: Wait 1/2 ramp time
+                 *     417F: Ramp up 50%
+                 *     417F: Ramp up 50%
+                 *     0000: Goto start
+                 *   Green:
+                 *     4000: Set PWM 0
+                 *     417F: Ramp up 50%
+                 *     417F: Ramp up 50%
+                 *     41FF: Ramp down 50%
+                 *     41FF: Ramp down 50%
+                 *     41FF: Wait 1/2 ramp time
+                 *     41FF: Wait 1/2 ramp time
+                 *     0000: Goto start
+                 *   Blue:
+                 *     4000: Set PWM 0
+                 *     41FF: Wait 1/2 ramp time
+                 *     41FF: Wait 1/2 ramp time
+                 *     417F: Ramp up 50%
+                 *     417F: Ramp up 50%
+                 *     41FF: Ramp down 50%
+                 *     41FF: Ramp down 50%
+                 *     0000: Goto start
+                 */
+                pat-name = "HSV Rainbow";
+                pat-r = [40 ff 41 FF 41 FF 41 FF 41 FF 41 7F 41 7F 00 00];
+                pat-g = [40 00 41 7F 41 7F 41 FF 41 FF 41 FF 41 FF 00 00];
+                pat-b = [40 00 41 FF 41 FF 41 7F 41 7F 41 FF 41 FF 00 00];
+            };
+        };
+    };
 ...
-- 
2.20.1

