Return-Path: <linux-leds+bounces-4649-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 92162AB80BB
	for <lists+linux-leds@lfdr.de>; Thu, 15 May 2025 10:32:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A42C47A12CA
	for <lists+linux-leds@lfdr.de>; Thu, 15 May 2025 08:31:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0CDD2980AB;
	Thu, 15 May 2025 08:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m6F+jPQL"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88EF12980A7;
	Thu, 15 May 2025 08:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747297774; cv=none; b=ph1kzTjwxvSp15MNSlkM+dy/gkx81JGkFkuCPHIS6JheCOaYSDxB0fGZiU0gUItd0El9cXubNnWIsPExQcHe2UTmTWlpmmCka3AkwJNEmCbJVWNTciynk40iCYA1e41jZZe11BNLGMjORQqV19wIbLp9ypB7SiAwbbemiuMdTcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747297774; c=relaxed/simple;
	bh=UyqFPPIsvZYPyxj9l36RUgJ7D0gy1o3YcnKbYtbWweA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a6ZCEQa4zNZx3SnvxPPh0Hcbr9y/w6JHtXN6ekYXQK96MVLJzXkWq8OA3zdcNxFZyZWnPEr5pH2YgqneLgTDRUS04EE5tZd8piC8bLtczTQrpcpw6h5hsfnR2clo3a4D49pz2yn84kBY0YXjqfaxOGJ/0kpTHbbrLhmFitR/jrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m6F+jPQL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57B29C4CEE7;
	Thu, 15 May 2025 08:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747297774;
	bh=UyqFPPIsvZYPyxj9l36RUgJ7D0gy1o3YcnKbYtbWweA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=m6F+jPQLcNfjiJYQO+Jkz1RNfT4y7t4HRkYMXyJwl2jt7pS09E1MIFENOuawIKGX5
	 UAi8ZwhKJL7xc/GLH2D/EBeRlyF/T0yp0FSFQGbxT1tdpPN4NH4w4yEppdegqD9bbb
	 GBczLkRUNlE8ZnLRkO0twQLVVwYfKyPV7ccmL43A0xRRvaJrukVfeSOORhHURBfxi3
	 R47iikQejujHqZK/wvjOfQNVvjqL6nd+WyUURVvAL9Dgb0voFPTJdYJ3R49IzfNnjL
	 2mmad9Xkcz6hRTjDpLyHFhYdpQT6tTaP5ZJnIIynWGZrwvHHW7GLz1uaWDt0aDt10p
	 tfTdAq5gpVN4Q==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org,
	Pavel Machek <pavel@kernel.org>,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: bettyzhou@google.com,
	ynaffit@google.com,
	tkjos@google.com,
	jacek.anaszewski@gmail.com
Subject: [PATCH v2 1/5] leds: led-test: Move common LED class registration code into helper function
Date: Thu, 15 May 2025 09:28:00 +0100
Message-ID: <20250515082830.800798-2-lee@kernel.org>
X-Mailer: git-send-email 2.49.0.1101.gccaa498523-goog
In-Reply-To: <20250515082830.800798-1-lee@kernel.org>
References: <20250515082830.800798-1-lee@kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since we will always need to register an LED class, it makes sense to
avoid duplicating this part over and over.

Returning void and not propagating errors is expected here since the
assert will terminate the process early if an error condition is
encountered.

Signed-off-by: Lee Jones <lee@kernel.org>
---
 drivers/leds/led-test.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/leds/led-test.c b/drivers/leds/led-test.c
index ddf9aa967a6a..0f152fb12dfb 100644
--- a/drivers/leds/led-test.c
+++ b/drivers/leds/led-test.c
@@ -22,10 +22,10 @@ static enum led_brightness led_test_brightness_get(struct led_classdev *cdev)
 	return LED_TEST_POST_REG_BRIGHTNESS;
 }
 
-static void led_test_class_register(struct kunit *test)
+static void led_test_class_register_helper(struct kunit *test)
 {
 	struct led_test_ddata *ddata = test->priv;
-	struct led_classdev *cdev_clash, *cdev = &ddata->cdev;
+	struct led_classdev *cdev = &ddata->cdev;
 	struct device *dev = ddata->dev;
 	int ret;
 
@@ -36,6 +36,17 @@ static void led_test_class_register(struct kunit *test)
 
 	ret = devm_led_classdev_register(dev, cdev);
 	KUNIT_ASSERT_EQ(test, ret, 0);
+}
+
+static void led_test_class_register(struct kunit *test)
+{
+	struct led_test_ddata *ddata = test->priv;
+	struct led_classdev *cdev_clash, *cdev = &ddata->cdev;
+	struct device *dev = ddata->dev;
+	int ret;
+
+	/* Register initial device - same as always */
+	led_test_class_register_helper(test);
 
 	KUNIT_EXPECT_EQ(test, cdev->max_brightness, LED_FULL);
 	KUNIT_EXPECT_EQ(test, cdev->brightness, LED_TEST_POST_REG_BRIGHTNESS);
@@ -63,12 +74,9 @@ static void led_test_class_add_lookup_and_get(struct kunit *test)
 	struct led_classdev *cdev = &ddata->cdev, *cdev_get;
 	struct device *dev = ddata->dev;
 	struct led_lookup_data lookup;
-	int ret;
 
 	/* First, register a LED class device */
-	cdev->name = "led-test";
-	ret = devm_led_classdev_register(dev, cdev);
-	KUNIT_ASSERT_EQ(test, ret, 0);
+	led_test_class_register_helper(test);
 
 	/* Then make the LED available for lookup */
 	lookup.provider = cdev->name;
-- 
2.49.0.1101.gccaa498523-goog


