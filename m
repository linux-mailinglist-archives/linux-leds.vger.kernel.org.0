Return-Path: <linux-leds+bounces-8165-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YCc5MJByCWpJaQQAu9opvQ
	(envelope-from <linux-leds+bounces-8165-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sun, 17 May 2026 09:47:28 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CB5055FC4A
	for <lists+linux-leds@lfdr.de>; Sun, 17 May 2026 09:47:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4CD623041A10
	for <lists+linux-leds@lfdr.de>; Sun, 17 May 2026 07:43:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B3463128A3;
	Sun, 17 May 2026 07:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y0m7rJCl"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5424D3101D4
	for <linux-leds@vger.kernel.org>; Sun, 17 May 2026 07:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779003827; cv=none; b=pmUbeKY0iYXmerwKqIozTpO18Rp4hX2s0E8e37O+ZecbwGT2H7o1OIM5CzTtZG7hVL3jGTzoVq6eRI3AqOWv8T31zz0XRWbtRiW/yh8FUyGOXCX3L1I/H46zebdDxjDQfQxpgpOzzQy31qVhfyjpcX5+iVUoS/V68z9CA5T1xWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779003827; c=relaxed/simple;
	bh=txOclh6WzEZ2psojIZqT/u47okXxsKm65cDAQQqxUbU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C04ECYklTDypHQQHYwAaZJAfPeVTxPENt8wSFKQiNU+BWk6cImyMIWvrUgoA8VAS+UzF9y2ltoZf4pcdSytxBP4VAJ9RnvbNACOb8XaK/U4GXIVb/XdC8cLHIxiZk+hPPhZ5ViE18lNafGP6ZGWYP/EDturPYljT0JNfLfWezJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y0m7rJCl; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-452169ae568so690991f8f.3
        for <linux-leds@vger.kernel.org>; Sun, 17 May 2026 00:43:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779003820; x=1779608620; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fIRirlk7+iVvv+aIkrP/TTxntKDqtRTgAMbNyHeeulc=;
        b=Y0m7rJCl3WVA+TclXfdJwwP0opYEszxaDLhFF1gewLciSbIslwjl/fgle3gZY8flZW
         rM/RUX+stF1OeJIvEECD9KFd9hTCkqFOLMC0cs0MVhm+4NymBz/+gby+O14NEQDauLiC
         bujCgC/Ik3T43kMC49yXr6xfInG7amndCbykpg/VSsnTx7F/bTVZuqCOrSAUNLpxFgXK
         vvgC7KDyKE6wF23INni8Wx2CaJBGzKWmYoDx29C4UBkIitljt1964NkZhrbdXPwk0XUU
         laYqHxKb4vsd2Nqygibm4x4l6UNq2tsS3uW1Qb2lZ1ycH7UFN413Rsgj7QOalasYewPY
         lYtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779003820; x=1779608620;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fIRirlk7+iVvv+aIkrP/TTxntKDqtRTgAMbNyHeeulc=;
        b=hHcHEiobeLkua1WUA76py1t5yEQNgKPCOPBZpMx1n8Tr5eCXTX0fbUqDefWxGrpluk
         BAYaB1CqpaItvXe3Z+SSJrzS2t7u/9HAx8wH/EZCfCZsjQlgy0yYxrA5GpkpKOq2MOaf
         XDM3tZ4KNYu4yhk1LYG8RVy6vC0EJOUR2fmJvWQ3+r7WudnHdqWprAEyyvL8ljYNqrHW
         TK50DDcg4lNb6WvrCpzZmyB+bHy5Iu4KROf22RBcrpOne36rbsHDr+SnTYdB7zfNTaAe
         q/4FPw46vpOooXtAQMZvyuo2KiXdhKPWExg7Dd03karGrSCVzffhkl+QsxKt+Mjyqq6F
         iejg==
X-Forwarded-Encrypted: i=1; AFNElJ/U0WsuZ1jkYLiV1te2RzLXqAurFORB3n/VSnYcMGH6oXafF84j2wNWlAig/t/LtmA7vgoExH3LjYSo@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4abZIx3qMiRiZ8aGxAWRUa110UBBEV1nScMGQ3kng+6OKDtff
	84bJiIU3a+bMcIHTcibUfNM1Dd2ZpYxdznSSgSyAP0vodi7Ahs6Zzp1z
X-Gm-Gg: Acq92OGPlXsZQX401jk0NtzkJd9J4oj0SqGGys0ZFLsRi4914rikhPDp+n/IdK7laa+
	E/wHtWUZsJ7+8bkfLFRRI18j1maFX7LZTGJhUEmthf62yhgz1AHE9CK3ukzxFijgDESUwCNTNDW
	mUlkdcjplA5nyhojEoXFynCGHcQgjIf6GJPBnREAOHB3D7xgx2KmYS3v0j14zyYKODhlRIBydyl
	dDZhllcJ4hkfqdhCzlgLgq0eHFuiOqvcC+MHbWi8/uv3a36Q1k/GO/zjJ9lzqb4rb+A3Y7Tv59g
	02Gdq7AOi4G/XqL4tggOgFz+PYj5qEwH22nLSFGeDsDskSF/fGLRBeLAVjh5sxeKUl8Lpc+mQ+W
	OjF8kLQOK5hPuH7MFtDmviaBGvieXSdKzPcjx4Fko3iONFMcHR4o5mnE3tjzZ0w35j4vTlmxD0g
	0ydD5oY10dI3kt
X-Received: by 2002:a05:6000:22c5:b0:43d:7d24:b510 with SMTP id ffacd0b85a97d-45e5c5fd8demr15790172f8f.22.1779003820408;
        Sun, 17 May 2026 00:43:40 -0700 (PDT)
Received: from xeon ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0fe248dsm27512864f8f.30.2026.05.17.00.43.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 00:43:39 -0700 (PDT)
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
Subject: [PATCH v1 6/6] video: leds: backlight: lm3533: Support getting LED sources from DT
Date: Sun, 17 May 2026 10:43:06 +0300
Message-ID: <20260517074306.30937-7-clamor95@gmail.com>
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
X-Rspamd-Queue-Id: 4CB5055FC4A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-8165-lists,linux-leds=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Add Control Bank to HVLED/LVLED muxing support based on the led-sources
defined in the device tree.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/leds/leds-lm3533.c          | 55 +++++++++++++++++++++++++++--
 drivers/video/backlight/lm3533_bl.c | 39 +++++++++++++++++++-
 2 files changed, 91 insertions(+), 3 deletions(-)

diff --git a/drivers/leds/leds-lm3533.c b/drivers/leds/leds-lm3533.c
index f6345bc1f443..c4eaf30880a1 100644
--- a/drivers/leds/leds-lm3533.c
+++ b/drivers/leds/leds-lm3533.c
@@ -7,6 +7,7 @@
  * Author: Johan Hovold <jhovold@gmail.com>
  */
 
+#include <linux/bits.h>
 #include <linux/module.h>
 #include <linux/leds.h>
 #include <linux/mfd/core.h>
@@ -26,6 +27,12 @@
 #define LM3533_ALS_CHANNEL_LV_MIN	1
 #define LM3533_ALS_CHANNEL_LV_MAX	2
 
+#define LM3533_REG_OUTPUT_CONF1			0x10
+#define   OUTPUT_CONF1_MASK			GENMASK(7, 2)
+#define   OUTPUT_CONF1_SHIFT			2
+#define LM3533_REG_OUTPUT_CONF2			0x11
+#define   OUTPUT_CONF2_MASK			GENMASK(3, 0)
+#define   OUTPUT_CONF2_SHIFT			6
 #define LM3533_REG_CTRLBANK_BCONF_BASE		0x1b
 #define LM3533_REG_PATTERN_ENABLE		0x28
 #define LM3533_REG_PATTERN_LOW_TIME_BASE	0x71
@@ -40,7 +47,7 @@
 #define LM3533_REG_CTRLBANK_BCONF_ALS_CHANNEL_MASK	0x01
 
 #define LM3533_LED_FLAG_PATTERN_ENABLE		1
-
+#define LM3533_MAX_LEDS				5
 
 struct lm3533_led {
 	struct lm3533 *lm3533;
@@ -53,6 +60,9 @@ struct lm3533_led {
 
 	u32 max_current;
 	u32 pwm;
+
+	u32 num_leds;
+	u32 leds[LM3533_MAX_LEDS];
 };
 
 
@@ -639,7 +649,30 @@ static const struct attribute_group *lm3533_led_attribute_groups[] = {
 
 static int lm3533_led_setup(struct lm3533_led *led)
 {
-	int ret;
+	u32 output_cfg_shift = 0;
+	u32 output_cfg_val = 0;
+	int ret, i;
+
+	if (led->num_leds) {
+		for (i = 0; i < led->num_leds; i++) {
+			output_cfg_shift = led->leds[i] * 2;
+			output_cfg_val |= led->id << output_cfg_shift;
+		}
+
+		/* LVLED1, LVLED2 and LVLED3 */
+		ret = lm3533_update(led->lm3533, LM3533_REG_OUTPUT_CONF1,
+				    output_cfg_val << OUTPUT_CONF1_SHIFT,
+				    OUTPUT_CONF1_MASK);
+		if (ret)
+			return ret;
+
+		/* LVLED4 and LVLED5 */
+		ret = lm3533_update(led->lm3533, LM3533_REG_OUTPUT_CONF1,
+				    output_cfg_val >> OUTPUT_CONF2_SHIFT,
+				    OUTPUT_CONF2_MASK);
+		if (ret)
+			return ret;
+	}
 
 	ret = lm3533_ctrlbank_set_max_current(&led->cb, led->max_current);
 	if (ret)
@@ -713,6 +746,24 @@ static int lm3533_led_probe(struct platform_device *pdev)
 	led->pwm = 0;
 	device_property_read_u32(&pdev->dev, "ti,pwm-config-mask", &led->pwm);
 
+	led->num_leds = device_property_count_u32(&pdev->dev, "led-sources");
+
+	/*
+	 * If led-sources property is not set then either this Control Bank uses
+	 * its default LVLED or is not linked to any LVLED at all.
+	 */
+	if (led->num_leds <= 0 || led->num_leds > LM3533_MAX_LEDS)
+		led->num_leds = 0;
+
+	if (led->num_leds > 0 && led->num_leds < LM3533_MAX_LEDS) {
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
index be9114b7e0ad..2898cb229643 100644
--- a/drivers/video/backlight/lm3533_bl.c
+++ b/drivers/video/backlight/lm3533_bl.c
@@ -7,6 +7,7 @@
  * Author: Johan Hovold <jhovold@gmail.com>
  */
 
+#include <linux/bits.h>
 #include <linux/module.h>
 #include <linux/init.h>
 #include <linux/mod_devicetable.h>
@@ -21,9 +22,12 @@
 #define LM3533_HVCTRLBANK_COUNT		2
 #define LM3533_BL_MAX_BRIGHTNESS	255
 
+#define LM3533_REG_OUTPUT_CONF1		0x10
+#define   OUTPUT_CONF1_MASK		GENMASK(1, 0)
 #define LM3533_REG_CTRLBANK_AB_BCONF	0x1a
 #define   CTRLBANK_AB_BCONF_MODE(n)	BIT(2 * (n) + 1)
 
+#define LM3533_MAX_LED_STRINGS		2
 
 struct lm3533_bl {
 	struct lm3533 *lm3533;
@@ -34,6 +38,9 @@ struct lm3533_bl {
 	u32 max_current;
 	u32 pwm;
 	bool linear;
+
+	u32 num_leds;
+	u32 led_strings[LM3533_MAX_LED_STRINGS];
 };
 
 
@@ -248,7 +255,8 @@ static struct attribute_group lm3533_bl_attribute_group = {
 static int lm3533_bl_setup(struct lm3533_bl *bl)
 {
 	int id = lm3533_bl_get_ctrlbank_id(bl);
-	int ret;
+	u32 output_cfg_val = 0;
+	int ret, i;
 
 	ret = lm3533_update(bl->lm3533, LM3533_REG_CTRLBANK_AB_BCONF,
 			    bl->linear ? CTRLBANK_AB_BCONF_MODE(id) : 0,
@@ -256,6 +264,16 @@ static int lm3533_bl_setup(struct lm3533_bl *bl)
 	if (ret)
 		return ret;
 
+	if (bl->num_leds) {
+		for (i = 0; i < bl->num_leds; i++)
+			output_cfg_val |= id << bl->led_strings[i];
+
+		ret = lm3533_update(bl->lm3533, LM3533_REG_OUTPUT_CONF1,
+				    output_cfg_val, OUTPUT_CONF1_MASK);
+		if (ret)
+			return ret;
+	}
+
 	ret = lm3533_ctrlbank_set_max_current(&bl->cb, bl->max_current);
 	if (ret)
 		return ret;
@@ -337,6 +355,25 @@ static int lm3533_bl_probe(struct platform_device *pdev)
 	bl->linear = device_property_read_bool(&pdev->dev,
 					       "ti,linear-mapping-mode");
 
+	bl->num_leds = device_property_count_u32(&pdev->dev, "led-sources");
+
+	/*
+	 * If led-sources property is not set then either this Control Bank uses
+	 * its default HVLED or is not linked to any HVLED at all.
+	 */
+	if (bl->num_leds <= 0 || bl->num_leds > LM3533_MAX_LED_STRINGS)
+		bl->num_leds = 0;
+
+	if (bl->num_leds > 0 && bl->num_leds < LM3533_MAX_LED_STRINGS) {
+		ret = device_property_read_u32_array(&pdev->dev, "led-sources",
+						     bl->led_strings,
+						     bl->num_leds);
+		if (ret) {
+			dev_err(&pdev->dev, "failed to get led-sources\n");
+			goto err_sysfs_remove;
+		}
+	}
+
 	ret = lm3533_bl_setup(bl);
 	if (ret)
 		goto err_sysfs_remove;
-- 
2.51.0


