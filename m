Return-Path: <linux-leds+bounces-8161-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mONpEOxxCWpJaQQAu9opvQ
	(envelope-from <linux-leds+bounces-8161-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sun, 17 May 2026 09:44:44 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D0A1555FBB7
	for <lists+linux-leds@lfdr.de>; Sun, 17 May 2026 09:44:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 310593027694
	for <lists+linux-leds@lfdr.de>; Sun, 17 May 2026 07:43:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F30693126A0;
	Sun, 17 May 2026 07:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vf6b1yY3"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6489231327F
	for <linux-leds@vger.kernel.org>; Sun, 17 May 2026 07:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779003818; cv=none; b=m1FX3XwNgjTQlN40H32BEAS7li+gjCULnJHx9t/3NvCDrU2SESbkv7RVc0bLISIXrHwVWQcncsObhIx5PQgJirYl5gho1+kuhwx1JGXFb4AamZNA2PrjxO7BzgAEGjivFmaKKttY39rdJI1pIUxeUT4t04sKQRPqvGw2EL91CT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779003818; c=relaxed/simple;
	bh=o7Qk9eTCH9YR9uaW2iDtZYtUUoVzV7Cxh7/+b3Ub5iA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PiL+ozSlh2WkTEalUkgzCON8ZWpNIObs4BdJMyPhZDoLBCn+JbssHTtwEQAxOz6E8GQfMiAlGy/CezRcObLNlRra/3Og8xzRoHWJSIIv798MrfDklGFlYkq0lGNJlaz+/a9Clpr222lkf+a7jWw1xk+dzK7cHmaAkeE7yWfVuSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vf6b1yY3; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-44e1860558fso561092f8f.0
        for <linux-leds@vger.kernel.org>; Sun, 17 May 2026 00:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779003814; x=1779608614; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KRWlVOqS1iSVkHVqZF13gCOFGNUpfAMneUBSn8wSpl4=;
        b=Vf6b1yY3aKVHvrPGkLL9oENHbhaComqvJRdbFwHBT/mbMn6AXq7vDKLPOqfxM59WtQ
         NpaCGEAigaZ1k2FM0hF+N3/nDHTLXKZ496o9s1IbIIajUKC50WFFKBr6W3hoSYpgGYDB
         wWOD74TT4pCt0+ROdnEy/FcBbC1Vq/MMqp80tkcOD3RmxzaHer7tQCcBWfyM0TuCWPTn
         a+e6bT1JZoUmhrersf4kNJW2YuXYxKjspbaPm50KFU+HBZAdfoQZ6wUuBdz1lroJ4DH6
         DtonhTwLJNA+43D2hiVHoC7hqyzHp/ZqHkhGVBR3yRBIm6K+4dqg21U+RxPcib0i/euC
         Vbcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779003814; x=1779608614;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KRWlVOqS1iSVkHVqZF13gCOFGNUpfAMneUBSn8wSpl4=;
        b=bp0gw53sFMmN1ta7XbiKrGtg6sxul1g1HEs3RMmKqYn4T1RPqPmKUujp5P4hRBGsXd
         AN7gbp20nsZJgGVLN8c4id7kTkEjXw8i1oLF9UNG5tFZwE5uRaSmzHB/uD9fzJAgoFDN
         EsNapFLQ2wQuwR+kYC9UUL+OYN8+Z+n0VB/i1CvVpjuE/jZs5F7LPgKoWal32bIlYdDS
         EYdPV3RT92BQIl+PWG5Nz0Gd0E+2rK+75lQqc/8fhxdIGFeJKxrScDCyQbWRtjxJr4CF
         0JKgstIQiCa4ontzIDMZ71D9AYtuU8KPyxsvTY6cM99cUeEW3FCQKV2P17TqtmZbfb1S
         K4fw==
X-Forwarded-Encrypted: i=1; AFNElJ/eXuLNluTeBLe2cZ5OAt7uSzfYQuc5wRNNWSkt/H0G77RiCKKIt0C45JipZ4SAl6LnJEuuiSZkJi/y@vger.kernel.org
X-Gm-Message-State: AOJu0YxrwheHBk/1l8lpXuk14NIplI+NSYqYQhXL0wvEU+AKMul67Fx5
	Hn2WXjqUowmINTDHDS13bTyjvxn1MMA1Ky3P2w64RmTYqA2uePrQymUv
X-Gm-Gg: Acq92OGoe8UAHV7l2EEqIxFgxab4TCi6T9zMcUuZ5aEMEDA0C1G3acm7e8cC+FgdeiV
	cTkdxLVjUYzsI/XO4TZlXlPN66P8ttydDet0aishMlh2nf8XEFcbO6ACKptNwcCq921yleXQXG+
	xZ8Z2OjN5Fu3odzASR5J8yYL4X8C6vJonSvCuZPGyuiOIoFFT7aMd/1P4yh8QDcN3vFnRIieKtl
	jvbkcji9NaSYrD0xAcdO0WChVQk24BOJpNXXOBUhBo4//c7Mnkjuag2DDnHcQk0guHrLWEwZhuE
	AyMEyf4ezSlwtQ8cVCb4R7wIewz5C32oe0LKBNNHgbWE51bGR7MEJr/K/lMcWvWgtEdI6FiF7/o
	/sd4vUpgZcHvBvFp/k5jmsE6pQQX9gFwd6BTq5v7PrdSiP4zsJtGVIJ4e+HMLbtl1SkJ0Qci7XO
	LtmgYg0UJ3izNX
X-Received: by 2002:a05:6000:40cc:b0:43f:dd91:b022 with SMTP id ffacd0b85a97d-45e5c5ccb3amr15659081f8f.35.1779003813608;
        Sun, 17 May 2026 00:43:33 -0700 (PDT)
Received: from xeon ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0fe248dsm27512864f8f.30.2026.05.17.00.43.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 00:43:33 -0700 (PDT)
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
Subject: [PATCH v1 2/6] mfd: lm3533: Convert to use OF bindings
Date: Sun, 17 May 2026 10:43:02 +0300
Message-ID: <20260517074306.30937-3-clamor95@gmail.com>
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
X-Rspamd-Queue-Id: D0A1555FBB7
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
	TAGGED_FROM(0.00)[bounces-8161-lists,linux-leds=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.997];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Since there are no users of this driver via platform data, remove the
platform data support and switch to using Device Tree bindings.
Additionally, optimize functions used only by platform data.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/iio/light/lm3533-als.c      | 123 +++++--------
 drivers/leds/leds-lm3533.c          |  60 ++++---
 drivers/mfd/lm3533-core.c           | 257 +++++++++-------------------
 drivers/video/backlight/lm3533_bl.c |  52 ++++--
 include/linux/mfd/lm3533.h          |  51 +-----
 5 files changed, 202 insertions(+), 341 deletions(-)

diff --git a/drivers/iio/light/lm3533-als.c b/drivers/iio/light/lm3533-als.c
index 99f0b903018c..853abb96e13f 100644
--- a/drivers/iio/light/lm3533-als.c
+++ b/drivers/iio/light/lm3533-als.c
@@ -16,15 +16,18 @@
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/mfd/core.h>
+#include <linux/mod_devicetable.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
 #include <linux/slab.h>
 #include <linux/uaccess.h>
+#include <linux/units.h>
 
 #include <linux/mfd/lm3533.h>
 
 
-#define LM3533_ALS_RESISTOR_MIN			1
-#define LM3533_ALS_RESISTOR_MAX			127
+#define LM3533_ALS_RESISTOR_MIN			1575
+#define LM3533_ALS_RESISTOR_MAX			200000
 #define LM3533_ALS_CHANNEL_CURRENT_MAX		2
 #define LM3533_ALS_THRESH_MAX			3
 #define LM3533_ALS_ZONE_MAX			4
@@ -56,6 +59,9 @@ struct lm3533_als {
 
 	atomic_t zone;
 	struct mutex thresh_mutex;
+
+	bool pwm_mode;
+	u32 r_select;
 };
 
 
@@ -714,64 +720,6 @@ static const struct attribute_group lm3533_als_attribute_group = {
 	.attrs = lm3533_als_attributes
 };
 
-static int lm3533_als_set_input_mode(struct lm3533_als *als, bool pwm_mode)
-{
-	u8 mask = LM3533_ALS_INPUT_MODE_MASK;
-	u8 val;
-	int ret;
-
-	if (pwm_mode)
-		val = mask;	/* pwm input */
-	else
-		val = 0;	/* analog input */
-
-	ret = lm3533_update(als->lm3533, LM3533_REG_ALS_CONF, val, mask);
-	if (ret) {
-		dev_err(&als->pdev->dev, "failed to set input mode %d\n",
-								pwm_mode);
-		return ret;
-	}
-
-	return 0;
-}
-
-static int lm3533_als_set_resistor(struct lm3533_als *als, u8 val)
-{
-	int ret;
-
-	if (val < LM3533_ALS_RESISTOR_MIN || val > LM3533_ALS_RESISTOR_MAX) {
-		dev_err(&als->pdev->dev, "invalid resistor value\n");
-		return -EINVAL;
-	}
-
-	ret = lm3533_write(als->lm3533, LM3533_REG_ALS_RESISTOR_SELECT, val);
-	if (ret) {
-		dev_err(&als->pdev->dev, "failed to set resistor\n");
-		return ret;
-	}
-
-	return 0;
-}
-
-static int lm3533_als_setup(struct lm3533_als *als,
-			    const struct lm3533_als_platform_data *pdata)
-{
-	int ret;
-
-	ret = lm3533_als_set_input_mode(als, pdata->pwm_mode);
-	if (ret)
-		return ret;
-
-	/* ALS input is always high impedance in PWM-mode. */
-	if (!pdata->pwm_mode) {
-		ret = lm3533_als_set_resistor(als, pdata->r_select);
-		if (ret)
-			return ret;
-	}
-
-	return 0;
-}
-
 static int lm3533_als_setup_irq(struct lm3533_als *als, void *dev)
 {
 	u8 mask = LM3533_ALS_INT_ENABLE_MASK;
@@ -784,7 +732,8 @@ static int lm3533_als_setup_irq(struct lm3533_als *als, void *dev)
 		return ret;
 	}
 
-	ret = request_threaded_irq(als->irq, NULL, lm3533_als_isr,
+	ret = devm_request_threaded_irq(&als->pdev->dev, als->irq, NULL,
+					lm3533_als_isr,
 					IRQF_TRIGGER_LOW | IRQF_ONESHOT,
 					dev_name(&als->pdev->dev), dev);
 	if (ret) {
@@ -828,7 +777,6 @@ static const struct iio_info lm3533_als_info = {
 
 static int lm3533_als_probe(struct platform_device *pdev)
 {
-	const struct lm3533_als_platform_data *pdata;
 	struct lm3533 *lm3533;
 	struct lm3533_als *als;
 	struct iio_dev *indio_dev;
@@ -838,12 +786,6 @@ static int lm3533_als_probe(struct platform_device *pdev)
 	if (!lm3533)
 		return -EINVAL;
 
-	pdata = dev_get_platdata(&pdev->dev);
-	if (!pdata) {
-		dev_err(&pdev->dev, "no platform data\n");
-		return -EINVAL;
-	}
-
 	indio_dev = devm_iio_device_alloc(&pdev->dev, sizeof(*als));
 	if (!indio_dev)
 		return -ENOMEM;
@@ -852,31 +794,52 @@ static int lm3533_als_probe(struct platform_device *pdev)
 	indio_dev->channels = lm3533_als_channels;
 	indio_dev->num_channels = ARRAY_SIZE(lm3533_als_channels);
 	indio_dev->name = dev_name(&pdev->dev);
-	iio_device_set_parent(indio_dev, pdev->dev.parent);
 	indio_dev->modes = INDIO_DIRECT_MODE;
 
 	als = iio_priv(indio_dev);
 	als->lm3533 = lm3533;
 	als->pdev = pdev;
-	als->irq = lm3533->irq;
+	als->irq = platform_get_irq_optional(pdev, 0);
 	atomic_set(&als->zone, 0);
 	mutex_init(&als->thresh_mutex);
 
 	platform_set_drvdata(pdev, indio_dev);
 
-	if (als->irq) {
+	if (als->irq > 0) {
 		ret = lm3533_als_setup_irq(als, indio_dev);
 		if (ret)
 			return ret;
 	}
 
-	ret = lm3533_als_setup(als, pdata);
+	device_property_read_u32(&pdev->dev, "ti,resistor-value-ohm",
+				 &als->r_select);
+
+	als->r_select = clamp(als->r_select, LM3533_ALS_RESISTOR_MIN,
+			      LM3533_ALS_RESISTOR_MAX);
+	als->r_select = DIV_ROUND_UP(2 * MICRO, 10 * als->r_select);
+
+	als->pwm_mode = device_property_read_bool(&pdev->dev, "ti,pwm-mode");
+
+	ret = lm3533_update(lm3533, LM3533_REG_ALS_CONF, als->pwm_mode ?
+			    LM3533_ALS_INPUT_MODE_MASK : 0,
+			    LM3533_ALS_INPUT_MODE_MASK);
 	if (ret)
-		goto err_free_irq;
+		return dev_err_probe(&pdev->dev, ret,
+				     "failed to set input mode %d\n",
+				     als->pwm_mode);
+
+	/* ALS input is always high impedance in PWM-mode. */
+	if (!als->pwm_mode) {
+		ret = lm3533_write(lm3533, LM3533_REG_ALS_RESISTOR_SELECT,
+				   (u8)als->r_select);
+		if (ret)
+			return dev_err_probe(&pdev->dev, ret,
+					     "failed to set resistor\n");
+	}
 
 	ret = lm3533_als_enable(als);
 	if (ret)
-		goto err_free_irq;
+		return ret;
 
 	ret = iio_device_register(indio_dev);
 	if (ret) {
@@ -888,9 +851,6 @@ static int lm3533_als_probe(struct platform_device *pdev)
 
 err_disable:
 	lm3533_als_disable(als);
-err_free_irq:
-	if (als->irq)
-		free_irq(als->irq, indio_dev);
 
 	return ret;
 }
@@ -903,13 +863,18 @@ static void lm3533_als_remove(struct platform_device *pdev)
 	lm3533_als_set_int_mode(indio_dev, false);
 	iio_device_unregister(indio_dev);
 	lm3533_als_disable(als);
-	if (als->irq)
-		free_irq(als->irq, indio_dev);
 }
 
+static const struct of_device_id lm3533_als_match_table[] = {
+	{ .compatible = "ti,lm3533-als" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, lm3533_als_match_table);
+
 static struct platform_driver lm3533_als_driver = {
 	.driver	= {
 		.name	= "lm3533-als",
+		.of_match_table = lm3533_als_match_table,
 	},
 	.probe		= lm3533_als_probe,
 	.remove		= lm3533_als_remove,
diff --git a/drivers/leds/leds-lm3533.c b/drivers/leds/leds-lm3533.c
index 45795f2a1042..f6345bc1f443 100644
--- a/drivers/leds/leds-lm3533.c
+++ b/drivers/leds/leds-lm3533.c
@@ -10,8 +10,10 @@
 #include <linux/module.h>
 #include <linux/leds.h>
 #include <linux/mfd/core.h>
+#include <linux/mod_devicetable.h>
 #include <linux/mutex.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
 #include <linux/slab.h>
 
 #include <linux/mfd/lm3533.h>
@@ -48,6 +50,9 @@ struct lm3533_led {
 
 	struct mutex mutex;
 	unsigned long flags;
+
+	u32 max_current;
+	u32 pwm;
 };
 
 
@@ -632,22 +637,20 @@ static const struct attribute_group *lm3533_led_attribute_groups[] = {
 	NULL
 };
 
-static int lm3533_led_setup(struct lm3533_led *led,
-					struct lm3533_led_platform_data *pdata)
+static int lm3533_led_setup(struct lm3533_led *led)
 {
 	int ret;
 
-	ret = lm3533_ctrlbank_set_max_current(&led->cb, pdata->max_current);
+	ret = lm3533_ctrlbank_set_max_current(&led->cb, led->max_current);
 	if (ret)
 		return ret;
 
-	return lm3533_ctrlbank_set_pwm(&led->cb, pdata->pwm);
+	return lm3533_ctrlbank_set_pwm(&led->cb, led->pwm);
 }
 
 static int lm3533_led_probe(struct platform_device *pdev)
 {
 	struct lm3533 *lm3533;
-	struct lm3533_led_platform_data *pdata;
 	struct lm3533_led *led;
 	int ret;
 
@@ -657,30 +660,30 @@ static int lm3533_led_probe(struct platform_device *pdev)
 	if (!lm3533)
 		return -EINVAL;
 
-	pdata = dev_get_platdata(&pdev->dev);
-	if (!pdata) {
-		dev_err(&pdev->dev, "no platform data\n");
-		return -EINVAL;
-	}
-
-	if (pdev->id < 0 || pdev->id >= LM3533_LVCTRLBANK_COUNT) {
-		dev_err(&pdev->dev, "illegal LED id %d\n", pdev->id);
-		return -EINVAL;
-	}
+	if (pdev->id < LM3533_LVCTRLBANK_MIN || pdev->id > LM3533_LVCTRLBANK_MAX)
+		return dev_err_probe(&pdev->dev, -EINVAL,
+				     "illegal LED id %d\n", pdev->id);
 
 	led = devm_kzalloc(&pdev->dev, sizeof(*led), GFP_KERNEL);
 	if (!led)
 		return -ENOMEM;
 
 	led->lm3533 = lm3533;
-	led->cdev.name = pdata->name;
-	led->cdev.default_trigger = pdata->default_trigger;
 	led->cdev.brightness_set_blocking = lm3533_led_set;
 	led->cdev.brightness_get = lm3533_led_get;
 	led->cdev.blink_set = lm3533_led_blink_set;
 	led->cdev.brightness = LED_OFF;
 	led->cdev.groups = lm3533_led_attribute_groups;
-	led->id = pdev->id;
+	led->id = pdev->id - LM3533_LVCTRLBANK_MIN;
+
+	led->cdev.name = devm_kasprintf(&pdev->dev, GFP_KERNEL, "%s-%d",
+					pdev->name, led->id);
+	if (!led->cdev.name)
+		return -ENOMEM;
+
+	led->cdev.default_trigger = "none";
+	device_property_read_string(&pdev->dev, "linux,default-trigger",
+				    &led->cdev.default_trigger);
 
 	mutex_init(&led->mutex);
 
@@ -694,15 +697,23 @@ static int lm3533_led_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, led);
 
-	ret = led_classdev_register(pdev->dev.parent, &led->cdev);
+	ret = led_classdev_register(&pdev->dev, &led->cdev);
 	if (ret) {
-		dev_err(&pdev->dev, "failed to register LED %d\n", pdev->id);
+		dev_err(&pdev->dev, "failed to register LED %d\n", led->id);
 		return ret;
 	}
 
 	led->cb.dev = led->cdev.dev;
 
-	ret = lm3533_led_setup(led, pdata);
+	device_property_read_u32(&pdev->dev, "led-max-microamp",
+				 &led->max_current);
+	led->max_current = clamp(led->max_current, LM3533_LED_MAX_CURRENT_MIN,
+				 LM3533_LED_MAX_CURRENT_MAX);
+
+	led->pwm = 0;
+	device_property_read_u32(&pdev->dev, "ti,pwm-config-mask", &led->pwm);
+
+	ret = lm3533_led_setup(led);
 	if (ret)
 		goto err_deregister;
 
@@ -739,9 +750,16 @@ static void lm3533_led_shutdown(struct platform_device *pdev)
 	lm3533_led_set(&led->cdev, LED_OFF);		/* disable blink */
 }
 
+static const struct of_device_id lm3533_led_match_table[] = {
+	{ .compatible = "ti,lm3533-leds" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, lm3533_led_match_table);
+
 static struct platform_driver lm3533_led_driver = {
 	.driver = {
 		.name = "lm3533-leds",
+		.of_match_table = lm3533_led_match_table,
 	},
 	.probe		= lm3533_led_probe,
 	.remove		= lm3533_led_remove,
diff --git a/drivers/mfd/lm3533-core.c b/drivers/mfd/lm3533-core.c
index 0a2409d00b2e..83ebd780f39d 100644
--- a/drivers/mfd/lm3533-core.c
+++ b/drivers/mfd/lm3533-core.c
@@ -14,19 +14,26 @@
 #include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
 #include <linux/mfd/core.h>
+#include <linux/mod_devicetable.h>
+#include <linux/property.h>
 #include <linux/regmap.h>
 #include <linux/seq_file.h>
 #include <linux/slab.h>
 #include <linux/uaccess.h>
+#include <linux/units.h>
 
 #include <linux/mfd/lm3533.h>
 
 
 #define LM3533_BOOST_OVP_MASK		0x06
 #define LM3533_BOOST_OVP_SHIFT		1
+#define LM3533_BOOST_OVP_MIN		16000000
+#define LM3533_BOOST_OVP_MAX		40000000
 
 #define LM3533_BOOST_FREQ_MASK		0x01
 #define LM3533_BOOST_FREQ_SHIFT		0
+#define LM3533_BOOST_FREQ_MIN		500000
+#define LM3533_BOOST_FREQ_MAX		1000000
 
 #define LM3533_BL_ID_MASK		1
 #define LM3533_LED_ID_MASK		3
@@ -42,42 +49,14 @@
 
 #define LM3533_REG_MAX			0xb2
 
-
-static struct mfd_cell lm3533_als_devs[] = {
-	{
-		.name	= "lm3533-als",
-		.id	= -1,
-	},
-};
-
-static struct mfd_cell lm3533_bl_devs[] = {
-	{
-		.name	= "lm3533-backlight",
-		.id	= 0,
-	},
-	{
-		.name	= "lm3533-backlight",
-		.id	= 1,
-	},
-};
-
-static struct mfd_cell lm3533_led_devs[] = {
-	{
-		.name	= "lm3533-leds",
-		.id	= 0,
-	},
-	{
-		.name	= "lm3533-leds",
-		.id	= 1,
-	},
-	{
-		.name	= "lm3533-leds",
-		.id	= 2,
-	},
-	{
-		.name	= "lm3533-leds",
-		.id	= 3,
-	},
+static struct mfd_cell lm3533_child_devices[] = {
+	MFD_CELL_OF("lm3533-als", NULL, NULL, 0, 0, "ti,lm3533-als"),
+	MFD_CELL_OF_REG("lm3533-backlight", NULL, NULL, 0, 0, "ti,lm3533-backlight", 0),
+	MFD_CELL_OF_REG("lm3533-backlight", NULL, NULL, 0, 1, "ti,lm3533-backlight", 1),
+	MFD_CELL_OF_REG("lm3533-leds", NULL, NULL, 0, 0, "ti,lm3533-leds", 2),
+	MFD_CELL_OF_REG("lm3533-leds", NULL, NULL, 0, 1, "ti,lm3533-leds", 3),
+	MFD_CELL_OF_REG("lm3533-leds", NULL, NULL, 0, 2, "ti,lm3533-leds", 4),
+	MFD_CELL_OF_REG("lm3533-leds", NULL, NULL, 0, 3, "ti,lm3533-leds", 5),
 };
 
 int lm3533_read(struct lm3533 *lm3533, u8 reg, u8 *val)
@@ -132,35 +111,6 @@ int lm3533_update(struct lm3533 *lm3533, u8 reg, u8 val, u8 mask)
 }
 EXPORT_SYMBOL_GPL(lm3533_update);
 
-static int lm3533_set_boost_freq(struct lm3533 *lm3533,
-						enum lm3533_boost_freq freq)
-{
-	int ret;
-
-	ret = lm3533_update(lm3533, LM3533_REG_BOOST_PWM,
-					freq << LM3533_BOOST_FREQ_SHIFT,
-					LM3533_BOOST_FREQ_MASK);
-	if (ret)
-		dev_err(lm3533->dev, "failed to set boost frequency\n");
-
-	return ret;
-}
-
-
-static int lm3533_set_boost_ovp(struct lm3533 *lm3533,
-						enum lm3533_boost_ovp ovp)
-{
-	int ret;
-
-	ret = lm3533_update(lm3533, LM3533_REG_BOOST_PWM,
-					ovp << LM3533_BOOST_OVP_SHIFT,
-					LM3533_BOOST_OVP_MASK);
-	if (ret)
-		dev_err(lm3533->dev, "failed to set boost ovp\n");
-
-	return ret;
-}
-
 /*
  * HVLED output config -- output hvled controlled by backlight bl
  */
@@ -376,136 +326,45 @@ static struct attribute_group lm3533_attribute_group = {
 	.attrs		= lm3533_attributes
 };
 
-static int lm3533_device_als_init(struct lm3533 *lm3533)
+static int lm3533_device_init(struct lm3533 *lm3533)
 {
-	struct lm3533_platform_data *pdata = dev_get_platdata(lm3533->dev);
+	struct device *dev = lm3533->dev;
 	int ret;
 
-	if (!pdata->als)
-		return 0;
-
-	lm3533_als_devs[0].platform_data = pdata->als;
-	lm3533_als_devs[0].pdata_size = sizeof(*pdata->als);
+	lm3533_enable(lm3533);
 
-	ret = mfd_add_devices(lm3533->dev, 0, lm3533_als_devs, 1, NULL,
-			      0, NULL);
+	ret = lm3533_update(lm3533, LM3533_REG_BOOST_PWM,
+			    lm3533->boost_freq << LM3533_BOOST_FREQ_SHIFT,
+			    LM3533_BOOST_FREQ_MASK);
 	if (ret) {
-		dev_err(lm3533->dev, "failed to add ALS device\n");
-		return ret;
-	}
-
-	lm3533->have_als = 1;
-
-	return 0;
-}
-
-static int lm3533_device_bl_init(struct lm3533 *lm3533)
-{
-	struct lm3533_platform_data *pdata = dev_get_platdata(lm3533->dev);
-	int i;
-	int ret;
-
-	if (!pdata->backlights || pdata->num_backlights == 0)
-		return 0;
-
-	if (pdata->num_backlights > ARRAY_SIZE(lm3533_bl_devs))
-		pdata->num_backlights = ARRAY_SIZE(lm3533_bl_devs);
-
-	for (i = 0; i < pdata->num_backlights; ++i) {
-		lm3533_bl_devs[i].platform_data = &pdata->backlights[i];
-		lm3533_bl_devs[i].pdata_size = sizeof(pdata->backlights[i]);
+		dev_err(dev, "failed to set boost frequency\n");
+		goto err_disable;
 	}
 
-	ret = mfd_add_devices(lm3533->dev, 0, lm3533_bl_devs,
-			      pdata->num_backlights, NULL, 0, NULL);
+	ret = lm3533_update(lm3533, LM3533_REG_BOOST_PWM,
+			    lm3533->boost_ovp << LM3533_BOOST_OVP_SHIFT,
+			    LM3533_BOOST_OVP_MASK);
 	if (ret) {
-		dev_err(lm3533->dev, "failed to add backlight devices\n");
-		return ret;
-	}
-
-	lm3533->have_backlights = 1;
-
-	return 0;
-}
-
-static int lm3533_device_led_init(struct lm3533 *lm3533)
-{
-	struct lm3533_platform_data *pdata = dev_get_platdata(lm3533->dev);
-	int i;
-	int ret;
-
-	if (!pdata->leds || pdata->num_leds == 0)
-		return 0;
-
-	if (pdata->num_leds > ARRAY_SIZE(lm3533_led_devs))
-		pdata->num_leds = ARRAY_SIZE(lm3533_led_devs);
-
-	for (i = 0; i < pdata->num_leds; ++i) {
-		lm3533_led_devs[i].platform_data = &pdata->leds[i];
-		lm3533_led_devs[i].pdata_size = sizeof(pdata->leds[i]);
+		dev_err(dev, "failed to set boost ovp\n");
+		goto err_disable;
 	}
 
-	ret = mfd_add_devices(lm3533->dev, 0, lm3533_led_devs,
-			      pdata->num_leds, NULL, 0, NULL);
+	ret = devm_mfd_add_devices(dev, 0, lm3533_child_devices,
+				   ARRAY_SIZE(lm3533_child_devices),
+				   NULL, 0, NULL);
 	if (ret) {
-		dev_err(lm3533->dev, "failed to add LED devices\n");
-		return ret;
-	}
-
-	lm3533->have_leds = 1;
-
-	return 0;
-}
-
-static int lm3533_device_setup(struct lm3533 *lm3533,
-					struct lm3533_platform_data *pdata)
-{
-	int ret;
-
-	ret = lm3533_set_boost_freq(lm3533, pdata->boost_freq);
-	if (ret)
-		return ret;
-
-	return lm3533_set_boost_ovp(lm3533, pdata->boost_ovp);
-}
-
-static int lm3533_device_init(struct lm3533 *lm3533)
-{
-	struct lm3533_platform_data *pdata = dev_get_platdata(lm3533->dev);
-	int ret;
-
-	dev_dbg(lm3533->dev, "%s\n", __func__);
-
-	if (!pdata) {
-		dev_err(lm3533->dev, "no platform data\n");
-		return -EINVAL;
+		dev_err(dev, "failed to add MFD devices: %d\n", ret);
+		goto err_disable;
 	}
 
-	lm3533->hwen = devm_gpiod_get(lm3533->dev, NULL, GPIOD_OUT_LOW);
-	if (IS_ERR(lm3533->hwen))
-		return dev_err_probe(lm3533->dev, PTR_ERR(lm3533->hwen), "failed to request HWEN GPIO\n");
-	gpiod_set_consumer_name(lm3533->hwen, "lm3533-hwen");
-
-	lm3533_enable(lm3533);
-
-	ret = lm3533_device_setup(lm3533, pdata);
-	if (ret)
+	ret = sysfs_create_group(&dev->kobj, &lm3533_attribute_group);
+	if (ret) {
+		dev_err(dev, "failed to create sysfs attributes\n");
 		goto err_disable;
-
-	lm3533_device_als_init(lm3533);
-	lm3533_device_bl_init(lm3533);
-	lm3533_device_led_init(lm3533);
-
-	ret = sysfs_create_group(&lm3533->dev->kobj, &lm3533_attribute_group);
-	if (ret < 0) {
-		dev_err(lm3533->dev, "failed to create sysfs attributes\n");
-		goto err_unregister;
 	}
 
 	return 0;
 
-err_unregister:
-	mfd_remove_devices(lm3533->dev);
 err_disable:
 	lm3533_disable(lm3533);
 
@@ -517,8 +376,6 @@ static void lm3533_device_exit(struct lm3533 *lm3533)
 	dev_dbg(lm3533->dev, "%s\n", __func__);
 
 	sysfs_remove_group(&lm3533->dev->kobj, &lm3533_attribute_group);
-
-	mfd_remove_devices(lm3533->dev);
 	lm3533_disable(lm3533);
 }
 
@@ -589,7 +446,40 @@ static int lm3533_i2c_probe(struct i2c_client *i2c)
 		return PTR_ERR(lm3533->regmap);
 
 	lm3533->dev = &i2c->dev;
-	lm3533->irq = i2c->irq;
+
+	lm3533->hwen = devm_gpiod_get_optional(lm3533->dev, "enable",
+					       GPIOD_OUT_LOW);
+	if (IS_ERR(lm3533->hwen))
+		return dev_err_probe(lm3533->dev, PTR_ERR(lm3533->hwen),
+				     "failed to get HWEN GPIO\n");
+
+	device_property_read_u32(lm3533->dev, "ti,boost-ovp-microvolt",
+				 &lm3533->boost_ovp);
+
+	lm3533->boost_ovp = clamp(lm3533->boost_ovp, LM3533_BOOST_OVP_MIN,
+				  LM3533_BOOST_OVP_MAX);
+	lm3533->boost_ovp = lm3533->boost_ovp / (8 * MICRO) - 2;
+
+	device_property_read_u32(lm3533->dev, "ti,boost-freq-hz",
+				 &lm3533->boost_freq);
+
+	lm3533->boost_freq = clamp(lm3533->boost_freq, LM3533_BOOST_FREQ_MIN,
+				   LM3533_BOOST_FREQ_MAX);
+	lm3533->boost_freq = lm3533->boost_freq / (500 * KILO) - 1;
+
+	device_for_each_child_node_scoped(lm3533->dev, child) {
+		if (!fwnode_device_is_available(child))
+			continue;
+
+		if (fwnode_device_is_compatible(child, "ti,lm3533-als"))
+			lm3533->have_als = true;
+
+		if (fwnode_device_is_compatible(child, "ti,lm3533-backlight"))
+			lm3533->have_backlights = true;
+
+		if (fwnode_device_is_compatible(child, "ti,lm3533-leds"))
+			lm3533->have_leds = true;
+	}
 
 	return lm3533_device_init(lm3533);
 }
@@ -603,6 +493,12 @@ static void lm3533_i2c_remove(struct i2c_client *i2c)
 	lm3533_device_exit(lm3533);
 }
 
+static const struct of_device_id lm3533_match_table[] = {
+	{ .compatible = "ti,lm3533" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, lm3533_match_table);
+
 static const struct i2c_device_id lm3533_i2c_ids[] = {
 	{ "lm3533" },
 	{ }
@@ -612,6 +508,7 @@ MODULE_DEVICE_TABLE(i2c, lm3533_i2c_ids);
 static struct i2c_driver lm3533_i2c_driver = {
 	.driver = {
 		   .name = "lm3533",
+		   .of_match_table = lm3533_match_table,
 	},
 	.id_table	= lm3533_i2c_ids,
 	.probe		= lm3533_i2c_probe,
diff --git a/drivers/video/backlight/lm3533_bl.c b/drivers/video/backlight/lm3533_bl.c
index babfd3ceec86..42da652df58d 100644
--- a/drivers/video/backlight/lm3533_bl.c
+++ b/drivers/video/backlight/lm3533_bl.c
@@ -9,7 +9,9 @@
 
 #include <linux/module.h>
 #include <linux/init.h>
+#include <linux/mod_devicetable.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
 #include <linux/backlight.h>
 #include <linux/slab.h>
 
@@ -27,6 +29,9 @@ struct lm3533_bl {
 	struct lm3533_ctrlbank cb;
 	struct backlight_device *bd;
 	int id;
+
+	u32 max_current;
+	u32 pwm;
 };
 
 
@@ -246,25 +251,24 @@ static struct attribute_group lm3533_bl_attribute_group = {
 	.attrs		= lm3533_bl_attributes
 };
 
-static int lm3533_bl_setup(struct lm3533_bl *bl,
-					struct lm3533_bl_platform_data *pdata)
+static int lm3533_bl_setup(struct lm3533_bl *bl)
 {
 	int ret;
 
-	ret = lm3533_ctrlbank_set_max_current(&bl->cb, pdata->max_current);
+	ret = lm3533_ctrlbank_set_max_current(&bl->cb, bl->max_current);
 	if (ret)
 		return ret;
 
-	return lm3533_ctrlbank_set_pwm(&bl->cb, pdata->pwm);
+	return lm3533_ctrlbank_set_pwm(&bl->cb, bl->pwm);
 }
 
 static int lm3533_bl_probe(struct platform_device *pdev)
 {
 	struct lm3533 *lm3533;
-	struct lm3533_bl_platform_data *pdata;
 	struct lm3533_bl *bl;
 	struct backlight_device *bd;
 	struct backlight_properties props;
+	char *name = NULL;
 	int ret;
 
 	dev_dbg(&pdev->dev, "%s\n", __func__);
@@ -273,12 +277,6 @@ static int lm3533_bl_probe(struct platform_device *pdev)
 	if (!lm3533)
 		return -EINVAL;
 
-	pdata = dev_get_platdata(&pdev->dev);
-	if (!pdata) {
-		dev_err(&pdev->dev, "no platform data\n");
-		return -EINVAL;
-	}
-
 	if (pdev->id < 0 || pdev->id >= LM3533_HVCTRLBANK_COUNT) {
 		dev_err(&pdev->dev, "illegal backlight id %d\n", pdev->id);
 		return -EINVAL;
@@ -295,13 +293,20 @@ static int lm3533_bl_probe(struct platform_device *pdev)
 	bl->cb.id = lm3533_bl_get_ctrlbank_id(bl);
 	bl->cb.dev = NULL;			/* until registered */
 
+	name = devm_kasprintf(&pdev->dev, GFP_KERNEL, "%s-%d",
+			      pdev->name, pdev->id);
+	if (!name)
+		return -ENOMEM;
+
 	memset(&props, 0, sizeof(props));
 	props.type = BACKLIGHT_RAW;
 	props.max_brightness = LM3533_BL_MAX_BRIGHTNESS;
-	props.brightness = pdata->default_brightness;
-	bd = devm_backlight_device_register(&pdev->dev, pdata->name,
-					pdev->dev.parent, bl, &lm3533_bl_ops,
-					&props);
+	props.brightness = LM3533_BL_MAX_BRIGHTNESS;
+	device_property_read_u32(&pdev->dev, "default-brightness",
+				 &props.brightness);
+
+	bd = devm_backlight_device_register(&pdev->dev, name, &pdev->dev,
+					    bl, &lm3533_bl_ops, &props);
 	if (IS_ERR(bd)) {
 		dev_err(&pdev->dev, "failed to register backlight device\n");
 		return PTR_ERR(bd);
@@ -320,7 +325,15 @@ static int lm3533_bl_probe(struct platform_device *pdev)
 
 	backlight_update_status(bd);
 
-	ret = lm3533_bl_setup(bl, pdata);
+	device_property_read_u32(&pdev->dev, "led-max-microamp",
+				 &bl->max_current);
+	bl->max_current = clamp(bl->max_current, LM3533_LED_MAX_CURRENT_MIN,
+				LM3533_LED_MAX_CURRENT_MAX);
+
+	bl->pwm = 0;
+	device_property_read_u32(&pdev->dev, "ti,pwm-config-mask", &bl->pwm);
+
+	ret = lm3533_bl_setup(bl);
 	if (ret)
 		goto err_sysfs_remove;
 
@@ -381,10 +394,17 @@ static void lm3533_bl_shutdown(struct platform_device *pdev)
 	lm3533_ctrlbank_disable(&bl->cb);
 }
 
+static const struct of_device_id lm3533_bl_match_table[] = {
+	{ .compatible = "ti,lm3533-backlight" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, lm3533_bl_match_table);
+
 static struct platform_driver lm3533_bl_driver = {
 	.driver = {
 		.name	= "lm3533-backlight",
 		.pm	= &lm3533_bl_pm_ops,
+		.of_match_table = lm3533_bl_match_table,
 	},
 	.probe		= lm3533_bl_probe,
 	.remove		= lm3533_bl_remove,
diff --git a/include/linux/mfd/lm3533.h b/include/linux/mfd/lm3533.h
index 69059a7a2ce5..3aa962d4c747 100644
--- a/include/linux/mfd/lm3533.h
+++ b/include/linux/mfd/lm3533.h
@@ -15,6 +15,9 @@
 #define LM3533_ATTR_RW(_name) \
 	DEVICE_ATTR(_name, S_IRUGO | S_IWUSR , show_##_name, store_##_name)
 
+#define LM3533_LED_MAX_CURRENT_MIN	5000
+#define LM3533_LED_MAX_CURRENT_MAX	29800
+
 struct device;
 struct gpio_desc;
 struct regmap;
@@ -25,7 +28,9 @@ struct lm3533 {
 	struct regmap *regmap;
 
 	struct gpio_desc *hwen;
-	int irq;
+
+	u32 boost_ovp;
+	u32 boost_freq;
 
 	unsigned have_als:1;
 	unsigned have_backlights:1;
@@ -38,50 +43,6 @@ struct lm3533_ctrlbank {
 	int id;
 };
 
-struct lm3533_als_platform_data {
-	unsigned pwm_mode:1;		/* PWM input mode (default analog) */
-	u8 r_select;			/* 1 - 127 (ignored in PWM-mode) */
-};
-
-struct lm3533_bl_platform_data {
-	char *name;
-	u16 max_current;		/* 5000 - 29800 uA (800 uA step) */
-	u8 default_brightness;		/* 0 - 255 */
-	u8 pwm;				/* 0 - 0x3f */
-};
-
-struct lm3533_led_platform_data {
-	char *name;
-	const char *default_trigger;
-	u16 max_current;		/* 5000 - 29800 uA (800 uA step) */
-	u8 pwm;				/* 0 - 0x3f */
-};
-
-enum lm3533_boost_freq {
-	LM3533_BOOST_FREQ_500KHZ,
-	LM3533_BOOST_FREQ_1000KHZ,
-};
-
-enum lm3533_boost_ovp {
-	LM3533_BOOST_OVP_16V,
-	LM3533_BOOST_OVP_24V,
-	LM3533_BOOST_OVP_32V,
-	LM3533_BOOST_OVP_40V,
-};
-
-struct lm3533_platform_data {
-	enum lm3533_boost_ovp boost_ovp;
-	enum lm3533_boost_freq boost_freq;
-
-	struct lm3533_als_platform_data *als;
-
-	struct lm3533_bl_platform_data *backlights;
-	int num_backlights;
-
-	struct lm3533_led_platform_data *leds;
-	int num_leds;
-};
-
 extern int lm3533_ctrlbank_enable(struct lm3533_ctrlbank *cb);
 extern int lm3533_ctrlbank_disable(struct lm3533_ctrlbank *cb);
 
-- 
2.51.0


