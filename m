Return-Path: <linux-leds+bounces-8561-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fBOUE2ScKWqJagMAu9opvQ
	(envelope-from <linux-leds+bounces-8561-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 10 Jun 2026 19:18:28 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B0BAC66BEB8
	for <lists+linux-leds@lfdr.de>; Wed, 10 Jun 2026 19:18:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=ng+rLcvB;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8561-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-8561-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B8E8A300DD73
	for <lists+linux-leds@lfdr.de>; Wed, 10 Jun 2026 17:18:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6125D346A14;
	Wed, 10 Jun 2026 17:18:25 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ua1-f66.google.com (mail-ua1-f66.google.com [209.85.222.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9E162E2286
	for <linux-leds@vger.kernel.org>; Wed, 10 Jun 2026 17:18:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781111905; cv=none; b=Stsdli0sv9xzKwlgjqajBmHv6SVi/p49Zl3w1GvBZf7bze2vRgnF/aGWdO8iXRMSVu6KDX1ob52zUUDF8IUydIvvL5sjVIN6KTvo7ZvAvXJBnqA1qRXP2/vLSuOgkYg+SndYmc/uDxP998O89MY9Gqu6w/dEhL2mmPrtx3JHI3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781111905; c=relaxed/simple;
	bh=tfGHxGDDbZvFF+cSkI8jDJnxbXaPzOJflEMgNKxzrCY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Bg9H6sTlJflznPqiKwFAPgp630x8oKgY6ofbAwaWAhsQ0prqRy/XaXXcyonCLU+P0gATfpwuwurm5iv4tiIZQXCX9fAPZ73M43sOLtSpzR20sGczR3+9eMl9z01Kf5kZN7JQ4G4GCTl+9RGRL4Ifkg6Z0VVlHuH9TP4PV7KyNuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ng+rLcvB; arc=none smtp.client-ip=209.85.222.66
Received: by mail-ua1-f66.google.com with SMTP id a1e0cc1a2514c-963b7d9bf68so2638387241.3
        for <linux-leds@vger.kernel.org>; Wed, 10 Jun 2026 10:18:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781111900; x=1781716700; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=z4+Wc4Bx/L1u1UurONwC7CnaBhrxXo3k1csuOuHNSY0=;
        b=ng+rLcvBboe+RW2NwcKDC5XPlb+QlWjE/kWiljgLxgxHj2E+41Y3Srg1dQ/ApnWw5G
         Wpt9E8McLmF62QKqXGhMltVKBn/LYPDeQZ1eaZSSFA9+xMSwtQVF/GarwXuxeE7D+XEC
         RZWiK0ZfogMtsObcsUWMLxl85bZlympR7tI2TffqKa2Cn10gyVC1Cn33bhNFP+pdF2f1
         zxuUNoCH0DbjLCcw6NHd7BXSsoH+nrBEKnrhTLkC/yc4OV4IAMbFCJ5eweycZkoN3+XZ
         L+puPz7YtyowBzapH9H68jyzCabP+L+KMJfWM1KRo1T+yVu5naRI0DFFjwm/oFH+smoU
         8jFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781111900; x=1781716700;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z4+Wc4Bx/L1u1UurONwC7CnaBhrxXo3k1csuOuHNSY0=;
        b=ilf9MUmTZ3hdwLvzi6frD+Tp4nvGWWhgkSGUtfHTLv/Bo9awbJEQWkjPH0aYXkV1dy
         YV+qeDk7piQW4foFPHTGAYioIK9qW3NKpYKinYfQoAa2ErnRNbi7A8nu5Us/3bP820X7
         46q1giedVfmdXrIb8UXqlAU+gqD6XKDiFLnL52d3lSqvohcxBSRmPWfN3Mik8NJ8xcRm
         eWCvnElbe60Tm9HYrmoK4MN5K3xl33m2FAeITLb9rdw2sLY7bENqrD8uMTKpSfdmbW+4
         BynXlVCabrBV49mDzA8a2kv5Ku9t9zo4HGUuHwtP90N0d1BGj/Zx4fTZoc6pqHwfdMxK
         aWAw==
X-Forwarded-Encrypted: i=1; AFNElJ8XZle3wJDP3xjvMDBFeNG+uSPy+pzO+pwbIdXc+2UkaGUjmfLngZecFXbwm/OP5m/jCjd5+ac3BFmo@vger.kernel.org
X-Gm-Message-State: AOJu0YwGsCe9RpztHMy0rljLylaz7HOrXTLbhD1LT5WRzrOv+a7R9w6a
	3aC2COLNLK201qPsE02XnjkdWc+QWr4bV52wgdU4BJGGCzfqNb/ZaMw/
X-Gm-Gg: Acq92OHyKxvRbzPkWpWtwXz7aAZIsC3LXeazw1a/+WUfPPQZYgHeICMUw/Sn03C229n
	fpXzf4GBoj3KeLoaEWu2e2NJOGefNMNIVK1+aWGMM0yXCD0inCb+cJd/0+R0RD4o60OVzsmXnGh
	oDccgT5QTrbgmq77Nxw2zc5HF2y7vROsiW6ecopyFIZKeJ6QLjnlXMy2Wk5nSL8lmFsoJHcvHVN
	ert6soBnOPS2+OLimzz9JWCeSQJHCrAZigmtdzwRBXi8LYKggO25Bf/hmYkcK/wqyVRwxbGNWv8
	zD+usmVl701SxJL05Ue/x1GgzLbOfT89BE5b/dvf0QV/gC8xp69Ov1+IdWeA6Y1LDVjTns35FCs
	AZjf0XelnBg9E+mV/44ZPYTLILGhOtUazPHMcc8Sft8Z1fFFJa+9SmZs/3l1PN5LaYzfaQ88pj4
	17RuPPEZPTg/8LV2G+aTPetODFqxm+vosx7Ccg/63xlZ6xQbC+mkMq/HP6Me3YQf2fRzU31+z8j
	cfAB1M78tIIFZLh27Qk
X-Received: by 2002:a05:6122:c99:b0:575:29ef:7e13 with SMTP id 71dfb90a1353d-5ac4ee91214mr13295127e0c.3.1781111900146;
        Wed, 10 Jun 2026 10:18:20 -0700 (PDT)
Received: from Lorenzo.localdomain (179.177.187.45.dynamic.adsl.gvt.net.br. [179.177.187.45])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5a9752595a7sm18567951e0c.16.2026.06.10.10.18.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 10:18:19 -0700 (PDT)
From: Lorenzo Egidio <lorenzoegidioms@gmail.com>
To: lee@kernel.org
Cc: pavel@ucw.cz,
	linux-leds@vger.kernel.org,
	Lorenzo Egidio <lorenzoegidioms@gmail.com>
Subject: [PATCH] leds: tests: clarify name conflict test It is a good practice to use a fresh led_classdev instance when doing the testing. LED_REJECT_NAME_CONFLICT rather than re-registering the already registered LED class device. Besides that, do a zero initialization of led_lookup_data.
Date: Wed, 10 Jun 2026 14:21:07 -0300
Message-ID: <20260610172107.507-1-lorenzoegidioms@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.45 / 15.00];
	LONG_SUBJ(2.11)[282];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[ucw.cz,vger.kernel.org,gmail.com];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-8561-lists,linux-leds=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:pavel@ucw.cz,m:linux-leds@vger.kernel.org,m:lorenzoegidioms@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[lorenzoegidioms@gmail.com,linux-leds@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_THREE(0.00)[4];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lorenzoegidioms@gmail.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B0BAC66BEB8

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
2.50.1


