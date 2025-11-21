Return-Path: <linux-leds+bounces-6275-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id DE109C7A683
	for <lists+linux-leds@lfdr.de>; Fri, 21 Nov 2025 16:07:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id B427435E1BA
	for <lists+linux-leds@lfdr.de>; Fri, 21 Nov 2025 14:59:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD8F3333437;
	Fri, 21 Nov 2025 14:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T6BFudg/"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBD3C30594F
	for <linux-leds@vger.kernel.org>; Fri, 21 Nov 2025 14:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763737164; cv=none; b=KNPOz/cbwwZTNBPZ/yB1UBSQ8dPm4d0CpdI7jKHcbvFf+yUVu2CxVbEz6SalH6JuFgHncdyYNPAiuyv5acMdHbwg5AB2AJ3STqu+B2vemphgMRnKr7SwYR+wvknxleS+MeYDHXL/o0DOjJP/4Oi6IF6iPRYZmEV99lxF5+5rynY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763737164; c=relaxed/simple;
	bh=0RYxF2O1I50G0xCMEk9os6H+1FU7Nj2Qsc46pGikx3E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sg13ZUQNrW0hWHCGy6FXabo059CgdhZxPmR3Iv9trMnn+68oLF0H5D4soHFoqzgxL/i0Y4+NZmNCVv296TT72Mz7Z87LlJQkbLDVGHcNbQM4UL+yPRNwGY/AOBKp1p/JIcglg0g4WeUYAudrw4lv8xCHeGx47+gZsmpf6+zwh74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T6BFudg/; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-8b2148ca40eso284542685a.1
        for <linux-leds@vger.kernel.org>; Fri, 21 Nov 2025 06:59:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763737159; x=1764341959; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TFyXZv60JjVqu0d66mH+BvtprWywEdPKCOEamb24pyg=;
        b=T6BFudg/EFkSEHyoKcuvqcUbrkgHwO1x1NhLBZh9XG92dvPL3MpFYZvLTM4lBHXdpR
         m7czsHr3uk5Trfomm+Fs0g0E+dUS0ZWI/zlICbS47d91As9WaRJgOZ8xJ26r22O0CBeM
         adpV36IYjuEzTAkjf/QDNMdUBmgLmQLNB9d7sS94NCHlWEAVLm/YPhNL8JNAwWUSTr2S
         Jg+PFp6t0xXbjKmsIZlhTNWgMsfPkJMP+Wp43TzRj73YpvFJr4IAVUaqnhqj7RJa9Bp5
         k1vkY91uQ5GaEJUw4857tStam9YpOS4EJMZiLLrIiOproPcLv1Z5g34+H7e6ibtxP0Xw
         iZcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763737159; x=1764341959;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TFyXZv60JjVqu0d66mH+BvtprWywEdPKCOEamb24pyg=;
        b=p+q6Jebakm+k2CpWGLZ5DRguMUzjwvNP76Ewe4FBOso3ggBAQTA13s4aHCXBgdm/To
         ZNgqoSVHpGfTKiuf4wIUKDMYq+3Jq3q/lP9mu0WB1vTpLf878uefrRHA4oTTkPQCToSw
         Wocl9k6MC+rg1vS1jwBvLcZUNOlVrhz26iLZxXakbEiYT48DvSP3unNYRDOzipJ+x19o
         ULA/f/3E/fcHzV/A49F0NvZGQhKPoptf4QlwC0Mxs+lOVknvepH8P9rs/5FMt8NgQRMK
         tr+2p4dnaUvv4AvlJS3SuYOC9NJP9fQdiq96op6swZGB3fQG8cBK151HAqLS8S+dJXpo
         PEhg==
X-Forwarded-Encrypted: i=1; AJvYcCWvL8TzB+oNVNypX1Itfn4WZabzb+a6n0L3gUrKLpyqp9zSUYrbG3LP+BMxouX/AORSL++7M8/ZFJCc@vger.kernel.org
X-Gm-Message-State: AOJu0YzCzmh+875yDjQEkYH4CYtDMYXzcnZ8NrBZoBR5Ulsw5toNV3oe
	bp20c4daga2mpBX33nwIa6ZvrszAl2nHKx4GoFS5p62UQNpUmoU98ssZ
X-Gm-Gg: ASbGncvtQzHI/5zDBZ/8b2fAXM7jQFt6vUcmiwH7c+QnX+2hprvIWZT1sqoezeRN2vl
	qYKJvdZby8ORrzUPqYI8Xspd61HqbYF4daJFmfqHGV/25TOW2+BaTv7Up78J26oZAE9UvxEU88e
	c6DD0fztkIZzOX5khA2++MJggKpr+Opw8qr9JPOCz+MWCpJ2j12M9ShotO4V0kgNGfme0V47hqz
	+ail+QdakP8iM1sKM2Il3gbJPdE2+Lw71JXyqMW9FoNkm7GOZtmhix7a1w/bROiOw5hRh1/hHUl
	+KEZvTbQcDHqlkajTncQbouWc94tD/xTOfgr1XAycEsO6OhxFiv1HGgDm01BqR5PDPQwYlpbVkU
	uf3wyf3HVFaKeXAQNu79CXBZZPQbRbO9FyPYyQGubaxjxADGC0LWEEASsk0iCsH+6+fz/lkGxPg
	xDICsYl02pspDHP/t+FNCwPV0G8VabW5c+rbJEluVJjJ0j/wYfpWIIlTQ1
X-Google-Smtp-Source: AGHT+IFd4caIoqL9aFEyCoew15z3I1kr3N4w1lYRKu3YEsWf+q0KAidZs97UdhZL8qN6RoYTZlCEYA==
X-Received: by 2002:a05:620a:46a0:b0:8b2:7165:544f with SMTP id af79cd13be357-8b33d1fd878mr311333285a.25.1763737158857;
        Fri, 21 Nov 2025 06:59:18 -0800 (PST)
Received: from localhost (modemcable197.17-162-184.mc.videotron.ca. [184.162.17.197])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8b32932ba76sm388744785a.4.2025.11.21.06.59.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 06:59:18 -0800 (PST)
From: =?UTF-8?q?Jean-Fran=C3=A7ois=20Lessard?= <jefflessard3@gmail.com>
To: Andy Shevchenko <andy@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v6 3/7] dt-bindings: auxdisplay: add Titan Micro Electronics TM16xx
Date: Fri, 21 Nov 2025 09:59:03 -0500
Message-ID: <20251121145911.176033-4-jefflessard3@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251121145911.176033-1-jefflessard3@gmail.com>
References: <20251121145911.176033-1-jefflessard3@gmail.com>
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
    
    The property uses explicit coordinate pairs to handle real-world
    hardware variations. Some board manufacturers use standard layouts
    (same grid, different segments per digit) while others use transposed
    layouts (same segment, different grids per digit). The coordinate-pair
    approach accommodates both patterns without requiring separate arrays
    or boolean flags, as confirmed acceptable by DT maintainers.

    Retained 'properties:' wrapper for spi-3wire in conditional block.
    Rob Herring suggested removing it, but dt_binding_check requires
    explicit 'properties:' context when referencing peripheral
    properties within allOf conditional sections to satisfy
    unevaluatedProperties validation. This follows the pattern in
    spi-controller.yaml itself.

 .../bindings/auxdisplay/titanmec,tm16xx.yaml  | 465 ++++++++++++++++++
 MAINTAINERS                                   |   5 +
 2 files changed, 470 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/auxdisplay/titanmec,tm16xx.yaml

diff --git a/Documentation/devicetree/bindings/auxdisplay/titanmec,tm16xx.yaml b/Documentation/devicetree/bindings/auxdisplay/titanmec,tm16xx.yaml
new file mode 100644
index 000000000000..a852d8b8882c
--- /dev/null
+++ b/Documentation/devicetree/bindings/auxdisplay/titanmec,tm16xx.yaml
@@ -0,0 +1,465 @@
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
+  Maximum brightness and grid/segment indices are controller-specific.
+  Controller-specific maximum are validated in the driver.
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
+
+  max-brightness:
+    minimum: 0  # 0=off
+    maximum: 8  # Maximum across all TM16xx controllers
+    description:
+      Normally the maximum brightness is determined by the hardware and this
+      property is not required. This property is used to put a software limit
+      on the brightness apart from what the driver says, as it could happen
+      that a LED can be made so bright that it gets damaged or causes damage
+      due to restrictions in a specific system, such as mounting conditions.
+
+  default-brightness:
+    minimum: 0  # 0=off
+    maximum: 8  # Maximum across all TM16xx controllers
+    description:
+      Brightness to be set if LED's default state is on. Used only during
+      initialization. If the option is not set then max brightness is used.
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
+      "^digit@[0-9a-f]+$":
+        type: object
+        unevaluatedProperties: false
+
+        properties:
+          reg:
+            description:
+              Digit position identifier numbered sequentially left-to-right,
+              with reg=0 representing the leftmost digit position as displayed
+              to the user.
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
+      "^led@[0-9a-f]+,[0-9a-f]+$":
+        type: object
+        description:
+          Individual LED icon addressed by <grid>,<segment> matrix coordinates.
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
+dependencies:
+  poll-interval:
+    - linux,keymap
+  linux,keymap:
+    - poll-interval
+  autorepeat:
+    - linux,keymap
+    - poll-interval
+
+required:
+  - compatible
+  - reg
+
+allOf:
+  - $ref: /schemas/leds/common.yaml#
+    properties:
+      color: false
+      function: false
+      function-enumerator: false
+  - $ref: /schemas/input/input.yaml#
+  - $ref: /schemas/input/matrix-keymap.yaml#
+  # SPI controllers require 3-wire (combined MISO/MOSI line)
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - fdhisi,fd620
+              - fdhisi,fd628
+              - princeton,pt6964
+              - titanmec,tm1618
+              - titanmec,tm1620
+              - titanmec,tm1628
+              - titanmec,tm1638
+              - wxicore,aip1618
+              - wxicore,aip1628
+    then:
+      $ref: /schemas/spi/spi-peripheral-props.yaml#
+      properties:
+        spi-3wire: true
+      required:
+        - spi-3wire
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
+          digit@0 {
+            reg = <0>;
+            segments = <1 3>, <1 4>, <1 5>, <1 0>, <1 1>, <1 2>, <1 6>;
+          };
+          digit@1 {
+            reg = <1>;
+            segments = <2 3>, <2 4>, <2 5>, <2 0>, <2 1>, <2 2>, <2 6>;
+          };
+          digit@2 {
+            reg = <2>;
+            segments = <3 3>, <3 4>, <3 5>, <3 0>, <3 1>, <3 2>, <3 6>;
+          };
+          digit@3 {
+            reg = <3>;
+            segments = <4 3>, <4 4>, <4 5>, <4 0>, <4 1>, <4 2>, <4 6>;
+          };
+        };
+
+        leds {
+          #address-cells = <2>;
+          #size-cells = <0>;
+          led@0,0 {
+            reg = <0 0>;
+            function = LED_FUNCTION_ALARM;
+          };
+          led@0,1 {
+            reg = <0 1>;
+            function = LED_FUNCTION_USB;
+          };
+          led@0,2 {
+            reg = <0 2>;
+            function = "play";
+          };
+          led@0,3 {
+            reg = <0 3>;
+            function = "pause";
+          };
+          led@0,4 {
+            reg = <0 4>;
+            function = "colon";
+          };
+          led@0,5 {
+            reg = <0 5>;
+            function = LED_FUNCTION_LAN;
+          };
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
+          digit@0 {
+            reg = <0>;
+            segments = <0 7>, <1 7>, <2 7>, <3 7>, <4 7>, <5 7>, <6 7>;
+          };
+          digit@1 {
+            reg = <1>;
+            segments = <0 6>, <1 6>, <2 6>, <3 6>, <4 6>, <5 6>, <6 6>;
+          };
+          digit@2 {
+            reg = <2>;
+            segments = <0 5>, <1 5>, <2 5>, <3 5>, <4 5>, <5 5>, <6 5>;
+          };
+          digit@3 {
+            reg = <3>;
+            segments = <0 4>, <1 4>, <2 4>, <3 4>, <4 4>, <5 4>, <6 4>;
+          };
+        };
+
+        leds {
+          #address-cells = <2>;
+          #size-cells = <0>;
+          led@0,3 {
+            reg = <0 3>;
+            function = "apps";
+          };
+          led@1,3 {
+            reg = <1 3>;
+            function = "setup";
+          };
+          led@2,3 {
+            reg = <2 3>;
+            function = LED_FUNCTION_USB;
+          };
+          led@3,3 {
+            reg = <3 3>;
+            function = LED_FUNCTION_SD;
+          };
+          led@4,3 {
+            reg = <4 3>;
+            function = "colon";
+          };
+          led@5,3 {
+            reg = <5 3>;
+            function = "hdmi";
+          };
+          led@6,3 {
+            reg = <6 3>;
+            function = "video";
+          };
+        };
+      };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index e64b94e6b5a9..8ccf02ca2544 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25914,6 +25914,11 @@ W:	http://sourceforge.net/projects/tlan/
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


