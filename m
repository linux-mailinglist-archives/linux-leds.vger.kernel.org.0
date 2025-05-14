Return-Path: <linux-leds+bounces-4640-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7402AAB715D
	for <lists+linux-leds@lfdr.de>; Wed, 14 May 2025 18:29:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3FC8D1885563
	for <lists+linux-leds@lfdr.de>; Wed, 14 May 2025 16:29:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08EC327FD45;
	Wed, 14 May 2025 16:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UuHprccX"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4E1527FB2B;
	Wed, 14 May 2025 16:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747240138; cv=none; b=cUmYkQMqNpW/VTvWaGNgAlvZXR6izXyVZwxpiNLBfMk7oXcx9Ahvd2rCY5nU9HfXzKDmTb2WDJNwVTcMtQKdkVUeHeCUzgVU+N3QyKlrXR/IRVs/vWXUh70CWJXabSRWNnwDChTiQAd8tSXgf6LKFytyPY/MRL2+VC5CEg/nyBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747240138; c=relaxed/simple;
	bh=cmM31LAa75nZJMCe8JZ+Zr9c30GPrpS490ZGzVPjfOk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G+XGbDUFhDNfGXGVONevXN0GThXJ/kIizLDbkL9sQQ2SQfDC7xk0bgwv9GALysJTN1yqyoEbtQQp60Y9lomhMnmwbwLRmfmU0aGZNxDngqF7veHRgXy6Qqto7wkFU++yx7+mEs2c52UkVT5DQYi/MCVqBrN0TyVcqubnji1gwBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UuHprccX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A80BCC4CEED;
	Wed, 14 May 2025 16:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747240138;
	bh=cmM31LAa75nZJMCe8JZ+Zr9c30GPrpS490ZGzVPjfOk=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=UuHprccXYlIej26h2GSqgWBkgvNNTsvYq6gd48QstggvLAu+dvBUILxz9/23EY8AO
	 yoOpHLMG60ZYbGWUGkzr7YJGvuy8y26IhebrPUniGy1nmbcgfC859VM37RglDw6SwR
	 JGrHfgJKXCLHNwrEA3MAHP9zab29OI1qnZcESjs+DHrn/G/V/C9MquckRVxSnP86J2
	 dPSOJGLkf/VK5yR2W2Pirlpmm4v3skgIhHQbmf/uefer69ixY9HcMpgLTzLx7BDLd1
	 N05tvI5vsas84i4ajsnQqZ7a3/WsSF4awUef6xtSb47T3ROvHusc0cRW1dmMAvufFl
	 EKNmumE+qJd5g==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org,
	bettyzhou@google.com,
	ynaffit@google.com,
	tkjos@google.com,
	jacek.anaszewski@gmail.com,
	Pavel Machek <pavel@kernel.org>,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/5] leds: led-test: Provide test for registration with a name that is too long
Date: Wed, 14 May 2025 17:27:55 +0100
Message-ID: <20250514162807.708010-4-lee@kernel.org>
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

Insist on legacy (non-DT) registration and provide a default_label and
devicename that when concatenated together results in a device name that
is unacceptably long.

Signed-off-by: Lee Jones <lee@kernel.org>
---
 drivers/leds/led-test.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/leds/led-test.c b/drivers/leds/led-test.c
index 3d71c7a23e21..741dc0269515 100644
--- a/drivers/leds/led-test.c
+++ b/drivers/leds/led-test.c
@@ -123,11 +123,28 @@ static void led_test_class_init_data_missing_devicename(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, ret, -EINVAL);
 }
 
+static void led_test_class_init_data_name_too_long(struct kunit *test)
+{
+	struct led_test_ddata *ddata = test->priv;
+	struct led_classdev *cdev = &ddata->cdev;
+	struct device *dev = ddata->dev;
+	int ret;
+
+	struct led_init_data init_data = {
+		.devicename = "led-test-devicename-very-long-names-fail",
+		.default_label = "led-test-label-also-very-long-names-fail",
+	};
+
+	ret = led_classdev_register_ext(dev, cdev, &init_data);
+	KUNIT_EXPECT_EQ(test, ret, -E2BIG);
+}
+
 static struct kunit_case led_test_cases[] = {
 	KUNIT_CASE(led_test_class_register),
 	KUNIT_CASE(led_test_class_add_lookup_and_get),
 	KUNIT_CASE(led_test_class_init_data_missing_default_label),
 	KUNIT_CASE(led_test_class_init_data_missing_devicename),
+	KUNIT_CASE(led_test_class_init_data_name_too_long),
 	{ }
 };
 
-- 
2.49.0.1045.g170613ef41-goog


