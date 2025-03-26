Return-Path: <linux-leds+bounces-4368-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 703E4A71A78
	for <lists+linux-leds@lfdr.de>; Wed, 26 Mar 2025 16:36:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 869F5164C1B
	for <lists+linux-leds@lfdr.de>; Wed, 26 Mar 2025 15:36:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B60D81F4170;
	Wed, 26 Mar 2025 15:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr header.b="gJKTJK32"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B3561DDC1E
	for <linux-leds@vger.kernel.org>; Wed, 26 Mar 2025 15:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743003353; cv=none; b=MrGf8dZlsiM92BhUmIh2Qwt7CG6FRrX6+XveqpjH2TzwlvWtWSdI+gbm+x2/T+NZts3Q66d+8gkM2wEjfU/8AtIsIxBwjSF9l762o+aXdZ3fwEdwiMRUYHn05AuN9HJc7XQK+vJnq/87NqitWS8xQWclEnmP5p6AmZzBg2ClZDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743003353; c=relaxed/simple;
	bh=zWS37NwBQynY8d7fVOe2aEY/kflnlB7Z831LkNsWMCI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CfM1dX/2YZolf7ME4Zs8rRkIFiEPULKExHHo0neZYJR8nnpRcaDHstT9lj0JWBGmKT4vrCKjTrZUC6EMFp6dSoi1imwoafwv9gn9OomKPZWDU+Fy+crp2B/mttV4un7UNvnsFZzQ2HafSyap/um6abtvGZxNtU08jCdf3Wmnjp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=smile.fr; spf=pass smtp.mailfrom=smile.fr; dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr header.b=gJKTJK32; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=smile.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smile.fr
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43cfebc343dso54230225e9.2
        for <linux-leds@vger.kernel.org>; Wed, 26 Mar 2025 08:35:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1743003350; x=1743608150; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ryoKDomEM8QC52XTS10f6105+9enq22DIQJhjcBG4KE=;
        b=gJKTJK32wDDkHPs8Ndf818qgwr5syJFeKEZxT9Hva9ZeIfXKIySBBv21xTltKNEVNy
         sO1YCBL6NxTtDmJBKbMGc4MpP3ex4PWlHCYU50HteSrCYP8iBLcL4inEbHdhd0NUNukY
         swNfgaqA9wH4VpNJkjfcIbQth+zWVFOVFsEdI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743003350; x=1743608150;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ryoKDomEM8QC52XTS10f6105+9enq22DIQJhjcBG4KE=;
        b=K8+vzJ8Spj0AAM4fYe+Dy8IpnGFvCXQO9kpqJMChHYofNqRuqTBE73SPd+3ACU6sF8
         IA58UzquPYXT4omtgHvRvxZ5TMijf0aOsXbU4eHvrihjo2LYZLdhAtXdTgVrLdlQgl6X
         5M6t9x4xsw3maYjihnIY0wymspKF0qJ7swOboIlS5wrG/16tBltWFhHJodVfWeSu4eTw
         btljx3LJ3Pc/qVLLV5x0C0kNd1PpcVfkKpRSBcbyagQzn4Qv86+MCElXRXVLJ57iQ7jW
         N38KZQNUFja5SGR3of3GHRWY5XTmz3J44lLX8J7kHrnChfnP3XINnr95whYO3zu3shYD
         Kn2w==
X-Gm-Message-State: AOJu0YxSHmYeO0JYxhRtZ1BxSFcQPvBpiou3UrkmKpqjB83kM+c5aRra
	oUJndIFTi1VJ+oKdyVNG8bbgHBkinXzpaaObUoviJ5iNdchUFyrYxQ/ohd2aYS4=
X-Gm-Gg: ASbGncsvQEKiJMsaIHfrgOCnY9J3klVaEEadJ89+yL/hthIyua8/PhGxwJ8GnVF5gF4
	UrJ5/RdD7ESkCY+fQYGi5m0eN07E+AXaycuBYEjGcFD1elqsI+JshAIjNpmakfd5F7Easkvolve
	a5pvqMTxBMhltXN2FYHV4CD+ZkyP60jOO05+XveXcub44+dz+pflB8LdqDvnl0tuMhS8kqbJOjL
	KFwNvftW/6C7DP9U26oGTIxPPLmm1rs8lLz97a1u8rS2+BZU+dsCvHpZnYo1gYsysHgqzWf6UbR
	v38D1vb3WV6nOxLm0PvHs/ack7N1V/VV0fmFQY93LmnFOekonaao9o/90B8UEYw=
X-Google-Smtp-Source: AGHT+IG+gKYpgpOhUJRwdwD+l4A2600bYtEYFYwQWPHBA42eyZhpvsPB1Ox0uvb35nLOjc9QtMB5/w==
X-Received: by 2002:a5d:64e4:0:b0:390:f9d0:5e3 with SMTP id ffacd0b85a97d-3997f8f6450mr21534753f8f.1.1743003349659;
        Wed, 26 Mar 2025 08:35:49 -0700 (PDT)
Received: from heaven.lanfs.local ([62.161.254.42])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9eff6esm17141771f8f.100.2025.03.26.08.35.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Mar 2025 08:35:49 -0700 (PDT)
From: Corentin Guillevic <corentin.guillevic@smile.fr>
To: Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Corentin Guillevic <corentin.guillevic@smile.fr>
Cc: linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] dt-bindings: leds: Add TI TLC5928 LED
Date: Wed, 26 Mar 2025 16:35:33 +0100
Message-ID: <20250326153535.158137-2-corentin.guillevic@smile.fr>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250326153535.158137-1-corentin.guillevic@smile.fr>
References: <20250326153535.158137-1-corentin.guillevic@smile.fr>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document Texas Instruments TLC5928 LED driver devicetree bindings.

Signed-off-by: Corentin Guillevic <corentin.guillevic@smile.fr>
---
 .../bindings/leds/leds-tlc5928.yaml           | 212 ++++++++++++++++++
 1 file changed, 212 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-tlc5928.yaml

diff --git a/Documentation/devicetree/bindings/leds/leds-tlc5928.yaml b/Documentation/devicetree/bindings/leds/leds-tlc5928.yaml
new file mode 100644
index 000000000000..0d857c9b1feb
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/leds-tlc5928.yaml
@@ -0,0 +1,212 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/leds-tlc5928.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: LED driver for TLC5928 from Texas Instruments.
+
+maintainers:
+  - Corentin Guillevic <corentin.guillevic@smile.fr>
+
+description: |
+  The TLC5928 is a LED controller handling up to 16 LEDs. It can
+  control LED on/off using a SPI-compatible interface, and has an
+  on/off control data shift register (blank) and data latch.
+
+  This driver also supports the daisy-chaining of several TLC5928
+  chips, as illustrated by the diagram below (with two controllers):
+
+  +--------------+           +--------------+
+  |          SCLK|-----+---->|SCLK     BLANK|--
+  |              |     |     |              |
+  |  SPI     MOSI|-----|---->|MOSI  TLC5928 |
+  | Master       |     |     |        (1)   |
+  |          MISO|<--+ |  +--|MISO          |
+  |              |   | |  |  |              |
+  |      CS/LATCH|-+-|-|--|->|LATCH         |
+  +--------------+ | | |  |  +--------------+
+                   | | |  |  +--------------+
+                   | | +--|->|SCLK     BLANK|--
+                   | |    |  |              |
+                   | |    +->|MOSI  TLC5928 |
+                   | |       |        (2)   |
+                   | +-------|MISO          |
+                   |         |              |
+                   +-------->|LATCH         |
+                             +--------------+
+
+  For more product information please see the link below:
+  https://www.ti.com/product/TLC5928/part-details/TLC5928PWPR
+
+properties:
+  compatible:
+    const: ti,tlc5928
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+  reg:
+    maxItems: 1
+    description:
+      SPI slave address
+
+  enable-gpios:
+    description: |
+      Array of GPIO specifiers, referring to the GPIO pins to enable/disable
+      each device (active high to disable). In the daisy chain case, each
+      GPIO has to be in the same sequence than the devices.
+
+  latch-gpio:
+    maxItems: 1
+    description: Latch GPIO (SPI chip select)
+
+patternProperties:
+  "^spi-chip@[0-9]$":
+    type: object
+    unevaluatedProperties: false
+    description: Properties for a TLC5928 controller.
+
+    properties:
+      '#address-cells':
+        const: 1
+
+      '#size-cells':
+        const: 0
+
+    patternProperties:
+
+      "^led@[0-9a-f]+$":
+        type: object
+        $ref: common.yaml#
+        unevaluatedProperties: false
+        description:
+          Properties for a single LED.
+
+        properties:
+          reg:
+            description: Index of the LED.
+            minimum: 0
+            maximum: 15
+
+        required:
+          - reg
+
+    required:
+      - "#address-cells"
+      - "#size-cells"
+
+required:
+  - compatible
+  - reg
+  - latch-gpio
+
+unevaluatedProperties: false
+
+examples:
+  # Single controller
+  - |
+	#include <dt-bindings/leds/common.h>
+
+	tlc5928@0 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		compatible = "ti,tlc5928";
+		reg = <0x0>;
+
+		enable-gpios = <&gpiof 10 GPIO_ACTIVE_HIGH>;
+		latch-gpio = <&gpiof 3 GPIO_ACTIVE_HIGH>;
+
+		spi-chip@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			led@0 {
+				label = "tlc5928:led0";
+				led = <LED_COLOR_ID_WHITE>;
+				reg = <0x0>;
+			};
+
+			led@1 {
+				label = "tlc5928:led1";
+				led = <LED_COLOR_ID_RED>;
+				reg = <0x1>;
+			};
+
+			led@f {
+				label = "tlc5928:led15";
+				led = <LED_COLOR_ID_GREEN>;
+				reg = <0xf>;
+			};
+		};
+	};
+
+  # Two controllers, in daisy chain
+  - |
+	#include <dt-bindings/leds/common.h>
+
+	tlc5928@0 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		compatible = "ti,tlc5928";
+		reg = <0x0>;
+
+		enable-gpios = <&gpiof 10 GPIO_ACTIVE_HIGH>, /* OUT_EN_1 */
+			<&gpiof 9 GPIO_ACTIVE_HIGH>; /* OUT_EN_2 */
+		latch-gpio = <&gpiof 3 GPIO_ACTIVE_HIGH>;
+
+		spi-chip@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			led@0 {
+				label = "tlc5928:0:led0";
+				led = <LED_COLOR_ID_WHITE>;
+				reg = <0x0>;
+			};
+
+			led@1 {
+				label = "tlc5928:0:led1";
+				led = <LED_COLOR_ID_RED>;
+				reg = <0x1>;
+			};
+
+			led@f {
+				label = "tlc5928:0:led15";
+				led = <LED_COLOR_ID_GREEN>;
+				reg = <0xf>;
+			};
+		};
+
+		spi-chip@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			led@0 {
+				label = "tlc5928:1:led0";
+				led = <LED_COLOR_ID_BLUE>;
+				reg = <0x0>;
+			};
+
+			led@1 {
+				label = "tlc5928:1:led1";
+				led = <LED_COLOR_ID_AMBER>;
+				reg = <0x1>;
+			};
+
+			led@2 {
+				label = "tlc5928:1:led2";
+				led = <LED_COLOR_ID_VIOLET>;
+				reg = <0x2>;
+			};
+
+			led@f {
+				label = "tlc5928:1:led15";
+				led = <LED_COLOR_ID_YELLOW>;
+				reg = <0xf>;
+			};
+		};
+	};
-- 
2.45.2


