Return-Path: <linux-leds+bounces-8959-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +QNMECP4TWqpAwIAu9opvQ
	(envelope-from <linux-leds+bounces-8959-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 08 Jul 2026 09:11:31 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A242F722813
	for <lists+linux-leds@lfdr.de>; Wed, 08 Jul 2026 09:11:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=analog.com header.s=DKIM header.b=sR4oL3xk;
	dmarc=pass (policy=quarantine) header.from=analog.com;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8959-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-leds+bounces-8959-lists+linux-leds=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4698E30DE9FF
	for <lists+linux-leds@lfdr.de>; Wed,  8 Jul 2026 07:01:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEC013E928F;
	Wed,  8 Jul 2026 07:00:51 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65F583F0755;
	Wed,  8 Jul 2026 07:00:36 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783494049; cv=none; b=NwqtbV7Tjk7vm6n/dFcXfGRh7JJ4O9eM+FhatzUmxyImhIsMTf+RJdH4PfRRstNHhIRkl3fC0Ibe1cDEJqknn6nyPDdhpxJ0p5Hzl4lTawzgqJTSYAEKCG67Q3rawpGNKm4pp5A2mxvqXhC2u9mEq/TB+D46R1y485zs5zGLHDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783494049; c=relaxed/simple;
	bh=1oBz68DUvRsjYs3daNl/Jes+K25MOfBC7R612e9EOVE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=i4HD7yDveiVKLSuDeFw1ggB1nCu9gy3+88mOZkKtANk2/1uakf0e8e6IF1CzpY9cBcWVzNPHZa991Lj8gx9U2Tmy4zITlv+WiyBf2iTvhdi9+eKgn7+cHIG3vkBT5Nr7JOPzs/3xYdjtTJjWPtbYjefFxsDyip2NVg3vqPdE+Cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=sR4oL3xk; arc=none smtp.client-ip=148.163.135.77
Received: from pps.filterd (m0516787.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6686sSD51623490;
	Wed, 8 Jul 2026 03:00:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=EiY6h
	naAjmKpzOom7yK3Aa8JU5WmFEaaptweI1RuRi0=; b=sR4oL3xkv0l3bM4DyGqBB
	xTcY/S3jdoKmkAy2cErLXeSaj3V1qtDhsEAdEIS4cQ4F2aQecnd+dNGn2+poSiWh
	cTPPGsp9kAIDk5AaV+wXu5nV8m3ldnylzVtn/Yg7C+kr+vYEg5cRQndN47kx3+o9
	gXYrY/bQq91slWSnVSaU1WdtIZUPNpnDoGR6KlmVx77Niv3nvNEkeznfAEFdugIy
	dAT/mY3NxvVGyRDMpVyfGn4GhsR4akk0J6Hv0XuF+CbuJFrhtH/mZ/5ZHGYxPYhu
	idKBMgrdhBgzRXNBgpCy/aYHShLhKga4bcAZ66Qn/GMyyuoWvQWtw0aX9r9u9IJI
	A==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4f9fhp0pf5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Jul 2026 03:00:32 -0400 (EDT)
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 66870VBj044514
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 8 Jul 2026 03:00:31 -0400
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by ASHBMBX8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.37; Wed, 8 Jul
 2026 03:00:30 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.2.1748.37 via Frontend
 Transport; Wed, 8 Jul 2026 03:00:30 -0400
Received: from HYB-VFz9h4bIQxi.ad.analog.com (HYB-VFz9h4bIQxi.ad.analog.com [10.118.4.21])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 66870ADD006727;
	Wed, 8 Jul 2026 03:00:21 -0400
From: Jan Carlo Roleda <jancarlo.roleda@analog.com>
Date: Wed, 8 Jul 2026 15:00:06 +0800
Subject: [PATCH v7 1/2] dt-bindings: leds: Document LTC3208 Multidisplay
 LED Driver
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260708-upstream-ltc3208-v7-1-aed7f7bd461c@analog.com>
References: <20260708-upstream-ltc3208-v7-0-aed7f7bd461c@analog.com>
In-Reply-To: <20260708-upstream-ltc3208-v7-0-aed7f7bd461c@analog.com>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <linux-leds@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        =?utf-8?q?Uwe_Kleine-K=C3=B6nig?=
	<u.kleine-koenig@baylibre.com>,
        Jan Carlo Roleda
	<jancarlo.roleda@analog.com>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783494010; l=6393;
 i=jancarlo.roleda@analog.com; s=20260317; h=from:subject:message-id;
 bh=1oBz68DUvRsjYs3daNl/Jes+K25MOfBC7R612e9EOVE=;
 b=GZ9J4gG/dXx/MR6c7/c+ixCeXJL+OoarhsxxOfk9YZtUX1ThHXTdgcC49csO6byiEFrxijrkF
 qRrxLqA7BXbBlrUO9a1FZXBeU9jSHzGzG1A7S+CfgGCpS7UtrVuZYsj
X-Developer-Key: i=jancarlo.roleda@analog.com; a=ed25519;
 pk=zPMh+eO6/Mj6tqaie75BLiTLQvE3f9pck0UejKLmLMc=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-ORIG-GUID: TM3IvODpox7vMPiyUujKHwlL7wUotf6e
X-Authority-Analysis: v=2.4 cv=Zobd7d7G c=1 sm=1 tr=0 ts=6a4df590 cx=c_pps
 a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=0sLvza09kfJOxVLZPwjg:22 a=OmVn7CZJonkx5R5zMQLL:22 a=gEfo2CItAAAA:8
 a=gAnH3GRIAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=v2smZY1xhbZLdnYpqY8A:9
 a=QEXdDO2ut3YA:10 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDA2NCBTYWx0ZWRfX9Jxhk0SeMNBd
 IDCTgYA9/8SEnl+SA9bVt1dL2fv74QBIQ6hAF5D8ECGJFa1AtDlDSLTOCU0Qa+vn9eszrtJDS3f
 vc1oY2kKOorQ1iLfyt0BYLH8XMi8/Sh0pP7j2+1hBeyyrqZR7miZhYXIu/Oxc9cMM4LAfpkYhPy
 ChyulXv1CNpXj7CH37Rebdf1WH8/D74ec9RbEkAyO5JtJjA9IGWGrmChRrJOmlDHnCNpEdLrUoX
 CqHgVNZ1e0qOZeEOhDqWlVmikhMas755X49MaMmgeYqxIE/bvM2XnFUxmreztwp9byEmUgDhs0A
 EpxkQbFNl9x1I/V69LTlOKVxo+Nn1+sna0flmabm0a9RwA1XGlKAl4ddUQ3JLrHFnFp5A1WVvw1
 6qRWT9zzPzBnK5PixAc6gmkzoSZZFTdc+vlgPhY72A4JDDZoZHs0CcktVXxgNQ+Q7+Fc56jSrtH
 1RiBj5yYELc8nHIFcFg==
X-Proofpoint-GUID: TM3IvODpox7vMPiyUujKHwlL7wUotf6e
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDA2NCBTYWx0ZWRfX9cvf+HIiou7N
 GZUGeaycvuG9jCgnkKdqMI26KK8GVKJJxsaez851/hKd7jSVVyHW3wsYKjgKEoHx1jRmxgzY4cr
 PEJx36mwIB1bsX8mbvWa/BpO/J74JweD1qSkJaxEyA3fovIjvOHG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_06,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 phishscore=0 malwarescore=0 adultscore=0 bulkscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607080064
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[analog.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[analog.com:s=DKIM];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8959-lists,linux-leds=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,devicetree.org:url,analog.com:dkim,analog.com:mid,analog.com:from_mime,analog.com:url,analog.com:email,vger.kernel.org:from_smtp,qualcomm.com:email];
	FORGED_SENDER(0.00)[jancarlo.roleda@analog.com,linux-leds@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:pavel@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-leds@vger.kernel.org,m:devicetree@vger.kernel.org,m:u.kleine-koenig@baylibre.com,m:jancarlo.roleda@analog.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[analog.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jancarlo.roleda@analog.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A242F722813

Add Devicetree Documentation for LTC3208 Multidisplay LED Driver.

Signed-off-by: Jan Carlo Roleda <jancarlo.roleda@analog.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../devicetree/bindings/leds/adi,ltc3208.yaml      | 181 +++++++++++++++++++++
 MAINTAINERS                                        |   7 +
 2 files changed, 188 insertions(+)

diff --git a/Documentation/devicetree/bindings/leds/adi,ltc3208.yaml b/Documentation/devicetree/bindings/leds/adi,ltc3208.yaml
new file mode 100644
index 000000000000..0a01e07e0ab7
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/adi,ltc3208.yaml
@@ -0,0 +1,181 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (c) 2026 Analog Devices, Inc.
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/adi,ltc3208.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: LTC3208 Multidisplay LED Controller from Linear Technologies (Now Analog Devices)
+
+maintainers:
+  - Jan Carlo Roleda <jancarlo.roleda@analog.com>
+
+description:
+  The LTC3208 is a multidisplay LED controller that can support up to 1A to all
+  connected LEDs.
+
+  The datasheet for this device can be found in
+  https://www.analog.com/en/products/ltc3208.html
+
+properties:
+  compatible:
+    const: adi,ltc3208
+
+  reg:
+    maxItems: 1
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+  adi,disable-camhl-pin:
+    type: boolean
+    description:
+      Configures whether the external CAMHL pin is disabled.
+      If disabled then the output pins associated with CAM will always select
+      the CAM register's high half-byte brightness.
+
+  adi,cfg-enrgbs-pin:
+    type: boolean
+    description:
+      Configures which channel the ENRGBS pin toggles when it receives a signal.
+      ENRGBS pin controls the SUB channel's output pins if this is set,
+      or RGB channel's output pins if this is unset.
+
+  adi,disable-rgb-aux4-dropout:
+    type: boolean
+    description:
+      Configures the RGB and AUX4 dropout signals to be disabled.
+
+  adi,aux1-channel:
+    $ref: /schemas/types.yaml#/definitions/string
+    description:
+      LED Channel that the AUX1 output pin mirrors its brightness level from.
+    enum: [aux, main, sub, cam]
+    default: aux
+
+  adi,aux2-channel:
+    $ref: /schemas/types.yaml#/definitions/string
+    description:
+      LED Channel that the AUX2 output pin mirrors its brightness level from.
+    enum: [aux, main, sub, cam]
+    default: aux
+
+  adi,aux3-channel:
+    $ref: /schemas/types.yaml#/definitions/string
+    description:
+      LED Channel that the AUX3 output pin mirrors its brightness level from.
+    enum: [aux, main, sub, cam]
+    default: aux
+
+  adi,aux4-channel:
+    $ref: /schemas/types.yaml#/definitions/string
+    description:
+      LED Channel that the AUX4 output pin mirrors its brightness level from.
+    enum: [aux, main, sub, cam]
+    default: aux
+
+patternProperties:
+  "^led@[0-7]$":
+    type: object
+    $ref: /schemas/leds/common.yaml#
+    unevaluatedProperties: false
+    properties:
+      reg:
+        description:
+          LED Channel Number. each channel maps to a specific channel group used
+          to configure the brightness level of the output pins corresponding to
+          the channel.
+        enum:
+          - 0 # Main Channel (8-bit brightness)
+          - 1 # Sub Channel (8-bit brightness)
+          - 2 # AUX Channel (4-bit brightness)
+          - 3 # Camera Channel, Low-side byte (4-bit brightness)
+          - 4 # Camera Channel, High-side byte (4-bit brightness)
+          - 5 # Red Channel (4-bit brightness)
+          - 6 # Blue Channel (4-bit brightness)
+          - 7 # Green Channel (4-bit brightness)
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
+    #include <dt-bindings/leds/common.h>
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      led-controller@1b {
+        compatible = "adi,ltc3208";
+        reg = <0x1b>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+        adi,disable-camhl-pin;
+        adi,cfg-enrgbs-pin;
+        adi,disable-rgb-aux4-dropout;
+
+        /* MAIN */
+        led@0 {
+          reg = <0>;
+          function = LED_FUNCTION_ACTIVITY;
+          color = <LED_COLOR_ID_WHITE>;
+        };
+
+        /* SUB */
+        led@1 {
+          reg = <1>;
+          function = LED_FUNCTION_ACTIVITY;
+          color = <LED_COLOR_ID_WHITE>;
+        };
+
+        /* AUX */
+        led@2 {
+          reg = <2>;
+          function = LED_FUNCTION_ACTIVITY;
+          color = <LED_COLOR_ID_WHITE>;
+        };
+
+        /* CAMLO */
+        led@3 {
+          reg = <3>;
+          function = LED_FUNCTION_FLASH;
+          color = <LED_COLOR_ID_WHITE>;
+        };
+
+        /* CAMHI */
+        led@4 {
+          reg = <4>;
+          function = LED_FUNCTION_FLASH;
+          color = <LED_COLOR_ID_WHITE>;
+        };
+
+        /* RED */
+        led@5 {
+          reg = <5>;
+          function = LED_FUNCTION_INDICATOR;
+          color = <LED_COLOR_ID_RED>;
+        };
+
+        /* BLUE */
+        led@6 {
+          reg = <6>;
+          function = LED_FUNCTION_INDICATOR;
+          color = <LED_COLOR_ID_BLUE>;
+        };
+
+        /* GREEN */
+        led@7 {
+          reg = <7>;
+          function = LED_FUNCTION_INDICATOR;
+          color = <LED_COLOR_ID_GREEN>;
+        };
+      };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 2fb1c75afd16..2fd6ffdaaf04 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15223,6 +15223,13 @@ W:	https://ez.analog.com/linux-software-drivers
 F:	Documentation/devicetree/bindings/iio/temperature/adi,ltc2983.yaml
 F:	drivers/iio/temperature/ltc2983.c
 
+LTC3208 LED DRIVER
+M:	Jan Carlo Roleda <jancarlo.roleda@analog.com>
+L:	linux-leds@vger.kernel.org
+S:	Maintained
+W:	https://ez.analog.com/linux-software-drivers
+F:	Documentation/devicetree/bindings/leds/adi,ltc3208.yaml
+
 LTC4282 HARDWARE MONITOR DRIVER
 M:	Nuno Sa <nuno.sa@analog.com>
 L:	linux-hwmon@vger.kernel.org

-- 
2.43.0


