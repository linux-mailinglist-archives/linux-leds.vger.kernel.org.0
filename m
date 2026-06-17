Return-Path: <linux-leds+bounces-8632-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id v3pDM+NUMmrzygUAu9opvQ
	(envelope-from <linux-leds+bounces-8632-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 17 Jun 2026 10:03:47 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 70A6C697647
	for <lists+linux-leds@lfdr.de>; Wed, 17 Jun 2026 10:03:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=fMfzpdbu;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8632-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-leds+bounces-8632-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 61F913028AEF
	for <lists+linux-leds@lfdr.de>; Wed, 17 Jun 2026 08:03:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B861D3CBE80;
	Wed, 17 Jun 2026 08:01:13 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F04C3D1CB2
	for <linux-leds@vger.kernel.org>; Wed, 17 Jun 2026 08:00:56 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781683273; cv=none; b=DnQYB/fYJCKWMhgn2MQ28hjZ2IntyRU5iJxgdCDDycEwLx57Sx0W06eDGrrjAJGKGnnK6K52z2wJlEXzGIiwX7jWlMroNWIrCRLmYQbTMg2A8nR8zFOOEhxXRG/pwB2fcOb/MiHRuwBRGq4f7zu5fHc7VaxhGe9WFq0h+LcCJKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781683273; c=relaxed/simple;
	bh=oSYwJkFhZpnkK8Dp6UPsyNmxh0K/a0yCYhXdKCMJurg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Iu4jVa7eJ2sL1ZD7Q0PTGp7KZVVdUJjup5Gpv2mon7qNDqrDReYTrxX9uGF96lfa/nALZnLYuiFiuENtXvt9FjKg/YADUgHJtIG+C1KQw2VYjuJQiBpjAiuIQ6COfA0cCfREw+qvoVvmDMhwz/xzw6oNJHy360AnOQIqvPZGsWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fMfzpdbu; arc=none smtp.client-ip=209.85.208.54
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-68f36e1663cso9465696a12.3
        for <linux-leds@vger.kernel.org>; Wed, 17 Jun 2026 01:00:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781683255; x=1782288055; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=63AMZsneedbXNZidjbhPhyt9D21WN1s2lsrVt9tmNB0=;
        b=fMfzpdbuYJUxuMw4Nt3q0eLbK9LtbM2TTRaWLRBAtinnNXzcfStY8ocxCBI1TRpMOJ
         cu6lSt3dYAXh+aiMvLXqpjjJZJn+zlSLGW/edQY6k3my/gexYVXPJmenn6dnJdsQ5PRz
         kn9JJQnNNTkymsrKXYCAW10xDrLj1ldoS5pnVjWqwspE6TFQ0mPvgq4ACvaKbkV9AlTe
         uH+MT+NEHvmTYLRuATr506KgPedCOf0dMaJu3XWQHVxCwpoOwg02iIYb5OKB30JrVlav
         Jim5YiCuYPcj3Or4k5V0af3MSgaOYgRXQL8y1JK+5sV4KSYWZmPudXGdvap+Dqq3WhNY
         UCtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781683255; x=1782288055;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=63AMZsneedbXNZidjbhPhyt9D21WN1s2lsrVt9tmNB0=;
        b=ZPkcb8heQmvWrrKCUgqz3/CLYInGqqFxBY9m4aRIRe+zrdxyof1P+/amaJDL9JDzqp
         5xa4SWs72BU1Ji4hpJwpfFKcWlVCYOu9Isz2sC6YF0FvHBgk1JwfJnFsp6tso1Pk4REF
         v9ClNWAVLFoeLATX2atRll5ArIJ265kQsqwfIPNphHmV4yWCC/ypjrtWqLvwm8eoWfd/
         8+BZhL/3D546WXokzN7bTfTzzacpTbUWvuEAXnnBe5KIuTPS2ZZETyLLFul5Q8DUDSGD
         I82svNYt38WRlpyZCMfR6uw7+77Skrsy2ziTWDbvsezQHBdg0jgLPcQJExKxAnqZsTH8
         PjGQ==
X-Forwarded-Encrypted: i=1; AFNElJ9fcVts6twCYxAe+6A3vvqYb0uZN9AppiBw66OL+bjm55EOpXphixBG5UrO26X6Qmp7vARX8Qbx8ugS@vger.kernel.org
X-Gm-Message-State: AOJu0Yyh1N6uy3Ud0dJ+ns0xR+JW8Vj7wRY3gICvUySEzyon5pPfY/GY
	6An1qB6+LftzEEoCNLsZ2bg3YHgbaO7pIUMVC56d3MODBUa68/Kefz0n
X-Gm-Gg: AfdE7cmPKLJJjY0c3oem7LdFbd5gnL9TYnvT44HVQUQ4dY9r0Gs9Fvhar05FYjTwV/Z
	h6RkCUZAaN2GluiJjtBo3+EK+kaT9SB7MLV6Z7ZrFrtPJ6SNtedBz5O9NY38jDGqPOnlZvnXFwO
	zyXo5KlUwYQBD57vOabRL9vXb8cjCawtTSaOqk8ACUjk9CgyaO/66qMFVm75RMTgpxEuqIJgOYN
	P3hB8TVtzHu4wK8TUyOHeGWb0c24LpsPAb3KKRqaTk56GIDETGjAI4hS9ZxAssNInmSZZrC0ZkD
	2J5kh+vywQ7h6zOwszGBywMwEa7mH9CPaYObhJNQ/WFOG6ox6gYtnv1P8By5vYZBeBed+iUocVK
	ifNjWClNj8eQzYn2NtiL0mB88Bgms91yhJStY1oHF6sG0rXaxLreN+iyw99IExF9AtBygVnjjlb
	Mn7A==
X-Received: by 2002:a17:907:843:b0:bee:f0d5:1c71 with SMTP id a640c23a62f3a-c05a502302bmr183789066b.42.1781683253696;
        Wed, 17 Jun 2026 01:00:53 -0700 (PDT)
Received: from xeon ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb058fa59sm755339766b.0.2026.06.17.01.00.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 01:00:53 -0700 (PDT)
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
Subject: [PATCH v5 08/14] mfd: lm3533: Convert to use OF bindings
Date: Wed, 17 Jun 2026 11:00:25 +0300
Message-ID: <20260617080031.99156-9-clamor95@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8632-lists,linux-leds=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 70A6C697647

Since there are no users of this driver via platform data, remove the
platform data support and switch to using Device Tree bindings.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Daniel Thompson (RISCstar) <danielt@kernel.org> #for backlight
---
 drivers/iio/light/lm3533-als.c      |  67 +++++---
 drivers/leds/leds-lm3533.c          |  50 ++++--
 drivers/mfd/lm3533-core.c           | 236 ++++++++++++----------------
 drivers/mfd/lm3533-ctrlbank.c       |   5 -
 drivers/video/backlight/lm3533_bl.c |  55 +++++--
 include/linux/mfd/lm3533.h          |  52 +-----
 6 files changed, 220 insertions(+), 245 deletions(-)

diff --git a/drivers/iio/light/lm3533-als.c b/drivers/iio/light/lm3533-als.c
index 69bac1b202f1..80f8fa700263 100644
--- a/drivers/iio/light/lm3533-als.c
+++ b/drivers/iio/light/lm3533-als.c
@@ -16,16 +16,19 @@
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/mfd/core.h>
+#include <linux/mod_devicetable.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
 #include <linux/regmap.h>
 #include <linux/slab.h>
 #include <linux/uaccess.h>
+#include <linux/units.h>
 
 #include <linux/mfd/lm3533.h>
 
 
-#define LM3533_ALS_RESISTOR_MIN			1
-#define LM3533_ALS_RESISTOR_MAX			127
+#define LM3533_ALS_RESISTOR_MIN_OHMS		1575
+#define LM3533_ALS_RESISTOR_MAX_OHMS		200000
 #define LM3533_ALS_CHANNEL_CURRENT_MAX		2
 #define LM3533_ALS_THRESH_MAX			3
 #define LM3533_ALS_ZONE_MAX			4
@@ -57,6 +60,9 @@ struct lm3533_als {
 
 	atomic_t zone;
 	struct mutex thresh_mutex;
+
+	u32 r_select;
+	bool pwm_mode;
 };
 
 
@@ -403,7 +409,7 @@ static ssize_t show_thresh_either_en(struct device *dev,
 	int enable;
 	int ret;
 
-	if (als->irq) {
+	if (als->irq > 0) {
 		ret = lm3533_als_get_int_mode(indio_dev, &enable);
 		if (ret)
 			return ret;
@@ -425,7 +431,7 @@ static ssize_t store_thresh_either_en(struct device *dev,
 	u8 zone;
 	int ret;
 
-	if (!als->irq)
+	if (als->irq <= 0)
 		return -EBUSY;
 
 	if (kstrtoul(buf, 0, &enable))
@@ -708,29 +714,38 @@ static const struct attribute_group lm3533_als_attribute_group = {
 	.attrs = lm3533_als_attributes
 };
 
-static int lm3533_als_setup(struct lm3533_als *als,
-			    const struct lm3533_als_platform_data *pdata)
+static int lm3533_als_setup(struct lm3533_als *als)
 {
 	struct device *dev = &als->pdev->dev;
 	int ret;
 
+	als->pwm_mode = device_property_read_bool(dev, "ti,pwm-mode");
+
 	ret = regmap_assign_bits(als->regmap, LM3533_REG_ALS_CONF,
-				 LM3533_ALS_INPUT_MODE_MASK, pdata->pwm_mode);
+				 LM3533_ALS_INPUT_MODE_MASK, als->pwm_mode);
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to set input mode %d\n",
-				     pdata->pwm_mode);
+				     als->pwm_mode);
 
 	/* Bail out when in PWM-mode */
-	if (pdata->pwm_mode)
+	if (als->pwm_mode)
 		return 0;
 
-	if (pdata->r_select < LM3533_ALS_RESISTOR_MIN ||
-	    pdata->r_select > LM3533_ALS_RESISTOR_MAX)
+	ret = device_property_read_u32(dev, "ti,resistor-ohms",
+				       &als->r_select);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "failed to ger resistor value\n");
+
+	if (als->r_select < LM3533_ALS_RESISTOR_MIN_OHMS ||
+	    als->r_select > LM3533_ALS_RESISTOR_MAX_OHMS)
 		return dev_err_probe(dev, -EINVAL,
 				     "invalid resistor value\n");
 
+	als->r_select = DIV_ROUND_UP(2 * MICRO, 10 * als->r_select);
+
 	ret = regmap_write(als->regmap, LM3533_REG_ALS_RESISTOR_SELECT,
-			   pdata->r_select);
+			   als->r_select);
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to set resistor\n");
 
@@ -793,7 +808,6 @@ static const struct iio_info lm3533_als_info = {
 
 static int lm3533_als_probe(struct platform_device *pdev)
 {
-	const struct lm3533_als_platform_data *pdata;
 	struct lm3533 *lm3533;
 	struct lm3533_als *als;
 	struct iio_dev *indio_dev;
@@ -803,12 +817,6 @@ static int lm3533_als_probe(struct platform_device *pdev)
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
@@ -817,25 +825,27 @@ static int lm3533_als_probe(struct platform_device *pdev)
 	indio_dev->channels = lm3533_als_channels;
 	indio_dev->num_channels = ARRAY_SIZE(lm3533_als_channels);
 	indio_dev->name = dev_name(&pdev->dev);
-	iio_device_set_parent(indio_dev, pdev->dev.parent);
 	indio_dev->modes = INDIO_DIRECT_MODE;
 
 	als = iio_priv(indio_dev);
 	als->regmap = lm3533->regmap;
 	als->pdev = pdev;
-	als->irq = lm3533->irq;
+	als->irq = platform_get_irq_optional(pdev, 0);
+	if (als->irq == -EPROBE_DEFER)
+		return -EPROBE_DEFER;
+
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
+	ret = lm3533_als_setup(als);
 	if (ret)
 		goto err_free_irq;
 
@@ -854,7 +864,7 @@ static int lm3533_als_probe(struct platform_device *pdev)
 err_disable:
 	lm3533_als_disable(als);
 err_free_irq:
-	if (als->irq)
+	if (als->irq > 0)
 		free_irq(als->irq, indio_dev);
 
 	return ret;
@@ -868,13 +878,20 @@ static void lm3533_als_remove(struct platform_device *pdev)
 	lm3533_als_set_int_mode(indio_dev, false);
 	iio_device_unregister(indio_dev);
 	lm3533_als_disable(als);
-	if (als->irq)
+	if (als->irq > 0)
 		free_irq(als->irq, indio_dev);
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
index 0cb0585eb960..ed810c23f30f 100644
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
 #include <linux/regmap.h>
 #include <linux/slab.h>
 
@@ -50,6 +52,9 @@ struct lm3533_led {
 	struct mutex mutex;
 	unsigned long flags;
 
+	u32 max_current;
+	u32 pwm;
+
 	bool have_als;
 };
 
@@ -616,22 +621,20 @@ static const struct attribute_group *lm3533_led_attribute_groups[] = {
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
 
@@ -641,12 +644,6 @@ static int lm3533_led_probe(struct platform_device *pdev)
 	if (!lm3533)
 		return -EINVAL;
 
-	pdata = dev_get_platdata(&pdev->dev);
-	if (!pdata) {
-		dev_err(&pdev->dev, "no platform data\n");
-		return -EINVAL;
-	}
-
 	if (pdev->id < 0 || pdev->id >= LM3533_LVCTRLBANK_COUNT) {
 		dev_err(&pdev->dev, "illegal LED id %d\n", pdev->id);
 		return -EINVAL;
@@ -659,8 +656,6 @@ static int lm3533_led_probe(struct platform_device *pdev)
 	led->regmap = lm3533->regmap;
 	led->have_als = lm3533->have_als;
 
-	led->cdev.name = pdata->name;
-	led->cdev.default_trigger = pdata->default_trigger;
 	led->cdev.brightness_set_blocking = lm3533_led_set;
 	led->cdev.brightness_get = lm3533_led_get;
 	led->cdev.blink_set = lm3533_led_blink_set;
@@ -668,6 +663,15 @@ static int lm3533_led_probe(struct platform_device *pdev)
 	led->cdev.groups = lm3533_led_attribute_groups;
 	led->id = pdev->id;
 
+	led->cdev.name = devm_kasprintf(&pdev->dev, GFP_KERNEL, "%s-%d",
+					pdev->name, led->id);
+	if (!led->cdev.name)
+		return -ENOMEM;
+
+	led->cdev.default_trigger = "none";
+	device_property_read_string(&pdev->dev, "linux,default-trigger",
+				    &led->cdev.default_trigger);
+
 	mutex_init(&led->mutex);
 
 	/* The class framework makes a callback to get brightness during
@@ -680,15 +684,22 @@ static int lm3533_led_probe(struct platform_device *pdev)
 
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
+	led->max_current = clamp(led->max_current, LM3533_MAX_CURRENT_MIN,
+				 LM3533_MAX_CURRENT_MAX);
+
+	device_property_read_u32(&pdev->dev, "ti,pwm-config-mask", &led->pwm);
+
+	ret = lm3533_led_setup(led);
 	if (ret)
 		goto err_deregister;
 
@@ -725,9 +736,16 @@ static void lm3533_led_shutdown(struct platform_device *pdev)
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
index b03a3ae96c10..a5aa7da9668b 100644
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
+#define LM3533_BOOST_OVP_MIN		(16 * MICRO)
+#define LM3533_BOOST_OVP_MAX		(40 * MICRO)
 
 #define LM3533_BOOST_FREQ_MASK		0x01
 #define LM3533_BOOST_FREQ_SHIFT		0
+#define LM3533_BOOST_FREQ_MIN		(500 * HZ_PER_KHZ)
+#define LM3533_BOOST_FREQ_MAX		(1000 * HZ_PER_KHZ)
 
 #define LM3533_BL_ID_MASK		1
 #define LM3533_LED_ID_MASK		3
@@ -35,6 +42,7 @@
 
 #define LM3533_HVLED_ID_MAX		2
 #define LM3533_LVLED_ID_MAX		5
+#define LM3533_CELLS_MAX		7
 
 #define LM3533_REG_OUTPUT_CONF1		0x10
 #define LM3533_REG_OUTPUT_CONF2		0x11
@@ -42,44 +50,6 @@
 
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
-};
-
 /*
  * HVLED output config -- output hvled controlled by backlight bl
  */
@@ -301,125 +271,91 @@ static const struct attribute_group *lm3533_attribute_groups[] = {
 	NULL,
 };
 
-static int lm3533_device_als_init(struct lm3533 *lm3533)
-{
-	struct lm3533_platform_data *pdata = dev_get_platdata(lm3533->dev);
-	int ret;
-
-	if (!pdata->als)
-		return 0;
-
-	lm3533_als_devs[0].platform_data = pdata->als;
-	lm3533_als_devs[0].pdata_size = sizeof(*pdata->als);
-
-	ret = mfd_add_devices(lm3533->dev, 0, lm3533_als_devs, 1, NULL,
-			      0, NULL);
-	if (ret) {
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
-	}
-
-	ret = mfd_add_devices(lm3533->dev, 0, lm3533_bl_devs,
-			      pdata->num_backlights, NULL, 0, NULL);
-	if (ret) {
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
-	}
-
-	ret = mfd_add_devices(lm3533->dev, 0, lm3533_led_devs,
-			      pdata->num_leds, NULL, 0, NULL);
-	if (ret) {
-		dev_err(lm3533->dev, "failed to add LED devices\n");
-		return ret;
-	}
-
-	lm3533->have_leds = 1;
-
-	return 0;
-}
-
 static int lm3533_device_init(struct lm3533 *lm3533)
 {
-	struct lm3533_platform_data *pdata = dev_get_platdata(lm3533->dev);
+	struct device *dev = lm3533->dev;
+	struct mfd_cell *lm3533_devices;
+	u32 count = 0, reg, nchilds;
 	int ret;
 
-	dev_dbg(lm3533->dev, "%s\n", __func__);
+	nchilds = device_get_child_node_count(dev);
+	if (!nchilds || nchilds > LM3533_CELLS_MAX)
+		return dev_err_probe(dev, -ENODEV,
+				     "num of child nodes is not supported\n");
 
-	if (!pdata) {
-		dev_err(lm3533->dev, "no platform data\n");
-		return -EINVAL;
-	}
+	lm3533_devices = devm_kcalloc(dev, nchilds, sizeof(*lm3533_devices),
+				      GFP_KERNEL);
+	if (!lm3533_devices)
+		return -ENOMEM;
 
-	lm3533->hwen = devm_gpiod_get(lm3533->dev, NULL, GPIOD_OUT_LOW);
-	if (IS_ERR(lm3533->hwen))
-		return dev_err_probe(lm3533->dev, PTR_ERR(lm3533->hwen), "failed to request HWEN GPIO\n");
-	gpiod_set_consumer_name(lm3533->hwen, "lm3533-hwen");
+	device_for_each_child_node_scoped(dev, child) {
+		if (count >= nchilds)
+			break;
+
+		if (fwnode_device_is_compatible(child, "ti,lm3533-als")) {
+			lm3533_devices[count].name = "lm3533-als";
+			lm3533_devices[count].of_compatible = "ti,lm3533-als";
+			lm3533_devices[count].id = PLATFORM_DEVID_NONE;
+
+			lm3533->have_als = true;
+			count++;
+		} else if (fwnode_device_is_compatible(child, "ti,lm3533-backlight")) {
+			ret = fwnode_property_read_u32(child, "reg", &reg);
+			if (ret || reg >= LM3533_HVLED_ID_MAX) {
+				dev_err(dev, "invalid backlight node %pfw\n", child);
+				continue;
+			}
+
+			lm3533_devices[count].name = "lm3533-backlight";
+			lm3533_devices[count].of_compatible = "ti,lm3533-backlight";
+			lm3533_devices[count].id = reg;
+			lm3533_devices[count].of_reg = reg;
+			lm3533_devices[count].use_of_reg = true;
+
+			lm3533->have_backlights = true;
+			count++;
+		} else if (fwnode_device_is_compatible(child, "ti,lm3533-leds")) {
+			ret = fwnode_property_read_u32(child, "reg", &reg);
+			if (ret || reg < LM3533_HVLED_ID_MAX ||
+			    reg > LM3533_LVLED_ID_MAX) {
+				dev_err(dev, "invalid LED node %pfw\n", child);
+				continue;
+			}
+
+			lm3533_devices[count].name = "lm3533-leds";
+			lm3533_devices[count].of_compatible = "ti,lm3533-leds";
+			lm3533_devices[count].id = reg - LM3533_HVLED_ID_MAX;
+			lm3533_devices[count].of_reg = reg;
+			lm3533_devices[count].use_of_reg = true;
+
+			lm3533->have_leds = true;
+			count++;
+		}
+	}
 
 	lm3533_enable(lm3533);
 
 	ret = regmap_update_bits(lm3533->regmap, LM3533_REG_BOOST_PWM,
 				 LM3533_BOOST_FREQ_MASK,
-				 pdata->boost_freq << LM3533_BOOST_FREQ_SHIFT);
+				 lm3533->boost_freq << LM3533_BOOST_FREQ_SHIFT);
 	if (ret) {
-		dev_err(lm3533->dev, "failed to set boost frequency\n");
+		dev_err(dev, "failed to set boost frequency\n");
 		goto err_disable;
 	}
 
 	ret = regmap_update_bits(lm3533->regmap, LM3533_REG_BOOST_PWM,
 				 LM3533_BOOST_OVP_MASK,
-				 pdata->boost_ovp << LM3533_BOOST_OVP_SHIFT);
+				 lm3533->boost_ovp << LM3533_BOOST_OVP_SHIFT);
 	if (ret) {
-		dev_err(lm3533->dev, "failed to set boost ovp\n");
+		dev_err(dev, "failed to set boost ovp\n");
 		goto err_disable;
 	}
 
-	lm3533_device_als_init(lm3533);
-	lm3533_device_bl_init(lm3533);
-	lm3533_device_led_init(lm3533);
+	ret = mfd_add_devices(dev, 0, lm3533_devices, count, NULL, 0, NULL);
+	if (ret) {
+		dev_err(dev, "failed to add MFD devices: %d\n", ret);
+		goto err_disable;
+	}
 
 	return 0;
 
@@ -504,7 +440,26 @@ static int lm3533_i2c_probe(struct i2c_client *i2c)
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
 
 	return lm3533_device_init(lm3533);
 }
@@ -518,6 +473,12 @@ static void lm3533_i2c_remove(struct i2c_client *i2c)
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
@@ -528,6 +489,7 @@ static struct i2c_driver lm3533_i2c_driver = {
 	.driver = {
 		   .name = "lm3533",
 		   .dev_groups = lm3533_attribute_groups,
+		   .of_match_table = lm3533_match_table,
 	},
 	.id_table	= lm3533_i2c_ids,
 	.probe		= lm3533_i2c_probe,
diff --git a/drivers/mfd/lm3533-ctrlbank.c b/drivers/mfd/lm3533-ctrlbank.c
index 91e13cfa3cf0..3aab8ece4e8c 100644
--- a/drivers/mfd/lm3533-ctrlbank.c
+++ b/drivers/mfd/lm3533-ctrlbank.c
@@ -13,11 +13,6 @@
 
 #include <linux/mfd/lm3533.h>
 
-
-#define LM3533_MAX_CURRENT_MIN		5000
-#define LM3533_MAX_CURRENT_MAX		29800
-#define LM3533_MAX_CURRENT_STEP		800
-
 #define LM3533_PWM_MAX			0x3f
 
 #define LM3533_REG_PWM_BASE		0x14
diff --git a/drivers/video/backlight/lm3533_bl.c b/drivers/video/backlight/lm3533_bl.c
index 9ef171d3aaea..2c24647fc17a 100644
--- a/drivers/video/backlight/lm3533_bl.c
+++ b/drivers/video/backlight/lm3533_bl.c
@@ -9,7 +9,9 @@
 
 #include <linux/module.h>
 #include <linux/init.h>
+#include <linux/mod_devicetable.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
 #include <linux/backlight.h>
 #include <linux/regmap.h>
 #include <linux/slab.h>
@@ -29,6 +31,9 @@ struct lm3533_bl {
 	struct backlight_device *bd;
 	int id;
 
+	u32 max_current;
+	u32 pwm;
+
 	bool have_als;
 };
 
@@ -242,25 +247,25 @@ static const struct attribute_group *lm3533_bl_attribute_groups[] = {
 	NULL,
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
+	u32 default_brightness = LM3533_BL_MAX_BRIGHTNESS;
 	int ret;
 
 	dev_dbg(&pdev->dev, "%s\n", __func__);
@@ -269,12 +274,6 @@ static int lm3533_bl_probe(struct platform_device *pdev)
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
@@ -292,13 +291,21 @@ static int lm3533_bl_probe(struct platform_device *pdev)
 	bl->cb.id = lm3533_bl_get_ctrlbank_id(bl);
 	bl->cb.dev = NULL;			/* until registered */
 
+	name = devm_kasprintf(&pdev->dev, GFP_KERNEL, "%s-%d",
+			      pdev->name, pdev->id);
+	if (!name)
+		return -ENOMEM;
+
+	device_property_read_u32(&pdev->dev, "default-brightness",
+				 &default_brightness);
+
 	memset(&props, 0, sizeof(props));
 	props.type = BACKLIGHT_RAW;
 	props.max_brightness = LM3533_BL_MAX_BRIGHTNESS;
-	props.brightness = pdata->default_brightness;
-	bd = devm_backlight_device_register(&pdev->dev, pdata->name,
-					pdev->dev.parent, bl, &lm3533_bl_ops,
-					&props);
+	props.brightness = default_brightness;
+
+	bd = devm_backlight_device_register(&pdev->dev, name, &pdev->dev,
+					    bl, &lm3533_bl_ops, &props);
 	if (IS_ERR(bd)) {
 		dev_err(&pdev->dev, "failed to register backlight device\n");
 		return PTR_ERR(bd);
@@ -309,12 +316,19 @@ static int lm3533_bl_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, bl);
 
-	backlight_update_status(bd);
+	device_property_read_u32(&pdev->dev, "led-max-microamp",
+				 &bl->max_current);
+	bl->max_current = clamp(bl->max_current, LM3533_MAX_CURRENT_MIN,
+				LM3533_MAX_CURRENT_MAX);
 
-	ret = lm3533_bl_setup(bl, pdata);
+	device_property_read_u32(&pdev->dev, "ti,pwm-config-mask", &bl->pwm);
+
+	ret = lm3533_bl_setup(bl);
 	if (ret)
 		return ret;
 
+	backlight_update_status(bd);
+
 	ret = lm3533_ctrlbank_enable(&bl->cb);
 	if (ret)
 		return ret;
@@ -366,11 +380,18 @@ static void lm3533_bl_shutdown(struct platform_device *pdev)
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
 		.dev_groups = lm3533_bl_attribute_groups,
+		.of_match_table = lm3533_bl_match_table,
 	},
 	.probe		= lm3533_bl_probe,
 	.remove		= lm3533_bl_remove,
diff --git a/include/linux/mfd/lm3533.h b/include/linux/mfd/lm3533.h
index 74cfb52c3bd1..5710e88da45d 100644
--- a/include/linux/mfd/lm3533.h
+++ b/include/linux/mfd/lm3533.h
@@ -15,6 +15,10 @@
 #define LM3533_ATTR_RW(_name) \
 	DEVICE_ATTR(_name, S_IRUGO | S_IWUSR , show_##_name, store_##_name)
 
+#define LM3533_MAX_CURRENT_MIN		5000
+#define LM3533_MAX_CURRENT_MAX		29800
+#define LM3533_MAX_CURRENT_STEP		800
+
 struct device;
 struct gpio_desc;
 struct regmap;
@@ -25,7 +29,9 @@ struct lm3533 {
 	struct regmap *regmap;
 
 	struct gpio_desc *hwen;
-	int irq;
+
+	u32 boost_ovp;
+	u32 boost_freq;
 
 	unsigned have_als:1;
 	unsigned have_backlights:1;
@@ -38,50 +44,6 @@ struct lm3533_ctrlbank {
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
 int lm3533_ctrlbank_enable(struct lm3533_ctrlbank *cb);
 int lm3533_ctrlbank_disable(struct lm3533_ctrlbank *cb);
 
-- 
2.53.0


