Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B7463FF7FD
	for <lists+linux-leds@lfdr.de>; Fri,  3 Sep 2021 01:42:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346850AbhIBXnb (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 2 Sep 2021 19:43:31 -0400
Received: from wnew1-smtp.messagingengine.com ([64.147.123.26]:60003 "EHLO
        wnew1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1346276AbhIBXna (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 2 Sep 2021 19:43:30 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailnew.west.internal (Postfix) with ESMTP id E683C2B006E9;
        Thu,  2 Sep 2021 19:42:30 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Thu, 02 Sep 2021 19:42:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=fm3; bh=fqnnQ1mT7IKeUBNRXAaLi2gjg5
        OvGtbLCaioyw+wFps=; b=coycE8AWLtqpoIJAbk5IFV5eTJ1CgPhT2DlDYzlGOn
        5RirMUKBDb7+x1APv778s2mpChS2AUGMTsF1BeZGfWDl6rIC373KyNv2v4/6HOWv
        IbDs1B30/kPpM2h7FXQh54yeV8HYwt/KBuHFV1DUKcci80m2yKEGqBtngv5fyt+Q
        D5EGnWWkqsI4B5k/qMS0WGbj7ZclD0ol2qwlsq71+Pmj3906C8Ik3l0E5qBIWLEX
        9hNrezQ6Ry/OKiJhgFBLZU20oze//MMzd5BkGMWe2Ocw7NtXRdkZJsMOOlX5eSHu
        8/iUndzziDnJTlsbJ7RA8jgnO6lpq6/Jq7IMUPfhEpGA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=fqnnQ1mT7IKeUBNRX
        AaLi2gjg5OvGtbLCaioyw+wFps=; b=TVQz/P3X9YN1RzDFFUAfwkQbC8AVexJzZ
        EAji+q5+lHhZeqqfoBME7fD7uYxR0IgN9aJay7bTnaS4t8GlrhDJSXYjZC3krUkA
        grhcP8SdL8ZCeLlJyuAjL0hO8laFux3jW0FuFes9kq2shaFRxJWGVHN/Fu01vf6X
        NgHCPz4pElWQRYgf6iA+7ha1IwJeAKg1lz1SD74W0EKQNa4Sq4eKIU5LuPRLQLLG
        y9ngUPP0OXdHKbzfaL0reXrfsNoamFWocxYivYDNu/k7dRI+Lqwpu2cwEVfJzyLI
        MpSqa6DzIa2v61Igg+ryUxnkEYsICy8mlU1/411M5w5kk0xBxnHqg==
X-ME-Sender: <xms:ZWExYSrtzL1awoKw2ZH47OCm-0F8C4GtzdWHkFV-soEPZa42dezG4w>
    <xme:ZWExYQrTAkSIDTff9MTK-YKcYyesgN9BWjSQrjyFazg6EV79m9d07I3K9cQyvO57f
    9RY83mJB4W4SowsIA>
X-ME-Received: <xmr:ZWExYXMvZ6-SjdSgiS0-WVuGbZSFR2eorgJ33YTG1N8OdtTa0olu6-Rfvs1AWUS_9rknikr1or-saVKuuYLM_0OsKRnk8AJ2NECx9jDMWXnh4YOiaqixY6vGH0m_zu3BWhWjpw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddruddviedgvdeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefurghmuhgvlhcu
    jfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucggtffrrg
    htthgvrhhnpeegffdtvdevgfeljeduveefgfefffejhfdtudeiudejueehtdelgefgjeeu
    ffduueenucffohhmrghinhepuggvvhhitggvthhrvggvrdhorhhgnecuvehluhhsthgvrh
    fuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepshgrmhhuvghlsehshhholhhl
    rghnugdrohhrgh
X-ME-Proxy: <xmx:ZWExYR7ydyCRgabIscZCGzyfxm9iU4wE5IW_5YnU0AMZhTawcWmrow>
    <xmx:ZWExYR7PhAoR4Ppth8FSy1AizcKKBdxeJrH4Ev7bn35ediU272AFXA>
    <xmx:ZWExYRjAL0E5WLgD26TorOUG8K0qioJld8T7AaTC8-BykE2BxzqIbg>
    <xmx:ZmExYWHWBUGKATd21fG-4X6PMI_aXZv2C8GJmaDDpO8WsTmjLzc4w62BZqQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 2 Sep 2021 19:42:29 -0400 (EDT)
From:   Samuel Holland <samuel@sholland.org>
To:     Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>
Cc:     Icenowy Zheng <icenowy@aosc.io>, devicetree@vger.kernel.org,
        linux-leds@vger.kernel.org, linux-sunxi@lists.linux.dev,
        linux-kernel@vger.kernel.org, Samuel Holland <samuel@sholland.org>
Subject: [PATCH 1/2] dt-bindings: leds: Add Allwinner R329/D1 LED controller
Date:   Thu,  2 Sep 2021 18:42:27 -0500
Message-Id: <20210902234228.32223-1-samuel@sholland.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

The Allwinner R329 and D1 SoCs contain an LED controller designed to
drive a series of RGB LED pixels. It supports PIO and DMA transfers, and
has configurable timing and pixel format.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---
 .../leds/allwinner,sun50i-r329-ledc.yaml      | 141 ++++++++++++++++++
 1 file changed, 141 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/allwinner,sun50i-r329-ledc.yaml

diff --git a/Documentation/devicetree/bindings/leds/allwinner,sun50i-r329-ledc.yaml b/Documentation/devicetree/bindings/leds/allwinner,sun50i-r329-ledc.yaml
new file mode 100644
index 000000000000..bf883944e911
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/allwinner,sun50i-r329-ledc.yaml
@@ -0,0 +1,141 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/allwinner,sun50i-r329-ledc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Allwinner sunxi LED Controller Bindings
+
+maintainers:
+  - Samuel Holland <samuel@sholland.org>
+
+description:
+  The LED controller found in Allwinner sunxi SoCs uses a one-wire serial
+  interface to drive up to 1024 RGB LEDs.
+
+properties:
+  compatible:
+    oneOf:
+      - const: allwinner,sun50i-r329-ledc
+      - items:
+          - enum:
+              - allwinner,sun20i-d1-ledc
+          - const: allwinner,sun50i-r329-ledc
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
+  clocks:
+    items:
+      - description: Bus clock
+      - description: Module clock
+
+  clock-names:
+    items:
+      - const: bus
+      - const: mod
+
+  resets:
+    maxItems: 1
+
+  dmas:
+    items:
+      - description: TX DMA channel
+
+  dma-names:
+    items:
+      - const: tx
+
+  interrupts:
+    maxItems: 1
+
+  vled-supply:
+    description: Regulator supplying power to external LEDs
+
+  format:
+    description: Pixel format (subpixel transmission order), default is "grb"
+    enum:
+      - "bgr"
+      - "brg"
+      - "gbr"
+      - "grb"
+      - "rbg"
+      - "rgb"
+
+  t0h-ns:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Length of high pulse when transmitting a "0" bit
+
+  t0l-ns:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Length of low pulse when transmitting a "0" bit
+
+  t1h-ns:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Length of high pulse when transmitting a "1" bit
+
+  t1h-ns:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Length of low pulse when transmitting a "1" bit
+
+  treset-ns:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Minimum delay between transmission frames
+
+patternProperties:
+  "^multi-led@[0-9a-f]+$":
+    type: object
+    $ref: leds-class-multicolor.yaml#
+    properties:
+      reg:
+        minimum: 0
+        maximum: 1023
+        description: Index of the LED in the series (must be contiguous)
+
+    required:
+      - reg
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - resets
+  - dmas
+  - dma-names
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/leds/common.h>
+
+    ledc: led-controller@2008000 {
+      compatible = "allwinner,sun20i-d1-ledc",
+                   "allwinner,sun50i-r329-ledc";
+      reg = <0x2008000 0x400>;
+      #address-cells = <1>;
+      #size-cells = <0>;
+      clocks = <&ccu 12>, <&ccu 34>;
+      clock-names = "bus", "mod";
+      resets = <&ccu 12>;
+      dmas = <&dma 42>;
+      dma-names = "tx";
+      interrupts = <36 IRQ_TYPE_LEVEL_HIGH>;
+
+      multi-led@0 {
+        reg = <0x0>;
+        color = <LED_COLOR_ID_RGB>;
+        function = LED_FUNCTION_INDICATOR;
+      };
+    };
+
+...
-- 
2.31.1

