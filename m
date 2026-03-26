Return-Path: <linux-leds+bounces-7511-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SIhENr3nxGkz5AQAu9opvQ
	(envelope-from <linux-leds+bounces-7511-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 26 Mar 2026 09:01:01 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 55E32330CA3
	for <lists+linux-leds@lfdr.de>; Thu, 26 Mar 2026 09:00:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 343F9306A4F5
	for <lists+linux-leds@lfdr.de>; Thu, 26 Mar 2026 07:57:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F2633B6BF3;
	Thu, 26 Mar 2026 07:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="spV/vS4n"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D2AA3B6364;
	Thu, 26 Mar 2026 07:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774511853; cv=none; b=tR+FIVNAL8d5ClQT8ZKFG+luwjbNHRXbfWL0s6fwhW0ADsHpL7ktwPXotd8Et2ZOObtNxvYRNt5/YXA363jR2m5meK6df6Ew/ffOR/ybBuWyDCm/lApV2P0gc419MEo3b48gc8tDudm0BVuMZ8T+0iSryw+G6k1LWpO/4Sb0u7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774511853; c=relaxed/simple;
	bh=vtWkUX7nJXT4VBvGcL/Y+2qsHiE82woSkLVt9snsg2I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fF5tpY3X/iIFtBAzSdQKmiU8ihLrgyobPgHd1BOfUQWWRNi2v/tCv2g3Z80SCPpT7MScVF/8wkGGEw/K/XZLeJOCHhRoxVrXPN04sNnXN/OVCrQjYyvxWpUqsQwPUWLDMWI1WtcHDQ1AixWvvI6BZyGxJViKeH4lezTgzodtzqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=spV/vS4n; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id D02DDC2BC87;
	Thu, 26 Mar 2026 07:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774511852;
	bh=vtWkUX7nJXT4VBvGcL/Y+2qsHiE82woSkLVt9snsg2I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=spV/vS4nhb3kViGo8Kl3MNZJio1YqbA6a+cuo3k/Ma5/Fh/zY/OmE7N+3T+Lbv9un
	 5pL/7PluFmZ8535zyc2wBuSgS7inOAPTdKXQ/AopStiTqSsGjFuGCWeXpGffh+Zo9q
	 vJBfXu5TkrFQfNUcJCmcjFrLG16zEEwzM9HmTZVh7kyDlUq3G44MOuXyCObVSEn4KR
	 sbKfguh+2TcOCn0D/T1apc9S2rn6JNC7Ko6UuvWRgNxsksP3Fae1aWw5PPRFphIxIO
	 +JUoXLsaHzuhIvDXFcbv5+sJvdfthc4rQk/75kW06Ec9v6OJH/L2qRgEZ6z1nsPctc
	 qRiXtMr08BbZA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE94E106F2E8;
	Thu, 26 Mar 2026 07:57:32 +0000 (UTC)
From: Rudraksha Gupta via B4 Relay <devnull+guptarud.gmail.com@kernel.org>
Date: Thu, 26 Mar 2026 00:57:31 -0700
Subject: [PATCH v3 1/3] dt-bindings: leds: rt8515: Support single-GPIO
 flash ICs with vin supply
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260326-expressatt_camera_flash-v3-1-e75e5d58990f@gmail.com>
References: <20260326-expressatt_camera_flash-v3-0-e75e5d58990f@gmail.com>
In-Reply-To: <20260326-expressatt_camera_flash-v3-0-e75e5d58990f@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774511852; l=2722;
 i=guptarud@gmail.com; s=20240916; h=from:subject:message-id;
 bh=3x0hUrCLPBGYYoXg/LCYnxv46dNWEF519f2FRG1sBE0=;
 b=8TOw20x4xSxnXws/3MeyRTo1c6YiWeDxoLkOcW50WnaS4RS9KgYUoCHwLpX0ej5bCtjYgyync
 X3NwnI1V5FvDer4M9wORUZ930gLNjnpTTnvfzvKyR4LoNQ2kbeq6SWl
X-Developer-Key: i=guptarud@gmail.com; a=ed25519;
 pk=ETrudRugWAtOpr0OhRiheQ1lXM4Kk4KGFnBySlKDi2I=
X-Endpoint-Received: by B4 Relay for guptarud@gmail.com/20240916 with
 auth_id=211
X-Original-From: Rudraksha Gupta <guptarud@gmail.com>
Reply-To: guptarud@gmail.com
X-Spamd-Result: default: False [-0.16 / 15.00];
	FREEMAIL_REPLYTO_NEQ_FROM(2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-7511-lists,linux-leds=lfdr.de,guptarud.gmail.com];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,microchip.com:email];
	RSPAMD_URIBL_FAIL(0.00)[microchip.com:query timed out];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_REPLYTO(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,microchip.com];
	DKIM_TRACE(0.00)[kernel.org:+];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	HAS_REPLYTO(0.00)[guptarud@gmail.com];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RSPAMD_EMAILBL_FAIL(0.00)[conor.dooley.microchip.com:query timed out];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 55E32330CA3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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
2.53.0



