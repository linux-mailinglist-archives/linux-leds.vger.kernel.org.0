Return-Path: <linux-leds+bounces-4568-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EFF3AA5C08
	for <lists+linux-leds@lfdr.de>; Thu,  1 May 2025 10:19:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 598941BC6029
	for <lists+linux-leds@lfdr.de>; Thu,  1 May 2025 08:19:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B9E921146A;
	Thu,  1 May 2025 08:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="noamudyD"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14348210185;
	Thu,  1 May 2025 08:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746087571; cv=none; b=ZxKaxWkzQma4N3TzX3CrYf8G1wEdJoYTbmzzinxXWnsK8VltXrAKVAH5g5Vm4ibGHrhUphmmybKh8XzIfzOKURNGclkzuMPA1LsG36Q4h2aINFSVwPHXXhFwglNo9gHQxgFvuT+FvPljLOYcou5F8yl1DehiHHMvX8ovjCauquM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746087571; c=relaxed/simple;
	bh=t1pnfiKto4qeBxz+EzHMk3dVj2dz+fuwX8MxSCnMMpE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pJPXt6djYNYBecPfenx+gXzefKacMsQj4auYbVrVFbbRaRSb8zb069DJ6wEQ8JqCNS40F7MIJGdAq+vY7nxHDuz6x13sBBN5CVmBiWrRJFoK56zrBsmRQI7KO9knER+HJVEGUStJqA0guJHwubTv64VGnug5CoM1nW7a1Epy9P4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=noamudyD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE8E3C4CEE9;
	Thu,  1 May 2025 08:19:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746087570;
	bh=t1pnfiKto4qeBxz+EzHMk3dVj2dz+fuwX8MxSCnMMpE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=noamudyDuZybK3LQFIkTik4g0nwR1gokUKS4p5w9BcARzj1YdEVfuJX2xmiM3QhR/
	 nnV6XLx01CXBWoxe9qL4pReYxh2CYtIaGo8Y7YaLUI/etJenUGaF2+X9Cr29BQ71A+
	 Of0eBl48AVsZyfg/UlwZ9P22OQukG6G+NFYLmQvl68s6Z/w72SxpFgB5xddxeldtot
	 U2TxD3/AOoZHQitpn0bpognGv5bsz6zBt+IVUjeFAfUc0yGYXc1tbPwCucLOmwyKMt
	 KewWrpFrg+pcnNZF6Jg2RQNaKnj0XmrTJXQGAP/eJhSBO1gWXxibwvQBfDMYkee6Dv
	 4cw1kdE2uYoZA==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org,
	Pavel Machek <pavel@kernel.org>,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: bettyzhou@google.com,
	ynaffit@google.com,
	tkjos@google.com,
	jacek.anaszewski@gmail.com
Subject: [PATCH 2/3] leds: led-test: Fill out the registration test to cover more test cases
Date: Thu,  1 May 2025 09:19:12 +0100
Message-ID: <20250501081918.3621432-2-lee@kernel.org>
X-Mailer: git-send-email 2.49.0.906.g1f30a19c02-goog
In-Reply-To: <20250501081918.3621432-1-lee@kernel.org>
References: <20250501081918.3621432-1-lee@kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Upon successful LED class device registration, it is expected that
certain attributes are filled out in pre-defined ways.  For instance, if
provided, the .brightness_get() call-back should be called to populate
the class device 'brightness' attribute, 'max_brightness' should be
initialised as LED_FULL (at least until we can rid these pesky enums)
and the sysfs group should be created with the class device name
supplied by the caller.

If subsequent registrations take place that would result in name
conflicts, various outcomes are expected depending on which flags are
set.  If LED_REJECT_NAME_CONFLICT is disabled, registration should
succeed resulting in an iteration on the provided name.  Conversely, if
it's enabled, then registration is expected to fail outright.

We test for all of these scenarios here.

Signed-off-by: Lee Jones <lee@kernel.org>
---
 drivers/leds/led-test.c | 31 ++++++++++++++++++++++++++++++-
 1 file changed, 30 insertions(+), 1 deletion(-)

diff --git a/drivers/leds/led-test.c b/drivers/leds/led-test.c
index 23820189abe3..bc85e4513745 100644
--- a/drivers/leds/led-test.c
+++ b/drivers/leds/led-test.c
@@ -10,22 +10,51 @@
 #include <linux/device.h>
 #include <linux/leds.h>
 
+#define LED_TEST_POST_REG_BRIGHTNESS 10
+
 struct led_test_ddata {
 	struct led_classdev cdev;
 	struct device *dev;
 };
 
+static enum led_brightness led_test_brightness_get(struct led_classdev *cdev)
+{
+	return LED_TEST_POST_REG_BRIGHTNESS;
+}
+
 static void led_test_class_register(struct kunit *test)
 {
 	struct led_test_ddata *ddata = test->priv;
-	struct led_classdev *cdev = &ddata->cdev;
+	struct led_classdev *cdev_clash, *cdev = &ddata->cdev;
 	struct device *dev = ddata->dev;
 	int ret;
 
+	/* Register a LED class device */
 	cdev->name = "led-test";
+	cdev->brightness_get = led_test_brightness_get;
+	cdev->brightness = 0;
 
 	ret = devm_led_classdev_register(dev, cdev);
 	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	KUNIT_EXPECT_EQ(test, cdev->max_brightness, LED_FULL);
+	KUNIT_EXPECT_EQ(test, cdev->brightness, LED_TEST_POST_REG_BRIGHTNESS);
+	KUNIT_EXPECT_STREQ(test, cdev->dev->kobj.name, "led-test");
+
+	/* Register again with the same name - expect it to pass with the LED renamed */
+	cdev_clash = devm_kmemdup(dev, cdev, sizeof(*cdev), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, cdev_clash);
+
+	ret = devm_led_classdev_register(dev, cdev_clash);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	KUNIT_EXPECT_STREQ(test, cdev_clash->dev->kobj.name, "led-test_1");
+	KUNIT_EXPECT_STREQ(test, cdev_clash->name, "led-test");
+
+	/* Enable name conflict rejection and register with the same name again - expect failure */
+	cdev_clash->flags |= LED_REJECT_NAME_CONFLICT;
+	ret = devm_led_classdev_register(dev, cdev_clash);
+	KUNIT_EXPECT_EQ(test, ret, -EEXIST);
 }
 
 static struct kunit_case led_test_cases[] = {
-- 
2.49.0.906.g1f30a19c02-goog


