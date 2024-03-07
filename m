Return-Path: <linux-leds+bounces-1192-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EC68875781
	for <lists+linux-leds@lfdr.de>; Thu,  7 Mar 2024 20:51:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A4AA5B22229
	for <lists+linux-leds@lfdr.de>; Thu,  7 Mar 2024 19:51:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F692137C54;
	Thu,  7 Mar 2024 19:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="CNEDOW3V"
X-Original-To: linux-leds@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A09C4136995
	for <linux-leds@vger.kernel.org>; Thu,  7 Mar 2024 19:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709841062; cv=none; b=KSYTO4Ax3GIEn7s9uLwRwQnpqChHGYoXcKjCOwndIrBITSUdm+ua0bR0FBfFoUtBVgXNvR1yE5ARngG64+vjpYO6Eg3sQTun16fd18iUHYOquwBr9lMagPFgK0RGn65ntL1pf7O2bDoNqK4s5SpW9XZbOFUxEjXHssol59UlY8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709841062; c=relaxed/simple;
	bh=mXN5wgd3o4fIew4BW8dq44SYd4HTn/EPSiwKP+WUK8M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UFGyT09CSo3Mn1uPMyUbCzwfF4jZlC7wvJXxD5ffli2vPDXjH4boeZuRSJi3jlU1po02U+F5jwNWWdLzPQovEjl7G+CK0uOA030D2njyN3ltigE0J7MeP8VKtskgltp9B2jDZ3l71UYujbqjKqG03F89nmexvYsLvtmjamXdap0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=CNEDOW3V; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 3A9EB2C04A9;
	Fri,  8 Mar 2024 08:50:56 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1709841056;
	bh=xxBD7nIRpCKC/svvZNqUfTVZv80HTqUWAxM9FrAVvSQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CNEDOW3V8SXBIDlNITxoSq/hyzsBzTYpbmGAd/yPN66zdrAav5c5ranALa004zsC0
	 Zuk3ywkA5vI5xj6mo/X77UvMcxF3HC0SsIzxmZRYuW7Hs8e9SzBjJ9Zz4ozJ3T9nlI
	 seARkJlvJMwcWWA+pUwA75D1I7Fn3lVNlTIEetKM0xVMU9ovwk39bgEDdYbeAL7IaT
	 7NY8dlG4srXSZ+HWI0epAttTOG1URHfnuoeP77BExQVjFNJDwAadYMV/uw5faeCsmS
	 3lbBupkPKRSUmXpVZ3m9qzCCu+bcNZ3KRQPvYD8he5lCdAKyAefXDl+rIRCmUXlBJJ
	 wUjYE+DYQQfZA==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B65ea1a9f0003>; Fri, 08 Mar 2024 08:50:55 +1300
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.30])
	by pat.atlnz.lc (Postfix) with ESMTP id C709613EE85;
	Fri,  8 Mar 2024 08:50:55 +1300 (NZDT)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
	id BF7542808BA; Fri,  8 Mar 2024 08:50:55 +1300 (NZDT)
From: Chris Packham <chris.packham@alliedtelesis.co.nz>
To: andy@kernel.org,
	geert@linux-m68k.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	andrew@lunn.ch,
	gregory.clement@bootlin.com,
	sebastian.hesselbarth@gmail.com,
	lee@kernel.org
Cc: linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH v6 2/3] dt-bindings: auxdisplay: Add bindings for generic 7-segment LED
Date: Fri,  8 Mar 2024 08:50:52 +1300
Message-ID: <20240307195053.1320538-3-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240307195053.1320538-1-chris.packham@alliedtelesis.co.nz>
References: <20240307195053.1320538-1-chris.packham@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.4 cv=BKkQr0QG c=1 sm=1 tr=0 ts=65ea1aa0 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=K6JAEmCyrfEA:10 a=tBb2bbeoAAAA:8 a=VwQbUJbxAAAA:8 a=gEfo2CItAAAA:8 a=UL8_YvhhsuCliVb0JXoA:9 a=3ZKOabzyN94A:10 a=Oj-tNtZlA1e06AYgeCfH:22 a=AjGcO6oz07-iQ99wixmX:22 a=sptkURWiP4Gy88Gu7hUp:22
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat

Add bindings for a generic 7-segment LED display using GPIOs.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---

Notes:
    Changes in v6:
    - Collect R-by from Geert and Rob
    Changes in v5:
    - Preserve formatting, maxItems set to 8, group GPIO specifiers
      as suggested by Geert
    Changes in v4:
    - Add ASCII art diagram showing arrangement of segments
    Changes in v3:
    - Set maxItems: 7
    - Expand description of segment-gpios property.
    - Use compatible =3D "gpio-7-segment" as suggested by Rob
    Changes in v2:
    - Use compatible =3D "generic-gpio-7seg" to keep checkpatch.pl happy

 .../bindings/auxdisplay/gpio-7-segment.yaml   | 55 +++++++++++++++++++
 1 file changed, 55 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/auxdisplay/gpio-7-s=
egment.yaml

diff --git a/Documentation/devicetree/bindings/auxdisplay/gpio-7-segment.=
yaml b/Documentation/devicetree/bindings/auxdisplay/gpio-7-segment.yaml
new file mode 100644
index 000000000000..328954893c64
--- /dev/null
+++ b/Documentation/devicetree/bindings/auxdisplay/gpio-7-segment.yaml
@@ -0,0 +1,55 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/auxdisplay/gpio-7-segment.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: GPIO based LED segment display
+
+maintainers:
+  - Chris Packham <chris.packham@alliedtelesis.co.nz>
+
+properties:
+  compatible:
+    const: gpio-7-segment
+
+  segment-gpios:
+    description: |
+      An array of GPIOs one per segment. The first GPIO corresponds to t=
he A
+      segment, the seventh GPIO corresponds to the G segment. Some LED b=
locks
+      also have a decimal point which can be specified as an optional ei=
ghth
+      segment.
+
+               -a-
+              |   |
+              f   b
+              |   |
+               -g-
+              |   |
+              e   c
+              |   |
+               -d-  dp
+
+    minItems: 7
+    maxItems: 8
+
+required:
+  - segment-gpios
+
+additionalProperties: false
+
+examples:
+  - |
+
+    #include <dt-bindings/gpio/gpio.h>
+
+    led-7seg {
+        compatible =3D "gpio-7-segment";
+        segment-gpios =3D <&gpio 0 GPIO_ACTIVE_LOW>,
+                        <&gpio 1 GPIO_ACTIVE_LOW>,
+                        <&gpio 2 GPIO_ACTIVE_LOW>,
+                        <&gpio 3 GPIO_ACTIVE_LOW>,
+                        <&gpio 4 GPIO_ACTIVE_LOW>,
+                        <&gpio 5 GPIO_ACTIVE_LOW>,
+                        <&gpio 6 GPIO_ACTIVE_LOW>;
+    };
--=20
2.43.2


