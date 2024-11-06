Return-Path: <linux-leds+bounces-3293-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CA2A9BDEB9
	for <lists+linux-leds@lfdr.de>; Wed,  6 Nov 2024 07:18:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 409B01C21723
	for <lists+linux-leds@lfdr.de>; Wed,  6 Nov 2024 06:18:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 720051917F6;
	Wed,  6 Nov 2024 06:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=remote-tech-co-uk.20230601.gappssmtp.com header.i=@remote-tech-co-uk.20230601.gappssmtp.com header.b="k26eFjfO"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73493192B76
	for <linux-leds@vger.kernel.org>; Wed,  6 Nov 2024 06:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730873905; cv=none; b=rTseBvqWGY2jR76tVtz4SxGBJw6vdzlUPo9PyRbw/t3vEadjtOU0dNlh1qA2RBS+STzRKZeG5tLzxoU4/bFszQS/TGPG9zQjUrr0KKADHy3E/jiMJqZcQ2qAV7ijcOmlj+cCdbLuATg7an1jB7mbjw27BrGgNMp2ENwe5UMc+qg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730873905; c=relaxed/simple;
	bh=w+XHq9w7Bz9O2dHFT5zj8vUvIOCoNUqwqvDDMjf/3u0=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jQ8FBTLxDhRpBvkZxjJrBScSvlrXeb6T6gaCVRqUMpbzAEPruAdjnASfFnN1XZhT6egkHx+oalwS/GuqjOyurWaofTJPW/0WfshT6luCE60she8pL19wmWBEs3LeImkMecXSfdiiKVhaOCC37kERTp6bzkkxDPkkjKG9alq1llU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=remote-tech.co.uk; spf=pass smtp.mailfrom=remote-tech.co.uk; dkim=pass (2048-bit key) header.d=remote-tech-co-uk.20230601.gappssmtp.com header.i=@remote-tech-co-uk.20230601.gappssmtp.com header.b=k26eFjfO; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=remote-tech.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=remote-tech.co.uk
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a99cc265e0aso994773266b.3
        for <linux-leds@vger.kernel.org>; Tue, 05 Nov 2024 22:18:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=remote-tech-co-uk.20230601.gappssmtp.com; s=20230601; t=1730873902; x=1731478702; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zHi7Lp38jT8FmPt7TMK4PF42l87ejDv0GI3ZM6aDB/0=;
        b=k26eFjfOXSZJzH0CGSVlqHcOczgctV2x/O3PQaAm4AKSzj2LKoKjkwUb3JkyaB2EAW
         txz2gxsGP9BzaKV2WEhsmlhBLCodcukcD3qx8iKwHB6z98dZwXpcMXkvGUbZZr2LX9xS
         ON4pR2+qatpTJ4pjKR3BxbwpUqZmLBsj4vgRu32OgsqzUOtbtg8J6sGK8Lm7YBkn2qoD
         aafh9OWcvZi30EgfrWELgSGotcgg/QVNPFjwXkUESYsRYdcz0siZpsMwomJNVKTXKTBx
         mhsLlhkPOrBvAmYlc3KXFx3dPiOwYVOt1Z4JLEtxfY3eMWn5V0s0MKb0piozM1786oWr
         6zXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730873902; x=1731478702;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zHi7Lp38jT8FmPt7TMK4PF42l87ejDv0GI3ZM6aDB/0=;
        b=aXWfmscvF/uLYeqCdIQFAcqbjigdFosGDqCBX7rcmv3FnTaw7Wl6uswN4zvd0h7rt3
         ypP7+CSgf1HEXMyiOVCe26z8oklbOnWTZiG2+GlB8agN0ExJoYxST0g5pa7UcfuJ2H13
         NCQjci1Axq+vsa+jJEyrZ4ATQFvc+NXMs7Xc19E8gU2Z8qWj44ZLg9KEqJkPdWJCSedV
         60eHpcOAzrygdr5joSrHFrnO3O8QupsrBQXAmTCvUlEg5Y+E5ZVbNgavne72/Z96kmah
         Kh8soae4EJgwbfS65FSc21IMNPn9cKb1gDD507L/TAaWlX7Wp5n/8bt/ZJEpesnZ0DrH
         tyNA==
X-Forwarded-Encrypted: i=1; AJvYcCXBGtAxYbamV7sP5m40NPDtktLrqpkjGPvxPTrnu6MEQkspKyo7eiXZDcuCwAdxqwzbBd/ENZoJiXi5@vger.kernel.org
X-Gm-Message-State: AOJu0YzrbiVk1TJRqfYl2W87A9AgaaBMfxUf0VYOtYVmo+bUuv/uWyIG
	MQevOguakksy2rDPYD254BJHV7OPZe3H6UDcTTyQ6QEVxZBcQR/RD4DlSMz8J3ZQ9bQFPMLMTxJ
	6F7hxFyUw9AR6dXIL4gaJxsXyRdSqtxuO5c9NTnZyop0MJrqwrlSW0aGrXUbdUGvAxIgMuHBxOM
	ONMU49hm+91HGLWcrAFirOVUZb
X-Google-Smtp-Source: AGHT+IEvauvbIcdk/auONxb/0Op8p4Q/d+ZwECWBvxyMYvWi4k33l5h9kT3lkSNfqa2WgLCbhk+6ow==
X-Received: by 2002:a17:907:7e8e:b0:a99:e939:d69e with SMTP id a640c23a62f3a-a9de61d1a8cmr3138392066b.51.1730873901592;
        Tue, 05 Nov 2024 22:18:21 -0800 (PST)
Received: from localhost.localdomain ([178.27.36.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9eb17cecccsm232360866b.102.2024.11.05.22.18.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 22:18:20 -0800 (PST)
From: Vicentiu Galanopulo <vicentiu.galanopulo@remote-tech.co.uk>
To: Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Vicentiu Galanopulo <vicentiu.galanopulo@remote-tech.co.uk>,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH 2/3] [PATCH v4] dt-bindings: leds: Add LED1202 LED Controller
Date: Wed,  6 Nov 2024 06:18:08 +0000
Message-Id: <20241106061812.6819-2-vicentiu.galanopulo@remote-tech.co.uk>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241106061812.6819-1-vicentiu.galanopulo@remote-tech.co.uk>
References: <20241106061812.6819-1-vicentiu.galanopulo@remote-tech.co.uk>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The LED1202 is a 12-channel low quiescent current LED driver with:
  * Supply range from 2.6 V to 5 V
  * 20 mA current capability per channel
  * 1.8 V compatible I2C control interface
  * 8-bit analog dimming individual control
  * 12-bit local PWM resolution
  * 8 programmable patterns

If the led node is present in the controller then the channel is
set to active.

v1: https://lore.kernel.org/lkml/ZnCnnQfwuRueCIQ0@admins-Air/T/
v2: https://lore.kernel.org/all/ZniNdGgKyUMV-hjq@admins-Air/T/
v3: https://lore.kernel.org/all/ZniNdGgKyUMV-hjq@admins-Air/T/

Signed-off-by: Vicentiu Galanopulo <vicentiu.galanopulo@remote-tech.co.uk>

---
Changes in v4:
  - remove label property, use devm_led_classdev_register_ext instead
  - use as base patch the v3
Changes in v3:
  - remove active property
Changes in v2:
  - renamed label to remove color from it
  - add color property for each node
  - add function and function-enumerator property for each node
---
 .../devicetree/bindings/leds/st,led1202.yaml  | 132 ++++++++++++++++++
 1 file changed, 132 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/st,led1202.yaml

diff --git a/Documentation/devicetree/bindings/leds/st,led1202.yaml b/Documentation/devicetree/bindings/leds/st,led1202.yaml
new file mode 100644
index 000000000000..7e49e6464d41
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/st,led1202.yaml
@@ -0,0 +1,132 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/st,led1202.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ST LED1202 LED controllers
+
+maintainers:
+  - Vicentiu Galanopulo <vicentiu.galanopulo@remote-tech.co.uk>
+
+description: |
+  The LED1202 is a 12-channel low quiescent current LED controller
+  programmable via I2C; The output current can be adjusted separately
+  for each channel by 8-bit analog and 12-bit digital dimming control.
+  Datasheet available at
+  https://www.st.com/en/power-management/led1202.html
+
+properties:
+  compatible:
+    const: st,led1202
+
+  reg:
+    maxItems: 1
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+    
+patternProperties:
+  "^led@[0-9a-f]$":
+    type: object
+    $ref: common.yaml#
+    unevaluatedProperties: false
+
+    properties:
+      reg:
+        minimum: 0
+        maximum: 11
+
+    required:
+      - reg
+
+required:
+  - compatible
+  - reg
+  - "#address-cells"
+  - "#size-cells"
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
+        led-controller@58 {
+            compatible = "st,led1202";
+            reg = <0x58>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            led@0 {
+                reg = <0x0>;
+                function = LED_FUNCTION_STATUS;
+                color = <LED_COLOR_ID_RED>;
+                function-enumerator = <1>;
+            };
+
+            led@1 {
+                reg = <0x1>;
+                function = LED_FUNCTION_STATUS;
+                color = <LED_COLOR_ID_GREEN>;
+                function-enumerator = <2>;
+            };
+
+            led@2 {
+                reg = <0x2>;
+                function = LED_FUNCTION_STATUS;
+                color = <LED_COLOR_ID_BLUE>;
+                function-enumerator = <3>;
+            };
+
+            led@3 {
+                reg = <0x3>;
+                function = LED_FUNCTION_STATUS;
+                color = <LED_COLOR_ID_RED>;
+                function-enumerator = <4>;
+            };
+
+            led@4 {
+                reg = <0x4>;
+                function = LED_FUNCTION_STATUS;
+                color = <LED_COLOR_ID_GREEN>;
+                function-enumerator = <5>;
+            };
+
+            led@5 {
+                reg = <0x5>;
+                function = LED_FUNCTION_STATUS;
+                color = <LED_COLOR_ID_BLUE>;
+                function-enumerator = <6>;
+            };
+
+            led@6 {
+                reg = <0x6>;
+                function = LED_FUNCTION_STATUS;
+                color = <LED_COLOR_ID_RED>;
+                function-enumerator = <7>;
+            };
+
+            led@7 {
+                reg = <0x7>;
+                function = LED_FUNCTION_STATUS;
+                color = <LED_COLOR_ID_GREEN>;
+                function-enumerator = <8>;
+            };
+
+            led@8 {
+                reg = <0x8>;
+                function = LED_FUNCTION_STATUS;
+                color = <LED_COLOR_ID_BLUE>;
+                function-enumerator = <9>;
+            };
+        };
+    };
+...
-- 
2.25.1


