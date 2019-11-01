Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0E4F2EBDE9
	for <lists+linux-leds@lfdr.de>; Fri,  1 Nov 2019 07:28:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727383AbfKAG2Z (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 1 Nov 2019 02:28:25 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:46580 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726609AbfKAG2Z (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 1 Nov 2019 02:28:25 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 54BC760F39; Fri,  1 Nov 2019 06:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1572589704;
        bh=wDNMjb0wqoOUV2dlwuv5kKKe9KtTtq+MXT2r8rru0t0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=pEATcC3MrmJGBZLd4UCT6BvTkZFT/OeX1C+myOVkX0PkFZxXxXBcWrTM8xZ0AOokQ
         Q1M1mXyNtHJRjYtRnmGpEMVzw+iuSqtVj2y4JAU3DRVZHbHoJot3wDSJYxqhA5VE/d
         nF8RvWTpMwEfA1zZ8TfSwZ4pHTyQkCWzMDUIZoGs=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 601B360F32;
        Fri,  1 Nov 2019 06:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1572589698;
        bh=wDNMjb0wqoOUV2dlwuv5kKKe9KtTtq+MXT2r8rru0t0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=V3R79C4IJe6yV6KFTZwk1xvXXO4QQPtR7bwQdN4f+bvahJ0v7oMn7wWc5XjFaERXQ
         DabvGDJii/v0KFl8reDlPQ7MQ8p7Lt+6QWBhjbPYvMC/trebbvfrSF++DmSS3PtPXB
         ll07T8SwoMH1WoP4PJBwT4YFxvoUNCWsyNnFxAl0=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 601B360F32
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
Subject: [PATCH V10 7/8] backlight: qcom-wled: add support for short circuit handling.
Date:   Fri,  1 Nov 2019 11:57:03 +0530
Message-Id: <1572589624-6095-8-git-send-email-kgunda@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1572589624-6095-1-git-send-email-kgunda@codeaurora.org>
References: <1572589624-6095-1-git-send-email-kgunda@codeaurora.org>
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Handle the short circuit interrupt and check if the short circuit
interrupt is valid. Re-enable the module to check if it goes
away. Disable the module altogether if the short circuit event
persists.

Signed-off-by: Kiran Gunda <kgunda@codeaurora.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
---
 drivers/video/backlight/qcom-wled.c | 144 +++++++++++++++++++++++++++++++++++-
 1 file changed, 140 insertions(+), 4 deletions(-)

diff --git a/drivers/video/backlight/qcom-wled.c b/drivers/video/backlight/qcom-wled.c
index 5386ca9..658b1e0 100644
--- a/drivers/video/backlight/qcom-wled.c
+++ b/drivers/video/backlight/qcom-wled.c
@@ -2,6 +2,9 @@
 /* Copyright (c) 2015, Sony Mobile Communications, AB.
  */
 
+#include <linux/delay.h>
+#include <linux/interrupt.h>
+#include <linux/ktime.h>
 #include <linux/kernel.h>
 #include <linux/backlight.h>
 #include <linux/module.h>
@@ -56,6 +59,16 @@
 #define WLED3_SINK_REG_STR_CABC(n)			(0x66 + (n * 0x10))
 #define  WLED3_SINK_REG_STR_CABC_MASK			BIT(7)
 
+/* WLED4 specific control registers */
+#define WLED4_CTRL_REG_SHORT_PROTECT			0x5e
+#define  WLED4_CTRL_REG_SHORT_EN_MASK			BIT(7)
+
+#define WLED4_CTRL_REG_SEC_ACCESS			0xd0
+#define  WLED4_CTRL_REG_SEC_UNLOCK			0xa5
+
+#define WLED4_CTRL_REG_TEST1				0xe2
+#define  WLED4_CTRL_REG_TEST1_EXT_FET_DTEST2		0x09
+
 /* WLED4 specific sink registers */
 #define WLED4_SINK_REG_CURR_SINK			0x46
 #define  WLED4_SINK_REG_CURR_SINK_MASK			GENMASK(7, 4)
@@ -105,17 +118,24 @@ struct wled_config {
 	bool cs_out_en;
 	bool ext_gen;
 	bool cabc;
+	bool external_pfet;
 };
 
 struct wled {
 	const char *name;
 	struct device *dev;
 	struct regmap *regmap;
+	struct mutex lock;	/* Lock to avoid race from thread irq handler */
+	ktime_t last_short_event;
 	u16 ctrl_addr;
 	u16 sink_addr;
 	u16 max_string_count;
 	u32 brightness;
 	u32 max_brightness;
+	u32 short_count;
+	bool disabled_by_short;
+	bool has_short_detect;
+	int short_irq;
 
 	struct wled_config cfg;
 	int (*wled_set_brightness)(struct wled *wled, u16 brightness);
@@ -166,6 +186,9 @@ static int wled_module_enable(struct wled *wled, int val)
 {
 	int rc;
 
+	if (wled->disabled_by_short)
+		return -ENXIO;
+
 	rc = regmap_update_bits(wled->regmap, wled->ctrl_addr +
 				WLED3_CTRL_REG_MOD_EN,
 				WLED3_CTRL_REG_MOD_EN_MASK,
@@ -202,18 +225,19 @@ static int wled_update_status(struct backlight_device *bl)
 	    bl->props.state & BL_CORE_FBBLANK)
 		brightness = 0;
 
+	mutex_lock(&wled->lock);
 	if (brightness) {
 		rc = wled->wled_set_brightness(wled, brightness);
 		if (rc < 0) {
 			dev_err(wled->dev, "wled failed to set brightness rc:%d\n",
 				rc);
-			return rc;
+			goto unlock_mutex;
 		}
 
 		rc = wled_sync_toggle(wled);
 		if (rc < 0) {
 			dev_err(wled->dev, "wled sync failed rc:%d\n", rc);
-			return rc;
+			goto unlock_mutex;
 		}
 	}
 
@@ -221,15 +245,61 @@ static int wled_update_status(struct backlight_device *bl)
 		rc = wled_module_enable(wled, !!brightness);
 		if (rc < 0) {
 			dev_err(wled->dev, "wled enable failed rc:%d\n", rc);
-			return rc;
+			goto unlock_mutex;
 		}
 	}
 
 	wled->brightness = brightness;
 
+unlock_mutex:
+	mutex_unlock(&wled->lock);
+
 	return rc;
 }
 
+#define WLED_SHORT_DLY_MS			20
+#define WLED_SHORT_CNT_MAX			5
+#define WLED_SHORT_RESET_CNT_DLY_US		USEC_PER_SEC
+
+static irqreturn_t wled_short_irq_handler(int irq, void *_wled)
+{
+	struct wled *wled = _wled;
+	int rc;
+	s64 elapsed_time;
+
+	wled->short_count++;
+	mutex_lock(&wled->lock);
+	rc = wled_module_enable(wled, false);
+	if (rc < 0) {
+		dev_err(wled->dev, "wled disable failed rc:%d\n", rc);
+		goto unlock_mutex;
+	}
+
+	elapsed_time = ktime_us_delta(ktime_get(),
+				      wled->last_short_event);
+	if (elapsed_time > WLED_SHORT_RESET_CNT_DLY_US)
+		wled->short_count = 1;
+
+	if (wled->short_count > WLED_SHORT_CNT_MAX) {
+		dev_err(wled->dev, "Short trigged %d times, disabling WLED forever!\n",
+			wled->short_count);
+		wled->disabled_by_short = true;
+		goto unlock_mutex;
+	}
+
+	wled->last_short_event = ktime_get();
+
+	msleep(WLED_SHORT_DLY_MS);
+	rc = wled_module_enable(wled, true);
+	if (rc < 0)
+		dev_err(wled->dev, "wled enable failed rc:%d\n", rc);
+
+unlock_mutex:
+	mutex_unlock(&wled->lock);
+
+	return IRQ_HANDLED;
+}
+
 static int wled3_setup(struct wled *wled)
 {
 	u16 addr;
@@ -318,7 +388,7 @@ static int wled4_setup(struct wled *wled)
 	int rc, temp, i, j;
 	u16 addr;
 	u8 sink_en = 0;
-	u32 sink_cfg = 0;
+	u32 sink_cfg;
 
 	rc = regmap_update_bits(wled->regmap,
 				wled->ctrl_addr + WLED3_CTRL_REG_OVP,
@@ -340,6 +410,21 @@ static int wled4_setup(struct wled *wled)
 	if (rc < 0)
 		return rc;
 
+	if (wled->cfg.external_pfet) {
+		/* Unlock the secure register access */
+		rc = regmap_write(wled->regmap, wled->ctrl_addr +
+				  WLED4_CTRL_REG_SEC_ACCESS,
+				  WLED4_CTRL_REG_SEC_UNLOCK);
+		if (rc < 0)
+			return rc;
+
+		rc = regmap_write(wled->regmap,
+				  wled->ctrl_addr + WLED4_CTRL_REG_TEST1,
+				  WLED4_CTRL_REG_TEST1_EXT_FET_DTEST2);
+		if (rc < 0)
+			return rc;
+	}
+
 	rc = regmap_read(wled->regmap, wled->sink_addr +
 			 WLED4_SINK_REG_CURR_SINK, &sink_cfg);
 	if (rc < 0)
@@ -425,6 +510,7 @@ static int wled4_setup(struct wled *wled)
 	.num_strings = 4,
 	.switch_freq = 11,
 	.cabc = false,
+	.external_pfet = false,
 };
 
 static const u32 wled3_boost_i_limit_values[] = {
@@ -590,6 +676,7 @@ static int wled_configure(struct wled *wled, int version)
 		{ "qcom,cs-out", &cfg->cs_out_en, },
 		{ "qcom,ext-gen", &cfg->ext_gen, },
 		{ "qcom,cabc", &cfg->cabc, },
+		{ "qcom,external-pfet", &cfg->external_pfet, },
 	};
 
 	prop_addr = of_get_address(dev->of_node, 0, NULL, NULL);
@@ -678,6 +765,38 @@ static int wled_configure(struct wled *wled, int version)
 	return 0;
 }
 
+static int wled_configure_short_irq(struct wled *wled,
+				    struct platform_device *pdev)
+{
+	int rc;
+
+	if (!wled->has_short_detect)
+		return 0;
+
+	rc = regmap_update_bits(wled->regmap, wled->ctrl_addr +
+				WLED4_CTRL_REG_SHORT_PROTECT,
+				WLED4_CTRL_REG_SHORT_EN_MASK,
+				WLED4_CTRL_REG_SHORT_EN_MASK);
+	if (rc < 0)
+		return rc;
+
+	wled->short_irq = platform_get_irq_byname(pdev, "short");
+	if (wled->short_irq < 0) {
+		dev_dbg(&pdev->dev, "short irq is not used\n");
+		return 0;
+	}
+
+	rc = devm_request_threaded_irq(wled->dev, wled->short_irq,
+				       NULL, wled_short_irq_handler,
+				       IRQF_ONESHOT,
+				       "wled_short_irq", wled);
+	if (rc < 0)
+		dev_err(wled->dev, "Unable to request short_irq (err:%d)\n",
+			rc);
+
+	return rc;
+}
+
 static const struct backlight_ops wled_ops = {
 	.update_status = wled_update_status,
 };
@@ -711,6 +830,7 @@ static int wled_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
+	mutex_init(&wled->lock);
 	rc = wled_configure(wled, version);
 	if (rc)
 		return rc;
@@ -725,6 +845,7 @@ static int wled_probe(struct platform_device *pdev)
 		break;
 
 	case 4:
+		wled->has_short_detect = true;
 		rc = wled4_setup(wled);
 		if (rc) {
 			dev_err(&pdev->dev, "wled4_setup failed\n");
@@ -737,6 +858,10 @@ static int wled_probe(struct platform_device *pdev)
 		break;
 	}
 
+	rc = wled_configure_short_irq(wled, pdev);
+	if (rc < 0)
+		return rc;
+
 	val = WLED_DEFAULT_BRIGHTNESS;
 	of_property_read_u32(pdev->dev.of_node, "default-brightness", &val);
 
@@ -750,6 +875,16 @@ static int wled_probe(struct platform_device *pdev)
 	return PTR_ERR_OR_ZERO(bl);
 };
 
+static int wled_remove(struct platform_device *pdev)
+{
+	struct wled *wled = dev_get_drvdata(&pdev->dev);
+
+	mutex_destroy(&wled->lock);
+	disable_irq(wled->short_irq);
+
+	return 0;
+}
+
 static const struct of_device_id wled_match_table[] = {
 	{ .compatible = "qcom,pm8941-wled", .data = (void *)3 },
 	{ .compatible = "qcom,pmi8998-wled", .data = (void *)4 },
@@ -760,6 +895,7 @@ static int wled_probe(struct platform_device *pdev)
 
 static struct platform_driver wled_driver = {
 	.probe = wled_probe,
+	.remove = wled_remove,
 	.driver	= {
 		.name = "qcom,wled",
 		.of_match_table	= wled_match_table,
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
 a Linux Foundation Collaborative Project

