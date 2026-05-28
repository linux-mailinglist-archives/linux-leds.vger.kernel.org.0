Return-Path: <linux-leds+bounces-8353-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cI6sIhlLGGqjiggAu9opvQ
	(envelope-from <linux-leds+bounces-8353-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 28 May 2026 16:03:05 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 831F45F34B5
	for <lists+linux-leds@lfdr.de>; Thu, 28 May 2026 16:03:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4803B30D784C
	for <lists+linux-leds@lfdr.de>; Thu, 28 May 2026 13:52:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D452734B1A5;
	Thu, 28 May 2026 13:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q4UmiESg"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54E672D97A6
	for <linux-leds@vger.kernel.org>; Thu, 28 May 2026 13:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779976320; cv=none; b=XjBA60C49AYfd6OvnqRIvXGFxs6Qw3vAIj1L7gdlnZXTjQPCp6RgctXeUMFWWm9CSCOFMlATS52GK9LSr28bx8afIfoZORKhVhKCmzYjTGsOad36kKy9Pb0BiaiG+LEE3TgQJR9TwDs70NT5tVp2a95T4qlywkJldCvvbWcsw2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779976320; c=relaxed/simple;
	bh=n4yCPkvyfwqM7MzsAswDO+ebUjuf2G8Zgx9N9HA2HFk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q9IYutL+RoxSOwblKm+X8QssA3+QpkOhGqo7RLa2hqFwnBzl72Q5QEemljCgXOwJ2iDmG31Mw2Bcn4xEnjO01gtWMe0wGkHC7orzmB/9oD78avDNQEHfOU2zIfGy2Ruoi+8tLHokhqI7d+LrYVW1DFj8mzZ72lYHL5Rof1YfX2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q4UmiESg; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-67e9e343b22so17573072a12.0
        for <linux-leds@vger.kernel.org>; Thu, 28 May 2026 06:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779976317; x=1780581117; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dDQ/tiPuyfzwfBV4n9YbMw4Pd30yVycLBAunY89akC8=;
        b=q4UmiESgp8svPMTZCw8HuaCUQIkERmwTnmGJfziX6gsQq1xa0xo36IS1q87MS/Qn6a
         z7vkYuuvp1ti+RgxqZaR7vYWQ3FYtzgOp2RXlHdPfSgH6cwxcAdL+RUhpMuszmBjJyRU
         mAHe/ShSSkDmkXUHyLVm2Uz7PIa6GxxepQFwDC/q+Z+AJt7Rp5kjmia1/sMh/gssrL/v
         QpBI2A/nIHSRbUanpWLlVtmt1cOXkvlIfF7GOr472KI2ZOVoWFuZ3DsPf2+/0hazT2PL
         MeX//YMqVOxtmwHyIvkr91Rtv2wrK9tPQm8U9FIGXPo7gVZOZ2LrpehMMoWfkcH0Gz0Z
         izwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779976317; x=1780581117;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dDQ/tiPuyfzwfBV4n9YbMw4Pd30yVycLBAunY89akC8=;
        b=HZovelU1fj6dTOG2WS1ZrPi9Qlv83Hg48jbdxRGQBegZ8cGGtGBed0LDE7fh90M7Rm
         vMb1l6BsJTCXEHsrHS1bERNsTerwDXerbJeQqdYnBzIDlNJb4NlC5WfLAefjM9HhbLgz
         O1CazD3WCPywzyORgig+S5WPx0HjcUDRC4oT7+lOuX7OxAZ9wovIgBKYAs4XvKZlTagh
         +AvG7U3f0GdyGJ+yEDh+WdehGVgbBBwP4Grqt8tmfDML0+SVKrubQlUHgs1YhfpF7/oB
         Mhypv/0Uz+yP+MY/mi+5242Ej+FBnNEzEOVAOwdx4pnRiD43mRlhkBzSbQZevFJWFi6S
         TVcw==
X-Forwarded-Encrypted: i=1; AFNElJ9427kaCar2OyhH3NsCJYvmEYqDjfT5M/wNKjKE/iA41cpmK3VrggKC3vWDAbZfhzvvxsl3QUsPDd5p@vger.kernel.org
X-Gm-Message-State: AOJu0YzfWrifsHDG59amnQsCPrlUSL1KVoF/VKdfy4/6ekyZInQMrseI
	0b5kC4o0tzonG3GvYW5UDiDeLYMqBLZ1Mw9jMdsPwmGxcwstJYgSm1Fn
X-Gm-Gg: Acq92OGzKqCvsR1z5t/+1my0o/uremSa/C0E8Rp/pc7EF935TC1ZtyCJbHZ8nlnd1g4
	6BdDYAYY2HvBLc84b3YCJ1U6b9H7D9imyZ77/i38IvPO0OMDHDBh8QbaMFzDsvDPGgSr/8oW2Iu
	0VqjoFupzE/aIqWdVBuC/ZTi8ygjAVDIz6gkQjny8RHZzA6BhzyKR5RdfA5OJDgVRyEeCV4Ob26
	c+CsbNnsmyMrVjuUVucUL3CEuN7ayoQQX42qHgEE6k8hpvFNrreWc6bow0fx5w8BJ16fS9MjELc
	SJxdPcvXCzwoPsu9WrLPobpTw3edo7Hn2RJv2d7aoLmLWgRM4Y1LKFDFVvFSKCy4/Z6GWaKb94k
	Mxw1DvB0IE/7I/jxS9atIr4ndD8cq+WdTGl8hHgXL8TsnRDQw5KsGJzJxSIxR4i7Ej1nd+9dGMb
	51qvh1rhc/TQneeY49uxZSBqTaOH0AQS5FHw==
X-Received: by 2002:a17:906:f049:b0:bdc:8c6b:4842 with SMTP id a640c23a62f3a-bdd25cecf04mr1579914166b.30.1779976316385;
        Thu, 28 May 2026 06:51:56 -0700 (PDT)
Received: from xeon ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bddc65da3bbsm723636566b.52.2026.05.28.06.51.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 06:51:55 -0700 (PDT)
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
Subject: [PATCH v2 5/6] video: backlight: lm3533_bl: Set initial mapping mode from DT
Date: Thu, 28 May 2026 16:51:22 +0300
Message-ID: <20260528135123.103745-6-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260528135123.103745-1-clamor95@gmail.com>
References: <20260528135123.103745-1-clamor95@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-8353-lists,linux-leds=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 831F45F34B5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add support to obtain the initial mapping mode from DT instead of leaving
it unconfigured. Additionally, update the linear sysfs code, which uses a
similar coding pattern.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/video/backlight/lm3533_bl.c | 50 ++++++++++++++++-------------
 1 file changed, 27 insertions(+), 23 deletions(-)

diff --git a/drivers/video/backlight/lm3533_bl.c b/drivers/video/backlight/lm3533_bl.c
index 42da652df58d..c03d0d1667e4 100644
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
@@ -317,14 +318,6 @@ static int lm3533_bl_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, bl);
 
-	ret = sysfs_create_group(&bd->dev.kobj, &lm3533_bl_attribute_group);
-	if (ret < 0) {
-		dev_err(&pdev->dev, "failed to create sysfs attributes\n");
-		return ret;
-	}
-
-	backlight_update_status(bd);
-
 	device_property_read_u32(&pdev->dev, "led-max-microamp",
 				 &bl->max_current);
 	bl->max_current = clamp(bl->max_current, LM3533_LED_MAX_CURRENT_MIN,
@@ -333,9 +326,20 @@ static int lm3533_bl_probe(struct platform_device *pdev)
 	bl->pwm = 0;
 	device_property_read_u32(&pdev->dev, "ti,pwm-config-mask", &bl->pwm);
 
+	bl->linear = device_property_read_bool(&pdev->dev,
+					       "ti,linear-mapping-mode");
+
 	ret = lm3533_bl_setup(bl);
 	if (ret)
-		goto err_sysfs_remove;
+		return ret;
+
+	ret = sysfs_create_group(&bd->dev.kobj, &lm3533_bl_attribute_group);
+	if (ret < 0) {
+		dev_err(&pdev->dev, "failed to create sysfs attributes\n");
+		return ret;
+	}
+
+	backlight_update_status(bd);
 
 	ret = lm3533_ctrlbank_enable(&bl->cb);
 	if (ret)
-- 
2.51.0


