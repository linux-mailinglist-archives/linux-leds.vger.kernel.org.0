Return-Path: <linux-leds+bounces-8069-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aOFLOEFnAGq1IgEAu9opvQ
	(envelope-from <linux-leds+bounces-8069-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sun, 10 May 2026 13:08:49 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 84F89503B6F
	for <lists+linux-leds@lfdr.de>; Sun, 10 May 2026 13:08:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5C8773003369
	for <lists+linux-leds@lfdr.de>; Sun, 10 May 2026 11:08:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B9B837F8A6;
	Sun, 10 May 2026 11:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RO+irBu1"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9A9937DE9E
	for <linux-leds@vger.kernel.org>; Sun, 10 May 2026 11:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778411321; cv=none; b=O/7Eaol5BBAlRSuV3ZKzhlvgH2k+D0tLdDbwkX05ukG0Et/vCfHzDQ9nwHctc+D/tp7dMn82KXsdH0Q3z7KiIeI9vZjoxKczPGnfNEqQsOvBCvfglaR+et61mHaGYiDLIPUMWGnfeihXJrI99EyeRTnMKw44Ui2hr4KIbjbplmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778411321; c=relaxed/simple;
	bh=0gEwZwS/FYqnGRZ59VSyvYE3yvqWMDCYZCh5Jh3+mCc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aGN73AA0WbOEs6VDcV6TDFGcIOcyu3E91VLIhTYTwMSOlvMB3V0/OZhKIGX8lcNZV+7wikLzCaS8i/D1PxfEQa8js5bBf7ZIcbNDK7Hq2qwfiCHs6HehzBIqOdXX5HWTYd0i9U5dELTbfFkaNuu5CqA/MOZQiGOTnXAwXXtqVgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RO+irBu1; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-bc1f3a393c0so513285166b.0
        for <linux-leds@vger.kernel.org>; Sun, 10 May 2026 04:08:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778411316; x=1779016116; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l4Ch5JjZSDRX/44ND7WHKAD/uEQw2ql3s+wN8Su8rG0=;
        b=RO+irBu1+Op4h8XLB/uOeezErvpufWhbhQfHy5rZJlMQKm6cBxFxaLi+wzVGkDDaUa
         20vdiA9Ab795fNmJAxIS5Dp/pW5NrhOwM7oi3E/yBw/PCmFh8OKSLslX/K/3/6PsgTwp
         u4TP9tsq7C3guBfhlfXBbahXQeDTv1G2VEtZT4QXUn4Qd60rt8KfrzzsXFmIiin8BoZV
         2nipEWSmt6WcN4/mv7GRHMxd5dLZcnHzz+1OpC33hli3p/6anmquhc50lkztT0biggxz
         k2zoqWW+2IMQvOtFrdsIoFHb4jKFLItvK3n0xb5N2xVX3jRdt7MTRPc+1J80Oi7+DZMf
         1ruA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778411316; x=1779016116;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=l4Ch5JjZSDRX/44ND7WHKAD/uEQw2ql3s+wN8Su8rG0=;
        b=X+Rho7ZrwqRLOLi7OUUeJBRqAJ4PXtRzVbWfmF6FLxqmJvNx0rI/uEAkScnQ6s7ADb
         RH8bDF9Epcu4JAUaFoxsMeNnTO4AdBx7SEFr7/l9DIwsoTc/1DTebKhpfroCUrkXA59R
         jxQ+MSPn0QMeBmy8bdMcyDrs5JCL9HYzo4iMBLwLHG7d5EDrOYz5Hkqx+gM3s9ojuBM4
         uGNPpQiVCvWF+jaEC/Fl8ORtrKwkXE/7rU9LUxHRFjvTzymqDHV/thFoql9rYGCrg/wa
         Qrs+CCo8xKm4y1nD88iAZa8umEmPjnpvM3UEFFMd/pgKwYXAgVfdzXoY+X4hw8ZRZH4h
         ULXw==
X-Forwarded-Encrypted: i=1; AFNElJ/eJYptoWCkzOeLHObB4uudMjLGSXNvZi0pEncbLiuCUvT2A3XHeG+iYKzboosRA6+4tFSDZKePyQth@vger.kernel.org
X-Gm-Message-State: AOJu0YzJOh5j8XXZF/Y8GGMUr45evhhLKGcSq2fhYP7CaWgqFTfj/OMn
	N5L8YP8+MW6j37oxt+KHI7l6HhLM95c2uso88w3o+vjAOK7/ZzdLbAQ2
X-Gm-Gg: Acq92OGzWNvgdLws07elLyTuAPYNfi2qjCiw/orlzRuZmkfWojCryzsmbS5w/NybWi3
	wFWPRpRCbsvIm7ZQZ8TsoSWpguQwvoByKoE+LsgyNrU8Xd+kSOuhOw3l32qXhOPlNZ4JOjs8KU2
	xfMFRbYNfb77PmDIS5kteqJa0BEa1cRV/3zqLMOPnLdKWSBdeDNHJNFylnzkhS8c2Un8BWo52OU
	PGqq+zrBTGs2udkooQNYHaKFn++O7bna6ip9I2wnGSwNc6OOgY/a78zkMYfC8q3d9d6fZeFseub
	lTN1NpSjpfe3gn6rAxzy1W0ac9Og2GlxYqaZWkAGpzS+Y9v0THQ0DZE4twoKStwc+MoFCmLuftg
	RHQyc2z6Vbni6Z72jOwjVuOLfoozcHBU2x+9HMfqxFnPk9widdwIN9ZoAYRjRgcvFwFxngsSTxh
	9BRzbVOvqU9c2b59yjqm/QpGc=
X-Received: by 2002:a17:907:3d89:b0:bcb:e626:523a with SMTP id a640c23a62f3a-bcc14b9b4camr232992066b.40.1778411315731;
        Sun, 10 May 2026 04:08:35 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bce7a3fcb57sm68146866b.60.2026.05.10.04.08.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 04:08:35 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	David Lechner <dlechner@baylibre.com>,
	Tony Lindgren <tony@atomide.com>
Cc: linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org
Subject: [PATCH v5 4/6] dt-bindings: mfd: motorola-cpcap: document Mapphone and Mot CPCAP
Date: Sun, 10 May 2026 14:08:02 +0300
Message-ID: <20260510110804.33045-5-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260510110804.33045-1-clamor95@gmail.com>
References: <20260510110804.33045-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 84F89503B6F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-8069-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,baylibre.com,atomide.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	NEURAL_HAM(-0.00)[-0.976];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Add compatibles for Mapphone and Mot CPCAP subdevice compositions. Both
variations cannot use st,6556002 fallback since they may be based on
different controllers.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/mfd/motorola,cpcap.yaml       | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/motorola,cpcap.yaml b/Documentation/devicetree/bindings/mfd/motorola,cpcap.yaml
index 7f257f3a1a5a..542d149d2b39 100644
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


