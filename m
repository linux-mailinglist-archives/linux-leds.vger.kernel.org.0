Return-Path: <linux-leds+bounces-6686-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YHERBMMwcGkSXAAAu9opvQ
	(envelope-from <linux-leds+bounces-6686-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 21 Jan 2026 02:49:55 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A8E84F58B
	for <lists+linux-leds@lfdr.de>; Wed, 21 Jan 2026 02:49:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 743375E3003
	for <lists+linux-leds@lfdr.de>; Tue, 20 Jan 2026 12:53:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31B6142B723;
	Tue, 20 Jan 2026 12:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kmVqMRh7"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AA2042DFEC
	for <linux-leds@vger.kernel.org>; Tue, 20 Jan 2026 12:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768913460; cv=none; b=SrxFypjU2dYKwQTomCTzOoY/n7bp7SNldEzV+MpqUONq1BZ9Munft9ak/CXpM0lXNtfPFTSPI0DO0mOa1amX1fOjqq5lOxKnoZVRTnOfaJ6nhYiFThVnf2r+fdR4kGgIEoihQzumsxqS1lavp08kM3jrMTT1/BBVSDz+t85SJWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768913460; c=relaxed/simple;
	bh=wBaSoSs4KKPmkdnBbVJ5VE0QtVfyigKXSTnVZqKJ2eg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qj56VJSCAOClwR+Je2qCUNbIdKhAdmn6xYqmiPYnBz2NrNmh9nmp9+zWmI2qaDmR+IvgP3SPI9vzVjbaEzDj8LpIfWGKM6CcickPPAxbB8cYSTsPUSC4Aycvy0KiPB2q4FE5qw7MSYUc2buV5j58L7qb8h2wk2OWVTwGNlGZptg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kmVqMRh7; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2a0a95200e8so34629475ad.0
        for <linux-leds@vger.kernel.org>; Tue, 20 Jan 2026 04:50:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768913457; x=1769518257; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LroXmq9J3VVORG7m8L/kGtxBgy95TWF72WU3KxUKLtI=;
        b=kmVqMRh72Z60zhUkUYNVVeacAqTKAHaAjF0av00kQCpVIhwQ347S9De5LAtrBCWeVu
         qxxDzdq1U+Ge1MmJJsxvgLdI/BDmRXk1QBbiMj7PY2Jd7In1g+6SzzesT5QKmv0l+eaV
         CxTz6JXMrdj9rzUzeuSCfcI/k5xb00ULWBme3a/Z3QjGB+nMabhn3wRsZBytqOSndHhT
         f6CNURMn7oTbtm1fD5G+wXgLYLgfHOSA6KUaX3P6kcGbNhESxYWjurAsDI3DClprKxV4
         LwTAXo3PPPTGrIqpTt1okiFHAL9g5Zo8HsP1mbOSwN7G1sBO3G8FtDlcNvtrfbIyIAVI
         QH8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768913457; x=1769518257;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LroXmq9J3VVORG7m8L/kGtxBgy95TWF72WU3KxUKLtI=;
        b=BgxWVkKVZsNiGl4/gWHgXW2xBuzjPHTwYmrWgnW3+er4FXQFr7MrbqYTy+id6eQLl/
         WPwHn5pxkWr3V+35uUWVMmxYN5BlYKuHljt+RtW3nBcKR95D89FtFYFNGvNJdnugJ16W
         A+HY6gFhxBOuP1sEbNLo2TdiVReWS2LsqwhGoB7v2gZoG7NUX4uLn86+j/48E5QBdfZq
         7Bp8mtiWz2MtEBhBXLonB0zKqwyQjn3ErBpg270N15/jmub2bqqzWEHgDaFja/8mvioa
         hrV7pjngYGv33vOVOidj1/VbTSPDPZLmtmOxLDsSt1N3l2P2zpSqHpjvKOlHC5rmq8BY
         9/Tg==
X-Forwarded-Encrypted: i=1; AJvYcCW9tpkM+PpkCwfLPeeVlkpSM14Tt5O/glwej69XRox4qjjhFIjrMwdj7jxZziQSwS6hODTxKPdkQ0Lo@vger.kernel.org
X-Gm-Message-State: AOJu0Ywv4aZkFh4WirrxQJs1fDRlaZ0xIsPJzGXkgURcMBgyfzFJZ29u
	zSBpEmrIay+Qk1giC+dGrL0hRHaWvKBAfYm2Bf2ruSS8IJJ/aoOUd00j
X-Gm-Gg: AZuq6aKFvXls0jFBzr4XHXuCtqeWjuhqUxYuscggvYB6REESKKkc/TSAPoP2vajb5dR
	SqZ/iSCKL/k2/PWS65yY5LOrcK4unhpZBl/H4uViiV/2InZLeHMu35BaNqOxGCFkyCHProaj0Or
	REjey3PYHmfx5jkMmTqYkhf3tlbr71WwGIrrtaUDI1ilW1GnVrlvoIWgzkUXAYaDL8+t//rQvO1
	sW5FKqbtXIdKwmQfDPOzJFBWSnQq/BnSHXqjL/yUmWZqufu4APtUWHo3j9KK2w7eXrVhonXBHLr
	EgecIlVRdeVwOxeL7Sjtnyz/TFfT02UmaOnyq/dJwX/TBSh7olMycqMvlHLR75Q5NkTx47c8Edy
	QM0CKqP8yOktbSeSFjIRsjnZXfHq7kq5sQ4Le1ZcuRGDXuidoDN+IYBUgc4Z3LEUssQPohsPB7V
	jmZWbe0UWLb+dbrBSWpb/V+58b3TdTWQe3zdZl
X-Received: by 2002:a17:903:2ec5:b0:2a0:8859:3722 with SMTP id d9443c01a7336-2a769ae664fmr16859025ad.25.1768913457332;
        Tue, 20 Jan 2026 04:50:57 -0800 (PST)
Received: from test-HP-Desktop-Pro-G3.. ([103.218.174.23])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7193dd582sm124973815ad.52.2026.01.20.04.50.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 04:50:56 -0800 (PST)
From: Sudarshan Shetty <tessolveupstream@gmail.com>
To: lee@kernel.org,
	danielt@kernel.org,
	jingoohan1@gmail.com
Cc: deller@gmx.de,
	pavel@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sudarshan Shetty <tessolveupstream@gmail.com>
Subject: [PATCH v2 2/2] backlight: gpio: add support for multiple GPIOs for backlight control
Date: Tue, 20 Jan 2026 18:20:36 +0530
Message-Id: <20260120125036.2203995-3-tessolveupstream@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260120125036.2203995-1-tessolveupstream@gmail.com>
References: <20260120125036.2203995-1-tessolveupstream@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [1.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-6686-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmx.de,kernel.org,lists.freedesktop.org,vger.kernel.org,gmail.com];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	PRECEDENCE_BULK(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	FROM_NEQ_ENVFROM(0.00)[tessolveupstream@gmail.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[gmail.com,none];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo]
X-Rspamd-Queue-Id: 9A8E84F58B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The gpio-backlight driver currently supports only a single GPIO to
enable or disable a backlight device. Some panels require multiple
enable GPIOs to be asserted together.

Extend the driver to support an array of GPIOs for a single backlight
instance. All configured GPIOs are toggled together based on the
backlight state.

Existing single-GPIO Device Tree users remain unaffected.

Signed-off-by: Sudarshan Shetty <tessolveupstream@gmail.com>
---
 drivers/video/backlight/gpio_backlight.c | 66 ++++++++++++++++--------
 1 file changed, 45 insertions(+), 21 deletions(-)

diff --git a/drivers/video/backlight/gpio_backlight.c b/drivers/video/backlight/gpio_backlight.c
index 728a546904b0..11d21de82cf5 100644
--- a/drivers/video/backlight/gpio_backlight.c
+++ b/drivers/video/backlight/gpio_backlight.c
@@ -14,17 +14,29 @@
 #include <linux/platform_device.h>
 #include <linux/property.h>
 #include <linux/slab.h>
+#include <linux/bitmap.h>
 
 struct gpio_backlight {
 	struct device *dev;
-	struct gpio_desc *gpiod;
+	struct gpio_descs *gpiods;
+	unsigned long *bitmap;
 };
 
 static int gpio_backlight_update_status(struct backlight_device *bl)
 {
 	struct gpio_backlight *gbl = bl_get_data(bl);
+	unsigned int n = gbl->gpiods->ndescs;
+	int br = backlight_get_brightness(bl);
 
-	gpiod_set_value_cansleep(gbl->gpiod, backlight_get_brightness(bl));
+	if (br)
+		bitmap_fill(gbl->bitmap, n);
+	else
+		bitmap_zero(gbl->bitmap, n);
+
+	gpiod_set_array_value_cansleep(n,
+				       gbl->gpiods->desc,
+				       gbl->gpiods->info,
+				       gbl->bitmap);
 
 	return 0;
 }
@@ -48,26 +60,43 @@ static int gpio_backlight_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct gpio_backlight_platform_data *pdata = dev_get_platdata(dev);
 	struct device_node *of_node = dev->of_node;
-	struct backlight_properties props;
+	struct backlight_properties props = { };
 	struct backlight_device *bl;
 	struct gpio_backlight *gbl;
-	int ret, init_brightness, def_value;
+	bool def_value;
+	enum gpiod_flags flags;
+	unsigned int n;
+	int words;
 
-	gbl = devm_kzalloc(dev, sizeof(*gbl), GFP_KERNEL);
-	if (gbl == NULL)
+	gbl = devm_kcalloc(dev, 1, sizeof(*gbl), GFP_KERNEL);
+	if (!gbl)
 		return -ENOMEM;
 
 	if (pdata)
 		gbl->dev = pdata->dev;
 
 	def_value = device_property_read_bool(dev, "default-on");
+	flags = def_value ? GPIOD_OUT_HIGH : GPIOD_OUT_LOW;
+
+	gbl->gpiods = devm_gpiod_get_array(dev, NULL, flags);
+	if (IS_ERR(gbl->gpiods)) {
+		if (PTR_ERR(gbl->gpiods) == -ENODEV)
+			return dev_err_probe(dev, -EINVAL,
+			"The gpios parameter is missing or invalid\n");
+		return PTR_ERR(gbl->gpiods);
+	}
 
-	gbl->gpiod = devm_gpiod_get(dev, NULL, GPIOD_ASIS);
-	if (IS_ERR(gbl->gpiod))
-		return dev_err_probe(dev, PTR_ERR(gbl->gpiod),
-				     "The gpios parameter is missing or invalid\n");
+	n = gbl->gpiods->ndescs;
+	if (!n)
+		return dev_err_probe(dev, -EINVAL,
+			"No GPIOs provided\n");
+
+	words = BITS_TO_LONGS(n);
+	gbl->bitmap = devm_kcalloc(dev, words, sizeof(unsigned long),
+				   GFP_KERNEL);
+	if (!gbl->bitmap)
+		return -ENOMEM;
 
-	memset(&props, 0, sizeof(props));
 	props.type = BACKLIGHT_RAW;
 	props.max_brightness = 1;
 	bl = devm_backlight_device_register(dev, dev_name(dev), dev, gbl,
@@ -81,21 +110,16 @@ static int gpio_backlight_probe(struct platform_device *pdev)
 	if (!of_node || !of_node->phandle)
 		/* Not booted with device tree or no phandle link to the node */
 		bl->props.power = def_value ? BACKLIGHT_POWER_ON
-					    : BACKLIGHT_POWER_OFF;
-	else if (gpiod_get_value_cansleep(gbl->gpiod) == 0)
+						    : BACKLIGHT_POWER_OFF;
+	else if (gpiod_get_value_cansleep(gbl->gpiods->desc[0]) == 0)
 		bl->props.power = BACKLIGHT_POWER_OFF;
 	else
 		bl->props.power = BACKLIGHT_POWER_ON;
 
-	bl->props.brightness = 1;
-
-	init_brightness = backlight_get_brightness(bl);
-	ret = gpiod_direction_output(gbl->gpiod, init_brightness);
-	if (ret) {
-		dev_err(dev, "failed to set initial brightness\n");
-		return ret;
-	}
+	bl->props.brightness = def_value ? 1 : 0;
 
+	gpio_backlight_update_status(bl);
+
 	platform_set_drvdata(pdev, bl);
 	return 0;
 }
-- 
2.34.1


