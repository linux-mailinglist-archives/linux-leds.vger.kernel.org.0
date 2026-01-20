Return-Path: <linux-leds+bounces-6680-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id A589AD3BED6
	for <lists+linux-leds@lfdr.de>; Tue, 20 Jan 2026 06:36:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id F156A4EACFD
	for <lists+linux-leds@lfdr.de>; Tue, 20 Jan 2026 05:36:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D25C3624B5;
	Tue, 20 Jan 2026 05:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="ZWhQaNBo"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A910233B979;
	Tue, 20 Jan 2026 05:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768887369; cv=none; b=cBUnbc7mW05vMdUwBYrsBO9yTapIsIOr+0oASjJNUzJr76czLsp79iZT8zvTAB+ayblTLAHnGHlDUYF+H5DE6x8sV4ar7h5tB8rfTCk3SSpPga949AMUmOIPYIZ20yhVOiNf4G40LP5TwHyB5jlmHuY3epSq4f0RezKwAE3/Lcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768887369; c=relaxed/simple;
	bh=izkRFsImJONs8OBbxSdbRp2xmeL4H3dT0luy9Pi9y08=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=KyCqbNhTrsI3ADaJ1kippnMVzRwbnFWychLrd5hY8rQASwrmFgfCyrrF442nU8H0/IF/pDEq/lph2JsuSxMkPql+QVJ9RKP/tNpvk1BfPw2bkkt48w0bm1az1RAUR+IeM10QBK+zHXHtUnD8DW+SuHj5R+Xbdwh+xxKK4JSXqck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=ZWhQaNBo; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0516787.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60K41cwq1848537;
	Tue, 20 Jan 2026 00:36:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=zLwcD
	VN/F8jeZaH43J8p7gIj6v8QkI4QWVaDqP55ADY=; b=ZWhQaNBoq9/tRbjtKNH93
	ATWeZeUi1thOA92/6y/ydFfOD0HEISpEafPmKyDizLpEmcTQmDPJjuNTk06rTsGs
	7CHKf6DzhyWs8d7xxhOT+GPY2plQbLeAR959NoJIldXl/DtiM/E6fi7CRCkTE/1+
	Ee1+pc5v0D/MS9gXZ4PkkBpo5RU2s4WG6VDyWyaUzUMQfgh+cTyDN864XgTYhGzt
	QYVNOVZGGlgEx4PKIOsgEnbbTc5t85Bmhp3twbyGvCEhHV3Fbbpw+qsISiI38Gy/
	MpRWbQvWDv90Bt65TdoDVuarkGUWmRQgOAIK915cjEuR8oU3JpmfiVS1cq3Rs97q
	Q==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4bt2ar88ge-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 Jan 2026 00:35:59 -0500 (EST)
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 60K5ZwhV049143
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 20 Jan 2026 00:35:58 -0500
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by ASHBMBX8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.37; Tue, 20 Jan
 2026 00:35:58 -0500
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.2.1748.37 via Frontend
 Transport; Tue, 20 Jan 2026 00:35:58 -0500
Received: from HYB-7P5GeKnsiiX.ad.analog.com (HYB-7P5GeKnsiiX.ad.analog.com [10.118.4.31])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 60K5ZhRI026625;
	Tue, 20 Jan 2026 00:35:51 -0500
From: Edelweise Escala <edelweise.escala@analog.com>
Date: Tue, 20 Jan 2026 13:35:06 +0800
Subject: [PATCH v3 1/2] dt-bindings: leds: Add LTC3220 18 channel LED
 Driver
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260120-ltc3220-driver-v3-1-fef612ec4faa@analog.com>
References: <20260120-ltc3220-driver-v3-0-fef612ec4faa@analog.com>
In-Reply-To: <20260120-ltc3220-driver-v3-0-fef612ec4faa@analog.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768887343; l=4474;
 i=edelweise.escala@analog.com; s=20260106; h=from:subject:message-id;
 bh=izkRFsImJONs8OBbxSdbRp2xmeL4H3dT0luy9Pi9y08=;
 b=Js8SabTvoF0e+1UJOFCrO6s7sDKoi6/L0RNoV++xKY6Jrd7MARWJuTrP65XKWUXFq303PlsDK
 P+a9RJmDhZFDuavwdibDx4C1YwrPN3DSDVdYdzmN/rgUTr842da+uCF
X-Developer-Key: i=edelweise.escala@analog.com; a=ed25519;
 pk=lf5HLFe8ZeQjXZgkBkFMK+u9qH5/tqZhCIushTKduNQ=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDA0NCBTYWx0ZWRfXyksW+Q6CyHdL
 XYmqbvHY6kbFlx0PDqOEDkQ4HwygG57spL+LI4SwXgQ7/hLuwhS1By/FhJdEAzlmQp+45mY4lrr
 ppE57Yj0GqNHuuZ8hxV2FMxf3rVnPfp+gRXlKlNyStG6ZnIY//4pKWN0OBvRtfdiJ+TWxptE417
 lYIzlOAvyiay6HMFgbXINuZIWh6/4k0e+S2C9h+ptP+E+dEPmCPmLxoVXLQomagIMlmDIlFyGST
 9oFZj3eSr/ahd1bq/FeMYBao2CrSbil5l3uc86gv9y8JUyF6b7XcQ0QeuArncQCmpDTpHk3ukbY
 45Lvb07aj15YPQiYuRM8UjuC4Ug3NmScnU3gROHBTN5oXSoSxfvssntU1rEBn2obh/lB8v8lPtc
 Iln5p2cRMPzZhzPJuO2/1xq0raLeGAEKkmgUFl8H8hsvxWQf8T8pn8F78Iw/lrHkvLH/8QZeLpG
 zwZYHmwIjzWq3kKtDLg==
X-Proofpoint-ORIG-GUID: laBGse7uJr6N477fP46_flyoUosyNT70
X-Proofpoint-GUID: laBGse7uJr6N477fP46_flyoUosyNT70
X-Authority-Analysis: v=2.4 cv=Q+DfIo2a c=1 sm=1 tr=0 ts=696f143f cx=c_pps
 a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=gEfo2CItAAAA:8 a=gAnH3GRIAAAA:8 a=VwQbUJbxAAAA:8 a=_3ORjGfkLmd6W5nxMtsA:9
 a=QEXdDO2ut3YA:10 a=x-rrmlpudb0A:10 a=V5hIW_BCtU8A:10
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-20_01,2026-01-19_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 impostorscore=0 malwarescore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601200044

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
index 000000000000..6274c6c6ad79
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
+patternProperties:
+  '^led@([1-9]|1[0-8])$':
+    type: object
+    $ref: /schemas/leds/common.yaml#
+    unevaluatedProperties: false
+    properties:
+      reg:
+        description:
+          Output channel for the LED (1-18 maps to LED outputs D1-D18).
+          For aggregated LED control, define only one LED node with reg = <1>
+          and use led-sources to list all controlled outputs. Only reg 1 should
+          be present when using led-sources.
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
+    // Independent LEDs
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/leds/common.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        led-controller@1c {
+            compatible = "adi,ltc3220";
+            reg = <0x1c>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+            reset-gpios = <&gpio 17 GPIO_ACTIVE_LOW>;
+
+            led@1 {
+                reg = <1>;
+                function = LED_FUNCTION_INDICATOR;
+                function-enumerator = <1>;
+            };
+
+            led@2 {
+                reg = <2>;
+                function = LED_FUNCTION_INDICATOR;
+                function-enumerator = <2>;
+            };
+
+            led@3 {
+                reg = <3>;
+                function = LED_FUNCTION_INDICATOR;
+                function-enumerator = <3>;
+            };
+        };
+    };
+
+  - |
+    // Aggregated LED
+    #include <dt-bindings/leds/common.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        led-controller@1c {
+            compatible = "adi,ltc3220";
+            reg = <0x1c>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            led@1 {
+                reg = <1>;
+                led-sources = <1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18>;
+                function = LED_FUNCTION_BACKLIGHT;
+            };
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


