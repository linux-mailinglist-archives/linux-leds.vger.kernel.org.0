Return-Path: <linux-leds+bounces-4652-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 49DCBAB80C2
	for <lists+linux-leds@lfdr.de>; Thu, 15 May 2025 10:33:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3B3424E1B67
	for <lists+linux-leds@lfdr.de>; Thu, 15 May 2025 08:33:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D86C92882D5;
	Thu, 15 May 2025 08:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ClgWpF3/"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7879298244;
	Thu, 15 May 2025 08:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747297782; cv=none; b=DKzGP+NYFwMvSGs4yyWFMoXeEuintbDon80gmRBJ2ibxAwQXbEbBXed83vy8nP2CFfmHtigImJpruqHupog4UUVXw9x5aRYF5+8cSrDobW+Rj+VyBa2B+a98tbY3lKMiADUp46gfzmL+tVFLAq6tJhGNxpbQ7IJxBIQeJY6yL8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747297782; c=relaxed/simple;
	bh=NMawEyh1cP+zm+j6rRd9ARnVfG/D+EF3+jJuPMcV8Ys=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=opBPHFyLMu3yBH3CchVuxCM98F7DaWul+dnuLSbjNm5jW0I5jo9WKgXaV44S6iaRNT7ngozkzPWVbLkwOCMK5XTj2up69AwhDN4NPzibjPq7KYFUVwRnDFXt8GafdWX7GcIt7s0hwg07HPoGqRzxUNfFQTUIBwIgltlbi9de2kI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ClgWpF3/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7911CC4CEED;
	Thu, 15 May 2025 08:29:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747297781;
	bh=NMawEyh1cP+zm+j6rRd9ARnVfG/D+EF3+jJuPMcV8Ys=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ClgWpF3/KuzD6qd8TlTMSK6v6NlJCAsB660VbCnfMUhOx3RzbTN6KBLzM6IqorRN0
	 sCPLUcT+D+ShdIwQMo+VZ8/jEzeSBbGxKswGEGqFH3xIzEipQ23ioQ2WRXFeyK10Do
	 WPyqbpDZ4OBF8owYbmHjuf/UmDj0nCXvTVHvZZ0uziUAXBvGyFIQmfNq5y8Dz3kf0A
	 EC6J893W1yPV4jE5oGh19cbYauk4FmzIJ/RxSCD1MxmlJduN+MIGFe6MTV6JfRD5dN
	 wmOFgRaWljetXwXUfZPmoR/BaUcDVwOINwEGruaiCk+IFilMFsbhpr9Udvd+6c1cUX
	 0j8C1WB9wH1/g==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org,
	Pavel Machek <pavel@kernel.org>,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: bettyzhou@google.com,
	ynaffit@google.com,
	tkjos@google.com,
	jacek.anaszewski@gmail.com
Subject: [PATCH v2 4/5] leds: led-test: Provide test for registration with a name that is too long
Date: Thu, 15 May 2025 09:28:03 +0100
Message-ID: <20250515082830.800798-5-lee@kernel.org>
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

Insist on legacy (non-DT) registration and provide a default_label and
devicename that when concatenated together results in a device name that
is unacceptably long.

Signed-off-by: Lee Jones <lee@kernel.org>
---
 drivers/leds/led-test.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/leds/led-test.c b/drivers/leds/led-test.c
index d378c905546b..d5017c6dca08 100644
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
+	ret = devm_led_classdev_register_ext(dev, cdev, &init_data);
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
2.49.0.1101.gccaa498523-goog


