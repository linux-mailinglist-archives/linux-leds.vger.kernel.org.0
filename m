Return-Path: <linux-leds+bounces-2193-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E3C2192833E
	for <lists+linux-leds@lfdr.de>; Fri,  5 Jul 2024 09:55:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5B53D1F24AF1
	for <lists+linux-leds@lfdr.de>; Fri,  5 Jul 2024 07:55:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7211143C57;
	Fri,  5 Jul 2024 07:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ijzCUUj+"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6D7A14535B;
	Fri,  5 Jul 2024 07:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720166120; cv=none; b=OocITQ0epHAXLCsILdVIGQxhOBqa/pRo6GDLI51u+niYHBMinxRu+WiHyPVeGu1OjlEEyurCDteKbIHxtQAPFppU/Yxr9J8n5UpCgeBp4wZF3QVahtkkEY2dEeAil+cTQOT285k5QsZiNvQRG9SqLCSqJ5Y33r3lFMuYaZtx39s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720166120; c=relaxed/simple;
	bh=KN8F1nt8AD3aqoQabFOV4no+F/B2FV8No4AUyjiOzbk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=GCWZX+ZqTlkbsVaOcFTOykEk2Qne7DAN6eLsqvEI2ei2SU6RTxW4WLXF76sG+jM2P5SyBW6YLaDrquVO8WlZMKMgqLhAE7PAKW1pfefXtTicG7APo+TnLprGsXpafyOHuHJEYOZ6ynDjavEDZ9It2UgrWoNnl5BRXD9wvtM0cBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ijzCUUj+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6D5FEC4AF07;
	Fri,  5 Jul 2024 07:55:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720166120;
	bh=KN8F1nt8AD3aqoQabFOV4no+F/B2FV8No4AUyjiOzbk=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=ijzCUUj+mE2GIjBd+n3yclYoNoaGrG2m8paxGlNXP+KSGvWEGAfEtCHEH5HDoL80q
	 83DCCerbzYesI/Ao8XnV6nRIUDXqEVXXh83Es0Ff+oM6DukHqMATUQTdwYxowinvOv
	 MPOzBNL07gt8JHk/0hRooS5b0g/HmchR0I1w4R59ZpF1c7E7u2oHn2hsjC/cmVpeOS
	 FP1fZNmINvg4U5EYImLZ8nc8c1u/y2VH4OzFaiXPe/o+dkYSwCAzVJmI33cFfG/I3n
	 /aEWfCyytv9a/TtaMISCfE6+B1uNN3NV2oHG0Nk2TEDCj90rVBnK6pPI/7NiJc38bE
	 4GNCBaRJ3SZPw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55D33C30658;
	Fri,  5 Jul 2024 07:55:20 +0000 (UTC)
From: Fenglin Wu via B4 Relay <devnull+quic_fenglinw.quicinc.com@kernel.org>
Date: Fri, 05 Jul 2024 15:55:01 +0800
Subject: [PATCH RESEND v3] leds: flash: leds-qcom-flash: limit LED current
 based on thermal condition
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240705-qcom_flash_thermal_derating-v3-1-8e2e2783e3a6@quicinc.com>
To: kernel@quicinc.com, linux-arm-msm@vger.kernel.org, 
 Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
 David Collins <quic_collinsd@quicinc.com>, 
 Subbaraman Narayanamurthy <quic_subbaram@quicinc.com>, 
 Fenglin Wu <quic_fenglinw@quicinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720166119; l=9512;
 i=quic_fenglinw@quicinc.com; s=20240327; h=from:subject:message-id;
 bh=P531IQymhBnENfovGdmHl6NdnzEbocY5fbBmjL2TIwc=;
 b=tFmOEFtzD3YQp6tsVxXoLfWvMMLkqnUn5/f/3kRB+pEucuTOT1czf/Pc1bkagfqTDhPSHsnOy
 0cdX78/PoR/BWDLkupcI+MT0nsxvbqUm7JtEhyNEHdnSZnPiS2c3c+w
X-Developer-Key: i=quic_fenglinw@quicinc.com; a=ed25519;
 pk=BF8SA4IVDk8/EBCwlBehKtn2hp6kipuuAuDAHh9s+K4=
X-Endpoint-Received: by B4 Relay for quic_fenglinw@quicinc.com/20240327
 with auth_id=146
X-Original-From: Fenglin Wu <quic_fenglinw@quicinc.com>
Reply-To: quic_fenglinw@quicinc.com

From: Fenglin Wu <quic_fenglinw@quicinc.com>

The flash module has status bits to indicate different thermal
conditions which are called as OTSTx. For each OTSTx status,
there is a recommended total flash current for all channels to
prevent the flash module entering into higher thermal level.
For example, the total flash current should be limited to 1000mA/500mA
respectively when the HW reaches the OTST1/OTST2 thermal level.

Signed-off-by: Fenglin Wu <quic_fenglinw@quicinc.com>
---
Changes in v3:
- Fix coding style issues to address review comments in v2.
- Link to v2: https://lore.kernel.org/r/20240513-qcom_flash_thermal_derating-v2-1-e41a07d0eb83@quicinc.com

Changes in v2:
- Update thermal threshold level 2 register definition for mvflash_4ch_regs.
    Mvflash_4ch module thermal threshold level 2 configuration register
    offset is 0x78, not succeeding from thermal threshold level 1 register 0x7a.
    Hence it is not appropriate to use REG_FIELD_ID to define thermal threshold
    register fileds like mvflash_3ch. Update to use REG_FIELD instead.
- Link to v1: https://lore.kernel.org/r/20240509-qcom_flash_thermal_derating-v1-1-1d5e68e5d71c@quicinc.com
---
 drivers/leds/flash/leds-qcom-flash.c | 163 ++++++++++++++++++++++++++++++++++-
 1 file changed, 162 insertions(+), 1 deletion(-)

diff --git a/drivers/leds/flash/leds-qcom-flash.c b/drivers/leds/flash/leds-qcom-flash.c
index 7c99a3039171..aa22686fafe0 100644
--- a/drivers/leds/flash/leds-qcom-flash.c
+++ b/drivers/leds/flash/leds-qcom-flash.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2022, 2024 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
 #include <linux/bitfield.h>
@@ -14,6 +14,9 @@
 #include <media/v4l2-flash-led-class.h>
 
 /* registers definitions */
+#define FLASH_REVISION_REG		0x00
+#define FLASH_4CH_REVISION_V0P1		0x01
+
 #define FLASH_TYPE_REG			0x04
 #define FLASH_TYPE_VAL			0x18
 
@@ -73,6 +76,16 @@
 
 #define UA_PER_MA			1000
 
+/* thermal threshold constants */
+#define OTST_3CH_MIN_VAL		3
+#define OTST1_4CH_MIN_VAL		0
+#define OTST1_4CH_V0P1_MIN_VAL		3
+#define OTST2_4CH_MIN_VAL		0
+
+#define OTST1_MAX_CURRENT_MA		1000
+#define OTST2_MAX_CURRENT_MA		500
+#define OTST3_MAX_CURRENT_MA		200
+
 enum hw_type {
 	QCOM_MVFLASH_3CH,
 	QCOM_MVFLASH_4CH,
@@ -98,6 +111,9 @@ enum {
 	REG_IRESOLUTION,
 	REG_CHAN_STROBE,
 	REG_CHAN_EN,
+	REG_THERM_THRSH1,
+	REG_THERM_THRSH2,
+	REG_THERM_THRSH3,
 	REG_MAX_COUNT,
 };
 
@@ -111,6 +127,9 @@ static struct reg_field mvflash_3ch_regs[REG_MAX_COUNT] = {
 	REG_FIELD(0x47, 0, 5),                  /* iresolution	*/
 	REG_FIELD_ID(0x49, 0, 2, 3, 1),         /* chan_strobe	*/
 	REG_FIELD(0x4c, 0, 2),                  /* chan_en	*/
+	REG_FIELD(0x56, 0, 2),			/* therm_thrsh1 */
+	REG_FIELD(0x57, 0, 2),			/* therm_thrsh2 */
+	REG_FIELD(0x58, 0, 2),			/* therm_thrsh3 */
 };
 
 static struct reg_field mvflash_4ch_regs[REG_MAX_COUNT] = {
@@ -123,6 +142,8 @@ static struct reg_field mvflash_4ch_regs[REG_MAX_COUNT] = {
 	REG_FIELD(0x49, 0, 3),			/* iresolution	*/
 	REG_FIELD_ID(0x4a, 0, 6, 4, 1),		/* chan_strobe	*/
 	REG_FIELD(0x4e, 0, 3),			/* chan_en	*/
+	REG_FIELD(0x7a, 0, 2),			/* therm_thrsh1 */
+	REG_FIELD(0x78, 0, 2),			/* therm_thrsh2 */
 };
 
 struct qcom_flash_data {
@@ -130,9 +151,11 @@ struct qcom_flash_data {
 	struct regmap_field     *r_fields[REG_MAX_COUNT];
 	struct mutex		lock;
 	enum hw_type		hw_type;
+	u32			total_ma;
 	u8			leds_count;
 	u8			max_channels;
 	u8			chan_en_bits;
+	u8			revision;
 };
 
 struct qcom_flash_led {
@@ -143,6 +166,7 @@ struct qcom_flash_led {
 	u32				max_timeout_ms;
 	u32				flash_current_ma;
 	u32				flash_timeout_ms;
+	u32				current_in_use_ma;
 	u8				*chan_id;
 	u8				chan_count;
 	bool				enabled;
@@ -172,6 +196,127 @@ static int set_flash_module_en(struct qcom_flash_led *led, bool en)
 	return rc;
 }
 
+static int update_allowed_flash_current(struct qcom_flash_led *led, u32 *current_ma, bool strobe)
+{
+	struct qcom_flash_data *flash_data = led->flash_data;
+	u32 therm_ma, avail_ma, thrsh[3], min_thrsh, sts;
+	int rc = 0;
+
+	mutex_lock(&flash_data->lock);
+	/*
+	 * Put previously allocated current into allowed budget in either of these two cases:
+	 * 1) LED is disabled;
+	 * 2) LED is enabled repeatedly
+	 */
+	if (!strobe || led->current_in_use_ma != 0) {
+		if (flash_data->total_ma >= led->current_in_use_ma)
+			flash_data->total_ma -= led->current_in_use_ma;
+		else
+			flash_data->total_ma = 0;
+
+		led->current_in_use_ma = 0;
+		if (!strobe)
+			goto unlock;
+	}
+
+	/*
+	 * Cache the default thermal threshold settings, and set them to the lowest levels before
+	 * reading over-temp real time status. If over-temp has been triggered at the lowest
+	 * threshold, it's very likely that it would be triggered at a higher (default) threshold
+	 * when more flash current is requested. Prevent device from triggering over-temp condition
+	 * by limiting the flash current for the new request.
+	 */
+	rc = regmap_field_read(flash_data->r_fields[REG_THERM_THRSH1], &thrsh[0]);
+	if (rc < 0)
+		goto unlock;
+
+	rc = regmap_field_read(flash_data->r_fields[REG_THERM_THRSH2], &thrsh[1]);
+	if (rc < 0)
+		goto unlock;
+
+	if (flash_data->hw_type == QCOM_MVFLASH_3CH) {
+		rc = regmap_field_read(flash_data->r_fields[REG_THERM_THRSH3], &thrsh[2]);
+		if (rc < 0)
+			goto unlock;
+	}
+
+	min_thrsh = OTST_3CH_MIN_VAL;
+	if (flash_data->hw_type == QCOM_MVFLASH_4CH)
+		min_thrsh = (flash_data->revision == FLASH_4CH_REVISION_V0P1) ?
+			OTST1_4CH_V0P1_MIN_VAL : OTST1_4CH_MIN_VAL;
+
+	rc = regmap_field_write(flash_data->r_fields[REG_THERM_THRSH1], min_thrsh);
+	if (rc < 0)
+		goto unlock;
+
+	if (flash_data->hw_type == QCOM_MVFLASH_4CH)
+		min_thrsh = OTST2_4CH_MIN_VAL;
+
+	/*
+	 * The default thermal threshold settings have been updated hence
+	 * restore them if any fault happens starting from here.
+	 */
+	rc = regmap_field_write(flash_data->r_fields[REG_THERM_THRSH2], min_thrsh);
+	if (rc < 0)
+		goto restore;
+
+	if (flash_data->hw_type == QCOM_MVFLASH_3CH) {
+		rc = regmap_field_write(flash_data->r_fields[REG_THERM_THRSH3], min_thrsh);
+		if (rc < 0)
+			goto restore;
+	}
+
+	/* Read thermal level status to get corresponding derating flash current */
+	rc = regmap_field_read(flash_data->r_fields[REG_STATUS2], &sts);
+	if (rc)
+		goto restore;
+
+	therm_ma = FLASH_TOTAL_CURRENT_MAX_UA / 1000;
+	if (flash_data->hw_type == QCOM_MVFLASH_3CH) {
+		if (sts & FLASH_STS_3CH_OTST3)
+			therm_ma = OTST3_MAX_CURRENT_MA;
+		else if (sts & FLASH_STS_3CH_OTST2)
+			therm_ma = OTST2_MAX_CURRENT_MA;
+		else if (sts & FLASH_STS_3CH_OTST1)
+			therm_ma = OTST1_MAX_CURRENT_MA;
+	} else {
+		if (sts & FLASH_STS_4CH_OTST2)
+			therm_ma = OTST2_MAX_CURRENT_MA;
+		else if (sts & FLASH_STS_4CH_OTST1)
+			therm_ma = OTST1_MAX_CURRENT_MA;
+	}
+
+	/* Calculate the allowed flash current for the request */
+	if (therm_ma <= flash_data->total_ma)
+		avail_ma = 0;
+	else
+		avail_ma = therm_ma - flash_data->total_ma;
+
+	*current_ma = min_t(u32, *current_ma, avail_ma);
+	led->current_in_use_ma = *current_ma;
+	flash_data->total_ma += led->current_in_use_ma;
+
+	dev_dbg(led->flash.led_cdev.dev, "allowed flash current: %dmA, total current: %dmA\n",
+					led->current_in_use_ma, flash_data->total_ma);
+
+restore:
+	/* Restore to default thermal threshold settings */
+	rc = regmap_field_write(flash_data->r_fields[REG_THERM_THRSH1], thrsh[0]);
+	if (rc < 0)
+		goto unlock;
+
+	rc = regmap_field_write(flash_data->r_fields[REG_THERM_THRSH2], thrsh[1]);
+	if (rc < 0)
+		goto unlock;
+
+	if (flash_data->hw_type == QCOM_MVFLASH_3CH)
+		rc = regmap_field_write(flash_data->r_fields[REG_THERM_THRSH3], thrsh[2]);
+
+unlock:
+	mutex_unlock(&flash_data->lock);
+	return rc;
+}
+
 static int set_flash_current(struct qcom_flash_led *led, u32 current_ma, enum led_mode mode)
 {
 	struct qcom_flash_data *flash_data = led->flash_data;
@@ -313,6 +458,10 @@ static int qcom_flash_strobe_set(struct led_classdev_flash *fled_cdev, bool stat
 	if (rc)
 		return rc;
 
+	rc = update_allowed_flash_current(led, &led->flash_current_ma, state);
+	if (rc < 0)
+		return rc;
+
 	rc = set_flash_current(led, led->flash_current_ma, FLASH_MODE);
 	if (rc)
 		return rc;
@@ -429,6 +578,10 @@ static int qcom_flash_led_brightness_set(struct led_classdev *led_cdev,
 	if (rc)
 		return rc;
 
+	rc = update_allowed_flash_current(led, &current_ma, enable);
+	if (rc < 0)
+		return rc;
+
 	rc = set_flash_current(led, current_ma, TORCH_MODE);
 	if (rc)
 		return rc;
@@ -703,6 +856,14 @@ static int qcom_flash_led_probe(struct platform_device *pdev)
 		flash_data->hw_type = QCOM_MVFLASH_4CH;
 		flash_data->max_channels = 4;
 		regs = mvflash_4ch_regs;
+
+		rc = regmap_read(regmap, reg_base + FLASH_REVISION_REG, &val);
+		if (rc < 0) {
+			dev_err(dev, "Failed to read flash LED module revision, rc=%d\n", rc);
+			return rc;
+		}
+
+		flash_data->revision = val;
 	} else {
 		dev_err(dev, "flash LED subtype %#x is not yet supported\n", val);
 		return -ENODEV;

---
base-commit: ca66b10a11da3c445c9c0ca1184f549bbe9061f2
change-id: 20240507-qcom_flash_thermal_derating-260b1f3c757c

Best regards,
-- 
Fenglin Wu <quic_fenglinw@quicinc.com>



