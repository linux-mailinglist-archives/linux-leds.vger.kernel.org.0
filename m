Return-Path: <linux-leds+bounces-130-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 490767F6FE7
	for <lists+linux-leds@lfdr.de>; Fri, 24 Nov 2023 10:33:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 05E19281A99
	for <lists+linux-leds@lfdr.de>; Fri, 24 Nov 2023 09:33:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70EA7168DC;
	Fri, 24 Nov 2023 09:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=monolithicpower.com header.i=@monolithicpower.com header.b="J2PfM+Q3"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0a-002bf204.pphosted.com (mx0a-002bf204.pphosted.com [205.220.160.90])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BB41EA;
	Fri, 24 Nov 2023 01:33:25 -0800 (PST)
Received: from pps.filterd (m0207524.ppops.net [127.0.0.1])
	by mx0a-002bf204.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 3AO5K3s2023268;
	Fri, 24 Nov 2023 01:33:17 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	monolithicpower.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding
	:content-type; s=pps1; bh=yvkonXUAdwEEl/zvVVNJg+Y4EulCeGGUusjlzL
	PCYQs=; b=J2PfM+Q3e9dpzoxNEz7j+M93Yz0hwtNXn2IF2RtLp4zAopV69ADBuq
	wSdEUS1Wol7P37ZkTjtIoEXnx43X+AEJdjF5x+rucZ6tbDFo6xZPP1qOFLT3BdcZ
	0nScGw6K2k/+qYxnonPP12D8y6q5vJivPSTc5TuOEmfnnFwj7RxcZz2rwn6VjSYk
	GLPplR/9p+AwtlRT23E37WGU/fSb+0yAPQoip7WWilYKa7t8tG7F6Zdqu/42/fHG
	bUyqnfjVfSfYVrBMq4Gm9g93NJA2uBFmNCT/YOb53u9GYiAVYgBnuIx2p0FbjJxz
	2LhwKaT+qxrZc6aPHR/0yDrRJFz6UT4g==
Received: from webmail.monolithicpower.com (mps-vpn.monolithicpower.com [12.33.0.20] (may be forged))
	by mx0a-002bf204.pphosted.com (PPS) with ESMTPS id 3uesjsb24f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 24 Nov 2023 01:33:17 -0800 (PST)
Received: from CD-MSH04.monolithicpower.com (10.10.70.213) by
 mps-mslbn01.monolithicpower.com (10.10.10.199) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Fri, 24 Nov 2023 01:33:10 -0800
Received: from smtp.gmail.com (10.10.86.78) by CD-MSH04.monolithicpower.com
 (10.10.70.213) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Fri, 24 Nov
 2023 17:33:08 +0800
From: Yuxi Wang <Yuxi.Wang@monolithicpower.com>
To: <pavel@ucw.cz>, <lee@kernel.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <Yuxi.Wang@monolithicpower.com>
CC: <linux-kernel@vger.kernel.org>, <linux-leds@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <wyx137120466@gmail.com>
Subject: [PATCH 1/2] dt-bindings: leds: add mps mp3326 LED
Date: Fri, 24 Nov 2023 17:30:32 +0800
Message-ID: <20231124093034.951-2-Yuxi.Wang@monolithicpower.com>
X-Mailer: git-send-email 2.42.0.windows.2
In-Reply-To: <20231124093034.951-1-Yuxi.Wang@monolithicpower.com>
References: <20231124093034.951-1-Yuxi.Wang@monolithicpower.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CD-MSLBN02.monolithicpower.com (192.168.86.32) To
 CD-MSH04.monolithicpower.com (10.10.70.213)
X-Proofpoint-ORIG-GUID: 2kApOr8jzCQAIfAeHQ5EJBUjP3W0m1me
X-Proofpoint-GUID: 2kApOr8jzCQAIfAeHQ5EJBUjP3W0m1me
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-23_15,2023-11-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 suspectscore=0
 adultscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 priorityscore=1501 impostorscore=0 clxscore=1015 bulkscore=0
 mlxlogscore=971 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311060001 definitions=main-2311240074

Document mps mp3326 LED driver devicetree bindings.

Signed-off-by: Yuxi Wang <Yuxi.Wang@monolithicpower.com>
---
 .../devicetree/bindings/leds/mps,mp3326.yaml  | 143 ++++++++++++++++++
 1 file changed, 143 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/mps,mp3326.yaml

diff --git a/Documentation/devicetree/bindings/leds/mps,mp3326.yaml b/Documentation/devicetree/bindings/leds/mps,mp3326.yaml
new file mode 100644
index 000000000000..5f6bde46ccc8
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/mps,mp3326.yaml
@@ -0,0 +1,143 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/mps,mp3326.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MPS MP3326 RGB/White LED Driver
+
+maintainers:
+  - Yuxi Wang <Yuxi.Wang@monolithicpower.com>
+
+description: |
+  The MP3326 is a RGB/White LED driver with I2C interface.
+
+  For more product information please see the link below:
+  https://www.monolithicpower.com/en/products/mp3326.html
+
+properties:
+  compatible:
+    const: mps,mp3326
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+  reg:
+    maxItems: 1
+
+  multi-led:
+    type: object
+    unevaluatedProperties: false
+
+    properties:
+      "#address-cells":
+        const: 1
+
+      "#size-cells":
+        const: 0
+
+      color:
+        description: RGB module
+
+    patternProperties:
+      "^led@[0-3]$":
+        type: object
+        $ref: common.yaml#
+        unevaluatedProperties: false
+
+        properties:
+          reg:
+            description: Index of the LED.
+            minimum: 1
+            maximum: 16
+
+        required:
+          - reg
+          - color
+
+    required:
+      - "#address-cells"
+      - "#size-cells"
+      - color
+
+patternProperties:
+  "^led@[0-9]$":
+    type: object
+    $ref: common.yaml#
+    unevaluatedProperties: false
+
+    properties:
+      reg:
+        description: Index of the LED.
+        minimum: 1
+        maximum: 16
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
+        led-controller@30 {
+            #address-cells = <1>;
+            #size-cells = <0>;
+            compatible = "mps,mp3326";
+            reg = <0x30>;
+            multi-led {
+              #address-cells = <1>;
+              #size-cells = <0>;
+              color = <LED_COLOR_ID_RGB>;
+
+              led@0 {
+                  reg  = <1>;
+                  color = <LED_COLOR_ID_RED>;
+              };
+
+              led@1 {
+                  reg = <2>;
+                  color = <LED_COLOR_ID_GREEN>;
+              };
+
+              led@2 {
+                  reg = <3>;
+                  color = <LED_COLOR_ID_BLUE>;
+              };
+            };
+        };
+    };
+
+  - |
+    #include <dt-bindings/leds/common.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        led-controller@30 {
+            compatible = "mps,mp3326";
+            reg = <0x30>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            led@0 {
+                reg= <5>;
+                color = <LED_COLOR_ID_WHITE>;
+            };
+        };
+    };
+...
-- 
2.25.1


