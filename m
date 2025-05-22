Return-Path: <linux-leds+bounces-4692-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F0347AC068C
	for <lists+linux-leds@lfdr.de>; Thu, 22 May 2025 10:07:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 054763ACA7A
	for <lists+linux-leds@lfdr.de>; Thu, 22 May 2025 08:07:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 162CD2620E8;
	Thu, 22 May 2025 08:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QavLiKZB"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E04FE24C668;
	Thu, 22 May 2025 08:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747901240; cv=none; b=b+b4D3+WYIeAWemxt8hTDrlovENON32KZbngxSJelxjdCsnESlHCRfSiwsIJIcGlMO9Bovv7EAfypvcHgWgfQ+uw+OQfRAcaq4+avKPB7BfKc2ab/ZDVFiNIC462bKQAc4Fn6JqKoFJ8QOBt5MWNAua5roseHs347QgVMStQc1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747901240; c=relaxed/simple;
	bh=ReQyfORtliZOnPmpdjyz9VziDJLYath6ikkCRZAibrg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=odLJxabHPbH0roF8uaCRfqKLEWQEhh6dQXogSz3LjlK8kVb4CNMVS0mVsI9diDXW2PQC8zcR5zTNz/CFyPSzey+j87DeYKd6O9fu70Mk7X6CO5B+L0H901adZaeroM2eIPGACfN0dMQHjwesLAXD1DV4yZ4PrK8A0RzHfClcuwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QavLiKZB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2B5CC4CEED;
	Thu, 22 May 2025 08:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747901237;
	bh=ReQyfORtliZOnPmpdjyz9VziDJLYath6ikkCRZAibrg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QavLiKZBOBu41+PBal/K1HO9IoE1GoI0zAKpvHfUjLl2YZlsQOKyOeeQpl9zzoh5H
	 72sI0KEbdcv+S35NERPjxis5SWgnlDo7oAjFzyzUcgzABh/vfPYM4iHPV0tngcwZlB
	 GR9DjlT6QBXO7eGmvEd+kagFwOrRmAzFG53Ifu7Y4OrdovL+ZQ7rzMYmVafNE754hH
	 Oet/SqlqhAhXiDiiq0s0IdMh3HfwMwGN1DIdxXgBiu5bx/27fFz4PXHhBD70N9VZLf
	 dmehwpQrpF34/wvyJui1ws7EeAi+elWDr2OffFNILYFCSvwKit3cfUWQ/QvEkTbkUq
	 IVkPBZ50++Vlg==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org,
	Pavel Machek <pavel@kernel.org>,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: bettyzhou@google.com,
	ynaffit@google.com,
	tkjos@google.com,
	jacek.anaszewski@gmail.com
Subject: [PATCH v3 2/5] leds: led-test: Provide test for registration with missing default_label
Date: Thu, 22 May 2025 09:06:49 +0100
Message-ID: <20250522080656.1215457-2-lee@kernel.org>
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

Insist on non-DT registration with init_data, but omit the
default_label, which should fail with an invalid argument error.

Signed-off-by: Lee Jones <lee@kernel.org>
Reviewed-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
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
2.49.0.1143.g0be31eac6b-goog


