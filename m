Return-Path: <linux-leds+bounces-8588-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 226uMCCNL2rnCAUAu9opvQ
	(envelope-from <linux-leds+bounces-8588-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 15 Jun 2026 07:26:56 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5411D68373E
	for <lists+linux-leds@lfdr.de>; Mon, 15 Jun 2026 07:26:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=analog.com header.s=DKIM header.b=iuH0FShv;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8588-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-8588-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=analog.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 988B430010F3
	for <lists+linux-leds@lfdr.de>; Mon, 15 Jun 2026 05:26:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01A8B30C155;
	Mon, 15 Jun 2026 05:26:55 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70C6C30C353;
	Mon, 15 Jun 2026 05:26:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781501214; cv=none; b=GvO9HGD/QvE37oPZ5QFZZ8jQXhZwsQpviSyg8bKSThHQnOBnu4RMc3nXo5VOq94xnSDO+LGK+ogpzIU7Y/KWYUh6sX3W6BVi+3yBBU8Btkf9/F6JTPwLXiLa65FFOT9fhsjmXM82zP4oYv6wGAwjVlUOh7RF9EeEcqu1XbLmGBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781501214; c=relaxed/simple;
	bh=HcbCtTzydwxQRz4o8JQhLDSKSZfqA+CLNmXR4MjOXmE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=cWG8UIJJK3Uf7nvViuGHVikhOcwG6RhmilOwinLUIe/nNRm/DO5Nz2qyis0bp7cAEk0K2qgPoRlTE+/9yAMKSRH58M0ccBQqEA2ePGN6BrdLNNCK2Krd1Qle+weoOA4Y/Y60UrWvIDdq7js/Q1CMu1O4Oiu056R0KU1AcjEF6fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=iuH0FShv; arc=none smtp.client-ip=148.163.135.77
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65F1o5in4051954;
	Mon, 15 Jun 2026 01:26:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=g9b5r
	ME6bJV8jhCfKAXNDmWZR8uGAnWo5RC+fUE+9Ps=; b=iuH0FShvUJL4OJwATvMhp
	QO/ZFbl5TVPvBVXwcMA+KB4SutHCJDAy3BjMV5O4xRY9fOKVtxT5Il4PvzpJvmc+
	GIaqIP0D9kiCNnaQID0GnHQWcVdkZYqTiU77RY9VLhnT31OPFY2BFMZMaP2Vnk/R
	1Un2NA2vZ6MbiOsiWuPt4ytB5C7fDAYJUGRLJHpqGFb3joybMAEOMGbXb1V5c/bm
	CvbUtHDyah+tUOcedjy+UUtk+iRFdvoUYlS1bz2r8Sv4xaXW73y9jTvta6udqR8P
	0XX1orSf4hnqdF/lCmqD/kAuuYLN7RrsqnlT9TexbBlvaCi0JZWJii5nrGq5WWks
	g==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4esvww9y2k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Jun 2026 01:26:39 -0400 (EDT)
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 65F5QcW4015007
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 15 Jun 2026 01:26:38 -0400
Received: from ASHBCASHYB4.ad.analog.com (10.64.17.132) by
 ASHBMBX8.ad.analog.com (10.64.17.5) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.37; Mon, 15 Jun 2026 01:26:38 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by
 ASHBCASHYB4.ad.analog.com (10.64.17.132) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.37; Mon, 15 Jun 2026 01:26:37 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.1748.37 via Frontend
 Transport; Mon, 15 Jun 2026 01:26:37 -0400
Received: from HYB-7P5GeKnsiiX.ad.analog.com ([10.118.9.46])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 65F5QJCN012830;
	Mon, 15 Jun 2026 01:26:27 -0400
From: Edelweise Escala <edelweise.escala@analog.com>
Date: Mon, 15 Jun 2026 13:26:08 +0800
Subject: [PATCH v10 1/2] dt-bindings: leds: Add LTC3220 18 channel LED
 Driver
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260615-ltc3220-driver-v10-1-916562c88598@analog.com>
References: <20260615-ltc3220-driver-v10-0-916562c88598@analog.com>
In-Reply-To: <20260615-ltc3220-driver-v10-0-916562c88598@analog.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781501179; l=4823;
 i=edelweise.escala@analog.com; s=20260106; h=from:subject:message-id;
 bh=HcbCtTzydwxQRz4o8JQhLDSKSZfqA+CLNmXR4MjOXmE=;
 b=yoRZM+nfvOuBLKZmSLfufsD9crXYiLu5+i6sLhwLmFwE6PcKsesTRZUrXAfOIfGFUahXk2tZo
 gRsNBVU5GwKDRI9o96EmvXSqLHQQULB8RJulyGFFvv0+kBEb2KDfrWC
X-Developer-Key: i=edelweise.escala@analog.com; a=ed25519;
 pk=lf5HLFe8ZeQjXZgkBkFMK+u9qH5/tqZhCIushTKduNQ=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-GUID: wu3iMBuq--Z_nEVhbFk62pUVcl4bq0RU
X-Proofpoint-ORIG-GUID: wu3iMBuq--Z_nEVhbFk62pUVcl4bq0RU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDA1NCBTYWx0ZWRfXysuE7NC6E9sl
 SgYV+8tiquzE+5i/N+Uc/E7aDwekoVXSPTlkcgdmyeAK24Y1r5oWKzvmnGrXLQt7kRW/RfAyYGp
 cAm4gi/uqCVhG1o51sBkRnsWlLK8u/9swvwjQmwpTmKY5VjmXGGHvNyzA/W3A1EaNGq+XhLQaHN
 vjsVbl7EmNO99KrulJ1rV3TDxnVQCyBVOY9rsk1BRBlaNRB62pNb2mZw9iqrgJbqAR7tPBIhgQF
 Tdeney3HXHcU4wRsn3cNqw+r12zk6Puy9sSYK22Fom3cBcRekGOb0k1zf56VVVznr/42Go8ohoX
 LkJFy3WCc7t6QK9mxzspIbp7GVtUelV41USpGKbISDpGzS6xjBKVu9v7bUCT4fd7zwocCajrleW
 iG63QHEMLMy/F7BSgYqT0dPOXjh/PnocUw36EQTSnfWTJQHjES3O71fB0H/KhG7kmf0TPwDo3Y4
 wWQduCpU83XKl4pZyBw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDA1NCBTYWx0ZWRfX6BIONiXkyaVn
 5S97IlgnFFPszfFXHnJA+1lrSIro6tarrtAfukVFf8xsDANFVA0AnQbfSgkiOobNjK6FiMErO9E
 GI/onsBfovplR0JMQuhe/EjKRsFwjlFhJyR/i4p5fesrUeobeQe2
X-Authority-Analysis: v=2.4 cv=OM0XGyaB c=1 sm=1 tr=0 ts=6a2f8d10 cx=c_pps
 a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=0sLvza09kfJOxVLZPwjg:22 a=Z0pTeXoby7EwIRygza74:22 a=gEfo2CItAAAA:8
 a=gAnH3GRIAAAA:8 a=XYAwZIGsAAAA:8 a=VwQbUJbxAAAA:8 a=_3ORjGfkLmd6W5nxMtsA:9
 a=QEXdDO2ut3YA:10 a=sptkURWiP4Gy88Gu7hUp:22 a=E8ToXWR_bxluHZ7gmE-Z:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_01,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 spamscore=0 phishscore=0
 adultscore=0 priorityscore=1501 clxscore=1015 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606150054
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
	TAGGED_FROM(0.00)[bounces-8588-lists,linux-leds=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[analog.com:url,analog.com:from_mime,analog.com:dkim,analog.com:email,analog.com:mid,vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
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
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5411D68373E

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


