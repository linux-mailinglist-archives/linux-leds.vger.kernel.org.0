Return-Path: <linux-leds+bounces-4569-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E4331AA5C0A
	for <lists+linux-leds@lfdr.de>; Thu,  1 May 2025 10:19:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 54B5E4647EF
	for <lists+linux-leds@lfdr.de>; Thu,  1 May 2025 08:19:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E7BA26658B;
	Thu,  1 May 2025 08:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rnW7nMG0"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76F32265631;
	Thu,  1 May 2025 08:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746087573; cv=none; b=pAWcWfo9Xa9n6L5IpcUHzyTG3iOzBQR2apSso5g5XXWdzRH+6p34A/GBozn4pVcDAXvW8XZ6+VKJRFcvh4mtujpNYUOO+g9+cjMR7sD6ztPovdCawduCxT5tTUu5Z7bylQNbEpxJtlQU17HofJ36ZkHY9GEkfF0FyU4BIh4GKKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746087573; c=relaxed/simple;
	bh=0BH3ciCfuZ0knwyAOCd0nOJ6sgV/JlonC0enoP5+gn0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mUcpjsR46eAkXr7BkU4MjFJ+hwByNZ+Jgnr2vIkg1/mT5eEt1AupiAB3qDhl6GLCn0YzEjbsUncSzPzc1vNMnjyCkDI4WLn3RRu/jeGKiY0VmeW5dKL7jmebszFEO7byGc/GT0D43frqRVtPSwAGTMzTNVC6+WKUsr1pY/GzQzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rnW7nMG0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B7CEC4CEED;
	Thu,  1 May 2025 08:19:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746087572;
	bh=0BH3ciCfuZ0knwyAOCd0nOJ6sgV/JlonC0enoP5+gn0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rnW7nMG0AWHMcGYkAG+cmhO23kkBt5miwVyC37B6SZpcqPm6aYDFVfzkgrEQXtyzS
	 VdQt19PRlrTzC4mrA9OPLZ4vASXV29hODmAoOXcAVb7caw+MfRT4Ofl7o0UYgNO/N/
	 JzZc62wz5tN8l+xmFwlvUchMDvB8OqfIQRGVJXH0Iqxy8KK9Er4uX1lWx4u39rdXnM
	 Hjk4QrmqpMlCmcIx3sUawsBjIivni+Rby3nnR3K6LE8PkNgEUIcuJN1McPyBbBN2DP
	 uEIIKSWSBeKGHwd6p3dWnhJe6nnKI0yzjbr0MU7GzfYQi7Z5emWkuUAe+JCyiTabGm
	 pBeaaFRc2qxrA==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org,
	Pavel Machek <pavel@kernel.org>,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: bettyzhou@google.com,
	ynaffit@google.com,
	tkjos@google.com,
	jacek.anaszewski@gmail.com
Subject: [PATCH 3/3] leds: led-test: Provide tests for the lookup and get infrastructure
Date: Thu,  1 May 2025 09:19:13 +0100
Message-ID: <20250501081918.3621432-3-lee@kernel.org>
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

This API allows providers to offer an specific LED to be looked-up by a
consumer.  Consumers are then able to describe the aforementioned LED
and take a reference on it.

For convenience, we're testing both sides of the API in just one test
function here.  In reality, both the provider and the consumer would be
logistically orthogonal.

CMD:
  tools/testing/kunit/kunit.py run --kunitconfig drivers/leds

RESULTS:
  [16:38:57] Configuring KUnit Kernel ...
  [16:38:57] Building KUnit Kernel ...
  Populating config with:
  $ make ARCH=um O=.kunit olddefconfig
  Building with:
  $ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=20
  [16:39:02] Starting KUnit Kernel (1/1)...
  [16:39:02] ============================================================
  Running tests with:
  $ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
  [16:39:03] ===================== led (2 subtests) =====================
  [16:39:03] [PASSED] led_test_class_register
  [16:39:03] [PASSED] led_test_class_add_lookup_and_get
  [16:39:03] ======================= [PASSED] led =======================
  [16:39:03] ============================================================
  [16:39:03] Testing complete. Ran 2 tests: passed: 2
  [16:39:03] Elapsed time: 6.255s total, 0.001s configuring, 5.131s building, 1.106s running

Signed-off-by: Lee Jones <lee@kernel.org>
---
 drivers/leds/led-test.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/leds/led-test.c b/drivers/leds/led-test.c
index bc85e4513745..ddf9aa967a6a 100644
--- a/drivers/leds/led-test.c
+++ b/drivers/leds/led-test.c
@@ -57,8 +57,37 @@ static void led_test_class_register(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, ret, -EEXIST);
 }
 
+static void led_test_class_add_lookup_and_get(struct kunit *test)
+{
+	struct led_test_ddata *ddata = test->priv;
+	struct led_classdev *cdev = &ddata->cdev, *cdev_get;
+	struct device *dev = ddata->dev;
+	struct led_lookup_data lookup;
+	int ret;
+
+	/* First, register a LED class device */
+	cdev->name = "led-test";
+	ret = devm_led_classdev_register(dev, cdev);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	/* Then make the LED available for lookup */
+	lookup.provider = cdev->name;
+	lookup.dev_id = dev_name(dev);
+	lookup.con_id = "led-test-1";
+	led_add_lookup(&lookup);
+
+	/* Finally, attempt to look it up via the API - imagine this was an orthogonal driver */
+	cdev_get = devm_led_get(dev, "led-test-1");
+	KUNIT_ASSERT_FALSE(test, IS_ERR(cdev_get));
+
+	KUNIT_EXPECT_STREQ(test, cdev_get->name, cdev->name);
+
+	led_remove_lookup(&lookup);
+}
+
 static struct kunit_case led_test_cases[] = {
 	KUNIT_CASE(led_test_class_register),
+	KUNIT_CASE(led_test_class_add_lookup_and_get),
 	{ }
 };
 
-- 
2.49.0.906.g1f30a19c02-goog


