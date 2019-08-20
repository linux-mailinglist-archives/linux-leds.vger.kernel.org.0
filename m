Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6EB23969CF
	for <lists+linux-leds@lfdr.de>; Tue, 20 Aug 2019 21:53:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730825AbfHTTxo (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 20 Aug 2019 15:53:44 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:44754 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729950AbfHTTx2 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 20 Aug 2019 15:53:28 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7KJrJbC074736;
        Tue, 20 Aug 2019 14:53:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1566330799;
        bh=oH8rA+GYC1E9/xLKHbjhVcCj8L8mfXzFysEW/hW1eI0=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=tOaiQTuJK7qdWCykBw0JATVt68L+WHITg5DIClTAwTCS4ir3zWkliUGY2HT1c2v4p
         vCowxpSetk6j7TRqkEAE1g6QWRoghXU2Dn0P4raYQx/sHktW/YbvVuzLCCyGyJyFZ3
         D06+ttDrb4ecteDoTLaqlnpkm09l7IxWDTAIfWJ8=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7KJrJNS116203
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 20 Aug 2019 14:53:19 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 20
 Aug 2019 14:53:18 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 20 Aug 2019 14:53:18 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7KJrIqu008196;
        Tue, 20 Aug 2019 14:53:18 -0500
From:   Dan Murphy <dmurphy@ti.com>
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>, <tony@atomide.com>,
        <sre@kernel.org>, <nekit1000@gmail.com>, <mpartap@gmx.net>,
        <merlijn@wizzup.org>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Dan Murphy <dmurphy@ti.com>
Subject: [PATCH v3 5/5] leds: lm3532: Add full scale current configuration
Date:   Tue, 20 Aug 2019 14:53:07 -0500
Message-ID: <20190820195307.27590-5-dmurphy@ti.com>
X-Mailer: git-send-email 2.22.0.214.g8dca754b1e
In-Reply-To: <20190820195307.27590-1-dmurphy@ti.com>
References: <20190820195307.27590-1-dmurphy@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Allow the full scale current to be configured at init.
Valid rangles are 5mA->29.8mA.

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---

v3 - Fixed variable movement change and updated the fs current register calculation -
https://lore.kernel.org/patchwork/patch/1114544/

 drivers/leds/leds-lm3532.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/leds/leds-lm3532.c b/drivers/leds/leds-lm3532.c
index 5e33ae4561f2..ba352d76a8fb 100644
--- a/drivers/leds/leds-lm3532.c
+++ b/drivers/leds/leds-lm3532.c
@@ -89,6 +89,10 @@
 #define LM3532_NUM_AVG_VALS	8
 #define LM3532_NUM_IMP_VALS	32
 
+#define LM3532_FS_CURR_MIN	5000
+#define LM3532_FS_CURR_MAX	29800
+#define LM3532_FS_CURR_STEP	800
+
 /*
  * struct lm3532_als_data
  * @config - value of ALS configuration register
@@ -121,6 +125,7 @@ struct lm3532_als_data {
  * @mode - Mode of the LED string
  * @ctrl_brt_pointer - Zone target register that controls the sink
  * @num_leds - Number of LED strings are supported in this array
+ * @full_scale_current - The full-scale current setting for the current sink.
  * @led_strings - The LED strings supported in this array
  * @label - LED label
  */
@@ -132,6 +137,7 @@ struct lm3532_led {
 	int mode;
 	int ctrl_brt_pointer;
 	int num_leds;
+	int full_scale_current;
 	u32 led_strings[LM3532_MAX_CONTROL_BANKS];
 	char label[LED_MAX_NAME_SIZE];
 };
@@ -363,6 +369,8 @@ static int lm3532_init_registers(struct lm3532_led *led)
 	unsigned int output_cfg_mask = 0;
 	unsigned int brightness_config_reg;
 	unsigned int brightness_config_val;
+	int fs_current_reg;
+	int fs_current_val;
 	int ret, i;
 
 	if (drvdata->enable_gpio)
@@ -385,6 +393,17 @@ static int lm3532_init_registers(struct lm3532_led *led)
 	if (ret)
 		return ret;
 
+	if (led->full_scale_current) {
+		fs_current_reg = LM3532_REG_CTRL_A_FS_CURR + led->control_bank * 2;
+		fs_current_val = (led->full_scale_current - LM3532_FS_CURR_MIN) /
+				 LM3532_FS_CURR_STEP;
+
+		ret = regmap_write(drvdata->regmap, fs_current_reg,
+				   fs_current_val);
+		if (ret)
+			return ret;
+	}
+
 	for (i = 0; i < led->num_leds; i++) {
 		output_cfg_shift = led->led_strings[i] * 2;
 		output_cfg_val |= (led->control_bank << output_cfg_shift);
@@ -560,6 +579,12 @@ static int lm3532_parse_node(struct lm3532_data *priv)
 			goto child_out;
 		}
 
+		ret = fwnode_property_read_u32(child, "led-max-microamp",
+					       &led->full_scale_current);
+
+		if (led->full_scale_current > LM3532_FS_CURR_MAX)
+			led->full_scale_current = LM3532_FS_CURR_MAX;
+
 		if (led->mode == LM3532_BL_MODE_ALS) {
 			led->mode = LM3532_ALS_CTRL;
 			ret = lm3532_parse_als(priv);
-- 
2.22.0.214.g8dca754b1e

