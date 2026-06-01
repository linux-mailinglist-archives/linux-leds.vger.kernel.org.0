Return-Path: <linux-leds+bounces-8411-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QMfGBJilHWoqcwkAu9opvQ
	(envelope-from <linux-leds+bounces-8411-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 01 Jun 2026 17:30:32 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 069DE621BCD
	for <lists+linux-leds@lfdr.de>; Mon, 01 Jun 2026 17:30:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id AEA8E307847C
	for <lists+linux-leds@lfdr.de>; Mon,  1 Jun 2026 15:20:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE4D03E1681;
	Mon,  1 Jun 2026 15:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FAMvCQqV"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 745543DCDB9
	for <linux-leds@vger.kernel.org>; Mon,  1 Jun 2026 15:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780327160; cv=none; b=JTQqJPb+1tbx0nepNfDgH0smRlMMEWtDHADbf1BRY1fqJkFtEvxIyUPby3SjJCdbK4yX1qqXpFZKNOCIuN/Kn0qG+bkUlFsxQCkZHRcdTGEcVxO+8BW09yv0A1RwGKpaYYZs1Uz1XANjVEuesr7RF1ZJ427kM7DgTUF9ylhDMjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780327160; c=relaxed/simple;
	bh=VC7GTiK86p4YQGXZJSErQULAguxyMHVTeUjUs1seGF8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mYgRjqImaxpE4RQGVkDfRqauR6vNF0ebO0MMaQ6Vc5ZlLjVDTk9YEtyHpe4fEalPVI/lCSDK1kt96UfvQqm4sBMfez2ebPOYf8jw/3/aKD8YoFyqbn6EOGgwRpITyhnqXIXM9v3XvBAEtQQ5XE4RjwWgsJZg3qX8pCuAEV8lDY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FAMvCQqV; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-45ef82204c6so1222509f8f.3
        for <linux-leds@vger.kernel.org>; Mon, 01 Jun 2026 08:19:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780327146; x=1780931946; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1uoK+GZiJZRejvW6eSXJ+S3xFesyWPmt9UXpzysD2No=;
        b=FAMvCQqVOWZUw3qoeP1+NBx7u+NYlMPNip5Wl2f+4axzFVahyybOMsPU/C9HDBa85F
         bSLKkWdsG3xJDhoEIFq/uvIsKchjjSKb9KAUTJ8Q1/dbp3nPvLG0+b8qtRxQ5+CFobgR
         RSaofHsLuMc8YcqTaIvhoGaCcb0QlZYlEFkke2GvgCsi0a03NbMr/lIVlgkKJiRG0uwi
         xvpjNV9F/ez6zQgWFJ3vR8LEhJm25w9iQVwlF+kbjfNXfa6lBL2SVBGF3hi77E2vO0gv
         qJnxfGRi8RDjbd8N+NyFsb8tVYQN1CnWLeYvAhZwuuhZ73XuhK/WPWZLZWyFnv4VbVif
         g4ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780327146; x=1780931946;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1uoK+GZiJZRejvW6eSXJ+S3xFesyWPmt9UXpzysD2No=;
        b=KDXD+npYJUBEVT6b9E3Fie8ZaacPDOtfOAa8LB1k07sr254W5ReIu1/iWKHjrA7pD7
         KoUea7PJsTXsXLkkD4dS+VsyoErl5/ujpxUpUufJM+epBHgAoVlyaIC95lx6P3euDBZI
         KktPzzZQFsWzAELg7f8nWEmxbOWNqpdOBbUs/VuQJYbM12TG1hj7/sdMZ4ptEtxRbQmw
         FrO5eUVCSmwjaLDcQveIK8Dn6/l/DAZkhHU02+aJnAqI+HUmEev0TaflDRovSWty8prG
         QH7FIZIGgw87TBJNQMomMnDzEfi9/DTbPBo67qCSPUljNkeyUe7WFBc9Y/YNC0ZmpYI3
         VS5A==
X-Forwarded-Encrypted: i=1; AFNElJ8B3CFRfSdXjAdPeY6FfiAU9PmoroTHOguqd0S7BNLUol7fzPZCqTlWnPDfTN6cX+NK52iqkZO7a3cX@vger.kernel.org
X-Gm-Message-State: AOJu0YxvsV6w6vkIjnhH9jgcwMaYXZFSceC4eeOMP+993V5gnDlq25zg
	ZvJWuZK2GlIur1Bka6aSJeVB5iBQ5ybvm2YYwUj5scMAvflPn+H1KzhE
X-Gm-Gg: Acq92OGn4bGIHgTzhZzbxDknZa/B/pqK+6m62EIrnM49aYC1djkZutpKiy3CenzvxKd
	r/HkPKzv/uoU7Ls78/48pBHaeBFmpvCdhzRDcK7EKUTzSXzEHsqlcQpM/LmsIE6vpR2yWAaDBjS
	d1JJ9EgQMGtPzVgAVgPARGHqSu6OzBMyDa0wYP5V554E8QtCv9b3MvK6mhras33ux67nfjPL/58
	hDTVwFm/CjY4TvdBk4ah67p5XWYnMvKgeaVtCgpFB2we7NvysNDR+fZgEFFx+nv7g/MDzwtIrwa
	i5Z6rnpE8rklNIIwkPrrtrvg+X9YwkbhzzjSdH3t5RNwvt7m3szBUH8MAnlUsxSkuVEeGWYbqes
	D6NYJLjBBy9WajhVc6ZK3wyaV/7m3WxKPc1ogJY4VKbJcxr5f6+elwyB307biO0OUsyrqpbURlH
	rUge3eJvtt9rkNAeX/NxdVN1npxjOlQmiILw==
X-Received: by 2002:a5d:6e11:0:b0:45e:f28e:a00d with SMTP id ffacd0b85a97d-45ef6b3aa6cmr16833901f8f.16.1780327145415;
        Mon, 01 Jun 2026 08:19:05 -0700 (PDT)
Received: from xeon ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef354cd7csm25753103f8f.18.2026.06.01.08.19.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 08:19:04 -0700 (PDT)
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
Subject: [PATCH v3 05/11] mfd: lm3533: Convert to use OF bindings
Date: Mon,  1 Jun 2026 18:18:25 +0300
Message-ID: <20260601151831.76350-6-clamor95@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-8411-lists,linux-leds=lfdr.de];
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
X-Rspamd-Queue-Id: 069DE621BCD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Since there are no users of this driver via platform data, remove the
platform data support and switch to using Device Tree bindings.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/iio/light/lm3533-als.c      |  69 +++++----
 drivers/leds/leds-lm3533.c          |  51 ++++--
 drivers/mfd/lm3533-core.c           | 232 ++++++++++++----------------
 drivers/mfd/lm3533-ctrlbank.c       |   5 -
 drivers/video/backlight/lm3533_bl.c |  58 ++++---
 include/linux/mfd/lm3533.h          |  52 +------
 6 files changed, 222 insertions(+), 245 deletions(-)

diff --git a/drivers/iio/light/lm3533-als.c b/drivers/iio/light/lm3533-als.c
index 52136ca1abc9..55b35467a722 100644
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
+#define LM3533_ALS_RESISTOR_MIN			1575
+#define LM3533_ALS_RESISTOR_MAX			200000
 #define LM3533_ALS_CHANNEL_CURRENT_MAX		2
 #define LM3533_ALS_THRESH_MAX			3
 #define LM3533_ALS_ZONE_MAX			4
@@ -57,6 +60,9 @@ struct lm3533_als {
 
 	atomic_t zone;
 	struct mutex thresh_mutex;
+
+	bool pwm_mode;
+	u32 r_select;
 };
 
 
@@ -411,7 +417,7 @@ static ssize_t show_thresh_either_en(struct device *dev,
 	int enable;
 	int ret;
 
-	if (als->irq) {
+	if (als->irq > 0) {
 		ret = lm3533_als_get_int_mode(indio_dev, &enable);
 		if (ret)
 			return ret;
@@ -716,30 +722,34 @@ static const struct attribute_group lm3533_als_attribute_group = {
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
 	ret = regmap_update_bits(als->lm3533->regmap, LM3533_REG_ALS_CONF,
 				 LM3533_ALS_INPUT_MODE_MASK,
-				 pdata->pwm_mode ? LM3533_ALS_INPUT_MODE_MASK : 0);
+				 als->pwm_mode ? LM3533_ALS_INPUT_MODE_MASK : 0);
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to set input mode %d\n",
-				     pdata->pwm_mode);
-
+				     als->pwm_mode);
 
 	/* ALS input is always high impedance in PWM-mode. */
-	if (!pdata->pwm_mode) {
-		if (pdata->r_select < LM3533_ALS_RESISTOR_MIN ||
-		    pdata->r_select > LM3533_ALS_RESISTOR_MAX) {
-			dev_err(&als->pdev->dev, "invalid resistor value\n");
-			return -EINVAL;
-		}
+	if (!als->pwm_mode) {
+		ret = device_property_read_u32(dev, "ti,resistor-value-ohms",
+					       &als->r_select);
+		if (ret)
+			return dev_err_probe(dev, ret,
+					     "failed to ger resistor value\n");
+
+		als->r_select = clamp(als->r_select, LM3533_ALS_RESISTOR_MIN,
+				      LM3533_ALS_RESISTOR_MAX);
+		als->r_select = DIV_ROUND_UP(2 * MICRO, 10 * als->r_select);
 
 		ret = regmap_write(als->lm3533->regmap, LM3533_REG_ALS_RESISTOR_SELECT,
-				   pdata->r_select);
+				   als->r_select);
 		if (ret)
 			return dev_err_probe(dev, ret, "failed to set resistor\n");
 	}
@@ -806,7 +816,6 @@ static const struct iio_info lm3533_als_info = {
 
 static int lm3533_als_probe(struct platform_device *pdev)
 {
-	const struct lm3533_als_platform_data *pdata;
 	struct lm3533 *lm3533;
 	struct lm3533_als *als;
 	struct iio_dev *indio_dev;
@@ -816,12 +825,6 @@ static int lm3533_als_probe(struct platform_device *pdev)
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
@@ -830,25 +833,28 @@ static int lm3533_als_probe(struct platform_device *pdev)
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
+
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
 
@@ -867,7 +873,7 @@ static int lm3533_als_probe(struct platform_device *pdev)
 err_disable:
 	lm3533_als_disable(als);
 err_free_irq:
-	if (als->irq)
+	if (als->irq > 0)
 		free_irq(als->irq, indio_dev);
 
 	return ret;
@@ -881,13 +887,20 @@ static void lm3533_als_remove(struct platform_device *pdev)
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
index 51ff61aee75c..f2502daf450d 100644
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
 
@@ -49,6 +51,9 @@ struct lm3533_led {
 
 	struct mutex mutex;
 	unsigned long flags;
+
+	u32 max_current;
+	u32 pwm;
 };
 
 
@@ -634,22 +639,20 @@ static const struct attribute_group *lm3533_led_attribute_groups[] = {
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
 
@@ -659,12 +662,6 @@ static int lm3533_led_probe(struct platform_device *pdev)
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
@@ -675,8 +672,6 @@ static int lm3533_led_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	led->lm3533 = lm3533;
-	led->cdev.name = pdata->name;
-	led->cdev.default_trigger = pdata->default_trigger;
 	led->cdev.brightness_set_blocking = lm3533_led_set;
 	led->cdev.brightness_get = lm3533_led_get;
 	led->cdev.blink_set = lm3533_led_blink_set;
@@ -684,6 +679,15 @@ static int lm3533_led_probe(struct platform_device *pdev)
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
@@ -696,15 +700,23 @@ static int lm3533_led_probe(struct platform_device *pdev)
 
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
+	led->pwm = 0;
+	device_property_read_u32(&pdev->dev, "ti,pwm-config-mask", &led->pwm);
+
+	ret = lm3533_led_setup(led);
 	if (ret)
 		goto err_deregister;
 
@@ -741,9 +753,16 @@ static void lm3533_led_shutdown(struct platform_device *pdev)
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
index 45e7f7481aa0..d57c2cdf11c5 100644
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
@@ -296,129 +266,101 @@ static struct attribute_group lm3533_attribute_group = {
 	.attrs		= lm3533_attributes
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
+static int lm3533_device_init(struct lm3533 *lm3533)
 {
-	struct lm3533_platform_data *pdata = dev_get_platdata(lm3533->dev);
-	int i;
+	struct device *dev = lm3533->dev;
+	struct mfd_cell *lm3533_devices;
+	u32 count = 0, reg, nchilds;
 	int ret;
 
-	if (!pdata->backlights || pdata->num_backlights == 0)
-		return 0;
-
-	if (pdata->num_backlights > ARRAY_SIZE(lm3533_bl_devs))
-		pdata->num_backlights = ARRAY_SIZE(lm3533_bl_devs);
-
-	for (i = 0; i < pdata->num_backlights; ++i) {
-		lm3533_bl_devs[i].platform_data = &pdata->backlights[i];
-		lm3533_bl_devs[i].pdata_size = sizeof(pdata->backlights[i]);
+	nchilds = device_get_child_node_count(dev);
+	if (!nchilds || nchilds > LM3533_CELLS_MAX) {
+		dev_err(dev, "num of child nodes is not supported\n");
+		return -ENODEV;
 	}
 
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
+	lm3533_devices = devm_kcalloc(dev, nchilds, sizeof(*lm3533_devices),
+				      GFP_KERNEL);
+	if (!lm3533_devices)
+		return -ENOMEM;
 
-	if (pdata->num_leds > ARRAY_SIZE(lm3533_led_devs))
-		pdata->num_leds = ARRAY_SIZE(lm3533_led_devs);
+	device_for_each_child_node_scoped(lm3533->dev, child) {
+		if (!fwnode_device_is_available(child))
+			continue;
 
-	for (i = 0; i < pdata->num_leds; ++i) {
-		lm3533_led_devs[i].platform_data = &pdata->leds[i];
-		lm3533_led_devs[i].pdata_size = sizeof(pdata->leds[i]);
-	}
+		if (count >= nchilds)
+			break;
 
-	ret = mfd_add_devices(lm3533->dev, 0, lm3533_led_devs,
-			      pdata->num_leds, NULL, 0, NULL);
-	if (ret) {
-		dev_err(lm3533->dev, "failed to add LED devices\n");
-		return ret;
-	}
+		if (fwnode_device_is_compatible(child, "ti,lm3533-als")) {
+			lm3533_devices[count].name = "lm3533-als";
+			lm3533_devices[count].id = PLATFORM_DEVID_NONE;
+			lm3533_devices[count].of_compatible = "ti,lm3533-als";
 
-	lm3533->have_leds = 1;
+			lm3533->have_als = true;
+			count++;
+		}
 
-	return 0;
-}
+		if (fwnode_device_is_compatible(child, "ti,lm3533-backlight")) {
+			ret = fwnode_property_read_u32(child, "reg", &reg);
+			if (ret || reg >= LM3533_HVLED_ID_MAX) {
+				dev_err(dev, "invalid backlight node %s\n",
+					fwnode_get_name(child));
+				continue;
+			}
 
-static int lm3533_device_init(struct lm3533 *lm3533)
-{
-	struct lm3533_platform_data *pdata = dev_get_platdata(lm3533->dev);
-	int ret;
+			lm3533_devices[count].name = "lm3533-backlight";
+			lm3533_devices[count].id = reg;
+			lm3533_devices[count].of_compatible = "ti,lm3533-backlight";
 
-	dev_dbg(lm3533->dev, "%s\n", __func__);
+			lm3533->have_backlights = true;
+			count++;
+		}
 
-	if (!pdata) {
-		dev_err(lm3533->dev, "no platform data\n");
-		return -EINVAL;
+		if (fwnode_device_is_compatible(child, "ti,lm3533-leds")) {
+			ret = fwnode_property_read_u32(child, "reg", &reg);
+			if (ret || reg < LM3533_HVLED_ID_MAX ||
+			    reg > LM3533_LVLED_ID_MAX) {
+				dev_err(dev, "invalid LED node %s\n",
+					fwnode_get_name(child));
+				continue;
+			}
+
+			lm3533_devices[count].name = "lm3533-leds";
+			lm3533_devices[count].id = reg - LM3533_HVLED_ID_MAX;
+			lm3533_devices[count].of_compatible = "ti,lm3533-leds";
+
+			lm3533->have_leds = true;
+			count++;
+		}
 	}
 
-	lm3533->hwen = devm_gpiod_get(lm3533->dev, NULL, GPIOD_OUT_LOW);
-	if (IS_ERR(lm3533->hwen))
-		return dev_err_probe(lm3533->dev, PTR_ERR(lm3533->hwen), "failed to request HWEN GPIO\n");
-	gpiod_set_consumer_name(lm3533->hwen, "lm3533-hwen");
-
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
 
-	ret = sysfs_create_group(&lm3533->dev->kobj, &lm3533_attribute_group);
-	if (ret < 0) {
-		dev_err(lm3533->dev, "failed to create sysfs attributes\n");
+	ret = sysfs_create_group(&dev->kobj, &lm3533_attribute_group);
+	if (ret) {
+		dev_err(dev, "failed to create sysfs attributes\n");
 		goto err_unregister;
 	}
 
@@ -509,7 +451,26 @@ static int lm3533_i2c_probe(struct i2c_client *i2c)
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
@@ -523,6 +484,12 @@ static void lm3533_i2c_remove(struct i2c_client *i2c)
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
@@ -532,6 +499,7 @@ MODULE_DEVICE_TABLE(i2c, lm3533_i2c_ids);
 static struct i2c_driver lm3533_i2c_driver = {
 	.driver = {
 		   .name = "lm3533",
+		   .of_match_table = lm3533_match_table,
 	},
 	.id_table	= lm3533_i2c_ids,
 	.probe		= lm3533_i2c_probe,
diff --git a/drivers/mfd/lm3533-ctrlbank.c b/drivers/mfd/lm3533-ctrlbank.c
index 37bae279f41e..63543ecd815f 100644
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
index 5c8e69087860..c70b8a3bb301 100644
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
@@ -28,6 +30,9 @@ struct lm3533_bl {
 	struct lm3533_ctrlbank cb;
 	struct backlight_device *bd;
 	int id;
+
+	u32 max_current;
+	u32 pwm;
 };
 
 
@@ -247,25 +252,24 @@ static struct attribute_group lm3533_bl_attribute_group = {
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
@@ -274,12 +278,6 @@ static int lm3533_bl_probe(struct platform_device *pdev)
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
@@ -296,13 +294,20 @@ static int lm3533_bl_probe(struct platform_device *pdev)
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
@@ -313,6 +318,18 @@ static int lm3533_bl_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, bl);
 
+	device_property_read_u32(&pdev->dev, "led-max-microamp",
+				 &bl->max_current);
+	bl->max_current = clamp(bl->max_current, LM3533_MAX_CURRENT_MIN,
+				LM3533_MAX_CURRENT_MAX);
+
+	bl->pwm = 0;
+	device_property_read_u32(&pdev->dev, "ti,pwm-config-mask", &bl->pwm);
+
+	ret = lm3533_bl_setup(bl);
+	if (ret)
+		return ret;
+
 	ret = sysfs_create_group(&bd->dev.kobj, &lm3533_bl_attribute_group);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "failed to create sysfs attributes\n");
@@ -321,10 +338,6 @@ static int lm3533_bl_probe(struct platform_device *pdev)
 
 	backlight_update_status(bd);
 
-	ret = lm3533_bl_setup(bl, pdata);
-	if (ret)
-		goto err_sysfs_remove;
-
 	ret = lm3533_ctrlbank_enable(&bl->cb);
 	if (ret)
 		goto err_sysfs_remove;
@@ -382,10 +395,17 @@ static void lm3533_bl_shutdown(struct platform_device *pdev)
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
index db0a5e5c9e39..3fd8d4737ea5 100644
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
 extern int lm3533_ctrlbank_enable(struct lm3533_ctrlbank *cb);
 extern int lm3533_ctrlbank_disable(struct lm3533_ctrlbank *cb);
 
-- 
2.51.0


