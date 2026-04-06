Return-Path: <linux-leds+bounces-7636-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id II+1Ipxe02kEhwcAu9opvQ
	(envelope-from <linux-leds+bounces-7636-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 06 Apr 2026 09:19:56 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E276E3A1FA5
	for <lists+linux-leds@lfdr.de>; Mon, 06 Apr 2026 09:19:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 58B8430305D6
	for <lists+linux-leds@lfdr.de>; Mon,  6 Apr 2026 07:18:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B611B364E93;
	Mon,  6 Apr 2026 07:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="BntRf7nX"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1914D2ECEB9;
	Mon,  6 Apr 2026 07:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775459886; cv=none; b=R9e86PogtGmK2qwuP30wd6f4HdaClTCkaAVZBc9ZYwmOjc0Yqq7BSCb/zmOQtefXU6IFNpMmtFiX9N3vzhj3y/jiyuxu2a53jZqJH8bVPvKEdQyVEJjhho7ZFHpKgN5SYazHrvPcEbnr8YIQXJyFA4vXWzN64OpDstuP8trlrT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775459886; c=relaxed/simple;
	bh=7ZkXD4ajEYgtinjI4c7n46SAKoWNi+4MBlPnGyE/k1A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=bGjh9DEoMem0YJ5MtxJcvwrbB6Ne50n7ylI+whkAjmGXZcwPzVM8B3G/AVHSjbHEsKj+94hrdsxEr1FGx3gCs2X6J7QFNp+XaPoRIWYiCdqFB+spBUbTr2FihMDPzbXed9ftCNNbOs7XoqEjp6KNxvdF3nRII/i4fpQmv/NDShE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=BntRf7nX; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6366Vhdd2069476;
	Mon, 6 Apr 2026 03:18:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=NAO1k
	/pU+S99b0SYA5d3zS6lixdJRWVatarPcTT77Xs=; b=BntRf7nXtwxiTnzokvLg+
	oyHarIrL4NXpeAYhinv4y7KRFftBz8UFsZB62ErjY7AJfi3QuQQrnAWMM16obDPC
	c7mgw1ipN1N88nXnb+GoprS0G8QyAX4hHfYsqxBkJn58kATz4CBe4PncevZ7ZH4r
	mkRgmsaXDdlMNWgMxe6T62NTppXb15jLQRVvR0EB7ZXxSZddX+BXeaTeMfpP87qn
	FfaMTenIKsOCWcr2HDD7BXlOuF+ZU1+y9NaWF05fCbiIzOe6qVXCJTzdJ5ez5CFm
	Ud4OyhqQV02A+HbqhAkXFcPKPlvhiJ2vx4+utsSCUDVEbtF0Epu4oeSXLJmpJbXd
	g==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4davg262s6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Apr 2026 03:18:02 -0400 (EDT)
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 6367I11e018057
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 6 Apr 2026 03:18:01 -0400
Received: from ASHBCASHYB5.ad.analog.com (10.64.17.133) by
 ASHBMBX8.ad.analog.com (10.64.17.5) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.37; Mon, 6 Apr 2026 03:18:01 -0400
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by
 ASHBCASHYB5.ad.analog.com (10.64.17.133) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.37; Mon, 6 Apr 2026 03:18:01 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.2.1748.37 via Frontend
 Transport; Mon, 6 Apr 2026 03:18:01 -0400
Received: from HYB-VFz9h4bIQxi.ad.analog.com (HYB-VFz9h4bIQxi.ad.analog.com [10.118.4.28])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 6367HhUx004461;
	Mon, 6 Apr 2026 03:17:54 -0400
From: Jan Carlo Roleda <jancarlo.roleda@analog.com>
Date: Mon, 6 Apr 2026 15:17:06 +0800
Subject: [PATCH v3 2/2] dt-bindings: leds: Document LTC3208 Multidisplay
 LED Driver
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260406-upstream-ltc3208-v3-2-7f0b1d20ee7a@analog.com>
References: <20260406-upstream-ltc3208-v3-0-7f0b1d20ee7a@analog.com>
In-Reply-To: <20260406-upstream-ltc3208-v3-0-7f0b1d20ee7a@analog.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775459863; l=4824;
 i=jancarlo.roleda@analog.com; s=20260317; h=from:subject:message-id;
 bh=7ZkXD4ajEYgtinjI4c7n46SAKoWNi+4MBlPnGyE/k1A=;
 b=3FVcmmWqJil6hk87E70C7Ccr+TcxB1qZeEiUj+6FgX/7ibmV5hasHZGRYfR+slBZ1t4SpKxFy
 v2j5egeVeO/DGmmvdMDAXaBL2/8e3/otf+Jmlo5N7HTahePXOFGR6th
X-Developer-Key: i=jancarlo.roleda@analog.com; a=ed25519;
 pk=zPMh+eO6/Mj6tqaie75BLiTLQvE3f9pck0UejKLmLMc=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Authority-Analysis: v=2.4 cv=Q5zfIo2a c=1 sm=1 tr=0 ts=69d35e2a cx=c_pps
 a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=0sLvza09kfJOxVLZPwjg:22 a=uXIjobp8t2wMuQ0fPvqm:22 a=gEfo2CItAAAA:8
 a=gAnH3GRIAAAA:8 a=VwQbUJbxAAAA:8 a=vwDbgPTT2OTVLz-ngJwA:9 a=QEXdDO2ut3YA:10
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA2MDA2OSBTYWx0ZWRfX3RwaC5wUbjo1
 1JywANgZ2dGJPDhFnZeImMmoFSXgZnMr/rF8py9R97YGLXydBOV/yub7qBZJGm5mEbQgRtd9xoM
 SHZPd0z61M6me3+OXIZSP7Jbh8vLetk+hKDeWYSFtXKygGe2hLykzzt4LIicvcd/0dUWSX1TWCl
 e87pTSBrtBQ136OUCrXLdcZVQGcJK1WZpAs3t4l1NG/NMpslZnAZhoofuBNts2sjOUSWyjBs8Sj
 C2ppBeDHaw9sTuAh1u7sWur5Mm1kIz2V/Ln1p41HyG0Gz47oCgRXuffuWl3n674L5D0h0FXDL5i
 ne6+IVjAMv5xO3774WVJizGKxh9pmvre8w5B3w1hS3hzzjbvIjc4Z9ugSBDEuomtu1qEuaLIi+i
 zFMc6BGLwQ4lnvDrs6o8x4YNCYLXDvyI/iFV6SljF46F1Jle/jmey1VYRnFpjKgtiq58azXRyKl
 KCXrOdRVjVKxR/hObHw==
X-Proofpoint-ORIG-GUID: iiwBfCGYOuacunVJ-fMNiweYbGa0Ys_b
X-Proofpoint-GUID: iiwBfCGYOuacunVJ-fMNiweYbGa0Ys_b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-06_02,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604060069
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[analog.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[analog.com:s=DKIM];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[analog.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7636-lists,linux-leds=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[analog.com:dkim,analog.com:mid,analog.com:email,analog.com:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,0.0.0.0:email];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	FROM_NEQ_ENVFROM(0.00)[jancarlo.roleda@analog.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: E276E3A1FA5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add Documentation for LTC3208 Multidisplay LED Driver.

Signed-off-by: Jan Carlo Roleda <jancarlo.roleda@analog.com>
---
 .../devicetree/bindings/leds/adi,ltc3208.yaml      | 129 +++++++++++++++++++++
 MAINTAINERS                                        |   1 +
 2 files changed, 130 insertions(+)

diff --git a/Documentation/devicetree/bindings/leds/adi,ltc3208.yaml b/Documentation/devicetree/bindings/leds/adi,ltc3208.yaml
new file mode 100644
index 000000000000..2d53cf70e572
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/adi,ltc3208.yaml
@@ -0,0 +1,129 @@
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
+        led@0 {
+          reg = <0>;
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


