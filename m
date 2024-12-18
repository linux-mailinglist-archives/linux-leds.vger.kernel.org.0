Return-Path: <linux-leds+bounces-3660-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BE6D99F6D1A
	for <lists+linux-leds@lfdr.de>; Wed, 18 Dec 2024 19:21:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ED2721895DD9
	for <lists+linux-leds@lfdr.de>; Wed, 18 Dec 2024 18:21:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4ABE1FAC4D;
	Wed, 18 Dec 2024 18:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=remote-tech-co-uk.20230601.gappssmtp.com header.i=@remote-tech-co-uk.20230601.gappssmtp.com header.b="CVyvjKFZ"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88F3E1FC0EF
	for <linux-leds@vger.kernel.org>; Wed, 18 Dec 2024 18:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734546019; cv=none; b=Ff/je/bSpe9mevvSAHjB5yy9ILyuH5Dmdftz8xiyqPwKi/JMpqhjQ/RHCc6a3JTLqETt3JVBqq9d3aSL0/ic/z+f8XMLoej+X1ihvl+kS9p5XJ5ZNbQkaiKagfJT6eEzn1nOURRYm/5FfN0V6AiM7gROhdvMLX3uPNHKJiGaazs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734546019; c=relaxed/simple;
	bh=+A6+s66LjKOEISFmiH3UzxHaJ3ydgiODVCNvmcUtVWg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SMCBCCkLCAHBh80yIthVUbhda7/2g4bsgDp7facS1jXjQbB9aNwAp+5w2/TEaQWNDng1Rq7OPFIXL4LEtBS/OzAurjxxGrE4gb2lM84iKAiIIrhfT35G/fUVwtoXYuDNzm5Xj+mMzXAN/Jr08dOl44WPGY2ab3Noe2eWEyZ/XiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=remote-tech.co.uk; spf=pass smtp.mailfrom=remote-tech.co.uk; dkim=pass (2048-bit key) header.d=remote-tech-co-uk.20230601.gappssmtp.com header.i=@remote-tech-co-uk.20230601.gappssmtp.com header.b=CVyvjKFZ; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=remote-tech.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=remote-tech.co.uk
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-aa689a37dd4so1289174366b.3
        for <linux-leds@vger.kernel.org>; Wed, 18 Dec 2024 10:20:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=remote-tech-co-uk.20230601.gappssmtp.com; s=20230601; t=1734546015; x=1735150815; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V6InofCGGPfJvamdN7P/ZHJUTNfj1oFLPk/qKVvBUNk=;
        b=CVyvjKFZRpyKp30voQqq9LlRuR0VbkHok9k/mAUyMnOryXZPzyUW92+wccOI7NZIOn
         9Ld45JiDGUsuEryjsJYrx3JrpFFHl2qdC661j59eX6NI9OBXignjMCbMU4tLfLoQD72Y
         UvAf1+Vx4SBUw0EQExU6gBnilNZfo+xhb6ma8vvAZEjXy+tFpKHTQEZiRxqqgZ2yWb+O
         w1gFHde8BA9eIC/c9s4rCY7aG9uyyz2neWsy+iyUAItYhikrgp2AHXoP5zBqnUNI6HXo
         FtAowKlTMwZ2cotbYKnfchyU6gAHc23n17rvaOb79jLDn+i+va9VKV5UmufTNB2YtpeV
         Nq1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734546015; x=1735150815;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V6InofCGGPfJvamdN7P/ZHJUTNfj1oFLPk/qKVvBUNk=;
        b=nnmdUf3rr+iNaDdeF+KZsK1XMRn8FyLoXYD+a2S/zaw0CBvvbXtwlANn401sG+cxHn
         LCERPnnud6GwaWTXad/tPXlJYhgmt7uYB5djYG5Q+QRO4bXzbHfjp+vtvuoQ9OZ/EkuV
         D1gd5r1NJyB2tEhsiyyfyQ4MIXJJ5eji3KknuzgKyZ5HXIHyf8c7HRVrvwPBl0pycn28
         Uu94DxzpXKpozgRAkUR7qKm8N3f3bRWAGZrz99cHXz988+Jlc8OJx96tiPMMkEqPX+or
         ISW04rPcP6thhZ+nnBwYGcn3prbSudZhkWNvAQcXxqeF7+EBYpW/IPHry8FzNA26Z8ze
         n51g==
X-Forwarded-Encrypted: i=1; AJvYcCUy7Szt6W8aWt2zsnKutQQu06E65mtHxDj3zjZIOMQYNSNi/MATeBRTiisfl2FFY1+0JJMhroDL9tbM@vger.kernel.org
X-Gm-Message-State: AOJu0YyhyRCNJg8plcNEWKeVrWQJcphd905BQqlEWow18XEYKmCzywbk
	I0yw23A5RF7v2dLBQ1bdmjHNGkMftHzRbDyc6YF7GKmxc3fKCXciQlp55POANAlbtxRJR4TLb1E
	f0yRvMTubsKcw9Du61Qeg+4DaQcY3h2sRSM/2o8BQGo40mgXMOmXwSwsoXTpxhE7aDOI6/gMuQW
	fnDNH4affUCPUn/ifDEmmZ6MtY
X-Gm-Gg: ASbGncuNiT9SJRjZoj2jkWlTSCXhaS4dkiz2414336i4PhoL93+DLK01d7oLz6AsM40
	hX627sSckinp0/BQqm5YaNJH8L/fXfqs/NH2GNrpROC4XyFQb471ne6G0AWK2lsiUiIkqXvnwUW
	nqKQjNh9i67Y1QH95626PT8N2lNZNYdo/CwiuGsxSOvixYtp6ICAwjZno2lcZR2MIFUDgvmcNaK
	7EWD+M7L8b/wL2zDA4Ec1rWFWch49QJ4WBTGlj4hqf4W69mtDUmH/5hW+UP3t3oFxaIWfrgRw+p
	NjxnLsuz1FoylrauZ7mdOmouTjGIwiuY
X-Google-Smtp-Source: AGHT+IGC33UPzFkjqqTdfe9mJzS0AIOGuRfgJF2o1SS4QqUEVX6cCiTXFhdt23FgVBqzyUHbbbkklg==
X-Received: by 2002:a17:907:60cf:b0:aab:c6a5:7c71 with SMTP id a640c23a62f3a-aac07900e07mr36642066b.14.1734546014914;
        Wed, 18 Dec 2024 10:20:14 -0800 (PST)
Received: from localhost.localdomain ([178.27.36.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aab96359fdfsm584825066b.93.2024.12.18.10.20.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 10:20:13 -0800 (PST)
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
Subject: [PATCH v10 2/3] dt-bindings: leds: Add LED1202 LED Controller
Date: Wed, 18 Dec 2024 18:19:54 +0000
Message-Id: <20241218182001.41476-3-vicentiu.galanopulo@remote-tech.co.uk>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241218182001.41476-1-vicentiu.galanopulo@remote-tech.co.uk>
References: <20241218182001.41476-1-vicentiu.galanopulo@remote-tech.co.uk>
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


