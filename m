Return-Path: <linux-leds+bounces-8478-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9t92NdddIWqlFAEAu9opvQ
	(envelope-from <linux-leds+bounces-8478-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 04 Jun 2026 13:13:27 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5368C63F535
	for <lists+linux-leds@lfdr.de>; Thu, 04 Jun 2026 13:13:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8478-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-leds+bounces-8478-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E939030BFC1B
	for <lists+linux-leds@lfdr.de>; Thu,  4 Jun 2026 11:07:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDCE640803A;
	Thu,  4 Jun 2026 11:07:31 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F5BD40961E
	for <linux-leds@vger.kernel.org>; Thu,  4 Jun 2026 11:07:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780571251; cv=none; b=Yma9R333WQYcqIEmkVQ6Qxq3NPmV+LsdSIm0IarLXfqqkeVD+59vSnCnjgSEGLELIjyBbPymXpti9PTA47SliW6fDFp7jAIysZsvUe6ABKr+haotPUoLQn0F6wp6nGHFNm6nuOtZjjmip5ZeNEdTVkQlXl9ZeH0iwEilFBJcfXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780571251; c=relaxed/simple;
	bh=UI19ptAfbs+/bxokWYB04OjuLUR0nA8sE9SP4yeoLAs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WNcT/+STtXtJ70YnoWQJ88B7q0ROvvMuRbSC44/WHAwyBoIGMtglfUc/ScanQQlDk8mHgBPOK7C6Y9i9JScptX42BljC4uF5EQdFhuWImhrPDHUXjhwiPKcErf2JkTmFRvl6cgt3iQEWDpNykT86zrVlEEMPbKBSKYq89xE8QuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Received: from dude04.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::ac])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <jre@pengutronix.de>)
	id 1wV5v0-0000OO-JM; Thu, 04 Jun 2026 13:07:22 +0200
From: Jonas Rebmann <jre@pengutronix.de>
Date: Thu, 04 Jun 2026 13:06:57 +0200
Subject: [PATCH 1/2] dt-bindings: leds: Add default-intensity property
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260604-multicolor-default-v1-1-b07bff431537@pengutronix.de>
References: <20260604-multicolor-default-v1-0-b07bff431537@pengutronix.de>
In-Reply-To: <20260604-multicolor-default-v1-0-b07bff431537@pengutronix.de>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Jacek Anaszewski <jacek.anaszewski@gmail.com>, 
 Sven Schwermer <sven.schwermer@disruptive-technologies.com>
Cc: Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kernel@pengutronix.de, Jonas Rebmann <jre@pengutronix.de>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2359; i=jre@pengutronix.de;
 h=from:subject:message-id; bh=UI19ptAfbs+/bxokWYB04OjuLUR0nA8sE9SP4yeoLAs=;
 b=owGbwMvMwCV2ZcYT3onnbjcwnlZLYshSjMnQm7TuP8OUFb0Lub/29k18ZNfWvkNCy3hVu/SB/
 eZCGfm7OkpZGMS4GGTFFFli1eQUhIz9r5tV2sXCzGFlAhnCwMUpABPZncXI8M3O+KDeXOsvlYeE
 /CuKnt5zv+D3Y3Hz4pjigIO6RWue2zH8L+9b72vW41N5zFeqj5Gz76/k7JMqn5h8ipfJak9jjvv
 HBQA=
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[pengutronix.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:pavel@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:jacek.anaszewski@gmail.com,m:sven.schwermer@disruptive-technologies.com,m:pavel@ucw.cz,m:linux-leds@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:kernel@pengutronix.de,m:jre@pengutronix.de,m:krzk@kernel.org,m:conor@kernel.org,m:jacekanaszewski@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,disruptive-technologies.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-8478-lists,linux-leds=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[jre@pengutronix.de,linux-leds@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jre@pengutronix.de,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5368C63F535

Document the default-intensity property to set a default color on
multicolor LEDs.

Update pwm-multicolor to support it and update the example to turn the
LED red on boot.

Signed-off-by: Jonas Rebmann <jre@pengutronix.de>
---
 Documentation/devicetree/bindings/leds/common.yaml             | 10 ++++++++++
 .../devicetree/bindings/leds/leds-pwm-multicolor.yaml          |  4 ++++
 2 files changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/leds/common.yaml b/Documentation/devicetree/bindings/leds/common.yaml
index f4e44b33f56d..159a89f77982 100644
--- a/Documentation/devicetree/bindings/leds/common.yaml
+++ b/Documentation/devicetree/bindings/leds/common.yaml
@@ -73,6 +73,16 @@ properties:
       - keep
     default: off
 
+  default-intensity:
+    description:
+      The initial intensity of the LED color component. Used only during
+      initialization. Defaults to 0. As the intensity of each sub-LED is
+      multiplied with the overall brightness, without this property on a
+      sub-LED is effectively initialized at minimum brightness regardless of
+      its linux,default-trigger and default-brightness attributes.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    default: 0
+
   linux,default-trigger:
     description:
       This parameter, if present, is a string defining the trigger assigned to
diff --git a/Documentation/devicetree/bindings/leds/leds-pwm-multicolor.yaml b/Documentation/devicetree/bindings/leds/leds-pwm-multicolor.yaml
index a31a202afe5c..05cc83f4bb82 100644
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
+                linux,default-intensity = <65535>;
             };
 
             led-green {

-- 
2.54.0.129.g3edf2eeba9


