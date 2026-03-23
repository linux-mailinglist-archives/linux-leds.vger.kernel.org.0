Return-Path: <linux-leds+bounces-7444-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iA3bL4efwWmFUAQAu9opvQ
	(envelope-from <linux-leds+bounces-7444-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 23 Mar 2026 21:16:07 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 862C22FD123
	for <lists+linux-leds@lfdr.de>; Mon, 23 Mar 2026 21:16:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1020D302B1A6
	for <lists+linux-leds@lfdr.de>; Mon, 23 Mar 2026 20:15:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02D773E1CE6;
	Mon, 23 Mar 2026 20:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=szelinsky.de header.i=@szelinsky.de header.b="Vj99i7yR"
X-Original-To: linux-leds@vger.kernel.org
Received: from szelinsky.de (szelinsky.de [85.214.127.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96A6236C9D2;
	Mon, 23 Mar 2026 20:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.127.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774296882; cv=none; b=iBoMpDjE9VUt384oZlIYYfcZ+Gin04nOXKcUyEmn+jAeHLSyk3REcwMQoOd7UNbThSFkHZRRgtJ/VeJwTHmCVoqOkBYL+qfeuNV8RJ71AB0DZ6b/xkGwq5CsjyNSqyCayVIWWQPGsQixqutr3XOP66ASPW0+9eDsF+P3RaYR35I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774296882; c=relaxed/simple;
	bh=yY/LWajlnz3AK2wpdylbYnBy2Hk6K37im4QbsQ9Lrv8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EPLRl8Zw1XBQGqLDnXsF64pA5Mm07j0dExiaT2Zvhus+irD8OUo1wgKbqqRISlxzmzvc++FUJC8SqTTZebUNxPwGR9vsjjH2t56lETRLzvxsLmDwbksPHPFlWHS04uOn3ZNnyjT3KlzUFJ2hY/7MpGzc1XoiLpqByigcxZqx+/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szelinsky.de; spf=pass smtp.mailfrom=szelinsky.de; dkim=temperror (0-bit key) header.d=szelinsky.de header.i=@szelinsky.de header.b=Vj99i7yR; arc=none smtp.client-ip=85.214.127.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szelinsky.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szelinsky.de
Received: from localhost (localhost [127.0.0.1])
	by szelinsky.de (Postfix) with ESMTP id 9E155E8311E;
	Mon, 23 Mar 2026 21:14:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=szelinsky.de;
	s=mail; t=1774296879;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lkLE4JBJr+qnKRuqZ6quHFfq/KxvXEFIXHcs718Zh2o=;
	b=Vj99i7yRAvC3vlc53t+v8GkvOAzmtH1xgr1jyEVtQy8Njg3UCNtsL44okH9o98VEqrdM2q
	5LkCyJvwNY5yHPtEip0yBOgZSXJxzoI/aJC0+rxc0HeQpib+KP6RPZWp2/NmWShVGdfzGD
	IhUYPxGEeSBZJaq1p/hurRTTUaosm4kNM8EpOZ2V0Ov99oXhVZ34GfcMnsBWAnOROeS8gt
	JQanApZiayfTGBuM+g2DdzKqqbAXGciQXPCFQhYtiCOsJdwWf5ZT3+paPl25F69BcbWwoP
	23ioAjNIdvNPPbXRNUAFcbjfGXKVhBkN54BKA5BYqyCIQ8ah9S17BMtblDU/Nw==
X-Virus-Scanned: Debian amavisd-new at szelinsky.de
Received: from szelinsky.de ([127.0.0.1])
	by localhost (szelinsky.de [127.0.0.1]) (amavisd-new, port 10025)
	with ESMTP id Mv-i_V3Iscx0; Mon, 23 Mar 2026 21:14:39 +0100 (CET)
Received: from p14sgen5.fritz.box (dslb-002-205-089-065.002.205.pools.vodafone-ip.de [2.205.89.65])
	by szelinsky.de (Postfix) with ESMTPSA;
	Mon, 23 Mar 2026 21:14:39 +0100 (CET)
From: Carlo Szelinsky <github@szelinsky.de>
To: Oleksij Rempel <o.rempel@pengutronix.de>,
	Kory Maincent <kory.maincent@bootlin.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org,
	Carlo Szelinsky <github@szelinsky.de>
Subject: [PATCH v2 1/3] dt-bindings: net: pse-pd: add poll-interval-ms property
Date: Mon, 23 Mar 2026 21:12:23 +0100
Message-ID: <20260323201225.1836561-2-github@szelinsky.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260323201225.1836561-1-github@szelinsky.de>
References: <20260323201225.1836561-1-github@szelinsky.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[szelinsky.de,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[szelinsky.de:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-7444-lists,linux-leds=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[github@szelinsky.de,linux-leds@vger.kernel.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[szelinsky.de:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-leds,netdev];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,szelinsky.de:dkim,szelinsky.de:email,szelinsky.de:mid]
X-Rspamd-Queue-Id: 862C22FD123
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add the optional poll-interval-ms property for PSE controllers that
use poll-based event detection instead of interrupts. Defaults to
500ms if not specified.

Signed-off-by: Carlo Szelinsky <github@szelinsky.de>
---
 .../devicetree/bindings/net/pse-pd/pse-controller.yaml    | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/pse-pd/pse-controller.yaml b/Documentation/devicetree/bindings/net/pse-pd/pse-controller.yaml
index cd09560e0aea..329d020f054c 100644
--- a/Documentation/devicetree/bindings/net/pse-pd/pse-controller.yaml
+++ b/Documentation/devicetree/bindings/net/pse-pd/pse-controller.yaml
@@ -27,6 +27,14 @@ properties:
       subnode. This property is deprecated, please use pse-pis instead.
     enum: [0, 1]
 
+  poll-interval-ms:
+    description:
+      Polling interval in milliseconds for PSE controllers using
+      poll-based event detection instead of interrupts. Used when the
+      controller lacks IRQ support or the IRQ line is not wired.
+    default: 500
+    minimum: 50
+
   pse-pis:
     type: object
     description:
-- 
2.43.0


