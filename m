Return-Path: <linux-leds+bounces-4639-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EF3BAB7159
	for <lists+linux-leds@lfdr.de>; Wed, 14 May 2025 18:29:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 19D6E1884A38
	for <lists+linux-leds@lfdr.de>; Wed, 14 May 2025 16:29:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2E0B27E1C3;
	Wed, 14 May 2025 16:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xp/z8pLE"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 790B927CCF6;
	Wed, 14 May 2025 16:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747240136; cv=none; b=GfJpPglNcqbiFny4V8S3MQMEKNB5YR8+L0ZP0tlLBxiv6rD/pLnDLBU25HNwTDLyplEYYWKzK9qGecjKQyPmVEyH1DX8N490VpqdHqmkId3d/1hYEbfxc/J5KzWg3ArOBQKir1opfsxeIyLEtOvx1Wv0sdKU2XFAu469Q/E45ME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747240136; c=relaxed/simple;
	bh=1/ch9q2arJV7wR9O5cQaSNVKk844AHl2YzhHV/R+8y0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=isc4EIS2496WOxdiguAPxvgBgZCQkp3zBmzYKC8fWpFHqzwltvpIs+gQEmEJjfTfnq777cz2QbH7R7T+z8mFSkvgjmJUsDT4W9np64E9tcGlUuZz6FBTNnI0/Aek5Hqn7eI7mBBxwxaoQwVbGggh5aZCTkzlssD9VBhBU2Hxs24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xp/z8pLE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51A78C4CEED;
	Wed, 14 May 2025 16:28:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747240136;
	bh=1/ch9q2arJV7wR9O5cQaSNVKk844AHl2YzhHV/R+8y0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Xp/z8pLE6ANZbQ8gc1QFoPtM9MDU4stcY1holVPgYx3hs22ErK06tHLhZ5RNJZQZo
	 pnoY2EngYRh9aj8WK56zeSmnEG3Yy18VYIcsp7LvpkUmseXeLIyRe3njJaOE1pf0it
	 I66ddJhkY0hATO9QQBesV8dgt9+ldbFAh+KZjtYI+FqVrdkAcyaum6VvwpUlXtTvrW
	 QF5XqGitf9Q6lphBf4T2ySgd01tnfyWevDCwteRa1u+1dHEuEKE5iYBw78DuKdFJQ7
	 Le/qjlHLfzZJNaGrojAOW+0wpZYmMj3EGiiLuQhRmW7kDHb8V6MRI4UWBqbGEGSzLf
	 3nbA1hGklyWfA==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org,
	bettyzhou@google.com,
	ynaffit@google.com,
	tkjos@google.com,
	jacek.anaszewski@gmail.com,
	Pavel Machek <pavel@kernel.org>,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/5] leds: led-test: Provide test for registration with missing devicename
Date: Wed, 14 May 2025 17:27:54 +0100
Message-ID: <20250514162807.708010-3-lee@kernel.org>
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

Insist on legacy (non-DT) registration and omit the devicename, which
should fail with an invalid argument error.

Signed-off-by: Lee Jones <lee@kernel.org>
---
 drivers/leds/led-test.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/leds/led-test.c b/drivers/leds/led-test.c
index 27c8d13bd2e1..3d71c7a23e21 100644
--- a/drivers/leds/led-test.c
+++ b/drivers/leds/led-test.c
@@ -108,10 +108,26 @@ static void led_test_class_init_data_missing_default_label(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, ret, -EINVAL);
 }
 
+static void led_test_class_init_data_missing_devicename(struct kunit *test)
+{
+	struct led_test_ddata *ddata = test->priv;
+	struct led_classdev *cdev = &ddata->cdev;
+	struct device *dev = ddata->dev;
+	int ret;
+
+	struct led_init_data init_data = {
+		.default_label = "led-test-label",
+	};
+
+	ret = led_classdev_register_ext(dev, cdev, &init_data);
+	KUNIT_EXPECT_EQ(test, ret, -EINVAL);
+}
+
 static struct kunit_case led_test_cases[] = {
 	KUNIT_CASE(led_test_class_register),
 	KUNIT_CASE(led_test_class_add_lookup_and_get),
 	KUNIT_CASE(led_test_class_init_data_missing_default_label),
+	KUNIT_CASE(led_test_class_init_data_missing_devicename),
 	{ }
 };
 
-- 
2.49.0.1045.g170613ef41-goog


