Return-Path: <linux-leds+bounces-5156-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 98BD0B14751
	for <lists+linux-leds@lfdr.de>; Tue, 29 Jul 2025 06:51:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C7C6C1AA0DC4
	for <lists+linux-leds@lfdr.de>; Tue, 29 Jul 2025 04:51:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6F0A21323C;
	Tue, 29 Jul 2025 04:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sL1OhUHt"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AD5A4A01;
	Tue, 29 Jul 2025 04:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753764687; cv=none; b=L3v1Gbi1jRd+P58+gNsp7TQVanjTUSiAw7UT4UbgPiSIksoMkGts+pOB9/n9HJvNDV2ALmWPqRrE6gg20NT5Dljcs38FA6kkHqQTHqw5O8jmpXAsnUtfHgIYkMmiUh57TBVb1+ZSBQFLeFum+5qWk6vwPe7+Rb6JfEpvGf7GM2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753764687; c=relaxed/simple;
	bh=cjeqSra3b1A1vbJsnaMuLQ3Inhk8Ki1dNA21mebRY+0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mY5OLzHdCmZpV+490sqIlWNtWMkGlLBlUXgAArhyxyMW76MYZWWK08f5K4gDYJ0fd43MC1U5faGEGbC6CssZN+Uzqi9FEeNV33YGt+sn4pWVAV/B9v96WP/IL+6voN8yvUT+5/yVKdVnoPucrAQvXYpSp+YBKGVpFzjNk2cYSl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sL1OhUHt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6AC1EC4CEF8;
	Tue, 29 Jul 2025 04:51:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753764687;
	bh=cjeqSra3b1A1vbJsnaMuLQ3Inhk8Ki1dNA21mebRY+0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=sL1OhUHtaAZEj/r+LETSqxQ3Y6n+/AT5PSJgctuTf3aPMRov3B27iGLECJkNHo8bx
	 J7BdN8N4PQOwlPlwncOgn+GWXxZuxkh5ZyfSIJwaRE74OYDtF7u1pmiF/VfiKXBs+w
	 YW2X2A1eu1lRzR0UgTNz5Vz6uu8pmKWVGQC79xMaxQzmS2hqK0DR0tNJXtNFQWAZFf
	 BJnte+kRBXP88ZPRb3cAHpw7tAPWJCwJmsbymoXmrKJNDjr7cuwGJY2+FOBOtE+1hh
	 UQT2Tenc2CUCdqitXwl5ICf5448G7GgOYhipFExnpiGVkL21mDs/KihSRzmqn5BOIf
	 ZHE8ODPkp6XqA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59C96C87FCA;
	Tue, 29 Jul 2025 04:51:27 +0000 (UTC)
From: Fenglin Wu via B4 Relay <devnull+fenglin.wu.oss.qualcomm.com@kernel.org>
Date: Tue, 29 Jul 2025 12:51:23 +0800
Subject: [PATCH v2 2/2] leds: flash: leds-qcom-flash: add a separate
 register map for PMI8998
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250729-fix-torch-clamp-issue-v2-2-9b83816437a3@oss.qualcomm.com>
References: <20250729-fix-torch-clamp-issue-v2-0-9b83816437a3@oss.qualcomm.com>
In-Reply-To: <20250729-fix-torch-clamp-issue-v2-0-9b83816437a3@oss.qualcomm.com>
To: kernel@oss.qualcomm.com, Lee Jones <lee@kernel.org>, 
 Pavel Machek <pavel@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>, 
 linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Fenglin Wu <fenglin.wu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753764686; l=2384;
 i=fenglin.wu@oss.qualcomm.com; s=20240327; h=from:subject:message-id;
 bh=veBh7fJK3dHgrg1LPo1zZL/xU/qWzZ1meNlhvMaeZoo=;
 b=RdUWZ3ghKPMCnmxWq1BYbZyTm0Tt42RiAfPEZBXbyyd+BWxxM1zpVbV41Z5o6N9jxhFo7cIlR
 5POYivvrf7HD8WauNaGHnXzcKyJ6NfJTI3cAZG57mR0ejlSrj6IUB15
X-Developer-Key: i=fenglin.wu@oss.qualcomm.com; a=ed25519;
 pk=BF8SA4IVDk8/EBCwlBehKtn2hp6kipuuAuDAHh9s+K4=
X-Endpoint-Received: by B4 Relay for fenglin.wu@oss.qualcomm.com/20240327
 with auth_id=406
X-Original-From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Reply-To: fenglin.wu@oss.qualcomm.com

From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>

The 3-channel flash module in PMI8998 has several registers different
than the others, such as: torch_clamp. Add different register fields
for it.

Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
---
 drivers/leds/flash/leds-qcom-flash.c | 25 ++++++++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/drivers/leds/flash/leds-qcom-flash.c b/drivers/leds/flash/leds-qcom-flash.c
index db7c2c743adc755244f387febce663738bf3c0bd..b03a6833e3e3a076980bfcb46d5bbde4f4183a19 100644
--- a/drivers/leds/flash/leds-qcom-flash.c
+++ b/drivers/leds/flash/leds-qcom-flash.c
@@ -118,6 +118,22 @@ enum {
 	REG_MAX_COUNT,
 };
 
+static const struct reg_field mvflash_3ch_pmi8998_regs[REG_MAX_COUNT] = {
+	[REG_STATUS1]		= REG_FIELD(0x08, 0, 5),
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
+	[REG_TORCH_CLAMP]	= REG_FIELD(0xea, 0, 6),
+};
+
 static const struct reg_field mvflash_3ch_regs[REG_MAX_COUNT] = {
 	[REG_STATUS1]		= REG_FIELD(0x08, 0, 7),
 	[REG_STATUS2]		= REG_FIELD(0x09, 0, 7),
@@ -862,13 +878,20 @@ static int qcom_flash_led_probe(struct platform_device *pdev)
 		return rc;
 	}
 
-	if (val == FLASH_SUBTYPE_3CH_PM8150_VAL || val == FLASH_SUBTYPE_3CH_PMI8998_VAL) {
+	if (val == FLASH_SUBTYPE_3CH_PM8150_VAL) {
 		flash_data->hw_type = QCOM_MVFLASH_3CH;
 		flash_data->max_channels = 3;
 		regs = devm_kmemdup(dev, mvflash_3ch_regs, sizeof(mvflash_3ch_regs),
 				    GFP_KERNEL);
 		if (!regs)
 			return -ENOMEM;
+	} else if (val == FLASH_SUBTYPE_3CH_PMI8998_VAL) {
+		flash_data->hw_type = QCOM_MVFLASH_3CH;
+		flash_data->max_channels = 3;
+		regs = devm_kmemdup(dev, mvflash_3ch_pmi8998_regs,
+				    sizeof(mvflash_3ch_pmi8998_regs), GFP_KERNEL);
+		if (!regs)
+			return -ENOMEM;
 	} else if (val == FLASH_SUBTYPE_4CH_VAL) {
 		flash_data->hw_type = QCOM_MVFLASH_4CH;
 		flash_data->max_channels = 4;

-- 
2.34.1



