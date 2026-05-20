Return-Path: <linux-leds+bounces-8242-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kPKcK74HDmp25gUAu9opvQ
	(envelope-from <linux-leds+bounces-8242-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 20 May 2026 21:13:02 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BCE85597F5C
	for <lists+linux-leds@lfdr.de>; Wed, 20 May 2026 21:13:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D1FA6328B059
	for <lists+linux-leds@lfdr.de>; Wed, 20 May 2026 18:24:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA3333FE365;
	Wed, 20 May 2026 18:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e6dEsgK9"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 769233FCB17
	for <linux-leds@vger.kernel.org>; Wed, 20 May 2026 18:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779301404; cv=none; b=YdHOp+vV9MzEgmjCdYEoMMoldcGhUIpr/UJG652PEQGBWxPtcEJMxHsrPjnoqYXpkqK/e2fnbpCuaCIl5HofJOJ7KVGkfT35Tr3bkTxpWWRVnitQBDM7MKnsd81BXYEjSrGWYAoqtId0v5Lll53cluf9eE8h1pTiuPPZNDwRiok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779301404; c=relaxed/simple;
	bh=J4ST441g4GcL9Qf2m4E79qGEfDOnvVL9JwIy2R9JJ48=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bM93hQ9FFTbPOSZnxBSTLwpVLTvOBx/VnkOJyE3THNl3LcgRunsDyGI5OO3+KnGK+TSPBdbl4ZDGz53IqPxhsSrBhb9bXdji60IYoDccAIiWFWyWsFXggMTgeK+ClUgSNtoklFq/sy/rVwc7ONgHlBdEhOcl5EY74Yz90AWGU84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e6dEsgK9; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-459bf19e87bso3177668f8f.1
        for <linux-leds@vger.kernel.org>; Wed, 20 May 2026 11:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779301401; x=1779906201; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ihKUarJUZQ4s5QQSEeZE4451TwDBF8kmyP9i/ksYTag=;
        b=e6dEsgK9ifn4czM4/OC+NfK2dCyeL3G6gI3yw6pMGcXfWMXFrk2ETn5lxP74AQLc06
         bGMLvHU764GOjoja8mTipUNMWFqnF+y1GVQ7T6GB+KcW5TObXi3JW1vS6A7BqWnG+Twt
         QnQ0KOb3yy4ihkuo+61OvEZBUtSruf2/U/Bse4l59mftjUV+/wqF1CPVXtOgQIDjj6Mk
         VWcz5tbiclFmgXVXV43nS+jG4CYtbwca0d0LQDJfC0CoFcK1WTZPAyLXHCHGDsSggL17
         LoJ0SmqyJwCYfIV2Qtvm/L7tFJwe/WtUTyJ3dtXUJk7C5sONQ4FadSGi6ztr8LJsccMr
         JIHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779301401; x=1779906201;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ihKUarJUZQ4s5QQSEeZE4451TwDBF8kmyP9i/ksYTag=;
        b=pqNYnXDJQj+VUT1bhFwNSJ6uSC9ZzBaUMA/530yM4QqIXesJOWc6gT58o66LjR4jPE
         Ao/rG0AJPTEchsj7vGKCxUFg8/2JWD75NBrFLpmtvcKJvio+grefuY9TX8zuml07rHYK
         2MgW8XQxP2TLZn2OXv1qpjgwqrZ15OE8UceicFZiAqvW21ZLIbG/41RLsXqlJZ8xSCIV
         ef9B+JbHy62phDdQYIT3lzqpnHO5sQHOkOKQl+xn3/39Mc80XD0Y5Rs/+j9lcMlERvVW
         N/HXmkv1l5vhaLF4Cheju3PrZGnBXfNnY5BMCDxYvSfLCOxgPuKXgAHUMzVtQmR4idHO
         52Aw==
X-Forwarded-Encrypted: i=1; AFNElJ8rbghWYSmmsuxudEzsQe3xabMSYQIg1irOTGvt0xKhFxjsKGhLd5l4NuIDnX5na7QlvlaiN8Kt4di+@vger.kernel.org
X-Gm-Message-State: AOJu0YxHGingPmw6UTxc7CelV7RXooaULJ74WlgFa8fB56zp8c/mm6A/
	/fb0JSiV14VdxifJ9Cuj7cWS4EaseJ6zGLPUvyecy4J8MkwqCq2gcAGs
X-Gm-Gg: Acq92OHe+9c82UN4wNvEjcWPvsONHPKpMmPRa6YUad84uLw/Ot3kgnt05Ee6fndFvFy
	7sRM+gMNFo5mt60QvarjwNHZsBj1ZeIWsZiXunCHazW91MKDfnTOSvN9vcXFXTdxmE26aNrfFk5
	MqkRPHiyV3EpdRnryRJGCnuy4Bn/MqT3ze2ecngTF6FNlLCEeMNkJbhKjdTLzEhh/NbKHn1tLS5
	XcBDJqJ+evBlFuCVz7HWdvuBfx0yqAER8q4rHtcjGFGG7ddiUH3Uob4lpH8Qm2fYwK+5CXf54HB
	2Hx99LeqiHEnModerarFEfl/TolCk2tUPUjH5yXWNQvs8GlGomP7ovayNSq+M57Djvep5Yu+jQ2
	+LpSsnY5ET9NQtNHHe0lyZVDMDGZ5MgScOwlWZpRq4KxIVh5f07g7Qe2UADk9dVqijBQqzsklii
	Buv/NnyHkJQKYajv6/6n8uCXs=
X-Received: by 2002:a05:6000:25c6:b0:454:a12c:6cdb with SMTP id ffacd0b85a97d-45e5c57d4bcmr41302298f8f.2.1779301400746;
        Wed, 20 May 2026 11:23:20 -0700 (PDT)
Received: from xeon ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9ec3b18fsm51297739f8f.11.2026.05.20.11.23.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 11:23:20 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org
Subject: [PATCH v6 4/6] dt-bindings: mfd: motorola-cpcap: document Mapphone and Mot CPCAP
Date: Wed, 20 May 2026 21:21:22 +0300
Message-ID: <20260520182124.117863-5-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260520182124.117863-1-clamor95@gmail.com>
References: <20260520182124.117863-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-8242-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Queue-Id: BCE85597F5C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add compatibles for Mapphone and Mot CPCAP subdevice compositions. Both
variations cannot use st,6556002 fallback since they may be based on
different controllers.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/mfd/motorola,cpcap.yaml       | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/motorola,cpcap.yaml b/Documentation/devicetree/bindings/mfd/motorola,cpcap.yaml
index 76705ea56805..da7abe2ec912 100644
--- a/Documentation/devicetree/bindings/mfd/motorola,cpcap.yaml
+++ b/Documentation/devicetree/bindings/mfd/motorola,cpcap.yaml
@@ -14,9 +14,14 @@ allOf:
 
 properties:
   compatible:
-    items:
-      - const: motorola,cpcap
-      - const: st,6556002
+    oneOf:
+      - enum:
+          - motorola,mapphone-cpcap
+          - motorola,mot-cpcap
+
+      - items:
+          - const: motorola,cpcap
+          - const: st,6556002
 
   reg:
     maxItems: 1
-- 
2.51.0


