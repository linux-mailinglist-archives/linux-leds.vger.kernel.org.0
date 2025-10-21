Return-Path: <linux-leds+bounces-5847-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 08BF7BF78C8
	for <lists+linux-leds@lfdr.de>; Tue, 21 Oct 2025 18:00:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 966BB3A49DC
	for <lists+linux-leds@lfdr.de>; Tue, 21 Oct 2025 15:59:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08A4A339B3F;
	Tue, 21 Oct 2025 15:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OUHZQz3D"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 202AD3451C4
	for <linux-leds@vger.kernel.org>; Tue, 21 Oct 2025 15:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761062383; cv=none; b=VYhPxplt76bW0scPa2GQq6x85V5rZlNzYaZoDeA4dizNf5D300yyYkzjG77+fb7nLSEo7STarIi3tOln6XYVrkX9z8G+K8FnyjSjt/XHtU+ORMRLXyHRtGM7NhzHW+46IEyS5u77gpLhwfUN9fTgTLhvZb9ZvAi49gAQBncx03k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761062383; c=relaxed/simple;
	bh=DVZk9/6Hz1u40oFEn/dvO2HpS/h5DXQYBj9t8pth4is=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=JJTXGv1oIktogGI6uCAAL4EWhj1QXzlrxQMOSh55qdf+4lROYJ/2Bvn+0W0aW+DIrkOExmpDJ2P7vfG1/9mHNLxfPGLQZh3auECAGOfvoQ9bvjDAr79N8p9ebB1WM5Phc3TR3TCvKjxaqP4caOp0pDjC2vuzx00bcWOVk8LsUmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OUHZQz3D; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-7833765433cso7200404b3a.0
        for <linux-leds@vger.kernel.org>; Tue, 21 Oct 2025 08:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761062381; x=1761667181; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3BYngmfsv4iOZfMpdOA17S9GKl2RTrHqqlq8fKnQ8GQ=;
        b=OUHZQz3D5cHZsZR8Ksf87Ly0xumBMlW4XsYH6e0hx1gyzwBmvkKrN5rpM6oAFP95Y1
         kQGSAEn+PQTqoO8eBFoB4Ha/s7tHo6SUKFMyMHHoULAsfwZDXNlsqbOZOXOPafJ4MBcx
         EysLHc2nNJwZRKTZTdoJdlH+W2dlzjmCLxOH6MdF1otb69HLU/3QxlXQhjBUrVS10pWu
         mXQMAuHOgWMY0vySwsJtO8ausQqUN9lacOcGCDmxHKFXRsSBWEJLY6J/w19SZg79Phuq
         fFyC454zxkDOWu468mkTnauvX/GdvQnqNytQETdzuBlRdRrRjqs3fWz7uqYVMSjKraLI
         XU7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761062381; x=1761667181;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3BYngmfsv4iOZfMpdOA17S9GKl2RTrHqqlq8fKnQ8GQ=;
        b=EctfULYLWvkCUcWkkYXO/NELqjriCyeaPDAXd+V+ntEWsrRexankFEgDB2NBWk7Lm6
         4VtVZbTujbBFhHDFb/ECb+4dJA5la10BATWCS7P6+10UOjXfFrCsxjPLiakS95ecGxt2
         hLRG5c1HuV+q+28L/490a/s4NuGWT1LHvu8K0oEquiJt8T+o0alYuA2ERq1PrjKS729s
         lky0Lj7UjHrNzRMrKnrLyxowt5X9MpQ4cFQmn7memDF3dJ0j2nDWyCs1e9MQevSPvHiH
         GJTCfDhp6c08SrjycOnS53uRiKkp9zdKqced8VPK55FnDmqmU1lFAkWaAwBEzZFVZmrQ
         O4Rw==
X-Forwarded-Encrypted: i=1; AJvYcCXUQBJrZ5ZyTkP07S/Vdm4eRcYjGT+DfI3iIDmpjPfqDDZZUVgFwg8TfExWpSrRbxAQ2yjHHfbFSldc@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6MQMCPojf3Z1bISHfWde+ZGxnSzMtkus3P4FpJ156p85fkjlT
	weNN92gnROZ/lyXUxYmseol3WkYMHB1y2GiFqm/rfgv5DTdqCa6ObWNb
X-Gm-Gg: ASbGncvqq/4tTaiwizpJeMH0xJCfEfbHiiWk/QyOg84hFBh2Qrv6+4DsNX/s2s7Ad76
	FRnVZ6JnaT4kynf9D0R2UyL+KeiqAAYnQ+CavUagOlySP6JFxoJNu7NAOdGUf47iiLGu/EZz0KV
	h45O8fkBDUxTruNUYrwsAdRuaBd0LaUbJXNw0qDn69hhgGE94Ga6R7JHNsqxVDenkh6oOH5lNlf
	J+tBvbsyUq1vw0fkYPLAMRmtgTPMHm4QL5Fzn9rblI37CKJ4wgnbYJBgUsRpilpVwKFS6Zvbjbu
	PUwv8ScLVo1Nch3hiIQObo83Fwle1oM/EnwlVWDWj7/q4HqMLht66YEGM3h7AyZCje2VNF3hvvc
	K+FfwInFdubTW6K/RA1HYimk5sG+vO0zXiPBtcuAqx0p5CvAYy1vvlOufKm9oyjgEruEEtxeqFo
	rh1Rk8vFENxDCg6LJaaj5MKw==
X-Google-Smtp-Source: AGHT+IEtJXtD4SFYx9QJaaRQ/IY2Zd/UHeW3zow+bskDa2aDqwuFyhBsTTMrh4PK8Y00pXXiRosWCQ==
X-Received: by 2002:a05:6a00:2308:b0:792:52ab:d9fe with SMTP id d2e1a72fcca58-7a220440d9fmr21260599b3a.0.1761062381001;
        Tue, 21 Oct 2025 08:59:41 -0700 (PDT)
Received: from DESKTOP-P76LG1N.lan ([42.118.149.214])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a22ff184basm11793032b3a.15.2025.10.21.08.59.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 08:59:40 -0700 (PDT)
From: Nam Tran <trannamatk@gmail.com>
To: lee@kernel.org
Cc: pavel@kernel.org,
	gregkh@linuxfoundation.org,
	rdunlap@infradead.org,
	christophe.jaillet@wanadoo.fr,
	krzk+dt@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Nam Tran <trannamatk@gmail.com>
Subject: [PATCH v17 1/3] dt-bindings: leds: add TI/National Semiconductor LP5812 LED Driver
Date: Tue, 21 Oct 2025 22:59:25 +0700
Message-Id: <20251021155927.140929-2-trannamatk@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251021155927.140929-1-trannamatk@gmail.com>
References: <20251021155927.140929-1-trannamatk@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The LP5812 is a 4x3 RGB LED driver with an autonomous animation
engine and time-cross-multiplexing (TCM) support for up to 12 LEDs
or 4 RGB LEDs. It supports both analog (256 levels) and PWM (8-bit)
dimming, including exponential PWM for smooth brightness control.

Signed-off-by: Nam Tran <trannamatk@gmail.com>
---
 .../devicetree/bindings/leds/ti,lp5812.yaml   | 246 ++++++++++++++++++
 MAINTAINERS                                   |   6 +
 2 files changed, 252 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/ti,lp5812.yaml

diff --git a/Documentation/devicetree/bindings/leds/ti,lp5812.yaml b/Documentation/devicetree/bindings/leds/ti,lp5812.yaml
new file mode 100644
index 000000000000..de34bff441c7
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/ti,lp5812.yaml
@@ -0,0 +1,246 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/ti,lp5812.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TI LP5812 4x3 Matrix RGB LED Driver with Autonomous Control
+
+maintainers:
+  - Nam Tran <trannamatk@gmail.com>
+
+description: |
+  The LP5812 is a 4x3 matrix RGB LED driver with I2C interface
+  and autonomous animation engine control.
+  For more product information please see the link below:
+  https://www.ti.com/product/LP5812#tech-docs
+
+properties:
+  compatible:
+    const: ti,lp5812
+
+  reg:
+    maxItems: 1
+
+  ti,scan-mode:
+    description: |
+      Selects the LED scan mode of the LP5812. The device supports
+      three modes:
+        - Direct-drive mode (by default if 'ti,scan-mode' is omitted)
+        drives up to 4 LEDs directly by internal current sinks (LED0-LED3).
+        - TCM-drive mode ("tcm:<n>:<order...>") drives up to 12 LEDs
+        (4 RGB) using 1-4 scan multiplexing. The <n> specifies the number
+        of scans (1-4), and <order...> defines the scan order of the outputs.
+        - Mix-drive mode ("mix:<n>:<direct>:<order...>") combines
+        direct-drive and TCM-drive outputs. The <n> specifies the number
+        of scans, <direct> selects the direct-drive outputs, and <order...>
+        defines the scan order.
+    $ref: /schemas/types.yaml#/definitions/string
+    pattern: '^(tcm|mix):[1-4](:[0-3]){1,4}$'
+
+  vcc-supply:
+    description: Regulator providing power to the 'VCC' pin.
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+patternProperties:
+  "^led@[0-3]$":
+    type: object
+    $ref: common.yaml#
+    unevaluatedProperties: false
+
+    properties:
+      reg:
+        minimum: 0
+        maximum: 3
+
+    required:
+      - reg
+
+  "^multi-led@[4-7]$":
+    type: object
+    $ref: leds-class-multicolor.yaml#
+    unevaluatedProperties: false
+
+    properties:
+      reg:
+        minimum: 4
+        maximum: 7
+
+      "#address-cells":
+        const: 1
+
+      "#size-cells":
+        const: 0
+
+    patternProperties:
+      "^led@[4-9a-f]$":
+        type: object
+        $ref: common.yaml#
+        unevaluatedProperties: false
+
+        properties:
+          reg:
+            minimum: 4
+            maximum: 15
+
+        required:
+          - reg
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/leds/common.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        led-controller@1b {
+            #address-cells = <1>;
+            #size-cells = <0>;
+            compatible = "ti,lp5812";
+            reg = <0x1b>;
+            ti,scan-mode = "tcm:4:0:1:2:3";
+            vcc-supply = <&vdd_3v3_reg>;
+
+            led@0 {
+                reg = <0x0>;
+                label = "LED0";
+                led-max-microamp = <25500>;
+            };
+
+            led@1 {
+                reg = <0x1>;
+                label = "LED1";
+                led-max-microamp = <25500>;
+            };
+
+            led@2 {
+                reg = <0x2>;
+                label = "LED2";
+                led-max-microamp = <25500>;
+            };
+
+            led@3 {
+                reg = <0x3>;
+                label = "LED3";
+                led-max-microamp = <25500>;
+            };
+
+            multi-led@4 {
+                #address-cells = <1>;
+                #size-cells = <0>;
+                reg = <0x4>;
+                color = <LED_COLOR_ID_RGB>;
+                label = "LED_A";
+
+                led@4 {
+                    reg = <0x4>;
+                    color = <LED_COLOR_ID_GREEN>;
+                    led-max-microamp = <25500>;
+                };
+
+                led@5 {
+                    reg = <0x5>;
+                    color = <LED_COLOR_ID_RED>;
+                    led-max-microamp = <25500>;
+                };
+
+                led@6 {
+                    reg = <0x6>;
+                    color = <LED_COLOR_ID_BLUE>;
+                    led-max-microamp = <25500>;
+                };
+            };
+
+            multi-led@5 {
+                #address-cells = <1>;
+                #size-cells = <0>;
+                reg = <0x5>;
+                color = <LED_COLOR_ID_RGB>;
+                label = "LED_B";
+
+                led@7 {
+                    reg = <0x7>;
+                    color = <LED_COLOR_ID_GREEN>;
+                    led-max-microamp = <25500>;
+                };
+
+                led@8 {
+                    reg = <0x8>;
+                    color = <LED_COLOR_ID_RED>;
+                    led-max-microamp = <25500>;
+                };
+
+                led@9 {
+                    reg = <0x9>;
+                    color = <LED_COLOR_ID_BLUE>;
+                    led-max-microamp = <25500>;
+                };
+            };
+
+            multi-led@6 {
+                #address-cells = <1>;
+                #size-cells = <0>;
+                reg = <0x6>;
+                color = <LED_COLOR_ID_RGB>;
+                label = "LED_C";
+
+                led@a {
+                    reg = <0xa>;
+                    color = <LED_COLOR_ID_GREEN>;
+                    led-max-microamp = <25500>;
+                };
+
+                led@b {
+                    reg = <0xb>;
+                    color = <LED_COLOR_ID_RED>;
+                    led-max-microamp = <25500>;
+                };
+
+                led@c {
+                    reg = <0xc>;
+                    color = <LED_COLOR_ID_BLUE>;
+                    led-max-microamp = <25500>;
+                };
+            };
+
+            multi-led@7 {
+                #address-cells = <1>;
+                #size-cells = <0>;
+                reg = <0x7>;
+                color = <LED_COLOR_ID_RGB>;
+                label = "LED_D";
+
+                led@d {
+                    reg = <0xd>;
+                    color = <LED_COLOR_ID_GREEN>;
+                    led-max-microamp = <25500>;
+                };
+
+                led@e {
+                    reg = <0xe>;
+                    color = <LED_COLOR_ID_RED>;
+                    led-max-microamp = <25500>;
+                };
+
+                led@f {
+                    reg = <0xf>;
+                    color = <LED_COLOR_ID_BLUE>;
+                    led-max-microamp = <25500>;
+                };
+            };
+        };
+    };
+
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 545a4776795e..6a84f999ef73 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25424,6 +25424,12 @@ S:	Supported
 F:	Documentation/devicetree/bindings/iio/dac/ti,dac7612.yaml
 F:	drivers/iio/dac/ti-dac7612.c
 
+TEXAS INSTRUMENTS' LP5812 RGB LED DRIVER
+M:	Nam Tran <trannamatk@gmail.com>
+L:	linux-leds@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/leds/ti,lp5812.yaml
+
 TEXAS INSTRUMENTS' LB8864 LED BACKLIGHT DRIVER
 M:	Alexander Sverdlin <alexander.sverdlin@siemens.com>
 L:	linux-leds@vger.kernel.org
-- 
2.25.1


