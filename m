Return-Path: <linux-leds+bounces-4694-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EBD38AC0690
	for <lists+linux-leds@lfdr.de>; Thu, 22 May 2025 10:07:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 85AD47B5868
	for <lists+linux-leds@lfdr.de>; Thu, 22 May 2025 08:06:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6D52263C73;
	Thu, 22 May 2025 08:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZwcO/oda"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EAF4263C72;
	Thu, 22 May 2025 08:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747901242; cv=none; b=TXENEvvR3czzImNdsBLgKmYBPqE7zNMbojLs1QL+iHe8D0Fev+wak7tIUAvynrixmdFUg+3TaeRM8dFTZiKvMVL0c8EwN9QyMvYEqVuVRl6aclhTyvICrum0JMXPjbXqlxKhNxJ88+5Y3Fnmpbc5X6QoFfe9FzqfJaasz9I22AM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747901242; c=relaxed/simple;
	bh=NWBmZu+nCm/4qgTrLER4FFhv9gfe+enwC1LwBbCcO7w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HofDmGfqTKwitTQ0fPSD0ZM74LlbB/4lt4kld+E4mXqUCInXaJiFc5voLdl8+0ufPjnYD6rlSm1vdtFin80CAXYH+/ms0kbSHE0pRjQw/eiuwKccaXx5NvpY9ymWbdsMd+CW7OmgrXPPUnDlVQ9HXJEX5LjpdKrL4num1NXv21I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZwcO/oda; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AF27C4CEED;
	Thu, 22 May 2025 08:07:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747901242;
	bh=NWBmZu+nCm/4qgTrLER4FFhv9gfe+enwC1LwBbCcO7w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZwcO/odaOxPz/hB2ktCvOoZ72lJXXkb3Fet7PyURUwPlPyBRYLOt+ZYOkG05evgKy
	 B0sJy4apYiQclBHQKVf27MY4m/B/CrnfHCq/iDjs0o9Gc7kSZ02nKTRi1XVqDrumGE
	 +1a67OyNuEaG+LSrnnff1TzEw48jDcQOAOqQVdz3gZh9u0EkIkAHWwBsQ2qiYiLBAO
	 Kw7TaWsemazvNe6FBme51c+2/Hi/dhQ6LtDvoclhYGLf5G3jWVBlIDY+JT91KNK4SF
	 tZP6UA7RS4OQ/YZUVa9EnWsLNNoIJbcf8WmX1GR2iotNSoxmfK/+kgjWfjsjXU+IaG
	 whfORLp86HFlg==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org,
	Pavel Machek <pavel@kernel.org>,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: bettyzhou@google.com,
	ynaffit@google.com,
	tkjos@google.com,
	jacek.anaszewski@gmail.com
Subject: [PATCH v3 4/5] leds: led-test: Provide test for registration with a name that is too long
Date: Thu, 22 May 2025 09:06:51 +0100
Message-ID: <20250522080656.1215457-4-lee@kernel.org>
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

Insist on non-DT registration with init_data whilst providing a
default_label and devicename that when concatenated together results in
a device name that is unacceptably long.

Signed-off-by: Lee Jones <lee@kernel.org>
Reviewed-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
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
2.49.0.1143.g0be31eac6b-goog


