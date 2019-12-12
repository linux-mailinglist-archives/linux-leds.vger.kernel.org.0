Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ECA4711C420
	for <lists+linux-leds@lfdr.de>; Thu, 12 Dec 2019 04:42:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727967AbfLLDkt (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 11 Dec 2019 22:40:49 -0500
Received: from mx2.suse.de ([195.135.220.15]:58596 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727743AbfLLDkH (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Wed, 11 Dec 2019 22:40:07 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 5E564AFA8;
        Thu, 12 Dec 2019 03:40:05 +0000 (UTC)
From:   =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
To:     linux-realtek-soc@lists.infradead.org, linux-leds@vger.kernel.org
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
Subject: [RFC 18/25] dt-bindings: leds: tm1628: Define display child nodes
Date:   Thu, 12 Dec 2019 04:39:45 +0100
Message-Id: <20191212033952.5967-19-afaerber@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191212033952.5967-1-afaerber@suse.de>
References: <20191212033952.5967-1-afaerber@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Amend the individual LEDs by allowing to specify one special child node
with more than one reg entry, with value zero having wildcard meaning.

Signed-off-by: Andreas Färber <afaerber@suse.de>
---
 Read the cover letter for further discussion of concept and alternatives.
 
 .../devicetree/bindings/leds/titanmec,tm1628.yaml  | 52 ++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/Documentation/devicetree/bindings/leds/titanmec,tm1628.yaml b/Documentation/devicetree/bindings/leds/titanmec,tm1628.yaml
index 50205e3c3624..cf6c8d81e68c 100644
--- a/Documentation/devicetree/bindings/leds/titanmec,tm1628.yaml
+++ b/Documentation/devicetree/bindings/leds/titanmec,tm1628.yaml
@@ -53,6 +53,24 @@ patternProperties:
     required:
       - reg
 
+  "^display@([1-7],0|0,([1-9]|1[02-4]))$":
+    type: object
+    description: |
+      Properties for a sequence of 7-segment digits composed of multiple LEDs.
+
+    properties:
+      reg:
+        description: |
+          One or more tuples of grid number and segment number in visual order.
+          A segment of zero indicates that the corresponding grid output lines
+          represent the individual segments; a grid of zero indicates that the
+          corresponding segment output lines represent the individual segments.
+        minItems: 1
+        maxItems: 7
+
+    required:
+      - reg
+
 examples:
   - |
     #include <dt-bindings/leds/common.h>
@@ -71,6 +89,40 @@ examples:
             #address-cells = <2>;
             #size-cells = <0>;
 
+            display@0,8 {
+                reg = <0 8>, <0 7>, <0 6>, <0 5>;
+            };
+
+            colon@5,4 {
+                reg = <5 4>;
+                color = <LED_COLOR_ID_WHITE>;
+                function = LED_FUNCTION_INDICATOR;
+                linux,default-trigger = "heartbeat";
+            };
+        };
+    };
+
+  - |
+    #include <dt-bindings/leds/common.h>
+
+    spi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        led-controller@0 {
+            compatible = "titanmec,tm1628";
+            reg = <0>;
+            spi-3-wire;
+            spi-lsb-first;
+            spi-max-frequency = <500000>;
+            #grids = <6>;
+            #address-cells = <2>;
+            #size-cells = <0>;
+
+            display@1,0 {
+                reg = <1 0>, <2 0>, <3 0>, <4 0>;
+            };
+
             colon@5,4 {
                 reg = <5 4>;
                 color = <LED_COLOR_ID_WHITE>;
-- 
2.16.4

