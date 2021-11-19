Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F415C4569C8
	for <lists+linux-leds@lfdr.de>; Fri, 19 Nov 2021 06:40:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232519AbhKSFnt (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 19 Nov 2021 00:43:49 -0500
Received: from wnew1-smtp.messagingengine.com ([64.147.123.26]:39047 "EHLO
        wnew1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229457AbhKSFns (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Fri, 19 Nov 2021 00:43:48 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailnew.west.internal (Postfix) with ESMTP id AD3642B01147;
        Fri, 19 Nov 2021 00:40:46 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Fri, 19 Nov 2021 00:40:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=fm1; bh=N5AF1nNgxB7c/q6LGCSBRDOkBc
        8NQJ3dCBZhWBqbvS0=; b=NmNpXrOLq7O/aJcQ3Nc+InooBNqEQ461A3tHTBr8wo
        NlKWM7aCrVIkL/U/AHlwvSAIg7QaBWd7qQ1odqWbjjsIAjgOZESceVqP2gAq2bjP
        awo/vjfcii21hbLVMg1WEVuTvPm8lnk7gXgVs93dCLRWf7/ttNtxzpMTMElZtlzy
        Xrkkz7JoXb3POFJni51kVLu5Ze2lJwCHAMGrESZ5zdcTjfdGTC/9f8MDdc9ShIsM
        Oo+Fd5QKGMVyN7GZcVgNrWx8NnD5U0EhfY4n90Uv5Cjn/Et6s77UK1VlYDyUJ1J2
        on5qHEER0ozPTogxXXvMrNRn77VrU7BtmHEVVrbvguWw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=N5AF1nNgxB7c/q6LG
        CSBRDOkBc8NQJ3dCBZhWBqbvS0=; b=b1a0w9H3xbO8z2ddTWS0f1oSfbEC7wEeo
        HhrzkRpfLnRxOZMg1ki8MC9v5/rTZkOUM9NtgEDhAs+BRd8E2kh2fWNb7g5xoUXS
        Ep3GEpRPdHDYgoHRn4si7fXRd2fop1BhLxUSQTsEooOucCl1wrM+Jdy5KIDPSXv0
        IcufrZGfs+c0zKaw7Hp+iQAqMghb/KpyYINFY4CiQiDTEX4PSacBeQU7jY8MIJ4a
        Dw/jlRSPpv85yAsxmrioINMp13IMLGv1SmynHuwaKxS5nfXiIEbfX4AGjWiloM7W
        7N6KNvnIwNrmKLw4KfYEJyafUP7al04sF1W4ma47ntjtvUJAtQrrA==
X-ME-Sender: <xms:3TiXYW9O4eE3rN3-uuIPS07Mol8qKwntpy9bufqoTrtzhmMcoAt3cg>
    <xme:3TiXYWs7sHEtsZuCnOwpL442Z8phaT_0d9nUGod0YdXzjiXHGLBn94FanW_1iTQvr
    buef3ciy3Zr8R3ePQ>
X-ME-Received: <xmr:3TiXYcDGb0Uh0G2-bz7lMyiVYV5PgTwOSNfwl4tTPjfNdJwSaNbwucjpyV_3t35fhMX9dIidzsEN4Vk6hhIdwOQUdbAjyy24zJnuulsMb23n36NEWFO3GMjbLrF2CouRmA8EUw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrfeejgdekgecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvffufffkofgggfestdekredtredttdenucfhrhhomhepufgrmhhuvghlucfj
    ohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecuggftrfgrth
    htvghrnhepgefftddvvefgleejudevfefgfeffjefhtdduiedujeeuhedtleeggfejueff
    udeunecuffhomhgrihhnpeguvghvihgtvghtrhgvvgdrohhrghenucevlhhushhtvghruf
    hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehsrghmuhgvlhesshhhohhllhgr
    nhgurdhorhhg
X-ME-Proxy: <xmx:3TiXYeeLC_tHc2D62VSHQR4yS2a-UUX4-u-ylh0p4c0tdSyqhD64Jw>
    <xmx:3TiXYbPf08rS06KJOxGT9bu05SsghS4M21ZerfW6A5LQGu1QZsn3xQ>
    <xmx:3TiXYYmtG6vOvradfSFFJzZu7x0c8T4DLmdncioqQbi0O4r1CYgcww>
    <xmx:3jiXYWp0x_bHrvn9eYMbjs8jqPvyWCPL1FHq3mjeqTdT73a39nmZUMlfNEk>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 19 Nov 2021 00:40:45 -0500 (EST)
From:   Samuel Holland <samuel@sholland.org>
To:     Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org
Cc:     Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Samuel Holland <samuel@sholland.org>
Subject: [PATCH v3 1/2] dt-bindings: leds: Add Allwinner R329/D1 LED controller
Date:   Thu, 18 Nov 2021 23:40:42 -0600
Message-Id: <20211119054044.16286-1-samuel@sholland.org>
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

Changes in v3:
 - Removed quotes from enumeration values
 - Added vendor prefix to timing/format properties
 - Renamed "format" property to "pixel-format" for clarity
 - Dropped "vled-supply" as it is unrelated to the controller hardware

Changes in v2:
 - Fixed typo leading to duplicate t1h-ns property
 - Removed "items" layer in definition of dmas/dma-names
 - Replaced uint32 type reference with maxItems in timing properties

 .../leds/allwinner,sun50i-r329-ledc.yaml      | 137 ++++++++++++++++++
 1 file changed, 137 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/allwinner,sun50i-r329-ledc.yaml

diff --git a/Documentation/devicetree/bindings/leds/allwinner,sun50i-r329-ledc.yaml b/Documentation/devicetree/bindings/leds/allwinner,sun50i-r329-ledc.yaml
new file mode 100644
index 000000000000..f8ec5fc6e0ba
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/allwinner,sun50i-r329-ledc.yaml
@@ -0,0 +1,137 @@
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
+  allwinner,pixel-format:
+    description: Pixel format (subpixel transmission order), default is "grb"
+    enum:
+      - bgr
+      - brg
+      - gbr
+      - grb
+      - rbg
+      - rgb
+
+  allwinner,t0h-ns:
+    maxItems: 1
+    description: Length of high pulse when transmitting a "0" bit
+
+  allwinner,t0l-ns:
+    maxItems: 1
+    description: Length of low pulse when transmitting a "0" bit
+
+  allwinner,t1h-ns:
+    maxItems: 1
+    description: Length of high pulse when transmitting a "1" bit
+
+  allwinner,t1l-ns:
+    maxItems: 1
+    description: Length of low pulse when transmitting a "1" bit
+
+  allwinner,treset-ns:
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

