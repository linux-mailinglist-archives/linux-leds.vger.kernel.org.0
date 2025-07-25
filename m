Return-Path: <linux-leds+bounces-5126-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DC51B11B88
	for <lists+linux-leds@lfdr.de>; Fri, 25 Jul 2025 12:04:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 897E21CE26BC
	for <lists+linux-leds@lfdr.de>; Fri, 25 Jul 2025 10:04:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E1122D6611;
	Fri, 25 Jul 2025 10:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Eg66sTna"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26A682D6412;
	Fri, 25 Jul 2025 10:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753437859; cv=none; b=GaZyGY84wJlSil+AW66FNP2Z0F9I/wGq9TFI8bhu7Pa9z0Jg4KsGMouGiBRPA/ZtS26bONLlAxSJoRcIzQmTWG826/goONov8HEVrb+wOtieIWjdDkr4sqSY2xeQQCaBIThe+mlYxNGv0/NDDhm0gengG5vIyDny4x3NV4cMBlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753437859; c=relaxed/simple;
	bh=6bWWiC2YbBfgnkT1i6jFvQwqcRzI6nEvksUFy1ZFZPg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=R4eafDIJS8IsZgv6tw3Qd4MNA2VrJ1dsexmRrNtSwQz8ROZ0ZW9z1iBSgSQNfJKs8R5U8fjYMbyO7W/bHjO4D9vhL6g1VUSnBeBVmIKi3uW448aDbghvk8+/r2xeIbyoTfFQ9zbuKv7X0pPyvGeuKrjsElLWo8dETv94rJTqDKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Eg66sTna; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id B2027C4CEEF;
	Fri, 25 Jul 2025 10:04:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753437857;
	bh=6bWWiC2YbBfgnkT1i6jFvQwqcRzI6nEvksUFy1ZFZPg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Eg66sTnaYrWG6LFJ63Mb1KUaHfHVesONtUbqHnWtfi1CniDo0FU2TBZb0edMt17P4
	 24U5Rl5VvSkrSJevpgMl+cxFPSJBMBEMXjJ8Fp6xLCMFywYYVQb3W45OJoLVmW2tv2
	 Eo5YmOP4qVkhEQJkvly+Yigw8YiBL6uQdhKB2kQ6JY68v1Vuzpp5YAzfMxMMA8e8dF
	 xY1scsBtHm8Xb8iTzHTB/AElhXMHq2x2/oxMYC8PvbZM2EqLZPlbBfC/+V8ta9iW6C
	 mzvmKrMrDyBHKzzH4/RRf9mG5SW6qwp6XyCjbXjiYAMOVYdXHehe4oIgEMzfmcV+Ue
	 TH/6xNGmdee5A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E4E0C83F26;
	Fri, 25 Jul 2025 10:04:17 +0000 (UTC)
From: Fenglin Wu via B4 Relay <devnull+fenglin.wu.oss.qualcomm.com@kernel.org>
Date: Fri, 25 Jul 2025 18:04:04 +0800
Subject: [PATCH 2/2] leds: flash: leds-qcom-flash: add a separate register
 map for PMI8998
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250725-fix-torch-clamp-issue-v1-2-4cf3ebaa4c67@oss.qualcomm.com>
References: <20250725-fix-torch-clamp-issue-v1-0-4cf3ebaa4c67@oss.qualcomm.com>
In-Reply-To: <20250725-fix-torch-clamp-issue-v1-0-4cf3ebaa4c67@oss.qualcomm.com>
To: kernel@oss.qualcomm.com, Lee Jones <lee@kernel.org>, 
 Pavel Machek <pavel@kernel.org>, Fenglin Wu <quic_fenglinw@quicinc.com>
Cc: Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>, 
 linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Fenglin Wu <fenglin.wu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753437856; l=2388;
 i=fenglin.wu@oss.qualcomm.com; s=20240327; h=from:subject:message-id;
 bh=apUF2dH/Mll13q6/mMcrFJ2TYLuscFy4mzUCJJ0pxQU=;
 b=/Pv9fB6kxS8Qb1XuKdnLLN5YWv3jJq9NW8gfeSe5ZJrha8fsNAvd3wefCoyUgX8OVMCGTOZmy
 FZaOiwx0RxTD5nrsgRpmUx8wqJBPtFLHXtCOlHR3Og7NnTaZQCtqeWH
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
index 9c2e41cfddcf2d50d5a633cb157084371a631d74..2554ef7bcae6bc8f66edbffc7c885a9386b263ad 100644
--- a/drivers/leds/flash/leds-qcom-flash.c
+++ b/drivers/leds/flash/leds-qcom-flash.c
@@ -118,6 +118,22 @@ enum {
 	REG_MAX_COUNT,
 };
 
+static const struct reg_field mvflash_3ch_pmi8998_regs[REG_MAX_COUNT] = {
+	REG_FIELD(0x08, 0, 7),			/* status1	*/
+	REG_FIELD(0x09, 0, 7),			/* status2	*/
+	REG_FIELD(0x0a, 0, 7),			/* status3	*/
+	REG_FIELD_ID(0x40, 0, 7, 3, 1),		/* chan_timer	*/
+	REG_FIELD_ID(0x43, 0, 6, 3, 1),		/* itarget	*/
+	REG_FIELD(0x46, 7, 7),			/* module_en	*/
+	REG_FIELD(0x47, 0, 5),			/* iresolution	*/
+	REG_FIELD_ID(0x49, 0, 2, 3, 1),		/* chan_strobe	*/
+	REG_FIELD(0x4c, 0, 2),			/* chan_en	*/
+	REG_FIELD(0xea, 0, 6),			/* torch_clamp	*/
+	REG_FIELD(0x56, 0, 2),			/* therm_thrsh1 */
+	REG_FIELD(0x57, 0, 2),			/* therm_thrsh2 */
+	REG_FIELD(0x58, 0, 2),			/* therm_thrsh3 */
+};
+
 static const struct reg_field mvflash_3ch_regs[REG_MAX_COUNT] = {
 	REG_FIELD(0x08, 0, 7),			/* status1	*/
 	REG_FIELD(0x09, 0, 7),                  /* status2	*/
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



