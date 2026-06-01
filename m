Return-Path: <linux-leds+bounces-8407-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mGmmJculHWr5cgkAu9opvQ
	(envelope-from <linux-leds+bounces-8407-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 01 Jun 2026 17:31:23 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2361A621C26
	for <lists+linux-leds@lfdr.de>; Mon, 01 Jun 2026 17:31:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7F19630BA819
	for <lists+linux-leds@lfdr.de>; Mon,  1 Jun 2026 15:20:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4169B3DB30F;
	Mon,  1 Jun 2026 15:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q+9nDKh4"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C54B93DB647
	for <linux-leds@vger.kernel.org>; Mon,  1 Jun 2026 15:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780327150; cv=none; b=SWX3TNRmKJC3ttBDB6Myz6esGPD8s4trkctgRX61tYeGmQPe3Xs2HYDu3znBkBN5e5nrBxth7AnrLhllZ5ty0Qf2AdatOLNyl+FK/tJJWV1fS4rJV/IYdR/j7ZEvhtFMixytLBQbi7UDGBmkDXvUu+5TnkvTuPWvyjbIMOMUvEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780327150; c=relaxed/simple;
	bh=P/aQQUXfNNAjPXtCtv4LkDmTvkFKObJ8qq5m9tMmQrc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QIov2aGX65xHHb8sqHJ39H34JB/oFjKz80fz3GIUMAQImZN6nKeCnC4QaXvK8Bo7fMhcfjLrik+lsgAUGRDa+sv50f9VhtsU4F5/CBl3a+wk/jI1UZW600ftbS1IosgWSe4Aq5vFlKT/Aa9+0ARpcnH1EFJaRxywaJOr0wqtwn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q+9nDKh4; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-490a765f47aso13187165e9.1
        for <linux-leds@vger.kernel.org>; Mon, 01 Jun 2026 08:19:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780327141; x=1780931941; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6lilqAuiij9iv6kzYPCZqnmLSIUj1rZr1BJG3cusMtw=;
        b=q+9nDKh4LS4EDNTeCJZsdtnqRJQuE1X8CPxpxHFPKW87isvd9EGATOAFEGpdapLEjf
         i28lr9HpBwUHYF7jUN1VDcx9jGpcEnu8e+eiZU1wGEVZrnQONC9lQcMhlujIWcKlHKTq
         9APyAok/k6enCCrgZu0d2M2+zVRMPeGGA/QXFD4HnApceCQuT1QiJyBvPFcVQVkS7wAn
         l5InNjrFgMXNoON/2jpA1On6yziIkqG0YMD/Me8PJUKGxAJyDpgxQb8EOltw9NsZqmpG
         90/Dk8LSlLhl4RrV/UofN0tPVW/sbUJvgHNgpuQjy98Ny8YqX+I8otaGbvP/E/ipENu/
         oX9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780327141; x=1780931941;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6lilqAuiij9iv6kzYPCZqnmLSIUj1rZr1BJG3cusMtw=;
        b=cI02z7ZqV62UyQ9Trrc7uD+mNNF5foIEIo/l7t7wokkTWWK1ihYVoVpboGoRwUkFzp
         VFEY8SZcVhyGsry8G0g0l8v7duaeKSWN7cDpGwlNi6hkXoTrfNcuZHB6gBNlAJzkpd/H
         h/nwaxhwfth/KSifeoEqGo+ZYT+2Ky6ah17BVKhVDCFGoPSmd4M8ou3yUlZMH8GZQWic
         mPpvrPHPczRVeg7BrnCJYk6lomrsu8d+K7pF5NyKkGh9A2G5Hxmhslg2L+Q5xdlbu/Jy
         bG8RyWK4AOHWfWtFPiiA5n7yQyyclCAIna6pknMIxR+RyRjdPZnDgjXuLDKMg+7x91A4
         KerQ==
X-Forwarded-Encrypted: i=1; AFNElJ++DjP2ALJseMBm0vk1P8bgzcGgD4LI0ATZlSO6iGuWISfZ2gk+5vUM1uFqS/6YgmRKEMvBLmilVfqW@vger.kernel.org
X-Gm-Message-State: AOJu0YxuGWJ6IFVrZ8+mApNFMzsGjSckpXDogIj69A38u3eslEgPwZlI
	h7npmvBsoMJFVoNHP2c7e/JhxCyr+cOi1eBTkI2XrGRczMGR82p8CzVq
X-Gm-Gg: Acq92OGBUUuqpRzAoTVIGp5oPArLum2cxJgD7QlVGrfSbsxQcTJ0rPgAfbb7teMrl2v
	KkjtlpRw5uYggAwBVFqu8m9gYOaHLUO0f4WMQeprcKoV5y8NDcVFE+X4itmC178Affxx9UCvPIh
	i/z8H7IFCMq02ZH0167N1PtIVmE4/NLItDTnEgV2p0tN8ny5PsvFtQn9sf8TMl3uQLAdEqPYXKg
	PX+T4/mlLGjVKVRxwG31hesBhaPgZE2+a3nyXpVf9plKjqfI8bmuKDYSCdO2IFMzjWjPPKcHY2j
	2WV+KWTeXor/7lzGlHPS5qsYPqT+uGJHmtWROOghPG0PxE2Ex4+EfCEjqq/0fcWaewB7TuEkLmG
	215peTVzRBUIgJ0o6FpHwDpNFEe22DMQ04we4oP9OUXz16izXGG6jjM/WGuI6vKtkna1S6jmZYz
	/oqVQu9THcsMGg9fo+jua97Vw=
X-Received: by 2002:a05:600c:6287:b0:490:9d1b:f068 with SMTP id 5b1f17b1804b1-490a295d9c6mr209410175e9.29.1780327140831;
        Mon, 01 Jun 2026 08:19:00 -0700 (PDT)
Received: from xeon ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef354cd7csm25753103f8f.18.2026.06.01.08.18.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 08:19:00 -0700 (PDT)
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
Subject: [PATCH v3 02/11] mfd: lm3533: Remove driver specific regmap wrappers
Date: Mon,  1 Jun 2026 18:18:22 +0300
Message-ID: <20260601151831.76350-3-clamor95@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-8407-lists,linux-leds=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 2361A621C26
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Remove driver-specific regmap wrappers in favor of using regmap helpers
directly. The wrappers are mostly equivalent to the standard helpers, with
two exceptions: regmap_read requires an unsigned int pointer, and
regmap_update_bits has the mask and value arguments swapped. These
differences were accounted for and adjusted accordingly.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/iio/light/lm3533-als.c      | 57 ++++++++++++----------
 drivers/leds/leds-lm3533.c          | 34 +++++++-------
 drivers/mfd/lm3533-core.c           | 73 +++++------------------------
 drivers/mfd/lm3533-ctrlbank.c       | 22 +++++----
 drivers/video/backlight/lm3533_bl.c | 21 +++++----
 include/linux/mfd/lm3533.h          |  8 +---
 6 files changed, 86 insertions(+), 129 deletions(-)

diff --git a/drivers/iio/light/lm3533-als.c b/drivers/iio/light/lm3533-als.c
index 99f0b903018c..fb61904f110f 100644
--- a/drivers/iio/light/lm3533-als.c
+++ b/drivers/iio/light/lm3533-als.c
@@ -17,6 +17,7 @@
 #include <linux/mutex.h>
 #include <linux/mfd/core.h>
 #include <linux/platform_device.h>
+#include <linux/regmap.h>
 #include <linux/slab.h>
 #include <linux/uaccess.h>
 
@@ -64,7 +65,7 @@ static int lm3533_als_get_adc(struct iio_dev *indio_dev, bool average,
 {
 	struct lm3533_als *als = iio_priv(indio_dev);
 	u8 reg;
-	u8 val;
+	u32 val;
 	int ret;
 
 	if (average)
@@ -72,7 +73,7 @@ static int lm3533_als_get_adc(struct iio_dev *indio_dev, bool average,
 	else
 		reg = LM3533_REG_ALS_READ_ADC_RAW;
 
-	ret = lm3533_read(als->lm3533, reg, &val);
+	ret = regmap_read(als->lm3533->regmap, reg, &val);
 	if (ret) {
 		dev_err(&indio_dev->dev, "failed to read adc\n");
 		return ret;
@@ -86,10 +87,10 @@ static int lm3533_als_get_adc(struct iio_dev *indio_dev, bool average,
 static int _lm3533_als_get_zone(struct iio_dev *indio_dev, u8 *zone)
 {
 	struct lm3533_als *als = iio_priv(indio_dev);
-	u8 val;
+	u32 val;
 	int ret;
 
-	ret = lm3533_read(als->lm3533, LM3533_REG_ALS_ZONE_INFO, &val);
+	ret = regmap_read(als->lm3533->regmap, LM3533_REG_ALS_ZONE_INFO, &val);
 	if (ret) {
 		dev_err(&indio_dev->dev, "failed to read zone\n");
 		return ret;
@@ -127,7 +128,7 @@ static inline u8 lm3533_als_get_target_reg(unsigned channel, unsigned zone)
 }
 
 static int lm3533_als_get_target(struct iio_dev *indio_dev, unsigned channel,
-							unsigned zone, u8 *val)
+				 unsigned zone, u32 *val)
 {
 	struct lm3533_als *als = iio_priv(indio_dev);
 	u8 reg;
@@ -140,7 +141,7 @@ static int lm3533_als_get_target(struct iio_dev *indio_dev, unsigned channel,
 		return -EINVAL;
 
 	reg = lm3533_als_get_target_reg(channel, zone);
-	ret = lm3533_read(als->lm3533, reg, val);
+	ret = regmap_read(als->lm3533->regmap, reg, val);
 	if (ret)
 		dev_err(&indio_dev->dev, "failed to get target current\n");
 
@@ -161,7 +162,7 @@ static int lm3533_als_set_target(struct iio_dev *indio_dev, unsigned channel,
 		return -EINVAL;
 
 	reg = lm3533_als_get_target_reg(channel, zone);
-	ret = lm3533_write(als->lm3533, reg, val);
+	ret = regmap_write(als->lm3533->regmap, reg, val);
 	if (ret)
 		dev_err(&indio_dev->dev, "failed to set target current\n");
 
@@ -172,7 +173,7 @@ static int lm3533_als_get_current(struct iio_dev *indio_dev, unsigned channel,
 								int *val)
 {
 	u8 zone;
-	u8 target;
+	u32 target;
 	int ret;
 
 	ret = lm3533_als_get_zone(indio_dev, &zone);
@@ -280,7 +281,8 @@ static int lm3533_als_set_int_mode(struct iio_dev *indio_dev, int enable)
 	else
 		val = 0;
 
-	ret = lm3533_update(als->lm3533, LM3533_REG_ALS_ZONE_INFO, val, mask);
+	ret = regmap_update_bits(als->lm3533->regmap, LM3533_REG_ALS_ZONE_INFO,
+				 val, mask);
 	if (ret) {
 		dev_err(&indio_dev->dev, "failed to set int mode %d\n",
 								enable);
@@ -294,10 +296,10 @@ static int lm3533_als_get_int_mode(struct iio_dev *indio_dev, int *enable)
 {
 	struct lm3533_als *als = iio_priv(indio_dev);
 	u8 mask = LM3533_ALS_INT_ENABLE_MASK;
-	u8 val;
+	u32 val;
 	int ret;
 
-	ret = lm3533_read(als->lm3533, LM3533_REG_ALS_ZONE_INFO, &val);
+	ret = regmap_read(als->lm3533->regmap, LM3533_REG_ALS_ZONE_INFO, &val);
 	if (ret) {
 		dev_err(&indio_dev->dev, "failed to get int mode\n");
 		return ret;
@@ -316,7 +318,7 @@ static inline u8 lm3533_als_get_threshold_reg(unsigned nr, bool raising)
 }
 
 static int lm3533_als_get_threshold(struct iio_dev *indio_dev, unsigned nr,
-							bool raising, u8 *val)
+				    bool raising, u32 *val)
 {
 	struct lm3533_als *als = iio_priv(indio_dev);
 	u8 reg;
@@ -326,7 +328,7 @@ static int lm3533_als_get_threshold(struct iio_dev *indio_dev, unsigned nr,
 		return -EINVAL;
 
 	reg = lm3533_als_get_threshold_reg(nr, raising);
-	ret = lm3533_read(als->lm3533, reg, val);
+	ret = regmap_read(als->lm3533->regmap, reg, val);
 	if (ret)
 		dev_err(&indio_dev->dev, "failed to get threshold\n");
 
@@ -337,7 +339,7 @@ static int lm3533_als_set_threshold(struct iio_dev *indio_dev, unsigned nr,
 							bool raising, u8 val)
 {
 	struct lm3533_als *als = iio_priv(indio_dev);
-	u8 val2;
+	u32 val2;
 	u8 reg, reg2;
 	int ret;
 
@@ -348,7 +350,7 @@ static int lm3533_als_set_threshold(struct iio_dev *indio_dev, unsigned nr,
 	reg2 = lm3533_als_get_threshold_reg(nr, !raising);
 
 	mutex_lock(&als->thresh_mutex);
-	ret = lm3533_read(als->lm3533, reg2, &val2);
+	ret = regmap_read(als->lm3533->regmap, reg2, &val2);
 	if (ret) {
 		dev_err(&indio_dev->dev, "failed to get threshold\n");
 		goto out;
@@ -363,7 +365,7 @@ static int lm3533_als_set_threshold(struct iio_dev *indio_dev, unsigned nr,
 		goto out;
 	}
 
-	ret = lm3533_write(als->lm3533, reg, val);
+	ret = regmap_write(als->lm3533->regmap, reg, val);
 	if (ret) {
 		dev_err(&indio_dev->dev, "failed to set threshold\n");
 		goto out;
@@ -375,11 +377,11 @@ static int lm3533_als_set_threshold(struct iio_dev *indio_dev, unsigned nr,
 }
 
 static int lm3533_als_get_hysteresis(struct iio_dev *indio_dev, unsigned nr,
-								u8 *val)
+				     u32 *val)
 {
 	struct lm3533_als *als = iio_priv(indio_dev);
-	u8 falling;
-	u8 raising;
+	u32 falling;
+	u32 raising;
 	int ret;
 
 	if (nr > LM3533_ALS_THRESH_MAX)
@@ -503,7 +505,7 @@ static ssize_t show_als_attr(struct device *dev,
 {
 	struct iio_dev *indio_dev = dev_to_iio_dev(dev);
 	struct lm3533_als_attribute *als_attr = to_lm3533_als_attr(attr);
-	u8 val;
+	u32 val;
 	int ret;
 
 	switch (als_attr->type) {
@@ -725,7 +727,8 @@ static int lm3533_als_set_input_mode(struct lm3533_als *als, bool pwm_mode)
 	else
 		val = 0;	/* analog input */
 
-	ret = lm3533_update(als->lm3533, LM3533_REG_ALS_CONF, val, mask);
+	ret = regmap_update_bits(als->lm3533->regmap, LM3533_REG_ALS_CONF,
+				 mask, val);
 	if (ret) {
 		dev_err(&als->pdev->dev, "failed to set input mode %d\n",
 								pwm_mode);
@@ -744,7 +747,8 @@ static int lm3533_als_set_resistor(struct lm3533_als *als, u8 val)
 		return -EINVAL;
 	}
 
-	ret = lm3533_write(als->lm3533, LM3533_REG_ALS_RESISTOR_SELECT, val);
+	ret = regmap_write(als->lm3533->regmap, LM3533_REG_ALS_RESISTOR_SELECT,
+			   val);
 	if (ret) {
 		dev_err(&als->pdev->dev, "failed to set resistor\n");
 		return ret;
@@ -778,7 +782,8 @@ static int lm3533_als_setup_irq(struct lm3533_als *als, void *dev)
 	int ret;
 
 	/* Make sure interrupts are disabled. */
-	ret = lm3533_update(als->lm3533, LM3533_REG_ALS_ZONE_INFO, 0, mask);
+	ret = regmap_update_bits(als->lm3533->regmap, LM3533_REG_ALS_ZONE_INFO,
+				 mask, 0);
 	if (ret) {
 		dev_err(&als->pdev->dev, "failed to disable interrupts\n");
 		return ret;
@@ -801,7 +806,8 @@ static int lm3533_als_enable(struct lm3533_als *als)
 	u8 mask = LM3533_ALS_ENABLE_MASK;
 	int ret;
 
-	ret = lm3533_update(als->lm3533, LM3533_REG_ALS_CONF, mask, mask);
+	ret = regmap_update_bits(als->lm3533->regmap, LM3533_REG_ALS_CONF,
+				 mask, mask);
 	if (ret)
 		dev_err(&als->pdev->dev, "failed to enable ALS\n");
 
@@ -813,7 +819,8 @@ static int lm3533_als_disable(struct lm3533_als *als)
 	u8 mask = LM3533_ALS_ENABLE_MASK;
 	int ret;
 
-	ret = lm3533_update(als->lm3533, LM3533_REG_ALS_CONF, 0, mask);
+	ret = regmap_update_bits(als->lm3533->regmap, LM3533_REG_ALS_CONF,
+				 mask, 0);
 	if (ret)
 		dev_err(&als->pdev->dev, "failed to disable ALS\n");
 
diff --git a/drivers/leds/leds-lm3533.c b/drivers/leds/leds-lm3533.c
index 45795f2a1042..51ff61aee75c 100644
--- a/drivers/leds/leds-lm3533.c
+++ b/drivers/leds/leds-lm3533.c
@@ -12,6 +12,7 @@
 #include <linux/mfd/core.h>
 #include <linux/mutex.h>
 #include <linux/platform_device.h>
+#include <linux/regmap.h>
 #include <linux/slab.h>
 
 #include <linux/mfd/lm3533.h>
@@ -101,7 +102,8 @@ static int lm3533_led_pattern_enable(struct lm3533_led *led, int enable)
 	else
 		val = 0;
 
-	ret = lm3533_update(led->lm3533, LM3533_REG_PATTERN_ENABLE, val, mask);
+	ret = regmap_update_bits(led->lm3533->regmap,
+				 LM3533_REG_PATTERN_ENABLE, mask, val);
 	if (ret) {
 		dev_err(led->cdev.dev, "failed to enable pattern %d (%d)\n",
 							pattern, enable);
@@ -131,7 +133,7 @@ static int lm3533_led_set(struct led_classdev *cdev,
 static enum led_brightness lm3533_led_get(struct led_classdev *cdev)
 {
 	struct lm3533_led *led = to_lm3533_led(cdev);
-	u8 val;
+	u32 val;
 	int ret;
 
 	ret = lm3533_ctrlbank_get_brightness(&led->cb, &val);
@@ -259,7 +261,7 @@ static u8 lm3533_led_delay_set(struct lm3533_led *led, u8 base,
 	dev_dbg(led->cdev.dev, "%s - %lu: %u (0x%02x)\n", __func__,
 							*delay, t, val);
 	reg = lm3533_led_get_pattern_reg(led, base);
-	ret = lm3533_write(led->lm3533, reg, val);
+	ret = regmap_write(led->lm3533->regmap, reg, val);
 	if (ret)
 		dev_err(led->cdev.dev, "failed to set delay (%02x)\n", reg);
 
@@ -337,10 +339,10 @@ static ssize_t show_risefalltime(struct device *dev,
 	struct lm3533_led *led = to_lm3533_led(led_cdev);
 	ssize_t ret;
 	u8 reg;
-	u8 val;
+	u32 val;
 
 	reg = lm3533_led_get_pattern_reg(led, base);
-	ret = lm3533_read(led->lm3533, reg, &val);
+	ret = regmap_read(led->lm3533->regmap, reg, &val);
 	if (ret)
 		return ret;
 
@@ -375,7 +377,7 @@ static ssize_t store_risefalltime(struct device *dev,
 		return -EINVAL;
 
 	reg = lm3533_led_get_pattern_reg(led, base);
-	ret = lm3533_write(led->lm3533, reg, val);
+	ret = regmap_write(led->lm3533->regmap, reg, val);
 	if (ret)
 		return ret;
 
@@ -405,11 +407,11 @@ static ssize_t show_als_channel(struct device *dev,
 	struct lm3533_led *led = to_lm3533_led(led_cdev);
 	unsigned channel;
 	u8 reg;
-	u8 val;
+	u32 val;
 	int ret;
 
 	reg = lm3533_led_get_lv_reg(led, LM3533_REG_CTRLBANK_BCONF_BASE);
-	ret = lm3533_read(led->lm3533, reg, &val);
+	ret = regmap_read(led->lm3533->regmap, reg, &val);
 	if (ret)
 		return ret;
 
@@ -441,7 +443,7 @@ static ssize_t store_als_channel(struct device *dev,
 	mask = LM3533_REG_CTRLBANK_BCONF_ALS_CHANNEL_MASK;
 	val = channel - 1;
 
-	ret = lm3533_update(led->lm3533, reg, val, mask);
+	ret = regmap_update_bits(led->lm3533->regmap, reg, mask, val);
 	if (ret)
 		return ret;
 
@@ -455,11 +457,11 @@ static ssize_t show_als_en(struct device *dev,
 	struct lm3533_led *led = to_lm3533_led(led_cdev);
 	bool enable;
 	u8 reg;
-	u8 val;
+	u32 val;
 	int ret;
 
 	reg = lm3533_led_get_lv_reg(led, LM3533_REG_CTRLBANK_BCONF_BASE);
-	ret = lm3533_read(led->lm3533, reg, &val);
+	ret = regmap_read(led->lm3533->regmap, reg, &val);
 	if (ret)
 		return ret;
 
@@ -491,7 +493,7 @@ static ssize_t store_als_en(struct device *dev,
 	else
 		val = 0;
 
-	ret = lm3533_update(led->lm3533, reg, val, mask);
+	ret = regmap_update_bits(led->lm3533->regmap, reg, mask, val);
 	if (ret)
 		return ret;
 
@@ -504,12 +506,12 @@ static ssize_t show_linear(struct device *dev,
 	struct led_classdev *led_cdev = dev_get_drvdata(dev);
 	struct lm3533_led *led = to_lm3533_led(led_cdev);
 	u8 reg;
-	u8 val;
+	u32 val;
 	int linear;
 	int ret;
 
 	reg = lm3533_led_get_lv_reg(led, LM3533_REG_CTRLBANK_BCONF_BASE);
-	ret = lm3533_read(led->lm3533, reg, &val);
+	ret = regmap_read(led->lm3533->regmap, reg, &val);
 	if (ret)
 		return ret;
 
@@ -544,7 +546,7 @@ static ssize_t store_linear(struct device *dev,
 	else
 		val = 0;
 
-	ret = lm3533_update(led->lm3533, reg, val, mask);
+	ret = regmap_update_bits(led->lm3533->regmap, reg, mask, val);
 	if (ret)
 		return ret;
 
@@ -557,7 +559,7 @@ static ssize_t show_pwm(struct device *dev,
 {
 	struct led_classdev *led_cdev = dev_get_drvdata(dev);
 	struct lm3533_led *led = to_lm3533_led(led_cdev);
-	u8 val;
+	u32 val;
 	int ret;
 
 	ret = lm3533_ctrlbank_get_pwm(&led->cb, &val);
diff --git a/drivers/mfd/lm3533-core.c b/drivers/mfd/lm3533-core.c
index 0a2409d00b2e..f9bdc0a1d9be 100644
--- a/drivers/mfd/lm3533-core.c
+++ b/drivers/mfd/lm3533-core.c
@@ -80,66 +80,14 @@ static struct mfd_cell lm3533_led_devs[] = {
 	},
 };
 
-int lm3533_read(struct lm3533 *lm3533, u8 reg, u8 *val)
-{
-	int tmp;
-	int ret;
-
-	ret = regmap_read(lm3533->regmap, reg, &tmp);
-	if (ret < 0) {
-		dev_err(lm3533->dev, "failed to read register %02x: %d\n",
-								reg, ret);
-		return ret;
-	}
-
-	*val = tmp;
-
-	dev_dbg(lm3533->dev, "read [%02x]: %02x\n", reg, *val);
-
-	return ret;
-}
-EXPORT_SYMBOL_GPL(lm3533_read);
-
-int lm3533_write(struct lm3533 *lm3533, u8 reg, u8 val)
-{
-	int ret;
-
-	dev_dbg(lm3533->dev, "write [%02x]: %02x\n", reg, val);
-
-	ret = regmap_write(lm3533->regmap, reg, val);
-	if (ret < 0) {
-		dev_err(lm3533->dev, "failed to write register %02x: %d\n",
-								reg, ret);
-	}
-
-	return ret;
-}
-EXPORT_SYMBOL_GPL(lm3533_write);
-
-int lm3533_update(struct lm3533 *lm3533, u8 reg, u8 val, u8 mask)
-{
-	int ret;
-
-	dev_dbg(lm3533->dev, "update [%02x]: %02x/%02x\n", reg, val, mask);
-
-	ret = regmap_update_bits(lm3533->regmap, reg, mask, val);
-	if (ret < 0) {
-		dev_err(lm3533->dev, "failed to update register %02x: %d\n",
-								reg, ret);
-	}
-
-	return ret;
-}
-EXPORT_SYMBOL_GPL(lm3533_update);
-
 static int lm3533_set_boost_freq(struct lm3533 *lm3533,
 						enum lm3533_boost_freq freq)
 {
 	int ret;
 
-	ret = lm3533_update(lm3533, LM3533_REG_BOOST_PWM,
-					freq << LM3533_BOOST_FREQ_SHIFT,
-					LM3533_BOOST_FREQ_MASK);
+	ret = regmap_update_bits(lm3533->regmap, LM3533_REG_BOOST_PWM,
+				 LM3533_BOOST_FREQ_MASK,
+				 freq << LM3533_BOOST_FREQ_SHIFT);
 	if (ret)
 		dev_err(lm3533->dev, "failed to set boost frequency\n");
 
@@ -152,9 +100,9 @@ static int lm3533_set_boost_ovp(struct lm3533 *lm3533,
 {
 	int ret;
 
-	ret = lm3533_update(lm3533, LM3533_REG_BOOST_PWM,
-					ovp << LM3533_BOOST_OVP_SHIFT,
-					LM3533_BOOST_OVP_MASK);
+	ret = regmap_update_bits(lm3533->regmap, LM3533_REG_BOOST_PWM,
+				 LM3533_BOOST_OVP_MASK,
+				 ovp << LM3533_BOOST_OVP_SHIFT);
 	if (ret)
 		dev_err(lm3533->dev, "failed to set boost ovp\n");
 
@@ -181,7 +129,8 @@ static int lm3533_set_hvled_config(struct lm3533 *lm3533, u8 hvled, u8 bl)
 	mask = LM3533_BL_ID_MASK << shift;
 	val = bl << shift;
 
-	ret = lm3533_update(lm3533, LM3533_REG_OUTPUT_CONF1, val, mask);
+	ret = regmap_update_bits(lm3533->regmap, LM3533_REG_OUTPUT_CONF1,
+				 mask, val);
 	if (ret)
 		dev_err(lm3533->dev, "failed to set hvled config\n");
 
@@ -216,7 +165,7 @@ static int lm3533_set_lvled_config(struct lm3533 *lm3533, u8 lvled, u8 led)
 	mask = LM3533_LED_ID_MASK << shift;
 	val = led << shift;
 
-	ret = lm3533_update(lm3533, reg, val, mask);
+	ret = regmap_update_bits(lm3533->regmap, reg, mask, val);
 	if (ret)
 		dev_err(lm3533->dev, "failed to set lvled config\n");
 
@@ -258,7 +207,7 @@ static ssize_t show_output(struct device *dev,
 	struct lm3533_device_attribute *lattr = to_lm3533_dev_attr(attr);
 	int id = lattr->u.output.id;
 	u8 reg;
-	u8 val;
+	u32 val;
 	u8 mask;
 	int shift;
 	int ret;
@@ -278,7 +227,7 @@ static ssize_t show_output(struct device *dev,
 		mask = LM3533_LED_ID_MASK << shift;
 	}
 
-	ret = lm3533_read(lm3533, reg, &val);
+	ret = regmap_read(lm3533->regmap, reg, &val);
 	if (ret)
 		return ret;
 
diff --git a/drivers/mfd/lm3533-ctrlbank.c b/drivers/mfd/lm3533-ctrlbank.c
index 2537dfade51c..37bae279f41e 100644
--- a/drivers/mfd/lm3533-ctrlbank.c
+++ b/drivers/mfd/lm3533-ctrlbank.c
@@ -9,6 +9,7 @@
 
 #include <linux/device.h>
 #include <linux/module.h>
+#include <linux/regmap.h>
 
 #include <linux/mfd/lm3533.h>
 
@@ -38,8 +39,8 @@ int lm3533_ctrlbank_enable(struct lm3533_ctrlbank *cb)
 	dev_dbg(cb->dev, "%s - %d\n", __func__, cb->id);
 
 	mask = 1 << cb->id;
-	ret = lm3533_update(cb->lm3533, LM3533_REG_CTRLBANK_ENABLE,
-								mask, mask);
+	ret = regmap_update_bits(cb->lm3533->regmap, LM3533_REG_CTRLBANK_ENABLE,
+				 mask, mask);
 	if (ret)
 		dev_err(cb->dev, "failed to enable ctrlbank %d\n", cb->id);
 
@@ -55,7 +56,8 @@ int lm3533_ctrlbank_disable(struct lm3533_ctrlbank *cb)
 	dev_dbg(cb->dev, "%s - %d\n", __func__, cb->id);
 
 	mask = 1 << cb->id;
-	ret = lm3533_update(cb->lm3533, LM3533_REG_CTRLBANK_ENABLE, 0, mask);
+	ret = regmap_update_bits(cb->lm3533->regmap, LM3533_REG_CTRLBANK_ENABLE,
+				 mask, 0);
 	if (ret)
 		dev_err(cb->dev, "failed to disable ctrlbank %d\n", cb->id);
 
@@ -80,7 +82,7 @@ int lm3533_ctrlbank_set_max_current(struct lm3533_ctrlbank *cb, u16 imax)
 	val = (imax - LM3533_MAX_CURRENT_MIN) / LM3533_MAX_CURRENT_STEP;
 
 	reg = lm3533_ctrlbank_get_reg(cb, LM3533_REG_MAX_CURRENT_BASE);
-	ret = lm3533_write(cb->lm3533, reg, val);
+	ret = regmap_write(cb->lm3533->regmap, reg, val);
 	if (ret)
 		dev_err(cb->dev, "failed to set max current\n");
 
@@ -94,7 +96,7 @@ int lm3533_ctrlbank_set_brightness(struct lm3533_ctrlbank *cb, u8 val)
 	int ret;
 
 	reg = lm3533_ctrlbank_get_reg(cb, LM3533_REG_BRIGHTNESS_BASE);
-	ret = lm3533_write(cb->lm3533, reg, val);
+	ret = regmap_write(cb->lm3533->regmap, reg, val);
 	if (ret)
 		dev_err(cb->dev, "failed to set brightness\n");
 
@@ -102,13 +104,13 @@ int lm3533_ctrlbank_set_brightness(struct lm3533_ctrlbank *cb, u8 val)
 }
 EXPORT_SYMBOL_GPL(lm3533_ctrlbank_set_brightness);
 
-int lm3533_ctrlbank_get_brightness(struct lm3533_ctrlbank *cb, u8 *val)
+int lm3533_ctrlbank_get_brightness(struct lm3533_ctrlbank *cb, u32 *val)
 {
 	u8 reg;
 	int ret;
 
 	reg = lm3533_ctrlbank_get_reg(cb, LM3533_REG_BRIGHTNESS_BASE);
-	ret = lm3533_read(cb->lm3533, reg, val);
+	ret = regmap_read(cb->lm3533->regmap, reg, val);
 	if (ret)
 		dev_err(cb->dev, "failed to get brightness\n");
 
@@ -135,7 +137,7 @@ int lm3533_ctrlbank_set_pwm(struct lm3533_ctrlbank *cb, u8 val)
 		return -EINVAL;
 
 	reg = lm3533_ctrlbank_get_reg(cb, LM3533_REG_PWM_BASE);
-	ret = lm3533_write(cb->lm3533, reg, val);
+	ret = regmap_write(cb->lm3533->regmap, reg, val);
 	if (ret)
 		dev_err(cb->dev, "failed to set PWM mask\n");
 
@@ -143,13 +145,13 @@ int lm3533_ctrlbank_set_pwm(struct lm3533_ctrlbank *cb, u8 val)
 }
 EXPORT_SYMBOL_GPL(lm3533_ctrlbank_set_pwm);
 
-int lm3533_ctrlbank_get_pwm(struct lm3533_ctrlbank *cb, u8 *val)
+int lm3533_ctrlbank_get_pwm(struct lm3533_ctrlbank *cb, u32 *val)
 {
 	u8 reg;
 	int ret;
 
 	reg = lm3533_ctrlbank_get_reg(cb, LM3533_REG_PWM_BASE);
-	ret = lm3533_read(cb->lm3533, reg, val);
+	ret = regmap_read(cb->lm3533->regmap, reg, val);
 	if (ret)
 		dev_err(cb->dev, "failed to get PWM mask\n");
 
diff --git a/drivers/video/backlight/lm3533_bl.c b/drivers/video/backlight/lm3533_bl.c
index babfd3ceec86..5c8e69087860 100644
--- a/drivers/video/backlight/lm3533_bl.c
+++ b/drivers/video/backlight/lm3533_bl.c
@@ -11,6 +11,7 @@
 #include <linux/init.h>
 #include <linux/platform_device.h>
 #include <linux/backlight.h>
+#include <linux/regmap.h>
 #include <linux/slab.h>
 
 #include <linux/mfd/lm3533.h>
@@ -45,7 +46,7 @@ static int lm3533_bl_update_status(struct backlight_device *bd)
 static int lm3533_bl_get_brightness(struct backlight_device *bd)
 {
 	struct lm3533_bl *bl = bl_get_data(bd);
-	u8 val;
+	u32 val;
 	int ret;
 
 	ret = lm3533_ctrlbank_get_brightness(&bl->cb, &val);
@@ -82,12 +83,12 @@ static ssize_t show_als_en(struct device *dev,
 {
 	struct lm3533_bl *bl = dev_get_drvdata(dev);
 	int ctrlbank = lm3533_bl_get_ctrlbank_id(bl);
-	u8 val;
+	u32 val;
 	u8 mask;
 	bool enable;
 	int ret;
 
-	ret = lm3533_read(bl->lm3533, LM3533_REG_CTRLBANK_AB_BCONF, &val);
+	ret = regmap_read(bl->lm3533->regmap, LM3533_REG_CTRLBANK_AB_BCONF, &val);
 	if (ret)
 		return ret;
 
@@ -118,8 +119,8 @@ static ssize_t store_als_en(struct device *dev,
 	else
 		val = 0;
 
-	ret = lm3533_update(bl->lm3533, LM3533_REG_CTRLBANK_AB_BCONF, val,
-									mask);
+	ret = regmap_update_bits(bl->lm3533->regmap, LM3533_REG_CTRLBANK_AB_BCONF,
+				 mask, val);
 	if (ret)
 		return ret;
 
@@ -130,12 +131,12 @@ static ssize_t show_linear(struct device *dev,
 				struct device_attribute *attr, char *buf)
 {
 	struct lm3533_bl *bl = dev_get_drvdata(dev);
-	u8 val;
+	u32 val;
 	u8 mask;
 	int linear;
 	int ret;
 
-	ret = lm3533_read(bl->lm3533, LM3533_REG_CTRLBANK_AB_BCONF, &val);
+	ret = regmap_read(bl->lm3533->regmap, LM3533_REG_CTRLBANK_AB_BCONF, &val);
 	if (ret)
 		return ret;
 
@@ -169,8 +170,8 @@ static ssize_t store_linear(struct device *dev,
 	else
 		val = 0;
 
-	ret = lm3533_update(bl->lm3533, LM3533_REG_CTRLBANK_AB_BCONF, val,
-									mask);
+	ret = regmap_update_bits(bl->lm3533->regmap, LM3533_REG_CTRLBANK_AB_BCONF,
+				 mask, val);
 	if (ret)
 		return ret;
 
@@ -182,7 +183,7 @@ static ssize_t show_pwm(struct device *dev,
 					char *buf)
 {
 	struct lm3533_bl *bl = dev_get_drvdata(dev);
-	u8 val;
+	u32 val;
 	int ret;
 
 	ret = lm3533_ctrlbank_get_pwm(&bl->cb, &val);
diff --git a/include/linux/mfd/lm3533.h b/include/linux/mfd/lm3533.h
index 69059a7a2ce5..db0a5e5c9e39 100644
--- a/include/linux/mfd/lm3533.h
+++ b/include/linux/mfd/lm3533.h
@@ -86,14 +86,10 @@ extern int lm3533_ctrlbank_enable(struct lm3533_ctrlbank *cb);
 extern int lm3533_ctrlbank_disable(struct lm3533_ctrlbank *cb);
 
 extern int lm3533_ctrlbank_set_brightness(struct lm3533_ctrlbank *cb, u8 val);
-extern int lm3533_ctrlbank_get_brightness(struct lm3533_ctrlbank *cb, u8 *val);
+extern int lm3533_ctrlbank_get_brightness(struct lm3533_ctrlbank *cb, u32 *val);
 extern int lm3533_ctrlbank_set_max_current(struct lm3533_ctrlbank *cb,
 								u16 imax);
 extern int lm3533_ctrlbank_set_pwm(struct lm3533_ctrlbank *cb, u8 val);
-extern int lm3533_ctrlbank_get_pwm(struct lm3533_ctrlbank *cb, u8 *val);
-
-extern int lm3533_read(struct lm3533 *lm3533, u8 reg, u8 *val);
-extern int lm3533_write(struct lm3533 *lm3533, u8 reg, u8 val);
-extern int lm3533_update(struct lm3533 *lm3533, u8 reg, u8 val, u8 mask);
+extern int lm3533_ctrlbank_get_pwm(struct lm3533_ctrlbank *cb, u32 *val);
 
 #endif	/* __LINUX_MFD_LM3533_H */
-- 
2.51.0


