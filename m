Return-Path: <linux-leds+bounces-4409-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A1168A7CB73
	for <lists+linux-leds@lfdr.de>; Sat,  5 Apr 2025 20:34:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C781D7A49B0
	for <lists+linux-leds@lfdr.de>; Sat,  5 Apr 2025 18:32:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E6DE1A8F98;
	Sat,  5 Apr 2025 18:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MOuqCkCu"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD2061A8F63;
	Sat,  5 Apr 2025 18:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743878004; cv=none; b=XdrgNgtcybo6bo+SPC4SG1GZ3BEfqAHJ82jhkpIUx9DaDEuQQfIEOVK0wwYHxj4L3Wz+9R/bGG3nSIIpW6MY6S2u6y/zLcqpUY4dpFdwMV14osZeuWiBefl+n4TpZVcHYzaYMM+GhwTiz9P1YY+aDjC4+D6leO4MS/eTtkIV8s4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743878004; c=relaxed/simple;
	bh=RwIU3bOu8ErR3rqhAf17vegnAsuBFm7xlVbuqsulRY4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QiEVXoXYSckPCLMPE5Fqs/W2wBoO+DsbE2Nc09ts0SW9G9G4W9eEA1dVr5ceVV8MzUNpll1+BXyj9UZrcSNTf3t3o9Zpty+4+zBT0WUbyCZEwZjbmWUPDWw6fc30UUQnSc+VEwhS+QFSvf0oqGSgzIIzr7ME6ugtPnbqtzPBlWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MOuqCkCu; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-224100e9a5cso31817825ad.2;
        Sat, 05 Apr 2025 11:33:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743878002; x=1744482802; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YNJdlwF2Tpx9e4jpnu/n7KCT21hPfJ8xPPWhQuyOlEY=;
        b=MOuqCkCuPq58EgZKc1rGEccY9J5WBq7u15Ys21WIthv884p7HCk7JPov7dUnh1Ehe/
         5Q2X1TNslPArglk4MS8Spkab/GEngdDtua5JhXp37Jxg7XbN9/sHHqJQO2smgpRpqDEz
         7NscOIpnj3c6dN9U6TP3h12DO3ou2W9FP+CRJzoZrLbVpwDsgSU4g0Dq/0OCSYQ6b/xh
         /u6xt06OzI8AMcseZwMjwjeDjhYe2PuMRHXSbJLnjL9SX9oyhBMXDugrVqo6u337cON/
         DZfO/FqlnTVcRKSYtvXhlldzMcC0YVbwGtIgpSUfSTuPgPkqnJbfXeEkiJKuhi70vjoD
         O29g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743878002; x=1744482802;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YNJdlwF2Tpx9e4jpnu/n7KCT21hPfJ8xPPWhQuyOlEY=;
        b=EUNyd/krR4E/rxUppKL9I+c17CWgikjGnv6qYtv9ChMcy4w+4hycG2uggnaoQNVpuT
         BqbNwH2erq/WRMIw9/sTxE5AZRUio5b4SiVcsrMD/HqD1MkGCt7C+ft6U8f+jQKh6Hvm
         gATqEwgz4pm4294zuxkxJuvzfSu5knctrSzPAL4nO5vXt8Hyh33Ntvk2dUu6uBEsuPP+
         NpEdmwJGwiG3KAuOZqdxRNy3WjZf63lQPef/jv1QXcv1N3kzmDaT4NcdRy8pVgoeNbDy
         bVgKvV5Rc2Iq63kll3/Ygk4WfH+NgmK5Qt9W4UjTpcnXZ0HTCWnbny58QOtbBPvk5FBn
         CEoQ==
X-Forwarded-Encrypted: i=1; AJvYcCVaD4mLWd4mC/cTxIm7+nEn7H9rZ3GxkD1PWd6PfhVbTk7ceXN+O2Qpr382Y3/vvFRLPRHZ81OyN6ZBG04=@vger.kernel.org, AJvYcCWhuqmXlUnYmIB0uR2bjP1eBYuzabd4ZRQMRxXl+igfrxmq6gTaa+ZNp4+R7x7cMW5HU7HyLbjxtECxZA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7+NfqNSzHcngFhq+duiHh10rhUuC4nVyQTaFkNWYKMGAaig09
	Jv1WvIJ41U2t+j9qnPjikqRstxOBLsopc67XG0pmDZbuhmASReEDvfSl8LIu
X-Gm-Gg: ASbGncsH+IUH2dGjGDrFR5bRZLjF7/sdQRyWCVK/9T4esNAYwDbSH2keOdUhiLqQd1l
	8nCLzeflI9AFJsmYjI8XkzmGu4PE+WeprOUhKQyNXcml43+JipkovJR4irJqhbsmOcRF4Pod//4
	IkIvkOGZtAwRDhkc0pIt4549Bbb+bHxh3zIo5Oi8XLW+dqSurwlHLqQO0FgHYtmkxQwn2o09reZ
	4/h4/l2o1K82vEk8nM5Z7U2LsduspQSnEB2Utq3AicuvP1IZkUGnOYVNboSX1/iCVBp4INIe4Mt
	l6B7m34dJAl/WWGYUzJKTjrPrrK+NSMToL7/WXNL0w+jaWY1Dt9YxoWR
X-Google-Smtp-Source: AGHT+IEbcpY7NjsTCM+EJKu5UTD0GPbcGd0YEReGGzVJJ3dUtPeKxNo1LvV38n2m9a4lFnu5LHNNqg==
X-Received: by 2002:a17:903:3ba6:b0:224:826:277f with SMTP id d9443c01a7336-22a8a8cefa5mr91578935ad.33.1743878001975;
        Sat, 05 Apr 2025 11:33:21 -0700 (PDT)
Received: from localhost.localdomain ([123.17.0.117])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2297866e61dsm52980965ad.190.2025.04.05.11.33.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Apr 2025 11:33:21 -0700 (PDT)
From: Nam Tran <trannamatk@gmail.com>
To: pavel@kernel.org,
	lee@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net
Cc: devicetree@vger.kernel.org,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nam Tran <trannamatk@gmail.com>
Subject: [PATCH v4 1/5] dt-bindings: leds: add TI/National Semiconductor LP5812 LED Driver
Date: Sun,  6 Apr 2025 01:32:42 +0700
Message-Id: <20250405183246.198568-2-trannamatk@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250405183246.198568-1-trannamatk@gmail.com>
References: <20250405183246.198568-1-trannamatk@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The LP5812 is a 4×3 RGB LED driver with an autonomous animation engine
and time-cross-multiplexing (TCM) support for up to 12 LEDs.
It supports both analog (256 levels) and PWM (8-bit) dimming,
including exponential PWM for smooth brightness control.

Signed-off-by: Nam Tran <trannamatk@gmail.com>
---
 .../devicetree/bindings/leds/ti,lp5812.yaml   | 122 ++++++++++++++++++
 MAINTAINERS                                   |   6 +
 2 files changed, 128 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/ti,lp5812.yaml

diff --git a/Documentation/devicetree/bindings/leds/ti,lp5812.yaml b/Documentation/devicetree/bindings/leds/ti,lp5812.yaml
new file mode 100644
index 000000000000..e492386ff127
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/ti,lp5812.yaml
@@ -0,0 +1,122 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/ti,lp5812.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TI/National Semiconductor LP5812 LED Driver
+
+maintainers:
+  - Nam Tran <trannamatk@gmail.com>
+
+description: |
+  The LP5812 is an I2C LED Driver that can support LED matrix 4x3.
+  For more product information please see the link below:
+  https://www.ti.com/product/LP5812#tech-docs
+
+properties:
+  compatible:
+    const: ti,lp5812
+
+  reg:
+    maxItems: 1
+    description:
+      I2C slave address
+      lp5812/12- 0x1b
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+patternProperties:
+  "^led@[0-9a-b]$":
+    type: object
+    $ref: common.yaml#
+    unevaluatedProperties: false
+
+    properties:
+      reg:
+        minimum: 0
+        maximum: 0xb
+
+      chan-name:
+        $ref: /schemas/types.yaml#/definitions/string
+        description: LED channel name
+
+    required:
+      - reg
+
+required:
+  - compatible
+  - reg
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
+        led-controller@1b {
+            compatible = "ti,lp5812";
+            reg = <0x1b>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            led@0 {
+                    reg = <0x0>;
+                    chan-name = "a0";
+            };
+            led@1 {
+                    reg = <0x1>;
+                    chan-name = "a1";
+            };
+            led@2 {
+                    reg = <0x2>;
+                    chan-name = "a2";
+            };
+            led@3 {
+                    reg = <0x3>;
+                    chan-name = "b0";
+            };
+            led@4 {
+                    reg = <0x4>;
+                    chan-name = "b1";
+            };
+            led@5 {
+                    reg = <0x5>;
+                    chan-name = "b2";
+            };
+            led@6 {
+                    reg = <0x6>;
+                    chan-name = "c0";
+            };
+            led@7 {
+                    reg = <0x7>;
+                    chan-name = "c1";
+            };
+            led@8 {
+                    reg = <0x8>;
+                    chan-name = "c2";
+            };
+            led@9 {
+                    reg = <0x9>;
+                    chan-name = "d0";
+            };
+            led@a {
+                    reg = <0xa>;
+                    chan-name = "d1";
+            };
+            led@b {
+                    reg = <0xb>;
+                    chan-name = "d2";
+            };
+        };
+    };
+
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 3b5fa8436987..afbc481d0311 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23531,6 +23531,12 @@ S:	Supported
 F:	Documentation/devicetree/bindings/iio/dac/ti,dac7612.yaml
 F:	drivers/iio/dac/ti-dac7612.c
 
+TEXAS INSTRUMENTS' LP5812 LED DRIVER
+M:	Nam Tran <trannamatk@gmail.com>
+L:	linux-leds@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/leds/ti,lp5812.yaml
+
 TEXAS INSTRUMENTS' LB8864 LED BACKLIGHT DRIVER
 M:	Alexander Sverdlin <alexander.sverdlin@siemens.com>
 L:	linux-leds@vger.kernel.org

base-commit: 2df0c02dab829dd89360d98a8a1abaa026ef5798
-- 
2.25.1


