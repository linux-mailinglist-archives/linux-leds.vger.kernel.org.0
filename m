Return-Path: <linux-leds+bounces-7904-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ENNUCS8p8mkxogEAu9opvQ
	(envelope-from <linux-leds+bounces-7904-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 29 Apr 2026 17:52:15 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 712984974F6
	for <lists+linux-leds@lfdr.de>; Wed, 29 Apr 2026 17:52:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2BDC2316D081
	for <lists+linux-leds@lfdr.de>; Wed, 29 Apr 2026 15:45:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63D93385533;
	Wed, 29 Apr 2026 15:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Eozo+6zj"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0010383C81
	for <linux-leds@vger.kernel.org>; Wed, 29 Apr 2026 15:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777477511; cv=none; b=OaZjLA5FmUiQkWCGCOpi/62XMjEqQjiBV4F34+x9GOQdYgU/vurbWP1oRVDoWYK3kHaOJBsvvh8qNYaHRvvgKizClwsor8DZuljG1UpPnyOBkMaUQfeCTL9cmLhAPd0rrHfSeDjJgEvePrwNZ1VFAlN1TLTqfe1kpOFzIS5yrso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777477511; c=relaxed/simple;
	bh=W1Q97PzM4MjRKWidF01pEeQQIC0Jg95ywafaeF9c8MY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nrtsNYRwzqLuR9Ps3xX3t8WYR44fUo3ppkc/6eX/EGRwHzC83UbnMdGehJLI/KZe29mt9hihbHrA+N1NDc4sLY7ND7f85RsyfyyzXa+E9A+0A+fWtoh6R0qtXedH05vtZ7BccdofcjUgOrBcI0BtZQtOsvfcsuquphabWJfDbG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Eozo+6zj; arc=none smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-12c637089ccso845996c88.1
        for <linux-leds@vger.kernel.org>; Wed, 29 Apr 2026 08:45:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777477508; x=1778082308; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=saN4HD4h1c5rx002LnGwqjdinW0FYSf0f7F3UZlkMCM=;
        b=Eozo+6zjBPsQg3HyylDLGgXQTbm5PgC3G2v5TOY8UDTPIZY/k1mSB/OMkLL6jVH5TT
         WQFj3yooshh1DmeAzaJEE2xAoR61XgF5DmhN14eJWGcGFBcoTig5kChuOjJH3QVtTAkR
         egRGiA27ZKCIjm4Ygsb30Ab63W9WoToxYtGvnQ7ljOsxq+0PWvABoD4PL+KcRRvU+0na
         qekl/EVUFrGb9s8F8QNIe1DCkqqtRRB/NRKl5u0yulePs1rka04YSKI/Kbt7xAgT7jEQ
         xhp32xJTd4Gor2MQvNJa930cHUvLbBA7aZCz20lLhqKCifvGHpZoqQUIOhX/l1aegEcG
         5wJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777477508; x=1778082308;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=saN4HD4h1c5rx002LnGwqjdinW0FYSf0f7F3UZlkMCM=;
        b=ToloZjwgM+sPTqLqqPQoI3ZatPsSkE7BhIFMeY8VRsjcmCvtcQ09TYnqsx8cFxz8+w
         f5L8e9BiyznId18PKYs49zkpHnnwQIBfzq9KH3pkw09KMyl4yfxwXWbX9xe/IgeHDIZ8
         tooiAw7aygxXhRM2pitRRuc5YMqUbhse01fkhLWCOYRyda9WzkQE+oEfdtXglT75wf4j
         XB2LTmVS39PBn0y1GQLgm3e0iyF93zhn70R6+d7TW+cha5KyPIH/XKIjDPvtkwIIyatX
         ekz0SrUEmvgmbitOqV4xJB1D9ddgkFEo7KGN8XYh9JJiW/1OdxkY2n0536IU3uzpoP9X
         vHMw==
X-Forwarded-Encrypted: i=1; AFNElJ+0DtQn2T9rbYwwcbzD6seCaPrgFxRdBDaLcjOEfzP5NTkzpGg4DEETWcIgFqhfXOgLNeFuhd4gdKAF@vger.kernel.org
X-Gm-Message-State: AOJu0YwGTPgYpcJxKC+xzF94CQYaP0Hnhl/ka8FEFPMAzJ3pnPcfS9OJ
	KWT0JOaD8IvMZEOV29xnOCAcjcT3JhA/0jwyVLWP++UOIok/O4YLdNBi
X-Gm-Gg: AeBDietfJGGgJGkJ9i8tY6zk44C0nbvykoaXK68+GQSIOqQOtQzdG1r4tHFT8ELSp7J
	Q8dGBCotHr7hoYx3ZV+7d2dD0qdlO0NNeWKMUSY/d/6fQVsCdYkivwHW0PTVBp99PFZ+pdy3S5T
	eO9KjkAPxxep1DDn6mR7huuHHRjtvHVwjDJFIf5uvnIg0rKAhqmzPmgbmVtWp/QmwqEQqqe32gE
	93atfbxvvVn8VF5dZs3XPYhYpEDVq0GlPxCEYbfO7xfw26v3/l6pstV8if3+83xQ7XrZGH254Yq
	VGgHQj0fZy3PxRmvgr/rDUmwgr99FbhMaZnc4oFuL4zR2Wc/89jU/dgKh6XUieXo8MZ7UhpRiWA
	wBpHjazQbRHctMUlD7APGkVgxGWtARIpIoTS9xUCQB4oLKDgVMIvSZV8ptIm+UJE7PKWd61Owsh
	wj2NDxEuAc9G8qU0hY2nzgms6OtuSJHjk=
X-Received: by 2002:a05:701b:260c:b0:12d:de3e:cc03 with SMTP id a92af1059eb24-12dde3ecdb8mr2034608c88.42.1777477507830;
        Wed, 29 Apr 2026 08:45:07 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a59:55d1::1002])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12de320ecf9sm3610166c88.2.2026.04.29.08.45.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 08:45:07 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-leds@vger.kernel.org
Cc: lee@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	luccafachinetti@gmail.com,
	pzalewski@thegoodpenguin.co.uk,
	daniel@zonque.org,
	Jun Yan <jerrysteve1101@gmail.com>
Subject: [PATCH v3 3/5] dt-bindings: leds: leds-is31fl32xx: Add powerdown-gpios property
Date: Wed, 29 Apr 2026 23:44:47 +0800
Message-ID: <20260429154449.730880-4-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260429154449.730880-1-jerrysteve1101@gmail.com>
References: <20260429154449.730880-1-jerrysteve1101@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 712984974F6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,thegoodpenguin.co.uk,zonque.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7904-lists,linux-leds=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jerrysteve1101@gmail.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-0.997];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,0.0.0.1:email]

The IS31FL32XX series features an SDB shutdown pin.
Driving it low (active low) places the chip into hardware shutdown mode
for power saving, while all register contents are preserved
and registers are not reset.

Add powerdown-gpios property to describe the GPIO connected to the
SDB pin of IS31FL32XX series LED controllers.

Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
---
 .../devicetree/bindings/leds/issl,is31fl32xx.yaml    | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/leds/issl,is31fl32xx.yaml b/Documentation/devicetree/bindings/leds/issl,is31fl32xx.yaml
index 25ce67940c88..9b129f962d1f 100644
--- a/Documentation/devicetree/bindings/leds/issl,is31fl32xx.yaml
+++ b/Documentation/devicetree/bindings/leds/issl,is31fl32xx.yaml
@@ -45,6 +45,15 @@ properties:
       When present, the chip's PWM will operate at ~22kHz as opposed
       to ~3kHz to move the operating frequency out of the audible range.
 
+  powerdown-gpios:
+    maxItems: 1
+    description:
+      GPIO connected to the chip's SDB pin.
+      Driving this GPIO low places the chip into hardware shutdown mode
+      for power saving. All register contents are preserved and registers
+      are not reset during shutdown. The chip exits hardware shutdown mode
+      when the SDB pin is pulled high.
+
   "#address-cells":
     const: 1
 
@@ -158,6 +167,7 @@ additionalProperties: false
 
 examples:
   - |
+    #include <dt-bindings/gpio/gpio.h>
     #include <dt-bindings/leds/common.h>
 
     i2c {
@@ -170,6 +180,8 @@ examples:
             #address-cells = <1>;
             #size-cells = <0>;
 
+            powerdown-gpios = <&gpio0 11 GPIO_ACTIVE_LOW>;
+
             led@1 {
                 reg = <1>;
                 color = <LED_COLOR_ID_RED>;
-- 
2.53.0


