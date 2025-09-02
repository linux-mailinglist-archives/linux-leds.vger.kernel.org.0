Return-Path: <linux-leds+bounces-5360-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C579B3FD68
	for <lists+linux-leds@lfdr.de>; Tue,  2 Sep 2025 13:11:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 40FE87AF96B
	for <lists+linux-leds@lfdr.de>; Tue,  2 Sep 2025 11:09:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10F5B2F7440;
	Tue,  2 Sep 2025 11:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=vinarskis.com header.i=@vinarskis.com header.b="LfjPP699";
	dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b="MXnnYu/U"
X-Original-To: linux-leds@vger.kernel.org
Received: from a7-20.smtp-out.eu-west-1.amazonses.com (a7-20.smtp-out.eu-west-1.amazonses.com [54.240.7.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F08232F6184;
	Tue,  2 Sep 2025 11:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.240.7.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756811455; cv=none; b=n6wv37ijbPQQ6bUzMXfwR8QGRasjJuI2yYkt+0z69os3poojYZZyIPOCyLIFFlSGZ2fHoisJAc3SDE+wolvmOPgyfihFHFpRYSay6oLOQXcdFUkp1YhHryYED0lBDQZfyERIvWTRqzMozka9/lN/DhdPGNV5R+2397R8epn0Rl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756811455; c=relaxed/simple;
	bh=AaRYi+jmsy2YjXkwKwmstrh7+REHWsnzAyWzbgqEj4k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:Cc; b=ucRfAw5/qUUfQhYS63DC8rh8DgLDSZ6F742LWjFo5yILg2ZODenjggrDl2DRpQGFUr6353gY8igyRUqnXcpv3QO2qr449U8bieI9IP2pTXVChrXeN+tvyyUG6+ntmLU4vV9ABI5/F5AHBdctq2haz2LJlOgT6iJwp5/qlw4iPtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=vinarskis.com; spf=pass smtp.mailfrom=eu-west-1.amazonses.com; dkim=pass (1024-bit key) header.d=vinarskis.com header.i=@vinarskis.com header.b=LfjPP699; dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b=MXnnYu/U; arc=none smtp.client-ip=54.240.7.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=vinarskis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=eu-west-1.amazonses.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=vuvznkywrn6u4jb2ozie3fqz3nbg6pps; d=vinarskis.com; t=1756811451;
	h=From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc;
	bh=AaRYi+jmsy2YjXkwKwmstrh7+REHWsnzAyWzbgqEj4k=;
	b=LfjPP699zh4sdUoeR80eVDStgONY9EMdrKGWaYPMxqgi9HLThwDFn7+G1Ip5cTmM
	nCrDJLWSgRYZOCef7ljhfIkF/3tQEmHGIqZmQUoUlN7dTkJog/ILebsojv8hMuKypo6
	wCfez+TtjNM25WQWwtdHPfSCOgwgEXUPMemY4Al8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=ihchhvubuqgjsxyuhssfvqohv7z3u4hn; d=amazonses.com; t=1756811451;
	h=From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:Feedback-ID;
	bh=AaRYi+jmsy2YjXkwKwmstrh7+REHWsnzAyWzbgqEj4k=;
	b=MXnnYu/Ux+vJVS4iD7o2bnzRoNUaN+V/SUD4kBXs//bnO4zpQLZ4T+NCRKU5Zwqg
	cEGpnIl+3yI+JOgmxZeKkI0tstsoHV7eyTruHDFSsgTC7gk3wN4+sMr3xwMghZXkJ5m
	C0XjSMsxzTmzGY4IQAu8GWXixG4iPztRm1CBNu+c=
From: Aleksandrs Vinarskis <alex@vinarskis.com>
Date: Tue, 2 Sep 2025 11:10:51 +0000
Subject: [PATCH 1/2] dt-bindings: leds: add generic LED consumer
 documentation
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <010201990a1f5ad8-fc97fc84-9ef9-4a03-bf1c-2d54423c6497-000000@eu-west-1.amazonses.com>
References: <20250902-leds-v1-0-4a31e125276b@vinarskis.com>
In-Reply-To: <20250902-leds-v1-0-4a31e125276b@vinarskis.com>
To: Hans de Goede <hansg@kernel.org>, Lee Jones <lee@kernel.org>, 
	Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, 
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Aleksandrs Vinarskis <alex@vinarskis.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2485; i=alex@vinarskis.com;
 h=from:subject:message-id; bh=AaRYi+jmsy2YjXkwKwmstrh7+REHWsnzAyWzbgqEj4k=;
 b=owGbwMvMwCX2dl3hIv4AZgHG02pJDBnbLmx5E8sufXhOVv5x2VdyKQcezpnurmK3SpKNX1TKy
 FI59otARykLgxgXg6yYIkv3n69pXYvmrmW4rvENZg4rE8gQBi5OAZiIzC9Ghu184RMTZi14lTlt
 Ba9E24WCu/YVmiumcHxxy3tyyOZliyPD/7KGP6t/Hst8U7r1RO+G6YJan48x+malTGtYZmikOtW
 wmw8A
X-Developer-Key: i=alex@vinarskis.com; a=openpgp;
 fpr=8E21FAE2D2967BB123303E8C684FD4BA28133815
Feedback-ID: ::1.eu-west-1.dmE2JeRFSagpgiG6D+fa+YE0PH7S+b7tab7/4kfDOU8=:AmazonSES
X-SES-Outgoing: 2025.09.02-54.240.7.20

Currently supports passing 'led-names' used to map LED devices to their
respective functions.

Signed-off-by: Aleksandrs Vinarskis <alex@vinarskis.com>
---
 .../devicetree/bindings/leds/leds-consumer.yaml    | 69 ++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/Documentation/devicetree/bindings/leds/leds-consumer.yaml b/Documentation/devicetree/bindings/leds/leds-consumer.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..a63e78417df84609e279835f7dae62e3ad2f0bf5
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/leds-consumer.yaml
@@ -0,0 +1,69 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/leds-consumer.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Common leds consumer
+
+maintainers:
+  - Aleksandrs Vinarskis <alex@vinarskis.com>
+
+description:
+  Some LED defined in DT are required by other DT consumers, for example
+  v4l2 subnode may require privacy or flash LED.
+
+  Document LED properties that its consumers may define.
+
+properties:
+  leds:
+    description:
+      Phandle to LED device(s) required by particular consumer.
+    $ref: /schemas/types.yaml#/definitions/phandle
+  led-names:
+    description:
+      List of device name(s). Used to map LED devices to their respective
+      functions, when consumer requires more than one LED.
+
+additionalProperties: true
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/leds/common.h>
+
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      camera@36 {
+        compatible = "ovti,ov02c10";
+        reg = <0x36>;
+
+        reset-gpios = <&tlmm 237 GPIO_ACTIVE_LOW>;
+        pinctrl-names = "default";
+        pinctrl-0 = <&cam_rgb_default>;
+
+        led-names = "privacy-led";
+        leds = <&privacy_led>;
+
+        clocks = <&ov02e10_clk>;
+
+        assigned-clocks = <&ov02e10_clk>;
+        assigned-clock-rates = <19200000>;
+
+        avdd-supply = <&vreg_l7b_2p8>;
+        dvdd-supply = <&vreg_l7b_2p8>;
+        dovdd-supply = <&vreg_cam_1p8>;
+
+        port {
+          ov02e10_ep: endpoint {
+            data-lanes = <1 2>;
+            link-frequencies = /bits/ 64 <400000000>;
+            remote-endpoint = <&csiphy4_ep>;
+          };
+        };
+      };
+    };
+
+...

-- 
2.48.1


