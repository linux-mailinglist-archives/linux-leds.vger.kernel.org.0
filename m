Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36EFA4204EA
	for <lists+linux-leds@lfdr.de>; Mon,  4 Oct 2021 04:26:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232255AbhJDC1w (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 3 Oct 2021 22:27:52 -0400
Received: from wnew4-smtp.messagingengine.com ([64.147.123.18]:55183 "EHLO
        wnew4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232250AbhJDC1v (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 3 Oct 2021 22:27:51 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailnew.west.internal (Postfix) with ESMTP id DB2372B01324;
        Sun,  3 Oct 2021 22:26:02 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Sun, 03 Oct 2021 22:26:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=fm3; bh=P8qLSV2GqDj3YgUO4voN7NGbNN
        WZHdeebQQ0qJmOTLc=; b=S2rmlSxkBEum+u5YcAVpfs381l/XKeGvPuzGuviRkP
        fchYpYn3YnrRdJRW0qLXBIQLAWCMplSvw11O4sPRKDLq2B5Dhy2wYsregIWVDdIs
        0QjHh2B/RpReomcWWxokMv0USMU7m3KqXZk/ffi2Qp0CGtH8gRP0yWfusrMvwy1T
        t8io3BpFthgxyN8JyAMVlHrmacMO1Z4oQOs6c+7P1+WsB5ovXHemurDEfaQa48rb
        NPN+9BAWeGJ238VzBl2DDG7O5dTFTd1F056Ba90vMCOv0j9JRgw5Ywdj83ac3ZTF
        Fzz0u62izp8hWhCWWnAwaUPk4YzQkTqc42W7EbN2/ThQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=P8qLSV2GqDj3YgUO4
        voN7NGbNNWZHdeebQQ0qJmOTLc=; b=oKOfFF3Ma/VCMkXqyr1IuroQ+g0C3tNkP
        vBku8GUUv31ZuUEEDS8nQ6X1IsOAWfFt7JgP+bHrdjyHLs2NiMv9LYhP1Ap/kpQm
        DBXdxWBh0IuKvrU2voyL3ceZTyoqRdvZSnf+I93h9pYcDyWmHWBhwOPVjmKxDFr2
        hs2jVzF+Dok8pAgBUqwcqPNbFPRrNkfKFTnT2sotjN5lpyq5T+jnhEBa71saSVQg
        oyg6wXTs2sXHM6X84/2/cRyjpSxGOzgD0NmW+jYE4NCKVuY9fgGDO66yhGOhCUSR
        g1kkqZJ+LqEf/S9B5ty/+WW9TLcDGKuhmcig6mdid+NH/jxybgeuQ==
X-ME-Sender: <xms:OmZaYdyhI8xKhMMhC54xv77p230TlRTdJpsTvEfV7SyJi_jlgZrfTQ>
    <xme:OmZaYdSuXTUOtRAZXO0A799EVTviR0bVVB1JU1kTxLlYx4GHYakJi2StACvJiuSvx
    8CoNrIaeG_LsP3u1A>
X-ME-Received: <xmr:OmZaYXVAxt75JccfkpDneMN5BgLVagtHbcUhFGoXJvnVm6E5sPPlkFe8vFXVwCP3tegoerFKABdHRSRi2oTcXHxzWJJi4B7jtrwEwqa0UCd7tYd2XWwcKAaeT8e85j8q0IbBKA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudeluddgheejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefurghmuhgvlhcu
    jfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucggtffrrg
    htthgvrhhnpeegffdtvdevgfeljeduveefgfefffejhfdtudeiudejueehtdelgefgjeeu
    ffduueenucffohhmrghinhepuggvvhhitggvthhrvggvrdhorhhgnecuvehluhhsthgvrh
    fuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepshgrmhhuvghlsehshhholhhl
    rghnugdrohhrgh
X-ME-Proxy: <xmx:OmZaYfj7ER-PxuXqLw4TZC6-7Tq5f8lPiLmtIdDhYIUO0VbRtWUcoQ>
    <xmx:OmZaYfDc7Pdsnr653yuNMc-ER0io54kRN0jOMdvqOjgKXXmzgQz18w>
    <xmx:OmZaYYJOgKzrrOtDAjZiUNxG_plTpuHAQcvpJvxBn3Y5_CxbZApZKQ>
    <xmx:OmZaYbsK_lC9qj3HN4CkuX5E5rKn_gCw34svr4iQEwOFFzdOcG_SGgs9v3s>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 3 Oct 2021 22:26:01 -0400 (EDT)
From:   Samuel Holland <samuel@sholland.org>
To:     Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>
Cc:     Icenowy Zheng <icenowy@aosc.io>, devicetree@vger.kernel.org,
        linux-leds@vger.kernel.org, linux-sunxi@lists.linux.dev,
        linux-kernel@vger.kernel.org, Samuel Holland <samuel@sholland.org>
Subject: [PATCH v2 1/2] dt-bindings: leds: Add Allwinner R329/D1 LED controller
Date:   Sun,  3 Oct 2021 21:26:00 -0500
Message-Id: <20211004022601.10653-1-samuel@sholland.org>
X-Mailer: git-send-email 2.32.0
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

Changes from v1:
 - Fixed typo leading to duplicate t1h-ns property
 - Removed "items" layer in definition of dmas/dma-names
 - Replaced uint32 type reference with maxItems in timing properties

 .../leds/allwinner,sun50i-r329-ledc.yaml      | 140 ++++++++++++++++++
 1 file changed, 140 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/allwinner,sun50i-r329-ledc.yaml

diff --git a/Documentation/devicetree/bindings/leds/allwinner,sun50i-r329-ledc.yaml b/Documentation/devicetree/bindings/leds/allwinner,sun50i-r329-ledc.yaml
new file mode 100644
index 000000000000..d70cb2393a2e
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/allwinner,sun50i-r329-ledc.yaml
@@ -0,0 +1,140 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/allwinner,sun50i-r329-ledc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Allwinner R329 LED Controller Bindings
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
+    maxItems: 1
+    description: TX DMA channel
+
+  dma-names:
+    const: tx
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
+    maxItems: 1
+    description: Length of high pulse when transmitting a "0" bit
+
+  t0l-ns:
+    maxItems: 1
+    description: Length of low pulse when transmitting a "0" bit
+
+  t1h-ns:
+    maxItems: 1
+    description: Length of high pulse when transmitting a "1" bit
+
+  t1l-ns:
+    maxItems: 1
+    description: Length of low pulse when transmitting a "1" bit
+
+  treset-ns:
+    maxItems: 1
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
2.32.0

