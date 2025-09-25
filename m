Return-Path: <linux-leds+bounces-5593-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 89CCCB9FD58
	for <lists+linux-leds@lfdr.de>; Thu, 25 Sep 2025 16:08:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7A1C62A1A14
	for <lists+linux-leds@lfdr.de>; Thu, 25 Sep 2025 14:04:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7BA12882D3;
	Thu, 25 Sep 2025 13:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20230601.gappssmtp.com header.i=@thegoodpenguin-co-uk.20230601.gappssmtp.com header.b="BBc2qDyF"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F258C146593
	for <linux-leds@vger.kernel.org>; Thu, 25 Sep 2025 13:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758808706; cv=none; b=A8LDwJ4Z09mRekKX+22XXae2r0fIKdZUPQGcdfHML+TxUlhj00LDaDuV+lOCu7cMpV93+HlkyRTkruy8FC2+0eC079uBdsfbjp59bWNo9f38kurPZcQc16lmJr4PvmOzImrW2jb4hhOOB6R7JA7mkeXoFKzKmt6hdaD0SQfG2iw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758808706; c=relaxed/simple;
	bh=GAZZENDznB+GquG1q9LwWecqHTx3QpoDJbBYfosmceU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=mwUnIGAq670w/MUc3vIqZIcxAbD+tEItO4bOHya/iJj8YJBBc68SaHO+FtKwyuO5n+7uasnhWVnOvbASFg2ADVyl/SrzeEp7HqTEOCtyV45Hx2EU2W4taz78Hn10yffr2tKqQCY8Un+QYNgmD7tfcl4CLifSnjKNHZfBQQmQyDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk; spf=pass smtp.mailfrom=thegoodpenguin.co.uk; dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20230601.gappssmtp.com header.i=@thegoodpenguin-co-uk.20230601.gappssmtp.com header.b=BBc2qDyF; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3e8ef75b146so892762f8f.0
        for <linux-leds@vger.kernel.org>; Thu, 25 Sep 2025 06:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20230601.gappssmtp.com; s=20230601; t=1758808703; x=1759413503; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mnVODjwy2deCiwdvb4Z2Vh0/TaoNB+VzQD5lG5PvCPU=;
        b=BBc2qDyFUowSWkRzo3yJo6CBnsvyLN/RLBYFNtVMFzhXbLne/yS7DHDNeLpzlIW55C
         SV2PP4P/QiC+JkMBT7XVL0VJnDBWWQ730Spa+iR30Tf3k6njgZ+bO+m6po9v6CHdAHMh
         XDt+wWp9E85ws4pe7bzqfwrNYm/jYY2wXzu+r7lcKD27ekGlKTkZXHtPtbUsNtU2KSHv
         TUccP0ajele3GfR3s1glB9VqtTngtgmswdXyFPZSkqqAAvnu1X5YVKt8v6I847iBfcW7
         Ykot56Wvg6QylOEm7F5fw0W3/dYrjXC0gcajtbtRdyw8yFFFdalWVkph9d8jUYLXS5zw
         GaaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758808703; x=1759413503;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mnVODjwy2deCiwdvb4Z2Vh0/TaoNB+VzQD5lG5PvCPU=;
        b=NAlljpov/f7B4V44MJWbwQOy7vfCJDoVovKuAb727psn8UsSdBzesHHtLHSCxQ6d50
         XGHMWv4l+WH/pgPZptDRicyLSlfvYDxkLcpVJTPFW1qLAhK9tAbgkp837WUYGpGko1MO
         p1bJbgrmD/HI5s5J9UtSwsuCD4YzI97iJF2FHTQALdkVgBcIu48jfNljCelB/vOb4cV5
         bvtksjX6T9DPDtGAjCKCQ76GDxq/BND/q1klU+2UPUNJ0vedioODEAkPjL19Gf7M1ybg
         2C5UjOtXENuG+VMnmiQ8R97dl5zNynje624src6LOXoLbwDLWqhQNAiEHXUHhC9QlvvL
         S32g==
X-Forwarded-Encrypted: i=1; AJvYcCWw5zDAdwFkBIsoSpWldRBJq1+WCiDciujwrjJfoytQdD8FPxWizmJYFsZzZ+nASAf6PNqu4QfZnBVa@vger.kernel.org
X-Gm-Message-State: AOJu0Yyw25n5O3LouV1/NixTXZBNodHnvyXWDmLs4wruSXz/UOpTv+6S
	qat86shsC63pKnrRx5EHNWCWOWdD6aWpNUrfElv6C/+YmAarLCbIwPZlIqyo8V2JbdU=
X-Gm-Gg: ASbGncvH+U+tEOZqi5XJLcBbpTmH9bS3978H2D4JjWP70kqrbNZWaybDejkeILwvJJY
	xDhlIsx8Ty3NzDOG30Nk7qd1yEYSQBUTo8T40c/OBcxpA1RYOv8XrMdlSrYqUAdTWm+P+xUtDoa
	znDKdqmJxvyPScvFfWhYEUKIbJtV/6LdK7x6TsGoavnNd1wQLu02LOj3AbtgiMELRvJHgNSDuck
	1M3T6rCr1d4woAn71eAM0piMRTFBILBFM5q9kOrx78ldTfirGQOEvNmmm1RKlU5Y61Z5mJjdmr2
	gQ7a5zxTQ20V88wiPQKIVE9kJylNmJKOAbRQZcV8fY0AjuCaR7NIamv5BA35vgH5BIyX3NaueYO
	GMXC/Y78gp/P3gAAAJyrXl4B4d+UOaBqC2Pni
X-Google-Smtp-Source: AGHT+IEiZzJwcJ162vj4+aB6VkB7CNh+rB8ry4i+6DBqAlJmINd3CbS8/jzQreIiFEvTB6PQhCdeqA==
X-Received: by 2002:a5d:5d02:0:b0:3ec:1edb:97af with SMTP id ffacd0b85a97d-40e4b9455e8mr3471455f8f.34.1758808703141;
        Thu, 25 Sep 2025 06:58:23 -0700 (PDT)
Received: from [127.0.1.1] ([2a02:c7c:8a3e:8c00:a851:5f0e:8210:7d5d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-410f2007372sm2274749f8f.16.2025.09.25.06.58.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 06:58:22 -0700 (PDT)
From: Harrison Carter <hcarter@thegoodpenguin.co.uk>
Date: Thu, 25 Sep 2025 14:57:58 +0100
Subject: [PATCH] dt-bindings: leds: arc,arc2c0608: Convert to DT Schema
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250925-arctic-sand-v1-1-735b5ed8faed@thegoodpenguin.co.uk>
X-B4-Tracking: v=1; b=H4sIAGVK1WgC/x3MQQqAIBBA0avIrBPUCqqrRItJp5qNhRMRiHdPW
 r7F/xmEEpPApDIkelj4jBW2UeAPjDtpDtXgjOvNaK3G5G/2WjAGHdAPtCK2oXNQiyvRxu9/m5d
 SPsydUfhdAAAA
X-Change-ID: 20250911-arctic-sand-dac8ebaa3d42
To: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Brian Dodge <bdodge@arcticsand.com>
Cc: dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Harrison Carter <hcarter@thegoodpenguin.co.uk>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758808702; l=5417;
 i=hcarter@thegoodpenguin.co.uk; s=20250904; h=from:subject:message-id;
 bh=GAZZENDznB+GquG1q9LwWecqHTx3QpoDJbBYfosmceU=;
 b=oZCM47CC6gnSLN2v+Rabs689Vz6eGpmlSKE5B6fKMR+keJNY6FqbyCrledpStrF9MxyxbNQrw
 IMYRul3m8u2Cj+ws8BRCsGqLGsNnKQ1U23CHn2omO+jVMVwhcJdYE2C
X-Developer-Key: i=hcarter@thegoodpenguin.co.uk; a=ed25519;
 pk=xn5ghTMMWQniDtZih4xwKCTAaBHDozflTmqNKtaKo6s=

Convert the ArcticSand arc2c0608 LED driver to the dt-schema.

Signed-off-by: Harrison Carter <hcarter@thegoodpenguin.co.uk>
---
Maintainer set to the author of the arcxcnn_bl.c file
---
 .../bindings/leds/backlight/arc,arc2c0608.yaml     | 108 +++++++++++++++++++++
 .../bindings/leds/backlight/arcxcnn_bl.txt         |  33 -------
 2 files changed, 108 insertions(+), 33 deletions(-)

diff --git a/Documentation/devicetree/bindings/leds/backlight/arc,arc2c0608.yaml b/Documentation/devicetree/bindings/leds/backlight/arc,arc2c0608.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..786beced5590bb38b9c864111f7b66302d4c63ec
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/backlight/arc,arc2c0608.yaml
@@ -0,0 +1,108 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/backlight/arc,arc2c0608.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ArcticSand arc2c0608 LED driver
+
+description: |
+  The ArcticSand arc2c0608 LED driver provides ultra
+  efficient notebook backlighting. Optional properties not
+  specified will default to values in IC EPROM.
+
+  Datasheet:
+  https://www.murata.com/-/media/webrenewal/products/power/power-semiconductor/overview/lineup/led-boost/arc2/arc2c0608.ashx.
+
+maintainers:
+  - Brian Dodge <bdodge@arcticsand.com>
+
+allOf:
+  - $ref: /schemas/leds/common.yaml
+
+properties:
+  compatible:
+    const: arc,arc2c0608
+
+  reg:
+    maxItems: 1
+
+  default-brightness:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 4095
+
+  led-sources:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    description: List of enabled channels
+    items:
+      enum: [0, 1, 2, 3, 4, 5]
+    minItems: 1
+    uniqueItems: true
+
+  arc,led-config-0:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Fading speed (period between intensity
+      steps)
+
+  arc,led-config-1:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: If set, sets ILED_CONFIG register. Used for
+      fine tuning the maximum LED current.
+
+  arc,dim-freq:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: PWM mode frequency setting (bits [3:0] used)
+
+  arc,comp-config:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Setting for register CONFIG_COMP which
+      controls internal resitances, feed forward freqs,
+      and initial VOUT at startup. Consult the datasheet.
+
+  arc,filter-config:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: RC and PWM Filter settings.
+      Bit Assignment
+      7654 3    2    1    0
+      xxxx RCF1 RCF0 PWM1 PWM0
+      RCF statuses        PWM Filter Statues
+      00 = OFF (default)  00 = OFF (default)
+      01 = LOW            01 = 2 STEPS
+      10 - MEDIUM         10 = 4 STEPS
+      11 = HIGH           11 = 8 STEPS
+
+  arc,trim-config:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Sets percentage increase of Maximum LED
+      Current.
+      0x00 = 0% increase.
+      0x20 = 20.2%.
+      0x3F = 41.5%
+
+  label: true
+
+  linux,default-trigger: true
+
+additionalProperties: false
+
+required:
+  - compatible
+  - reg
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        led-controller@30 {
+            compatible = "arc,arc2c0608";
+            reg = <0x30>;
+            default-brightness = <500>;
+            label = "lcd-backlight";
+            linux,default-trigger = "backlight";
+            led-sources = <0 1 2 5>;
+        };
+    };
+...
diff --git a/Documentation/devicetree/bindings/leds/backlight/arcxcnn_bl.txt b/Documentation/devicetree/bindings/leds/backlight/arcxcnn_bl.txt
deleted file mode 100644
index 230abdefd6e7be20b470c3790e74c4d26d084ee8..0000000000000000000000000000000000000000
--- a/Documentation/devicetree/bindings/leds/backlight/arcxcnn_bl.txt
+++ /dev/null
@@ -1,33 +0,0 @@
-Binding for ArcticSand arc2c0608 LED driver
-
-Required properties:
-- compatible:		should be "arc,arc2c0608"
-- reg:			slave address
-
-Optional properties:
-- default-brightness:	brightness value on boot, value from: 0-4095
-- label:		The name of the backlight device
-			See Documentation/devicetree/bindings/leds/common.txt
-- led-sources:		List of enabled channels from 0 to 5.
-			See Documentation/devicetree/bindings/leds/common.txt
-
-- arc,led-config-0:	setting for register ILED_CONFIG_0
-- arc,led-config-1:	setting for register ILED_CONFIG_1
-- arc,dim-freq:		PWM mode frequence setting (bits [3:0] used)
-- arc,comp-config:	setting for register CONFIG_COMP
-- arc,filter-config:	setting for register FILTER_CONFIG
-- arc,trim-config:	setting for register IMAXTUNE
-
-Note: Optional properties not specified will default to values in IC EPROM
-
-Example:
-
-arc2c0608@30 {
-	compatible = "arc,arc2c0608";
-	reg = <0x30>;
-	default-brightness = <500>;
-	label = "lcd-backlight";
-	linux,default-trigger = "backlight";
-	led-sources = <0 1 2 5>;
-};
-

---
base-commit: 76eeb9b8de9880ca38696b2fb56ac45ac0a25c6c
change-id: 20250911-arctic-sand-dac8ebaa3d42

Best regards,
-- 
Harrison Carter <hcarter@thegoodpenguin.co.uk>


