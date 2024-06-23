Return-Path: <linux-leds+bounces-2102-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 32A32913E61
	for <lists+linux-leds@lfdr.de>; Sun, 23 Jun 2024 23:04:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DC99A280F26
	for <lists+linux-leds@lfdr.de>; Sun, 23 Jun 2024 21:04:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F12201850A3;
	Sun, 23 Jun 2024 21:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=remote-tech-co-uk.20230601.gappssmtp.com header.i=@remote-tech-co-uk.20230601.gappssmtp.com header.b="EM7LF2Hy"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC0AC185098
	for <linux-leds@vger.kernel.org>; Sun, 23 Jun 2024 21:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719176575; cv=none; b=hu3SrMmX2DIV/KPAOM1J7B25guhbbaBe5U/TURTp9VwFJ8t5TMYUFxRIuFqqJX6JZTPiss2p7GBJLH9ZbVLdW7JK9FHS0IX1HEMH0pHwWKjNgr5Nibc3eeo9thuMCjqt53laO1+QGl3MduX6guCHHuswTJG6Pd0GOu+FihixmAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719176575; c=relaxed/simple;
	bh=GfEULV8xg05kdiKK5i743yh7W6tqQppAzpgm/RtrSIY=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VBPkkhGPtW9JNG4zcR252VqJQr1P5oeqYOXSw6VF+LLeVO6tHmilSnEqvboJ0m3uI0HPartcmtxYZzwMiDm9cczqIE1HKsmGAvAHX2qJHWfw/EH14fHbr+yx4pDzCRKXo/39vah+j7F3Tct7Xj4sgYRrR5VHUXTTFTZIfn9dFmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=remote-tech.co.uk; spf=pass smtp.mailfrom=remote-tech.co.uk; dkim=pass (2048-bit key) header.d=remote-tech-co-uk.20230601.gappssmtp.com header.i=@remote-tech-co-uk.20230601.gappssmtp.com header.b=EM7LF2Hy; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=remote-tech.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=remote-tech.co.uk
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-57d1679ee83so3716302a12.2
        for <linux-leds@vger.kernel.org>; Sun, 23 Jun 2024 14:02:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=remote-tech-co-uk.20230601.gappssmtp.com; s=20230601; t=1719176572; x=1719781372; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=C2Q0gzBX8N6IydgITDvhPFm9H0OdZ97AsakiB5jkxqY=;
        b=EM7LF2HyE0z2QIEvcoWOnWoRAdnzI/dk/0go0RIt2V0bKmxktcRFgkB6tAJVWXr05E
         pUbr0G2rZYSa21RRiFAo90V7WYhHpRqAmFe1+/AtwAPTmDhZQR9dLGy4Z1fr3kr8qLLv
         f9L2t/kAnPDqmoX4J7xXmVUPnBkNgI0S1R+TSSie2KT/erMjaLWq7+AQyHklg0Alaz1M
         r4IaenwBJNjMrU0MO09FfXU4F8EGY/b8gg5GK6XjgCIgkdLjgUrbMPVEmS9ImFnx0j4v
         Ybus96wGNoUWXI/ofuh4KameoK5cAZrtDnmnRNKqo/QlPO4zXLMG0xRko7fZJ+oFujz1
         3HMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719176572; x=1719781372;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C2Q0gzBX8N6IydgITDvhPFm9H0OdZ97AsakiB5jkxqY=;
        b=JvGqjk0Q8jx3cNgvJg373o2IfuRFRdk6VjvrzBoHpm0qJw1X1S+WmS99/XytuDEyjH
         44UkVNh3kQfYl9UQGOf93J183CYmyJk1AOTkSTksZnSjPcGseDdGGQtJcDXO4WQiVjW3
         18+U4IuxTgkA0ZZoRxu2ZSoT31OzJS9qx7S2go/8uMP2ITlsogdHfCxrjenxe4fjr0J1
         Cm28XJ7oztSfjlAo5I9Q5O9fBv7TNx6YY80vPTBfxhCinsb7wZZ+fqIyfSoa8EDkCeon
         m4908DP5odZ8DRN7Qg7vMmwVw1bjjW+596B4pJ0KNoVjNPIRNE0M0tcgYyPp6eNniDNK
         N09Q==
X-Forwarded-Encrypted: i=1; AJvYcCW9mwJSbe71aqMpb+m3nzY1QBwPBoPRWfOMdvY3RoSoVIRpCKPPl05gzv7F/+p+5ANgW9YonYnf5astF0Y6G3uBFirzqca+Pfrd0A==
X-Gm-Message-State: AOJu0YxiHpKOxGnsJjnPeAYYnsa2lj9ErJLsvELbTrd1fg2G8ackb2rx
	PcKVhmymTCfRrm4qAvWHxqw12YuZq4Y8WKQci/BsznDjGTnb56vX92eTFSbMnflYzLgVFB+hzKS
	UYAhtZm6IUfR8vXo45aOBJ3g1I5KFlb4J2xY3pvAfaT09mdZtAYdtR0gfaoxo4f3Q5nmldwhmjb
	fhQqiF5f/ApddOFckAIMFJHO4z
X-Google-Smtp-Source: AGHT+IF6p6PrkBM7MCMqt0fhnpDs3/s2Ek1MKMe2Imaunb9Q4Quj0feu3pVgyqYTcpGn2NnWhpxbeA==
X-Received: by 2002:a17:907:198e:b0:a72:5644:b7d5 with SMTP id a640c23a62f3a-a725644b98dmr26112066b.11.1719176572022;
        Sun, 23 Jun 2024 14:02:52 -0700 (PDT)
Received: from admins-Air ([2a02:810d:aec0:2a54:e986:e9a5:7c6a:4f75])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6fcf560de1sm338881166b.186.2024.06.23.14.02.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Jun 2024 14:02:51 -0700 (PDT)
Date: Sun, 23 Jun 2024 23:02:44 +0200
From: Vicentiu Galanopulo <vicentiu.galanopulo@remote-tech.co.uk>
To: pavel@ucw.cz, lee@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: leds: Add LED1202 LED Controller
Message-ID: <ZniNdGgKyUMV-hjq@admins-Air>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The LED1202 is a 12-channel low quiescent current LED driver with:
  * Supply range from 2.6 V to 5 V
  * 20 mA current capability per channel
  * 1.8 V compatible I2C control interface
  * 8-bit analog dimming individual control
  * 12-bit local PWM resolution
  * 8 programmable patterns

Signed-off-by: Vicentiu Galanopulo <vicentiu.galanopulo@remote-tech.co.uk>
---

Changes in v2:
  - renamed label to remove color from it
  - add color property for each node
  - add function and function-enumerator property for each node

 .../devicetree/bindings/leds/st,led1202.yml   | 162 ++++++++++++++++++
 1 file changed, 162 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/st,led1202.yml

diff --git a/Documentation/devicetree/bindings/leds/st,led1202.yml b/Documentation/devicetree/bindings/leds/st,led1202.yml
new file mode 100644
index 000000000000..1484b09c8eeb
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/st,led1202.yml
@@ -0,0 +1,162 @@
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
+description:
+  The LED1202 is a 12-channel low quiescent current LED controller
+  programmable via I2C; The output current can be adjusted separately
+  for each channel by 8-bit analog and 12-bit digital dimming control.
+
+  Datasheet available at
+  https://www.st.com/en/power-management/led1202.html
+
+properties:
+  compatible:
+    enum:
+      - st,led1202
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
+  "^led@[0-9a-f]+$":
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
+            address-cells = <1>;
+            size-cells = <0>;
+
+            led@0 {
+                reg = <0>;
+                label = "led1";
+                function = LED_FUNCTION_STATUS;
+                color = <LED_COLOR_ID_RED>;
+                function-enumerator = <1>;
+                active = <1>;
+            };
+
+            led@1 {
+                reg = <1>;
+                label = "led2";
+                function = LED_FUNCTION_STATUS;
+                color = <LED_COLOR_ID_GREEN>;
+                function-enumerator = <2>;
+                active = <1>;
+            };
+
+            led@2 {
+                reg = <2>;
+                label = "led3";
+                function = LED_FUNCTION_STATUS;
+                color = <LED_COLOR_ID_BLUE>;
+                function-enumerator = <3>;
+                active = <1>;
+            };
+
+            led@3 {
+                reg = <3>;
+                label = "led4";
+                function = LED_FUNCTION_STATUS;
+                color = <LED_COLOR_ID_RED>;
+                function-enumerator = <4>;
+                active = <1>;
+            };
+
+            led@4 {
+                reg = <4>;
+                label = "led5";
+                function = LED_FUNCTION_STATUS;
+                color = <LED_COLOR_ID_GREEN>;
+                function-enumerator = <5>;
+                active = <1>;
+            };
+
+            led@5 {
+                reg = <5>;
+                label = "led6";
+                function = LED_FUNCTION_STATUS;
+                color = <LED_COLOR_ID_BLUE>;
+                function-enumerator = <6>;
+                active = <1>;
+            };
+
+            led@6 {
+                reg = <6>;
+                label = "led7";
+                function = LED_FUNCTION_STATUS;
+                color = <LED_COLOR_ID_RED>;
+                function-enumerator = <7>;
+                active = <1>;
+            };
+
+            led@7 {
+                reg = <7>;
+                label = "led8";
+                function = LED_FUNCTION_STATUS;
+                color = <LED_COLOR_ID_GREEN>;
+                function-enumerator = <8>;
+                active = <1>;
+            };
+
+            led@8 {
+                reg = <8>;
+                label = "led9";
+                function = LED_FUNCTION_STATUS;
+                color = <LED_COLOR_ID_BLUE>;
+                function-enumerator = <9>;
+                active = <1>;
+            };
+
+            led@9 {
+                reg = <9>;
+                active = <0>;
+            };
+
+            led@a {
+                reg = <10>;
+                active = <0>;
+            };
+
+            led@b {
+                reg = <11>;
+                active = <0>;
+            };
+        };
+    };
+
+...
-- 
2.39.3 (Apple Git-145)


