Return-Path: <linux-leds+bounces-8413-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IEYqFeGlHWr5cgkAu9opvQ
	(envelope-from <linux-leds+bounces-8413-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 01 Jun 2026 17:31:45 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AFF0621C4D
	for <lists+linux-leds@lfdr.de>; Mon, 01 Jun 2026 17:31:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4F00B3017CFC
	for <lists+linux-leds@lfdr.de>; Mon,  1 Jun 2026 15:21:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D46F33E2746;
	Mon,  1 Jun 2026 15:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V/pp/l99"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBA8F3DDDCE
	for <linux-leds@vger.kernel.org>; Mon,  1 Jun 2026 15:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780327166; cv=none; b=ErL+pmp87tZXUK4VBAvyb/NI0BKwtyPL7+awgVtfnl/RNCfLkLQONWEhZ1pip1lipqKcpD3RsqdPs3AuM4yyQNXmFgLaPieXG3dG1SPW1qXk8b3zrNiNI/SyJ7xQwUXV1PvZGimXYNRIkZUaEfPu8nWBWPuJZSVNGi6LbHEWTb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780327166; c=relaxed/simple;
	bh=+XJVhU2zPkpnCe5OFCObMG1j3Sj/CGVdrvJ521UPM9U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jiWJND3RA4Bl6oQnjO7Uxkt600FfEeE3GuNfK9bYKfLF1Mj8vVLiGzW6eQZWha2o2/4+N0Ajax1Wz8s1jVbhQu6rwdFXg9H+x0gwNnfyFgGWZQwLMxu96pNRMQ0/LbW3o9w9YcMvYRuGZCSbAleZ+IVA8We3R6qDx/YzGlDF9OQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V/pp/l99; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-49050ff7cbdso93561855e9.2
        for <linux-leds@vger.kernel.org>; Mon, 01 Jun 2026 08:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780327150; x=1780931950; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MeSJxuqtwsz6jGt+YVFicWB8+6LnFt3NUvnbNkDL/mA=;
        b=V/pp/l9948g7rakEOQUQ390K7N9kJ7sXVs2zB9cQnAKPZYPQ6sZ1YrD4Koy1xcdl84
         HC4gfDOvOdMpPzk/qeXJLABpNiGwsBwt5ITlcPpK3PzkE6z8hJlsRgki1V1byJy0VWld
         4SEsVODptC2xv8sv58A4/pQq4icscBd+TTnMfcbhYPLvyxdRtRqOU1C3T5cmPbSdrrXh
         azI4KW6a9DXfUyqgjRHlh15vBYBpRG+o/nGy30xa8l22ZjenhGeCEleWIyPfDLdnmklB
         Dc1T8b3lly7M0KBDW58x0yNaIBxrPdIfIIzzIOefLFzWsn17usNDYX46ATubZGo/QMMn
         pGsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780327150; x=1780931950;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MeSJxuqtwsz6jGt+YVFicWB8+6LnFt3NUvnbNkDL/mA=;
        b=kwuHaW0X0bFm7qeE5f9toMG2wPv1KkskRhEECOVRP/3WNNyTuvRLLBeT12SDdYHlCF
         edN8SYaeBr47lbgspNCUIM0G2hfsZEsJ+oF7Nf3tx5MG8/nPc4IDNKa3PBkR+FIqH5b8
         J0ig5MYzdXNup+utQMZwDQxl9YsnA9v68YiEYNWw4rj9XqAMB8i7tjzYaNEtq/Ko+FXb
         l5dguuZx92wFzwPon5j4cMzfyLoTMO9LKzUGmtjWB1MUEOwEwUpL+S/hBT5VJH1/kvpN
         YuiNthihsLPTblrrfdijj9SHk0HLN7KmltwXTvvnO9zUdoslCiM9RZNr6kouEuhfV49T
         nieg==
X-Forwarded-Encrypted: i=1; AFNElJ+4iTom6ED25CfJmciFAO5ueZwhFmhd5v8n/n0MkG25xu7oWzEKsbD4MFfZsgckqPeHGXKMCmOLZSXX@vger.kernel.org
X-Gm-Message-State: AOJu0YwfgzMYeD/7SQ5yyS8P8fVqUSIK7ZoE3rz8OEaNSzAxOfrzY8l6
	cz8Q69rz5WgEliYoK7yyPA7bbPg7IFOtnt5+/i4fJd2CWzkUNnzgUnWH
X-Gm-Gg: Acq92OHwz4DP9aKcP8YrTm2ko2aR3ty8XP4hxc3IHSFnPa5thV3oPlV45jHNd8sJsVF
	+yUxN6C2hIpIhqH1B/hOyhmyq82nL/pi6Ez7fomlA1P8dD6MbN9zBaUtflO6yMfBOAlB/lni2eH
	D5dux2HuACOtlAGXWYAhG0JKlXpqzzr7/3bJWtI3nqtCbqyT1cY5wsVgb6x7zdc0P1CDFJ7idiC
	Qh/IoL31ffwZh+4BEXtqGgmCbZI5JU2SkgTAKuMKtiSpW9i5+6sCWF9alY3t9CoAsUFzDPevqX8
	/51LzKmnsufNKsgP07r8kEQYF8DBWmfyPIFlx8RYqU4QyXdDFSTmuxuWlJQs9SIldGi6T/Hsiqp
	x2orHZy3zir+b5U7KpoyMeLXwlRwFdf5IPgsoMJeHwcZqAEwoNq+nQN7IHnwMNklLFidiGHOywY
	2RmHLMwuBsrfz8nJDm3vCibic=
X-Received: by 2002:a05:600c:4715:b0:490:7136:ad05 with SMTP id 5b1f17b1804b1-490a29748dcmr205098165e9.31.1780327149765;
        Mon, 01 Jun 2026 08:19:09 -0700 (PDT)
Received: from xeon ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef354cd7csm25753103f8f.18.2026.06.01.08.19.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 08:19:09 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Helge Deller <deller@gmx.de>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Johan Hovold <johan@kernel.org>,
	dri-devel@lists.freedesktop.org,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-fbdev@vger.kernel.org
Subject: [PATCH v3 08/11] video: backlight: lm3533_bl: Improve linear sysfs logic
Date: Mon,  1 Jun 2026 18:18:28 +0300
Message-ID: <20260601151831.76350-9-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260601151831.76350-1-clamor95@gmail.com>
References: <20260601151831.76350-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-8413-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,baylibre.com,analog.com,gmx.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 8AFF0621C4D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Simplify the sysfs logic of the linear property by switching to a macro
and a ternary operator.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/video/backlight/lm3533_bl.c | 19 ++++++-------------
 1 file changed, 6 insertions(+), 13 deletions(-)

diff --git a/drivers/video/backlight/lm3533_bl.c b/drivers/video/backlight/lm3533_bl.c
index c70b8a3bb301..36e6f027613a 100644
--- a/drivers/video/backlight/lm3533_bl.c
+++ b/drivers/video/backlight/lm3533_bl.c
@@ -23,6 +23,7 @@
 #define LM3533_BL_MAX_BRIGHTNESS	255
 
 #define LM3533_REG_CTRLBANK_AB_BCONF	0x1a
+#define   CTRLBANK_AB_BCONF_MODE(n)	BIT(2 * (n) + 1)
 
 
 struct lm3533_bl {
@@ -136,8 +137,9 @@ static ssize_t show_linear(struct device *dev,
 				struct device_attribute *attr, char *buf)
 {
 	struct lm3533_bl *bl = dev_get_drvdata(dev);
+	int id = lm3533_bl_get_ctrlbank_id(bl);
+	u8 mask = CTRLBANK_AB_BCONF_MODE(id);
 	u32 val;
-	u8 mask;
 	int linear;
 	int ret;
 
@@ -145,8 +147,6 @@ static ssize_t show_linear(struct device *dev,
 	if (ret)
 		return ret;
 
-	mask = 1 << (2 * lm3533_bl_get_ctrlbank_id(bl) + 1);
-
 	if (val & mask)
 		linear = 1;
 	else
@@ -160,23 +160,16 @@ static ssize_t store_linear(struct device *dev,
 					const char *buf, size_t len)
 {
 	struct lm3533_bl *bl = dev_get_drvdata(dev);
+	int id = lm3533_bl_get_ctrlbank_id(bl);
 	unsigned long linear;
-	u8 mask;
-	u8 val;
 	int ret;
 
 	if (kstrtoul(buf, 0, &linear))
 		return -EINVAL;
 
-	mask = 1 << (2 * lm3533_bl_get_ctrlbank_id(bl) + 1);
-
-	if (linear)
-		val = mask;
-	else
-		val = 0;
-
 	ret = regmap_update_bits(bl->lm3533->regmap, LM3533_REG_CTRLBANK_AB_BCONF,
-				 mask, val);
+				 CTRLBANK_AB_BCONF_MODE(id),
+				 linear ? CTRLBANK_AB_BCONF_MODE(id) : 0);
 	if (ret)
 		return ret;
 
-- 
2.51.0


