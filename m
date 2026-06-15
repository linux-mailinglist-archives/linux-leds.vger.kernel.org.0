Return-Path: <linux-leds+bounces-8605-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id lF6cKWBgMGogSQUAu9opvQ
	(envelope-from <linux-leds+bounces-8605-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 15 Jun 2026 22:28:16 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F134A689D67
	for <lists+linux-leds@lfdr.de>; Mon, 15 Jun 2026 22:28:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=disroot.org header.s=mail header.b=SKhwhoJW;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8605-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-8605-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=disroot.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DDFA030B9A27
	for <lists+linux-leds@lfdr.de>; Mon, 15 Jun 2026 20:27:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70E7C3B582F;
	Mon, 15 Jun 2026 20:27:06 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B55733B47E5;
	Mon, 15 Jun 2026 20:27:04 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781555226; cv=none; b=F8T/cRbRAMleZpsSIZWhqg3DmMWAjbjqzAmleqNjvnRRqQTe9FK9fnAWQmH9ULjfleHY8d4urSS5kd2hnnXVF1N2uZ+8PRnTt6EBli4qRNu45l6Y5HtddIoWapKT2NSoZE3eH7KyhABT65AZWoVI5eLbNWfEB8BMqPL6xntChP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781555226; c=relaxed/simple;
	bh=Zk8tFmT8sBh+8YVkdD3rFfPzF+/DZYvVz+f8iY0H24o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=quzou0qUcISzJnCJg2Mpv3AiHTnn8RHc1S+YBFib/N7/CJRXDDDN75tGFPtW9F0LY8w7FIWFXEVMjUqltcArHFgBZ4Cmjtx+d9hV+aQIxqFPjvO4b06j5GxjmOb/Eken98tFzpjHNL95mrnO3E/ufRKKomGY3Y9quZ+PVjuPgtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=SKhwhoJW; arc=none smtp.client-ip=178.21.23.139
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 31C5B26E0B;
	Mon, 15 Jun 2026 22:27:03 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id figVLyrlhWlV; Mon, 15 Jun 2026 22:27:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1781555222; bh=Zk8tFmT8sBh+8YVkdD3rFfPzF+/DZYvVz+f8iY0H24o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=SKhwhoJWZje3rLZYRgJLSR9vT/+zmBe62304iUgkpn3ZWE/spjucvT4MvT0IqNeXb
	 81Ea7Y5d5uZ5ZtzI7IpMza6C33w/WZoTUsOscllZM4AKDWDwnAkm8wH8jFZ8diMVJG
	 t9jpJS3g6c74uAjmtqHq10mz9RODg/9eVW1MfLP5aUx2Jj6Z6ASRTNg9zwtRyOnPp0
	 4XpjIYipIynRxrWPSx6fyvhKTPGeteh5N0SoSSZS/hd/B4d/IegxmANs5b1aVUBi8B
	 vo1P2Q7Q0CCbnRFy6HkneaLfJFBxVcJDHPg9u4bsg+2Gdp2tPweqfzz7TNi3LNe1pl
	 dcDzTi6lyD0AA==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Tue, 16 Jun 2026 01:56:43 +0530
Subject: [PATCH 1/3] dt-bindings: mfd: s2mu005-pmic: reorder reg and
 interrupts properties
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260616-s2mu005-pmic-supplement-v1-1-41e84518b711@disroot.org>
References: <20260616-s2mu005-pmic-supplement-v1-0-41e84518b711@disroot.org>
In-Reply-To: <20260616-s2mu005-pmic-supplement-v1-0-41e84518b711@disroot.org>
To: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Pavel Machek <pavel@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-leds@vger.kernel.org, 
 Kaustabh Chakraborty <kauschluss@disroot.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[disroot.org,reject];
	R_DKIM_ALLOW(-0.20)[disroot.org:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-8605-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[kauschluss@disroot.org,linux-leds@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS(0.00)[m:andre.draszik@linaro.org,m:lee@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:pavel@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-samsung-soc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-leds@vger.kernel.org,m:kauschluss@disroot.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[disroot.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kauschluss@disroot.org,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[disroot.org:dkim,disroot.org:email,disroot.org:mid,disroot.org:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F134A689D67

As per convention, and as also reiterated by maintainers [1], the
properties in schema is to be ordered similar to how its done in
devicetree sources; starting from compatible and reg. Re-order the
properties in this schema accordingly.

Link: https://lore.kernel.org/all/0240eb13-6c56-4879-8db7-b990a220a78f@kernel.org [1]
Suggested-by: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 .../devicetree/bindings/mfd/samsung,s2mu005-pmic.yaml        | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/samsung,s2mu005-pmic.yaml b/Documentation/devicetree/bindings/mfd/samsung,s2mu005-pmic.yaml
index aff68c035b38e..8354422e39b1e 100644
--- a/Documentation/devicetree/bindings/mfd/samsung,s2mu005-pmic.yaml
+++ b/Documentation/devicetree/bindings/mfd/samsung,s2mu005-pmic.yaml
@@ -21,14 +21,17 @@ properties:
   compatible:
     const: samsung,s2mu005-pmic
 
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
   flash:
     $ref: /schemas/leds/samsung,s2mu005-flash.yaml#
     description:
       Child node describing flash LEDs.
 
-  interrupts:
-    maxItems: 1
-
   muic:
     $ref: /schemas/extcon/samsung,s2mu005-muic.yaml#
     description:
@@ -49,9 +52,6 @@ properties:
 
     unevaluatedProperties: false
 
-  reg:
-    maxItems: 1
-
 required:
   - compatible
   - reg

-- 
2.53.0


