Return-Path: <linux-leds+bounces-7375-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uAajILhNumlUUAIAu9opvQ
	(envelope-from <linux-leds+bounces-7375-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 18 Mar 2026 08:01:12 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BF552B69F3
	for <lists+linux-leds@lfdr.de>; Wed, 18 Mar 2026 08:01:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3DA54301F5A9
	for <lists+linux-leds@lfdr.de>; Wed, 18 Mar 2026 07:00:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DADDE364037;
	Wed, 18 Mar 2026 07:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="rRBjQjSg"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 531D4366DC0;
	Wed, 18 Mar 2026 07:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773817252; cv=none; b=MRmpHM68JYX79Ny85qskgGRzekrEm7/rQOUsZFpgoBaeytm8B8pUzNWMlehcf/owiecSlvrxArG6o1VDpp6TP3BAmCsrMMXVy6v1tY8me46CTT5ZmCDBnWxZNJ+XZZeTIMXYH/DIohc1fq5LhHdYc61d4p0ln54aLYaGH9knB78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773817252; c=relaxed/simple;
	bh=tMndzEFe1mwrpQ9gHW80y66RRIWqD5TMGX7tEvhlVzU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=Qvuvuj3tki4ItIUcXsnKSPd5t+qYMi1a3PE19SSvRjHthcXhKpLM+L+hof0DSSW9/z/DpCOpSfxDt7iOqtpxPpqYWcNHMJSAGtiZUj6YZkeBMDgzGMnxe7fwp47+CCvBvphprVEqWNxxhWe1GGD1U90V/L6r9GC7Y4DJQz8Rk7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=rRBjQjSg; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62I5VJxc1782791;
	Wed, 18 Mar 2026 03:00:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=Aoie1
	jVgx95WaIYi6KUNi0qif0PKy4gC1sf+LtAaweM=; b=rRBjQjSg8JfzkBb38gjOF
	N7egY/aQpz3h5s6/5NEbLdHgPZqCWZlHLbCpXmvJuKto4uGmwYC05eihw+mGFbpH
	eCfPbecZpqyJhY6iQxrfRH69SOaKW7IFXjyjDUfA2QVZg+uyREJkVGjlHno6vD16
	zZxxrmT4X1MJ2t0EnNR9BHa09LhDQ6SOxEWW1HAHNw1yzAz9LLIK1u4umybOJPsa
	KzN57st9NZht8mCfZgl0/Fhy4dK/wYQSyiGYTcdGr2oi7Zy8nXO6MWbn2oT9Ai28
	+hwtv1d/QlUO1GgX4RS1xboTWgsFzVhlSUk90/1k18g0d58o4sDflOJ8D1NJhE4A
	A==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4cyjf81hxe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Mar 2026 03:00:45 -0400 (EDT)
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 62I70ieL010636
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 18 Mar 2026 03:00:44 -0400
Received: from ASHBCASHYB4.ad.analog.com (10.64.17.132) by
 ASHBMBX9.ad.analog.com (10.64.17.10) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.37; Wed, 18 Mar 2026 03:00:44 -0400
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by
 ASHBCASHYB4.ad.analog.com (10.64.17.132) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.37; Wed, 18 Mar 2026 03:00:44 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.2.1748.37 via Frontend
 Transport; Wed, 18 Mar 2026 03:00:44 -0400
Received: from HYB-VFz9h4bIQxi.ad.analog.com (HYB-VFz9h4bIQxi.ad.analog.com [10.118.4.27])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 62I70PXJ031847;
	Wed, 18 Mar 2026 03:00:39 -0400
From: Jan Carlo Roleda <jancarlo.roleda@analog.com>
Date: Wed, 18 Mar 2026 14:59:22 +0800
Subject: [PATCH 3/3] dt-bindings: leds: Document LTC3208 Multidisplay LED
 Driver
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260318-upstream-ltc3208-v1-3-015f1f1e9065@analog.com>
References: <20260318-upstream-ltc3208-v1-0-015f1f1e9065@analog.com>
In-Reply-To: <20260318-upstream-ltc3208-v1-0-015f1f1e9065@analog.com>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <linux-leds@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        Jan Carlo Roleda <jancarlo.roleda@analog.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773817226; l=5269;
 i=jancarlo.roleda@analog.com; s=20260317; h=from:subject:message-id;
 bh=tMndzEFe1mwrpQ9gHW80y66RRIWqD5TMGX7tEvhlVzU=;
 b=EZQgTol4n/PHVVhq1fRWf7A9WRDLeawE/cOAsV3k6vSAJee2PkpxBLQTl+czu0XRISH+z3+6N
 23bm+NpwajGACV9j8fae4mpqyRGX2GYWKfuOp/0oxO7hNDSjw75tp2A
X-Developer-Key: i=jancarlo.roleda@analog.com; a=ed25519;
 pk=zPMh+eO6/Mj6tqaie75BLiTLQvE3f9pck0UejKLmLMc=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Authority-Analysis: v=2.4 cv=Rcidyltv c=1 sm=1 tr=0 ts=69ba4d9d cx=c_pps
 a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=0sLvza09kfJOxVLZPwjg:22 a=Z0pTeXoby7EwIRygza74:22 a=gEfo2CItAAAA:8
 a=gAnH3GRIAAAA:8 a=VwQbUJbxAAAA:8 a=DfgavVszv1SWYE2HNeIA:9 a=QEXdDO2ut3YA:10
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: Y-IR9Zq__zpN4c_pe-Xhf7cVPfS1-UNz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDA1NyBTYWx0ZWRfXyFnPUP21XMbW
 AWceKMe2MvJlTc3LRpdY9zfSXEhzGJ1YjWwMf21ueOSoZScPOCjHW58MW15KgH5RJro2D7REo9H
 jKejp/cJwtRyKCuI9M0buBjtl9w2TOtQ/mqxQkPnvO1cm/EosEXqWCD1g9YutAvUo31PfqOotob
 Z4Q3kr0rR11qVDtzio+tACNOZvpqJKJbzVxDBNwWx4fDEPionBfXX9W58mLUXMtjj/fKzq4T4IR
 xh16LRveKnGuK7MAw/arktyz+L9ZMeeHyQ65gqJiQeAqpEAIbuVWqXwRDoC2KNXvgpHo2hcz2sc
 aY18ts9HKHCsBqVXMGWXGrWJkyq4Vc2CelJBVmm0TiBAOjnH8A8aMLUDJxIxwLgGTb9jSs85HG+
 W2q+CjqXNaw8lguBbxF3v6wKYUM8klVlbUY3kzrxWQ1dkD1hu4XDykEVzHfW3q9Qv3u4s9cQCHT
 rTCMtR9Ym8PRpgornbg==
X-Proofpoint-GUID: Y-IR9Zq__zpN4c_pe-Xhf7cVPfS1-UNz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_05,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603180057
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[analog.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[analog.com:s=DKIM];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[analog.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7375-lists,linux-leds=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	FROM_NEQ_ENVFROM(0.00)[jancarlo.roleda@analog.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 7BF552B69F3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add Documentation for LTC3208 Multidisplay LED Driver.

Signed-off-by: Jan Carlo Roleda <jancarlo.roleda@analog.com>
---
 .../devicetree/bindings/leds/adi,ltc3208.yaml      | 159 +++++++++++++++++++++
 MAINTAINERS                                        |   1 +
 2 files changed, 160 insertions(+)

diff --git a/Documentation/devicetree/bindings/leds/adi,ltc3208.yaml b/Documentation/devicetree/bindings/leds/adi,ltc3208.yaml
new file mode 100644
index 000000000000..58ee7a9cc66e
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/adi,ltc3208.yaml
@@ -0,0 +1,159 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (c) 2026 Analog Devices, Inc.
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/leds-ltc3208.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: LTC3208 Multidisplay LED Controller from Linear Technologies (Now Analog Devices).
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
+
+properties:
+  compatible:
+    const: adi,ltc3208
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
+  adi,disable-camhl-pin:
+    type: boolean
+    description:
+      Configures whether the external CAMHL pin is disabled.
+      if disabled then the output pins associated with CAM will always select
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
+    #include <dt-bindings/gpio/gpio.h>
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
+        led@0 {
+          reg = <0>;
+        };
+
+        led@1 {
+          reg = <1>;
+        };
+
+        led@2 {
+          reg = <2>;
+        };
+
+        led@3 {
+          reg = <3>;
+        };
+
+        led@4 {
+          reg = <4>;
+        };
+
+        led@5 {
+          reg = <5>;
+        };
+
+        led@6 {
+          reg = <6>;
+        };
+
+        led@7 {
+          reg = <7>;
+        };
+      };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 48bae02057d5..97072e906928 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15131,6 +15131,7 @@ M:	Jan Carlo Roleda <jancarlo.roleda@analog.com>
 L:	linux-leds@vger.kernel.org
 S:	Maintained
 W:	https://ez.analog.com/linux-software-drivers
+F:	Documentation/devicetree/bindings/leds/adi,ltc3208.yaml
 F:	drivers/leds/leds-ltc3208.c
 
 LTC4282 HARDWARE MONITOR DRIVER

-- 
2.43.0


