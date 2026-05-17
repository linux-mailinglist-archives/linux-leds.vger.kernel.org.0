Return-Path: <linux-leds+bounces-8164-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sCEuLWJyCWpJaQQAu9opvQ
	(envelope-from <linux-leds+bounces-8164-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sun, 17 May 2026 09:46:42 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 338FA55FC1F
	for <lists+linux-leds@lfdr.de>; Sun, 17 May 2026 09:46:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D729B303AB7F
	for <lists+linux-leds@lfdr.de>; Sun, 17 May 2026 07:43:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B401B311C35;
	Sun, 17 May 2026 07:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vwer9Jlt"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FDAA313E07
	for <linux-leds@vger.kernel.org>; Sun, 17 May 2026 07:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779003825; cv=none; b=XqzKJxaXywdOqW4TRjHQOkWnpxA7DBVe+jGAHetzGYMIQdBEB9UcsnWoJj08aq28swu5tApcu7SmrNQgSIH4heahkyanX114A/ZDU7OWUw2A5OMu+dyApfAwO68tMktlImhbTX5C+yB3uSe+rVLhVXFIn9cMLuzYzb8RMTjv0Eo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779003825; c=relaxed/simple;
	bh=YDvzhtpKlF4YyG+3rcF4wl/f1z7vrexwv/RtY92FvxI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HDEVjk7TW+Mk3l9jTUekEfA00zLwE2Gw4IKjpAgOd65bEkUfpU93w8CIhl0SZyCLAkv1Q5pxrGup2q05Sb/+3KEl7j4sMECYVyDSwG73/QPyTq+bkmc/cwRKv/HJVxqketbcuXdqxekFlyG2IHhkFEsei8GlIQn8CTft51WvX1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vwer9Jlt; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-43d73422431so711126f8f.2
        for <linux-leds@vger.kernel.org>; Sun, 17 May 2026 00:43:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779003819; x=1779608619; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0LzbpjsuKPCXdtxH83s9qoUUdpBAxIBv3nnvj0Qfzzw=;
        b=Vwer9JltXQOWgcvgTjf2dSCnv7RIw5v1yF4JR02LuTu6WcQbmJyNODS9iKnIXJYCq7
         8cZ0Q+qKM5jgfaoWeCDGEsAk+7UnwWvJUfmvQkJMe4KCNR2B5unVLJ0gmbvLmLUWzSbj
         Weswr4xAkLH8DqLvjxPCU+EJMetfboFl0qvCFxB7dPIMR9RzrgVS7M7mArDWzcIiuNvN
         0N4BOL3s8Lu93bIq1t835Q54RnbNIr1Bsrl3yMX7uJ7ZWAn8/nXUv1nkeVfzLZgbcLLd
         liLOUroMTrMbjVdV4mbge5R94uskFopQatOCMGn74eOs8MHi0wWlnMFon2Bg7xOIYB2g
         pGhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779003819; x=1779608619;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0LzbpjsuKPCXdtxH83s9qoUUdpBAxIBv3nnvj0Qfzzw=;
        b=N6SEfAgz5WcVBhnGnRWuylMCG+6B+Oy0DGKNzjVbOvaZf0zefCeGw3yYmTTkdyJyRm
         fpBPXwju29r9eW3x4eJEER8SGXZo6FXsUs/D0ImlaiM3COn/oLT5a/7wSF2dNLD1eSoj
         N25tkfXB4dF2HqAhRkKMfhF12xn5WADHt4oxrsdXFyaedEgWQRnbFrPl5GgsbTcULX++
         lr5GAxhZBt6A+nWnTRnVvKiglj/xw9iLjBT2aVDMOn46Vl7Zn3qlLjefpuih1J3CVMRV
         6nwdnzkvUyKrKS3lChoYsxlHnww9rNli0YILSi3p3ZPOyx+Uf4Ay/s5RrA28HC/sJpA8
         CUjQ==
X-Forwarded-Encrypted: i=1; AFNElJ/w3jMd2XWPrdUH7Fv1L3AU1uD8c5zU8UtqtYEzmzGYXOV8OU+FTBXPg7fh6gFc70H00HHC7YOhE2jv@vger.kernel.org
X-Gm-Message-State: AOJu0YyUBvxjJFta6Mmzw2cdWT+7KtcUqiaLi3YB2nZRf/eu/i8z6Mnh
	vi3ap6dO0FxaMkndq64pU9Lzkc016WTyP7MSJc64dQg2YJePLGSzkuNl
X-Gm-Gg: Acq92OFw7Csj5qti7o6WZ9YwmfxSn3iAb9PgVJ5GX/f2jMFxZopk9aZJgxJyQS70Pql
	gLFSG2pA9vWFUzRK077DjUM0+8RjnR9cEdNgSQLVUkUaCrLaOBJMyr7DbyRLi1/LRTUiuKNmVph
	rdhuVB1xbSKZThEss4h8wJ7pRtZVezsmqWlEyig1FY3KtDUfq7CXwAXsAkUXYqHlW5aGOwrZsoA
	l2/Hdl35PJOOroeKR+I57QpnilCIxIOIqh0ZD2GRFENqEGPgHC0zFnsQvfToc64JG5anAFkH0Os
	mEY16ZoigOb9dvfFUGk4ZX2K+Oi5BSIWjJDXhkEulEz91mlugojngz4gXMSIYRx2BdIhe6Wy4NP
	WVfJBytqI9nB4IlcoR18BwYOn0ntniVmBaSQccpSOjFAqPfShuGbRSsxs4nOFZgsgRJ7CM/37Ad
	krzaCTwR/95bAa
X-Received: by 2002:a05:6000:603:b0:43d:7c6c:a0dd with SMTP id ffacd0b85a97d-45e5c609a1dmr15044926f8f.35.1779003818881;
        Sun, 17 May 2026 00:43:38 -0700 (PDT)
Received: from xeon ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0fe248dsm27512864f8f.30.2026.05.17.00.43.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 00:43:38 -0700 (PDT)
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
Cc: dri-devel@lists.freedesktop.org,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-fbdev@vger.kernel.org
Subject: [PATCH v1 5/6] video: backlight: lm3533_bl: Set initial mapping mode from DT
Date: Sun, 17 May 2026 10:43:05 +0300
Message-ID: <20260517074306.30937-6-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260517074306.30937-1-clamor95@gmail.com>
References: <20260517074306.30937-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 338FA55FC1F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-8164-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,baylibre.com,analog.com,gmx.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	NEURAL_HAM(-0.00)[-0.998];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Add support to obtain the initial mapping mode from DT instead of leaving
it unconfigured. Additionally, update the linear sysfs code, which uses a
similar coding pattern.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/video/backlight/lm3533_bl.c | 32 ++++++++++++++++-------------
 1 file changed, 18 insertions(+), 14 deletions(-)

diff --git a/drivers/video/backlight/lm3533_bl.c b/drivers/video/backlight/lm3533_bl.c
index 42da652df58d..be9114b7e0ad 100644
--- a/drivers/video/backlight/lm3533_bl.c
+++ b/drivers/video/backlight/lm3533_bl.c
@@ -22,6 +22,7 @@
 #define LM3533_BL_MAX_BRIGHTNESS	255
 
 #define LM3533_REG_CTRLBANK_AB_BCONF	0x1a
+#define   CTRLBANK_AB_BCONF_MODE(n)	BIT(2 * (n) + 1)
 
 
 struct lm3533_bl {
@@ -32,6 +33,7 @@ struct lm3533_bl {
 
 	u32 max_current;
 	u32 pwm;
+	bool linear;
 };
 
 
@@ -135,8 +137,9 @@ static ssize_t show_linear(struct device *dev,
 				struct device_attribute *attr, char *buf)
 {
 	struct lm3533_bl *bl = dev_get_drvdata(dev);
+	int id = lm3533_bl_get_ctrlbank_id(bl);
+	u8 mask = CTRLBANK_AB_BCONF_MODE(id);
 	u8 val;
-	u8 mask;
 	int linear;
 	int ret;
 
@@ -144,8 +147,6 @@ static ssize_t show_linear(struct device *dev,
 	if (ret)
 		return ret;
 
-	mask = 1 << (2 * lm3533_bl_get_ctrlbank_id(bl) + 1);
-
 	if (val & mask)
 		linear = 1;
 	else
@@ -159,23 +160,16 @@ static ssize_t store_linear(struct device *dev,
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
-	ret = lm3533_update(bl->lm3533, LM3533_REG_CTRLBANK_AB_BCONF, val,
-									mask);
+	ret = lm3533_update(bl->lm3533, LM3533_REG_CTRLBANK_AB_BCONF,
+			    linear ? CTRLBANK_AB_BCONF_MODE(id) : 0,
+			    CTRLBANK_AB_BCONF_MODE(id));
 	if (ret)
 		return ret;
 
@@ -253,8 +247,15 @@ static struct attribute_group lm3533_bl_attribute_group = {
 
 static int lm3533_bl_setup(struct lm3533_bl *bl)
 {
+	int id = lm3533_bl_get_ctrlbank_id(bl);
 	int ret;
 
+	ret = lm3533_update(bl->lm3533, LM3533_REG_CTRLBANK_AB_BCONF,
+			    bl->linear ? CTRLBANK_AB_BCONF_MODE(id) : 0,
+			    CTRLBANK_AB_BCONF_MODE(id));
+	if (ret)
+		return ret;
+
 	ret = lm3533_ctrlbank_set_max_current(&bl->cb, bl->max_current);
 	if (ret)
 		return ret;
@@ -333,6 +334,9 @@ static int lm3533_bl_probe(struct platform_device *pdev)
 	bl->pwm = 0;
 	device_property_read_u32(&pdev->dev, "ti,pwm-config-mask", &bl->pwm);
 
+	bl->linear = device_property_read_bool(&pdev->dev,
+					       "ti,linear-mapping-mode");
+
 	ret = lm3533_bl_setup(bl);
 	if (ret)
 		goto err_sysfs_remove;
-- 
2.51.0


