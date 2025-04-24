Return-Path: <linux-leds+bounces-4541-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 40957A9B163
	for <lists+linux-leds@lfdr.de>; Thu, 24 Apr 2025 16:46:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BE72E16DAAB
	for <lists+linux-leds@lfdr.de>; Thu, 24 Apr 2025 14:46:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BC42190477;
	Thu, 24 Apr 2025 14:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DGRnqjoZ"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12705146D6A;
	Thu, 24 Apr 2025 14:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745505960; cv=none; b=JqSz5rh4EJjiou6LLBrhCUxCpp1Dw1GUqkwacKIlJp1KTKOyn7w2Zg+xcYx8tEx8PBMwq4GJkqjWq9cGA+1bjGVVWzWoDrsPg+wCaho6ec1Mquea9ObGDhdeooWiKdK+KNCo1IPOa0rRxCa14aotYaf1QD0O/cRZiOlAcauqrrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745505960; c=relaxed/simple;
	bh=oF6ZNTQYzF5wP50g9xs0e8/oXcBOMKj3NPuH+sGnPZk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XF1dfujq04pXKYGJ3/M1z82H0M7JWiRq3fE8i/DJa643qUgo3yx28pIv0px4gqFvfOQSsTi0folIrrnLPtlrX0/X5b8l5/7SNUmg/RD6j7CtGivnrCAv58/6OLTJ+d/rDBaRQIppmnE+BTi9rqCZL8wh+Gdk+jQLsl3ItQ3EikA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DGRnqjoZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E980C4CEE3;
	Thu, 24 Apr 2025 14:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745505959;
	bh=oF6ZNTQYzF5wP50g9xs0e8/oXcBOMKj3NPuH+sGnPZk=;
	h=From:To:Cc:Subject:Date:From;
	b=DGRnqjoZ3tgw0kyQOhOioT+fKR+ls/DfAgNumGpln9wXAgnQCBKzrSqztS3VxDUtw
	 +yt0EacLoqHkbRHJ1O8PiZPtG1ZzC7TaJ+TvhES21W/rIPO5geU8yMw/XmoWdv2+lK
	 h/Iaw2/2+YQUGFh9C327y5kEs2BXHAi3COGdAxPUbxq12MHH3EdKu1PIEPidLyuuVk
	 7/eoAs+E7rkmj5/v5gt6ogeIDghxLbzE3dXf0sRpiUIFM+ZXOwmpPiCjpc1OBHmAsc
	 cIn6GhiyfUEOFGDSoM+tsWVJYMTvGf45jDFLa3sy5D/TuH+BUBVe9NJqVmb1q86/Do
	 p+qvj7K956Pbg==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org,
	Pavel Machek <pavel@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org
Cc: jacek.anaszewski@gmail.com
Subject: [PATCH 1/1] leds: Provide skeleton KUnit testing for the LEDs framework
Date: Thu, 24 Apr 2025 15:45:38 +0100
Message-ID: <20250424144544.1438584-1-lee@kernel.org>
X-Mailer: git-send-email 2.49.0.901.g37484f566f-goog
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Apply a very basic implementation of KUnit LED testing.

More tests / use-cases will be added steadily over time.

CMD:
  tools/testing/kunit/kunit.py run --kunitconfig drivers/leds

OUTPUT:
  [15:34:19] Configuring KUnit Kernel ...
  [15:34:19] Building KUnit Kernel ...
  Populating config with:
  $ make ARCH=um O=.kunit olddefconfig
  Building with:
  $ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=20
  [15:34:22] Starting KUnit Kernel (1/1)...
  [15:34:22] ============================================================
  Running tests with:
  $ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
  [15:34:23] ===================== led (1 subtest) ======================
  [15:34:23] [PASSED] led_test_class_register
  [15:34:23] ======================= [PASSED] led =======================
  [15:34:23] ============================================================
  [15:34:23] Testing complete. Ran 1 tests: passed: 1
  [15:34:23] Elapsed time: 4.268s total, 0.001s configuring, 3.048s building, 1.214s running

Signed-off-by: Lee Jones <lee@kernel.org>
---
 drivers/leds/.kunitconfig |  4 +++
 drivers/leds/Kconfig      |  7 ++++
 drivers/leds/Makefile     |  1 +
 drivers/leds/led-test.c   | 76 +++++++++++++++++++++++++++++++++++++++
 4 files changed, 88 insertions(+)
 create mode 100644 drivers/leds/.kunitconfig
 create mode 100644 drivers/leds/led-test.c

diff --git a/drivers/leds/.kunitconfig b/drivers/leds/.kunitconfig
new file mode 100644
index 000000000000..5180f77910a1
--- /dev/null
+++ b/drivers/leds/.kunitconfig
@@ -0,0 +1,4 @@
+CONFIG_KUNIT=y
+CONFIG_NEW_LEDS=y
+CONFIG_LEDS_CLASS=y
+CONFIG_LEDS_KUNIT_TEST=y
diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index a104cbb0a001..c3684b148f18 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -55,6 +55,13 @@ config LEDS_BRIGHTNESS_HW_CHANGED
 
 	  See Documentation/ABI/testing/sysfs-class-led for details.
 
+config LEDS_KUNIT_TEST
+	tristate "KUnit tests for LEDs"
+	depends on KUNIT && LEDS_CLASS
+	default KUNIT_ALL_TESTS
+	help
+	  Say Y here to enable KUnit testing for the LEDs framework.
+
 comment "LED drivers"
 
 config LEDS_88PM860X
diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
index 2f170d69dcbf..9a0333ec1a86 100644
--- a/drivers/leds/Makefile
+++ b/drivers/leds/Makefile
@@ -6,6 +6,7 @@ obj-$(CONFIG_LEDS_CLASS)		+= led-class.o
 obj-$(CONFIG_LEDS_CLASS_FLASH)		+= led-class-flash.o
 obj-$(CONFIG_LEDS_CLASS_MULTICOLOR)	+= led-class-multicolor.o
 obj-$(CONFIG_LEDS_TRIGGERS)		+= led-triggers.o
+obj-$(CONFIG_LEDS_KUNIT_TEST)		+= led-test.o
 
 # LED Platform Drivers (keep this sorted, M-| sort)
 obj-$(CONFIG_LEDS_88PM860X)		+= leds-88pm860x.o
diff --git a/drivers/leds/led-test.c b/drivers/leds/led-test.c
new file mode 100644
index 000000000000..068c9d0eb683
--- /dev/null
+++ b/drivers/leds/led-test.c
@@ -0,0 +1,76 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2025 Google LLC
+ *
+ * Author: Lee Jones <lee@kernel.org>
+ */
+
+#include <kunit/device.h>
+#include <kunit/test.h>
+#include <linux/device.h>
+#include <linux/leds.h>
+
+struct led_test_ddata {
+	struct led_classdev cdev;
+	struct device *dev;
+};
+
+static void led_test_class_register(struct kunit *test)
+{
+	struct led_test_ddata *ddata = test->priv;
+	struct led_classdev *cdev = &ddata->cdev;
+	struct device *dev = ddata->dev;
+	int ret;
+
+	cdev->name = "led-test";
+
+	ret = devm_led_classdev_register(dev, cdev);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+	if (ret)
+		return;
+}
+
+static struct kunit_case led_test_cases[] = {
+	KUNIT_CASE(led_test_class_register),
+	{ }
+};
+
+static int led_test_init(struct kunit *test)
+{
+	struct led_test_ddata *ddata;
+	struct device *dev;
+
+	ddata = kunit_kzalloc(test, sizeof(*ddata), GFP_KERNEL);
+	if (!ddata)
+		return -ENOMEM;
+
+	test->priv = ddata;
+
+	dev = kunit_device_register(test, "led_test");
+	if (IS_ERR(dev))
+		return PTR_ERR(dev);
+
+	ddata->dev = get_device(dev);
+
+	return 0;
+}
+
+static void led_test_exit(struct kunit *test)
+{
+	struct led_test_ddata *ddata = test->priv;
+
+	if (ddata && ddata->dev)
+		put_device(ddata->dev);
+}
+
+static struct kunit_suite led_test_suite = {
+	.name = "led",
+	.init = led_test_init,
+	.exit = led_test_exit,
+	.test_cases = led_test_cases,
+};
+kunit_test_suite(led_test_suite);
+
+MODULE_AUTHOR("Lee Jones <lee@kernel.org>");
+MODULE_DESCRIPTION("KUnit tests for the LED framework");
+MODULE_LICENSE("GPL");
-- 
2.49.0.901.g37484f566f-goog


