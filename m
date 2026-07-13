Return-Path: <linux-leds+bounces-9060-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3LUFDDWoVGq/owMAu9opvQ
	(envelope-from <linux-leds+bounces-9060-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 13 Jul 2026 10:56:21 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BF1D749008
	for <lists+linux-leds@lfdr.de>; Mon, 13 Jul 2026 10:56:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-9060-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-9060-lists+linux-leds=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9A50D305F5BC
	for <lists+linux-leds@lfdr.de>; Mon, 13 Jul 2026 08:50:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72B833D0C1D;
	Mon, 13 Jul 2026 08:50:46 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEEDA3B9928
	for <linux-leds@vger.kernel.org>; Mon, 13 Jul 2026 08:50:38 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783932646; cv=none; b=FmCtl1AYyAcVgSrGPsO/1teFl8lbWASNG/1ngytJMyVnQShP1P2E9VLOZ0jVq1YUrw+LF0TjE+NG1RZPsQC72rx6ptCFVVDCG71GhJ101xEqPybKkPUa8zMQkCkQsghz6YvbaJJv47ix0YBEF3R5uAZeTmk8w4gSkPjda1IWl/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783932646; c=relaxed/simple;
	bh=kvTAl7YbglkHZOlkBXRAhmwUF8vVKw+b1LzyHOV+qoM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Lf5dg38jAZh7hXPQPEjh/FaURNeBR9qMaHdXDupEyp/1PlejCFMl5oXSP9JR3OxVR7i5bWapnCEJBRnG5TPJTxcUdcso8SmsA5lmKbrTPjXBQJ1njrFwCWTB1K+sW/+GARZ7h7p2AXcqqz8QBCfbQi9EpjY8e+zg74QgogtDtBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Received: from dude04.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::ac])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <jre@pengutronix.de>)
	id 1wjCMw-0000b3-Of; Mon, 13 Jul 2026 10:50:30 +0200
From: Jonas Rebmann <jre@pengutronix.de>
Date: Mon, 13 Jul 2026 10:50:28 +0200
Subject: [PATCH RESEND v3] dt-bindings: leds: Add default-intensity
 property
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-multicolor-default-v3-1-fb43f3f789cf@pengutronix.de>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Jacek Anaszewski <jacek.anaszewski@gmail.com>, 
 Sven Schwermer <sven.schwermer@disruptive-technologies.com>
Cc: Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kernel@pengutronix.de, Jonas Rebmann <jre@pengutronix.de>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3009; i=jre@pengutronix.de;
 h=from:subject:message-id; bh=kvTAl7YbglkHZOlkBXRAhmwUF8vVKw+b1LzyHOV+qoM=;
 b=owGbwMvMwCV2ZcYT3onnbjcwnlZLYsgKWXZVM3WCL7fZYtGq/8uO9nKV7fVL52YqXTg5hCu/I
 faWQIVDRykLgxgXg6yYIkusmpyCkLH/dbNKu1iYOaxMIEMYuDgFYCJ8Zxn+ux+dn6StFPv8aLv2
 61PpTqGHJsztmjCN/1H/ywDrZ30baxl+s2amrKpnuW1y+1fDhtg/4cs+s16ZzXCnt+pdztPJe5f
 p8gMA
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[pengutronix.de];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:pavel@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:jacek.anaszewski@gmail.com,m:sven.schwermer@disruptive-technologies.com,m:pavel@ucw.cz,m:linux-leds@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:kernel@pengutronix.de,m:jre@pengutronix.de,m:krzk@kernel.org,m:conor@kernel.org,m:jacekanaszewski@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,disruptive-technologies.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER(0.00)[jre@pengutronix.de,linux-leds@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-9060-lists,linux-leds=lfdr.de];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jre@pengutronix.de,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,msgid.link:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7BF1D749008

Document the default-intensity property to set a default color on
multicolor LEDs.

Update pwm-multicolor to support it and update the example to turn the
LED red on boot.

Signed-off-by: Jonas Rebmann <jre@pengutronix.de>
---
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
 Documentation/devicetree/bindings/leds/common.yaml             | 10 ++++++++++
 .../devicetree/bindings/leds/leds-pwm-multicolor.yaml          |  4 ++++
 2 files changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/leds/common.yaml b/Documentation/devicetree/bindings/leds/common.yaml
index f4e44b33f56d..f2f479b565a9 100644
--- a/Documentation/devicetree/bindings/leds/common.yaml
+++ b/Documentation/devicetree/bindings/leds/common.yaml
@@ -73,6 +73,16 @@ properties:
       - keep
     default: off
 
+  default-intensity:
+    description:
+      The initial intensity of the LED color component. As the intensity of
+      each sub-LED is multiplied with the overall brightness, without this
+      property on a sub-LED, it may effectively be initialized at minimum
+      brightness regardless of its linux,default-trigger and default-brightness
+      properties.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    default: 0
+
   linux,default-trigger:
     description:
       This parameter, if present, is a string defining the trigger assigned to
diff --git a/Documentation/devicetree/bindings/leds/leds-pwm-multicolor.yaml b/Documentation/devicetree/bindings/leds/leds-pwm-multicolor.yaml
index a31a202afe5c..7bf687c89411 100644
--- a/Documentation/devicetree/bindings/leds/leds-pwm-multicolor.yaml
+++ b/Documentation/devicetree/bindings/leds/leds-pwm-multicolor.yaml
@@ -45,6 +45,8 @@ properties:
 
           color: true
 
+          default-intensity: true
+
         required:
           - pwms
           - color
@@ -63,12 +65,14 @@ examples:
 
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
-- 
Jonas Rebmann <jre@pengutronix.de>


