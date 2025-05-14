Return-Path: <linux-leds+bounces-4641-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D8BE6AB715F
	for <lists+linux-leds@lfdr.de>; Wed, 14 May 2025 18:29:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A3DF318844B5
	for <lists+linux-leds@lfdr.de>; Wed, 14 May 2025 16:29:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65970280323;
	Wed, 14 May 2025 16:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DSZq0tSq"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DB0128031A;
	Wed, 14 May 2025 16:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747240141; cv=none; b=P9yAjDmwldH9t1FXV4ky6s4Mb4z8Z2jY8k4Ldz2IhlPcLlJHO4ckfZceaw/Sv26VdszwK68uw3jJfui+q4ftUMtRz7SO8WVktWmzoX8rh2zBY6cah7lD9KzioTGcLvkU8/cyJm7B3kiYkpwoKkAlQsYkRxtEg4ZF93PEbg77wVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747240141; c=relaxed/simple;
	bh=Gr24NwIpvXUdDA6goxGK/Y2r676Txw/MJuwGccnCO3c=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UQPg3ZmiHCvYn3BsPuo3tm95q0ar8pUrh1DSvF4nzQa6AwgsK8qORxm7Q1BAuAGvAUabAv4kfkvexaaozNYttdjQayol8Jb4yP1wHCktC20zkJkEFBe0jsgWCw1UH3pVjLO5SGsDRDUvaXdIlHWRlJXTZRk4F6OAaSznQO5OQbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DSZq0tSq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09EB4C4CEE9;
	Wed, 14 May 2025 16:28:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747240140;
	bh=Gr24NwIpvXUdDA6goxGK/Y2r676Txw/MJuwGccnCO3c=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=DSZq0tSqAwR67zb2bAv/Cr/E+d22nRNFcaglwdd28aYp4yIJxnJtVqfkW6iULIzD/
	 7pq+mQU/Nyzy6iYF6SG87vuK5IMEq1h0iSOUo6PI6ZjtNLB8/wlVfTWYzePQOJxTFJ
	 6Ev1j3/6iQ/aZuiaIcwdYYmX9ANHI7qCIrLJEEgd7mTGwqzlDevX+iYItBix3x2ga3
	 A1viVPy679GYjMLo0qbDWoUNYKbwKuS9Qwthi+J1jr6lUp03ChOfHDyGQkG/g4XYQ0
	 8F60NbN7tkzwZxnWBVXm1rCNkzWcpNtLyRCa55Hq1JQkCuO8ErBg4jafgC8wgxsyC2
	 vqpa4KmnqaYwQ==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org,
	bettyzhou@google.com,
	ynaffit@google.com,
	tkjos@google.com,
	jacek.anaszewski@gmail.com,
	Pavel Machek <pavel@kernel.org>,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 5/5] leds: led-test: Provide test for successful registration using init_data
Date: Wed, 14 May 2025 17:27:56 +0100
Message-ID: <20250514162807.708010-5-lee@kernel.org>
X-Mailer: git-send-email 2.49.0.1045.g170613ef41-goog
In-Reply-To: <20250514162807.708010-1-lee@kernel.org>
References: <20250514162807.708010-1-lee@kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This time both the default_label and devicename are provided such that
when concatenated together result in a device name that is acceptable.
In this case registration should succeed.

Signed-off-by: Lee Jones <lee@kernel.org>
---
 drivers/leds/led-test.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/leds/led-test.c b/drivers/leds/led-test.c
index 741dc0269515..123e1feb835e 100644
--- a/drivers/leds/led-test.c
+++ b/drivers/leds/led-test.c
@@ -139,12 +139,29 @@ static void led_test_class_init_data_name_too_long(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, ret, -E2BIG);
 }
 
+static void led_test_class_init_data(struct kunit *test)
+{
+	struct led_test_ddata *ddata = test->priv;
+	struct led_classdev *cdev = &ddata->cdev;
+	struct device *dev = ddata->dev;
+	int ret;
+
+	struct led_init_data init_data = {
+		.devicename = "led-test-devicename",
+		.default_label = "led-test-label",
+	};
+
+	ret = led_classdev_register_ext(dev, cdev, &init_data);
+	KUNIT_EXPECT_EQ(test, ret, 0);
+}
+
 static struct kunit_case led_test_cases[] = {
 	KUNIT_CASE(led_test_class_register),
 	KUNIT_CASE(led_test_class_add_lookup_and_get),
 	KUNIT_CASE(led_test_class_init_data_missing_default_label),
 	KUNIT_CASE(led_test_class_init_data_missing_devicename),
 	KUNIT_CASE(led_test_class_init_data_name_too_long),
+	KUNIT_CASE(led_test_class_init_data),
 	{ }
 };
 
-- 
2.49.0.1045.g170613ef41-goog


