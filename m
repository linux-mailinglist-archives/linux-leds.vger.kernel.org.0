Return-Path: <linux-leds+bounces-8609-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 31Q1K8moMGoBWAUAu9opvQ
	(envelope-from <linux-leds+bounces-8609-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Tue, 16 Jun 2026 03:37:13 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 50BE268B4B6
	for <lists+linux-leds@lfdr.de>; Tue, 16 Jun 2026 03:37:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=analog.com header.s=DKIM header.b=tW8ZzOJi;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8609-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-8609-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=analog.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 994A4300F5EB
	for <lists+linux-leds@lfdr.de>; Tue, 16 Jun 2026 01:37:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46F26379EFC;
	Tue, 16 Jun 2026 01:37:12 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA0C737B00E;
	Tue, 16 Jun 2026 01:37:10 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781573832; cv=none; b=iHVKCix/08rE1IP7jN9XY1Nr+orz9ooNy/fVE4xYkk8HaHX+S/mbdy2E9XvZcESHopNaWupvNmPK4y20/nYuSZHkDGXOFcQ7HYTf+hhSE6YiF2S2myLBOLgfcpky31EjidszPABL/1wqrxGxSdms8xp4964l79jJr+kxEtpivks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781573832; c=relaxed/simple;
	bh=HcbCtTzydwxQRz4o8JQhLDSKSZfqA+CLNmXR4MjOXmE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=HpnOZq1/JkTiVWCafOqiGhcOgX4gLKBEVfPi1EP6DDyhwz6cCdViB0OCDFtzd8jvu96sBLptCL+D9bnCVxwf6RzB13o0VfTbWuzHUhjiM0aG3gzAlWRoy4NXBYPv6eQO/rH8u1CKDBVWVVVGFdRfpnAabTbRlr4tORDCcdPNA2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=tW8ZzOJi; arc=none smtp.client-ip=148.163.135.77
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65G0OGFS2592628;
	Mon, 15 Jun 2026 21:37:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=g9b5r
	ME6bJV8jhCfKAXNDmWZR8uGAnWo5RC+fUE+9Ps=; b=tW8ZzOJiPsGWFZvKiLFLN
	75mE+BLDC8Mc9PqecXvGeUPUsJPJScIpiNttHA5WI1913BXSSHvrIboX0ZNv2kMW
	Y2GKGX8mQ1NiGydFmtvrFIksGxEvQ77QfPS9Q18IRq3nYBERkNsyEVeXhJ/o3Nis
	Iy6LetN2DaS4HzlI/F/n9JFDmTQPlKwK3t4gvoAvGZiHiC4WGr//PK1Btf+mQII4
	idt6B9FL0qAWLT9WxP90zJ15q3If6to/8Jqv/jXcwxSz4THvl19x3/aU6PJkP9wu
	iArrRHy0X0oGnwqb2gUp2wcTsL7R02mFIHSFE7ZNzKM49ILWV9gXbqnk03mszu3z
	g==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4etuk6gakm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Jun 2026 21:37:08 -0400 (EDT)
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 65G1b7h4002319
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 15 Jun 2026 21:37:07 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by ASHBMBX9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.37; Mon, 15 Jun
 2026 21:37:07 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.1748.37 via Frontend
 Transport; Mon, 15 Jun 2026 21:37:07 -0400
Received: from HYB-7P5GeKnsiiX.ad.analog.com (HYB-7P5GeKnsiiX.ad.analog.com [10.118.4.70])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 65G1apho005255;
	Mon, 15 Jun 2026 21:36:59 -0400
From: Edelweise Escala <edelweise.escala@analog.com>
Date: Tue, 16 Jun 2026 09:36:43 +0800
Subject: [PATCH v11 1/2] dt-bindings: leds: Add LTC3220 18 channel LED
 Driver
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260616-ltc3220-driver-v11-1-6e51dd97ced6@analog.com>
References: <20260616-ltc3220-driver-v11-0-6e51dd97ced6@analog.com>
In-Reply-To: <20260616-ltc3220-driver-v11-0-6e51dd97ced6@analog.com>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: <linux-leds@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Edelweise Escala
	<edelweise.escala@analog.com>,
        Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781573812; l=4823;
 i=edelweise.escala@analog.com; s=20260106; h=from:subject:message-id;
 bh=HcbCtTzydwxQRz4o8JQhLDSKSZfqA+CLNmXR4MjOXmE=;
 b=vUxKAxIBWq9OkvazTFoak8Ux1X4oJlsdNhohVt5Z8jxxuoLO0VdzZEbCeDhAN6rljUFmsTu62
 Rsbm6fF4xmVC8SN7/yVRs9Oe/ad0GzJLv4FMMh+AhqZKBR20gy7wyDY
X-Developer-Key: i=edelweise.escala@analog.com; a=ed25519;
 pk=lf5HLFe8ZeQjXZgkBkFMK+u9qH5/tqZhCIushTKduNQ=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDAxMyBTYWx0ZWRfX2/2Bjz+WJ7Po
 uF+wiaaYIYn2u1zRbvXV8iCW0XxM43ikWUl03S893KuQZj/W4VhbqaeFcYQg8AiL4ZHw06H3dG6
 HBc0q10T9v7uSfk/Ef+0gqhNH0UPHCMpAllnrOe6R7O3waaGPLhk
X-Authority-Analysis: v=2.4 cv=e+82j6p/ c=1 sm=1 tr=0 ts=6a30a8c4 cx=c_pps
 a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=0sLvza09kfJOxVLZPwjg:22 a=uXIjobp8t2wMuQ0fPvqm:22 a=gEfo2CItAAAA:8
 a=gAnH3GRIAAAA:8 a=XYAwZIGsAAAA:8 a=VwQbUJbxAAAA:8 a=_3ORjGfkLmd6W5nxMtsA:9
 a=QEXdDO2ut3YA:10 a=sptkURWiP4Gy88Gu7hUp:22 a=E8ToXWR_bxluHZ7gmE-Z:22
X-Proofpoint-GUID: FDSQS952rIAz3K38aEQtVyrwGNGuxRkN
X-Proofpoint-ORIG-GUID: FDSQS952rIAz3K38aEQtVyrwGNGuxRkN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDAxMyBTYWx0ZWRfX57WKBV1NW2SH
 DojSMHHunlLBW6LY8RFIPy3CQtTbD6rXyNRxb7/eUUu1stgfKTRvY2xbbyf5QiUeHPXWSVYf4PQ
 HYgNYLvGzPr+t3EGoMfvPfkiJZEJZ9rPuzeyh9B6j8QmmYLocLDHedcnR+MRcE56mAbA+55qG95
 ipWY7iYbHctA5+Ap/eczWmddUWG2ylom0LR2neynAT1FWYVr78J+gNCp+eM+6GnDkY+IxjCgSNb
 2yLSHAfR4NSmgbooL8kviMzdiPgKdK/KmBDAdH7J19QQgq2vqXB1kFASTHEgYhcwg4Munrdu4jn
 Q58HnMV2dJHEqV7OpET27zrciIeW0AN8QrlRP5Rp7WtsLYHXOutSt3oLgty74iaTEtGKmReGxdQ
 xNmuiMoKAdFFIZFmirhKPJVa9q1+ogv+tSV8H+XS43gq6BQSrN2uNvpSMhlUw/LKqynjaajxTFj
 CKeexpJ03nBVU1nGE0w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_01,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 bulkscore=0 suspectscore=0 spamscore=0
 adultscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160013
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[analog.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[analog.com:s=DKIM];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8609-lists,linux-leds=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,microchip.com:email,analog.com:url,analog.com:from_mime,analog.com:dkim,analog.com:email,analog.com:mid,devicetree.org:url];
	FORGED_SENDER(0.00)[edelweise.escala@analog.com,linux-leds@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:pavel@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-leds@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:edelweise.escala@analog.com,m:conor.dooley@microchip.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[analog.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[edelweise.escala@analog.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 50BE268B4B6

LTC3220 is a multi-display LED driver with I2C interface.
The LTC3220 provides individual brightness control (64-step),
blinking, and gradation features for up to 18 LED outputs.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Edelweise Escala <edelweise.escala@analog.com>
---
 .../devicetree/bindings/leds/adi,ltc3220.yaml      | 131 +++++++++++++++++++++
 MAINTAINERS                                        |   7 ++
 2 files changed, 138 insertions(+)

diff --git a/Documentation/devicetree/bindings/leds/adi,ltc3220.yaml b/Documentation/devicetree/bindings/leds/adi,ltc3220.yaml
new file mode 100644
index 000000000000..c859490e9108
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/adi,ltc3220.yaml
@@ -0,0 +1,131 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/adi,ltc3220.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Analog Devices LTC3220 LED Driver
+
+maintainers:
+  - Edelweise Escala <edelweise.escala@analog.com>
+
+description: >
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
+  '^led@([1-9a-f]|1[0-2])$':
+    type: object
+    $ref: /schemas/leds/common.yaml#
+    unevaluatedProperties: false
+    properties:
+      reg:
+        description:
+          Output channel for the LED (1-18 maps to LED outputs D1-D18).
+          Unit-address must be in hexadecimal (1-12 hex = 1-18 decimal).
+          For aggregated LED control, define only one LED node with reg = <0x1>
+          and use led-sources to list all controlled outputs. Only reg 1 should
+          be present when using led-sources.
+        minimum: 1
+        maximum: 18
+
+    required:
+      - reg
+
+    if:
+      required:
+        - led-sources
+    then:
+      properties:
+        reg:
+          const: 1
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
+                reg = <0x1>;
+                function = LED_FUNCTION_INDICATOR;
+                function-enumerator = <1>;
+            };
+
+            led@2 {
+                reg = <0x2>;
+                function = LED_FUNCTION_INDICATOR;
+                function-enumerator = <2>;
+            };
+
+            led@3 {
+                reg = <0x3>;
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
+                reg = <0x1>;
+                led-sources = <0x1 0x2 0x3 0x4 0x5 0x6 0x7 0x8 0x9 0xa 0xb 0xc 0xd 0xe 0xf 0x10 0x11 0x12>;
+                function = LED_FUNCTION_BACKLIGHT;
+            };
+        };
+    };
+
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 2fb1c75afd16..c8a242577d2f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15223,6 +15223,13 @@ W:	https://ez.analog.com/linux-software-drivers
 F:	Documentation/devicetree/bindings/iio/temperature/adi,ltc2983.yaml
 F:	drivers/iio/temperature/ltc2983.c
 
+LTC3220 LED DRIVER
+M:	Edelweise Escala <edelweise.escala@analog.com>
+L:	linux-leds@vger.kernel.org
+S:	Maintained
+W:	https://ez.analog.com/linux-software-drivers
+F:	Documentation/devicetree/bindings/leds/adi,ltc3220.yaml
+
 LTC4282 HARDWARE MONITOR DRIVER
 M:	Nuno Sa <nuno.sa@analog.com>
 L:	linux-hwmon@vger.kernel.org

-- 
2.43.0


