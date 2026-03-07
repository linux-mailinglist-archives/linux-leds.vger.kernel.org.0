Return-Path: <linux-leds+bounces-7141-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KGlvMR54q2l+dQEAu9opvQ
	(envelope-from <linux-leds+bounces-7141-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sat, 07 Mar 2026 01:58:06 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 296D52292A2
	for <lists+linux-leds@lfdr.de>; Sat, 07 Mar 2026 01:58:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AF18F30265A9
	for <lists+linux-leds@lfdr.de>; Sat,  7 Mar 2026 00:58:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34C472D7DD5;
	Sat,  7 Mar 2026 00:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gmstopi/"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FF2B288C81;
	Sat,  7 Mar 2026 00:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772845084; cv=none; b=I/FEzUkr/cuIBBvtHvFJafGrv/fqoLunWBf+CJKjCvzUwbEfwnNkMqAE/Mv7QNge5+7X0yGLipSTDpJnTnhteXk6pe6kcbZ60EaEHQb434CuNknEGDgVcbmVjgdEtIGo93/hzOrt7Ya6vf1DsD3GacDgV+GmL8GavAIynbRMBVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772845084; c=relaxed/simple;
	bh=RSOssoQDt3tH+xZ9YIlkIHtRUEzMtQAhukhAWru5pcA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TR5ZzImuc/l77wtcyCwSeSJMtBEnqguCKuEzY8JHZ15HIgNqofxcIXQa80Ccn5WK7GW7lwZcV2gY+xXAtBpxncx2WMXYT6dg2O1Ykmu0bSLajxpcT9gRyd2X52p8QjFbRwzl1mEA+M7Lrrlo5xXOvIB7bT93M4whjmiZ2mQPQ4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gmstopi/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id A52B4C2BC9E;
	Sat,  7 Mar 2026 00:58:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772845083;
	bh=RSOssoQDt3tH+xZ9YIlkIHtRUEzMtQAhukhAWru5pcA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Gmstopi/TAVZivmWXLsh4zUBxRjq/ougk/82ara6vB9m/pyYpt1hVynD5g/cC657L
	 /VdXk8fI7TecKXviZLR+Xz07ni8DwKD3Jhdz6lI5o+wP6PJhQ+q4aQ2NkDdlwjWf7t
	 BYRrznq3ir0eg5s9CbL9oqWxQZnsFEi2oARJlyYioqxMTcGmam+resS3Er8tyzy2yl
	 uM6ZgpmVM3ZltQe5xPX1D3ldyCuAlN3wZGeZ76dpIHe4XT/9BWWo7ilhjfjNBqTymd
	 k6LuJj0lypb/7vkJlurRRo/WKYmSjOKoSbeS7uhCSy5yRFzR+MbrGJLXfcJKAvCQzo
	 pyApuzH+CcBxQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AA51FC9EC6;
	Sat,  7 Mar 2026 00:58:03 +0000 (UTC)
From: Rudraksha Gupta via B4 Relay <devnull+guptarud.gmail.com@kernel.org>
Date: Fri, 06 Mar 2026 16:58:02 -0800
Subject: [PATCH 1/3] dt-bindings: leds: rt8515: Support single-GPIO flash
 ICs with unlock gate
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260306-expressatt_camera_flash-v1-1-b1996f7cdfdd@gmail.com>
References: <20260306-expressatt_camera_flash-v1-0-b1996f7cdfdd@gmail.com>
In-Reply-To: <20260306-expressatt_camera_flash-v1-0-b1996f7cdfdd@gmail.com>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Rudraksha Gupta <guptarud@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772845083; l=2686;
 i=guptarud@gmail.com; s=20240916; h=from:subject:message-id;
 bh=XkKexDy/wzuB27iB2DnLFEzKOovyf++JmlP+fQT4Q6o=;
 b=he6Q2vN99zHB/nJKmrP5qVDhXsKuAugWXRoYsVze3J2hDLS/1EGDegxeETpbLfSdCc+i4D8XY
 PVNa65EVPyMCnkBk9e5dqxgRft8bIKI1MvtPOQ5pHGJcJtxpHI7rYic
X-Developer-Key: i=guptarud@gmail.com; a=ed25519;
 pk=ETrudRugWAtOpr0OhRiheQ1lXM4Kk4KGFnBySlKDi2I=
X-Endpoint-Received: by B4 Relay for guptarud@gmail.com/20240916 with
 auth_id=211
X-Original-From: Rudraksha Gupta <guptarud@gmail.com>
Reply-To: guptarud@gmail.com
X-Rspamd-Queue-Id: 296D52292A2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	FREEMAIL_REPLYTO_NEQ_FROM(2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7141-lists,linux-leds=lfdr.de,guptarud.gmail.com];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_REPLYTO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	DKIM_TRACE(0.00)[kernel.org:+];
	HAS_REPLYTO(0.00)[guptarud@gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-leds@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-0.985];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

From: Rudraksha Gupta <guptarud@gmail.com>

Some flash ICs use the same one-wire pulse-count protocol as the RT8515
but have only a single GPIO line for both flash and torch modes, plus an
optional unlock gate (e.g. a PMIC MPP) that must be driven high before
the chip responds to the enable GPIO.

Make ent-gpios optional and add an unlock-gpios property to support
these variants. Add a oneOf constraint requiring exactly one of
ent-gpios or unlock-gpios. Add a binding example showing the
single-GPIO configuration.

Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>
---
 .../devicetree/bindings/leds/richtek,rt8515.yaml   | 36 +++++++++++++++++++++-
 1 file changed, 35 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/leds/richtek,rt8515.yaml b/Documentation/devicetree/bindings/leds/richtek,rt8515.yaml
index 0356371a6b01..820cf8c55090 100644
--- a/Documentation/devicetree/bindings/leds/richtek,rt8515.yaml
+++ b/Documentation/devicetree/bindings/leds/richtek,rt8515.yaml
@@ -15,6 +15,10 @@ description: |
   current for each mode is defined in hardware using two resistors
   RFS and RTS.
 
+  This driver also supports single-GPIO flash ICs that use the same
+  one-wire pulse-count protocol on one line for both flash and torch.
+  For these, only enf-gpios is required.
+
 properties:
   compatible:
     const: richtek,rt8515
@@ -26,6 +30,14 @@ properties:
   ent-gpios:
     maxItems: 1
     description: A connection to the 'ENT' (enable torch) pin.
+      Optional for single-GPIO flash ICs where enf-gpios is used for
+      both flash and torch modes.
+
+  unlock-gpios:
+    maxItems: 1
+    description: Optional GPIO to unlock the flash LED circuit. Some
+      boards use a PMIC MPP pin that must be driven high before the
+      flash IC will respond to the enable GPIOs.
 
   richtek,rfs-ohms:
     minimum: 7680
@@ -81,10 +93,15 @@ properties:
 
 required:
   - compatible
-  - ent-gpios
   - enf-gpios
   - led
 
+oneOf:
+  - required:
+      - ent-gpios
+  - required:
+      - unlock-gpios
+
 additionalProperties: false
 
 examples:
@@ -108,4 +125,21 @@ examples:
         };
     };
 
+  - |
+    /* Single-GPIO flash IC with unlock gate */
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/leds/common.h>
+
+    led-controller {
+        compatible = "richtek,rt8515";
+        enf-gpios = <&tlmm 3 GPIO_ACTIVE_HIGH>;
+        unlock-gpios = <&pm8921_mpps 4 GPIO_ACTIVE_HIGH>;
+
+        led {
+            function = LED_FUNCTION_FLASH;
+            color = <LED_COLOR_ID_WHITE>;
+            flash-max-timeout-us = <250000>;
+        };
+    };
+
 ...

-- 
2.53.0



