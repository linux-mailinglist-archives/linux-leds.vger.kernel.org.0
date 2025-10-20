Return-Path: <linux-leds+bounces-5825-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id E03E5BF1B63
	for <lists+linux-leds@lfdr.de>; Mon, 20 Oct 2025 16:04:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 5F49334CF21
	for <lists+linux-leds@lfdr.de>; Mon, 20 Oct 2025 14:04:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF8E02F6563;
	Mon, 20 Oct 2025 14:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=erick.setubal@gmx.de header.b="lDjh1gtj"
X-Original-To: linux-leds@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 590F61D5CC9;
	Mon, 20 Oct 2025 14:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760969083; cv=none; b=BYLOim3tmL7Y5Bg5y8aqmxZRYZ/iZtwlW1tWqh508OZk1pi3n+yvomTgb7+DB5bFbH1Neh7zUeEsfWyZDlXEgljFx8E9rTbNkkDOQxqyqaBE6q3iPJ8ASiplc0UC2/3y/NlljrN2TWiw6SRPKtoVpE5vsYEWBJAI+3v7JHnQLHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760969083; c=relaxed/simple;
	bh=mj7mtAXynUlbGhhLJG7Mwgh1VRhEJ2oHwjlG5PZy+A4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fBzB6XmYepyU6Wz2+O53J47Twk2mtrMzwiB/jRSTmSB9vTQETHmsobRs54nVQBHO7QMOB4aG6f49Q3EyLfj++tG73gjD2zrsjtMvFSgZ6dhyYIGWCPSIWODwoe3H2+O1vB499xSA1GJLqaUrwXvaDcMNOdJOZqzvT+pYlIdYYYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=erick.setubal@gmx.de header.b=lDjh1gtj; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1760969074; x=1761573874; i=erick.setubal@gmx.de;
	bh=ilaKx3VrCzJFqFkn9EEeILAPzWt543OSLHXWjNxF3LA=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=lDjh1gtjZm82rky0CR2DJRNN58+Rz+lghiI/6Y3G6XMhud3pVyY9ZQlibekMkMnW
	 yXPZLNhIj6miosRYjTQ7KvJGBV/3UwZmv5wh7a+xbCG0IJQaA0Iwn2jiIrYIJviTO
	 7NOK4ul3fG47lwktyEGrhtTdCiYL08VzXOBMWtQu6velV417Y+Kle9LRZ7Q2leo1k
	 br3wEaGtcH6wwkP9yyFy8jgxJ1pZfW/1kjK5iClkSJIfWPPeBXY9101y2rCLmBPVN
	 CzaSgUb+EvaKcD5Gs52q+mFu+fohraNCynZtfWb/Gfe7be7i3W3ZRRyAAixNy7RjQ
	 GATeKLa540WA6r2dpw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from zolxn00301.speedport.ip ([84.145.119.168]) by mail.gmx.net
 (mrgmx105 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1MA7KU-1v3k1D43Tu-00D24D; Mon, 20 Oct 2025 16:04:34 +0200
From: Erick Setubal Bacurau <erick.setubal@gmx.de>
To: lee@kernel.org,
	pavel@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	david.hunter.linux@gmail.com
Cc: Erick Setubal Bacurau <erick.setubal@gmx.de>
Subject: [PATCH] dt-bindings: leds: Add TI LM36274 backlight driver schema
Date: Mon, 20 Oct 2025 16:04:28 +0200
Message-ID: <20251020140428.246460-1-erick.setubal@gmx.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:XVHZcp4uVhOorQkpFmxIkqTy42AxfclF+bCUZrhh0puG1tRkEJz
 2wwdwhvubQoYTl+DoAvN/t7hnY76sSpjKSODma8SECeSWZ0rPaNPDfY9Wv0mjbcriYXCuGp
 J4CK0ojmWANMpFBUZBw70pPUKm3v2o8d6f7SFX/7YA5OLAUfo/sW2KxicZgZZKIvUERGmxr
 iba9k6O1CTrg2s9ZNF5jw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:jMyEFhf7yjk=;JTIuu/iKIg2nYlyMOJBzABvCalY
 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

Add the DeviceTree binding schema for the Texas Instruments LM36274.

Signed-off-by: Erick Setubal Bacurau <erick.setubal@gmx.de>
=2D--
 .../bindings/leds/leds-lm36274.yaml           | 81 +++++++++++++++++++
 1 file changed, 81 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-lm36274.ya=
ml

diff --git a/Documentation/devicetree/bindings/leds/leds-lm36274.yaml b/Do=
cumentation/devicetree/bindings/leds/leds-lm36274.yaml
new file mode 100644
index 000000000000..390ca660c0be
=2D-- /dev/null
+++ b/Documentation/devicetree/bindings/leds/leds-lm36274.yaml
@@ -0,0 +1,81 @@
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/leds-lm36274.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+title: Texas Instruments LM36274 4-Channel LCD Backlight Driver w/Integra=
ted Bias
+maintainers: [Erick Setubal Bacurau <erick.setubal@gmx.de>]
+description:
+  The LM36274 is an integrated four-channel WLED driver and LCD bias supp=
ly.
+  The backlight boost provides the power to bias four parallel LED string=
s with
+  up to 29V total output voltage. The 11-bit LED current is programmable =
via
+  the I2C bus and/or controlled via a logic level PWM input from 60 uA to=
 30 mA.
+  For more product information please see the link https://www.ti.com/lit=
/ds/symlink/lm36274.pdf
+
+properties:
+  compatible:
+    const: ti,lm36274-backlight
+  reg:
+    maxItems: 1
+    description: I2C address of the device.
+=20
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
+  label:
+    $ref: /schemas/leds/common.yaml#/properties/label
+
+  linux,default-trigger:
+    $ref: /schemas/leds/common.yaml#/properties/linux,default-trigger
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+patternProperties:
+  '^led@[0-3]$':
+    type: object
+    properties:
+      reg:
+        description: LED channel index (0..3)
+        minimum: 0
+        maximum: 3
+
+      led-sources:
+        description: Indicates which LED strings will be enabled (0..3).
+        allOf:
+          - $ref: /schemas/leds/common.yaml#/properties/led-sources
+          - type: array
+            items:
+              $ref: /schemas/types.yaml#/definitions/uint32
+              minimum: 0
+              maximum: 3
+            maxItems: 4
+            uniqueItems: true
+
+examples:
+  - |
+    i2c {
+        #address-cells =3D <1>;
+        #size-cells =3D <0>;
+
+        backlight@11 {
+            #address-cells =3D <1>;
+            #size-cells =3D <0>;
+            reg =3D <0x11>;
+            compatible =3D "ti,lm36274-backlight";
+
+            led@0 {
+                reg =3D <0>;
+                led-sources =3D <0 2>;
+                label =3D "white:backlight_cluster";
+                linux,default-trigger =3D "backlight";
+            };
+        };
+    };
+
+=20
=2D-=20
2.43.0


