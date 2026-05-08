Return-Path: <linux-leds+bounces-8045-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UMWZHkBi/WkJcwAAu9opvQ
	(envelope-from <linux-leds+bounces-8045-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 08 May 2026 06:10:40 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DD7BC4F1610
	for <lists+linux-leds@lfdr.de>; Fri, 08 May 2026 06:10:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7EFF6302B3B3
	for <lists+linux-leds@lfdr.de>; Fri,  8 May 2026 04:10:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FCC93264DD;
	Fri,  8 May 2026 04:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="oQlLOVzY"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB4CC327BFB;
	Fri,  8 May 2026 04:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778213415; cv=none; b=LcNfkBsNZWCN5Io+lcqazPQOQ8+btBwkda6OQ4wXYe3SbfTwNec0alJMQOex/9Z6bTfo1dVTfPsMecnIKv0vNZIdse6rl0XvQK5a115z3ax24onlITiIS0T2PgYziwpAY84nRksGGyywiE4WjatJNePYo20CEnUmXdxtzVSjI4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778213415; c=relaxed/simple;
	bh=UlhgypxQWSJ6BAtj1Y1KqwRX8sSw2KVSWpKmviQSTLE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=GpPngxs4UPkFhAGJ3aJ13EmPE8jZcvQHjK+L17jwfltg1D7/jyazb2mCz06ZkBYTdhsT/8+u0+4oc9HUGUnrZKWjF9+dWDuRg5VJGQWe8Nd7dEdUBaWnn7RglfxzxW2ou/1nj/dbwk67xHv50MnfKLXFkzs44+2iBEwXA7XJl+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=oQlLOVzY; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6483vatS2003066;
	Fri, 8 May 2026 00:10:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=TNv1h
	Hto5vKpMwFbNRzH4UiYNtALB/0CLdD1n21DEAg=; b=oQlLOVzYjU+Q3GGxDBNyo
	kZOjeB9qYIEmVX2ZYr7ES1/VhZniI75UtwsSxvTqMPJsFGP3a6ZZUkLS2JWMoVFE
	S8vE1SgCyolHgqgYSszYhBSL5H5WXh0HsqBMyKr2LSP+zkz4SQ78UeUk4FozSD23
	3xsfWAs4D2KQfi5M6yY4PyYctw8b3iM6krwDsOOXIs/ww26WprywIMlS9mQIOL/Q
	VE8nGL+zUJEGsNGlwFmckdrj3CNKAqfHZuID2hNIrNY9sH/mZlRXn/GcUQniT+tk
	wFmU0dk0s+yAVfEyy2pEiHWaDp/K1TWdFDJygPRNuSDfRaO0gpqi+goR3P2a7Ato
	w==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4dyv3ra85j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 08 May 2026 00:10:08 -0400 (EDT)
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 6484A7NR039209
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 8 May 2026 00:10:07 -0400
Received: from ASHBCASHYB5.ad.analog.com (10.64.17.133) by
 ASHBMBX8.ad.analog.com (10.64.17.5) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.37; Fri, 8 May 2026 00:10:07 -0400
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by
 ASHBCASHYB5.ad.analog.com (10.64.17.133) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.37; Fri, 8 May 2026 00:10:07 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.2.1748.37 via Frontend
 Transport; Fri, 8 May 2026 00:10:07 -0400
Received: from HYB-7P5GeKnsiiX.ad.analog.com (HYB-7P5GeKnsiiX.ad.analog.com [10.118.4.71])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 64849pqp001480;
	Fri, 8 May 2026 00:10:00 -0400
From: Edelweise Escala <edelweise.escala@analog.com>
Date: Fri, 8 May 2026 12:09:49 +0800
Subject: [PATCH v7 1/2] dt-bindings: leds: Add LTC3220 18 channel LED
 Driver
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260508-ltc3220-driver-v7-1-0f092ba54f23@analog.com>
References: <20260508-ltc3220-driver-v7-0-0f092ba54f23@analog.com>
In-Reply-To: <20260508-ltc3220-driver-v7-0-0f092ba54f23@analog.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778213392; l=4537;
 i=edelweise.escala@analog.com; s=20260106; h=from:subject:message-id;
 bh=UlhgypxQWSJ6BAtj1Y1KqwRX8sSw2KVSWpKmviQSTLE=;
 b=sakb1uXwwMSwWEHlWqMcGMIqr1wcuZQg2EdLzSbzPtISUfxHOmzGZoN2evTwqmh8Y6bC4sZ7T
 QD9zOfmV/lZC8AfrojEuZ/PviDREetesNIj2sIUkawDAMMvVQy8zQ37
X-Developer-Key: i=edelweise.escala@analog.com; a=ed25519;
 pk=lf5HLFe8ZeQjXZgkBkFMK+u9qH5/tqZhCIushTKduNQ=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Authority-Analysis: v=2.4 cv=O7UJeh9W c=1 sm=1 tr=0 ts=69fd6220 cx=c_pps
 a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=0sLvza09kfJOxVLZPwjg:22 a=uXIjobp8t2wMuQ0fPvqm:22 a=gEfo2CItAAAA:8
 a=gAnH3GRIAAAA:8 a=XYAwZIGsAAAA:8 a=VwQbUJbxAAAA:8 a=_3ORjGfkLmd6W5nxMtsA:9
 a=QEXdDO2ut3YA:10 a=sptkURWiP4Gy88Gu7hUp:22 a=E8ToXWR_bxluHZ7gmE-Z:22
X-Proofpoint-GUID: zGvXB4KkYnhhQQhssFfJPvrRnSVw7rsC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDAzNiBTYWx0ZWRfX1j5FrfprMoAv
 EsGQNfcbQUMzikMXW87eqQpwMOCHTUXygb9be0gIco1B/gJ4x4ah70gKk6bDXOrdHysr0Wtuo+G
 N9Z4ATCxQq44Ex0AFAtGBqhD+qthkM05199KDWX2d0OeQWOgYcs0/glDY40GXdx4u7bkIoX2In2
 IV8Cv4ZOK47z6WiaT1S5NJCV22PNyWg9R7ZE0fU3T+BOSmLdvdQqwxGeUVzPFzTNYv38qnQFRS/
 bMinptgeH0Gdu0Jr5/fwJk0qxAjtFoM/KQqMEqGTaTWPAp1/SS6gkUmMIsmQLqlhgBXi1aTeFjo
 HSZib9AC3S/4SnxWyRPR3MVzq+5k/Degw/mg1WP9Y2AdCtIIDPSREoUKUmQI7UW65UuBTf4FLZ5
 EtKWeMFg6ZanNxRhT/I8GadGp01DShWe0MmV4wlXcC6zb4NCM3pBoiL3S8UPikUNkIl8ILT/vKk
 XulDQQiK0uxugZwOESg==
X-Proofpoint-ORIG-GUID: zGvXB4KkYnhhQQhssFfJPvrRnSVw7rsC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080036
X-Rspamd-Queue-Id: DD7BC4F1610
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[analog.com,quarantine];
	R_DKIM_ALLOW(-0.20)[analog.com:s=DKIM];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[analog.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-8045-lists,linux-leds=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[analog.com:email,analog.com:mid,analog.com:url,analog.com:dkim,microchip.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,1c:email,0.0.0.2:email];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[edelweise.escala@analog.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.3:email,0.0.0.1:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

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


