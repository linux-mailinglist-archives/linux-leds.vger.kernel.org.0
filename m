Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9876A5A5A37
	for <lists+linux-leds@lfdr.de>; Tue, 30 Aug 2022 05:42:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229881AbiH3DmN (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 29 Aug 2022 23:42:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229889AbiH3DmM (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 29 Aug 2022 23:42:12 -0400
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97EA9A9C18;
        Mon, 29 Aug 2022 20:42:08 -0700 (PDT)
Received: by mail-pf1-x42b.google.com with SMTP id q15so4735416pfn.11;
        Mon, 29 Aug 2022 20:42:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=X4cHOvbmWb+911MO4SmchvUcHWTMXjifX3L1tpUmfy0=;
        b=ZuSkZzXBd8rUftipY1vxAlKtDCmCwp0gx5Vlve62n0mArFzoXp82uhvAEy5fOVUchE
         PT6fM4yOE9mC1Wvg1E5AZR/q9zSyH132YX9IeHyqEcaWnuQHTW4sDlCuI9f9Daaacmit
         61pHdm+ClMCCbEbTk7UE3kXFJiDMkF1yHWzQsnvyeWY3jJ3aFnUBwJ7vzzSGEEj/RoHN
         QZyfkXaNJSrhZmaodBqRL20AplIcHSoDH1gGG8p5hfszVTznXs9oC7LArbvXBs3ehiFu
         bz0DnISpQssJb5vAmwkLhQS2orYk5tHfNAkUzeeM8PDry8rPB0M1+PtmG17VRlpQTLpM
         BAzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=X4cHOvbmWb+911MO4SmchvUcHWTMXjifX3L1tpUmfy0=;
        b=zKHmgAg59cxwxv/lk0u63HNaET5LIgN0t8NTAmhGowlz7OQkB4SoC5rFjmoAdHcKPS
         nN6jZkDjR/z5PHFl4mvnhyEOZ8pSaJ2DmL7Mev8zeqG2to9TPH0lGs+otMMlJWC105IV
         gkD/969PAeyOdarYBqwPZwWV5URMYqbrIKfAeyqSTsw3Hh8mFFzZMVzsEbGNzxlXFhE7
         qHDrjZaZzmclJNZwiO9tfbzzEOW5OCR2HtvAFwlkeaLbJs7nOxiB6aBHSkpQDY7w3JQq
         uR7iY2fnAonWrQa6xGqRn9f/kjS2Kxs48asiXj4ZMDRwJm05FZKpFWSAGUM3sRmbAqyK
         ewxw==
X-Gm-Message-State: ACgBeo14i2d6F/O3fXjSf9D8pr2rUDat9+VnatPRQtBBKDK9ogFt92Rd
        2s1vg3vdCO/ax/1uQHxAlbk=
X-Google-Smtp-Source: AA6agR5yfXHKV/ZMVsIC7f+ZHuhHVj+B8JofiTynrl5gxm/iZ0On3nsZl4Idx5tsMgA3Bez9c1pOJA==
X-Received: by 2002:a05:6a00:1ac7:b0:52f:4e43:5ace with SMTP id f7-20020a056a001ac700b0052f4e435acemr19591897pfv.59.1661830927793;
        Mon, 29 Aug 2022 20:42:07 -0700 (PDT)
Received: from RD-3580-24288.rt.l (42-77-88-242.emome-ip.hinet.net. [42.77.88.242])
        by smtp.gmail.com with ESMTPSA id a6-20020a170902ecc600b0016ed5266a5csm8439577plh.170.2022.08.29.20.42.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Aug 2022 20:42:07 -0700 (PDT)
From:   ChiaEn Wu <peterwu.pub@gmail.com>
To:     lee@kernel.org, daniel.thompson@linaro.org, jingoohan1@gmail.com,
        pavel@ucw.cz, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
        sre@kernel.org, jic23@kernel.org, lars@metafoo.de, deller@gmx.de,
        broonie@kernel.org, mazziesaccount@gmail.com,
        andriy.shevchenko@linux.intel.com
Cc:     chiaen_wu@richtek.com, alice_chen@richtek.com,
        cy_huang@richtek.com, dri-devel@lists.freedesktop.org,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-iio@vger.kernel.org,
        linux-fbdev@vger.kernel.org, szunichen@gmail.com,
        andy.shevchenko@gmail.com, Rob Herring <robh@kernel.org>
Subject: [PATCH v9 04/10] dt-bindings: backlight: Add MediaTek MT6370 backlight
Date:   Tue, 30 Aug 2022 11:40:36 +0800
Message-Id: <20220830034042.9354-5-peterwu.pub@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220830034042.9354-2-peterwu.pub@gmail.com>
References: <20220830034042.9354-2-peterwu.pub@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

From: ChiYuan Huang <cy_huang@richtek.com>

Add MT6370 backlight binding documentation.

Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
Signed-off-by: ChiaEn Wu <chiaen_wu@richtek.com>
---
 .../leds/backlight/mediatek,mt6370-backlight.yaml  | 121 +++++++++++++++++++++
 1 file changed, 121 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/backlight/mediatek,mt6370-backlight.yaml

diff --git a/Documentation/devicetree/bindings/leds/backlight/mediatek,mt6370-backlight.yaml b/Documentation/devicetree/bindings/leds/backlight/mediatek,mt6370-backlight.yaml
new file mode 100644
index 0000000..5533b65
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/backlight/mediatek,mt6370-backlight.yaml
@@ -0,0 +1,121 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/backlight/mediatek,mt6370-backlight.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek MT6370 Backlight
+
+maintainers:
+  - ChiaEn Wu <chiaen_wu@richtek.com>
+
+description: |
+  This module is part of the MT6370 MFD device.
+  The MT6370 Backlight WLED driver supports up to a 29V output voltage for
+  4 channels of 8 series WLEDs. Each channel supports up to 30mA of current
+  capability with 2048 current steps (11 bits, only for MT6370/MT6371) or
+  16384 current steps (14 bits, only for MT6372) in exponential or linear
+  mapping curves.
+
+allOf:
+  - $ref: common.yaml#
+
+properties:
+  compatible:
+    enum:
+      - mediatek,mt6370-backlight
+      - mediatek,mt6372-backlight
+
+  default-brightness:
+    minimum: 0
+
+  max-brightness:
+    minimum: 0
+
+  enable-gpios:
+    description: External backlight 'enable' pin
+    maxItems: 1
+
+  mediatek,bled-pwm-enable:
+    description: |
+      Enable external PWM input for backlight dimming
+    type: boolean
+
+  mediatek,bled-pwm-hys-enable:
+    description: |
+      Enable the backlight input-hysteresis for PWM mode
+    type: boolean
+
+  mediatek,bled-pwm-hys-input-th-steps:
+    $ref: /schemas/types.yaml#/definitions/uint8
+    enum: [1, 4, 16, 64]
+    description: |
+      The selection of the upper and lower bounds threshold of backlight
+      PWM resolution. If we choose selection 64, the variation of PWM
+      resolution needs more than 64 steps.
+
+  mediatek,bled-ovp-shutdown:
+    description: |
+      Enable the backlight shutdown when OVP level triggered
+    type: boolean
+
+  mediatek,bled-ovp-microvolt:
+    enum: [17000000, 21000000, 25000000, 29000000]
+    description: |
+      Backlight OVP level selection.
+
+  mediatek,bled-ocp-shutdown:
+    description: |
+      Enable the backlight shutdown when OCP level triggerred.
+    type: boolean
+
+  mediatek,bled-ocp-microamp:
+    enum: [900000, 1200000, 1500000, 1800000]
+    description: |
+      Backlight OC level selection.
+
+  mediatek,bled-exponential-mode-enable:
+    description: |
+      Enable the exponential mode of backlight brightness. If this property
+      is not enabled, the default is to use linear mode.
+    type: boolean
+
+  mediatek,bled-channel-use:
+    $ref: /schemas/types.yaml#/definitions/uint8
+    description: |
+      Backlight LED channel to be used.
+      Each bit mapping to:
+        - 0: CH4
+        - 1: CH3
+        - 2: CH2
+        - 3: CH1
+    minimum: 1
+    maximum: 15
+
+if:
+  properties:
+    compatible:
+      contains:
+        const: mediatek,mt6372-backlight
+
+then:
+  properties:
+    default-brightness:
+      maximum: 16384
+
+    max-brightness:
+      maximum: 16384
+
+else:
+  properties:
+    default-brightness:
+      maximum: 2048
+
+    max-brightness:
+      maximum: 2048
+
+required:
+  - compatible
+  - mediatek,bled-channel-use
+
+additionalProperties: false
-- 
2.7.4

