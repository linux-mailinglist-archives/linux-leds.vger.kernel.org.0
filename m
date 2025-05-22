Return-Path: <linux-leds+bounces-4693-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 76000AC068E
	for <lists+linux-leds@lfdr.de>; Thu, 22 May 2025 10:07:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5ECC21662EC
	for <lists+linux-leds@lfdr.de>; Thu, 22 May 2025 08:07:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67F772620FC;
	Thu, 22 May 2025 08:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rt/1WSoO"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 403E62620F1;
	Thu, 22 May 2025 08:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747901240; cv=none; b=htUugMqfbH50ncSrkaI3dbHThGSuV2AVrmOcZjfea7nodQ2Z2XbGYDMwy0a+LN8ODQ/MrLhPr8cayvhye1CCQjG2H6UvGx9K8Io6el8dlkExz0AtjeJ+hKZt2EnnTOXOkbriVr0oPqyMSdMZkiHTDWYVYVcsBG+fyoduemqEihQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747901240; c=relaxed/simple;
	bh=KKLcPTErM5B81C/wQDuOlCeHvWVPECHHIK3oMc9gqX0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b82/PzVlIhoaUbF2XyB66IjX/TGA06uOd5hOSpuLj0faKM712RbNge9Eqc74C3Rq77nKefYba1XCTqAEtJJSzkTL4kRj43PgkxP7NSpPWOoPBaKiF3ZNmd9VBiFpstiBRpENKU0u4v6/+XpZUid4N1AA29Ck9HdoPhpEHdiZl1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rt/1WSoO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16463C4CEEA;
	Thu, 22 May 2025 08:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747901239;
	bh=KKLcPTErM5B81C/wQDuOlCeHvWVPECHHIK3oMc9gqX0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Rt/1WSoOD5oL+i1psnZRwFRnjcE0qLenLBVdqSofiUsmiAeX9CJJS301w742OONVU
	 XK7LuQcpcGR5xIJVffur8Ofb4Sn8C6ob63yZN7mUuNdjGuPkROCm9rvVloYM/2AbDL
	 Zyo8IaM5wnFaVoRWeR+S94qPDUWTaEpPxklu15KfeEWj1qKFkgozwrCJgB1iK9CR2g
	 H31rEn77CFWYbVHRczAatQXHAhwVH43MOQ5iU1BYqlYDt/8RlONrrzn39vg0ROKi7b
	 BDb/jixVf4d0qX2SyYsp1jE92vacRO5/WBrIQEBeE4CAaafX5SwOccU1HOy2ReLYcR
	 c995OJoQcp3gw==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org,
	Pavel Machek <pavel@kernel.org>,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: bettyzhou@google.com,
	ynaffit@google.com,
	tkjos@google.com,
	jacek.anaszewski@gmail.com
Subject: [PATCH v3 3/5] leds: led-test: Provide test for registration with missing devicename
Date: Thu, 22 May 2025 09:06:50 +0100
Message-ID: <20250522080656.1215457-3-lee@kernel.org>
X-Mailer: git-send-email 2.49.0.1143.g0be31eac6b-goog
In-Reply-To: <20250522080656.1215457-1-lee@kernel.org>
References: <20250522080656.1215457-1-lee@kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Insist on non-DT registration with init_data, but omit the devicename,
which should fail with an invalid argument error.

Signed-off-by: Lee Jones <lee@kernel.org>
Reviewed-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
---
 drivers/leds/led-test.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/leds/led-test.c b/drivers/leds/led-test.c
index 760c393f5c5d..d378c905546b 100644
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
+	ret = devm_led_classdev_register_ext(dev, cdev, &init_data);
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
2.49.0.1143.g0be31eac6b-goog


