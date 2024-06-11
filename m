Return-Path: <linux-leds+bounces-1870-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CECBE903695
	for <lists+linux-leds@lfdr.de>; Tue, 11 Jun 2024 10:34:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4F9E21F23264
	for <lists+linux-leds@lfdr.de>; Tue, 11 Jun 2024 08:34:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FFD217556F;
	Tue, 11 Jun 2024 08:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=monolithicpower.com header.i=@monolithicpower.com header.b="q2WKmLQ/"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0a-002bf204.pphosted.com (mx0a-002bf204.pphosted.com [205.220.160.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63C03174EE8;
	Tue, 11 Jun 2024 08:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.160.90
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718094823; cv=none; b=DVizwcWFHENSOS9p296dSGvUWA23+PzVRrr1ARLFGa6n10YNr0tvvhQ5N/0bAOyk21q4t2Z8dGPZeIGOIf/NgZQgfszq4Mtpb9HjXXIcgfDxGwBoksdKxr/9VNKKg7gwPukFBdFQ2c7rdSWoSr4+b5g7nTG530IEevK5irQ4x7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718094823; c=relaxed/simple;
	bh=VByCAbJ7MLx1lZmemiE0Z+kxtuGsmPYOeP+2Vp+S2zE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MJBwOawCOa8gZUS58uhaG5fSbQ4xX42wJ9ybPq8GhS8m2+1Y+sjVmZW4CWx8EvxPuL9kKq4p16ygFbVNwCV4TCFe7YwdRtizYghzkJM1brTZ7hHpt0dYIFYnpPadIRNHQ1CSvLgk2L+rUfb9BxqHDcAUtZTHAx05zQwmplEB2Yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=monolithicpower.com; spf=pass smtp.mailfrom=monolithicpower.com; dkim=pass (2048-bit key) header.d=monolithicpower.com header.i=@monolithicpower.com header.b=q2WKmLQ/; arc=none smtp.client-ip=205.220.160.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=monolithicpower.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=monolithicpower.com
Received: from pps.filterd (m0207524.ppops.net [127.0.0.1])
	by mx0a-002bf204.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45B5J2di001124;
	Tue, 11 Jun 2024 01:33:34 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	monolithicpower.com; h=cc:content-transfer-encoding:content-type
	:date:from:in-reply-to:message-id:mime-version:references
	:subject:to; s=pps1; bh=eAqj0fn2SjxsGFSxJrPJnDo5Sw9EaxcRC9z1BwQe
	VsE=; b=q2WKmLQ/Fh1Ic2iDKBFjKYh0LzOWzqonxvYwaF1fApEHBGSY2xHOYL7b
	YGdjtCPIiEvUXexVwsX2IcTrnLzWinSmgjzUJkYLtfdT3YAjwl78bNXP7IajrSCG
	ydr85x4QKM4Z/wLRxsIJgFjf0Z0hhtPh0OcfW0mO3yOJQbp16PIUmlqMCrttAMV8
	irhPtevThBlOfCWrleTLtL+71zIBWirrrMwo0RpgiXm6gkTmMtm4d72Pj/GGYHQc
	QPi2qRySup4gPD/W2qPqaIGo561laM5UNICASKbw2Y6niE5pCb76zdH41NvdX7pa
	9MV6y2EWtNXznJBcfeiCY4sr71orkQ==
Received: from webmail.monolithicpower.com (mps-vpn.monolithicpower.com [12.33.0.20] (may be forged))
	by mx0a-002bf204.pphosted.com (PPS) with ESMTPS id 3ymjqnhg06-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 11 Jun 2024 01:33:34 -0700 (PDT)
Received: from CD-MSH04.monolithicpower.com (10.10.70.213) by
 MPS-MSH04.monolithicpower.com (10.10.10.206) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 11 Jun 2024 01:33:00 -0700
Received: from smtp.gmail.com (10.10.86.102) by CD-MSH04.monolithicpower.com
 (10.10.70.213) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Tue, 11 Jun
 2024 16:32:59 +0800
From: Yuxi Wang <Yuxi.Wang@monolithicpower.com>
To: <Yuxi.Wang@monolithicpower.com>, <pavel@ucw.cz>, <lee@kernel.org>,
        <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <conor+dt@kernel.org>, <wyx137120466@gmail.com>
CC: <linux-leds@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH V2 1/2] dt-bindings: leds: add mps mp3326 LED
Date: Tue, 11 Jun 2024 16:32:34 +0800
Message-ID: <20240611083236.1609-2-Yuxi.Wang@monolithicpower.com>
X-Mailer: git-send-email 2.42.0.windows.2
In-Reply-To: <20240611083236.1609-1-Yuxi.Wang@monolithicpower.com>
References: <20240611083236.1609-1-Yuxi.Wang@monolithicpower.com>
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
X-Proofpoint-GUID: NS1_831byNLwqJbQxf7-Qz-bfS3xtWVm
X-Proofpoint-ORIG-GUID: NS1_831byNLwqJbQxf7-Qz-bfS3xtWVm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-11_04,2024-06-11_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 mlxscore=0
 priorityscore=1501 mlxlogscore=886 spamscore=0 suspectscore=0 phishscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406110064

Document mps mp3326 LED driver devicetree bindings.

Signed-off-by: Yuxi Wang <Yuxi.Wang@monolithicpower.com>

diff --git a/Documentation/devicetree/bindings/leds/mps,mp3326.yaml b/Documentation/devicetree/bindings/leds/mps,mp3326.yaml
new file mode 100644
index 000000000000..09833df692ba
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/mps,mp3326.yaml
@@ -0,0 +1,146 @@
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
+patternProperties:
+  '^multi-led@[0-4]$':
+    type: object
+    $ref: leds-class-multicolor.yaml#
+    unevaluatedProperties: false
+
+    properties:
+      "#address-cells":
+        const: 1
+
+      "#size-cells":
+        const: 0
+      reg:
+        minimum: 0
+        maximum: 4
+        description: Index of the RGB module.
+
+    patternProperties:
+      "^led@[0-9a-f]+$":
+        type: object
+        $ref: common.yaml#
+        unevaluatedProperties: false
+
+        properties:
+          reg:
+            description: Index of the LED.
+            minimum: 0
+            maximum: 15
+
+        required:
+          - reg
+          - color
+
+    required:
+      - "#address-cells"
+      - "#size-cells"
+      - reg
+
+  "^led@[0-9a-f]+$":
+    type: object
+    $ref: common.yaml#
+    unevaluatedProperties: false
+
+    properties:
+      reg:
+        description: Index of the LED.
+        minimum: 0
+        maximum: 15
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
+            multi-led@0 {
+                #address-cells = <1>;
+                #size-cells = <0>;
+                color = <LED_COLOR_ID_RGB>;
+                reg = <0>;
+                label = "multi-led1";
+                led@0 {
+                    reg  = <0>;
+                    color = <LED_COLOR_ID_RED>;
+                };
+
+                led@1 {
+                    reg = <1>;
+                    color = <LED_COLOR_ID_GREEN>;
+                };
+
+                led@2 {
+                    reg = <2>;
+                    color = <LED_COLOR_ID_BLUE>;
+                };
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
+                label = "red0";
+                reg= <0>;
+                color = <LED_COLOR_ID_WHITE>;
+            };
+        };
+    };
-- 
2.39.2


