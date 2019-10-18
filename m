Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 13E47DC504
	for <lists+linux-leds@lfdr.de>; Fri, 18 Oct 2019 14:34:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2633685AbfJRMed (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 18 Oct 2019 08:34:33 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:52932 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2438968AbfJRMed (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 18 Oct 2019 08:34:33 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 4E277612C3; Fri, 18 Oct 2019 12:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1571402071;
        bh=9LfF8rWL83P80bxW5adx9b4CL9hwzZ6cUe7pu2GR0n0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ILYud/wlL6SXaxBXZjGdUQucBEB5A2PgSVtPT3ilpIDNNd22Px5+mOZTxZF911qsq
         CrQCXZPdcOXUtfFU9OQxulJKh9BQc3WAqARrvfUrTfPugdA49jGlCh1okVy0bv4dmd
         4yC7Tfg4a2MJILZAWFovvZriurfElPYVlUAzSQvQ=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id D59B361273;
        Fri, 18 Oct 2019 12:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1571402068;
        bh=9LfF8rWL83P80bxW5adx9b4CL9hwzZ6cUe7pu2GR0n0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=aMaJiJPPtsBTJUkm1ziZR/Hc4aw2B2rzx/Qn1M9b8eAxNHq6iAf20KjIkmQiMxBKZ
         Lr6TIViLYlroFcARKxKrYSLBVLdcd1u2nMJZlwitHgRv8y2+otM8i8tt0MQ+umtAma
         tHC1xo/drGiejzd4BBDNTvzkbVTBIZVTdvD5BaDc=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org D59B361273
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
Subject: [PATCH V8 6/6] backlight: qcom-wled: Add auto string detection logic
Date:   Fri, 18 Oct 2019 18:03:29 +0530
Message-Id: <1571402009-8706-7-git-send-email-kgunda@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1571402009-8706-1-git-send-email-kgunda@codeaurora.org>
References: <1571402009-8706-1-git-send-email-kgunda@codeaurora.org>
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

The auto string detection algorithm checks if the current WLED
sink configuration is valid. It tries enabling every sink and
checks if the OVP fault is observed. Based on this information
it detects and enables the valid sink configuration.
Auto calibration will be triggered when the OVP fault interrupts
are seen frequently thereby it tries to fix the sink configuration.

The auto-detection also kicks in when the connected LED string
of the display-backlight malfunctions (because of damage) and
requires the damaged string to be turned off to prevent the
complete panel and/or board from being damaged.

Signed-off-by: Kiran Gunda <kgunda@codeaurora.org>
---
 drivers/video/backlight/qcom-wled.c | 398 +++++++++++++++++++++++++++++++++++-
 1 file changed, 392 insertions(+), 6 deletions(-)

diff --git a/drivers/video/backlight/qcom-wled.c b/drivers/video/backlight/qcom-wled.c
index 658b1e0..b2e6754 100644
--- a/drivers/video/backlight/qcom-wled.c
+++ b/drivers/video/backlight/qcom-wled.c
@@ -17,19 +17,29 @@
 #define WLED_MAX_STRINGS				4
 
 #define WLED_DEFAULT_BRIGHTNESS				2048
-
+#define WLED_SOFT_START_DLY_US				10000
 #define WLED3_SINK_REG_BRIGHT_MAX			0xFFF
 
 /* WLED3/WLED4 control registers */
+#define WLED3_CTRL_REG_FAULT_STATUS			0x08
+#define  WLED3_CTRL_REG_ILIM_FAULT_BIT			BIT(0)
+#define  WLED3_CTRL_REG_OVP_FAULT_BIT			BIT(1)
+#define  WLED4_CTRL_REG_SC_FAULT_BIT			BIT(2)
+
+#define WLED3_CTRL_REG_INT_RT_STS			0x10
+#define  WLED3_CTRL_REG_OVP_FAULT_STATUS		BIT(1)
+
 #define WLED3_CTRL_REG_MOD_EN				0x46
 #define  WLED3_CTRL_REG_MOD_EN_MASK			BIT(7)
 #define  WLED3_CTRL_REG_MOD_EN_SHIFT			7
 
+#define WLED3_CTRL_REG_FEEDBACK_CONTROL			0x48
+
 #define WLED3_CTRL_REG_FREQ				0x4c
 #define  WLED3_CTRL_REG_FREQ_MASK			GENMASK(3, 0)
 
 #define WLED3_CTRL_REG_OVP				0x4d
-#define  WLED3_CTRL_REG_OVP_MASK				GENMASK(1, 0)
+#define  WLED3_CTRL_REG_OVP_MASK			GENMASK(1, 0)
 
 #define WLED3_CTRL_REG_ILIMIT				0x4e
 #define  WLED3_CTRL_REG_ILIMIT_MASK			GENMASK(2, 0)
@@ -119,6 +129,7 @@ struct wled_config {
 	bool ext_gen;
 	bool cabc;
 	bool external_pfet;
+	bool auto_detection_enabled;
 };
 
 struct wled {
@@ -127,17 +138,22 @@ struct wled {
 	struct regmap *regmap;
 	struct mutex lock;	/* Lock to avoid race from thread irq handler */
 	ktime_t last_short_event;
+	ktime_t start_ovp_fault_time;
 	u16 ctrl_addr;
 	u16 sink_addr;
 	u16 max_string_count;
+	u16 auto_detection_ovp_count;
 	u32 brightness;
 	u32 max_brightness;
 	u32 short_count;
+	u32 auto_detect_count;
 	bool disabled_by_short;
 	bool has_short_detect;
 	int short_irq;
+	int ovp_irq;
 
 	struct wled_config cfg;
+	struct delayed_work ovp_work;
 	int (*wled_set_brightness)(struct wled *wled, u16 brightness);
 };
 
@@ -182,6 +198,13 @@ static int wled4_set_brightness(struct wled *wled, u16 brightness)
 	return 0;
 }
 
+static void wled_ovp_work(struct work_struct *work)
+{
+	struct wled *wled = container_of(work,
+					 struct wled, ovp_work.work);
+	enable_irq(wled->ovp_irq);
+}
+
 static int wled_module_enable(struct wled *wled, int val)
 {
 	int rc;
@@ -193,7 +216,23 @@ static int wled_module_enable(struct wled *wled, int val)
 				WLED3_CTRL_REG_MOD_EN,
 				WLED3_CTRL_REG_MOD_EN_MASK,
 				val << WLED3_CTRL_REG_MOD_EN_SHIFT);
-	return rc;
+	if (rc < 0)
+		return rc;
+
+	if (wled->ovp_irq > 0) {
+		if (val) {
+			/*
+			 * Wait for at least 10ms before enabling OVP interrupt
+			 * after module enable so that soft start is completed.
+			 */
+			schedule_delayed_work(&wled->ovp_work, HZ / 100);
+		} else {
+			if (!cancel_delayed_work_sync(&wled->ovp_work))
+				disable_irq(wled->ovp_irq);
+		}
+	}
+
+	return 0;
 }
 
 static int wled_sync_toggle(struct wled *wled)
@@ -300,6 +339,304 @@ static irqreturn_t wled_short_irq_handler(int irq, void *_wled)
 	return IRQ_HANDLED;
 }
 
+#define AUTO_DETECT_BRIGHTNESS		200
+
+static void wled_auto_string_detection(struct wled *wled)
+{
+	int rc = 0, i;
+	u32 sink_config = 0, int_sts;
+	u8 sink_test = 0, sink_valid = 0, val;
+
+	/* Read configured sink configuration */
+	rc = regmap_read(wled->regmap, wled->sink_addr +
+			 WLED4_SINK_REG_CURR_SINK, &sink_config);
+	if (rc < 0) {
+		dev_err(wled->dev, "Failed to read SINK configuration rc=%d\n",
+			rc);
+		goto failed_detect;
+	}
+
+	/* Disable the module before starting detection */
+	rc = regmap_update_bits(wled->regmap,
+				wled->ctrl_addr + WLED3_CTRL_REG_MOD_EN,
+				WLED3_CTRL_REG_MOD_EN_MASK, 0);
+	if (rc < 0) {
+		dev_err(wled->dev, "Failed to disable WLED module rc=%d\n", rc);
+		goto failed_detect;
+	}
+
+	/* Set low brightness across all sinks */
+	rc = wled4_set_brightness(wled, AUTO_DETECT_BRIGHTNESS);
+	if (rc < 0) {
+		dev_err(wled->dev, "Failed to set brightness for auto detection rc=%d\n",
+			rc);
+		goto failed_detect;
+	}
+
+	if (wled->cfg.cabc) {
+		for (i = 0; i < wled->cfg.num_strings; i++) {
+			rc = regmap_update_bits(wled->regmap, wled->sink_addr +
+						WLED4_SINK_REG_STR_CABC(i),
+						WLED4_SINK_REG_STR_CABC_MASK,
+						0);
+			if (rc < 0)
+				goto failed_detect;
+		}
+	}
+
+	/* Disable all sinks */
+	rc = regmap_write(wled->regmap,
+			  wled->sink_addr + WLED4_SINK_REG_CURR_SINK, 0);
+	if (rc < 0) {
+		dev_err(wled->dev, "Failed to disable all sinks rc=%d\n", rc);
+		goto failed_detect;
+	}
+
+	/* Iterate through the strings one by one */
+	for (i = 0; i < wled->cfg.num_strings; i++) {
+		sink_test = BIT((WLED4_SINK_REG_CURR_SINK_SHFT + i));
+
+		/* Enable feedback control */
+		rc = regmap_write(wled->regmap, wled->ctrl_addr +
+				  WLED3_CTRL_REG_FEEDBACK_CONTROL, i + 1);
+		if (rc < 0) {
+			dev_err(wled->dev, "Failed to enable feedback for SINK %d rc = %d\n",
+				i + 1, rc);
+			goto failed_detect;
+		}
+
+		/* Enable the sink */
+		rc = regmap_write(wled->regmap, wled->sink_addr +
+				  WLED4_SINK_REG_CURR_SINK, sink_test);
+		if (rc < 0) {
+			dev_err(wled->dev, "Failed to configure SINK %d rc=%d\n",
+				i + 1, rc);
+			goto failed_detect;
+		}
+
+		/* Enable the module */
+		rc = regmap_update_bits(wled->regmap, wled->ctrl_addr +
+					WLED3_CTRL_REG_MOD_EN,
+					WLED3_CTRL_REG_MOD_EN_MASK,
+					WLED3_CTRL_REG_MOD_EN_MASK);
+		if (rc < 0) {
+			dev_err(wled->dev, "Failed to enable WLED module rc=%d\n",
+				rc);
+			goto failed_detect;
+		}
+
+		usleep_range(WLED_SOFT_START_DLY_US,
+			     WLED_SOFT_START_DLY_US + 1000);
+
+		rc = regmap_read(wled->regmap, wled->ctrl_addr +
+				 WLED3_CTRL_REG_INT_RT_STS, &int_sts);
+		if (rc < 0) {
+			dev_err(wled->dev, "Error in reading WLED3_CTRL_INT_RT_STS rc=%d\n",
+				rc);
+			goto failed_detect;
+		}
+
+		if (int_sts & WLED3_CTRL_REG_OVP_FAULT_STATUS)
+			dev_dbg(wled->dev, "WLED OVP fault detected with SINK %d\n",
+				i + 1);
+		else
+			sink_valid |= sink_test;
+
+		/* Disable the module */
+		rc = regmap_update_bits(wled->regmap,
+					wled->ctrl_addr + WLED3_CTRL_REG_MOD_EN,
+					WLED3_CTRL_REG_MOD_EN_MASK, 0);
+		if (rc < 0) {
+			dev_err(wled->dev, "Failed to disable WLED module rc=%d\n",
+				rc);
+			goto failed_detect;
+		}
+	}
+
+	if (!sink_valid) {
+		dev_err(wled->dev, "No valid WLED sinks found\n");
+		wled->disabled_by_short = true;
+		goto failed_detect;
+	}
+
+	if (sink_valid != sink_config) {
+		dev_warn(wled->dev, "%x is not a valid sink configuration - using %x instead\n",
+			 sink_config, sink_valid);
+		sink_config = sink_valid;
+	}
+
+	/* Write the new sink configuration */
+	rc = regmap_write(wled->regmap,
+			  wled->sink_addr + WLED4_SINK_REG_CURR_SINK,
+			  sink_config);
+	if (rc < 0) {
+		dev_err(wled->dev, "Failed to reconfigure the default sink rc=%d\n",
+			rc);
+		goto failed_detect;
+	}
+
+	/* Enable valid sinks */
+	for (i = 0; i < wled->cfg.num_strings; i++) {
+		if (wled->cfg.cabc) {
+			rc = regmap_update_bits(wled->regmap, wled->sink_addr +
+						WLED4_SINK_REG_STR_CABC(i),
+						WLED4_SINK_REG_STR_CABC_MASK,
+						WLED4_SINK_REG_STR_CABC_MASK);
+			if (rc < 0)
+				goto failed_detect;
+		}
+
+		if (sink_config & BIT(WLED4_SINK_REG_CURR_SINK_SHFT + i))
+			val = WLED4_SINK_REG_STR_MOD_MASK;
+		else
+			val = 0x0; /* Disable modulator_en for unused sink */
+
+		rc = regmap_write(wled->regmap, wled->sink_addr +
+				  WLED4_SINK_REG_STR_MOD_EN(i), val);
+		if (rc < 0) {
+			dev_err(wled->dev, "Failed to configure MODULATOR_EN rc=%d\n",
+				rc);
+			goto failed_detect;
+		}
+	}
+
+	/* Restore the feedback setting */
+	rc = regmap_write(wled->regmap,
+			  wled->ctrl_addr + WLED3_CTRL_REG_FEEDBACK_CONTROL, 0);
+	if (rc < 0) {
+		dev_err(wled->dev, "Failed to restore feedback setting rc=%d\n",
+			rc);
+		goto failed_detect;
+	}
+
+	/* Restore brightness */
+	rc = wled4_set_brightness(wled, wled->brightness);
+	if (rc < 0) {
+		dev_err(wled->dev, "Failed to set brightness after auto detection rc=%d\n",
+			rc);
+		goto failed_detect;
+	}
+
+	rc = regmap_update_bits(wled->regmap,
+				wled->ctrl_addr + WLED3_CTRL_REG_MOD_EN,
+				WLED3_CTRL_REG_MOD_EN_MASK,
+				WLED3_CTRL_REG_MOD_EN_MASK);
+	if (rc < 0) {
+		dev_err(wled->dev, "Failed to enable WLED module rc=%d\n", rc);
+		goto failed_detect;
+	}
+
+failed_detect:
+	return;
+}
+
+#define WLED_AUTO_DETECT_OVP_COUNT		5
+#define WLED_AUTO_DETECT_CNT_DLY_US		USEC_PER_SEC
+static bool wled_auto_detection_required(struct wled *wled)
+{
+	s64 elapsed_time_us;
+
+	if (!wled->cfg.auto_detection_enabled)
+		return false;
+
+	/*
+	 * Check if the OVP fault was an occasional one
+	 * or if it's firing continuously, the latter qualifies
+	 * for an auto-detection check.
+	 */
+	if (!wled->auto_detection_ovp_count) {
+		wled->start_ovp_fault_time = ktime_get();
+		wled->auto_detection_ovp_count++;
+	} else {
+		elapsed_time_us = ktime_us_delta(ktime_get(),
+						 wled->start_ovp_fault_time);
+		if (elapsed_time_us > WLED_AUTO_DETECT_CNT_DLY_US)
+			wled->auto_detection_ovp_count = 0;
+		else
+			wled->auto_detection_ovp_count++;
+
+		if (wled->auto_detection_ovp_count >=
+				WLED_AUTO_DETECT_OVP_COUNT) {
+			wled->auto_detection_ovp_count = 0;
+			return true;
+		}
+	}
+
+	return false;
+}
+
+static int wled_auto_detection_at_init(struct wled *wled)
+{
+	int rc;
+	u32 fault_status, rt_status;
+
+	if (!wled->cfg.auto_detection_enabled)
+		return 0;
+
+	rc = regmap_read(wled->regmap,
+			 wled->ctrl_addr + WLED3_CTRL_REG_INT_RT_STS,
+			 &rt_status);
+	if (rc < 0) {
+		dev_err(wled->dev, "Failed to read RT status rc=%d\n", rc);
+		return rc;
+	}
+
+	rc = regmap_read(wled->regmap,
+			 wled->ctrl_addr + WLED3_CTRL_REG_FAULT_STATUS,
+			 &fault_status);
+	if (rc < 0) {
+		dev_err(wled->dev, "Failed to read fault status rc=%d\n", rc);
+		return rc;
+	}
+
+	if ((rt_status & WLED3_CTRL_REG_OVP_FAULT_STATUS) ||
+	    (fault_status & WLED3_CTRL_REG_OVP_FAULT_BIT)) {
+		mutex_lock(&wled->lock);
+		wled_auto_string_detection(wled);
+		mutex_unlock(&wled->lock);
+	}
+
+	return rc;
+}
+
+static irqreturn_t wled_ovp_irq_handler(int irq, void *_wled)
+{
+	struct wled *wled = _wled;
+	int rc;
+	u32 int_sts, fault_sts;
+
+	rc = regmap_read(wled->regmap,
+			 wled->ctrl_addr + WLED3_CTRL_REG_INT_RT_STS, &int_sts);
+	if (rc < 0) {
+		dev_err(wled->dev, "Error in reading WLED3_INT_RT_STS rc=%d\n",
+			rc);
+		return IRQ_HANDLED;
+	}
+
+	rc = regmap_read(wled->regmap, wled->ctrl_addr +
+			 WLED3_CTRL_REG_FAULT_STATUS, &fault_sts);
+	if (rc < 0) {
+		dev_err(wled->dev, "Error in reading WLED_FAULT_STATUS rc=%d\n",
+			rc);
+		return IRQ_HANDLED;
+	}
+
+	if (fault_sts & (WLED3_CTRL_REG_OVP_FAULT_BIT |
+		WLED3_CTRL_REG_ILIM_FAULT_BIT))
+		dev_dbg(wled->dev, "WLED OVP fault detected, int_sts=%x fault_sts= %x\n",
+			int_sts, fault_sts);
+
+	if (fault_sts & WLED3_CTRL_REG_OVP_FAULT_BIT) {
+		if (wled_auto_detection_required(wled)) {
+			mutex_lock(&wled->lock);
+			wled_auto_string_detection(wled);
+			mutex_unlock(&wled->lock);
+		}
+	}
+
+	return IRQ_HANDLED;
+}
+
 static int wled3_setup(struct wled *wled)
 {
 	u16 addr;
@@ -436,8 +773,10 @@ static int wled4_setup(struct wled *wled)
 		sink_en |= 1 << temp;
 	}
 
-	if (sink_cfg == sink_en)
-		return 0;
+	if (sink_cfg == sink_en) {
+		rc = wled_auto_detection_at_init(wled);
+		return rc;
+	}
 
 	rc = regmap_update_bits(wled->regmap,
 				wled->sink_addr + WLED4_SINK_REG_CURR_SINK,
@@ -500,7 +839,9 @@ static int wled4_setup(struct wled *wled)
 		return rc;
 	}
 
-	return 0;
+	rc = wled_auto_detection_at_init(wled);
+
+	return rc;
 }
 
 static const struct wled_config wled4_config_defaults = {
@@ -511,6 +852,7 @@ static int wled4_setup(struct wled *wled)
 	.switch_freq = 11,
 	.cabc = false,
 	.external_pfet = false,
+	.auto_detection_enabled = false,
 };
 
 static const u32 wled3_boost_i_limit_values[] = {
@@ -677,6 +1019,7 @@ static int wled_configure(struct wled *wled, int version)
 		{ "qcom,ext-gen", &cfg->ext_gen, },
 		{ "qcom,cabc", &cfg->cabc, },
 		{ "qcom,external-pfet", &cfg->external_pfet, },
+		{ "qcom,auto-string-detection", &cfg->auto_detection_enabled, },
 	};
 
 	prop_addr = of_get_address(dev->of_node, 0, NULL, NULL);
@@ -797,6 +1140,40 @@ static int wled_configure_short_irq(struct wled *wled,
 	return rc;
 }
 
+static int wled_configure_ovp_irq(struct wled *wled,
+				  struct platform_device *pdev)
+{
+	int rc;
+	u32 val;
+
+	wled->ovp_irq = platform_get_irq_byname(pdev, "ovp");
+	if (wled->ovp_irq < 0) {
+		dev_dbg(&pdev->dev, "OVP IRQ not found - disabling automatic string detection\n");
+		return 0;
+	}
+
+	rc = devm_request_threaded_irq(wled->dev, wled->ovp_irq, NULL,
+				       wled_ovp_irq_handler, IRQF_ONESHOT,
+				       "wled_ovp_irq", wled);
+	if (rc < 0) {
+		dev_err(wled->dev, "Unable to request ovp_irq (err:%d)\n",
+			rc);
+		wled->ovp_irq = 0;
+		return 0;
+	}
+
+	rc = regmap_read(wled->regmap, wled->ctrl_addr +
+			 WLED3_CTRL_REG_MOD_EN, &val);
+	if (rc < 0)
+		return rc;
+
+	/* Keep OVP irq disabled until module is enabled */
+	if (!(val & WLED3_CTRL_REG_MOD_EN_MASK))
+		disable_irq(wled->ovp_irq);
+
+	return 0;
+}
+
 static const struct backlight_ops wled_ops = {
 	.update_status = wled_update_status,
 };
@@ -837,6 +1214,7 @@ static int wled_probe(struct platform_device *pdev)
 
 	switch (version) {
 	case 3:
+		wled->cfg.auto_detection_enabled = false;
 		rc = wled3_setup(wled);
 		if (rc) {
 			dev_err(&pdev->dev, "wled3_setup failed\n");
@@ -858,10 +1236,16 @@ static int wled_probe(struct platform_device *pdev)
 		break;
 	}
 
+	INIT_DELAYED_WORK(&wled->ovp_work, wled_ovp_work);
+
 	rc = wled_configure_short_irq(wled, pdev);
 	if (rc < 0)
 		return rc;
 
+	rc = wled_configure_ovp_irq(wled, pdev);
+	if (rc < 0)
+		return rc;
+
 	val = WLED_DEFAULT_BRIGHTNESS;
 	of_property_read_u32(pdev->dev.of_node, "default-brightness", &val);
 
@@ -880,7 +1264,9 @@ static int wled_remove(struct platform_device *pdev)
 	struct wled *wled = dev_get_drvdata(&pdev->dev);
 
 	mutex_destroy(&wled->lock);
+	cancel_delayed_work_sync(&wled->ovp_work);
 	disable_irq(wled->short_irq);
+	disable_irq(wled->ovp_irq);
 
 	return 0;
 }
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
 a Linux Foundation Collaborative Project

