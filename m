Return-Path: <linux-leds+bounces-7960-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id X6xvM3fB92mXlwIAu9opvQ
	(envelope-from <linux-leds+bounces-7960-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sun, 03 May 2026 23:43:19 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5760B4B78A8
	for <lists+linux-leds@lfdr.de>; Sun, 03 May 2026 23:43:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 98C0D300BD96
	for <lists+linux-leds@lfdr.de>; Sun,  3 May 2026 21:43:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 011543A7F7E;
	Sun,  3 May 2026 21:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s/Abf71z"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD1743A785E;
	Sun,  3 May 2026 21:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777844596; cv=none; b=p8KWyjemtfjPjn7Fy1+jUCJQu3u0O8QTG33LsQY9uXruTJZdzUuCvDB7tGRwerz5up68/KnfqQV3vZ577rrQYCtyu4Q6E8CyV45frr/2FkDwBeyZO5VKIw6azWtrpmX8KdBIp7znQey/BR6G7E5V/zFUhWM+tOc5ewZ10Ll20tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777844596; c=relaxed/simple;
	bh=cWFq0UmsChy1UMKhJ3jNAc6iyXXgrydkyp2h6htMuew=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=autUzPk4CCb1gUCbQAPiMmWoQg0PCQNlsz07UwjBAyq8+os5uyJlc3k132tZpencSqEaqPisoXh45RIJz9EdEtGkSR5awUqBCzyydcItYKBzVBU8vgK38Mx1DYmq8LEl9cmnkWAVLHpEcS5N5/LuGrl9Vf+Ze7+Ovu7ZV0/2/+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s/Abf71z; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6BE6DC2BCB4;
	Sun,  3 May 2026 21:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777844596;
	bh=cWFq0UmsChy1UMKhJ3jNAc6iyXXgrydkyp2h6htMuew=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=s/Abf71zdPGK2EH6TIc1GQX8Gg5oaMLMS9QIm6i3WcLbROvc+rJSGW2HnMgw86Twa
	 bvs4ra6r7pivhFfegB/jcxRYuJrPNfbLW2XFwPKweWvwOm+bwL2oz1CrYfuQgEeMTb
	 YtJRz+w2wXJjO9twWN08VUPQo8+KrOnH7To9jrFCNA5mDs2jzXcvz3rkqU+jB8kxvz
	 C7kZjLNpDTkcADnbu0+eOu2RL53fvmnS9N0n/85fWIEbhjAjC9bHa8p/nUFNryyAF/
	 A6JJ/YBpKTBoAuRHKHwzK4M9zMbFgv2ud7kIMuWpiK1ALyMQzlZZs14VP9RgYAy6Fl
	 C8iYRLCJbq9Qg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63012CD3424;
	Sun,  3 May 2026 21:43:16 +0000 (UTC)
From: Rudraksha Gupta via B4 Relay <devnull+guptarud.gmail.com@kernel.org>
Date: Sun, 03 May 2026 14:43:15 -0700
Subject: [PATCH v5 1/3] dt-bindings: leds: rt8515: Support single-GPIO
 flash ICs with vin supply
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260503-expressatt_camera_flash-v5-1-95524506a799@gmail.com>
References: <20260503-expressatt_camera_flash-v5-0-95524506a799@gmail.com>
In-Reply-To: <20260503-expressatt_camera_flash-v5-0-95524506a799@gmail.com>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 phone-devel@vger.kernel.org, Rudraksha Gupta <guptarud@gmail.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777844595; l=2722;
 i=guptarud@gmail.com; s=20240916; h=from:subject:message-id;
 bh=zVrQqx9DX85PpInFmz437RLTadxI5BhJ9KjSu1CJI9w=;
 b=D34jREdsOmnrUJrEqDaIoKNsVbWPR6FSlZ+YLIU9a5KCB6+P96K7j5lAZrbwwVf3VBNfYsHep
 KYe3PPgiY4nBYV94MtPA/rEVS7keiM0iaKvmF2+a3dI3VKcT6UIAqau
X-Developer-Key: i=guptarud@gmail.com; a=ed25519;
 pk=ETrudRugWAtOpr0OhRiheQ1lXM4Kk4KGFnBySlKDi2I=
X-Endpoint-Received: by B4 Relay for guptarud@gmail.com/20240916 with
 auth_id=211
X-Original-From: Rudraksha Gupta <guptarud@gmail.com>
Reply-To: guptarud@gmail.com
X-Rspamd-Queue-Id: 5760B4B78A8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	FREEMAIL_REPLYTO_NEQ_FROM(2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_REPLYTO(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-7960-lists,linux-leds=lfdr.de,guptarud.gmail.com];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-leds@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,microchip.com];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	HAS_REPLYTO(0.00)[guptarud@gmail.com];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,microchip.com:email]

From: Rudraksha Gupta <guptarud@gmail.com>

Some flash ICs use the same one-wire pulse-count protocol as the RT8515
but have only a single enable line for both flash and torch modes, plus
an optional input voltage supply (e.g. a GPIO-controlled fixed
regulator) that gates power to the chip.

Make ent-gpios optional and add a vin-supply property to support these
variants. Add a oneOf constraint requiring exactly one of ent-gpios or
vin-supply. Add a binding example showing the single-GPIO configuration
with an input supply.

Assisted-by: Claude:claude-opus-4.6
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>
---
 .../devicetree/bindings/leds/richtek,rt8515.yaml   | 34 +++++++++++++++++++++-
 1 file changed, 33 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/leds/richtek,rt8515.yaml b/Documentation/devicetree/bindings/leds/richtek,rt8515.yaml
index 0356371a6b01..ab3c5139132c 100644
--- a/Documentation/devicetree/bindings/leds/richtek,rt8515.yaml
+++ b/Documentation/devicetree/bindings/leds/richtek,rt8515.yaml
@@ -15,6 +15,10 @@ description: |
   current for each mode is defined in hardware using two resistors
   RFS and RTS.
 
+  Some flash ICs use the same one-wire pulse-count protocol but have
+  only a single enable line for both flash and torch modes. For these
+  single-channel variants, only enf-gpios is needed.
+
 properties:
   compatible:
     const: richtek,rt8515
@@ -26,6 +30,11 @@ properties:
   ent-gpios:
     maxItems: 1
     description: A connection to the 'ENT' (enable torch) pin.
+      Not present on single-channel flash ICs that use only one enable
+      line for both flash and torch modes.
+
+  vin-supply:
+    description: Optional input supply for the flash IC.
 
   richtek,rfs-ohms:
     minimum: 7680
@@ -81,10 +90,15 @@ properties:
 
 required:
   - compatible
-  - ent-gpios
   - enf-gpios
   - led
 
+oneOf:
+  - required:
+      - ent-gpios
+  - required:
+      - vin-supply
+
 additionalProperties: false
 
 examples:
@@ -108,4 +122,22 @@ examples:
         };
     };
 
+  - |
+    /* Single-channel flash IC with input supply */
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/leds/common.h>
+
+    led-controller {
+        compatible = "richtek,rt8515";
+        enf-gpios = <&tlmm 3 GPIO_ACTIVE_HIGH>;
+        vin-supply = <&flash_reg>;
+        richtek,rfs-ohms = <16000>;
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
2.54.0



