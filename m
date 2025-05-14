Return-Path: <linux-leds+bounces-4637-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 32FC8AB7157
	for <lists+linux-leds@lfdr.de>; Wed, 14 May 2025 18:28:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C3805163716
	for <lists+linux-leds@lfdr.de>; Wed, 14 May 2025 16:28:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA5532741B7;
	Wed, 14 May 2025 16:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MzerA7hm"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C264F1DF994;
	Wed, 14 May 2025 16:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747240131; cv=none; b=QaIicDjjwADaTDccRc03faSbe9Xna61LXLHwDiOYF500SJ7qusx/x4izAhq8zcy8ctQSjyiSi0j1XDI2hYX34jEv3VJlzc+dOXRN7MdggD4xlAvwuO+X1zZFibXewJ5UncmUu9zdvGLrxM9gARqMZQPAmv/hoZN8nWUGVHfqHpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747240131; c=relaxed/simple;
	bh=XwpvdJj7/FvWWHGNfEpZ5k4PCCpLNXQ1N0RRVFxieuQ=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=GjgTNB93zWa9R7RPwQ4uIRwladSfJP8pFybPo3cBSk7ry/z2Dar86CXTv+bukDHkar5reQo8/81jX8eSRN37+emj1S699D6bdZJYqvXXMm9QvADUZ52T+uWRzkviBixXxPtSskwQutu5JnC61J7VQ6Y+g0uGQfzZq2E3E59rqlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MzerA7hm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93972C4CEE9;
	Wed, 14 May 2025 16:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747240131;
	bh=XwpvdJj7/FvWWHGNfEpZ5k4PCCpLNXQ1N0RRVFxieuQ=;
	h=From:To:Subject:Date:From;
	b=MzerA7hmXnTWXA0YHp2z8MTiAsbXU6kd30TJDfDgit2MIU/3CGTY+PtteLvtVbzFe
	 XJmQCZJFRBRGObdrr8ivkb/wr85JMqvslrpz1ABh2oZGaCk5cOCUxRprN2rNjjot/x
	 mIVOtg+/Iy3G5dg5nQD4dveg75JwGn1mQHgYrwqUBp+gkwIbCwvY5dApevTzyZNiAa
	 5g1/SLSd+RuJ1CZRdHPX6bNymOh3MHdafr8Eyn5HMhH81vaFk87D4uGYhoVB3lBJOS
	 PW1Ir+k5ESsgLFlH45k5ut6W9YFXJMTgqPkBgRSq5vq2EKWE/CCz5RjoZxDyEMS9xM
	 dnrx4dtoZaw3Q==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org,
	bettyzhou@google.com,
	ynaffit@google.com,
	tkjos@google.com,
	jacek.anaszewski@gmail.com,
	Pavel Machek <pavel@kernel.org>,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/5] leds: led-test: Move common LED class registration code into helper function
Date: Wed, 14 May 2025 17:27:52 +0100
Message-ID: <20250514162807.708010-1-lee@kernel.org>
X-Mailer: git-send-email 2.49.0.1045.g170613ef41-goog
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
2.49.0.1045.g170613ef41-goog


