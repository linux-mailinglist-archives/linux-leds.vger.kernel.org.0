Return-Path: <linux-leds+bounces-8585-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HtpcNbSQLGp5SwQAu9opvQ
	(envelope-from <linux-leds+bounces-8585-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sat, 13 Jun 2026 01:05:24 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 790FC67CFAB
	for <lists+linux-leds@lfdr.de>; Sat, 13 Jun 2026 01:05:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=l2rVUgdh;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8585-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-leds+bounces-8585-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8A5A530AB63A
	for <lists+linux-leds@lfdr.de>; Fri, 12 Jun 2026 23:03:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D57339656D;
	Fri, 12 Jun 2026 23:03:51 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 114A83A5E9E
	for <linux-leds@vger.kernel.org>; Fri, 12 Jun 2026 23:03:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781305431; cv=none; b=dywWmSSvoJu4lqLEphMewuxPiJRM6CVCdvEh4mvPn6Q+2xrJlqEZkne2SavQP6leg4jCQNrDR/N+BfbIAe0o7El/sWLEslUaLeDvXaWlc6mvw3OcJlRft7LjR+KAQ0Tc75WS22+TNixDKMPA0uZEZVz7wNJQH+NPVnxsODfI/Hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781305431; c=relaxed/simple;
	bh=4kaeOnQYrsWLSYa1od4fkmEwVvKpSzvo6+4uPT6uvko=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=A3WQOdVCVr9UDyRYkObgvWHug3Q63dIPp+VDXtuGx1cfCN/0+kLrfyF+x9MfH7LkAh13hnjuq0JkJpTRiuZ7swyjFLYg2S6WAwiaHmP1WQV4ssxoh9zd8KwjPKNMcbmKi22edI6DU3El8QUs2xEn0Kt1Ups9OWJjalfvUu0eO+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l2rVUgdh; arc=none smtp.client-ip=209.85.222.49
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-963b04fd87aso640518241.0
        for <linux-leds@vger.kernel.org>; Fri, 12 Jun 2026 16:03:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781305429; x=1781910229; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cs7z7VUIct7FPqxCvq6QH5iFYJAEFE+mTSM4QdrEGh0=;
        b=l2rVUgdh2Io6hFd6vc1Ha5luaM3zz1nKbiyRUMkZxq6WUbHkVP9OO49Bugtti2QJ2r
         iIDUg7hMJD/QJr1kBOAUyhrIInWvKjNML4Pm3ONxtLEzZdoT7uCfrtzRIyBrNpqUbqBJ
         mYDGMYUiajBxxjjbqsbTy3sTPWXc6+QDrQmaC3TZqVrgD5VrVJZGS0CO1CK2jtI+kJ9m
         XZ6LsigbtHAwZIZ98Hgcr6iIELtsB1Pu1X8B1DR2fm/IczTvC4r5JyKeIa0qRO9ab7Cg
         YGcXsMS2ftlVMJ7YZQkUIMXfTN30IVnsbESqaVtSvWhwpicbtFdcCngX1b28k+yEfMyu
         ZtVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781305429; x=1781910229;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cs7z7VUIct7FPqxCvq6QH5iFYJAEFE+mTSM4QdrEGh0=;
        b=IDfCpVAVo0qfwo1mfX30s1AEDjqq3A7mJqyIerhT8dEPhcKhqajSdwr9TFbPcnrf49
         smo6uOoZA1UNto5N8Zvp1719Ow+VPB4vghb/GGUmputvM4T2ygWlXUK67HSzWvbtySKa
         1a6U/i7kXv7KZ5K3mUas8C82itxSjDgqovPUh6Cp+eoSOfWBtyjCutbsZBfgPMdYy/Vy
         Hryw05z5+DJnJgXh/RlCOLC9gLKaW5BQnKNUS9lSNR8dsMCqbbXevMP85ru85SiAPtNx
         S835t4LxH5sGoB5bdrvIKt28F8CNBqP3ffcWUwn+23iCCcp/AT8ugWLVZ6MRTyoX7/KC
         VK0Q==
X-Forwarded-Encrypted: i=1; AFNElJ9dWrj1hwrx/E5RWE9rE42dzl/eTk9VtJmuZCp675WkwoFf9CR8RGH6ocrSw7MD//luWTlu9XVE1rxK@vger.kernel.org
X-Gm-Message-State: AOJu0YzW5zdF02b2AZ+GX4ZpKMs6fsDZTnnUkwj0WPhPRv4XtIs4WvDF
	k/UdHAGYymePJnXw2zLa0FlM55DVTsitOTsMZGwT/ShUwerEkAmRk0Iu
X-Gm-Gg: Acq92OEqtuJZvS1FMOQ8ExiO2m8V4rcqseCGTuN1B12kLv+jo+EPmau2REt1628c/mc
	PhDB+cyh2pIRkwLgsDCb7F2jk4gaqBmNmZDysUGG77ESeGbb/cHhk/ADPlfCNsvYPSUYtHsgcWn
	ZqWpOyWmICdnJ4PHryecwzgXywzxhN+PF6JwuSP23SXkI/EPrkjRHNoOAr/8DUMx65445Bd9Z0B
	2zDoUfN9gjGdOY97G4XPG/ygspRXj7RUESHcqY+yKoX+KGS6pTu+Cr2AAzokIEKLjo4iSW3WcL+
	C9AGSnYSXqu9kEQPnSyp95Juhkb9blh4DBDJTzmTNCIoEHZjCJqXroTQd586ekj9EI5xqk5lCMs
	Bga60uKKuFRQgqASYpESG5jlvSR+ssQanQGFcQtgL2UE0sUTWUI9Ju0qI3a8IGim0qYjFSmwEiH
	jH2es4mLdzjxzoj2D4v8fQErMYV0Gr/qrCa1w9rOaS9YinU0lxzqo0p439OQHQhjDk/uugNkVGF
	7f09T0=
X-Received: by 2002:a05:6102:5113:b0:6c6:74d:e09c with SMTP id ada2fe7eead31-71e88b32723mr3212006137.11.1781305428858;
        Fri, 12 Jun 2026 16:03:48 -0700 (PDT)
Received: from Lorenzo.localdomain (179.177.183.8.dynamic.adsl.gvt.net.br. [179.177.183.8])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-96673dfce96sm2617568241.1.2026.06.12.16.03.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 16:03:48 -0700 (PDT)
From: Lorenzo Egidio <lorenzoegidioms@gmail.com>
To: lee@kernel.org
Cc: pavel@ucw.cz,
	linux-leds@vger.kernel.org,
	Lorenzo Egidio <lorenzoegidioms@gmail.com>
Subject: [PATCH v2] leds: tests: use a fresh instance for name conflict rejection
Date: Fri, 12 Jun 2026 20:06:06 -0300
Message-ID: <20260612230606.1438-1-lorenzoegidioms@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[ucw.cz,vger.kernel.org,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8585-lists,linux-leds=lfdr.de];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[lorenzoegidioms@gmail.com,linux-leds@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:pavel@ucw.cz,m:linux-leds@vger.kernel.org,m:lorenzoegidioms@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_THREE(0.00)[4];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lorenzoegidioms@gmail.com,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 790FC67CFAB

The LED_REJECT_NAME_CONFLICT test currently re-registers an
already registered led_classdev instance.

Use a fresh copy instead so the test exercises the
name-conflict rejection path directly.

Signed-off-by: Lorenzo Egidio <lorenzoegidioms@gmail.com>
---
 drivers/leds/led-test.c | 102 ++++++++++++++++++++++++++--------------
 1 file changed, 66 insertions(+), 36 deletions(-)

diff --git a/drivers/leds/led-test.c b/drivers/leds/led-test.c
index ddf9aa967..36aef3e13 100644
--- a/drivers/leds/led-test.c
+++ b/drivers/leds/led-test.c
@@ -1,4 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0-only
+// leds: tests: clarify name conflict test
 /*
  * Copyright (C) 2025 Google LLC
  *
@@ -10,77 +11,106 @@
 #include <linux/device.h>
 #include <linux/leds.h>
 
-#define LED_TEST_POST_REG_BRIGHTNESS 10
+enum {
+	LED_TEST_POST_REG_BRIGHTNESS = 10,
+};
 
-struct led_test_ddata {
+struct led_test_data {
 	struct led_classdev cdev;
 	struct device *dev;
 };
 
-static enum led_brightness led_test_brightness_get(struct led_classdev *cdev)
+static enum led_brightness
+led_test_brightness_get(struct led_classdev *cdev)
 {
 	return LED_TEST_POST_REG_BRIGHTNESS;
 }
 
-static void led_test_class_register(struct kunit *test)
+static void led_test_init_cdev(struct led_classdev *cdev)
 {
-	struct led_test_ddata *ddata = test->priv;
-	struct led_classdev *cdev_clash, *cdev = &ddata->cdev;
-	struct device *dev = ddata->dev;
-	int ret;
+	memset(cdev, 0, sizeof(*cdev));
 
-	/* Register a LED class device */
 	cdev->name = "led-test";
-	cdev->brightness_get = led_test_brightness_get;
 	cdev->brightness = 0;
+	cdev->brightness_get = led_test_brightness_get;
+}
+
+static void led_test_class_register(struct kunit *test)
+{
+	struct led_test_data *data = test->priv;
+	struct led_classdev *cdev = &data->cdev;
+	struct led_classdev *cdev_clash;
+	struct led_classdev *cdev_reject;
+	struct device *dev = data->dev;
+	int ret;
+
+	led_test_init_cdev(cdev);
 
 	ret = devm_led_classdev_register(dev, cdev);
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
+	KUNIT_EXPECT_NOT_NULL(test, cdev->dev);
 	KUNIT_EXPECT_EQ(test, cdev->max_brightness, LED_FULL);
-	KUNIT_EXPECT_EQ(test, cdev->brightness, LED_TEST_POST_REG_BRIGHTNESS);
+	KUNIT_EXPECT_EQ(test, cdev->brightness,
+			LED_TEST_POST_REG_BRIGHTNESS);
 	KUNIT_EXPECT_STREQ(test, cdev->dev->kobj.name, "led-test");
 
-	/* Register again with the same name - expect it to pass with the LED renamed */
+	/*
+	 * Name collision should be resolved automatically by
+	 * renaming the device instance while preserving the
+	 * logical LED name.
+	 */
 	cdev_clash = devm_kmemdup(dev, cdev, sizeof(*cdev), GFP_KERNEL);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, cdev_clash);
 
 	ret = devm_led_classdev_register(dev, cdev_clash);
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
-	KUNIT_EXPECT_STREQ(test, cdev_clash->dev->kobj.name, "led-test_1");
-	KUNIT_EXPECT_STREQ(test, cdev_clash->name, "led-test");
+	KUNIT_EXPECT_STREQ(test,
+			   cdev_clash->dev->kobj.name,
+			   "led-test_1");
+	KUNIT_EXPECT_STREQ(test,
+			   cdev_clash->name,
+			   "led-test");
 
-	/* Enable name conflict rejection and register with the same name again - expect failure */
-	cdev_clash->flags |= LED_REJECT_NAME_CONFLICT;
-	ret = devm_led_classdev_register(dev, cdev_clash);
+	/*
+	 * Verify that explicit conflict rejection fails.
+	 */
+	cdev_reject = devm_kmemdup(dev, cdev, sizeof(*cdev), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, cdev_reject);
+
+	cdev_reject->flags |= LED_REJECT_NAME_CONFLICT;
+
+	ret = devm_led_classdev_register(dev, cdev_reject);
 	KUNIT_EXPECT_EQ(test, ret, -EEXIST);
 }
 
 static void led_test_class_add_lookup_and_get(struct kunit *test)
 {
-	struct led_test_ddata *ddata = test->priv;
-	struct led_classdev *cdev = &ddata->cdev, *cdev_get;
-	struct device *dev = ddata->dev;
-	struct led_lookup_data lookup;
+	struct led_test_data *data = test->priv;
+	struct led_classdev *cdev = &data->cdev;
+	struct led_classdev *cdev_get;
+	struct device *dev = data->dev;
+	struct led_lookup_data lookup = { };
 	int ret;
 
-	/* First, register a LED class device */
-	cdev->name = "led-test";
+	led_test_init_cdev(cdev);
+
 	ret = devm_led_classdev_register(dev, cdev);
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
-	/* Then make the LED available for lookup */
 	lookup.provider = cdev->name;
 	lookup.dev_id = dev_name(dev);
 	lookup.con_id = "led-test-1";
+
 	led_add_lookup(&lookup);
 
-	/* Finally, attempt to look it up via the API - imagine this was an orthogonal driver */
 	cdev_get = devm_led_get(dev, "led-test-1");
-	KUNIT_ASSERT_FALSE(test, IS_ERR(cdev_get));
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, cdev_get);
 
-	KUNIT_EXPECT_STREQ(test, cdev_get->name, cdev->name);
+	KUNIT_EXPECT_STREQ(test,
+			   cdev_get->name,
+			   cdev->name);
 
 	led_remove_lookup(&lookup);
 }
@@ -93,30 +123,29 @@ static struct kunit_case led_test_cases[] = {
 
 static int led_test_init(struct kunit *test)
 {
-	struct led_test_ddata *ddata;
+	struct led_test_data *data;
 	struct device *dev;
 
-	ddata = kunit_kzalloc(test, sizeof(*ddata), GFP_KERNEL);
-	if (!ddata)
+	data = kunit_kzalloc(test, sizeof(*data), GFP_KERNEL);
+	if (!data)
 		return -ENOMEM;
 
-	test->priv = ddata;
-
 	dev = kunit_device_register(test, "led_test");
 	if (IS_ERR(dev))
 		return PTR_ERR(dev);
 
-	ddata->dev = get_device(dev);
+	data->dev = get_device(dev);
+	test->priv = data;
 
 	return 0;
 }
 
 static void led_test_exit(struct kunit *test)
 {
-	struct led_test_ddata *ddata = test->priv;
+	struct led_test_data *data = test->priv;
 
-	if (ddata && ddata->dev)
-		put_device(ddata->dev);
+	if (data && data->dev)
+		put_device(data->dev);
 }
 
 static struct kunit_suite led_test_suite = {
@@ -125,6 +154,7 @@ static struct kunit_suite led_test_suite = {
 	.exit = led_test_exit,
 	.test_cases = led_test_cases,
 };
+
 kunit_test_suite(led_test_suite);
 
 MODULE_AUTHOR("Lee Jones <lee@kernel.org>");
-- 
2.51.0


