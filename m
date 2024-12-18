Return-Path: <linux-leds+bounces-3665-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 92FD99F6D6B
	for <lists+linux-leds@lfdr.de>; Wed, 18 Dec 2024 19:34:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F0279188CD70
	for <lists+linux-leds@lfdr.de>; Wed, 18 Dec 2024 18:34:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9AEA1FC0E6;
	Wed, 18 Dec 2024 18:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=remote-tech-co-uk.20230601.gappssmtp.com header.i=@remote-tech-co-uk.20230601.gappssmtp.com header.b="jZkLrQS4"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B07C81FBEAA
	for <linux-leds@vger.kernel.org>; Wed, 18 Dec 2024 18:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734546855; cv=none; b=iOLZnijSUam11KMDIUI8/34TS2fqPaeH0Ig14MF75PdKgSKrH3YIpCv0aLTXD8o2sqqYSj6Kw/YMaArhD7helI30VzcwGjgYxHjKQ8jC6Pp4ucqplscDQnnmmd9TWB96OzYaFzrlW9/prwCPL+IQ9fQckvFo7iuyL4LEQw00Hes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734546855; c=relaxed/simple;
	bh=7rngWZ9wiuEDCfmWqP6grwXXvwbRzum8pl+1rdwIHf0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YtzySiJ+isidnWZs9fyt3GQ66Uenz/8oaNA+4OtADyKEeIMReJRKYbuj9HYeOsK0M52UUZ1/ONa7P3rypinbS6AlNknmSrc3tmI4TGHljzM1F1pRzwr1hEj2H61n41p7HZQzf9+1K8AWaYQ7/igWbFDZqO4L48qDFrqG72n1PMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=remote-tech.co.uk; spf=pass smtp.mailfrom=remote-tech.co.uk; dkim=pass (2048-bit key) header.d=remote-tech-co-uk.20230601.gappssmtp.com header.i=@remote-tech-co-uk.20230601.gappssmtp.com header.b=jZkLrQS4; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=remote-tech.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=remote-tech.co.uk
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-aa6a92f863cso88551866b.1
        for <linux-leds@vger.kernel.org>; Wed, 18 Dec 2024 10:34:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=remote-tech-co-uk.20230601.gappssmtp.com; s=20230601; t=1734546852; x=1735151652; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SJ5HY36/J0ui11Dg7uaZuRRufGAN1US5gvTMU1EzA00=;
        b=jZkLrQS4PWZEgTP4ioQEU41ss7frw50ZHnu6NnvSR9kptFSuLcYG4INvHml8aTY02w
         RIbIslJRQQ35/CNi7LPULBBRQfugsp/pecAFfvc/n0vyvwVGC1Ce33mRuEC8Nv0K+TKi
         Z9ZQ2EpGOy/XPl0WzSd3olf6z11/xNdb80lOcns3fXf74EviEOJhqO3svWygIboUkqGf
         is7LwgGdpT0ttDorBFXHvdjLzOr+0PicQTlx2lYl6p9xvDh1zYUmTPgn1IZXmkyA3dnd
         Cpw3GVPkBstOrJkddr1X1ffwPXzp8cGmN533Zs6v1rPEYRD1XOHv8d33lXQ7cfILwQMU
         fSLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734546852; x=1735151652;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SJ5HY36/J0ui11Dg7uaZuRRufGAN1US5gvTMU1EzA00=;
        b=KKyb+2OvV6IPvJtWGy/YWtDUSgIuJfeaG+uwAL9YOfH5x1pLqcPQ6g1V8tR3ZvWD+D
         MPrsCRsPMnnptniLvV4LwPokwjCObJS017qTpDbpaDrUG56dtxBo0I3u6Q/gWedb96Vr
         WzsGUO5841KTXKSCmZDhLu/XFtZWR/NDXf+uVhIiuf+5NXCSKQhKDs3huog7uj1vMS+Q
         PF2vl1q6Tql/HfDVSyKFJE4C7bEVDYteqIOF53j3lOT7KOlPdZhtr7dW5Pd/zuarArcg
         qSdbhpJGqfFRoekG41DjPBTKQTJI1Nhs5MM+VpR065DhOTpgFhMGsAF8apQLaw+cwVS/
         L0qw==
X-Forwarded-Encrypted: i=1; AJvYcCUzCQnaEKth+ZN1dUuxhaScIdUNzUjpkby3Rpi3N0wglILFxhf27Ka0PHJP+KLaTln+3m4QYy4VnWgC@vger.kernel.org
X-Gm-Message-State: AOJu0Yyc1T3qWV8hvtOSAezJpvXA2x1H6xGgsFvM6d/blEY5V7Dxte07
	ouHP6tCxr1bWWWX/M+BljK0DbOY02g1TdSnp5Lq/sskE57/ZS3y4G27x1sMyQMNn1ZjuXO4fCBg
	epFV/7x+1MEQV/Kg8HILxqYlxE8u3FwCuf1ix2vDZn5o6Q1Rv2NXW8EnNJpPpr5p83dkAj+t1Ip
	xrncy9ci4DtERmePRGP6o3mHuR
X-Gm-Gg: ASbGncuX8+FKN5LDHiFSnpmMGWLHKtIyhJASk2dHHZtLiTovwtnCIt9cIsbh6TfgZKk
	8wMFYlzAXWuyO1eueIMbwQ/l2qUGHdmtXmdkPj4RbwmBcbJIs2+JfcVg7235u6ibadLLp0Ljugu
	0X94afQvD1kArp+kKklv1nB5my71aLhUpY3bJ7gs25VcyMPq190rQznVI6dodGAVK/rDF4q8bOx
	+GHdvkstuqHfAKn2ehejSVoiBtkqqgccB5iT4mnnMzCj+s+ne7lPkR+lIRFrjJJbwFHybbYPIeg
	Dym8jizHrUoUJcvObroKTKHu2a5A/ZzdjPks1WCqf9Caixk4CX/3gE/TQ5dHuIbgXyM/GKMS575
	w
X-Google-Smtp-Source: AGHT+IGCDn2MMew2mm6iT8vUhiznPmGDCq2Me/lyKwaCwBQSuyo6CyoKnToSJXEdjSDkLzDOIZQhtA==
X-Received: by 2002:a17:907:3f89:b0:aab:c35e:509b with SMTP id a640c23a62f3a-aac07afaf01mr41007666b.55.1734546852036;
        Wed, 18 Dec 2024 10:34:12 -0800 (PST)
Received: from localhost.localdomain (ipb21b247d.dynamic.kabel-deutschland.de. [178.27.36.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aab9638ec53sm583873366b.156.2024.12.18.10.34.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 10:34:11 -0800 (PST)
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v11 2/3] dt-bindings: leds: Add LED1202 LED Controller
Date: Wed, 18 Dec 2024 18:33:58 +0000
Message-Id: <20241218183401.41687-3-vicentiu.galanopulo@remote-tech.co.uk>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241218183401.41687-1-vicentiu.galanopulo@remote-tech.co.uk>
References: <20241218183401.41687-1-vicentiu.galanopulo@remote-tech.co.uk>
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

Signed-off-by: Vicentiu Galanopulo <vicentiu.galanopulo@remote-tech.co.uk>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
    v1: https://lore.kernel.org/lkml/ZnCnnQfwuRueCIQ0@admins-Air/T/
    v2: https://lore.kernel.org/all/ZniNdGgKyUMV-hjq@admins-Air/T/
    v3: https://lore.kernel.org/all/ZniNdGgKyUMV-hjq@admins-Air/T/
    
    Changes in v4:
      - remove label property, use devm_led_classdev_register_ext instead
    Changes in v3:
      - remove active property
    Changes in v2:
      - renamed label to remove color from it
      - add color property for each node
      - add function and function-enumerator property for each node

 .../devicetree/bindings/leds/st,led1202.yaml  | 132 ++++++++++++++++++
 1 file changed, 132 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/st,led1202.yaml

diff --git a/Documentation/devicetree/bindings/leds/st,led1202.yaml b/Documentation/devicetree/bindings/leds/st,led1202.yaml
new file mode 100644
index 000000000000..f1e5e4efaa3a
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
2.39.3 (Apple Git-145)


