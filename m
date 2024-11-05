Return-Path: <linux-leds+bounces-3284-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BE1359BD1CB
	for <lists+linux-leds@lfdr.de>; Tue,  5 Nov 2024 17:11:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 45BBE1F22F0C
	for <lists+linux-leds@lfdr.de>; Tue,  5 Nov 2024 16:11:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EC8617B439;
	Tue,  5 Nov 2024 16:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=remote-tech-co-uk.20230601.gappssmtp.com header.i=@remote-tech-co-uk.20230601.gappssmtp.com header.b="kd7Eg5rb"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E88617A5A4
	for <linux-leds@vger.kernel.org>; Tue,  5 Nov 2024 16:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730823059; cv=none; b=IKCOwdDBe/znqTpf6BrdasSzS3RUKu0SiaLnKbQi5qsHmql/Pj9G4yprcdn8A5pCftnRotruVwJwWMwxuCj+lt5h5jenkxmNDT42Rm+Qu3LuVW801NB7NvJE222VUklJE0wM0U3kSTI2o9fubqjr4YMjCTswp8A138SrjHRCd3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730823059; c=relaxed/simple;
	bh=w+XHq9w7Bz9O2dHFT5zj8vUvIOCoNUqwqvDDMjf/3u0=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jufaFj6xPez/Mp8dX/DX1R3fWzVDQj6K+MTpoJ3M4rbN5aLTneG3shiOy3iDh80t0o+3hpMkmjYHPUZJYy/x0InHX/0RA2bW4qsxPzzc0KffrQqA1ThbZwfhaI/BNIoJhig7aQm9i/6DS6TF517fA1JRdzbJb/tiSjk0lL6wXoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=remote-tech.co.uk; spf=pass smtp.mailfrom=remote-tech.co.uk; dkim=pass (2048-bit key) header.d=remote-tech-co-uk.20230601.gappssmtp.com header.i=@remote-tech-co-uk.20230601.gappssmtp.com header.b=kd7Eg5rb; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=remote-tech.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=remote-tech.co.uk
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2fb4af0b6beso86923271fa.3
        for <linux-leds@vger.kernel.org>; Tue, 05 Nov 2024 08:10:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=remote-tech-co-uk.20230601.gappssmtp.com; s=20230601; t=1730823056; x=1731427856; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zHi7Lp38jT8FmPt7TMK4PF42l87ejDv0GI3ZM6aDB/0=;
        b=kd7Eg5rbYM++BwMbFzFGP0IwFmtKZt82trmlT+ZwCjUSrSPMPG0JgpJ/tTDE8/bq7K
         0V/BE7G8riRYFKe6ePN9oEskDp/hT1jOinXuSPVPxZ871D8CQDlet53uNiHukt3PFoY3
         XmkcgqO9hfqtu3sn/PflqytBd3yHk85UrchONzy7E+NxBSB4U9RkJZgq6O/PCm3kaahb
         Q9YQhg2u8CSF28xFSObEe32WsxbpqDDcIAdMJiBsKdo/qCOGgImiMS9oJ6WsuUg+DBOF
         pM3fKfdPa1QYRh82ZAQz+3kdJeT/1kugUsFBDMrs/2Utk4B68piGQSy5njllGbkjqmV7
         +M8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730823056; x=1731427856;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zHi7Lp38jT8FmPt7TMK4PF42l87ejDv0GI3ZM6aDB/0=;
        b=uV57Gor3GMENF5YNgikUJ2JDKovpabclext9D0SrDgOo0lvh5PAqBEB/XwLb4yhSw9
         A+f4rKDRFxTiit2f6ubndwetIuR23kjQV0oLm6l5IpA0pms9XyjVHatd1ifSgHt/CBUL
         c0+IXPyB6qnxSAqkdVOjo1BwwbByqgmsiOKWSzXIi/NYNwaEx/6PBjO/ySRl9PhsWVLN
         WMZEYfneU1bdJ+M4qPEGRtdtFq6OW1wGvt4ye5RJZ7BOclPYcrQJogA6qgdue2jnKJ1c
         R84eIUt7ti94BfOCOO7og31FqN9WN0QF43m1d8joqvfgVkVUaOs9ABQ1sS16lmHol9cK
         K8yQ==
X-Forwarded-Encrypted: i=1; AJvYcCUw0t5gPIfe6cqsPaV6sTNQI4bWgi07paKhfUkPf4FSE6RZtp7aE4KWJzaJhjbj4gZGD6urrguhdzDa@vger.kernel.org
X-Gm-Message-State: AOJu0YylNlS8K3Q3oP5mpVp+V12JlUD45WUnJA4gEJy6vMoysLUfvDW1
	87vmsES7bktyoY9oInTcoKRectz+mqoy0h7b/qh6qMbUgkucfO+w9/pOH//9ojFa9i00Wic3cdc
	vlJSGoXffTz1l/AupkwU7UPWh1R5rhMmfaCkQrY/prFev0EV0Qq+QtJGtq13GxThAt+k45zZt2k
	sdIF4EGenG+nHnNzjzRFGUuuTm
X-Google-Smtp-Source: AGHT+IHDuD8+xEUGCr7lKtRUPyXfy9Q6dyYFtIlDZz++QeysYZt0+vINN/SdZ6xr3U9/UqhQeiHppg==
X-Received: by 2002:a05:651c:b2b:b0:2fb:3960:9667 with SMTP id 38308e7fff4ca-2fedb7a2aa3mr109659971fa.14.1730823054168;
        Tue, 05 Nov 2024 08:10:54 -0800 (PST)
Received: from localhost.localdomain ([178.27.36.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9eb17f7928sm151184666b.138.2024.11.05.08.10.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 08:10:53 -0800 (PST)
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
Date: Tue,  5 Nov 2024 16:10:37 +0000
Message-Id: <20241105161041.4813-2-vicentiu.galanopulo@remote-tech.co.uk>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241105161041.4813-1-vicentiu.galanopulo@remote-tech.co.uk>
References: <20241105161041.4813-1-vicentiu.galanopulo@remote-tech.co.uk>
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


