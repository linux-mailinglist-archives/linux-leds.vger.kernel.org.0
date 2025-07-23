Return-Path: <linux-leds+bounces-5110-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 561ACB0EF21
	for <lists+linux-leds@lfdr.de>; Wed, 23 Jul 2025 12:03:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 11DD83B92B0
	for <lists+linux-leds@lfdr.de>; Wed, 23 Jul 2025 10:02:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A2EB28C031;
	Wed, 23 Jul 2025 10:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20230601.gappssmtp.com header.i=@thegoodpenguin-co-uk.20230601.gappssmtp.com header.b="cjZ4zjxa"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFABD289814
	for <linux-leds@vger.kernel.org>; Wed, 23 Jul 2025 10:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753264937; cv=none; b=erjy/FAridUotbnAOTqK233a0Fz0zh1+dtGrLWFyhcpFLpR49yoC+UvdAxPojiXRZgm76GUdWMjQoyCvRQ7pYmJkz2tIhsa5WOUJ0f9jTYe1NezmBQvaRHqDlc4O4MfzLN3UwhQUkJ6qR8Bk5oiImiADGNRAudrRCHR7rL+7NGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753264937; c=relaxed/simple;
	bh=5kMgxutJotWHcn+GjfQR8lDKiExane0jM29wizaS1do=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=flKCk7BaZo4iG9kt80yi+l5Xj9i+Gucfam5SxhwLpyay5cc+A0OxydlcHgzJoV/q+dlTY3sd5N7MqLKDZFOyY4pJ9CBYYCKzxhodlcBAE3pi4ch9ox/WczyBfgsOflOjjvHP9DY2lhD4PmNFKRsvGmgRrXX7zNzNhPBwevtHLIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk; spf=pass smtp.mailfrom=thegoodpenguin.co.uk; dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20230601.gappssmtp.com header.i=@thegoodpenguin-co-uk.20230601.gappssmtp.com header.b=cjZ4zjxa; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-45611a6a706so34786095e9.1
        for <linux-leds@vger.kernel.org>; Wed, 23 Jul 2025 03:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20230601.gappssmtp.com; s=20230601; t=1753264934; x=1753869734; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rUYJkiCckDIL5Ouw6onN64YYh2QkIaR4fkS2n+72LBg=;
        b=cjZ4zjxa0P+CUWvp1sZFUzi6JULdcMScwHVAZnRc+Ls2KKfzoQQhJzMw0hlCQ3B/Ua
         wb2EGmtBCmr+JRTPyrTrCre8JBnzINpcyMDJ+WdP5aaFNy6FSog3h2QS9iKZhDJiN+in
         /3wqSLJ1HLelD4P//7f2T1VrPuXhBSPV/vQvz7vHX0KcFy1nQ9jRu06EZj34n9tXCvc2
         gGrLgYZcyWmwRSYfONllY9MuznuJONgw4frQ8f1D6pSDJKj/bepxJE36QWCOpXSOmPX0
         mxuYoIsDgFzF9cUs1ehlqr8tAG8hWUbMrMpNyBjTTMWFXnPGRUAJ4/1ksdgxuh3/ETNf
         Gj4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753264934; x=1753869734;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rUYJkiCckDIL5Ouw6onN64YYh2QkIaR4fkS2n+72LBg=;
        b=NMzEYBoVutRqw8Z38mh4EAe8FJtJnCVWp+tFWid/dWMrJJJghWs7RRJMhzYvGezxvk
         V0Y4HV2Lx0gByJpk/N7B/h2hyAmJ997FU0auAFxjF+t4ifG22898mJy9E6QMgvDcPXvQ
         2Ev1Vbcc22iOIy1oMXXS5rTUNMVcD4n6Z7uhIIapGJEwnVAfGPVBGrWTFMQwdmqAMezS
         Z/c08zsvcqmACqlNiEC48sKmuluMLnpWA6FOleA6apSloDs76PQevUCrXvA+CLbHQ+SO
         /T0bXMWXgnHJKDTz+IFEZ3AfzC0Ea+Abptak9bAtzQUVZnXFAvfKmhc5KvSPqMGZoq+d
         TczQ==
X-Gm-Message-State: AOJu0YzDtz3t6LG2R04km/AE2QFaOGVwi4utShEZpj707TQC39KqX+e9
	aP1rJvfm5ohzldNvBy1bjM2G+urt3FqJQE9AEp2LOJ/LMr8Q9hJeksGzuYZNy57aLyRSzXiRelW
	ywkHg1/8=
X-Gm-Gg: ASbGncu2VTVpAk2hcatAMSm9JjV7dBIxvpfc8mHxWSVbROr28hsm2SY1t0dEbBttpQb
	j9b5rlFchVK6VvC7GiyBR17gCHmuMkdakFF0xk0yrhMhcuZWIZMK827UEjGkLo33BuHo1hrzXHM
	6EGH5sZ/6aCvVqYbBYlKbOSBe/SNeedljv9yoeR+ScQFnJ0H62rna92G5PQP4sAa/lnynObDSgH
	GzGpMoeHTiGy0OVKBH6xgyxWmj9V+c4d6joPXFQwqOWkB6zqJs25vOlP1mXOvwIuwbKbLQX1Fwe
	2/rl7DGMwVFh6Vf1/zPNfDhO8vtgk0k8NEh+nUwa1S3Wef2xbivP3mDbshMy8G6nWtbmiGE26+t
	3I09Q+ZMRwzJcRHF26XVkg0jmwPa8gei0NYExBTlm1rpo9me/
X-Google-Smtp-Source: AGHT+IGmA92VovbPEOSffV2mRQSpT8/xk+7T4j49WCzpvzEE6bu2Q+8HVGTdw+FBzKL6uOtYI1tUsA==
X-Received: by 2002:a05:600c:1d05:b0:456:173c:8a53 with SMTP id 5b1f17b1804b1-45868c822d5mr19796545e9.2.1753264933934;
        Wed, 23 Jul 2025 03:02:13 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:23c7:1d1a:9c01:6066:6737:c27:90a6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b61ca31394sm15930793f8f.37.2025.07.23.03.02.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 03:02:13 -0700 (PDT)
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Date: Wed, 23 Jul 2025 11:02:06 +0100
Subject: [PATCH v6 1/3] dt-bindings: leds: is31fl32xx: convert the binding
 to yaml
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250723-leds-is31fl3236a-v6-1-210328058625@thegoodpenguin.co.uk>
References: <20250723-leds-is31fl3236a-v6-0-210328058625@thegoodpenguin.co.uk>
In-Reply-To: <20250723-leds-is31fl3236a-v6-0-210328058625@thegoodpenguin.co.uk>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Pavel Machek <pavel@ucw.cz>, devicetree@vger.kernel.org, 
 Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>, 
 Lucca Fachinetti <luccafachinetti@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753264931; l=4843;
 i=pzalewski@thegoodpenguin.co.uk; s=20250625; h=from:subject:message-id;
 bh=pYc8fwZ9xvPA38qYZqIbcn2vrzfKKe4H36j/51JnX6c=;
 b=TE/RG8MwJfH1QcEIOfrd5s3wNEzkwFcvYvV0Xpu/UXQpTreve6aBlMv1aAE2mI0xm2HuhDeeu
 ekvmrjYG2PCDIPv8+tABRgBFDu/WwM7C8g1S/48p1H/GHQC86Q0jhRx
X-Developer-Key: i=pzalewski@thegoodpenguin.co.uk; a=ed25519;
 pk=hHrwBom/yjrVTqpEvKpVXLYfxr6nqBNP16RkQopIRrI=

From: Lucca Fachinetti <luccafachinetti@gmail.com>

Add datasheets for reference, NB that I was not able to find an
up-to-date, funtional direct URL for si-en products datasheet
so they were skipped.

Signed-off-by: Lucca Fachinetti <luccafachinetti@gmail.com>
Co-developed-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
---
 .../devicetree/bindings/leds/issi,is31fl3236.yaml  | 96 ++++++++++++++++++++++
 .../devicetree/bindings/leds/leds-is31fl32xx.txt   | 52 ------------
 2 files changed, 96 insertions(+), 52 deletions(-)

diff --git a/Documentation/devicetree/bindings/leds/issi,is31fl3236.yaml b/Documentation/devicetree/bindings/leds/issi,is31fl3236.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..c778866d51fe6ba947631ee80741f0d8a02f82ee
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/issi,is31fl3236.yaml
@@ -0,0 +1,96 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/issi,is31fl3236.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: is31fl32xx and Si-En SN32xx IC LED driver
+
+maintainers:
+  - Pavel Machek <pavel@ucw.cz>
+  - Lee Jones <lee@kernel.org>
+
+description: |
+  The is31fl32xx/SN32xx family of LED drivers are I2C devices with multiple
+  constant-current channels, each with independent 256-level PWM control.
+  Each LED is represented as a sub-node of the device.
+
+  For more product information please see the links below:
+    https://www.lumissil.com/assets/pdf/core/IS31FL3216_DS.pdf
+    https://www.lumissil.com/assets/pdf/core/IS31FL3218_DS.pdf
+    https://www.lumissil.com/assets/pdf/core/IS31FL3235_DS.pdf
+    https://www.lumissil.com/assets/pdf/core/IS31FL3236_DS.pdf
+
+properties:
+  compatible:
+    enum:
+      - issi,is31fl3216
+      - issi,is31fl3218
+      - issi,is31fl3235
+      - issi,is31fl3236
+      - si-en,sn3216
+      - si-en,sn3218
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
+  "^led@([1-9a-f]|1[0-9a-f]|2[0-4])$":
+    type: object
+    $ref: common.yaml#
+    unevaluatedProperties: false
+
+    properties:
+      reg:
+        description:
+          LED channel number (1..N)
+        minimum: 1
+        maximum: 36
+
+    required:
+      - reg
+
+required:
+  - compatible
+  - reg
+  - "#size-cells"
+  - "#address-cells"
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
+        led-controller@3c {
+            compatible = "issi,is31fl3236";
+            reg = <0x3c>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            led@1 {
+                reg = <1>;
+                label = "led1:red";
+            };
+            led@2 {
+                reg = <2>;
+                label = "led1:green";
+            };
+            led@3 {
+                reg = <3>;
+                label = "led1:blue";
+            };
+        };
+    };
+...
+
diff --git a/Documentation/devicetree/bindings/leds/leds-is31fl32xx.txt b/Documentation/devicetree/bindings/leds/leds-is31fl32xx.txt
deleted file mode 100644
index 926c2117942c4dc200fcd68156864f544b11a326..0000000000000000000000000000000000000000
--- a/Documentation/devicetree/bindings/leds/leds-is31fl32xx.txt
+++ /dev/null
@@ -1,52 +0,0 @@
-Binding for ISSI IS31FL32xx and Si-En SN32xx LED Drivers
-
-The IS31FL32xx/SN32xx family of LED drivers are I2C devices with multiple
-constant-current channels, each with independent 256-level PWM control.
-Each LED is represented as a sub-node of the device.
-
-Required properties:
-- compatible: one of
-	issi,is31fl3236
-	issi,is31fl3235
-	issi,is31fl3218
-	issi,is31fl3216
-	si-en,sn3218
-	si-en,sn3216
-- reg: I2C slave address
-- address-cells : must be 1
-- size-cells : must be 0
-
-LED sub-node properties:
-- reg : LED channel number (1..N)
-- label :  (optional)
-  see Documentation/devicetree/bindings/leds/common.txt
-- linux,default-trigger :  (optional)
-  see Documentation/devicetree/bindings/leds/common.txt
-
-
-Example:
-
-is31fl3236: led-controller@3c {
-	compatible = "issi,is31fl3236";
-	reg = <0x3c>;
-	#address-cells = <1>;
-	#size-cells = <0>;
-
-	led@1 {
-		reg = <1>;
-		label = "EB:blue:usr0";
-	};
-	led@2 {
-		reg = <2>;
-		label = "EB:blue:usr1";
-	};
-	...
-	led@36 {
-		reg = <36>;
-		label = "EB:blue:usr35";
-	};
-};
-
-For more product information please see the links below:
-http://www.issi.com/US/product-analog-fxled-driver.shtml
-http://www.si-en.com/product.asp?parentid=890

-- 
2.48.1


