Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CA24F6C502C
	for <lists+linux-leds@lfdr.de>; Wed, 22 Mar 2023 17:10:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229987AbjCVQKJ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 22 Mar 2023 12:10:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231241AbjCVQJz (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 22 Mar 2023 12:09:55 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3664350735;
        Wed, 22 Mar 2023 09:09:51 -0700 (PDT)
Received: from mail.ideasonboard.com (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1B050189E;
        Wed, 22 Mar 2023 17:09:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1679501383;
        bh=pZY90u7KkfOtP1TIz5peMx43dbUdcVVnyNdUReBsERo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=KFjrnEh0zRTfRlVnCXSjTrmBa4tQMQj/bexDPF7H4qH/1a+0Ubo/Xl8lBQKqj7z8S
         sJF23s7HO4ef3amdJ6DCPr1XO24zF9ZCHvrMHP+d27cSPa3zMDZD8/FkwfoDHNnx3F
         AT+Q3E5lU8td/DpE6XMO5TP5UuHkYaohNClAiA3Q=
From:   Daniel Scally <dan.scally@ideasonboard.com>
To:     linux-leds@vger.kernel.org, platform-driver-x86@vger.kernel.org
Cc:     pavel@ucw.cz, lee@kernel.org, hdegoede@redhat.com,
        markgross@kernel.org, sboyd@kernel.org, hpa@redhat.com,
        Daniel Scally <dan.scally@ideasonboard.com>
Subject: [PATCH 2/8] platform/x86: int3472: Init LED registers using platform data
Date:   Wed, 22 Mar 2023 16:09:20 +0000
Message-Id: <20230322160926.948687-3-dan.scally@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230322160926.948687-1-dan.scally@ideasonboard.com>
References: <20230322160926.948687-1-dan.scally@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Check platform data to discover the appropriate settings for the PMIC's
WLED registers and set them during probe.

Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
---
 drivers/leds/leds-tps68470.c | 51 ++++++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/drivers/leds/leds-tps68470.c b/drivers/leds/leds-tps68470.c
index 35aeb5db89c8..d2060fe4259d 100644
--- a/drivers/leds/leds-tps68470.c
+++ b/drivers/leds/leds-tps68470.c
@@ -11,6 +11,7 @@
 #include <linux/leds.h>
 #include <linux/mfd/tps68470.h>
 #include <linux/module.h>
+#include <linux/platform_data/tps68470.h>
 #include <linux/platform_device.h>
 #include <linux/property.h>
 #include <linux/regmap.h>
@@ -113,6 +114,52 @@ static int tps68470_ledb_current_init(struct platform_device *pdev,
 	return ret;
 }
 
+static int tps68470_leds_init(struct tps68470_device *tps68470)
+{
+	struct tps68470_led_platform_data *pdata = tps68470->dev->platform_data;
+	int ret;
+
+	if (!pdata)
+		return 0;
+
+	ret = regmap_write(tps68470->regmap, TPS68470_REG_ILEDCTL, pdata->iledctl_ctrlb);
+	if (ret)
+		return dev_err_probe(tps68470->dev, ret, "failed to set ILED CTRLB\n");
+
+	ret = regmap_write(tps68470->regmap, TPS68470_REG_WLEDMAXF,
+			   pdata->wledmaxf & TPS68470_WLEDMAXF_MAX_CUR_MASK);
+	if (ret)
+		return dev_err_probe(tps68470->dev, ret, "failed to set WLEDMAXF\n");
+
+	ret = regmap_write(tps68470->regmap, TPS68470_REG_WLEDTO, pdata->wledto);
+	if (ret)
+		return dev_err_probe(tps68470->dev, ret, "failed to set WLEDTO\n");
+
+	ret = regmap_write(tps68470->regmap, TPS68470_REG_WLEDC1,
+			   pdata->wledc1 & TPS68470_WLEDC_ILED_MASK);
+	if (ret)
+		return dev_err_probe(tps68470->dev, ret, "failed to set WLEDC1\n");
+
+	ret = regmap_write(tps68470->regmap, TPS68470_REG_WLEDC2,
+			   pdata->wledc2 & TPS68470_WLEDC_ILED_MASK);
+	if (ret)
+		return dev_err_probe(tps68470->dev, ret, "failed to set WLEDC2\n");
+
+	ret = regmap_update_bits(tps68470->regmap, TPS68470_REG_WLEDCTL,
+				 TPS68470_WLED_DISLED1,
+				 pdata->wledctl_disled1 ? TPS68470_WLED_DISLED1 : 0);
+	if (ret)
+		return dev_err_probe(tps68470->dev, ret, "failed to set DISLED1\n");
+
+	ret = regmap_update_bits(tps68470->regmap, TPS68470_REG_WLEDCTL,
+				 TPS68470_WLED_DISLED2,
+				 pdata->wledctl_disled2 ? TPS68470_WLED_DISLED2 : 0);
+	if (ret)
+		dev_err_probe(tps68470->dev, ret, "failed to set DISLED2\n");
+
+	return 0;
+}
+
 static int tps68470_leds_probe(struct platform_device *pdev)
 {
 	int i = 0;
@@ -160,6 +207,10 @@ static int tps68470_leds_probe(struct platform_device *pdev)
 		}
 	}
 
+	ret = tps68470_leds_init(tps68470);
+	if (ret)
+		goto err_exit;
+
 err_exit:
 	if (ret) {
 		for (i = 0; i < TPS68470_NUM_LEDS; i++) {
-- 
2.34.1

