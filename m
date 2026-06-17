Return-Path: <linux-leds+bounces-8624-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id noIWF3xUMmrUygUAu9opvQ
	(envelope-from <linux-leds+bounces-8624-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 17 Jun 2026 10:02:04 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C35D46975F7
	for <lists+linux-leds@lfdr.de>; Wed, 17 Jun 2026 10:02:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="k73JCq/P";
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8624-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-leds+bounces-8624-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 42FA53017BFA
	for <lists+linux-leds@lfdr.de>; Wed, 17 Jun 2026 08:01:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C3093D3337;
	Wed, 17 Jun 2026 08:00:58 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33CD83CE4B6
	for <linux-leds@vger.kernel.org>; Wed, 17 Jun 2026 08:00:50 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781683256; cv=none; b=JFT9IbZM7w8acezJJ47g8hOhvR/D/7nowkhXnLTvVszFLSFh1K1yKVZnfiVrYaWpDNd4g/B9pYkd5BvakZgYDp8CkQNFCf9T+d0IYynwy7hI6QUvZnk5Vx5l6QqeTdwsG159QB0wyH7mAlC6ZZZ3Di5hOSgWQiMiPuKcaxxqeSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781683256; c=relaxed/simple;
	bh=zmZT9rdPBXdwMc/a3mK/qB53o789AMJtGE5bHoaIOTk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I2dtEuFdoXVGA9kCUypqsr9md4AANJmW0MMramhOuC7nMoHf99OoUDXt6tPqRA+pdUPhywIw/D8SyUb9iNEaf0woX4sIkTstLRhMv+Y4VREDGGp1/kMPtJcCOFgU3e4qrnyDjZmX71uMMiucKwwiay2leOzEEVgjsoDgG2roz/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k73JCq/P; arc=none smtp.client-ip=209.85.208.54
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-687ed9aabb3so9985446a12.1
        for <linux-leds@vger.kernel.org>; Wed, 17 Jun 2026 01:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781683248; x=1782288048; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G/vD2WvMhtlCmmXP2PV0yHsKcGyGVU7w8huaayICW7U=;
        b=k73JCq/Pbb7Ooxa181VvRp5cGmM8AeGPEisS2LAfhCfFKVMKhHQrdih/zYUb37qQ5M
         h5qevIuOQoktBwR+6LmR76IR2jU02+aS4Zxl5apL3wJwX2DJzDgFf9iTED2Ps/jkING7
         EF8ODdzUpgPhOAhLgWIrtrCtYhPhvOyQlZNRKLS46EVai5cqU6Gxtb0/9hdHsclc79WT
         7oAmBc1xvGA2wPaix0q6zsH7Nbf9dHd+Q5JSesWvQz3hpom6UChLP6xQtT4OU1WjoUPD
         Nns/eAPQ9JbGIJHtcwvpE8PuRvVnHqlZkZScXoA41+i1D5YcLPWtw1u2MiyguNdX6kSx
         c+Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781683248; x=1782288048;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=G/vD2WvMhtlCmmXP2PV0yHsKcGyGVU7w8huaayICW7U=;
        b=Mw3WBDcOXB+KiZwMFd2ZYdP4x5AOU7Rk/R+kukHtiT92oxnoWWPIYV4f6obyrLMOwO
         irRE+eVMdHE1gWsWyFl6az5W7lp3OOxumgykFcACe5XkwXmu8SuuPvsVYb3LQq02PkUf
         b5KmreKDJ2SOSNw3FqyZS1t8MCR/HSyYonOoEIGIHtmEaEXkyUWjsM3505IEQrW2DpgU
         G1nqqmHQsXgqEx8vycNkKYd+6diLP6fPQsc+0A4EobIOt2/rHqTZQBWSVRhrT30JjGlp
         5G7M2TO+QhHMPIRJDG9jvScydPqUuzMuHuyHo/mj6/UcXCmffKL0dzu7Kk5RsBbxfxVz
         KPng==
X-Forwarded-Encrypted: i=1; AFNElJ83x6OHpbN97jURF4f/ZHaMYbARSZq74VTUZuogrlvmZYVw44ZlddZd1zWESicW1vTdr7+xEtFVu/YW@vger.kernel.org
X-Gm-Message-State: AOJu0Yzxr8bJiswsx2E4JkfVFn8g8qROx6bVX550F59MhBkXe5YVsP8c
	CrjL7FI5Xls0ido0xSuqE4FFRIy0JZD0quVBCD5CBgCoFqyKFFwDibq1
X-Gm-Gg: AfdE7clQ7F43nqKcfOa/QPHEJPffoa+5+i+2nFkmXcVN6c2y70EoOlCcmoHkMHOWbR4
	fr+BE1iZnHf6kNpGFtngJDg9pC+zvfTKaKFkV2rFcP34IbHACdD6SLY+jjwo1OiKGPNBIl34d+L
	hHEX9QKz7gXh/PWrMtgN10dJ/q/17loPhiwWqC7GuBgOmq4REGCzeAQ4vEwuAJIIY5Q1qmPydPk
	RdUkbQiLkf0LzVnbGyzMwTU7KmrdmJS9xOZ/gan/9y3175GAIR60BBjllgpaW+wu2ueUE76g8a/
	VRwUsvdSaJBBhVOZu+W3Opjc+T1i+A1nSGL8CMgS9e+Siy2c+Lv7L4Hu/KOqBSbIBUAtXgKDUl3
	THMRpWixdkuHDqXCGhomFJvGz/cj2fOTzKSSEoBkmy972yu/jy7My6WDdoZsb3xSBHEI2+1ikLg
	0hlXpgvnaZ5kOi
X-Received: by 2002:a17:907:3e12:b0:bed:7ce4:20c3 with SMTP id a640c23a62f3a-c05a4c195ecmr194026366b.42.1781683247840;
        Wed, 17 Jun 2026 01:00:47 -0700 (PDT)
Received: from xeon ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb058fa59sm755339766b.0.2026.06.17.01.00.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 01:00:47 -0700 (PDT)
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
Subject: [PATCH v5 04/14] mfd: lm3533: Pass only regmap and light sensor presence to child devices
Date: Wed, 17 Jun 2026 11:00:21 +0300
Message-ID: <20260617080031.99156-5-clamor95@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8624-lists,linux-leds=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C35D46975F7

Instead of passing the entire lm3533 core data structure, only pass the
regmap and the light sensor presence flag to child devices.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/iio/light/lm3533-als.c      | 32 ++++++++++++++---------------
 drivers/leds/leds-lm3533.c          | 32 ++++++++++++++++-------------
 drivers/mfd/lm3533-ctrlbank.c       | 14 ++++++-------
 drivers/video/backlight/lm3533_bl.c | 19 +++++++++--------
 include/linux/mfd/lm3533.h          |  2 +-
 5 files changed, 53 insertions(+), 46 deletions(-)

diff --git a/drivers/iio/light/lm3533-als.c b/drivers/iio/light/lm3533-als.c
index 44b104c2d77f..a9af8e2b965f 100644
--- a/drivers/iio/light/lm3533-als.c
+++ b/drivers/iio/light/lm3533-als.c
@@ -49,7 +49,7 @@
 
 
 struct lm3533_als {
-	struct lm3533 *lm3533;
+	struct regmap *regmap;
 	struct platform_device *pdev;
 
 	unsigned long flags;
@@ -73,7 +73,7 @@ static int lm3533_als_get_adc(struct iio_dev *indio_dev, bool average,
 	else
 		reg = LM3533_REG_ALS_READ_ADC_RAW;
 
-	ret = regmap_read(als->lm3533->regmap, reg, &val);
+	ret = regmap_read(als->regmap, reg, &val);
 	if (ret) {
 		dev_err(&indio_dev->dev, "failed to read adc\n");
 		return ret;
@@ -90,7 +90,7 @@ static int _lm3533_als_get_zone(struct iio_dev *indio_dev, u8 *zone)
 	u32 val;
 	int ret;
 
-	ret = regmap_read(als->lm3533->regmap, LM3533_REG_ALS_ZONE_INFO, &val);
+	ret = regmap_read(als->regmap, LM3533_REG_ALS_ZONE_INFO, &val);
 	if (ret) {
 		dev_err(&indio_dev->dev, "failed to read zone\n");
 		return ret;
@@ -141,7 +141,7 @@ static int lm3533_als_get_target(struct iio_dev *indio_dev, unsigned channel,
 		return -EINVAL;
 
 	reg = lm3533_als_get_target_reg(channel, zone);
-	ret = regmap_read(als->lm3533->regmap, reg, val);
+	ret = regmap_read(als->regmap, reg, val);
 	if (ret)
 		dev_err(&indio_dev->dev, "failed to get target current\n");
 
@@ -162,7 +162,7 @@ static int lm3533_als_set_target(struct iio_dev *indio_dev, unsigned channel,
 		return -EINVAL;
 
 	reg = lm3533_als_get_target_reg(channel, zone);
-	ret = regmap_write(als->lm3533->regmap, reg, val);
+	ret = regmap_write(als->regmap, reg, val);
 	if (ret)
 		dev_err(&indio_dev->dev, "failed to set target current\n");
 
@@ -274,7 +274,7 @@ static int lm3533_als_set_int_mode(struct iio_dev *indio_dev, int enable)
 	struct lm3533_als *als = iio_priv(indio_dev);
 	int ret;
 
-	ret = regmap_assign_bits(als->lm3533->regmap, LM3533_REG_ALS_ZONE_INFO,
+	ret = regmap_assign_bits(als->regmap, LM3533_REG_ALS_ZONE_INFO,
 				 LM3533_ALS_INT_ENABLE_MASK, enable);
 	if (ret) {
 		dev_err(&indio_dev->dev, "failed to set int mode %d\n",
@@ -290,7 +290,7 @@ static int lm3533_als_get_int_mode(struct iio_dev *indio_dev, int *enable)
 	struct lm3533_als *als = iio_priv(indio_dev);
 	int ret;
 
-	ret = regmap_test_bits(als->lm3533->regmap, LM3533_REG_ALS_ZONE_INFO,
+	ret = regmap_test_bits(als->regmap, LM3533_REG_ALS_ZONE_INFO,
 			       LM3533_ALS_INT_ENABLE_MASK);
 	if (ret < 0) {
 		dev_err(&indio_dev->dev, "failed to get int mode\n");
@@ -320,7 +320,7 @@ static int lm3533_als_get_threshold(struct iio_dev *indio_dev, unsigned nr,
 		return -EINVAL;
 
 	reg = lm3533_als_get_threshold_reg(nr, raising);
-	ret = regmap_read(als->lm3533->regmap, reg, val);
+	ret = regmap_read(als->regmap, reg, val);
 	if (ret)
 		dev_err(&indio_dev->dev, "failed to get threshold\n");
 
@@ -342,7 +342,7 @@ static int lm3533_als_set_threshold(struct iio_dev *indio_dev, unsigned nr,
 	reg2 = lm3533_als_get_threshold_reg(nr, !raising);
 
 	mutex_lock(&als->thresh_mutex);
-	ret = regmap_read(als->lm3533->regmap, reg2, &val2);
+	ret = regmap_read(als->regmap, reg2, &val2);
 	if (ret) {
 		dev_err(&indio_dev->dev, "failed to get threshold\n");
 		goto out;
@@ -357,7 +357,7 @@ static int lm3533_als_set_threshold(struct iio_dev *indio_dev, unsigned nr,
 		goto out;
 	}
 
-	ret = regmap_write(als->lm3533->regmap, reg, val);
+	ret = regmap_write(als->regmap, reg, val);
 	if (ret) {
 		dev_err(&indio_dev->dev, "failed to set threshold\n");
 		goto out;
@@ -712,7 +712,7 @@ static int lm3533_als_set_input_mode(struct lm3533_als *als, bool pwm_mode)
 {
 	int ret;
 
-	ret = regmap_assign_bits(als->lm3533->regmap, LM3533_REG_ALS_CONF,
+	ret = regmap_assign_bits(als->regmap, LM3533_REG_ALS_CONF,
 				 LM3533_ALS_INPUT_MODE_MASK, pwm_mode);
 	if (ret) {
 		dev_err(&als->pdev->dev, "failed to set input mode %d\n",
@@ -732,7 +732,7 @@ static int lm3533_als_set_resistor(struct lm3533_als *als, u8 val)
 		return -EINVAL;
 	}
 
-	ret = regmap_write(als->lm3533->regmap, LM3533_REG_ALS_RESISTOR_SELECT,
+	ret = regmap_write(als->regmap, LM3533_REG_ALS_RESISTOR_SELECT,
 			   val);
 	if (ret) {
 		dev_err(&als->pdev->dev, "failed to set resistor\n");
@@ -766,7 +766,7 @@ static int lm3533_als_setup_irq(struct lm3533_als *als, void *dev)
 	int ret;
 
 	/* Make sure interrupts are disabled. */
-	ret = regmap_clear_bits(als->lm3533->regmap, LM3533_REG_ALS_ZONE_INFO,
+	ret = regmap_clear_bits(als->regmap, LM3533_REG_ALS_ZONE_INFO,
 				LM3533_ALS_INT_ENABLE_MASK);
 	if (ret) {
 		dev_err(&als->pdev->dev, "failed to disable interrupts\n");
@@ -789,7 +789,7 @@ static int lm3533_als_enable(struct lm3533_als *als)
 {
 	int ret;
 
-	ret = regmap_set_bits(als->lm3533->regmap, LM3533_REG_ALS_CONF,
+	ret = regmap_set_bits(als->regmap, LM3533_REG_ALS_CONF,
 			      LM3533_ALS_ENABLE_MASK);
 	if (ret)
 		dev_err(&als->pdev->dev, "failed to enable ALS\n");
@@ -801,7 +801,7 @@ static int lm3533_als_disable(struct lm3533_als *als)
 {
 	int ret;
 
-	ret = regmap_clear_bits(als->lm3533->regmap, LM3533_REG_ALS_CONF,
+	ret = regmap_clear_bits(als->regmap, LM3533_REG_ALS_CONF,
 				LM3533_ALS_ENABLE_MASK);
 	if (ret)
 		dev_err(&als->pdev->dev, "failed to disable ALS\n");
@@ -845,7 +845,7 @@ static int lm3533_als_probe(struct platform_device *pdev)
 	indio_dev->modes = INDIO_DIRECT_MODE;
 
 	als = iio_priv(indio_dev);
-	als->lm3533 = lm3533;
+	als->regmap = lm3533->regmap;
 	als->pdev = pdev;
 	als->irq = lm3533->irq;
 	atomic_set(&als->zone, 0);
diff --git a/drivers/leds/leds-lm3533.c b/drivers/leds/leds-lm3533.c
index 335c758071f3..0cb0585eb960 100644
--- a/drivers/leds/leds-lm3533.c
+++ b/drivers/leds/leds-lm3533.c
@@ -42,13 +42,15 @@
 
 
 struct lm3533_led {
-	struct lm3533 *lm3533;
+	struct regmap *regmap;
 	struct lm3533_ctrlbank cb;
 	struct led_classdev cdev;
 	int id;
 
 	struct mutex mutex;
 	unsigned long flags;
+
+	bool have_als;
 };
 
 
@@ -96,7 +98,7 @@ static int lm3533_led_pattern_enable(struct lm3533_led *led, int enable)
 	pattern = lm3533_led_get_pattern(led);
 	mask = 1 << (2 * pattern);
 
-	ret = regmap_assign_bits(led->lm3533->regmap,
+	ret = regmap_assign_bits(led->regmap,
 				 LM3533_REG_PATTERN_ENABLE, mask, enable);
 	if (ret) {
 		dev_err(led->cdev.dev, "failed to enable pattern %d (%d)\n",
@@ -255,7 +257,7 @@ static u8 lm3533_led_delay_set(struct lm3533_led *led, u8 base,
 	dev_dbg(led->cdev.dev, "%s - %lu: %u (0x%02x)\n", __func__,
 							*delay, t, val);
 	reg = lm3533_led_get_pattern_reg(led, base);
-	ret = regmap_write(led->lm3533->regmap, reg, val);
+	ret = regmap_write(led->regmap, reg, val);
 	if (ret)
 		dev_err(led->cdev.dev, "failed to set delay (%02x)\n", reg);
 
@@ -336,7 +338,7 @@ static ssize_t show_risefalltime(struct device *dev,
 	u32 val;
 
 	reg = lm3533_led_get_pattern_reg(led, base);
-	ret = regmap_read(led->lm3533->regmap, reg, &val);
+	ret = regmap_read(led->regmap, reg, &val);
 	if (ret)
 		return ret;
 
@@ -371,7 +373,7 @@ static ssize_t store_risefalltime(struct device *dev,
 		return -EINVAL;
 
 	reg = lm3533_led_get_pattern_reg(led, base);
-	ret = regmap_write(led->lm3533->regmap, reg, val);
+	ret = regmap_write(led->regmap, reg, val);
 	if (ret)
 		return ret;
 
@@ -405,7 +407,7 @@ static ssize_t show_als_channel(struct device *dev,
 	int ret;
 
 	reg = lm3533_led_get_lv_reg(led, LM3533_REG_CTRLBANK_BCONF_BASE);
-	ret = regmap_read(led->lm3533->regmap, reg, &val);
+	ret = regmap_read(led->regmap, reg, &val);
 	if (ret)
 		return ret;
 
@@ -437,7 +439,7 @@ static ssize_t store_als_channel(struct device *dev,
 	mask = LM3533_REG_CTRLBANK_BCONF_ALS_CHANNEL_MASK;
 	val = channel - 1;
 
-	ret = regmap_update_bits(led->lm3533->regmap, reg, mask, val);
+	ret = regmap_update_bits(led->regmap, reg, mask, val);
 	if (ret)
 		return ret;
 
@@ -455,7 +457,7 @@ static ssize_t show_als_en(struct device *dev,
 	int ret;
 
 	reg = lm3533_led_get_lv_reg(led, LM3533_REG_CTRLBANK_BCONF_BASE);
-	ret = regmap_read(led->lm3533->regmap, reg, &val);
+	ret = regmap_read(led->regmap, reg, &val);
 	if (ret)
 		return ret;
 
@@ -479,7 +481,7 @@ static ssize_t store_als_en(struct device *dev,
 
 	reg = lm3533_led_get_lv_reg(led, LM3533_REG_CTRLBANK_BCONF_BASE);
 
-	ret = regmap_assign_bits(led->lm3533->regmap, reg,
+	ret = regmap_assign_bits(led->regmap, reg,
 				 LM3533_REG_CTRLBANK_BCONF_ALS_EN_MASK, enable);
 	if (ret)
 		return ret;
@@ -498,7 +500,7 @@ static ssize_t show_linear(struct device *dev,
 	int ret;
 
 	reg = lm3533_led_get_lv_reg(led, LM3533_REG_CTRLBANK_BCONF_BASE);
-	ret = regmap_read(led->lm3533->regmap, reg, &val);
+	ret = regmap_read(led->regmap, reg, &val);
 	if (ret)
 		return ret;
 
@@ -525,7 +527,7 @@ static ssize_t store_linear(struct device *dev,
 
 	reg = lm3533_led_get_lv_reg(led, LM3533_REG_CTRLBANK_BCONF_BASE);
 
-	ret = regmap_assign_bits(led->lm3533->regmap, reg,
+	ret = regmap_assign_bits(led->regmap, reg,
 				 LM3533_REG_CTRLBANK_BCONF_MAPPING_MASK, linear);
 	if (ret)
 		return ret;
@@ -597,7 +599,7 @@ static umode_t lm3533_led_attr_is_visible(struct kobject *kobj,
 
 	if (attr == &dev_attr_als_channel.attr ||
 					attr == &dev_attr_als_en.attr) {
-		if (!led->lm3533->have_als)
+		if (!led->have_als)
 			mode = 0;
 	}
 
@@ -654,7 +656,9 @@ static int lm3533_led_probe(struct platform_device *pdev)
 	if (!led)
 		return -ENOMEM;
 
-	led->lm3533 = lm3533;
+	led->regmap = lm3533->regmap;
+	led->have_als = lm3533->have_als;
+
 	led->cdev.name = pdata->name;
 	led->cdev.default_trigger = pdata->default_trigger;
 	led->cdev.brightness_set_blocking = lm3533_led_set;
@@ -670,7 +674,7 @@ static int lm3533_led_probe(struct platform_device *pdev)
 	 * registration so use parent device (for error reporting) until
 	 * registered.
 	 */
-	led->cb.lm3533 = lm3533;
+	led->cb.regmap = lm3533->regmap;
 	led->cb.id = lm3533_led_get_ctrlbank_id(led);
 	led->cb.dev = lm3533->dev;
 
diff --git a/drivers/mfd/lm3533-ctrlbank.c b/drivers/mfd/lm3533-ctrlbank.c
index c2b5fd38b81d..91e13cfa3cf0 100644
--- a/drivers/mfd/lm3533-ctrlbank.c
+++ b/drivers/mfd/lm3533-ctrlbank.c
@@ -39,7 +39,7 @@ int lm3533_ctrlbank_enable(struct lm3533_ctrlbank *cb)
 	dev_dbg(cb->dev, "%s - %d\n", __func__, cb->id);
 
 	mask = 1 << cb->id;
-	ret = regmap_set_bits(cb->lm3533->regmap, LM3533_REG_CTRLBANK_ENABLE,
+	ret = regmap_set_bits(cb->regmap, LM3533_REG_CTRLBANK_ENABLE,
 			      mask);
 	if (ret)
 		dev_err(cb->dev, "failed to enable ctrlbank %d\n", cb->id);
@@ -56,7 +56,7 @@ int lm3533_ctrlbank_disable(struct lm3533_ctrlbank *cb)
 	dev_dbg(cb->dev, "%s - %d\n", __func__, cb->id);
 
 	mask = 1 << cb->id;
-	ret = regmap_clear_bits(cb->lm3533->regmap, LM3533_REG_CTRLBANK_ENABLE,
+	ret = regmap_clear_bits(cb->regmap, LM3533_REG_CTRLBANK_ENABLE,
 				mask);
 	if (ret)
 		dev_err(cb->dev, "failed to disable ctrlbank %d\n", cb->id);
@@ -82,7 +82,7 @@ int lm3533_ctrlbank_set_max_current(struct lm3533_ctrlbank *cb, u32 imax)
 	val = (imax - LM3533_MAX_CURRENT_MIN) / LM3533_MAX_CURRENT_STEP;
 
 	reg = lm3533_ctrlbank_get_reg(cb, LM3533_REG_MAX_CURRENT_BASE);
-	ret = regmap_write(cb->lm3533->regmap, reg, val);
+	ret = regmap_write(cb->regmap, reg, val);
 	if (ret)
 		dev_err(cb->dev, "failed to set max current\n");
 
@@ -96,7 +96,7 @@ int lm3533_ctrlbank_set_brightness(struct lm3533_ctrlbank *cb, u32 val)
 	int ret;
 
 	reg = lm3533_ctrlbank_get_reg(cb, LM3533_REG_BRIGHTNESS_BASE);
-	ret = regmap_write(cb->lm3533->regmap, reg, val);
+	ret = regmap_write(cb->regmap, reg, val);
 	if (ret)
 		dev_err(cb->dev, "failed to set brightness\n");
 
@@ -110,7 +110,7 @@ int lm3533_ctrlbank_get_brightness(struct lm3533_ctrlbank *cb, u32 *val)
 	int ret;
 
 	reg = lm3533_ctrlbank_get_reg(cb, LM3533_REG_BRIGHTNESS_BASE);
-	ret = regmap_read(cb->lm3533->regmap, reg, val);
+	ret = regmap_read(cb->regmap, reg, val);
 	if (ret)
 		dev_err(cb->dev, "failed to get brightness\n");
 
@@ -137,7 +137,7 @@ int lm3533_ctrlbank_set_pwm(struct lm3533_ctrlbank *cb, u32 val)
 		return -EINVAL;
 
 	reg = lm3533_ctrlbank_get_reg(cb, LM3533_REG_PWM_BASE);
-	ret = regmap_write(cb->lm3533->regmap, reg, val);
+	ret = regmap_write(cb->regmap, reg, val);
 	if (ret)
 		dev_err(cb->dev, "failed to set PWM mask\n");
 
@@ -151,7 +151,7 @@ int lm3533_ctrlbank_get_pwm(struct lm3533_ctrlbank *cb, u32 *val)
 	int ret;
 
 	reg = lm3533_ctrlbank_get_reg(cb, LM3533_REG_PWM_BASE);
-	ret = regmap_read(cb->lm3533->regmap, reg, val);
+	ret = regmap_read(cb->regmap, reg, val);
 	if (ret)
 		dev_err(cb->dev, "failed to get PWM mask\n");
 
diff --git a/drivers/video/backlight/lm3533_bl.c b/drivers/video/backlight/lm3533_bl.c
index cd21c64b6485..4d6f68033480 100644
--- a/drivers/video/backlight/lm3533_bl.c
+++ b/drivers/video/backlight/lm3533_bl.c
@@ -24,10 +24,12 @@
 
 
 struct lm3533_bl {
-	struct lm3533 *lm3533;
+	struct regmap *regmap;
 	struct lm3533_ctrlbank cb;
 	struct backlight_device *bd;
 	int id;
+
+	bool have_als;
 };
 
 
@@ -88,7 +90,7 @@ static ssize_t show_als_en(struct device *dev,
 	bool enable;
 	int ret;
 
-	ret = regmap_read(bl->lm3533->regmap, LM3533_REG_CTRLBANK_AB_BCONF, &val);
+	ret = regmap_read(bl->regmap, LM3533_REG_CTRLBANK_AB_BCONF, &val);
 	if (ret)
 		return ret;
 
@@ -113,7 +115,7 @@ static ssize_t store_als_en(struct device *dev,
 
 	mask = 1 << (2 * ctrlbank);
 
-	ret = regmap_assign_bits(bl->lm3533->regmap, LM3533_REG_CTRLBANK_AB_BCONF,
+	ret = regmap_assign_bits(bl->regmap, LM3533_REG_CTRLBANK_AB_BCONF,
 				 mask, enable);
 	if (ret)
 		return ret;
@@ -130,7 +132,7 @@ static ssize_t show_linear(struct device *dev,
 	int linear;
 	int ret;
 
-	ret = regmap_read(bl->lm3533->regmap, LM3533_REG_CTRLBANK_AB_BCONF, &val);
+	ret = regmap_read(bl->regmap, LM3533_REG_CTRLBANK_AB_BCONF, &val);
 	if (ret)
 		return ret;
 
@@ -158,7 +160,7 @@ static ssize_t store_linear(struct device *dev,
 
 	mask = 1 << (2 * lm3533_bl_get_ctrlbank_id(bl) + 1);
 
-	ret = regmap_assign_bits(bl->lm3533->regmap, LM3533_REG_CTRLBANK_AB_BCONF,
+	ret = regmap_assign_bits(bl->regmap, LM3533_REG_CTRLBANK_AB_BCONF,
 				 mask, linear);
 	if (ret)
 		return ret;
@@ -223,7 +225,7 @@ static umode_t lm3533_bl_attr_is_visible(struct kobject *kobj,
 
 	if (attr == &dev_attr_als_channel.attr ||
 					attr == &dev_attr_als_en.attr) {
-		if (!bl->lm3533->have_als)
+		if (!bl->have_als)
 			mode = 0;
 	}
 
@@ -277,10 +279,11 @@ static int lm3533_bl_probe(struct platform_device *pdev)
 	if (!bl)
 		return -ENOMEM;
 
-	bl->lm3533 = lm3533;
+	bl->regmap = lm3533->regmap;
+	bl->have_als = lm3533->have_als;
 	bl->id = pdev->id;
 
-	bl->cb.lm3533 = lm3533;
+	bl->cb.regmap = lm3533->regmap;
 	bl->cb.id = lm3533_bl_get_ctrlbank_id(bl);
 	bl->cb.dev = NULL;			/* until registered */
 
diff --git a/include/linux/mfd/lm3533.h b/include/linux/mfd/lm3533.h
index c4c38876c09b..74cfb52c3bd1 100644
--- a/include/linux/mfd/lm3533.h
+++ b/include/linux/mfd/lm3533.h
@@ -33,7 +33,7 @@ struct lm3533 {
 };
 
 struct lm3533_ctrlbank {
-	struct lm3533 *lm3533;
+	struct regmap *regmap;
 	struct device *dev;
 	int id;
 };
-- 
2.53.0


