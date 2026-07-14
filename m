Return-Path: <linux-leds+bounces-9077-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id o4YrEyPnVWojvQAAu9opvQ
	(envelope-from <linux-leds+bounces-9077-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Tue, 14 Jul 2026 09:37:07 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ECE98751F5D
	for <lists+linux-leds@lfdr.de>; Tue, 14 Jul 2026 09:37:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-9077-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-9077-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2DB5C3032ACC
	for <lists+linux-leds@lfdr.de>; Tue, 14 Jul 2026 07:36:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD0773EEAE1;
	Tue, 14 Jul 2026 07:36:00 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 056243EEAE9
	for <linux-leds@vger.kernel.org>; Tue, 14 Jul 2026 07:35:57 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784014560; cv=none; b=BIJqb/KkdU55GBQvub+wnWXUH4kK+k9Vc/SBuZuLZCXTYRBtwsmxNm2/NtcRVkqcZh9EcoO7wanaFYtCHt3P8pVZl09hNHRRlI+99R0JP/yn33BlOMSSax0ZzKTlNlwQW1Ssr+5tQ3oFfpdcSBNRIuL4bZwcUgdpNy1KLez9yAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784014560; c=relaxed/simple;
	bh=BvI5f/SGs3rOnIaf937RzhNNvfMs8aUchvXoAXE8+Rg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=sVHT7bnJinjlGlDrCdTD+awDcATMBN7HkeOS8uM3qnKgEIkOGHTkRK0cunZfoWB3I5RPiGvCjw5TsefTIk3/xDKvxDtA65DnPLi/OZByP71HdcRBI5Y8ZrBFEuiHJi7moyrS65XeC501XEfph/4iryxdH74+m3jXAziMmnf269s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Received: from dude04.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::ac])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <jre@pengutronix.de>)
	id 1wjXg5-0001R0-Hm; Tue, 14 Jul 2026 09:35:41 +0200
From: Jonas Rebmann <jre@pengutronix.de>
Date: Tue, 14 Jul 2026 09:35:03 +0200
Subject: [PATCH v4] dt-bindings: leds: Add default-intensity property
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-multicolor-default-v4-1-c2335b32bc39@pengutronix.de>
X-B4-Tracking: v=1; b=H4sIAKbmVWoC/33NQQ6DIBCF4as0rEszgErSVe/RdCEwKI0VA2psj
 Hcv2o1JTZd/MvO9mUQMDiO5nmYScHTR+TZFdj4RXZdthdSZ1IQDL6CAjL6GpnfaNz5Qg7ZMRRl
 DoVAbhLwk6bELaN20offHt+Ognqj7VVovahd7H97b6sjWu78DI6NAFUhlbSZYLuStw7Ya+uBbN
 10MknVl5HsnP3R4ctCA5JIZWyg4dMTOEXDoCMooz3TOJOhSaPPjLMvyASQDbW5bAQAA
X-Change-ID: 20260604-multicolor-default-11e3becde05a
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Jacek Anaszewski <jacek.anaszewski@gmail.com>, 
 Sven Schwermer <sven.schwermer@disruptive-technologies.com>
Cc: Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kernel@pengutronix.de, Stefan Wahren <wahrenst@gmx.net>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Jonas Rebmann <jre@pengutronix.de>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3441; i=jre@pengutronix.de;
 h=from:subject:message-id; bh=BvI5f/SGs3rOnIaf937RzhNNvfMs8aUchvXoAXE8+Rg=;
 b=owGbwMvMwCV2ZcYT3onnbjcwnlZLYsgKfXbGNpVL5iz793N/NPxfZc8RD66JvevHkXT5yvyMI
 O02G3/mjlIWBjEuBlkxRZZYNTkFIWP/62aVdrEwc1iZQIYwcHEKwEQOLWL4K5tz9771zUue6S1a
 qzMfCrz96PH7+PU3qz5wvL1dLxJzNpSRYdI51seijm9LZ27v6LD8b30/kWdFxDeey7v1FJ2m7Lh
 gxwEA
X-Developer-Key: i=jre@pengutronix.de; a=openpgp;
 fpr=0B7B750D5D3CD21B3B130DE8B61515E135CD49B5
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::ac
X-SA-Exim-Mail-From: jre@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-leds@vger.kernel.org
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[pengutronix.de];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:pavel@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:jacek.anaszewski@gmail.com,m:sven.schwermer@disruptive-technologies.com,m:pavel@ucw.cz,m:linux-leds@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:kernel@pengutronix.de,m:wahrenst@gmx.net,m:conor.dooley@microchip.com,m:jre@pengutronix.de,m:krzk@kernel.org,m:conor@kernel.org,m:jacekanaszewski@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,disruptive-technologies.com];
	FORGED_SENDER(0.00)[jre@pengutronix.de,linux-leds@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-9077-lists,linux-leds=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jre@pengutronix.de,linux-leds@vger.kernel.org];
	FREEMAIL_CC(0.00)[ucw.cz,vger.kernel.org,pengutronix.de,gmx.net,microchip.com];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp,msgid.link:url,pengutronix.de:from_mime,pengutronix.de:email,pengutronix.de:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: ECE98751F5D

Document the default-intensity property to set a default color on
multicolor LEDs.

Update pwm-multicolor to support it and update the example to turn the
LED red on boot.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Jonas Rebmann <jre@pengutronix.de>
---
Changes in v4:
- Move default to leds-pwm-multicolor.yaml as other drivers have other
  defaults (Thanks, Conor)
- Move definition of default-intensity property next to default-brightness
- Slighly improve description
- Link to v3: https://patch.msgid.link/20260630-multicolor-default-v3-1-24c5170ca3cd@pengutronix.de

Changes in v3:
- make default-intensity property description more generic and less
  redundant (Thanks, Conor)
- Drop applied patch that introduces the property (Thanks, Lee)
- Link to v2: https://patch.msgid.link/20260605-multicolor-default-v2-0-ed07271df6b0@pengutronix.de

Changes in v2:
- dt-bindings: Use correct property name in example
- dt-bindings: Add missing word in property description
- Link to v1: https://patch.msgid.link/20260604-multicolor-default-v1-0-b07bff431537@pengutronix.de
---
 Documentation/devicetree/bindings/leds/common.yaml              | 9 +++++++++
 Documentation/devicetree/bindings/leds/leds-pwm-multicolor.yaml | 5 +++++
 2 files changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/leds/common.yaml b/Documentation/devicetree/bindings/leds/common.yaml
index f4e44b33f56d..3e6f913070b0 100644
--- a/Documentation/devicetree/bindings/leds/common.yaml
+++ b/Documentation/devicetree/bindings/leds/common.yaml
@@ -179,6 +179,15 @@ properties:
       initialization. If the option is not set then max brightness is used.
     $ref: /schemas/types.yaml#/definitions/uint32
 
+  default-intensity:
+    description:
+      The initial intensity of the LED color component. As the intensity of
+      each sub-LED is multiplied by the overall brightness, without this
+      property on a sub-LED, it may effectively be initialized at a brightness
+      of 0 regardless of its linux,default-trigger and default-brightness
+      properties.
+    $ref: /schemas/types.yaml#/definitions/uint32
+
   panic-indicator:
     description:
       This property specifies that the LED should be used, if at all possible,
diff --git a/Documentation/devicetree/bindings/leds/leds-pwm-multicolor.yaml b/Documentation/devicetree/bindings/leds/leds-pwm-multicolor.yaml
index a31a202afe5c..08e28c5f08a8 100644
--- a/Documentation/devicetree/bindings/leds/leds-pwm-multicolor.yaml
+++ b/Documentation/devicetree/bindings/leds/leds-pwm-multicolor.yaml
@@ -45,6 +45,9 @@ properties:
 
           color: true
 
+          default-intensity:
+            default: 0
+
         required:
           - pwms
           - color
@@ -63,12 +66,14 @@ examples:
 
         multi-led {
             color = <LED_COLOR_ID_RGB>;
+            linux,default-trigger = "default-on";
             function = LED_FUNCTION_INDICATOR;
             max-brightness = <65535>;
 
             led-red {
                 pwms = <&pwm1 0 1000000>;
                 color = <LED_COLOR_ID_RED>;
+                default-intensity = <65535>;
             };
 
             led-green {

---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20260604-multicolor-default-11e3becde05a

Best regards,
--  
Jonas Rebmann <jre@pengutronix.de>


