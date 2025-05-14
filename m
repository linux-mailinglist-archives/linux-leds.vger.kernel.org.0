Return-Path: <linux-leds+bounces-4638-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E145AB715B
	for <lists+linux-leds@lfdr.de>; Wed, 14 May 2025 18:29:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 59CAD162CC6
	for <lists+linux-leds@lfdr.de>; Wed, 14 May 2025 16:29:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 571F027B501;
	Wed, 14 May 2025 16:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="asKuXhhg"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E9691DF994;
	Wed, 14 May 2025 16:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747240135; cv=none; b=eC+pzZLDkwL3R4nVPfF5ThEZoZJvVjSW+GO6+BjmvZVIQo4UTAGkkxUm++T3ecNC/Gew3NoLxHFxHNcmpnxwCiWn5oaI393tucQFmKQ5sMpnkloq807CQV2XRGcYYoCG7ZcJWGgHDs1XOoZT+s1qKnpB3HysQ5h25hnef4jlgVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747240135; c=relaxed/simple;
	bh=3TE35hqTDVtiIk98kRy31bNG5xD/ZKIvkLUctYVIXN4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gVVFtP9kuvbAaUTDwMI+LufaHsgMBIScWxQhjuWh36+HWK9s6YBij+Ndtjb6f4nKyxyMfn/oaqe8ixszKiPuG7Llv24zWVuEy/b2+3SI0fAWnDln21BxZjZ/pa20fOnK4Rl9N2SPLGtLJxagzM254p8FmldJxrUoVIp2XOWSeTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=asKuXhhg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC10DC4CEE3;
	Wed, 14 May 2025 16:28:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747240133;
	bh=3TE35hqTDVtiIk98kRy31bNG5xD/ZKIvkLUctYVIXN4=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=asKuXhhgVCJdInbain9/JTZOEJFIxlRe50e0vPtncBmVOror3ZiL9SYfvUlLS+3gk
	 dDZQKZq/HJAjjlzu/k3ffqObXePaA5MbrfSGKegM1u/4NKQUphmsk2Rncn7WfXLiLS
	 cYbFJ+2HHrl3+au1k8qIuTExM3+ZIp6IZN3GeT5NasQ2D9fUgEy52aUeApgaGUSEVB
	 hJ2z86tj2ZfpEKXQuzgp04lv5+2NsjwRcTe5cGALEXS1OLsl7EUo15Tad3OsV355z9
	 qRF10Ak3mYm1xIWEGeGQHqHC/knDmtDhW0n7O7znr/7nZo4SIJuNTU4awaUMAi5B+9
	 dlgI9QBi97Dbw==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org,
	bettyzhou@google.com,
	ynaffit@google.com,
	tkjos@google.com,
	jacek.anaszewski@gmail.com,
	Pavel Machek <pavel@kernel.org>,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/5] leds: led-test: Provide test for registration with missing default_label
Date: Wed, 14 May 2025 17:27:53 +0100
Message-ID: <20250514162807.708010-2-lee@kernel.org>
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

Insist on legacy (non-DT) registration and omit the default_label, which
should fail with an invalid argument error.

Signed-off-by: Lee Jones <lee@kernel.org>
---
 drivers/leds/led-test.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/leds/led-test.c b/drivers/leds/led-test.c
index 0f152fb12dfb..27c8d13bd2e1 100644
--- a/drivers/leds/led-test.c
+++ b/drivers/leds/led-test.c
@@ -93,9 +93,25 @@ static void led_test_class_add_lookup_and_get(struct kunit *test)
 	led_remove_lookup(&lookup);
 }
 
+static void led_test_class_init_data_missing_default_label(struct kunit *test)
+{
+	struct led_test_ddata *ddata = test->priv;
+	struct led_classdev *cdev = &ddata->cdev;
+	struct device *dev = ddata->dev;
+	int ret;
+
+	struct led_init_data init_data = {
+		.devicename = "led-test-devicename",
+	};
+
+	ret = led_classdev_register_ext(dev, cdev, &init_data);
+	KUNIT_EXPECT_EQ(test, ret, -EINVAL);
+}
+
 static struct kunit_case led_test_cases[] = {
 	KUNIT_CASE(led_test_class_register),
 	KUNIT_CASE(led_test_class_add_lookup_and_get),
+	KUNIT_CASE(led_test_class_init_data_missing_default_label),
 	{ }
 };
 
-- 
2.49.0.1045.g170613ef41-goog


