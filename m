Return-Path: <linux-leds+bounces-5261-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AAA96B2E258
	for <lists+linux-leds@lfdr.de>; Wed, 20 Aug 2025 18:32:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 941B87B87D7
	for <lists+linux-leds@lfdr.de>; Wed, 20 Aug 2025 16:30:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 637B53314D7;
	Wed, 20 Aug 2025 16:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="boo+cpXU"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71CE332BF2D;
	Wed, 20 Aug 2025 16:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755707488; cv=none; b=iD7tDV9T6xRRwhEDpA6CxbUhOceOYIxp7j2Rofi72h73IAkJqIcBJZ7Se5LWsnwHRdkeVzQ7AdeZzluYOj4z3H5BKK8I47TbAY7E91LKmWhrSaxf/6rk9FHEGWEqAomgwiWXPeo+lhYYto94bKszxkn6OtJprqVe5W9xrQOc9g4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755707488; c=relaxed/simple;
	bh=8hLM9138BfaI8hiPrh0JEeh0edD0emDkI3h7JxkHkAU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RvBS0ehXhKmoN0afeROLhmFw+EE4Vve6zbNWFAwUwOH+nbziqrN9b1LnkKWWANez4bOutROWLtOc4SP3wFcIpThRuMjufQVOrJFMrIbSSjNRtOK7H4gFf2s9QFvSPCLHBebxuhgCCAwnyJz/yUzAd+mSC+4Bdu+79K4ijz+Fht8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=boo+cpXU; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-4b133b24e69so447541cf.2;
        Wed, 20 Aug 2025 09:31:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755707485; x=1756312285; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZqSNp4qNmUZDuJr95EJj43cjAsSRT3ThjtTX5VnzbhI=;
        b=boo+cpXURJmAyDSwE/+enyE6JtZbuO0irQg+3pYE+cgqrK5/drwsXwt+COmEcq1U1O
         ppVKGC8BRHKj5vWpeaVu/fyj5egycvWBkbRUerkhSOZmIe2+0m+iqCNgfu770pHlGxtH
         MI5MTe+lao7DjRBcsPWyFIlcnRzTQrpx1iebHdCi4HnkkxN9Y8bOhFEZ3+5IoOxnZf0a
         W5G6wSdpVotdmCu8HrB0bKKZ5/tNjsP967VBorm2P3AhsZeGyRT3sU+up41um4NocebF
         mO182+ZKV0XZ7cDPgy5UOoVmrIv9fpgAD/k6MwK46rraQ0ShKV15B1S3G62lN9B1LcCP
         trEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755707485; x=1756312285;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZqSNp4qNmUZDuJr95EJj43cjAsSRT3ThjtTX5VnzbhI=;
        b=YAa+XIq9Ticb5FwFFgnwfW3uLoY8skiC5VT84hOfp8WkK2Id9ayd9pof2mZWWoyw7e
         V4cbYh7eCCHyE2KyKBoxCRbgLBSiaVPCm/aEumUnyT3ChYq43iBu3NSOOjC6/xq/ySoa
         AK48Gm3VD+o28g6jlM404hvf2AIs2nGGw9H6nsmTqfOcFI5UFloQAyl0kGyA1H3u1ENw
         hvvAzb4+U5w11/SfHOai/WkbZvyJH+1muLgXBuh0UMYeSjpOz/os421bix6gDDXLAu6O
         LAjE2twvgqykZ9J3LxLeaxB3KT9srJk9MGyoPRa/CqmdlUpGWmGrU9JHj6RxeDBaP7ui
         CcxA==
X-Forwarded-Encrypted: i=1; AJvYcCVG8gJ5U/7JUpmCvNEC0CsNE3fuRH1Q5onxtbgk9AXxGyuvAxY3Q8ljxfrugunsfh4SRAJeb/P60BRSdg==@vger.kernel.org, AJvYcCVp2YsWu7kylDyohlYgguKs1tdDH4hI1+Mbi3D1baqX8oPohqwKSNDlMIUUAEthCIXDWZxb5PHg9SQiboOy@vger.kernel.org, AJvYcCXLaaNSLAQT2B8IuQatnq/gyYxSV18L34ulZNxcC+mD7z6V6q0AM3d0S/dFyIv7TdtCexGuJYADRI8k@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2W56Fdf56Ex2gjneTa79wH29JfVigUsTICqVFAYt1lc3qDJm7
	pv7XnRHricS+21MqQ18rxmoQnjdsKg+brTe5100hS1eDZ7J+3fYP0hBT
X-Gm-Gg: ASbGncsJEh8Fvm8KNhSvBhQZBrk5CNc2iUhw3N4TiXswfz4TlzPwspn+gHOW5WiIJQX
	VNESZY9sX6TffX9AthVRjBC36m5uQaDF/34Ar4EEMmqIFqdVg8U4ezGk4CnnlwFAYInee22tzTz
	FnYAW+ZSjHBO1QlFVjmAf+4d0D1z/to/Rcejj0DWpzSpnDzlTIopaB3GHMZKEfX+Ka9aeUyz+2/
	ogXIxK3ismrmQDN2oI8HF8ebY9pCPrq+nNhm7dmyUDOukM0o3loQ16wRyJ/O+RJTxtCx34mFTxu
	g1VJWOxQkuc0CT7TjwVcxzhj0+diTjok7hgcuTNN2SBmhS+5yB10jMGS7xYG+La0P2pJRdmu6zr
	Kijo8+eK9c5GRM6p5cTEW6bYQmSLXBQJhlywtDm77jFsigG7sCcuZfUGoHnHRTsFB+q3g
X-Google-Smtp-Source: AGHT+IGGkLUR1nvtsxzHrxCZXG7rturre4GTALvYyftxMgcjWKB/0JZ/EFPLrYgLTxqwffRSirOj5g==
X-Received: by 2002:a05:622a:244b:b0:4af:1daa:11ee with SMTP id d75a77b69052e-4b291a6b863mr50422151cf.16.1755707484924;
        Wed, 20 Aug 2025 09:31:24 -0700 (PDT)
Received: from localhost (modemcable197.17-162-184.mc.videotron.ca. [184.162.17.197])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70ba9097688sm89533436d6.25.2025.08.20.09.31.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 09:31:24 -0700 (PDT)
From: =?UTF-8?q?Jean-Fran=C3=A7ois=20Lessard?= <jefflessard3@gmail.com>
To: Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	devicetree@vger.kernel.org,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
	Boris Gjenero <boris.gjenero@gmail.com>,
	Christian Hewitt <christianshewitt@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Paolo Sabatino <paolo.sabatino@gmail.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v3 2/4] dt-bindings: auxdisplay: add Titan Micro Electronics TM16xx
Date: Wed, 20 Aug 2025 12:31:15 -0400
Message-ID: <20250820163120.24997-3-jefflessard3@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250820163120.24997-1-jefflessard3@gmail.com>
References: <20250820163120.24997-1-jefflessard3@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add documentation for TM16xx-compatible 7-segment LED display controllers with
keyscan.

Signed-off-by: Jean-François Lessard <jefflessard3@gmail.com>
---

Note: The 'segments' property is intentionally not vendor-prefixed as it defines
a generic hardware description concept applicable to any 7-segment display
controller. The property describes the fundamental grid/segment coordinate
mapping that is controller-agnostic and could be reused by other LED matrix
display bindings. Similar to how 'gpios' describes GPIO connections generically,
'segments' describes segment connections in a standardized way using
uint32-matrix format.

 .../bindings/auxdisplay/titanmec,tm16xx.yaml  | 471 ++++++++++++++++++
 1 file changed, 471 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/auxdisplay/titanmec,tm16xx.yaml

diff --git a/Documentation/devicetree/bindings/auxdisplay/titanmec,tm16xx.yaml b/Documentation/devicetree/bindings/auxdisplay/titanmec,tm16xx.yaml
new file mode 100644
index 000000000..b563c6e1e
--- /dev/null
+++ b/Documentation/devicetree/bindings/auxdisplay/titanmec,tm16xx.yaml
@@ -0,0 +1,471 @@
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
+  Optional keypad scanning is supported when both 'linux,keymap' and
+  'poll-interval' properties are specified.
+
+properties:
+  compatible:
+    oneOf:
+      # Controllers with titanmec,tm1628 fallback
+      - items:
+          - enum:
+              - fdhisi,fd628
+              - princeton,pt6964
+              - wxicore,aip1628
+          - const: titanmec,tm1628
+      - const: titanmec,tm1628
+      # Controllers with titanmec,tm1618 fallback
+      - items:
+          - enum:
+              - wxicore,aip1618
+          - const: titanmec,tm1618
+      - const: titanmec,tm1618
+      # Controllers with titanmec,tm1650 fallback
+      - items:
+          - enum:
+              - fdhisi,fd650
+              - wxicore,aip650
+          - const: titanmec,tm1650
+      - const: titanmec,tm1650
+      # Canonical standalone controllers
+      - const: fdhisi,fd620
+      - const: fdhisi,fd655
+      - const: fdhisi,fd6551
+      - const: titanmec,tm1620
+      - const: titanmec,tm1638
+      - const: winrise,hbs658
+
+  reg:
+    maxItems: 1
+
+  label:
+    description: Name of the entire device
+    default: display
+
+  default-brightness:
+    description:
+      Brightness to be set if LED's default state is on. Used only during
+      initialization. If the option is not set then max brightness is used.
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  max-brightness:
+    description:
+      Normally the maximum brightness is determined by the hardware and this
+      property is not required. This property is used to put a software limit
+      on the brightness apart from what the driver says, as it could happen
+      that a LED can be made so bright that it gets damaged or causes damage
+      due to restrictions in a specific system, such as mounting conditions.
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  linux,keymap:
+    $ref: /schemas/input/matrix-keymap.yaml#/properties/linux,keymap
+
+  poll-interval:
+    $ref: /schemas/input/input.yaml#/properties/poll-interval
+
+  autorepeat:
+    $ref: /schemas/input/input.yaml#/properties/autorepeat
+
+  digits:
+    type: object
+    description: Container for 7-segment digit group definitions
+    properties:
+      "#address-cells":
+        const: 1
+      "#size-cells":
+        const: 0
+
+    patternProperties:
+      "^digit@[0-9]+$":
+        type: object
+        properties:
+          reg:
+            description: Digit position identifier
+            maxItems: 1
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
+        required:
+          - reg
+          - segments
+        unevaluatedProperties: false
+
+    additionalProperties: false
+
+  leds:
+    type: object
+    description: Container for individual LED icon definitions
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
+        properties:
+          reg:
+            description:
+              Grid and segment indices as <grid segment> of this individual LED icon
+        required:
+          - reg
+        unevaluatedProperties: false
+
+    additionalProperties: false
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
+      display-controller@24 {
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
+      display-controller@0 {
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
+      display-controller@0 {
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
-- 
2.43.0


