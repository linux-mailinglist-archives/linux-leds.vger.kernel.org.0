Return-Path: <linux-leds+bounces-4650-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BEA8CAB80BE
	for <lists+linux-leds@lfdr.de>; Thu, 15 May 2025 10:32:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8B41F4E1A33
	for <lists+linux-leds@lfdr.de>; Thu, 15 May 2025 08:32:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BCFB2980C6;
	Thu, 15 May 2025 08:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pEFj6xOu"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3F6F288C80;
	Thu, 15 May 2025 08:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747297777; cv=none; b=Nf/1m5JC/RMZhKDWDUxPZGVWEzR+u7EetGUDybPKGPIgDwrrjYQla/Ku172ONI72uIG3XncsPqjfiw75/6b9hLv5eADnjJrhzEqibLyYAlaVES45enjwaKMAM+RKik2eYqbD9cb84KdP7vcuFyugg90NnlqLdMxmJ5V5lgeZCHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747297777; c=relaxed/simple;
	bh=C/ny+BNIPWcqRm+PTf4xhqG3xTGLDJv0F0ZAltq3x3U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rixEJD59zKcZGjcfZDzhtrY3xmCqLsuVyq+NYRiIqDed/xlJemfDqrDA3a5ioTtRXwqp55z5LczrjSZW2KNA3E0/fRGC15VVYk1bpl7e58m3YJF4qOo6ILD+CxA8O3CfcZlPb5XXwdXZ5opjRaQrLnnZdMLoFJH5rDj63FbTV+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pEFj6xOu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6325C4CEE7;
	Thu, 15 May 2025 08:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747297776;
	bh=C/ny+BNIPWcqRm+PTf4xhqG3xTGLDJv0F0ZAltq3x3U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pEFj6xOuvQSidx2R1B8jW1FsTZ4p00Lf/vRSCaofxlPnekiqUQrAnOkdkoiOVFAsJ
	 5QoP7UKd6RlFiLl/ycaiX06zhR43V44DFUlaLOb61Mtfk6W5cOA+KjguMAtWYebtNy
	 8spi2LOhnf09hzCelUPPiPta/dpC0PuGIhMdppxU3GYkNrz5oFlYIJzcc25u8S8Aua
	 FmMbpwIPy/AwQiC9KFIFytWuExw9/06ZuF0WjPImdyhdF76uHba8zNVV3Z5qMl6WwC
	 5UBQMIz+59gR0qEwSIig0rsSMAt0ROEJKJggdWwIw03RRFlmsRSP/pNywoccIcnA4p
	 MJWiMX50F1Z2Q==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org,
	Pavel Machek <pavel@kernel.org>,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: bettyzhou@google.com,
	ynaffit@google.com,
	tkjos@google.com,
	jacek.anaszewski@gmail.com
Subject: [PATCH v2 2/5] leds: led-test: Provide test for registration with missing default_label
Date: Thu, 15 May 2025 09:28:01 +0100
Message-ID: <20250515082830.800798-3-lee@kernel.org>
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

Insist on legacy (non-DT) registration and omit the default_label, which
should fail with an invalid argument error.

Signed-off-by: Lee Jones <lee@kernel.org>
---
 drivers/leds/led-test.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/leds/led-test.c b/drivers/leds/led-test.c
index 0f152fb12dfb..760c393f5c5d 100644
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
+	ret = devm_led_classdev_register_ext(dev, cdev, &init_data);
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
2.49.0.1101.gccaa498523-goog


