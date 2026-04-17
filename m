Return-Path: <linux-leds+bounces-7751-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8NWiGbgA4mna0QAAu9opvQ
	(envelope-from <linux-leds+bounces-7751-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 17 Apr 2026 11:43:20 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EED64419773
	for <lists+linux-leds@lfdr.de>; Fri, 17 Apr 2026 11:43:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4DD4530886E1
	for <lists+linux-leds@lfdr.de>; Fri, 17 Apr 2026 09:42:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0FEC3AE719;
	Fri, 17 Apr 2026 09:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="UORnepOo"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7F2B3AE6FE;
	Fri, 17 Apr 2026 09:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776418976; cv=none; b=mW30QvD52on0mmJTDQoNQ0wJCClfb9nRREmfAlTyBazryWveOE3u2YSquu8ATpU+Qg9Yvo7Jjehu6or8RUinGSU0EsRV+VriVUYgVS9Vh9x9Fm76X9Z+W9RGCEPxFGqq4M6G/rlizhYhdvQR45BwEUm6XJjBpccqsYkPfB6GhFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776418976; c=relaxed/simple;
	bh=UlhgypxQWSJ6BAtj1Y1KqwRX8sSw2KVSWpKmviQSTLE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=ZbNQZNaFa6Ac9i1/lnEj2i4zYQWPRj59JV+ykckOVFPYIChLPpHWAb5rPV1dVsW782Kd44wE8WcRPC+5t7Jo9yw9U/lc+z7YXtyOEAgmgadvTNDdJWYvO3YYYfXp9QHI8r8wUSwswIiE5uB/O0wfp0UwkM9Wvr/A+4RUzO/vsjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=UORnepOo; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63H7MA6X1700016;
	Fri, 17 Apr 2026 05:42:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=TNv1h
	Hto5vKpMwFbNRzH4UiYNtALB/0CLdD1n21DEAg=; b=UORnepOo5qXgkyyjlCHPg
	dxliTDsV+2bEZt0AP7XYE8lSgS5uSZEWKH6mJVFqJ9XfPEdhAEEo3fuqkwjan0Hy
	LUgLXKYNNwk5F1Z7/M/ksd4XrobbakxK+lRpEYh+PtB7mFHX730CjcfYG5mqSbrq
	K8+BGcxdlOvGvCIdiMygVbefYZQtZ9pqSwZfCsLmCcpyJxFIz2gqkqFK1lXUWtQc
	m3XBJbflchsDEuchUTlKh/919WspIGmoQyxu+YL098YTMDLdBJrRxZim8oDyBEJ1
	xYUONlOA7wGDy2+q4PWfvvFoY3ntE2734MsnvyAChPJLo9uGc+db+bfQHwsVITek
	w==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4dk4cm2sd9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Apr 2026 05:42:51 -0400 (EDT)
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 63H9gol8019664
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 17 Apr 2026 05:42:50 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by ASHBMBX8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.37; Fri, 17 Apr
 2026 05:42:50 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.1748.37 via Frontend
 Transport; Fri, 17 Apr 2026 05:42:50 -0400
Received: from HYB-7P5GeKnsiiX.ad.analog.com ([10.118.4.168])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 63H9gZIi000824;
	Fri, 17 Apr 2026 05:42:43 -0400
From: Edelweise Escala <edelweise.escala@analog.com>
Date: Fri, 17 Apr 2026 17:42:27 +0800
Subject: [PATCH v6 1/2] dt-bindings: leds: Add LTC3220 18 channel LED
 Driver
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260417-ltc3220-driver-v6-1-18157871eddd@analog.com>
References: <20260417-ltc3220-driver-v6-0-18157871eddd@analog.com>
In-Reply-To: <20260417-ltc3220-driver-v6-0-18157871eddd@analog.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776418955; l=4537;
 i=edelweise.escala@analog.com; s=20260106; h=from:subject:message-id;
 bh=UlhgypxQWSJ6BAtj1Y1KqwRX8sSw2KVSWpKmviQSTLE=;
 b=JKl2lSGxNMIlpuPRfZgcahwhTfLc0wTht+I6fGbcu9M31vkYBH1q+u0QWvZtdoSfx0fsLraNK
 LuMyohVtG94AubHcO67sIac+5ckNHI+kIWukJYNtme47YCmJDpzJc31
X-Developer-Key: i=edelweise.escala@analog.com; a=ed25519;
 pk=lf5HLFe8ZeQjXZgkBkFMK+u9qH5/tqZhCIushTKduNQ=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Authority-Analysis: v=2.4 cv=dpDrzVg4 c=1 sm=1 tr=0 ts=69e2009c cx=c_pps
 a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=0sLvza09kfJOxVLZPwjg:22 a=uXIjobp8t2wMuQ0fPvqm:22 a=gEfo2CItAAAA:8
 a=gAnH3GRIAAAA:8 a=XYAwZIGsAAAA:8 a=VwQbUJbxAAAA:8 a=_3ORjGfkLmd6W5nxMtsA:9
 a=QEXdDO2ut3YA:10 a=sptkURWiP4Gy88Gu7hUp:22 a=E8ToXWR_bxluHZ7gmE-Z:22
X-Proofpoint-ORIG-GUID: LXC3ciTaMiPzKw-H8tUA9h6fONrF8M3C
X-Proofpoint-GUID: LXC3ciTaMiPzKw-H8tUA9h6fONrF8M3C
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE3MDA5NiBTYWx0ZWRfX+2aY9C+BkfZO
 mcCLTHb0aSnjV15FGQqjGc9WrpWQzrNfSQoaFkL+4AjeVZek91uoTQFVmlbwLEBl0o4GpOBj86y
 HI4/GaEzm5A7AyZQYg/+xH9GC9V3NN9pyhsdkseLNT5fuX19YR9kxA1IkUM7/JcK9rGjxfvzACt
 5Rv3QC1sSP3l1CxJ23V67lB+kBhwMjKdgAr1WjfD4y2NqUem3gkRC4ldebQBOw4ev0Xw3WphTVK
 3wwGVUFIAfh9VCRR0c/XRj64EFs9CNzzAzg9tuOUDx4PWfSQUQ7a8kKXjaUNgVuQjJqJpOkN+1a
 R9AfodAe3JZmUkc2XpWG+9t/osO2+VD8hFsDahioj7LVUE6uEZaighj1KInr6EMoYK9dKE94d+i
 FUV8z0EaeIbVPqxKLD1bIK+HF6hluIq7jdkScwqK82H3Sh2YlaJHn9+iq/Vi2dTt3pfVUQzNRWS
 kfWgaid/Yjx1wmB7Ehg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_04,2026-04-16_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 clxscore=1015 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604170096
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[analog.com,quarantine];
	R_DKIM_ALLOW(-0.20)[analog.com:s=DKIM];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[analog.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-7751-lists,linux-leds=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,analog.com:mid,analog.com:email,analog.com:dkim,analog.com:url,1c:email,microchip.com:email,devicetree.org:url,0.0.0.1:email];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[edelweise.escala@analog.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.3:email,0.0.0.2:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: EED64419773
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

LTC3220 is a multi-display LED driver with I2C interface.
The LTC3220 provides individual brightness control (64-step),
blinking, and gradation features for up to 18 LED outputs.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Edelweise Escala <edelweise.escala@analog.com>
---
 .../devicetree/bindings/leds/adi,ltc3220.yaml      | 120 +++++++++++++++++++++
 MAINTAINERS                                        |   7 ++
 2 files changed, 127 insertions(+)

diff --git a/Documentation/devicetree/bindings/leds/adi,ltc3220.yaml b/Documentation/devicetree/bindings/leds/adi,ltc3220.yaml
new file mode 100644
index 000000000000..62f760d517aa
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/adi,ltc3220.yaml
@@ -0,0 +1,120 @@
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
index 327d74ca7ecb..5c10cc3e3022 100644
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
+F:	Documentation/devicetree/bindings/leds/adi,ltc3220.yaml
+
 LTC4282 HARDWARE MONITOR DRIVER
 M:	Nuno Sa <nuno.sa@analog.com>
 L:	linux-hwmon@vger.kernel.org

-- 
2.43.0


