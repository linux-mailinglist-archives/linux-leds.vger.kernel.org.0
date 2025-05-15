Return-Path: <linux-leds+bounces-4653-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 664CEAB80D1
	for <lists+linux-leds@lfdr.de>; Thu, 15 May 2025 10:35:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7CD271BC10D5
	for <lists+linux-leds@lfdr.de>; Thu, 15 May 2025 08:33:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C981029826C;
	Thu, 15 May 2025 08:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QAJwup9F"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1D35298267;
	Thu, 15 May 2025 08:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747297783; cv=none; b=kzY/eiid/+suCO6lIOa43S3ffKaLv5XWIYb2nTnVg/dtoCdNL3SAhlP0rvftH8fX1snMp+dgHMI53BIbIqG5iF23Aze95LxRLEK8m/ImkqLn/SZlxZgZbpFMWtU2asp7ZoeqHABgpbkMpqlqSj5S3vLsDYQpAf/Yk1ItR3Xz/rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747297783; c=relaxed/simple;
	bh=XlzEAb7PToBb2K9/BeILyEoOT9WYVsQ9y421Y6PB1pU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TavySHD3BMxhPasoEG0ZjhZYAIHbZxLg7st4T78IILp2e6Z8Yodpn4/0ycgbiqosTVav9g49ctqMIUhy49ki07bcdXiYaDxRyPmcVP1Qn06msVjqyFJUWYnWNrzaJVNV+zsqDziilddzpUJu5A6YucOahDsXC8f1wMU3YUHBtPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QAJwup9F; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3F42C4CEEF;
	Thu, 15 May 2025 08:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747297783;
	bh=XlzEAb7PToBb2K9/BeILyEoOT9WYVsQ9y421Y6PB1pU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QAJwup9FonxkyT6thjXQcqmSNx1DmdB/bNS9y3dZScSSvTg44UikDnAv9nbm0Lhbn
	 YSIrAspfi0hRW4eYUbimoTfbd5q1fgenpCbrDRx10fGj0f9OnaPtjl+n6SWQf9500o
	 xQZe3y9nM0zg6KovWTOc1F/JXM7TgFJl6M4x9iiIwqVw77I/+Tj2tgcuq0WaWmjLlI
	 oC1mZ5EQ3jO20KXb7MYIDrwXV59/cJoRmeAHcl2DC1kIiKCN5wBzRKTRkH1Q1rI+ND
	 YMPo5MPxaNlmG8Qkeyer6hMvLDJNaR+dZWo9T/38Cc0nidJtTF0LwJilC9ghVtj91+
	 qZ0JT9/9EpOOA==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org,
	Pavel Machek <pavel@kernel.org>,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: bettyzhou@google.com,
	ynaffit@google.com,
	tkjos@google.com,
	jacek.anaszewski@gmail.com
Subject: [PATCH v2 5/5] leds: led-test: Provide test for successful registration using init_data
Date: Thu, 15 May 2025 09:28:04 +0100
Message-ID: <20250515082830.800798-6-lee@kernel.org>
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

This time both the default_label and devicename are provided such that
when concatenated together result in a device name that is acceptable.
In this case registration should succeed.

Signed-off-by: Lee Jones <lee@kernel.org>
---
 drivers/leds/led-test.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/leds/led-test.c b/drivers/leds/led-test.c
index d5017c6dca08..9bdebbe04462 100644
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
+	ret = devm_led_classdev_register_ext(dev, cdev, &init_data);
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
2.49.0.1101.gccaa498523-goog


