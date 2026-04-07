Return-Path: <linux-leds+bounces-7650-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4PYeLR4Z1Wli0wcAu9opvQ
	(envelope-from <linux-leds+bounces-7650-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Tue, 07 Apr 2026 16:47:58 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E85C3B0559
	for <lists+linux-leds@lfdr.de>; Tue, 07 Apr 2026 16:47:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 58C38300DF42
	for <lists+linux-leds@lfdr.de>; Tue,  7 Apr 2026 14:41:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A71692836AF;
	Tue,  7 Apr 2026 14:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gu9fJZwU"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F6D5258EF9;
	Tue,  7 Apr 2026 14:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775572906; cv=none; b=sFwCKTeWprPldHDCQnCmy/q6PcgRXYS8tfJqfFMoHkxgD3Qi3oMfpIgE9qgbhNTpb1zkuauWRJVtSIIDbo72cvlXPAnA/8mNW+aWydzwDr8enguglRIQRCjqR4NaPcin7k1QAiI+p7D/tbH/JJI911HSJmyt+pQ4NToMbD8g/Ho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775572906; c=relaxed/simple;
	bh=OCZBNxvoQHTLSNbncUAUntFZfUElInK//+0RKU0RpRI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uMLFkREk+CoENq0hEIn+qb7tJOgMHdzHG23wR1TxjsbVF4ePgQEOxGKazAYG5uPimUsEjEQl2YPVLXC0fzzMhxA0A5MiE0bmWxwS/691Y7EHmwFEsbwo0r4FidlJ2Ll25C/DaNtq/xWVMWzEdgjpV9Cwxnt2XaftntqO6lFKxfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gu9fJZwU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 245B4C2BCAF;
	Tue,  7 Apr 2026 14:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775572906;
	bh=OCZBNxvoQHTLSNbncUAUntFZfUElInK//+0RKU0RpRI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=gu9fJZwUQvX7+zI9g9d22OiZZOcHI6R93RiGO+uose113kUA2yJpn/3RvfIlEenfi
	 JuleAMRoyJN8TzZ8cWinI604YHFX135U0GsYqokW1i1R8bwirzvIOZ6ajXSaQJIAne
	 vx+32JyL5w5dbRjnvFHCQ9987b+rHPKATqHd4JeakEa5zlLKm+YcNsQfjDR2ReWRvE
	 fHUUNQ7Asb0rjPJHcnp6VDqip9J2pC7DFNCd3/p0eOs5VFrF7xfhHKBvIpIlJCjOQh
	 o1E6GyqvmEeBpqh7avZ3/0bjc084CX3RqulRanyK7J71JsH4kH3Ee/ub+mMqC39KLF
	 ha3Tyh09jUZlA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C119FEEF52;
	Tue,  7 Apr 2026 14:41:46 +0000 (UTC)
From: Maud Spierings via B4 Relay <devnull+maudspierings.gocontroll.com@kernel.org>
Date: Tue, 07 Apr 2026 16:41:42 +0200
Subject: [PATCH v8 1/4] dt-bindings: backlight: Add max25014 support
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260407-max25014-v8-1-14eac7ed673a@gocontroll.com>
References: <20260407-max25014-v8-0-14eac7ed673a@gocontroll.com>
In-Reply-To: <20260407-max25014-v8-0-14eac7ed673a@gocontroll.com>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Frank Li <Frank.Li@nxp.com>
Cc: dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-fbdev@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Maud Spierings <maudspierings@gocontroll.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775572904; l=3542;
 i=maudspierings@gocontroll.com; s=20250214; h=from:subject:message-id;
 bh=wI7LikOzP1C7GvYpLTTVl+2QLbKSZ6aGcqr6KI8Kvzw=;
 b=2XxgIk5IgTyU/jzxJhrSo//Y3+lDQ0tuknOKKoIg2OfNxyNvbqZcBhhnJe2/f1W5guvqZM5Ti
 zO/vibJFzCnDdNItFZnNRDKX4pZxwnGPgB3yebhK2n2b8eQVvMhGmcn
X-Developer-Key: i=maudspierings@gocontroll.com; a=ed25519;
 pk=7chUb8XpaTQDvWhzTdHC0YPMkTDloELEC7q94tOUyPg=
X-Endpoint-Received: by B4 Relay for maudspierings@gocontroll.com/20250214
 with auth_id=341
X-Original-From: Maud Spierings <maudspierings@gocontroll.com>
Reply-To: maudspierings@gocontroll.com
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7650-lists,linux-leds=lfdr.de,maudspierings.gocontroll.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,gmx.de,pengutronix.de,nxp.com];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-leds@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	HAS_REPLYTO(0.00)[maudspierings@gocontroll.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[analog.com:email,6f:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,gocontroll.com:email,gocontroll.com:replyto,gocontroll.com:mid,devicetree.org:url]
X-Rspamd-Queue-Id: 5E85C3B0559
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Maud Spierings <maudspierings@gocontroll.com>

The Maxim MAX25014 is a 4-channel automotive grade backlight driver IC
with integrated boost controller.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
---

In the current implementation the control registers for channel 1,
control all channels. So only one led subnode with led-sources is
supported right now. If at some point the driver functionality is
expanded the bindings can be easily extended with it.
---
 .../bindings/leds/backlight/maxim,max25014.yaml    | 83 ++++++++++++++++++++++
 MAINTAINERS                                        |  5 ++
 2 files changed, 88 insertions(+)

diff --git a/Documentation/devicetree/bindings/leds/backlight/maxim,max25014.yaml b/Documentation/devicetree/bindings/leds/backlight/maxim,max25014.yaml
new file mode 100644
index 0000000000000..d00be2e081938
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/backlight/maxim,max25014.yaml
@@ -0,0 +1,83 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/backlight/maxim,max25014.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Maxim max25014 backlight controller
+
+maintainers:
+  - Maud Spierings <maudspierings@gocontroll.com>
+
+properties:
+  compatible:
+    enum:
+      - maxim,max25014
+
+  reg:
+    maxItems: 1
+
+  default-brightness:
+    minimum: 0
+    maximum: 100
+    default: 50
+
+  enable-gpios:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  power-supply:
+    description: Regulator which controls the boost converter input rail.
+
+  pwms:
+    maxItems: 1
+
+  maxim,iset:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    maximum: 15
+    default: 11
+    description:
+      Value of the ISET field in the ISET register. This controls the current
+      scale of the outputs, a higher number means more current.
+
+  maxim,strings:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    description:
+      A 4-bit bitfield that describes which led strings to turn on.
+    minItems: 4
+    maxItems: 4
+    items:
+      maximum: 1
+    default:
+      [1 1 1 1]
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
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        backlight@6f {
+            compatible = "maxim,max25014";
+            reg = <0x6f>;
+            default-brightness = <50>;
+            enable-gpios = <&gpio1 4 GPIO_ACTIVE_HIGH>;
+            interrupt-parent = <&gpio1>;
+            interrupts = <2 IRQ_TYPE_EDGE_FALLING>;
+            power-supply = <&reg_backlight>;
+            pwms = <&pwm1>;
+            maxim,iset = <7>;
+            maxim,strings = <1 1 1 0>;
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 10d12b51b1f6f..7e3ad236537fe 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15688,6 +15688,11 @@ F:	Documentation/userspace-api/media/drivers/max2175.rst
 F:	drivers/media/i2c/max2175*
 F:	include/uapi/linux/max2175.h
 
+MAX25014 BACKLIGHT DRIVER
+M:	Maud Spierings <maudspierings@gocontroll.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/leds/backlight/maxim,max25014.yaml
+
 MAX31335 RTC DRIVER
 M:	Antoniu Miclaus <antoniu.miclaus@analog.com>
 L:	linux-rtc@vger.kernel.org

-- 
2.53.0



