Return-Path: <linux-leds+bounces-6623-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0445DD115EA
	for <lists+linux-leds@lfdr.de>; Mon, 12 Jan 2026 10:00:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A1E973073FA4
	for <lists+linux-leds@lfdr.de>; Mon, 12 Jan 2026 09:00:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FAD3346ADD;
	Mon, 12 Jan 2026 09:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="EBD92MpM"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0b-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE777259C92;
	Mon, 12 Jan 2026 09:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768208419; cv=none; b=K/fmjceDiv9A9xwxdRPS8hsf/H3NC4WZ2N4roGOr+qNB1QIIqCUl3Xe6aPAITG52RgAbUMDeqVQaUWbO9lEpeMZAoKJhF0WZ/jke8ZyQ4SQVWywbENThC4MXERqRDPerdG4wf6m3ezHYMEljrv7TtAMug7tewfNKSZd8PCTKlYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768208419; c=relaxed/simple;
	bh=QL4bvOllcYfFnZ3YwU1Jt1/TtY1DPh0Tp5ovJN6IKFs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=dXGGO42hIYbyQ4NUt77XgKG5IE49wnw/cuHMd47W8g7l8FQ1OU+K6Ar0bf4yKMKmInzrY/SVMEfCmWT/MPLQMnGy9PrGxuCGajE1QnX24eNskI7DNdh6XZo6HohraOaEWBrmEGeLxnUW+p4fU5yBUferduddq9csE672zhF0j6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=EBD92MpM; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0375855.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60C7oFte1467064;
	Mon, 12 Jan 2026 04:00:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=QkfkE
	oeMdNY8mxTmc9abf+nWfz3JwaeGDQs2U+QgKY0=; b=EBD92MpMWIL0Tp2VOfdbA
	bfefS9nfoAGyJpD4MfIH4tzTGPhf9ZLI+XoYUad1T9u0lU2FachhZ+MK0k4+CS+h
	rq9z/3a+tgLvDg/gsB9bTYVuy/813creCa6G1oljH5216HZPVSua5KTbi/0ftBet
	lKR+nmndXUfZGeDqfFbaKs5LbMzXK05slgfx+5rN6qNrzkBSSJuV2nEy6NWfqleB
	NYshs0UHpGKXI9yHJYhs8jhpmhMwGovVJkkD26meAJnlI0dJqomgHP+8aCSLfMjf
	yX0xzMIwUrS5dQcwm/zxFM+DHxY7xma2B22+QDOD8jUVrg261cVXc1/LKQMzmIcd
	Q==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 4bmvwqgcb7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 Jan 2026 04:00:07 -0500 (EST)
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 60C906F7016177
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 12 Jan 2026 04:00:06 -0500
Received: from ASHBCASHYB4.ad.analog.com (10.64.17.132) by
 ASHBMBX9.ad.analog.com (10.64.17.10) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.37; Mon, 12 Jan 2026 04:00:06 -0500
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by
 ASHBCASHYB4.ad.analog.com (10.64.17.132) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.37; Mon, 12 Jan 2026 04:00:06 -0500
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.2.1748.37 via Frontend
 Transport; Mon, 12 Jan 2026 04:00:06 -0500
Received: from HYB-7P5GeKnsiiX.ad.analog.com (HYB-dSnw7wZQW59.ad.analog.com [10.118.4.152] (may be forged))
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 60C8xn3E027902;
	Mon, 12 Jan 2026 03:59:57 -0500
From: Edelweise Escala <edelweise.escala@analog.com>
Date: Mon, 12 Jan 2026 16:55:54 +0800
Subject: [PATCH v2 1/2] dt-bindings: leds: Add LTC3220 18 channel LED
 Driver
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260112-ltc3220-driver-v2-1-d043058fc4df@analog.com>
References: <20260112-ltc3220-driver-v2-0-d043058fc4df@analog.com>
In-Reply-To: <20260112-ltc3220-driver-v2-0-d043058fc4df@analog.com>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: <linux-leds@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Edelweise Escala
	<edelweise.escala@analog.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768208389; l=4583;
 i=edelweise.escala@analog.com; s=20260106; h=from:subject:message-id;
 bh=QL4bvOllcYfFnZ3YwU1Jt1/TtY1DPh0Tp5ovJN6IKFs=;
 b=DMT55WW3Y8Oi01o9tOlSwN5Oz83vDtV7Opnz8bsTr9W11sV4Goabtom+nPk252xRG+sSMWmUt
 NR4GT2LHgxoBi82AYEscugYNcsCVjiU6ESG4Q4ZjWTdIB5JuzgnAsGt
X-Developer-Key: i=edelweise.escala@analog.com; a=ed25519;
 pk=lf5HLFe8ZeQjXZgkBkFMK+u9qH5/tqZhCIushTKduNQ=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-ORIG-GUID: B0ZiVgBHcf2DId3_6xcW6e8YdmAdZoQS
X-Authority-Analysis: v=2.4 cv=X5tf6WTe c=1 sm=1 tr=0 ts=6964b817 cx=c_pps
 a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=gEfo2CItAAAA:8 a=gAnH3GRIAAAA:8 a=VwQbUJbxAAAA:8 a=_3ORjGfkLmd6W5nxMtsA:9
 a=QEXdDO2ut3YA:10 a=x-rrmlpudb0A:10 a=V5hIW_BCtU8A:10
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDA3MCBTYWx0ZWRfXz0mczKCwxt65
 LAPnRh5eoAW4wztDleb7DqCpchZJleGxIANza5mR9LyVeFa+WSvchQ4HBu5Ta7uVzjbhjfUifje
 Xf7fyVE+wMrvCXhrXpEG8ts7SJAMcn8y//+UBZ2I5lmUsqJBsrOlwJykQnsl/TwGsh5auc0tqNw
 0d1ifdjGYZa3I+ztveTm2NIt2Z+DoDU3HAbVMNfHSlJh/J+D16DxkoHRT0drFPMULkfWp6pq7X5
 cTpK748D3qaAY5tiFIe3Ox8P1RRm98jYKF8N7lU4922s+/MTpoPd01fCw2Tul1GCMiXa6qoDcRc
 85ePXXiLDcCPCYtVXnpnWSt3+HPUUbEAwBFzaOUzUvcW84VS6zYVWm4sbslaYZPqeUUW5iG9gPH
 o8PvAFL9p1u2nD4yAQJfuWcH6HKb4gVKaLz85V3cn4ZmBKD65hhH95nDJZ65s+2KV7AlWw9sOs0
 3Q5KWfiSfomHzgMnLmw==
X-Proofpoint-GUID: B0ZiVgBHcf2DId3_6xcW6e8YdmAdZoQS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_02,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 bulkscore=0 priorityscore=1501 suspectscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601120070

Document device tree bindings for the LTC3220 18-channel LED driver
with I2C interface, individual brightness control, and hardware-assisted
blink/gradation features.

Signed-off-by: Edelweise Escala <edelweise.escala@analog.com>
---
 .../devicetree/bindings/leds/leds-ltc3220.yaml     | 120 +++++++++++++++++++++
 MAINTAINERS                                        |   7 ++
 2 files changed, 127 insertions(+)

diff --git a/Documentation/devicetree/bindings/leds/leds-ltc3220.yaml b/Documentation/devicetree/bindings/leds/leds-ltc3220.yaml
new file mode 100644
index 000000000000..d0af38547b28
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/leds-ltc3220.yaml
@@ -0,0 +1,120 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/leds-ltc3220.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Analog Devices LTC3220 LED Driver
+
+maintainers:
+  - Edelweise Escala <edelweise.escala@analog.com>
+
+description:
+  The LTC3220 is a multi-display LED driver, which contains a high-efficiency,
+  low-noise charge pump to provide power to up to 18 LED current sources.
+  The LEDs are individually configurable to 64-step linear brightness control,
+  blinking and gradation control via 2-wire I2C interface.
+
+  For more product information please see the link below
+    https://www.analog.com/en/products/ltc3220.html
+
+properties:
+  compatible:
+    const: adi,ltc3220
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
+  reset-gpios:
+    maxItems: 1
+
+  adi,quick-write:
+    type: boolean
+    description:
+      Enables the hardware quick-write feature where a write to the LED 1
+      output register simultaneously updates all 18 LED output registers
+      to the same value. Only applicable when LED 1 output is physically
+      present and defined in the device tree.
+
+patternProperties:
+  '^led@([1-9]|1[0-8])$':
+    type: object
+    $ref: /schemas/leds/common.yaml#
+    unevaluatedProperties: false
+    properties:
+      reg:
+        description: Output channel for the LED (1-18 maps to LED outputs D1-D18).
+        minimum: 1
+        maximum: 18
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
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/leds/common.h>
+
+    i2c {
+       #address-cells = <1>;
+       #size-cells = <0>;
+
+       led-controller@1c {
+             compatible = "adi,ltc3220";
+             reg = <0x1c>;
+             #address-cells = <1>;
+             #size-cells = <0>;
+             reset-gpios = <&gpio 17 GPIO_ACTIVE_LOW>;
+             adi,quick-write;
+
+             led@1 {
+                 reg = <1>;
+                 function = LED_FUNCTION_INDICATOR;
+                 function-enumerator = <1>;
+             };
+
+             led@2 {
+                 reg = <2>;
+                 function = LED_FUNCTION_INDICATOR;
+                 function-enumerator = <2>;
+             };
+
+             led@3 {
+                 reg = <3>;
+                 function = LED_FUNCTION_INDICATOR;
+                 function-enumerator = <3>;
+             };
+
+             led@4 {
+                 reg = <4>;
+                 function = LED_FUNCTION_INDICATOR;
+                 function-enumerator = <4>;
+             };
+
+             led@5 {
+                 reg = <5>;
+                 function = LED_FUNCTION_INDICATOR;
+                 function-enumerator = <5>;
+             };
+
+             led@6 {
+                 reg = <6>;
+                 function = LED_FUNCTION_INDICATOR;
+                 function-enumerator = <6>;
+             };
+        };
+    };
+
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 327d74ca7ecb..d640c35d1f93 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14955,6 +14955,13 @@ W:	https://ez.analog.com/linux-software-drivers
 F:	Documentation/devicetree/bindings/iio/temperature/adi,ltc2983.yaml
 F:	drivers/iio/temperature/ltc2983.c
 
+LTC3220 LED DRIVER
+M:	Edelweise Escala <edelweise.escala@analog.com>
+L:	linux-leds@vger.kernel.org
+S:	Maintained
+W:	https://ez.analog.com/linux-software-drivers
+F:	Documentation/devicetree/bindings/leds/leds-ltc3220.yaml
+
 LTC4282 HARDWARE MONITOR DRIVER
 M:	Nuno Sa <nuno.sa@analog.com>
 L:	linux-hwmon@vger.kernel.org

-- 
2.43.0


