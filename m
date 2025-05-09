Return-Path: <linux-leds+bounces-4612-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BBC5AAB103F
	for <lists+linux-leds@lfdr.de>; Fri,  9 May 2025 12:15:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EBCCE9E50F8
	for <lists+linux-leds@lfdr.de>; Fri,  9 May 2025 10:14:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9DC728F53F;
	Fri,  9 May 2025 10:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=emfend.at header.i=@emfend.at header.b="gFNJfW1L"
X-Original-To: linux-leds@vger.kernel.org
Received: from lx20.hoststar.hosting (lx20.hoststar.hosting [168.119.41.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FD5628EA48;
	Fri,  9 May 2025 10:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=168.119.41.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746785640; cv=none; b=a0xhKOWrXiwveOjjJuTadmX7FOC0Xu2vvxw7kTb4v3ucJv+U0RqI40iR1382kn927+m8J/Z5YocmwPc/IfsMUAjanJBWT/E2N4bjRMxxVYRu7yx89Kf0vlmKOfWbgZZs0IyotNzfwXlEeznoDDaYpQ+yu9n5WqRk2EvYb/ygNLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746785640; c=relaxed/simple;
	bh=2rybtEtSnHp1L55DE1SNTbFRr5L1knAygEYcRmKOZtM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=S4ZzulbcSzcLgk60gjH1QKu6LYs7LJIKBe+Q/Wrn4e1uHgAD/pV5MezHcG6nT+ADJOi2q7I5264FO3pdoMeG1L0OvMJCYA3kA7PuFa24rWnqOKwvE7/tKMhInaFjriaHf7FSH8ErBKIREcYsM6KrqjSVYzAeXTrk6PZL7iDuCMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emfend.at; spf=pass smtp.mailfrom=emfend.at; dkim=pass (1024-bit key) header.d=emfend.at header.i=@emfend.at header.b=gFNJfW1L; arc=none smtp.client-ip=168.119.41.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emfend.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=emfend.at
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=emfend.at;
	 s=mail; h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=goPStM+OHyszIMkIuQDRqTecOxbPHrLiRh4AOrQUaAk=; b=gFNJfW1L+fJe0aOoJODM6QCWRF
	9ekx8hGD4usq4+7iG9D/Vhkuc/U215ftZlhL+cWZj9ldSXTqiijLZ+aOHqrr7XhFchUYopyQLRojt
	FhDhus/ZMTKPqYrGM64k72k7udFaRImZVf+PWWn1sMBdOQMegQIEiiBFo25Ju5gjIYck=;
Received: from 194-208-208-245.tele.net ([194.208.208.245]:56672 helo=[127.0.1.1])
	by lx20.hoststar.hosting with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <matthias.fend@emfend.at>)
	id 1uDKjq-001ghk-DR; Fri, 09 May 2025 12:13:55 +0200
From: Matthias Fend <matthias.fend@emfend.at>
Date: Fri, 09 May 2025 12:13:42 +0200
Subject: [PATCH v4 1/2] dt-bindings: leds: add Texas Instruments TPS6131x
 flash LED driver
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250509-leds-tps6131x-v4-1-2c9563f5b67c@emfend.at>
References: <20250509-leds-tps6131x-v4-0-2c9563f5b67c@emfend.at>
In-Reply-To: <20250509-leds-tps6131x-v4-0-2c9563f5b67c@emfend.at>
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Pavel Machek <pavel@kernel.org>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Matthias Fend <matthias.fend@emfend.at>, 
 bsp-development.geo@leica-geosystems.com, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Spam-Score: -1.0
X-Spam-Bar: -
X-Spam-Report: Spam detection software, running on the system "lx20.hoststar.hosting",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  The TPS61310/TPS61311 is a flash LED driver with I2C interface.
    Its power stage is capable of supplying a maximum total current of roughly
    1500mA. The TPS6131x provides three constant-current sinks, c [...] 
 
 Content analysis details:   (-1.0 points, 5.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -1.0 ALL_TRUSTED            Passed through trusted hosts only via SMTP
  0.0 TVD_RCVD_IP            Message was received from an IP address
  0.0 Local_hs1_NotHoststar  Sender is not from hoststar.ch|de|com
  0.0 KAM_DMARC_STATUS       Test Rule for DKIM or SPF Failure with Strict
                             Alignment

Document Texas Instruments TPS61310/TPS61311 flash LED driver devicetree
bindings.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Matthias Fend <matthias.fend@emfend.at>
---
 .../devicetree/bindings/leds/ti,tps61310.yaml      | 120 +++++++++++++++++++++
 1 file changed, 120 insertions(+)

diff --git a/Documentation/devicetree/bindings/leds/ti,tps61310.yaml b/Documentation/devicetree/bindings/leds/ti,tps61310.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..1f631889a06a70185bb7ca2cef531e2618f83765
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/ti,tps61310.yaml
@@ -0,0 +1,120 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/ti,tps61310.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments TPS6131X flash LED driver
+
+maintainers:
+  - Matthias Fend <matthias.fend@emfend.at>
+
+description: |
+  The TPS61310/TPS61311 is a flash LED driver with I2C interface.
+  Its power stage is capable of supplying a maximum total current of roughly 1500mA.
+  The TPS6131x provides three constant-current sinks, capable of sinking
+  up to 2 × 400mA (LED1 and LED3) and 800mA (LED2) in flash mode.
+  In torch mode, each sink (LED1, LED2, LED3) supports currents up to 175mA.
+  Since the three current sinks share most of the control components such as
+  flash timer, control logic, safety timer and the operating mode, they cannot
+  be used completely independently of each other. Therefore, only one LED is
+  supported, but the current sinks can be combined accordingly.
+
+  The data sheet can be found at:
+    https://www.ti.com/lit/ds/symlink/tps61310.pdf
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - ti,tps61311
+          - const: ti,tps61310
+      - items:
+          - const: ti,tps61310
+
+  reg:
+    maxItems: 1
+
+  reset-gpios:
+    maxItems: 1
+    description: GPIO connected to NRESET pin
+
+  ti,valley-current-limit:
+    type: boolean
+    description:
+      Reduce the valley peak current limit from 1750mA to 1250mA (TPS61310) or
+      from 2480mA to 1800mA (TPS61311).
+
+  led:
+    type: object
+    $ref: common.yaml#
+    unevaluatedProperties: false
+
+    properties:
+      led-sources:
+        minItems: 1
+        maxItems: 3
+        items:
+          enum: [1, 2, 3]
+
+      led-max-microamp:
+        oneOf:
+          - minimum: 50000
+            maximum: 350000
+            multipleOf: 50000
+          - minimum: 25000
+            maximum: 525000
+            multipleOf: 25000
+
+      flash-max-microamp:
+        oneOf:
+          - minimum: 50000
+            maximum: 800000
+            multipleOf: 50000
+          - minimum: 25000
+            maximum: 1500000
+            multipleOf: 25000
+
+      flash-max-timeout-us:
+        enum: [ 5300, 10700, 16000, 21300, 26600, 32000, 37300, 68200, 71500,
+                102200, 136300, 170400, 204500, 340800, 579300, 852000 ]
+
+    required:
+      - led-sources
+      - led-max-microamp
+      - flash-max-microamp
+      - flash-max-timeout-us
+
+required:
+  - compatible
+  - reg
+  - led
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/leds/common.h>
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      led-controller@33 {
+        compatible = "ti,tps61311", "ti,tps61310";
+        reg = <0x33>;
+
+        reset-gpios = <&gpio1 0 GPIO_ACTIVE_LOW>;
+
+        led {
+          function = LED_FUNCTION_FLASH;
+          color = <LED_COLOR_ID_WHITE>;
+          led-sources = <1>, <2>, <3>;
+          led-max-microamp = <525000>;
+          flash-max-microamp = <1500000>;
+          flash-max-timeout-us = <852000>;
+        };
+      };
+    };

-- 
2.34.1


