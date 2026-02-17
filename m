Return-Path: <linux-leds+bounces-6965-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IHRvJNiKlGnTFQIAu9opvQ
	(envelope-from <linux-leds+bounces-6965-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Tue, 17 Feb 2026 16:35:52 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 40A9114D9A4
	for <lists+linux-leds@lfdr.de>; Tue, 17 Feb 2026 16:35:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 113043033896
	for <lists+linux-leds@lfdr.de>; Tue, 17 Feb 2026 15:35:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D63B36C5B6;
	Tue, 17 Feb 2026 15:35:30 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6FA836923F
	for <linux-leds@vger.kernel.org>; Tue, 17 Feb 2026 15:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771342530; cv=none; b=KK1ZH3UTnLnMQN5++Wi4dSlcU0SA7omFh/5Abas4AqbK/4LaZIjZJMPhwk4SmJrXjbv2CFaM8cLJv1DFMJfytthSxTo0BJ+7aQiwedV/omEAX8HyALJj5VnSSc9Q3C1eH8JKGUOYccE1Y3+sCME7/gCjbrDe4wSQVdVGRL2Pt9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771342530; c=relaxed/simple;
	bh=BfSjgWJwIaDqm7KAA2vbCwyQSNo1lOdr4TqVLIqbEyo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MASXP/LiXqqj7HFTbJXuLyvXE5LzWzgz7PP5k080F/39YU0vTT5A6JwOXUmKzSg+Uzvcj4wnIxC79iCNP4yQ951XwtQOkIozlpUqsXKVkiZO41dmK6Bzh2oMUnJSXLibQdadQKX7OsVi9Y7Tk9xnq9sHW3LvVM7OSYpqgZgw33U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=ratatoskr.trumtrar.info)
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.trumtrar@pengutronix.de>)
	id 1vsN6l-00024r-Ab; Tue, 17 Feb 2026 16:35:27 +0100
From: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Date: Tue, 17 Feb 2026 16:35:16 +0100
Subject: [PATCH 1/2] dt-bindings: leds: lp5860: add enable-gpio
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260217-v6-19-topic-ti-lp5860-enable-gpio-v1-1-f5e8edeb5d74@pengutronix.de>
References: <20260217-v6-19-topic-ti-lp5860-enable-gpio-v1-0-f5e8edeb5d74@pengutronix.de>
In-Reply-To: <20260217-v6-19-topic-ti-lp5860-enable-gpio-v1-0-f5e8edeb5d74@pengutronix.de>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Steffen Trumtrar <kernel@pengutronix.de>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Steffen Trumtrar <s.trumtrar@pengutronix.de>
X-Mailer: b4 0.14.3
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.trumtrar@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-leds@vger.kernel.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,0.0.0.0:email];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	DMARC_NA(0.00)[pengutronix.de];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[s.trumtrar@pengutronix.de,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	R_DKIM_NA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-6965-lists,linux-leds=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 40A9114D9A4
X-Rspamd-Action: no action

The VIO_EN pin on the lp5860 can either be connected to VIO power supply
or GPIO.

Add the enable-gpios pin to the binding documentation.

Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
---
 Documentation/devicetree/bindings/leds/leds-lp5860.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/leds/leds-lp5860.yaml b/Documentation/devicetree/bindings/leds/leds-lp5860.yaml
index 1ccba48541595..0e88c71c2d398 100644
--- a/Documentation/devicetree/bindings/leds/leds-lp5860.yaml
+++ b/Documentation/devicetree/bindings/leds/leds-lp5860.yaml
@@ -33,6 +33,11 @@ properties:
   '#size-cells':
     const: 0
 
+  enable-gpios:
+    maxItems: 1
+    description: |
+      GPIO attached to the chip's enable pin (VIO_EN).
+
 patternProperties:
   '^multi-led@[0-9a-f]+$':
     type: object
@@ -74,6 +79,7 @@ unevaluatedProperties: false
 
 examples:
   - |
+    #include <dt-bindings/gpio/gpio.h>
     #include <dt-bindings/leds/common.h>
 
     spi {
@@ -83,6 +89,7 @@ examples:
         led-controller@0 {
             compatible = "ti,lp5860";
             reg = <0x0>;
+            enable-gpios = <&gpio1 1 GPIO_ACTIVE_HIGH>;
             #address-cells = <1>;
             #size-cells = <0>;
 

-- 
2.51.0


