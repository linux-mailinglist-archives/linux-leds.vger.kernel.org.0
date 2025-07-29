Return-Path: <linux-leds+bounces-5157-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F0E6AB14752
	for <lists+linux-leds@lfdr.de>; Tue, 29 Jul 2025 06:51:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1A5A51AA0DA8
	for <lists+linux-leds@lfdr.de>; Tue, 29 Jul 2025 04:51:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E67D822AE76;
	Tue, 29 Jul 2025 04:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FM8vyNwC"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA5351DD0D4;
	Tue, 29 Jul 2025 04:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753764687; cv=none; b=iYYfVg2tFDbgu8RnABZqNWzpyMANoJ8yBdJu1j1aWZoPC4DnJMOlQv86z2byuyqlPILww3y3uw/gm3AUn0HoCgEDmz9teMwj9PQ2FOQjnLtIeqkhhPn3BIDs1pIZlq42vFpMhtqhgqAFhtGa5Qch+7L/3mwKknFJyjAsFUnzi0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753764687; c=relaxed/simple;
	bh=OQFXnvEMtBWVGYDn5R7enBvPUJwl4shicmIllfMRgn8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EVwf94AOIr2LlaBqOg1zelvxH67V2C/vcKSlWlbN6G3K7BN4ZGbUyGMEJTjwnP2Wv5K+AxE1f7GyMpnNzuV/6vm8uBvh1njU0cIgeeHf50fG8xIWB4LBb2NYfiuJMwuS8aKdLX9OL1X1h/cTdl+n4ZBHhbN4WabFBx54RZmc944=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FM8vyNwC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 64D6DC4CEF4;
	Tue, 29 Jul 2025 04:51:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753764687;
	bh=OQFXnvEMtBWVGYDn5R7enBvPUJwl4shicmIllfMRgn8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=FM8vyNwCT7Aide+GGwpEgUsm14DSuA2A0/IC0HgQ/TRHLXWZO2vq+jxVkgps9QHkh
	 puJxEmoq4uWZmCaHAuVuVujQ9B8hWGn9aDW+7VXu7rz2nBkLDHWs0OEq/fbw736ddN
	 ttiRIkX1oYUwNR2AFh7v2mR0wXj5XpYztCco+PdnqGdIwtGmGjDQPwmsrZm6SCkCta
	 yR/aOYf8nSp49OPZYKv4uPFT1Zl+zIBPpTGM+B/TxUDk9YT5MZA9lnvx60X7mErXlX
	 O9pSzJ6SGOs3E8APHmmY9IL4MeS8wHWRwoIB5rXpHJ18NX6loDCYztYhzfweyolyaS
	 3XvovhBrDSZgQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CF74C83F26;
	Tue, 29 Jul 2025 04:51:27 +0000 (UTC)
From: Fenglin Wu via B4 Relay <devnull+fenglin.wu.oss.qualcomm.com@kernel.org>
Date: Tue, 29 Jul 2025 12:51:22 +0800
Subject: [PATCH v2 1/2] leds: flash: leds-qcom-flash: update torch current
 clamp setting
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250729-fix-torch-clamp-issue-v2-1-9b83816437a3@oss.qualcomm.com>
References: <20250729-fix-torch-clamp-issue-v2-0-9b83816437a3@oss.qualcomm.com>
In-Reply-To: <20250729-fix-torch-clamp-issue-v2-0-9b83816437a3@oss.qualcomm.com>
To: kernel@oss.qualcomm.com, Lee Jones <lee@kernel.org>, 
 Pavel Machek <pavel@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>, 
 linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Fenglin Wu <fenglin.wu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753764686; l=5090;
 i=fenglin.wu@oss.qualcomm.com; s=20240327; h=from:subject:message-id;
 bh=snJpp7kKLVN9645UzePQuhIOL/EObRQyAzwlXq/N50o=;
 b=Ny18tnn6Yg9NSuvFQ+Lh42MNhqG44TFPz5X6LxFn6CNTQe8koFscHzs9LSMaJKuDhQoji1MsR
 odjvS0lyZ7QDUOIrSlGeSx5r8HGv9A6OAcF5egvQIIGp6+IlqHlRrXb
X-Developer-Key: i=fenglin.wu@oss.qualcomm.com; a=ed25519;
 pk=BF8SA4IVDk8/EBCwlBehKtn2hp6kipuuAuDAHh9s+K4=
X-Endpoint-Received: by B4 Relay for fenglin.wu@oss.qualcomm.com/20240327
 with auth_id=406
X-Original-From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Reply-To: fenglin.wu@oss.qualcomm.com

From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>

There is a register to clamp the flash current per LED channel when
safety timer is disabled. It needs to be updated according to the
maximum torch LED current setting to ensure the torch current won't
be clamped unexpectedly.

Fixes: 96a2e242a5dc ("leds: flash: Add driver to support flash LED module in QCOM PMICs")
Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
---
 drivers/leds/flash/leds-qcom-flash.c | 62 +++++++++++++++++++++---------------
 1 file changed, 36 insertions(+), 26 deletions(-)

diff --git a/drivers/leds/flash/leds-qcom-flash.c b/drivers/leds/flash/leds-qcom-flash.c
index 89cf5120f5d55bbb7e24faa8c3a946416f8fed46..db7c2c743adc755244f387febce663738bf3c0bd 100644
--- a/drivers/leds/flash/leds-qcom-flash.c
+++ b/drivers/leds/flash/leds-qcom-flash.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (c) 2022, 2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2022, 2024-2025 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
 #include <linux/bitfield.h>
@@ -114,36 +114,39 @@ enum {
 	REG_THERM_THRSH1,
 	REG_THERM_THRSH2,
 	REG_THERM_THRSH3,
+	REG_TORCH_CLAMP,
 	REG_MAX_COUNT,
 };
 
 static const struct reg_field mvflash_3ch_regs[REG_MAX_COUNT] = {
-	REG_FIELD(0x08, 0, 7),			/* status1	*/
-	REG_FIELD(0x09, 0, 7),                  /* status2	*/
-	REG_FIELD(0x0a, 0, 7),                  /* status3	*/
-	REG_FIELD_ID(0x40, 0, 7, 3, 1),         /* chan_timer	*/
-	REG_FIELD_ID(0x43, 0, 6, 3, 1),         /* itarget	*/
-	REG_FIELD(0x46, 7, 7),                  /* module_en	*/
-	REG_FIELD(0x47, 0, 5),                  /* iresolution	*/
-	REG_FIELD_ID(0x49, 0, 2, 3, 1),         /* chan_strobe	*/
-	REG_FIELD(0x4c, 0, 2),                  /* chan_en	*/
-	REG_FIELD(0x56, 0, 2),			/* therm_thrsh1 */
-	REG_FIELD(0x57, 0, 2),			/* therm_thrsh2 */
-	REG_FIELD(0x58, 0, 2),			/* therm_thrsh3 */
+	[REG_STATUS1]		= REG_FIELD(0x08, 0, 7),
+	[REG_STATUS2]		= REG_FIELD(0x09, 0, 7),
+	[REG_STATUS3]		= REG_FIELD(0x0a, 0, 7),
+	[REG_CHAN_TIMER]	= REG_FIELD_ID(0x40, 0, 7, 3, 1),
+	[REG_ITARGET]		= REG_FIELD_ID(0x43, 0, 6, 3, 1),
+	[REG_MODULE_EN]		= REG_FIELD(0x46, 7, 7),
+	[REG_IRESOLUTION]	= REG_FIELD(0x47, 0, 5),
+	[REG_CHAN_STROBE]	= REG_FIELD_ID(0x49, 0, 2, 3, 1),
+	[REG_CHAN_EN]		= REG_FIELD(0x4c, 0, 2),
+	[REG_THERM_THRSH1]	= REG_FIELD(0x56, 0, 2),
+	[REG_THERM_THRSH2]	= REG_FIELD(0x57, 0, 2),
+	[REG_THERM_THRSH3]	= REG_FIELD(0x58, 0, 2),
+	[REG_TORCH_CLAMP]	= REG_FIELD(0xec, 0, 6),
 };
 
 static const struct reg_field mvflash_4ch_regs[REG_MAX_COUNT] = {
-	REG_FIELD(0x06, 0, 7),			/* status1	*/
-	REG_FIELD(0x07, 0, 6),			/* status2	*/
-	REG_FIELD(0x09, 0, 7),			/* status3	*/
-	REG_FIELD_ID(0x3e, 0, 7, 4, 1),		/* chan_timer	*/
-	REG_FIELD_ID(0x42, 0, 6, 4, 1),		/* itarget	*/
-	REG_FIELD(0x46, 7, 7),			/* module_en	*/
-	REG_FIELD(0x49, 0, 3),			/* iresolution	*/
-	REG_FIELD_ID(0x4a, 0, 6, 4, 1),		/* chan_strobe	*/
-	REG_FIELD(0x4e, 0, 3),			/* chan_en	*/
-	REG_FIELD(0x7a, 0, 2),			/* therm_thrsh1 */
-	REG_FIELD(0x78, 0, 2),			/* therm_thrsh2 */
+	[REG_STATUS1]		= REG_FIELD(0x06, 0, 7),
+	[REG_STATUS2]		= REG_FIELD(0x07, 0, 6),
+	[REG_STATUS3]		= REG_FIELD(0x09, 0, 7),
+	[REG_CHAN_TIMER]	= REG_FIELD_ID(0x3e, 0, 7, 4, 1),
+	[REG_ITARGET]		= REG_FIELD_ID(0x42, 0, 6, 4, 1),
+	[REG_MODULE_EN]		= REG_FIELD(0x46, 7, 7),
+	[REG_IRESOLUTION]	= REG_FIELD(0x49, 0, 3),
+	[REG_CHAN_STROBE]	= REG_FIELD_ID(0x4a, 0, 6, 4, 1),
+	[REG_CHAN_EN]		= REG_FIELD(0x4e, 0, 3),
+	[REG_THERM_THRSH1]	= REG_FIELD(0x7a, 0, 2),
+	[REG_THERM_THRSH2]	= REG_FIELD(0x78, 0, 2),
+	[REG_TORCH_CLAMP]	= REG_FIELD(0xed, 0, 6),
 };
 
 struct qcom_flash_data {
@@ -156,6 +159,7 @@ struct qcom_flash_data {
 	u8			max_channels;
 	u8			chan_en_bits;
 	u8			revision;
+	u8			torch_clamp;
 };
 
 struct qcom_flash_led {
@@ -702,6 +706,7 @@ static int qcom_flash_register_led_device(struct device *dev,
 	u32 current_ua, timeout_us;
 	u32 channels[4];
 	int i, rc, count;
+	u8 torch_clamp;
 
 	count = fwnode_property_count_u32(node, "led-sources");
 	if (count <= 0) {
@@ -751,6 +756,12 @@ static int qcom_flash_register_led_device(struct device *dev,
 	current_ua = min_t(u32, current_ua, TORCH_CURRENT_MAX_UA * led->chan_count);
 	led->max_torch_current_ma = current_ua / UA_PER_MA;
 
+	torch_clamp = (current_ua / led->chan_count) / TORCH_IRES_UA;
+	if (torch_clamp != 0)
+		torch_clamp--;
+
+	flash_data->torch_clamp = max_t(u8, flash_data->torch_clamp, torch_clamp);
+
 	if (fwnode_property_present(node, "flash-max-microamp")) {
 		flash->led_cdev.flags |= LED_DEV_CAP_FLASH;
 
@@ -917,8 +928,7 @@ static int qcom_flash_led_probe(struct platform_device *pdev)
 		flash_data->leds_count++;
 	}
 
-	return 0;
-
+	return regmap_field_write(flash_data->r_fields[REG_TORCH_CLAMP], flash_data->torch_clamp);
 release:
 	while (flash_data->v4l2_flash[flash_data->leds_count] && flash_data->leds_count)
 		v4l2_flash_release(flash_data->v4l2_flash[flash_data->leds_count--]);

-- 
2.34.1



