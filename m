Return-Path: <linux-leds+bounces-4691-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DBC4AC068A
	for <lists+linux-leds@lfdr.de>; Thu, 22 May 2025 10:07:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B79983A71F7
	for <lists+linux-leds@lfdr.de>; Thu, 22 May 2025 08:07:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF3352522AD;
	Thu, 22 May 2025 08:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pxdGRtTK"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9541524C668;
	Thu, 22 May 2025 08:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747901236; cv=none; b=ZU2M/eG6L+S2BoiKKP+BytvsClzxIMI0rT/MXLT5BBmG6xFabjp4F3qwUXFOclNqvwHKWwnpUSA9VeA4qD5oDnJosJARafaQ6gR6gymHydYRClUzQ3aH7vQpPTl+Rb/W4wve3hkRStnHjgbHX1v9A5oeDyEpcN6dlbnrunuJaHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747901236; c=relaxed/simple;
	bh=gfFWoXtvfq0dOKxLkZYmplPetaqqvPy/+dRBhhnGRHM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nvaRJ+orMuhKMT8cs4+L1+3wqk/dqzekplVcqdIE4CgSbN/lYzlO6NFN97DHOX1fre/D8b2/tIo3snqaOGFsIEoq6md1farMW0+lowSQ891cRNIWYLUSCQ1+aehRdoPRUqZ4/j7CNAShQv8CaNmOKzSYF1ZuJ+PnMTmR1aoyV7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pxdGRtTK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B026C4CEE4;
	Thu, 22 May 2025 08:07:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747901235;
	bh=gfFWoXtvfq0dOKxLkZYmplPetaqqvPy/+dRBhhnGRHM=;
	h=From:To:Cc:Subject:Date:From;
	b=pxdGRtTK5fQoKAgAwumAQzBjfmmTcde6P+a38VJT0t2uI2sF9CJaeea+qrI6fqu7s
	 R38ZPEJCfTsJkzLZj3luHxdiV09Tv+6TWDhyRiuvqDqcnHJRB6UDeGnXlrBoIEwzWc
	 3RslrjJVAtt3hFgGM7nRD+FTSyfeY9//IbW2qSN/f5Am+jDq8AXPfFUNgbFZWv9Ea6
	 8jyr964i884Tb30cnwMptbCVUw2mIhRBUCyw/9xjUFskAlVeF1KrRintW6fvlsk8dk
	 Z4/aGk6Ot1QXQ7uPQT0gW0F0IpyLCfEjEUIpZPRSX+FNbeOCuZ0NU+2OJjvsPIZtiV
	 IT8FWOgoWFrNQ==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org,
	Pavel Machek <pavel@kernel.org>,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: bettyzhou@google.com,
	ynaffit@google.com,
	tkjos@google.com,
	jacek.anaszewski@gmail.com
Subject: [PATCH v3 1/5] leds: led-test: Move common LED class registration code into helper function
Date: Thu, 22 May 2025 09:06:48 +0100
Message-ID: <20250522080656.1215457-1-lee@kernel.org>
X-Mailer: git-send-email 2.49.0.1143.g0be31eac6b-goog
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
Reviewed-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
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
2.49.0.1143.g0be31eac6b-goog


