Return-Path: <linux-leds+bounces-8518-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nRE9HAGqI2p5wgEAu9opvQ
	(envelope-from <linux-leds+bounces-8518-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sat, 06 Jun 2026 07:02:57 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B27B64C774
	for <lists+linux-leds@lfdr.de>; Sat, 06 Jun 2026 07:02:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=jhDj+C3T;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8518-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-leds+bounces-8518-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 058F130A6F22
	for <lists+linux-leds@lfdr.de>; Sat,  6 Jun 2026 04:58:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85B0A2FE566;
	Sat,  6 Jun 2026 04:58:33 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 046F530D413
	for <linux-leds@vger.kernel.org>; Sat,  6 Jun 2026 04:58:29 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780721913; cv=none; b=XjHidK6oMng66OdZKM/u2Y/tg6vvw49Z12Q+O94B6L9xQWFCRaUo0oGE+kkiwKhcbcFGAeV24ubmGaJ6TmvtJ55ElQeXVEk+8YcXVkiYKGfXd7LR7iBjw8Wvv+2OIMSnC87QpY184+uQzVEl4pQco9Brg5bhy589XlzPI1i1ZnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780721913; c=relaxed/simple;
	bh=v3Q4MRjIdJO+xnsKPLjaINesqpeuELzHNsI9WbWurqY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Oz63o/CFu2m7GNXrD1z/XwISyu++aSPXt1pkFpkEHKqMNFHtB2HtTpTB6hBgxV6UyVcJDAzq2C+KBnihx59GcxkI4OvtcoeOvpaOy9bIJGYfzuGv5FTN+/WnAiaSnfg3c6p3VvcFSBNBR3Ejd7HC1NwK7LYMFtIizqfMo/tB7Vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jhDj+C3T; arc=none smtp.client-ip=209.85.208.45
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-68c3421b009so5330073a12.1
        for <linux-leds@vger.kernel.org>; Fri, 05 Jun 2026 21:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780721908; x=1781326708; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TCQU5hTKwnnVQ8s/EYP1FmGAYa8cB7bTz1dncUM+SfM=;
        b=jhDj+C3TYJrir472vOJTNQuLO6UcOMMsETPbTnUTpXZz0jMlL01sWokYlIvSbb6VlK
         4OAUAh286wlzG89dFVmNQAewJU6rPZ3RkhJ3kscGtoyiZpBkkpTaHHrzFxyWa103RLTd
         YeBUY7CPp7gxPADK9IBs6EBuZ4FIn4GMVJbv9mw59aVVcBRtk+mIIflsfl7MFvbzGI92
         DPsr5P8B2mpCYIXUuwHZMBDf3og2mQvZKDMgJV5OF2+5M89B6uU1AC+Ywuvn/RzHtd07
         TZb/fSCWeXwNToSjEBiTKmik7PWed4KFq7Zj12Oag1dUr3QbwgSQZS23wvejNkNXgVEy
         Y/0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780721908; x=1781326708;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TCQU5hTKwnnVQ8s/EYP1FmGAYa8cB7bTz1dncUM+SfM=;
        b=jpbO3c7qbz6MVYwTed3mIsIrRODCSmBsF0iov+VNlhNS5yL0Mxj1UBDhSKmpse/HAV
         aHbEsAjAIicEqnVKTP0WGsVhCWW5WOqF9X+QempTcVmB4KNwwF+GYdaDpjdJg1ZW4BJ4
         tevjp4kssudRfo5AMjHMnhZ7ZNSaIY/Z3YCxqLzssXTqsnAwa4CVNNitHIH/kqjT0oaI
         R6T171aMFrTXxk4tnVd2mcs5bXyA0GJz0Bko4kKbTO/ZV+mJvvz4vdLNhB3Cuei2LjlE
         1RRAtmAn59pzNS3NqCIgk+FQr3C7InQdKWrnkBdzxDbzETeQLRbEd4TlMO1uoA05GaM5
         18jQ==
X-Forwarded-Encrypted: i=1; AFNElJ/paFQPQUS6JFiYfFdOHUFJ3+5G4gQhiGq3uOtx/M1XQQQO2q88xuV8JgvLZiUobTWiWiFCMbTVa5ne@vger.kernel.org
X-Gm-Message-State: AOJu0YyAZm0pguVc1zCs7xsdPjA9YYnMzU8oUGdb+2zfVl47Q+zJ1vfF
	eSSnGmXjHVecaEX0oqEE6bfxT/vwoAHMiasjbqQ0+OvASSzjIwsaQrbJ
X-Gm-Gg: Acq92OFakekJWPKmrqdMAPwY0bjH0PKDh0wQPMU+KAcoi5Agscr5DL0S8eu1/ZCOpoU
	FAWLvFRMsCDS+klQpQQGXhgevHgefeKUbc4g73LoXoaXx9P6t3KT2KDZkeRYCfKiY6Jj/auRaUT
	yS1sPSWvLXURNk4A38fP4KqDF+z3WkqIgT7l930epczyq6tQAWuQ3xdlsFIeAsVFQTRhL7anbdL
	BOeBa9Qm8LaUfPXdwXDablSmA4EK+HO6jX595QcOBK0ZSykaj06yl2lGDMuMby+eN2qnc6JydCS
	ycvpU3jbtGcicVDI+gl2ac8K2n1SbNZClAZ2AELU932VFzXzNvprk86ycsvWt0CRHoAKgRq4Fwh
	uFoG5atZ1V3JGz3m/sTG9NjrqisqhvU3IbtxNrVJza/aSUfAcGBnvg/nLxb6YWILCxljL7tgm4i
	acKDRA1beJBInbYAjkJzzpwiMgHuhcWxdbkQ==
X-Received: by 2002:a17:906:d550:b0:bec:1632:eceb with SMTP id a640c23a62f3a-bf3a840d8bcmr261923166b.19.1780721908264;
        Fri, 05 Jun 2026 21:58:28 -0700 (PDT)
Received: from xeon ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf054e086fesm570597166b.32.2026.06.05.21.58.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 21:58:26 -0700 (PDT)
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
Subject: [PATCH v4 08/14] mfd: lm3533: Convert to use OF bindings
Date: Sat,  6 Jun 2026 07:57:32 +0300
Message-ID: <20260606045738.21050-9-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260606045738.21050-1-clamor95@gmail.com>
References: <20260606045738.21050-1-clamor95@gmail.com>
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
	TAGGED_FROM(0.00)[bounces-8518-lists,linux-leds=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1B27B64C774

Since there are no users of this driver via platform data, remove the
platform data support and switch to using Device Tree bindings.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Daniel Thompson (RISCstar) <danielt@kernel.org> #for backlight
---
 drivers/iio/light/lm3533-als.c      |  67 +++++---
 drivers/leds/leds-lm3533.c          |  51 ++++--
 drivers/mfd/lm3533-core.c           | 236 ++++++++++++----------------
 drivers/mfd/lm3533-ctrlbank.c       |   5 -
 drivers/video/backlight/lm3533_bl.c |  59 ++++---
 include/linux/mfd/lm3533.h          |  52 +-----
 6 files changed, 225 insertions(+), 245 deletions(-)

diff --git a/drivers/iio/light/lm3533-als.c b/drivers/iio/light/lm3533-als.c
index c4035d1c8d57..d51cf96970b9 100644
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
@@ -708,27 +714,36 @@ static const struct attribute_group lm3533_als_attribute_group = {
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
 
 	/* ALS input is always high impedance in PWM-mode. */
-	if (!pdata->pwm_mode) {
-		if (pdata->r_select < LM3533_ALS_RESISTOR_MIN ||
-		    pdata->r_select > LM3533_ALS_RESISTOR_MAX)
+	if (!als->pwm_mode) {
+		ret = device_property_read_u32(dev, "ti,resistor-ohms",
+					       &als->r_select);
+		if (ret)
+			return dev_err_probe(dev, ret,
+					     "failed to ger resistor value\n");
+
+		if (als->r_select < LM3533_ALS_RESISTOR_MIN_OHMS ||
+		    als->r_select > LM3533_ALS_RESISTOR_MAX_OHMS)
 			return dev_err_probe(dev, -EINVAL,
 					     "invalid resistor value\n");
 
+		als->r_select = DIV_ROUND_UP(2 * MICRO, 10 * als->r_select);
+
 		ret = regmap_write(als->regmap, LM3533_REG_ALS_RESISTOR_SELECT,
-				   pdata->r_select);
+				   als->r_select);
 		if (ret)
 			return dev_err_probe(dev, ret, "failed to set resistor\n");
 	}
@@ -792,7 +807,6 @@ static const struct iio_info lm3533_als_info = {
 
 static int lm3533_als_probe(struct platform_device *pdev)
 {
-	const struct lm3533_als_platform_data *pdata;
 	struct lm3533 *lm3533;
 	struct lm3533_als *als;
 	struct iio_dev *indio_dev;
@@ -802,12 +816,6 @@ static int lm3533_als_probe(struct platform_device *pdev)
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
@@ -816,25 +824,27 @@ static int lm3533_als_probe(struct platform_device *pdev)
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
 
@@ -853,7 +863,7 @@ static int lm3533_als_probe(struct platform_device *pdev)
 err_disable:
 	lm3533_als_disable(als);
 err_free_irq:
-	if (als->irq)
+	if (als->irq > 0)
 		free_irq(als->irq, indio_dev);
 
 	return ret;
@@ -867,13 +877,20 @@ static void lm3533_als_remove(struct platform_device *pdev)
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
index f57d97201816..a661aedcdc60 100644
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
@@ -680,15 +684,23 @@ static int lm3533_led_probe(struct platform_device *pdev)
 
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
 
@@ -725,9 +737,16 @@ static void lm3533_led_shutdown(struct platform_device *pdev)
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
index e3efc9f6f348..5af1d5476d3e 100644
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
@@ -296,129 +266,99 @@ static struct attribute_group lm3533_attribute_group = {
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
+static int lm3533_device_init(struct lm3533 *lm3533)
 {
-	struct lm3533_platform_data *pdata = dev_get_platdata(lm3533->dev);
-	int i;
+	struct device *dev = lm3533->dev;
+	struct mfd_cell *lm3533_devices;
+	u32 count = 0, reg, nchilds;
 	int ret;
 
-	if (!pdata->leds || pdata->num_leds == 0)
-		return 0;
-
-	if (pdata->num_leds > ARRAY_SIZE(lm3533_led_devs))
-		pdata->num_leds = ARRAY_SIZE(lm3533_led_devs);
+	nchilds = device_get_child_node_count(dev);
+	if (!nchilds || nchilds > LM3533_CELLS_MAX)
+		return dev_err_probe(dev, -ENODEV,
+				     "num of child nodes is not supported\n");
 
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
+	lm3533_devices = devm_kcalloc(dev, nchilds, sizeof(*lm3533_devices),
+				      GFP_KERNEL);
+	if (!lm3533_devices)
+		return -ENOMEM;
 
-	lm3533->have_leds = 1;
+	device_for_each_child_node_scoped(dev, child) {
+		if (count >= nchilds)
+			break;
 
-	return 0;
-}
+		if (fwnode_device_is_compatible(child, "ti,lm3533-als")) {
+			lm3533_devices[count].name = "lm3533-als";
+			lm3533_devices[count].of_compatible = "ti,lm3533-als";
+			lm3533_devices[count].id = PLATFORM_DEVID_NONE;
 
-static int lm3533_device_init(struct lm3533 *lm3533)
-{
-	struct lm3533_platform_data *pdata = dev_get_platdata(lm3533->dev);
-	int ret;
+			lm3533->have_als = true;
+			count++;
+		}
 
-	dev_dbg(lm3533->dev, "%s\n", __func__);
+		if (fwnode_device_is_compatible(child, "ti,lm3533-backlight")) {
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
+		}
 
-	if (!pdata) {
-		dev_err(lm3533->dev, "no platform data\n");
-		return -EINVAL;
+		if (fwnode_device_is_compatible(child, "ti,lm3533-leds")) {
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
 
-	ret = device_add_group(lm3533->dev, &lm3533_attribute_group);
+	ret = device_add_group(dev, &lm3533_attribute_group);
 	if (ret < 0) {
-		dev_err(lm3533->dev, "failed to create sysfs attributes\n");
+		dev_err(dev, "failed to create sysfs attributes\n");
 		goto err_unregister;
 	}
 
@@ -509,7 +449,26 @@ static int lm3533_i2c_probe(struct i2c_client *i2c)
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
@@ -523,6 +482,12 @@ static void lm3533_i2c_remove(struct i2c_client *i2c)
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
@@ -532,6 +497,7 @@ MODULE_DEVICE_TABLE(i2c, lm3533_i2c_ids);
 static struct i2c_driver lm3533_i2c_driver = {
 	.driver = {
 		   .name = "lm3533",
+		   .of_match_table = lm3533_match_table,
 	},
 	.id_table	= lm3533_i2c_ids,
 	.probe		= lm3533_i2c_probe,
diff --git a/drivers/mfd/lm3533-ctrlbank.c b/drivers/mfd/lm3533-ctrlbank.c
index 07aec46e8c0a..0454b4bd2da2 100644
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
index b4363a30b2c8..e91c598342ad 100644
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
 
@@ -237,25 +242,25 @@ static struct attribute_group lm3533_bl_attribute_group = {
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
+	u32 default_brightness = LM3533_BL_MAX_BRIGHTNESS;
 	int ret;
 
 	dev_dbg(&pdev->dev, "%s\n", __func__);
@@ -264,12 +269,6 @@ static int lm3533_bl_probe(struct platform_device *pdev)
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
@@ -287,13 +286,21 @@ static int lm3533_bl_probe(struct platform_device *pdev)
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
@@ -304,6 +311,17 @@ static int lm3533_bl_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, bl);
 
+	device_property_read_u32(&pdev->dev, "led-max-microamp",
+				 &bl->max_current);
+	bl->max_current = clamp(bl->max_current, LM3533_MAX_CURRENT_MIN,
+				LM3533_MAX_CURRENT_MAX);
+
+	device_property_read_u32(&pdev->dev, "ti,pwm-config-mask", &bl->pwm);
+
+	ret = lm3533_bl_setup(bl);
+	if (ret)
+		return ret;
+
 	ret = devm_device_add_group(&bd->dev, &lm3533_bl_attribute_group);
 	if (ret < 0)
 		return dev_err_probe(&pdev->dev, ret,
@@ -311,10 +329,6 @@ static int lm3533_bl_probe(struct platform_device *pdev)
 
 	backlight_update_status(bd);
 
-	ret = lm3533_bl_setup(bl, pdata);
-	if (ret)
-		return ret;
-
 	ret = lm3533_ctrlbank_enable(&bl->cb);
 	if (ret)
 		return ret;
@@ -366,10 +380,17 @@ static void lm3533_bl_shutdown(struct platform_device *pdev)
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
index 696014deaa7c..d3f7b07dbefc 100644
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


