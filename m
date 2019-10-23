Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F2DABE12BE
	for <lists+linux-leds@lfdr.de>; Wed, 23 Oct 2019 09:07:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389759AbfJWHHn (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 23 Oct 2019 03:07:43 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:52320 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389570AbfJWHHn (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 23 Oct 2019 03:07:43 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id AF3F0609CA; Wed, 23 Oct 2019 07:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1571814461;
        bh=WvjYruTJPKhN0T8fCcVqnyZhH8me5YcEVoLHJ5MpJBo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=noaDih+B3J/TsS18HV1IPEjG4p5miXS8krS0xobBLRgWLRXwUDmjGx+/gAaggt2Nv
         IS8lP5c5Hsp9Gb0wSYzDO9YhPWqaZ1TJrc4dKpKInLQS9h6AH69qxS3zANn3nA8ZXP
         Z8Lb8O8Mu/mGwklbS9k8+04MJIE/RvVA1KK3/iZc=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from kgunda-linux.qualcomm.com (blr-c-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: kgunda@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 171E360A73;
        Wed, 23 Oct 2019 07:07:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1571814458;
        bh=WvjYruTJPKhN0T8fCcVqnyZhH8me5YcEVoLHJ5MpJBo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=l4R3FKfMuJBqlIPGLin7mtSRL9WUYOYc1MZDodE5Mc9DcJWKc0WXaJhZ6ZCHWVuVX
         YLj81stVMjWd+HkQ/RWQqzdvU6DthkAv/k3pU9UnTf9ecG8VIQ30QtzQl/hMVncuFk
         Gh7P7kcW13xAJVNsuRNMBILrPsIkYOE1U7aH/3uM=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 171E360A73
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=kgunda@codeaurora.org
From:   Kiran Gunda <kgunda@codeaurora.org>
To:     bjorn.andersson@linaro.org, jingoohan1@gmail.com,
        lee.jones@linaro.org, b.zolnierkie@samsung.com,
        dri-devel@lists.freedesktop.org, daniel.thompson@linaro.org,
        jacek.anaszewski@gmail.com, pavel@ucw.cz, robh+dt@kernel.org,
        mark.rutland@arm.com, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-fbdev@vger.kernel.org
Cc:     Kiran Gunda <kgunda@codeaurora.org>
Subject: [PATCH V9 2/6] backlight: qcom-wled: Rename PM8941* to WLED3
Date:   Wed, 23 Oct 2019 12:36:59 +0530
Message-Id: <1571814423-6535-3-git-send-email-kgunda@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1571814423-6535-1-git-send-email-kgunda@codeaurora.org>
References: <1571814423-6535-1-git-send-email-kgunda@codeaurora.org>
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Rename the PM8941* references as WLED3 to make the driver
generic and have WLED support for other PMICs. Also rename
"i_boost_limit" and "i_limit" variables to "boost_i_limit"
and "string_i_limit" respectively to resemble the corresponding
register names.

Signed-off-by: Kiran Gunda <kgunda@codeaurora.org>
Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Acked-by: Pavel Machek <pavel@ucw.cz>
---
 drivers/video/backlight/qcom-wled.c | 248 ++++++++++++++++++------------------
 1 file changed, 125 insertions(+), 123 deletions(-)

diff --git a/drivers/video/backlight/qcom-wled.c b/drivers/video/backlight/qcom-wled.c
index 82b8572..f191242 100644
--- a/drivers/video/backlight/qcom-wled.c
+++ b/drivers/video/backlight/qcom-wled.c
@@ -10,77 +10,79 @@
 #include <linux/regmap.h>
 
 /* From DT binding */
-#define PM8941_WLED_DEFAULT_BRIGHTNESS		2048
+#define WLED_DEFAULT_BRIGHTNESS				2048
 
-#define PM8941_WLED_REG_VAL_BASE		0x40
-#define  PM8941_WLED_REG_VAL_MAX		0xFFF
+#define WLED3_SINK_REG_BRIGHT_MAX			0xFFF
+#define WLED3_CTRL_REG_VAL_BASE				0x40
 
-#define PM8941_WLED_REG_MOD_EN			0x46
-#define  PM8941_WLED_REG_MOD_EN_BIT		BIT(7)
-#define  PM8941_WLED_REG_MOD_EN_MASK		BIT(7)
+/* WLED3 control registers */
+#define WLED3_CTRL_REG_MOD_EN				0x46
+#define  WLED3_CTRL_REG_MOD_EN_BIT			BIT(7)
+#define  WLED3_CTRL_REG_MOD_EN_MASK			BIT(7)
 
-#define PM8941_WLED_REG_SYNC			0x47
-#define  PM8941_WLED_REG_SYNC_MASK		0x07
-#define  PM8941_WLED_REG_SYNC_LED1		BIT(0)
-#define  PM8941_WLED_REG_SYNC_LED2		BIT(1)
-#define  PM8941_WLED_REG_SYNC_LED3		BIT(2)
-#define  PM8941_WLED_REG_SYNC_ALL		0x07
-#define  PM8941_WLED_REG_SYNC_CLEAR		0x00
+#define WLED3_CTRL_REG_FREQ				0x4c
+#define  WLED3_CTRL_REG_FREQ_MASK			0x0f
 
-#define PM8941_WLED_REG_FREQ			0x4c
-#define  PM8941_WLED_REG_FREQ_MASK		0x0f
+#define WLED3_CTRL_REG_OVP				0x4d
+#define  WLED3_CTRL_REG_OVP_MASK			0x03
 
-#define PM8941_WLED_REG_OVP			0x4d
-#define  PM8941_WLED_REG_OVP_MASK		0x03
+#define WLED3_CTRL_REG_ILIMIT				0x4e
+#define  WLED3_CTRL_REG_ILIMIT_MASK			0x07
 
-#define PM8941_WLED_REG_BOOST			0x4e
-#define  PM8941_WLED_REG_BOOST_MASK		0x07
+/* WLED3 sink registers */
+#define WLED3_SINK_REG_SYNC				0x47
+#define  WLED3_SINK_REG_SYNC_MASK			0x07
+#define  WLED3_SINK_REG_SYNC_LED1			BIT(0)
+#define  WLED3_SINK_REG_SYNC_LED2			BIT(1)
+#define  WLED3_SINK_REG_SYNC_LED3			BIT(2)
+#define  WLED3_SINK_REG_SYNC_ALL			0x07
+#define  WLED3_SINK_REG_SYNC_CLEAR			0x00
 
-#define PM8941_WLED_REG_SINK			0x4f
-#define  PM8941_WLED_REG_SINK_MASK		0xe0
-#define  PM8941_WLED_REG_SINK_SHFT		0x05
+#define WLED3_SINK_REG_CURR_SINK			0x4f
+#define  WLED3_SINK_REG_CURR_SINK_MASK			0xe0
+#define  WLED3_SINK_REG_CURR_SINK_SHFT			0x05
 
-/* Per-'string' registers below */
-#define PM8941_WLED_REG_STR_OFFSET		0x10
+/* WLED3 per-'string' registers below */
+#define WLED3_SINK_REG_STR_OFFSET			0x10
 
-#define PM8941_WLED_REG_STR_MOD_EN_BASE		0x60
-#define  PM8941_WLED_REG_STR_MOD_MASK		BIT(7)
-#define  PM8941_WLED_REG_STR_MOD_EN		BIT(7)
+#define WLED3_SINK_REG_STR_MOD_EN_BASE			0x60
+#define  WLED3_SINK_REG_STR_MOD_MASK			BIT(7)
+#define  WLED3_SINK_REG_STR_MOD_EN			BIT(7)
 
-#define PM8941_WLED_REG_STR_SCALE_BASE		0x62
-#define  PM8941_WLED_REG_STR_SCALE_MASK		0x1f
+#define WLED3_SINK_REG_STR_FULL_SCALE_CURR		0x62
+#define  WLED3_SINK_REG_STR_FULL_SCALE_CURR_MASK	0x1f
 
-#define PM8941_WLED_REG_STR_MOD_SRC_BASE	0x63
-#define  PM8941_WLED_REG_STR_MOD_SRC_MASK	0x01
-#define  PM8941_WLED_REG_STR_MOD_SRC_INT	0x00
-#define  PM8941_WLED_REG_STR_MOD_SRC_EXT	0x01
+#define WLED3_SINK_REG_STR_MOD_SRC_BASE			0x63
+#define  WLED3_SINK_REG_STR_MOD_SRC_MASK		0x01
+#define  WLED3_SINK_REG_STR_MOD_SRC_INT			0x00
+#define  WLED3_SINK_REG_STR_MOD_SRC_EXT			0x01
 
-#define PM8941_WLED_REG_STR_CABC_BASE		0x66
-#define  PM8941_WLED_REG_STR_CABC_MASK		BIT(7)
-#define  PM8941_WLED_REG_STR_CABC_EN		BIT(7)
+#define WLED3_SINK_REG_STR_CABC_BASE			0x66
+#define  WLED3_SINK_REG_STR_CABC_MASK			BIT(7)
+#define  WLED3_SINK_REG_STR_CABC_EN			BIT(7)
 
-struct pm8941_wled_config {
-	u32 i_boost_limit;
+struct wled_config {
+	u32 boost_i_limit;
 	u32 ovp;
 	u32 switch_freq;
 	u32 num_strings;
-	u32 i_limit;
+	u32 string_i_limit;
 	bool cs_out_en;
 	bool ext_gen;
 	bool cabc_en;
 };
 
-struct pm8941_wled {
+struct wled {
 	const char *name;
 	struct regmap *regmap;
 	u16 addr;
 
-	struct pm8941_wled_config cfg;
+	struct wled_config cfg;
 };
 
-static int pm8941_wled_update_status(struct backlight_device *bl)
+static int wled_update_status(struct backlight_device *bl)
 {
-	struct pm8941_wled *wled = bl_get_data(bl);
+	struct wled *wled = bl_get_data(bl);
 	u16 val = bl->props.brightness;
 	u8 ctrl = 0;
 	int rc;
@@ -92,11 +94,11 @@ static int pm8941_wled_update_status(struct backlight_device *bl)
 		val = 0;
 
 	if (val != 0)
-		ctrl = PM8941_WLED_REG_MOD_EN_BIT;
+		ctrl = WLED3_CTRL_REG_MOD_EN_BIT;
 
 	rc = regmap_update_bits(wled->regmap,
-			wled->addr + PM8941_WLED_REG_MOD_EN,
-			PM8941_WLED_REG_MOD_EN_MASK, ctrl);
+			wled->addr + WLED3_CTRL_REG_MOD_EN,
+			WLED3_CTRL_REG_MOD_EN_MASK, ctrl);
 	if (rc)
 		return rc;
 
@@ -104,89 +106,89 @@ static int pm8941_wled_update_status(struct backlight_device *bl)
 		u8 v[2] = { val & 0xff, (val >> 8) & 0xf };
 
 		rc = regmap_bulk_write(wled->regmap,
-				wled->addr + PM8941_WLED_REG_VAL_BASE + 2 * i,
+				wled->addr + WLED3_CTRL_REG_VAL_BASE + 2 * i,
 				v, 2);
 		if (rc)
 			return rc;
 	}
 
 	rc = regmap_update_bits(wled->regmap,
-			wled->addr + PM8941_WLED_REG_SYNC,
-			PM8941_WLED_REG_SYNC_MASK, PM8941_WLED_REG_SYNC_ALL);
+			wled->addr + WLED3_SINK_REG_SYNC,
+			WLED3_SINK_REG_SYNC_MASK, WLED3_SINK_REG_SYNC_ALL);
 	if (rc)
 		return rc;
 
 	rc = regmap_update_bits(wled->regmap,
-			wled->addr + PM8941_WLED_REG_SYNC,
-			PM8941_WLED_REG_SYNC_MASK, PM8941_WLED_REG_SYNC_CLEAR);
+			wled->addr + WLED3_SINK_REG_SYNC,
+			WLED3_SINK_REG_SYNC_MASK, WLED3_SINK_REG_SYNC_CLEAR);
 	return rc;
 }
 
-static int pm8941_wled_setup(struct pm8941_wled *wled)
+static int wled_setup(struct wled *wled)
 {
 	int rc;
 	int i;
 
 	rc = regmap_update_bits(wled->regmap,
-			wled->addr + PM8941_WLED_REG_OVP,
-			PM8941_WLED_REG_OVP_MASK, wled->cfg.ovp);
+			wled->addr + WLED3_CTRL_REG_OVP,
+			WLED3_CTRL_REG_OVP_MASK, wled->cfg.ovp);
 	if (rc)
 		return rc;
 
 	rc = regmap_update_bits(wled->regmap,
-			wled->addr + PM8941_WLED_REG_BOOST,
-			PM8941_WLED_REG_BOOST_MASK, wled->cfg.i_boost_limit);
+			wled->addr + WLED3_CTRL_REG_ILIMIT,
+			WLED3_CTRL_REG_ILIMIT_MASK, wled->cfg.boost_i_limit);
 	if (rc)
 		return rc;
 
 	rc = regmap_update_bits(wled->regmap,
-			wled->addr + PM8941_WLED_REG_FREQ,
-			PM8941_WLED_REG_FREQ_MASK, wled->cfg.switch_freq);
+			wled->addr + WLED3_CTRL_REG_FREQ,
+			WLED3_CTRL_REG_FREQ_MASK, wled->cfg.switch_freq);
 	if (rc)
 		return rc;
 
 	if (wled->cfg.cs_out_en) {
 		u8 all = (BIT(wled->cfg.num_strings) - 1)
-				<< PM8941_WLED_REG_SINK_SHFT;
+				<< WLED3_SINK_REG_CURR_SINK_SHFT;
 
 		rc = regmap_update_bits(wled->regmap,
-				wled->addr + PM8941_WLED_REG_SINK,
-				PM8941_WLED_REG_SINK_MASK, all);
+				wled->addr + WLED3_SINK_REG_CURR_SINK,
+				WLED3_SINK_REG_CURR_SINK_MASK, all);
 		if (rc)
 			return rc;
 	}
 
 	for (i = 0; i < wled->cfg.num_strings; ++i) {
-		u16 addr = wled->addr + PM8941_WLED_REG_STR_OFFSET * i;
+		u16 addr = wled->addr + WLED3_SINK_REG_STR_OFFSET * i;
 
 		rc = regmap_update_bits(wled->regmap,
-				addr + PM8941_WLED_REG_STR_MOD_EN_BASE,
-				PM8941_WLED_REG_STR_MOD_MASK,
-				PM8941_WLED_REG_STR_MOD_EN);
+				addr + WLED3_SINK_REG_STR_MOD_EN_BASE,
+				WLED3_SINK_REG_STR_MOD_MASK,
+				WLED3_SINK_REG_STR_MOD_EN);
 		if (rc)
 			return rc;
 
 		if (wled->cfg.ext_gen) {
 			rc = regmap_update_bits(wled->regmap,
-					addr + PM8941_WLED_REG_STR_MOD_SRC_BASE,
-					PM8941_WLED_REG_STR_MOD_SRC_MASK,
-					PM8941_WLED_REG_STR_MOD_SRC_EXT);
+					addr + WLED3_SINK_REG_STR_MOD_SRC_BASE,
+					WLED3_SINK_REG_STR_MOD_SRC_MASK,
+					WLED3_SINK_REG_STR_MOD_SRC_EXT);
 			if (rc)
 				return rc;
 		}
 
 		rc = regmap_update_bits(wled->regmap,
-				addr + PM8941_WLED_REG_STR_SCALE_BASE,
-				PM8941_WLED_REG_STR_SCALE_MASK,
-				wled->cfg.i_limit);
+				addr + WLED3_SINK_REG_STR_FULL_SCALE_CURR,
+				WLED3_SINK_REG_STR_FULL_SCALE_CURR_MASK,
+				wled->cfg.string_i_limit);
 		if (rc)
 			return rc;
 
 		rc = regmap_update_bits(wled->regmap,
-				addr + PM8941_WLED_REG_STR_CABC_BASE,
-				PM8941_WLED_REG_STR_CABC_MASK,
+				addr + WLED3_SINK_REG_STR_CABC_BASE,
+				WLED3_SINK_REG_STR_CABC_MASK,
 				wled->cfg.cabc_en ?
-					PM8941_WLED_REG_STR_CABC_EN : 0);
+					WLED3_SINK_REG_STR_CABC_EN : 0);
 		if (rc)
 			return rc;
 	}
@@ -194,9 +196,9 @@ static int pm8941_wled_setup(struct pm8941_wled *wled)
 	return 0;
 }
 
-static const struct pm8941_wled_config pm8941_wled_config_defaults = {
-	.i_boost_limit = 3,
-	.i_limit = 20,
+static const struct wled_config wled3_config_defaults = {
+	.boost_i_limit = 3,
+	.string_i_limit = 20,
 	.ovp = 2,
 	.switch_freq = 5,
 	.num_strings = 0,
@@ -205,55 +207,55 @@ static int pm8941_wled_setup(struct pm8941_wled *wled)
 	.cabc_en = false,
 };
 
-struct pm8941_wled_var_cfg {
+struct wled_var_cfg {
 	const u32 *values;
 	u32 (*fn)(u32);
 	int size;
 };
 
-static const u32 pm8941_wled_i_boost_limit_values[] = {
+static const u32 wled3_boost_i_limit_values[] = {
 	105, 385, 525, 805, 980, 1260, 1400, 1680,
 };
 
-static const struct pm8941_wled_var_cfg pm8941_wled_i_boost_limit_cfg = {
-	.values = pm8941_wled_i_boost_limit_values,
-	.size = ARRAY_SIZE(pm8941_wled_i_boost_limit_values),
+static const struct wled_var_cfg wled3_boost_i_limit_cfg = {
+	.values = wled3_boost_i_limit_values,
+	.size = ARRAY_SIZE(wled3_boost_i_limit_values),
 };
 
-static const u32 pm8941_wled_ovp_values[] = {
+static const u32 wled3_ovp_values[] = {
 	35, 32, 29, 27,
 };
 
-static const struct pm8941_wled_var_cfg pm8941_wled_ovp_cfg = {
-	.values = pm8941_wled_ovp_values,
-	.size = ARRAY_SIZE(pm8941_wled_ovp_values),
+static const struct wled_var_cfg wled3_ovp_cfg = {
+	.values = wled3_ovp_values,
+	.size = ARRAY_SIZE(wled3_ovp_values),
 };
 
-static u32 pm8941_wled_num_strings_values_fn(u32 idx)
+static u32 wled3_num_strings_values_fn(u32 idx)
 {
 	return idx + 1;
 }
 
-static const struct pm8941_wled_var_cfg pm8941_wled_num_strings_cfg = {
-	.fn = pm8941_wled_num_strings_values_fn,
+static const struct wled_var_cfg wled3_num_strings_cfg = {
+	.fn = wled3_num_strings_values_fn,
 	.size = 3,
 };
 
-static u32 pm8941_wled_switch_freq_values_fn(u32 idx)
+static u32 wled3_switch_freq_values_fn(u32 idx)
 {
 	return 19200 / (2 * (1 + idx));
 }
 
-static const struct pm8941_wled_var_cfg pm8941_wled_switch_freq_cfg = {
-	.fn = pm8941_wled_switch_freq_values_fn,
+static const struct wled_var_cfg wled3_switch_freq_cfg = {
+	.fn = wled3_switch_freq_values_fn,
 	.size = 16,
 };
 
-static const struct pm8941_wled_var_cfg pm8941_wled_i_limit_cfg = {
+static const struct wled_var_cfg wled3_string_i_limit_cfg = {
 	.size = 26,
 };
 
-static u32 pm8941_wled_values(const struct pm8941_wled_var_cfg *cfg, u32 idx)
+static u32 wled3_values(const struct wled_var_cfg *cfg, u32 idx)
 {
 	if (idx >= cfg->size)
 		return UINT_MAX;
@@ -264,9 +266,9 @@ static u32 pm8941_wled_values(const struct pm8941_wled_var_cfg *cfg, u32 idx)
 	return idx;
 }
 
-static int pm8941_wled_configure(struct pm8941_wled *wled, struct device *dev)
+static int wled_configure(struct wled *wled, struct device *dev)
 {
-	struct pm8941_wled_config *cfg = &wled->cfg;
+	struct wled_config *cfg = &wled->cfg;
 	u32 val;
 	int rc;
 	u32 c;
@@ -276,32 +278,32 @@ static int pm8941_wled_configure(struct pm8941_wled *wled, struct device *dev)
 	const struct {
 		const char *name;
 		u32 *val_ptr;
-		const struct pm8941_wled_var_cfg *cfg;
+		const struct wled_var_cfg *cfg;
 	} u32_opts[] = {
 		{
 			"qcom,current-boost-limit",
-			&cfg->i_boost_limit,
-			.cfg = &pm8941_wled_i_boost_limit_cfg,
+			&cfg->boost_i_limit,
+			.cfg = &wled3_boost_i_limit_cfg,
 		},
 		{
 			"qcom,current-limit",
-			&cfg->i_limit,
-			.cfg = &pm8941_wled_i_limit_cfg,
+			&cfg->string_i_limit,
+			.cfg = &wled3_string_i_limit_cfg,
 		},
 		{
 			"qcom,ovp",
 			&cfg->ovp,
-			.cfg = &pm8941_wled_ovp_cfg,
+			.cfg = &wled3_ovp_cfg,
 		},
 		{
 			"qcom,switching-freq",
 			&cfg->switch_freq,
-			.cfg = &pm8941_wled_switch_freq_cfg,
+			.cfg = &wled3_switch_freq_cfg,
 		},
 		{
 			"qcom,num-strings",
 			&cfg->num_strings,
-			.cfg = &pm8941_wled_num_strings_cfg,
+			.cfg = &wled3_num_strings_cfg,
 		},
 	};
 	const struct {
@@ -324,7 +326,7 @@ static int pm8941_wled_configure(struct pm8941_wled *wled, struct device *dev)
 	if (rc)
 		wled->name = devm_kasprintf(dev, GFP_KERNEL, "%pOFn", dev->of_node);
 
-	*cfg = pm8941_wled_config_defaults;
+	*cfg = wled3_config_defaults;
 	for (i = 0; i < ARRAY_SIZE(u32_opts); ++i) {
 		rc = of_property_read_u32(dev->of_node, u32_opts[i].name, &val);
 		if (rc == -EINVAL) {
@@ -336,7 +338,7 @@ static int pm8941_wled_configure(struct pm8941_wled *wled, struct device *dev)
 
 		c = UINT_MAX;
 		for (j = 0; c != val; j++) {
-			c = pm8941_wled_values(u32_opts[i].cfg, j);
+			c = wled3_values(u32_opts[i].cfg, j);
 			if (c == UINT_MAX) {
 				dev_err(dev, "invalid value for '%s'\n",
 					u32_opts[i].name);
@@ -358,15 +360,15 @@ static int pm8941_wled_configure(struct pm8941_wled *wled, struct device *dev)
 	return 0;
 }
 
-static const struct backlight_ops pm8941_wled_ops = {
-	.update_status = pm8941_wled_update_status,
+static const struct backlight_ops wled_ops = {
+	.update_status = wled_update_status,
 };
 
-static int pm8941_wled_probe(struct platform_device *pdev)
+static int wled_probe(struct platform_device *pdev)
 {
 	struct backlight_properties props;
 	struct backlight_device *bl;
-	struct pm8941_wled *wled;
+	struct wled *wled;
 	struct regmap *regmap;
 	u32 val;
 	int rc;
@@ -383,42 +385,42 @@ static int pm8941_wled_probe(struct platform_device *pdev)
 
 	wled->regmap = regmap;
 
-	rc = pm8941_wled_configure(wled, &pdev->dev);
+	rc = wled_configure(wled, &pdev->dev);
 	if (rc)
 		return rc;
 
-	rc = pm8941_wled_setup(wled);
+	rc = wled_setup(wled);
 	if (rc)
 		return rc;
 
-	val = PM8941_WLED_DEFAULT_BRIGHTNESS;
+	val = WLED_DEFAULT_BRIGHTNESS;
 	of_property_read_u32(pdev->dev.of_node, "default-brightness", &val);
 
 	memset(&props, 0, sizeof(struct backlight_properties));
 	props.type = BACKLIGHT_RAW;
 	props.brightness = val;
-	props.max_brightness = PM8941_WLED_REG_VAL_MAX;
+	props.max_brightness = WLED3_SINK_REG_BRIGHT_MAX;
 	bl = devm_backlight_device_register(&pdev->dev, wled->name,
 					    &pdev->dev, wled,
-					    &pm8941_wled_ops, &props);
+					    &wled_ops, &props);
 	return PTR_ERR_OR_ZERO(bl);
 };
 
-static const struct of_device_id pm8941_wled_match_table[] = {
+static const struct of_device_id wled_match_table[] = {
 	{ .compatible = "qcom,pm8941-wled" },
 	{}
 };
-MODULE_DEVICE_TABLE(of, pm8941_wled_match_table);
+MODULE_DEVICE_TABLE(of, wled_match_table);
 
-static struct platform_driver pm8941_wled_driver = {
-	.probe = pm8941_wled_probe,
+static struct platform_driver wled_driver = {
+	.probe = wled_probe,
 	.driver	= {
-		.name = "pm8941-wled",
-		.of_match_table	= pm8941_wled_match_table,
+		.name = "qcom,wled",
+		.of_match_table	= wled_match_table,
 	},
 };
 
-module_platform_driver(pm8941_wled_driver);
+module_platform_driver(wled_driver);
 
-MODULE_DESCRIPTION("pm8941 wled driver");
+MODULE_DESCRIPTION("Qualcomm WLED driver");
 MODULE_LICENSE("GPL v2");
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
 a Linux Foundation Collaborative Project

