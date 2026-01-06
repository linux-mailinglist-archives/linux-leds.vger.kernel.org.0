Return-Path: <linux-leds+bounces-6534-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D6BF1CF6C7A
	for <lists+linux-leds@lfdr.de>; Tue, 06 Jan 2026 06:27:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8D3FB301F7CE
	for <lists+linux-leds@lfdr.de>; Tue,  6 Jan 2026 05:27:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEC5C3009C7;
	Tue,  6 Jan 2026 05:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="kf09v8fl"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6EAD3016E1;
	Tue,  6 Jan 2026 05:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767677254; cv=none; b=bdds27LFMTtVogG+rRVKCnHLX7XIrMSlnQM+2E51t3sCnyzF5fSajPp0lh0hFysJ/zUrq5aoltyWVfgRaiIwzFLNvhvPl26IuIUawDI42K6zXhGTKbuZh/G8N1Le9jTGsk7Vsw5AbnSye1paAw2t90B/WYLErQMgqPy8EaNg+K0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767677254; c=relaxed/simple;
	bh=wWy6XVXMKyoNbVQDkJjitMOVNd+SXWPueKiMQhemg5I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=AvqBlVd4Z62Ol4wqMRHyDnWnFu66Rf8HpqzV23ia68VHupPAJBpgELhuPtEhl7uamB6D6+t1wXk99BtTOS3giyRF09/igeLfNbFLq0lIp9ZeXirMc+yow9RzKL28RpJ9T0KWS3n13sNp8JnqXlx0LWhL3WZ8e2noTLIWr+5vCw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=kf09v8fl; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6064UCNe2428927;
	Tue, 6 Jan 2026 00:27:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=PQswp
	2UQ2H2bPCddlObJerrfk/FFc4yjJhv0vFYytDs=; b=kf09v8flkj8rWUWujbQSx
	Mwj7BvSvPahNL91yDZn+a/2p12sTdsQuIlCINTU+EyrCfgAgpU2VVaX0O4K9nIk7
	KZhzDI4RLLUXuZqsn+TkL4W1q4vkny3Y+4uU4DOu8cbI/uk6wQ+22S+xw/5i1Yvd
	O8i/cBdD5f4zz4GUPBg9ZKkKWsbXYawUTdh/JmIoxY1xhz7WPJ8yVud125K+pILv
	pWAkZFeCNb7Tz5GzbHKaKOPG5kDgk5RcTsR8bGeWuzmij0XRo4bbdHbNds7CIDL/
	zCufwmwtrt88zv1x6mjVZRkA53Xe1pU3xCgAn0sdNhGrL7N3UHuzq7G1MAjjIwhy
	Q==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4bggewk03w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Jan 2026 00:27:30 -0500 (EST)
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 6065RT6o021549
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 6 Jan 2026 00:27:29 -0500
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by ASHBMBX9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.37; Tue, 6 Jan
 2026 00:27:28 -0500
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.1748.37 via Frontend
 Transport; Tue, 6 Jan 2026 00:27:28 -0500
Received: from HYB-7P5GeKnsiiX.ad.analog.com (HYB-7P5GeKnsiiX.ad.analog.com [10.118.4.58])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 6065RF6p016126;
	Tue, 6 Jan 2026 00:27:23 -0500
From: Edelweise Escala <edelweise.escala@analog.com>
Date: Tue, 6 Jan 2026 13:27:07 +0800
Subject: [PATCH 1/2] dt-bindings: leds: Document LTC3220 18 channel LED
 Driver
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260106-ltc3220-driver-v1-1-73601d6f1649@analog.com>
References: <20260106-ltc3220-driver-v1-0-73601d6f1649@analog.com>
In-Reply-To: <20260106-ltc3220-driver-v1-0-73601d6f1649@analog.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767677235; l=4811;
 i=edelweise.escala@analog.com; s=20260106; h=from:subject:message-id;
 bh=wWy6XVXMKyoNbVQDkJjitMOVNd+SXWPueKiMQhemg5I=;
 b=fbPDgYwxTwAFnXm4ZIJ63eqRtTYn0FaELVvH1SrUbY5WP7wqCooRXRwh2Mamkrf+HB9UPuGXK
 6KhZlcmJfp/CIH7XMbC4/FKntG0kRKKWtwuYDVSXISPfhDSCsMrjeke
X-Developer-Key: i=edelweise.escala@analog.com; a=ed25519;
 pk=lf5HLFe8ZeQjXZgkBkFMK+u9qH5/tqZhCIushTKduNQ=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Authority-Analysis: v=2.4 cv=O+U0fR9W c=1 sm=1 tr=0 ts=695c9d42 cx=c_pps
 a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=gEfo2CItAAAA:8 a=gAnH3GRIAAAA:8 a=VwQbUJbxAAAA:8 a=aAgv4lQJR7UpHq8YIzQA:9
 a=QEXdDO2ut3YA:10 a=x-rrmlpudb0A:10 a=V5hIW_BCtU8A:10
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: x3wwndvuS6Tdh-40RXdoW1dx5wd6caeV
X-Proofpoint-GUID: x3wwndvuS6Tdh-40RXdoW1dx5wd6caeV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDA0MyBTYWx0ZWRfX/zKs1MYBXzPT
 NVmubOX+tn9d5KNAOf+dXAmRkfGndNzISVGtmXDNFfUQDVB+fN+HqzqBnAfKJlU/dJcWUZe19xJ
 Y132hs8TwH/znut6PKkbKmC7+S7vNehdx+dB3lUrzxRmNIsGzX1D8kq7eqrpobDDcbNXIUe6Zls
 JoEYK9OZvzPE+oXMh7YHRq1tpLbQGvXkrX6Z8hqzBajP2nPtfjhvyhVprDbuRFrGQlfD+swuVth
 rmpDfWr8YDNQQQHrPrPNKivjmVtdDyrASUDZZxQKa4eRvHIV/+VUJRFdtAQ0o7NNpCMRY+TdjzA
 sZvs/JdDTVWpVxINKWvmHFHUvK6Ho1wirUFXdzkpUjMIuaPVqQN57CFAB2KSfqVOZPFijwdyjWa
 IuVkkIxYY1gah7c4gp6WVlAL8VbqwD8R+lrJAC28jDtU4sCqbIre55374SVxn9UYuyCL+ZnK4eN
 6js5zxh75GpQf7iYpZA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_02,2026-01-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 spamscore=0 clxscore=1011 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601060043

Add dt-binding for ltc3220. LTC3220 18 Channel LED driver

Signed-off-by: Edelweise Escala <edelweise.escala@analog.com>
---
 .../devicetree/bindings/leds/leds-ltc3220.yaml     | 131 +++++++++++++++++++++
 MAINTAINERS                                        |   7 ++
 2 files changed, 138 insertions(+)

diff --git a/Documentation/devicetree/bindings/leds/leds-ltc3220.yaml b/Documentation/devicetree/bindings/leds/leds-ltc3220.yaml
new file mode 100644
index 000000000000..33285a7ac7a3
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/leds-ltc3220.yaml
@@ -0,0 +1,131 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/leds-ltc3220.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Analog Devices LTC3220 LED Drivers
+
+maintainers:
+  - Edelweise Escala <edelweise.escala@analog.com>
+
+description: Bindings for the Analog Devices LTC3220 18 channel LED Drivers.
+
+  For more product information please see the link below
+    https://www.analog.com/en/products/ltc3220.html
+
+properties:
+  compatible:
+    enum:
+      - adi,ltc3220
+      - adi,ltc3220-1
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
+    description: GPIO attached to the chip's reset pin
+
+  adi,force-cpo-level:
+    $ref: /schemas/types.yaml#/definitions/string
+    description: Forces the Charge Pump Output to a specified multiplier.
+    enum:
+      - "0" # Auto(default) - Automatically selects optimal charge pump mode
+      - "1.5"
+      - "2"
+      - "1"
+    default: "0"
+
+  adi,quick-write:
+    type: boolean
+    description: If present, LED 1 output becomes a master control that
+      simultaneously updates all 18 LED outputs using the hardware's quick-write
+      mode. When enabled, led@1 must be defined in the device tree to provide
+      the control interface, even if no physical LED is connected to the D1
+      output pin. When disabled or not present, LED 1 operates as a normal
+      independent LED output.
+
+patternProperties:
+  "^led@([1-9]|1[0-8])$":
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
+             adi,force-cpo-level = "0";
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


