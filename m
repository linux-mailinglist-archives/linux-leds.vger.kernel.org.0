Return-Path: <linux-leds+bounces-8634-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id c1GNE5NVMmobywUAu9opvQ
	(envelope-from <linux-leds+bounces-8634-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 17 Jun 2026 10:06:43 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B988C6976D7
	for <lists+linux-leds@lfdr.de>; Wed, 17 Jun 2026 10:06:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=MIhj4OO9;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8634-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-8634-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7E0DB306EB16
	for <lists+linux-leds@lfdr.de>; Wed, 17 Jun 2026 08:04:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BCCC3D9052;
	Wed, 17 Jun 2026 08:01:20 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8241A3D7D6C
	for <linux-leds@vger.kernel.org>; Wed, 17 Jun 2026 08:01:05 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781683279; cv=none; b=X/1jJ+QLkvY8GCbHu1U5o9KSg3v0+RVjNUYYvtBrziLC29mTn//qO+MzjdVSPOUkAwkBdeHIVpydNMLw7fktQuXyDMg5zKSj9KgIv3LcaTDdCBPmZSHxfmOct7gMON2Hh11pqGwhrLIpi5n0g6eqN30ThUU0LSeisXPEDD/lcb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781683279; c=relaxed/simple;
	bh=/uzMDa/Qq+h3z+mWxCj74u9KaQuuNkmAuhmbHq8QMFQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e1bI8NQARm6lNgKSzy/GpS39lEpMfq9GkPh3C3zhD+5ni51ulRxCpKBsSAyoBv+3GfsFqSqLmkN38PKuBHzuPYRVnx5RWq6ZU+pBeUx+LnSvl7IxzYVslIahmxkXROnbWCc9SvWZ0wvTY6v4hPC3NE6XbRz7KGMP0P5gNqoj31s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MIhj4OO9; arc=none smtp.client-ip=209.85.218.43
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-beeba001887so706195666b.3
        for <linux-leds@vger.kernel.org>; Wed, 17 Jun 2026 01:01:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781683264; x=1782288064; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SSD+o5Il4q3N15GHNpu+Bn3w6lF4AaqNR4K4QWPriYo=;
        b=MIhj4OO9jXtutz0acSiwlbCRMKJXNqVi6GY9VagYQBArS2qx6eRRcBdhf9Y1ZpOUBr
         AzJYakjD6QnJmr4xBoXAKQGUbwcsNrYM4TTyvC5fxf3jMNbOobKv3Zsbr10iUYxf5zP+
         TDtw6EW6ARF2sISKC5ksSPqakWRB8DH94Qc9Y8xjSZigmr1ewcoagdkxjrFSn8D9t3e1
         qvKfCRGKo803MImW9Pom9hgrsvr+5wHuXtC8K1GlRuOD3CStmjmD8xd1EzOxR3j4bM0V
         jXNXlVg7xl/wqQEpV9Lj4yEgJKwpQOI4JryuEBsrv9YmjQw5QZZ+uEvaqyEFNBnVzRxD
         /vFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781683264; x=1782288064;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SSD+o5Il4q3N15GHNpu+Bn3w6lF4AaqNR4K4QWPriYo=;
        b=Pux9Kb1Bjk0QKfteXLc2gIt8gjhAcYKdYP1qgRl6h2ak2YhY/9QbUYK04onPMl+5CW
         zm399J8Jbnxi1E5JzXn6wpzUBvNzMSZ8zVaAYxsU/0UpV6LNcaYlfjKUkeU1BT8d0Y9N
         PeuXdaglncfz7l+c/BVedg0jQK1EqxEyQIBZx91Mk2+nhBh1rxlPBupEbfVz1+FndyQQ
         LhJUUhCwvZ9vw+gWSDISDicfvfvj0jOHJbd5Dz0C8PH48KauIuDTHa6iEp4iS/uva+kF
         27+04rugh2kgJUXOKz80SEXn0jNxB+9xzF0DfxF6VUQJfVLoWM9dpHN3Y8T9awXTE0o9
         fiIA==
X-Forwarded-Encrypted: i=1; AFNElJ9ZcTxymXb2Lgj9KKVLE2X54vvZwIn31lXD0WdmXaXyu0ZTjPg4OycIZRWUehk/s3RUum9X9MC1RvXD@vger.kernel.org
X-Gm-Message-State: AOJu0YzC+r6fKVAI9kKr7Y9K9xg1ypwRATE9rO8SvFJnvWmwwtW8S6if
	zIg+vx9E9S+gZ9aA5wiYEtsziA42DSmKHh3vwmGf1NjIfTOdVB8X3GwM
X-Gm-Gg: AfdE7cmUHIc373cGCkkUos08lPVDQOIF6iAMT1OJYHsnCuNLAe51IzfHqOKssP+3DYq
	EB8/XaAqqUbm598NR7iwZK5I2qmSgM1xNx0r4x0eA8DMhtCLWT4ron9pkRRwFUxKlhs2/cyYqc/
	q+DVO0cLE0yRRkU+UWDKOv1VnTii/tn9qQ7jGq5Q4nLu6v0qAzVzNazYyIAEdgZpKHcxs9A5qLd
	mbtVyz7doy+J8s3INnF4UqxeljriaStpJyi2iWO4y6a3x6AUPQghLhjgRfKLSscrZWH+xGNtpCB
	ulMzvW4uzUF4DAT4pfVHyEZWX9WM+jU3JxiEkUDkwCv4q/hmuT2Q3ZdRqXAG2pu74Cg92mH0pfJ
	43zXq2buHbmYR82c4Cm8qpd91SiJpJ/we2CAn4L/OS2LeNfDnVBtuRPk8jPnLRt1b5AMwx5Xco3
	V/Nw==
X-Received: by 2002:a17:907:9452:b0:bee:bcf6:6a22 with SMTP id a640c23a62f3a-c05a511eb50mr157102166b.44.1781683262372;
        Wed, 17 Jun 2026 01:01:02 -0700 (PDT)
Received: from xeon ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb058fa59sm755339766b.0.2026.06.17.01.01.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 01:01:01 -0700 (PDT)
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
Subject: [PATCH v5 14/14] video: leds: backlight: lm3533: Support getting LED sources from DT
Date: Wed, 17 Jun 2026 11:00:31 +0300
Message-ID: <20260617080031.99156-15-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260617080031.99156-1-clamor95@gmail.com>
References: <20260617080031.99156-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8634-lists,linux-leds=lfdr.de];
	FORGED_SENDER(0.00)[clamor95@gmail.com,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:danielt@kernel.org,m:jingoohan1@gmail.com,m:pavel@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:jic23@kernel.org,m:dlechner@baylibre.com,m:nuno.sa@analog.com,m:andy@kernel.org,m:deller@gmx.de,m:clamor95@gmail.com,m:johan@kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-leds@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-iio@vger.kernel.org,m:linux-fbdev@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,baylibre.com,analog.com,gmx.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B988C6976D7

Add Control Bank to HVLED/LVLED muxing support based on the led-sources
defined in the device tree.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/leds/leds-lm3533.c          | 60 +++++++++++++++++++++++++++++
 drivers/video/backlight/lm3533_bl.c | 45 ++++++++++++++++++++++
 2 files changed, 105 insertions(+)

diff --git a/drivers/leds/leds-lm3533.c b/drivers/leds/leds-lm3533.c
index ed810c23f30f..9e07953814fd 100644
--- a/drivers/leds/leds-lm3533.c
+++ b/drivers/leds/leds-lm3533.c
@@ -27,6 +27,11 @@
 #define LM3533_ALS_CHANNEL_LV_MIN	1
 #define LM3533_ALS_CHANNEL_LV_MAX	2
 
+#define LM3533_REG_OUTPUT_CONF1			0x10
+#define   OUTPUT_CONF1_SHIFT			2
+#define   OUTPUT_LVLED_MASK			0x3
+#define LM3533_REG_OUTPUT_CONF2			0x11
+#define   OUTPUT_CONF2_SHIFT			6
 #define LM3533_REG_CTRLBANK_BCONF_BASE		0x1b
 #define LM3533_REG_PATTERN_ENABLE		0x28
 #define LM3533_REG_PATTERN_LOW_TIME_BASE	0x71
@@ -55,6 +60,9 @@ struct lm3533_led {
 	u32 max_current;
 	u32 pwm;
 
+	int num_leds;
+	u32 leds[LM3533_LVCTRLBANK_MAX];
+
 	bool have_als;
 };
 
@@ -623,8 +631,36 @@ static const struct attribute_group *lm3533_led_attribute_groups[] = {
 
 static int lm3533_led_setup(struct lm3533_led *led)
 {
+	u32 output_cfg_shift = 0;
+	u32 output_cfg_val = 0;
+	u32 output_cfg_mask = 0;
 	int ret;
 
+	if (led->num_leds) {
+		for (int i = 0; i < led->num_leds; i++) {
+			if (led->leds[i] >= LM3533_LVCTRLBANK_MAX)
+				continue;
+
+			output_cfg_shift = led->leds[i] * 2;
+			output_cfg_val |= led->id << output_cfg_shift;
+			output_cfg_mask |= OUTPUT_LVLED_MASK << output_cfg_shift;
+		}
+
+		/* LVLED1, LVLED2 and LVLED3 */
+		ret = regmap_update_bits(led->regmap, LM3533_REG_OUTPUT_CONF1,
+					 output_cfg_mask << OUTPUT_CONF1_SHIFT,
+					 output_cfg_val << OUTPUT_CONF1_SHIFT);
+		if (ret)
+			return ret;
+
+		/* LVLED4 and LVLED5 */
+		ret = regmap_update_bits(led->regmap, LM3533_REG_OUTPUT_CONF2,
+					 output_cfg_mask >> OUTPUT_CONF2_SHIFT,
+					 output_cfg_val >> OUTPUT_CONF2_SHIFT);
+		if (ret)
+			return ret;
+	}
+
 	ret = lm3533_ctrlbank_set_max_current(&led->cb, led->max_current);
 	if (ret)
 		return ret;
@@ -699,6 +735,30 @@ static int lm3533_led_probe(struct platform_device *pdev)
 
 	device_property_read_u32(&pdev->dev, "ti,pwm-config-mask", &led->pwm);
 
+	/*
+	 * If led-sources property is not set then either this Control Bank uses
+	 * its default LVLED or is not linked to any LVLED at all.
+	 */
+	led->num_leds = device_property_count_u32(&pdev->dev, "led-sources");
+	if (led->num_leds > LM3533_LVCTRLBANK_MAX) {
+		dev_err(&pdev->dev, "num of LED sources exceeds max %d: %d\n",
+			LM3533_LVCTRLBANK_MAX, led->num_leds);
+		ret = -EINVAL;
+		goto err_deregister;
+	}
+
+	if (led->num_leds < 0)
+		led->num_leds = 0;
+
+	if (led->num_leds > 0) {
+		ret = device_property_read_u32_array(&pdev->dev, "led-sources",
+						     led->leds, led->num_leds);
+		if (ret) {
+			dev_err(&pdev->dev, "failed to get led-sources\n");
+			goto err_deregister;
+		}
+	}
+
 	ret = lm3533_led_setup(led);
 	if (ret)
 		goto err_deregister;
diff --git a/drivers/video/backlight/lm3533_bl.c b/drivers/video/backlight/lm3533_bl.c
index c99fc68cb669..b3e5b3042d34 100644
--- a/drivers/video/backlight/lm3533_bl.c
+++ b/drivers/video/backlight/lm3533_bl.c
@@ -7,6 +7,7 @@
  * Author: Johan Hovold <jhovold@gmail.com>
  */
 
+#include <linux/bits.h>
 #include <linux/module.h>
 #include <linux/init.h>
 #include <linux/mod_devicetable.h>
@@ -22,6 +23,7 @@
 #define LM3533_HVCTRLBANK_COUNT		2
 #define LM3533_BL_MAX_BRIGHTNESS	255
 
+#define LM3533_REG_OUTPUT_CONF1		0x10
 #define LM3533_REG_CTRLBANK_AB_BCONF	0x1a
 #define   CTRLBANK_AB_BCONF_ALS(n)	BIT(2 * (n))
 #define   CTRLBANK_AB_BCONF_MODE(n)	BIT(2 * (n) + 1)
@@ -36,6 +38,9 @@ struct lm3533_bl {
 	u32 max_current;
 	u32 pwm;
 
+	int num_leds;
+	u32 led_strings[LM3533_HVCTRLBANK_COUNT];
+
 	bool have_als;
 	bool linear;
 };
@@ -237,6 +242,8 @@ static const struct attribute_group *lm3533_bl_attribute_groups[] = {
 static int lm3533_bl_setup(struct lm3533_bl *bl)
 {
 	int ctrlbank = lm3533_bl_get_ctrlbank_id(bl);
+	u32 output_cfg_val = 0;
+	u32 output_cfg_mask = 0;
 	int ret;
 
 	ret = regmap_assign_bits(bl->regmap, LM3533_REG_CTRLBANK_AB_BCONF,
@@ -244,6 +251,21 @@ static int lm3533_bl_setup(struct lm3533_bl *bl)
 	if (ret)
 		return ret;
 
+	if (bl->num_leds) {
+		for (int i = 0; i < bl->num_leds; i++) {
+			if (bl->led_strings[i] >= LM3533_HVCTRLBANK_COUNT)
+				continue;
+
+			output_cfg_val |= ctrlbank << bl->led_strings[i];
+			output_cfg_mask |= BIT(bl->led_strings[i]);
+		}
+
+		ret = regmap_update_bits(bl->regmap, LM3533_REG_OUTPUT_CONF1,
+					 output_cfg_mask, output_cfg_val);
+		if (ret)
+			return ret;
+	}
+
 	ret = lm3533_ctrlbank_set_max_current(&bl->cb, bl->max_current);
 	if (ret)
 		return ret;
@@ -321,6 +343,29 @@ static int lm3533_bl_probe(struct platform_device *pdev)
 
 	device_property_read_u32(&pdev->dev, "ti,pwm-config-mask", &bl->pwm);
 
+	/*
+	 * If led-sources property is not set then either this Control Bank uses
+	 * its default HVLED or is not linked to any HVLED at all.
+	 */
+	bl->num_leds = device_property_count_u32(&pdev->dev, "led-sources");
+	if (bl->num_leds > LM3533_HVCTRLBANK_COUNT) {
+		dev_err(&pdev->dev, "num of LED sources %d exceeds max %d\n",
+			bl->num_leds, LM3533_HVCTRLBANK_COUNT);
+		return -EINVAL;
+	}
+
+	if (bl->num_leds < 0)
+		bl->num_leds = 0;
+
+	if (bl->num_leds > 0) {
+		ret = device_property_read_u32_array(&pdev->dev, "led-sources",
+						     bl->led_strings,
+						     bl->num_leds);
+		if (ret)
+			return dev_err_probe(&pdev->dev, ret,
+					     "failed to get led-sources\n");
+	}
+
 	ret = lm3533_bl_setup(bl);
 	if (ret)
 		return ret;
-- 
2.53.0


