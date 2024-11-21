Return-Path: <linux-leds+bounces-3424-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 134D29D511D
	for <lists+linux-leds@lfdr.de>; Thu, 21 Nov 2024 17:59:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 85335B20E59
	for <lists+linux-leds@lfdr.de>; Thu, 21 Nov 2024 16:59:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 469FB1AA1DB;
	Thu, 21 Nov 2024 16:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=remote-tech-co-uk.20230601.gappssmtp.com header.i=@remote-tech-co-uk.20230601.gappssmtp.com header.b="XOCP8dES"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 401791C461C
	for <linux-leds@vger.kernel.org>; Thu, 21 Nov 2024 16:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732208326; cv=none; b=L1aRTxSulet7MVmhH7Bi8/gMzCYAoEF3GR9jz5It3oPgdkzDMpGUqMX4QHsLjB8VQQmeam3jUVjcpYwQWiPo5JolRq3HkjRR9yD8HvFetfwyDyXZe31yNovBipLgBXHuU1KaTuA9gfb+jU/2RYKCRekzC7eYBj0qFmpTmVQXs0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732208326; c=relaxed/simple;
	bh=/rk98YphhHbe/ZYSTzfJFAmQ84Ek4SJoyxchXfYoArI=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OcgaB/udJafbf63ZSvprS4GmpWTtKtjqT4hOUSuCIv6uTpa1JC+q5gnOZ1SAepJCn3Fz+NCmLAKKGbD0ANzSv92IrXfoa3/IXH/KWSJQMMn2YaYaUtodxPgPQfiI40fhQUf8C2fgK2zRm1pdfzphsFDw+Rsw2KnUmI1aqqffqOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=remote-tech.co.uk; spf=pass smtp.mailfrom=remote-tech.co.uk; dkim=pass (2048-bit key) header.d=remote-tech-co-uk.20230601.gappssmtp.com header.i=@remote-tech-co-uk.20230601.gappssmtp.com header.b=XOCP8dES; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=remote-tech.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=remote-tech.co.uk
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5cef772621eso1528903a12.3
        for <linux-leds@vger.kernel.org>; Thu, 21 Nov 2024 08:58:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=remote-tech-co-uk.20230601.gappssmtp.com; s=20230601; t=1732208322; x=1732813122; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xjtc7Bjar9DjwKzmJO26f3PuO3HlGp9yAOlHl5sQvtU=;
        b=XOCP8dESN9NM3rC91JyQHBKGCO2UMFoIBp3AyF1JZgSEkq6zSW6F1ROtNwB5GL+PEP
         PabHtrGQZdQgEqpEwdK0CefM2oWXIomUKeHonrCMz15aReV1/ElhW4mU3Gq7gXO41JCu
         YS9CD7kpsDpYcNLiHRLZVjeoQG715ko7uPo5sig5/hu74HqD94CiWVy9HskMR6ScAPmG
         hCxeiaU/hvGCC/2tpCZUVf+yjr6l3IXpKDXfmkEDI3B66BF4V0Xmf8WuTwm5PVdA4r+K
         jZagVrm5MjIjswT3lqCmEm201MsMDkEKpAelCSsEiCNg20JWaNAF0pXnoA0Uk3RQLMgT
         K4TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732208322; x=1732813122;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xjtc7Bjar9DjwKzmJO26f3PuO3HlGp9yAOlHl5sQvtU=;
        b=a/PjvXLTVzkxGnAhn/nEYv3O6meqp++qk3vEyfIq+ADzUAx2+uUEnI42EJ2Xs/g8zi
         vTsWch5Q5hq8KpypsS5mpbbUZIywSMtrSKQkczl18lmrkiYDbNLprJ4YKJnTgfEmzhrE
         dgc1JxS4JFN49plyqQjzBzyMTKmkSAqpohr3Wtsm4CDZXoaqLR2Vn2Jv8O3C/JD8HH3G
         ZK6svikRQ0Fl1Ga4hYBCyld5Ubn/3/04Wqlzeoy6FjzNSlKNTFgfEVaFBT9+fP6/WmBt
         /+8y6H7GyIpgyofOXvhSM3SNFAT53rk9DFR2O/nBlcq4UvA/JuRdqgBrLEKOE2Ipshe+
         1gGg==
X-Forwarded-Encrypted: i=1; AJvYcCWpODGdjOj6ome9WcJPHxMmmw6vLnJfrMLz0U16AOn5v4ojBH9EqR8ZsSAuUDJVLe8MR6p710P9sDCT@vger.kernel.org
X-Gm-Message-State: AOJu0YysS9k/v0dQhgJu7rkL6TXA1E7vvuuxg/oiI9nVgmJBKHTc2UqK
	6CsJ4saazsurlPA/XdghevBvlf8bsLm8p97d4dNSTruAsd6cdjYMuX91DF6pMVYbAVE5JfMaYyC
	w1Agkrg3lV7NW8sPC0OAbs1YiN5oQZCm7uNNao/zmidwqCMhHpkBzqxFriM0u8R7EEDtY4UMwag
	AQd0Cy4wLv5zfcfNobkeXndEQG
X-Gm-Gg: ASbGncv2kq4eJVAqJtipnlNsyYNxCBZH2CGIZLTEQNjR9OzH7a6RPhHv2UhSnUJvPCO
	MxvSyfGW6VY4zrBwwBCAYF5utun3ryN6mPxvic+l/yphGFnNYIXeoKXqyOJNGmzUmteZTL+nHfY
	Q5HSfblwBFDptcLIGmXXgMN7KdQgS1yjwUyxy93mIWygQ9s3KTvY1Bo75uhg58ZmA4QGqEOfVla
	LLI3OnYnDuMPhmWf7IguB+qyZRxn/aspYUo6iiTh6OHmBxW4nls+70/8DKY8yecQgcMdZCWAjv2
	mY9VVP+1RNLC9Xtchydq
X-Google-Smtp-Source: AGHT+IGLS3KmQ7W38uHkAUt5viZ2Av6E/2C/dV0BXFOoBaL8NmcaVp/OqwnPRW9xtIPS0QThu5bqjw==
X-Received: by 2002:a17:907:97c9:b0:a9a:1792:f1a with SMTP id a640c23a62f3a-aa4dd52c6femr719914166b.7.1732208322610;
        Thu, 21 Nov 2024 08:58:42 -0800 (PST)
Received: from localhost.localdomain ([178.27.36.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa4f41536d3sm101502766b.24.2024.11.21.08.58.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2024 08:58:42 -0800 (PST)
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
Subject: [PATCH v9 2/3] dt-bindings: leds: Add LED1202 LED Controller
Date: Thu, 21 Nov 2024 16:58:24 +0000
Message-Id: <20241121165829.8210-3-vicentiu.galanopulo@remote-tech.co.uk>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241121165829.8210-1-vicentiu.galanopulo@remote-tech.co.uk>
References: <20241121165829.8210-1-vicentiu.galanopulo@remote-tech.co.uk>
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


