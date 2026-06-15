Return-Path: <linux-leds+bounces-8606-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nNM9EIZgMGokSQUAu9opvQ
	(envelope-from <linux-leds+bounces-8606-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 15 Jun 2026 22:28:54 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A97D689D7A
	for <lists+linux-leds@lfdr.de>; Mon, 15 Jun 2026 22:28:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=disroot.org header.s=mail header.b=PxQkmN4H;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8606-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-8606-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=disroot.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2A455303ADFB
	for <lists+linux-leds@lfdr.de>; Mon, 15 Jun 2026 20:27:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9453C3B582F;
	Mon, 15 Jun 2026 20:27:13 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B92E53B6378;
	Mon, 15 Jun 2026 20:27:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781555233; cv=none; b=fU+t+E/KIXOfig3AQAMxweNVctiKY2pAFvISyn9eA28uAEbFhMXyf70hE3STzP35sM0lOgFDpdSabugLbfWs5w/HGb/S5ZKP0dDHQKe9HwmYN0y+YQotgQccz2czM5lKx5o/MCfqzno6ULefHUh7CbNKpzipIkFGoyR+PMkpuBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781555233; c=relaxed/simple;
	bh=4Ehnv6wai4uzMGEHKx6AgbanHqW57OVouBzzTtDCAAU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=E2nnkOs3nuvfVECw6YzeSNCByTkYgNe92cu6S8chwbOfqJwsBLyfqnvrkzPe6BA5R5boo5J7xbyLJZySlaSUPFWidiOe6TJdd+xfC+t5Fz+wdkg5OM44su7EukpUHSl6fN3SLZ5dgFvO2bwGBxVM5MXYS4NcifN/8hkJc9cwaos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=PxQkmN4H; arc=none smtp.client-ip=178.21.23.139
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 6D86C273A3;
	Mon, 15 Jun 2026 22:27:10 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T5qxQ4HR8Bd7; Mon, 15 Jun 2026 22:27:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1781555229; bh=4Ehnv6wai4uzMGEHKx6AgbanHqW57OVouBzzTtDCAAU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=PxQkmN4HP9W30blgUMhXflgVekeaZNP1kHspRK+EXUvZfHR1m1w2gZPOOxKd6Xj4x
	 ozn+o6+qslXCrqc5MMDSrfNHrXvQlKTr5MmSmH9BAThUZ0U9veR/r8flv8eey1FcVJ
	 dG7eW1hffSuGyOuhPvhURcvfQ73n+ad+ckg8zvdQj/8y5wXeV6laLwCmSZZRqedlvB
	 BMH0wbu7+LgmRHDD9dVdRxPr/p1adHX4rkQbiC6QwjwxuK0y+VWnaHdsYMRg3gY3B6
	 1TZrEBAVKtzc4ZJAf33y0bXA4xg/b2d/DFOjxV6pp8DKLkJZ981LIhKpkZVmbFc5hC
	 VW3GDnGW36gWw==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Tue, 16 Jun 2026 01:56:44 +0530
Subject: [PATCH 2/3] dt-bindings: mfd: s2mu005-pmic: drop compatible
 property for multi-led node
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260616-s2mu005-pmic-supplement-v1-2-41e84518b711@disroot.org>
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
	TAGGED_FROM(0.00)[bounces-8606-lists,linux-leds=lfdr.de];
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
X-Rspamd-Queue-Id: 9A97D689D7A

The multi-led node is very trivial in description and also has no
sub-nodes. A compatible string property for such nodes is not preferred
by upstream. Remove said node from the schema. While at it, also add a
description following its other sibling nodes.

Link: https://lore.kernel.org/all/d2f4cb7d-5c3e-4b9a-86ca-04262cbb9775@kernel.org
Suggested-by: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 .../devicetree/bindings/mfd/samsung,s2mu005-pmic.yaml       | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/samsung,s2mu005-pmic.yaml b/Documentation/devicetree/bindings/mfd/samsung,s2mu005-pmic.yaml
index 8354422e39b1e..f62fe7a05147e 100644
--- a/Documentation/devicetree/bindings/mfd/samsung,s2mu005-pmic.yaml
+++ b/Documentation/devicetree/bindings/mfd/samsung,s2mu005-pmic.yaml
@@ -38,17 +38,10 @@ properties:
       Child node describing MUIC device.
 
   multi-led:
-    type: object
+    $ref: /schemas/leds/leds-class-multicolor.yaml#
 
-    allOf:
-      - $ref: /schemas/leds/leds-class-multicolor.yaml#
-
-    properties:
-      compatible:
-        const: samsung,s2mu005-rgb
-
-    required:
-      - compatible
+    description:
+      Child node describing the RGB status LED.
 
     unevaluatedProperties: false
 

-- 
2.53.0


