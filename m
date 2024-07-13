Return-Path: <linux-leds+bounces-2277-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9788B9305E1
	for <lists+linux-leds@lfdr.de>; Sat, 13 Jul 2024 16:19:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0DB691F214D1
	for <lists+linux-leds@lfdr.de>; Sat, 13 Jul 2024 14:19:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4888136E09;
	Sat, 13 Jul 2024 14:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PZKSRsOO"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A11213699A;
	Sat, 13 Jul 2024 14:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720880356; cv=none; b=apZOgd+hxkjBaXaUgmhw3+Sj8ag1K/gfbWh+G9WMCu+/keSJsCNaEMwgDSCc1BoWhNfe9lAbezAWTDqUvE/HvHTt0cleNQDWzq17ppW+XDRjq3oXG9t4A+kmrs6piGEK1oqq3p5UajrPv20bZV9YpMis71QbMKd5eGXBIHlEsC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720880356; c=relaxed/simple;
	bh=SkmzsuhgkpcePaJ/TC8Ame2tbCeFuUiI91+wOw2ImJk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=No02eovi2+1adZJm1g5zCp4hzfFwmgedw9jXFt64PQjYC84yW0W7yIh0CoQhBJhQVX2z4BkPBbUBPaKV04ydNu69XX7cwsi2N/N3I6NfFu1X09436CquN0TKVwPtLUVOwbUC3NVU4wBbivYGbRTjpqi+qfJAu/9if8UaQvyVnpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PZKSRsOO; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4266f344091so21432225e9.0;
        Sat, 13 Jul 2024 07:19:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720880353; x=1721485153; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QK6XJAfDfWUOwtihg46UYuTK4YivUBGgsu1R9c4EEMI=;
        b=PZKSRsOOE7iukA6SdOxWVUoK8riTyNcrafs/kpzp7URBID/cUWqPzTtekZMrDAu5gb
         F7bykhmQxNXDqgG9p3yAneLXMMFdlkx1XQmkCda7feydhWjj7fIxObyDjon3QFTeEAKu
         syiAYXxWgdKmgJbO0O8khxyN0pU4n6CMbvKVm6r+6dg0lO8kd7OzA/BYenw7GJ5abbvd
         6gjzTm1gXqnzYm/2ZAvPSzkIe+iAfu0MAtCU912mimbNPNyCfWrvGlcDIpg4vnrdzbM7
         tX1MRxCHteD263DgMqBOksbrUY/k29nfNjem8Mjtzmf7EJnF8v6bJ6S7YWDsedFzfHSe
         3uyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720880353; x=1721485153;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QK6XJAfDfWUOwtihg46UYuTK4YivUBGgsu1R9c4EEMI=;
        b=nZsx1yn5y8/0b7SLbFa7GPj6WD0//KIxyeISbqqUIs75/lSKqsEq4TT8Fg0hjmbVYv
         JXC6JW5o2OLyMCYKuDn/339m3qCnFtdq+faP+BDjZ7jDMsKUnopm/reEYPSuIWzaZTW0
         i1gU+5vn9YE/sSzXXABeUCg1cscAPvPeM0Xp8LTBt0Pmcg4fs+tJySSXJQuvxFh16DY4
         /71Z5eoQF8IQK9UK5gHakBuy/hOGM9qeW02LboZqWuiacZnfl773ErYbbG/QXFxp0UWh
         qWbBPUMLzjyUV9JRqsNemSjFlsVQFVpgSLYl9Ju8JpYKMpYzWXJiMQguqy9l4w95AD9i
         cIjw==
X-Forwarded-Encrypted: i=1; AJvYcCWi3kjV42Xr+/hbIEKhxTjp+RyTslkYLDgqMPn3h8+8Avc1/ksjy1xiAKMzXEnp8aPrMyL32xtykgqULNju2PAQBkBofzWOzHh8a4QnZ91Wzj7bBnZ/E/sDuD9wd3DSt+diQuQBV/3eGA==
X-Gm-Message-State: AOJu0Yx2VR5Q40B1YaqLE5hvYiZQmOg/IvlKmqLV+0XuX6lrmTdAg8rJ
	U62h+id09T+VbJtX5Ma4YiejQIB+0rfmtzMwpv2GmCE4L4ZJvTzC
X-Google-Smtp-Source: AGHT+IHHjbny9RRu0LAvm/2bN8ShF4nyVd8IAWxQHbDxuBnlmgfzDqGSCcHsli/eQCRJcX+6zgWdJQ==
X-Received: by 2002:a05:600c:4d0d:b0:426:6326:4cec with SMTP id 5b1f17b1804b1-426707f90d0mr99248565e9.29.1720880353256;
        Sat, 13 Jul 2024 07:19:13 -0700 (PDT)
Received: from standask-GA-A55M-S2HP (lu-nat-113-247.ehs.sk. [188.123.113.247])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427a5e77471sm22288785e9.4.2024.07.13.07.19.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jul 2024 07:19:13 -0700 (PDT)
Date: Sat, 13 Jul 2024 16:19:11 +0200
From: Stanislav Jakubek <stano.jakubek@gmail.com>
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Baolin Wang <baolin.wang7@gmail.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: leds: sc2731-bltc: convert to YAML
Message-ID: <ZpKM3yYKJixnRabP@standask-GA-A55M-S2HP>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Convert the Spreadtrum SC2731 breathing light controller bindings
to DT schema. Adjust filename to match compatible.

Signed-off-by: Stanislav Jakubek <stano.jakubek@gmail.com>
---
 .../bindings/leds/leds-sc27xx-bltc.txt        | 43 ----------
 .../bindings/leds/sprd,sc2731-bltc.yaml       | 84 +++++++++++++++++++
 2 files changed, 84 insertions(+), 43 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/leds/leds-sc27xx-bltc.txt
 create mode 100644 Documentation/devicetree/bindings/leds/sprd,sc2731-bltc.yaml

diff --git a/Documentation/devicetree/bindings/leds/leds-sc27xx-bltc.txt b/Documentation/devicetree/bindings/leds/leds-sc27xx-bltc.txt
deleted file mode 100644
index df2b4e1c492b..000000000000
--- a/Documentation/devicetree/bindings/leds/leds-sc27xx-bltc.txt
+++ /dev/null
@@ -1,43 +0,0 @@
-LEDs connected to Spreadtrum SC27XX PMIC breathing light controller
-
-The SC27xx breathing light controller supports to 3 outputs:
-red LED, green LED and blue LED. Each LED can work at normal
-PWM mode or breath light mode.
-
-Required properties:
-- compatible: Should be "sprd,sc2731-bltc".
-- #address-cells: Must be 1.
-- #size-cells: Must be 0.
-- reg: Specify the controller address.
-
-Required child properties:
-- reg: Port this LED is connected to.
-
-Optional child properties:
-- function: See Documentation/devicetree/bindings/leds/common.txt.
-- color: See Documentation/devicetree/bindings/leds/common.txt.
-- label: See Documentation/devicetree/bindings/leds/common.txt (deprecated).
-
-Examples:
-
-led-controller@200 {
-	compatible = "sprd,sc2731-bltc";
-	#address-cells = <1>;
-	#size-cells = <0>;
-	reg = <0x200>;
-
-	led@0 {
-		color = <LED_COLOR_ID_RED>;
-		reg = <0x0>;
-	};
-
-	led@1 {
-		color = <LED_COLOR_ID_GREEN>;
-		reg = <0x1>;
-	};
-
-	led@2 {
-		color = <LED_COLOR_ID_BLUE>;
-		reg = <0x2>;
-	};
-};
diff --git a/Documentation/devicetree/bindings/leds/sprd,sc2731-bltc.yaml b/Documentation/devicetree/bindings/leds/sprd,sc2731-bltc.yaml
new file mode 100644
index 000000000000..5853410c7a45
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/sprd,sc2731-bltc.yaml
@@ -0,0 +1,84 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/sprd,sc2731-bltc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Spreadtrum SC2731 PMIC breathing light controller
+
+maintainers:
+  - Orson Zhai <orsonzhai@gmail.com>
+  - Baolin Wang <baolin.wang7@gmail.com>
+  - Chunyan Zhang <zhang.lyra@gmail.com>
+
+description: |
+  The SC2731 breathing light controller supports up to 3 outputs:
+  red LED, green LED and blue LED. Each LED can work at normal PWM mode
+  or breath light mode.
+
+properties:
+  compatible:
+    const: sprd,sc2731-bltc
+
+  reg:
+    maxItems: 1
+
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
+patternProperties:
+  "^led@[0-2]$":
+    type: object
+    $ref: common.yaml#
+    unevaluatedProperties: false
+
+    properties:
+      reg:
+        minimum: 0
+        maximum: 2
+
+    required:
+      - reg
+
+required:
+  - compatible
+  - reg
+  - '#address-cells'
+  - '#size-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/leds/common.h>
+
+    pmic {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      led-controller@200 {
+        compatible = "sprd,sc2731-bltc";
+        reg = <0x200>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        led@0 {
+          reg = <0x0>;
+          color = <LED_COLOR_ID_RED>;
+        };
+
+        led@1 {
+          reg = <0x1>;
+          color = <LED_COLOR_ID_GREEN>;
+        };
+
+        led@2 {
+          reg = <0x2>;
+          color = <LED_COLOR_ID_BLUE>;
+        };
+      };
+    };
+...
-- 
2.34.1


