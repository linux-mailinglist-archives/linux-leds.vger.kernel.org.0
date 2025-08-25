Return-Path: <linux-leds+bounces-5296-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D102B33487
	for <lists+linux-leds@lfdr.de>; Mon, 25 Aug 2025 05:33:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E605F1B21CCA
	for <lists+linux-leds@lfdr.de>; Mon, 25 Aug 2025 03:33:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4710265626;
	Mon, 25 Aug 2025 03:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H/uwobXn"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A55D227563;
	Mon, 25 Aug 2025 03:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756092767; cv=none; b=JxBv7QBZm5UBtcD+u9NxgF38RY1X9Fzv1+amTkNoekkdFQ3y4mK19cPHi7qf9tvn2p+v6Y6vEdSrRLzNtCWZm6bBtwV2CTISEF99GJosTvBCsDHFIPZj1kI1PSTfMhntxTqx7aQ4sv16vPcDDe89ipJEKJmCpaQOpU+2ulLR4j8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756092767; c=relaxed/simple;
	bh=CdknLA4oYkmiEMfaV6tQtGlShoyMmY/5mdkIN2hxfiY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dnlNNXs7nFO0PGR2CIsNbVbkeXJ/Al8vs0xD6xYVseJ1EJjeO2M/yOqVJ0yLbi+YPttujM1nUUtv4hupVvy2a+0/Zu5bx8/wUKmOjIw05c26cvw+oA8TKcSDbkXIfLCufZmWBC5Y+aNxVkUIBLVSdlio1okyTWIKlUAv8EJV7e8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H/uwobXn; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-7e87063d4a9so458537185a.2;
        Sun, 24 Aug 2025 20:32:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756092762; x=1756697562; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vH0RnFbBr4G+KmlwYqWn9JvCWlzsCGtB0ZNchU5WCIc=;
        b=H/uwobXnpclHO5IoEEt52ZF782IZfe0mcZ7IU1wspkDNLePnw6pnyqqbeAa4LcENyn
         LLruikubaJQe/DrNVr8mFSBskokrMqJeel6qSZQk+umCxEwGsOB4xeCs0Bau70tANbqW
         8s05uKuUwxQOkgpijUR9Kvx/aZZP1dM+cMQhD9Y0nDOaBWH9KAeFvnn1wLh5Jx/tsTDM
         1Sxkr7o+p4gQKgtjnGixtzj1isjza0K/yVPyq/aV/53/Gufc1pwo7UfIYUbS7J7iZuQL
         bvBBGP+93pUSpKS0vomT1GdmXHfnkBKssf1YKwuarIKe0FlZeT/kT7+LtU8TCyMa1Kar
         /NgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756092762; x=1756697562;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vH0RnFbBr4G+KmlwYqWn9JvCWlzsCGtB0ZNchU5WCIc=;
        b=HCKVdBtnoQwSJJMHlt7XrDfbMsStca4iNmOW8KWeDVP0e8oIQDFq+503RjDyrWuo4A
         ZxLIIyHyf5ivcQ5tXq7eWd4P3J6svuWFXCWuLOU8TIubhkgj9w2950zux7joSu8s80YD
         rMT9weQ/rtRW2WYoJGiQJ///Nsiv4XU0t1HQiz0NfCSqWdmJQeH1XAKLI0zk47np9mia
         38MlTm07nDp9UdAXfAu5Qnx5UxUk913vpT6z0V/4de7bjUy0Ovaqo2G8pbs4i8cinz7C
         h5vZLMo5v5YB+qiM03S/PEEKN7VDM809xay8ArRN1OR2zdjNdvpK9R4cS2+BqBOMWqg1
         37gQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZUCHKsGA18dXRv3pEDygs+EoMelSZZhCDNGkD/p8nY7ZdGUXvTy8FGqmphbHyIRT+zIO+Lzirpwz+@vger.kernel.org, AJvYcCXk67qUszl/7c83nCTxwdeDoYA1cC+LzH5vdjBgsPMg0MTBpuvoDv5I4NNEG1UR8/tSySyrXru/rk7lDQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxMlR0tZx3VwXMCTyznoYdAkxq3BYU0jTATegCkWBQ9b7oUqNVo
	1ex/BXfMLiTaJvD/iFmJvGOjwU364gawN9D4sLouV6q9rGAtQ8u7bNN/tNBQvON0
X-Gm-Gg: ASbGnctpdUryJx8/LSfOGpNbEe87A/oYb0inFszzWO/7Hgol13LZZ9rJTUxS/8U9JMY
	c99CJ42nxRh6qHjX2KKOsB4h+MHEjvxaOJh8h2JIBAjionYfstd/NMdAuJODBz1Ax3RFhQSXHk5
	FWx9Wh/hJ/y/DJ7lV0t+0I58UCnUViWRCyN7Ne+ZKoGNn4BnFYZOiDCImF5pj9BqkSXZH9JAuUK
	fAEgByx8x/TW3Z7POsCwJHieyDs4zaKOg/l24k7CDSDu0gX2UdB99fckK/CH++M7uiQN395MpvY
	v4a9Z7RGYW9tYWfXPbBjjS5Gb3rFYp/G5+1xfC/qCnfrgArFUmsDUT83mh9cSVtdL+qaae6NEJF
	VipFXLydcTgEeWu6dbQ0EBN5wXvTKqN/FmFM3rLDSJagqA4dLHVtBg6HiTi8HSK6S4555
X-Google-Smtp-Source: AGHT+IHzrnRhKFuYRQ0NR2Coi8A3jEzFcY4bFfWs5HAw1xLMT3iznYldxcQPfvJOIQSXh1VbnHizHw==
X-Received: by 2002:a05:620a:258f:b0:7ea:1025:efa1 with SMTP id af79cd13be357-7ea10f96f67mr1237298085a.16.1756092761988;
        Sun, 24 Aug 2025 20:32:41 -0700 (PDT)
Received: from localhost (modemcable197.17-162-184.mc.videotron.ca. [184.162.17.197])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7ebed8902fcsm404437185a.20.2025.08.24.20.32.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Aug 2025 20:32:41 -0700 (PDT)
From: =?UTF-8?q?Jean-Fran=C3=A7ois=20Lessard?= <jefflessard3@gmail.com>
To: Andy Shevchenko <andy@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v4 2/6] dt-bindings: auxdisplay: add Titan Micro Electronics TM16xx
Date: Sun, 24 Aug 2025 23:32:28 -0400
Message-ID: <20250825033237.60143-3-jefflessard3@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250825033237.60143-1-jefflessard3@gmail.com>
References: <20250825033237.60143-1-jefflessard3@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add documentation for TM16xx-compatible 7-segment LED display controllers
with keyscan.

Signed-off-by: Jean-François Lessard <jefflessard3@gmail.com>
---

Notes:
    The 'segments' property is intentionally not vendor-prefixed as it
    defines a generic hardware description concept applicable to any
    7-segment display controller. The property describes the fundamental
    grid/segment coordinate mapping that is controller-agnostic and could
    be reused by other LED matrix display bindings. Similar to how 'gpios'
    describes GPIO connections generically, 'segments' describes segment
    connections in a standardized way using uint32-matrix format.

 .../bindings/auxdisplay/titanmec,tm16xx.yaml  | 477 ++++++++++++++++++
 MAINTAINERS                                   |   5 +
 2 files changed, 482 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/auxdisplay/titanmec,tm16xx.yaml

diff --git a/Documentation/devicetree/bindings/auxdisplay/titanmec,tm16xx.yaml b/Documentation/devicetree/bindings/auxdisplay/titanmec,tm16xx.yaml
new file mode 100644
index 000000000..c94556d95
--- /dev/null
+++ b/Documentation/devicetree/bindings/auxdisplay/titanmec,tm16xx.yaml
@@ -0,0 +1,477 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/auxdisplay/titanmec,tm16xx.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Auxiliary displays based on TM16xx and compatible LED controllers
+
+maintainers:
+  - Jean-François Lessard <jefflessard3@gmail.com>
+
+description: |
+  LED matrix controllers used in auxiliary display devices that drive individual
+  LED icons and 7-segment digit groups through a grid/segment addressing scheme.
+  Controllers manage a matrix of LEDs organized as grids (columns/banks in
+  vendor datasheets) and segments (rows/bit positions in vendor datasheets).
+  Maximum grid and segment indices are controller-specific.
+
+  The controller is agnostic of the display layout. Board-specific LED wiring is
+  described through child nodes that specify grid/segment coordinates for
+  individual icons and segment mapping for 7-segment digits.
+
+  The bindings use separate 'leds' and 'digits' containers to accommodate
+  different addressing schemes:
+  - LEDs use 2-cell addressing (grid, segment) for matrix coordinates
+  - Digits use 1-cell addressing with explicit segment mapping
+
+  The controller node exposes a logical LED-like control for the aggregate
+  display brightness. Child nodes describe individual icons and 7-seg digits.
+  The top-level control supports only label and brightness-related properties
+  and does not support other common LED properties such as color or function.
+  Child LED nodes use the standard LED binding.
+
+  Optional keypad scanning is supported when both 'linux,keymap' and
+  'poll-interval' properties are specified.
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - fdhisi,fd628
+              - princeton,pt6964
+              - wxicore,aip1628
+          - const: titanmec,tm1628
+      - items:
+          - enum:
+              - wxicore,aip1618
+          - const: titanmec,tm1618
+      - items:
+          - enum:
+              - fdhisi,fd650
+              - wxicore,aip650
+          - const: titanmec,tm1650
+      - enum:
+          - fdhisi,fd620
+          - fdhisi,fd655
+          - fdhisi,fd6551
+          - titanmec,tm1618
+          - titanmec,tm1620
+          - titanmec,tm1628
+          - titanmec,tm1638
+          - titanmec,tm1650
+          - winrise,hbs658
+
+  reg:
+    maxItems: 1
+
+  label:
+    description:
+      The label for the top-level LED. If omitted, the label is taken from the
+      node name (excluding the unit address). It has to uniquely identify a
+      device, i.e. no other LED class device can be assigned the same label.
+    $ref: /schemas/leds/common.yaml#/properties/label
+
+  max-brightness:
+    description:
+      Normally the maximum brightness is determined by the hardware and this
+      property is not required. This property is used to put a software limit
+      on the brightness apart from what the driver says, as it could happen
+      that a LED can be made so bright that it gets damaged or causes damage
+      due to restrictions in a specific system, such as mounting conditions.
+    $ref: /schemas/leds/common.yaml#/properties/max-brightness
+
+  default-brightness:
+    description:
+      Brightness to be set if LED's default state is on. Used only during
+      initialization. If the option is not set then max brightness is used.
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  digits:
+    type: object
+    description: Container for 7-segment digit group definitions
+    additionalProperties: false
+
+    properties:
+      "#address-cells":
+        const: 1
+      "#size-cells":
+        const: 0
+
+    patternProperties:
+      "^digit@[0-9]+$":
+        type: object
+        unevaluatedProperties: false
+
+        properties:
+          reg:
+            description: Digit position identifier
+            maxItems: 1
+
+          segments:
+            $ref: /schemas/types.yaml#/definitions/uint32-matrix
+            description: |
+              Array of grid/segment coordinate pairs for each 7-segment position.
+              Each entry is <grid segment> mapping to standard 7-segment positions
+              in order: a, b, c, d, e, f, g
+
+              Standard 7-segment layout:
+                 aaa
+                f   b
+                f   b
+                 ggg
+                e   c
+                e   c
+                 ddd
+            items:
+              items:
+                - description: Grid index
+                - description: Segment index
+            minItems: 7
+            maxItems: 7
+
+        required:
+          - reg
+          - segments
+
+  leds:
+    type: object
+    description: Container for individual LED icon definitions
+    additionalProperties: false
+
+    properties:
+      "#address-cells":
+        const: 2
+      "#size-cells":
+        const: 0
+
+    patternProperties:
+      "^led@[0-9]+,[0-9]+$":
+        type: object
+        $ref: /schemas/leds/common.yaml#
+        unevaluatedProperties: false
+
+        properties:
+          reg:
+            description:
+              Grid and segment indices as <grid segment> of this individual LED icon
+
+        required:
+          - reg
+
+allOf:
+  - $ref: /schemas/input/input.yaml#
+  - $ref: /schemas/input/matrix-keymap.yaml#
+
+dependencies:
+  poll-interval:
+    - linux,keymap
+  linux,keymap:
+    - poll-interval
+  autorepeat:
+    - linux,keymap
+    - poll-interval
+
+# SPI controllers require 3-wire (combined MISO/MOSI line)
+if:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - fdhisi,fd620
+          - fdhisi,fd628
+          - princeton,pt6964
+          - titanmec,tm1618
+          - titanmec,tm1620
+          - titanmec,tm1628
+          - titanmec,tm1638
+          - wxicore,aip1618
+          - wxicore,aip1628
+then:
+  allOf:
+    - $ref: /schemas/spi/spi-peripheral-props.yaml#
+  properties:
+    spi-3wire: true
+  required:
+    - spi-3wire
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/leds/common.h>
+
+    // I2C example: Magicsee N5 TV box with fd655 controller
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      display@24 {
+        reg = <0x24>;
+        compatible = "fdhisi,fd655";
+
+        digits {
+          #address-cells = <1>;
+          #size-cells = <0>;
+
+          digit@0 {
+            reg = <0>;
+            segments = <4 3>, <4 4>, <4 5>, <4 0>, <4 1>, <4 2>, <4 6>;
+          };
+
+          digit@1 {
+            reg = <1>;
+            segments = <3 3>, <3 4>, <3 5>, <3 0>, <3 1>, <3 2>, <3 6>;
+          };
+
+          digit@2 {
+            reg = <2>;
+            segments = <2 3>, <2 4>, <2 5>, <2 0>, <2 1>, <2 2>, <2 6>;
+          };
+
+          digit@3 {
+            reg = <3>;
+            segments = <1 3>, <1 4>, <1 5>, <1 0>, <1 1>, <1 2>, <1 6>;
+          };
+        };
+
+        leds {
+          #address-cells = <2>;
+          #size-cells = <0>;
+
+          led@0,0 {
+            reg = <0 0>;
+            function = LED_FUNCTION_ALARM;
+          };
+
+          led@0,1 {
+            reg = <0 1>;
+            function = LED_FUNCTION_USB;
+          };
+
+          led@0,2 {
+            reg = <0 2>;
+            function = "play";
+          };
+
+          led@0,3 {
+            reg = <0 3>;
+            function = "pause";
+          };
+
+          led@0,4 {
+            reg = <0 4>;
+            function = "colon";
+          };
+
+          led@0,5 {
+            reg = <0 5>;
+            function = LED_FUNCTION_LAN;
+          };
+
+          led@0,6 {
+            reg = <0 6>;
+            function = LED_FUNCTION_WLAN;
+          };
+        };
+      };
+    };
+
+  - |
+    #include <dt-bindings/input/input.h>
+
+    // SPI example: TM1638 module with keypad support
+    spi {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      display@0 {
+        reg = <0>;
+        compatible = "titanmec,tm1638";
+        spi-3wire;
+        spi-lsb-first;
+        spi-max-frequency = <500000>;
+
+        label = "tm1638";
+        default-brightness = <2>;
+        max-brightness = <4>;
+        poll-interval = <100>;
+        linux,keymap = <MATRIX_KEY(2, 0, KEY_F1)
+                        MATRIX_KEY(2, 2, KEY_F2)
+                        MATRIX_KEY(2, 4, KEY_F3)
+                        MATRIX_KEY(2, 6, KEY_F4)
+                        MATRIX_KEY(2, 1, KEY_F5)
+                        MATRIX_KEY(2, 3, KEY_F6)
+                        MATRIX_KEY(2, 5, KEY_F7)
+                        MATRIX_KEY(2, 7, KEY_F8)>;
+
+        digits {
+          #address-cells = <1>;
+          #size-cells = <0>;
+
+          digit@0 {
+            reg = <0>;
+            segments = <7 0>, <7 1>, <7 2>, <7 3>, <7 4>, <7 5>, <7 6>;
+          };
+
+          digit@1 {
+            reg = <1>;
+            segments = <6 0>, <6 1>, <6 2>, <6 3>, <6 4>, <6 5>, <6 6>;
+          };
+
+          digit@2 {
+            reg = <2>;
+            segments = <5 0>, <5 1>, <5 2>, <5 3>, <5 4>, <5 5>, <5 6>;
+          };
+
+          digit@3 {
+            reg = <3>;
+            segments = <4 0>, <4 1>, <4 2>, <4 3>, <4 4>, <4 5>, <4 6>;
+          };
+
+          digit@4 {
+            reg = <4>;
+            segments = <3 0>, <3 1>, <3 2>, <3 3>, <3 4>, <3 5>, <3 6>;
+          };
+
+          digit@5 {
+            reg = <5>;
+            segments = <2 0>, <2 1>, <2 2>, <2 3>, <2 4>, <2 5>, <2 6>;
+          };
+
+          digit@6 {
+            reg = <6>;
+            segments = <1 0>, <1 1>, <1 2>, <1 3>, <1 4>, <1 5>, <1 6>;
+          };
+
+          digit@7 {
+            reg = <7>;
+            segments = <0 0>, <0 1>, <0 2>, <0 3>, <0 4>, <0 5>, <0 6>;
+          };
+        };
+
+        leds {
+          #address-cells = <2>;
+          #size-cells = <0>;
+
+          led@0,7 {
+            reg = <0 7>;
+          };
+
+          led@1,7 {
+            reg = <1 7>;
+          };
+
+          led@2,7 {
+            reg = <2 7>;
+          };
+
+          led@3,7 {
+            reg = <3 7>;
+          };
+
+          led@4,7 {
+            reg = <4 7>;
+          };
+
+          led@5,7 {
+            reg = <5 7>;
+          };
+
+          led@6,7 {
+            reg = <6 7>;
+          };
+
+          led@7,7 {
+            reg = <7 7>;
+          };
+        };
+      };
+    };
+
+  - |
+    #include <dt-bindings/leds/common.h>
+
+    // SPI example: X96 Max with transposed layout (fd628 with tm1628 fallback)
+    spi {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      display@0 {
+        reg = <0>;
+        compatible = "fdhisi,fd628", "titanmec,tm1628";
+        spi-3wire;
+        spi-lsb-first;
+        spi-max-frequency = <500000>;
+
+        digits {
+          #address-cells = <1>;
+          #size-cells = <0>;
+
+          digit@0 {
+            reg = <0>;
+            segments = <0 3>, <1 3>, <2 3>, <3 3>, <4 3>, <5 3>, <6 3>;
+          };
+
+          digit@1 {
+            reg = <1>;
+            segments = <0 2>, <1 2>, <2 2>, <3 2>, <4 2>, <5 2>, <6 2>;
+          };
+
+          digit@2 {
+            reg = <2>;
+            segments = <0 1>, <1 1>, <2 1>, <3 1>, <4 1>, <5 1>, <6 1>;
+          };
+
+          digit@3 {
+            reg = <3>;
+            segments = <0 0>, <1 0>, <2 0>, <3 0>, <4 0>, <5 0>, <6 0>;
+          };
+        };
+
+        leds {
+          #address-cells = <2>;
+          #size-cells = <0>;
+
+          led@0,4 {
+            reg = <0 4>;
+            function = "apps";
+          };
+
+          led@1,4 {
+            reg = <1 4>;
+            function = "setup";
+          };
+
+          led@2,4 {
+            reg = <2 4>;
+            function = LED_FUNCTION_USB;
+          };
+
+          led@3,4 {
+            reg = <3 4>;
+            function = LED_FUNCTION_SD;
+          };
+
+          led@4,4 {
+            reg = <4 4>;
+            function = "colon";
+          };
+
+          led@5,4 {
+            reg = <5 4>;
+            function = "hdmi";
+          };
+
+          led@6,4 {
+            reg = <6 4>;
+            function = "video";
+          };
+        };
+      };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index daf520a13..4e5a7db6d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25402,6 +25402,11 @@ W:	http://sourceforge.net/projects/tlan/
 F:	Documentation/networking/device_drivers/ethernet/ti/tlan.rst
 F:	drivers/net/ethernet/ti/tlan.*
 
+TM16XX-COMPATIBLE LED CONTROLLERS DISPLAY DRIVER
+M:	Jean-François Lessard <jefflessard3@gmail.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/auxdisplay/titanmec,tm16xx.yaml
+
 TMIO/SDHI MMC DRIVER
 M:	Wolfram Sang <wsa+renesas@sang-engineering.com>
 L:	linux-mmc@vger.kernel.org
-- 
2.43.0


