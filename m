Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 26D3B7DE91
	for <lists+linux-leds@lfdr.de>; Thu,  1 Aug 2019 17:14:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732428AbfHAPOm (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 1 Aug 2019 11:14:42 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:39082 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732399AbfHAPOc (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 1 Aug 2019 11:14:32 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x71FEN6c106267;
        Thu, 1 Aug 2019 10:14:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1564672463;
        bh=4KBp27jjz5yA6K5hHigsAsUREWOrkwoZoRT6PvQHkSw=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=uq2/cvkrg/hUulXloOrOLOTSzHIQlf5g0G/VMrAq793MxrLXz89dyrwv7Vi1ZlZU/
         kiPGVlGcQcpA3pP0iRFF1ZTzqqH2kgmqK0Kk+4/Il+vy37PqewRZlcfX6hkoAARw/B
         9gYwhBq5lOC7d934BOd6xYGX6ecnpikKSLB6BGjY=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x71FENHX121663
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 1 Aug 2019 10:14:23 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 1 Aug
 2019 10:14:23 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 1 Aug 2019 10:14:23 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x71FEMQ6125814;
        Thu, 1 Aug 2019 10:14:23 -0500
From:   Dan Murphy <dmurphy@ti.com>
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>, <tony@atomide.com>,
        <sre@kernel.org>, <nekit1000@gmail.com>, <mpartap@gmx.net>,
        <merlijn@wizzup.org>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Dan Murphy <dmurphy@ti.com>
Subject: [PATCH 3/3] leds: lm3532: Add full scale current configuration
Date:   Thu, 1 Aug 2019 10:14:21 -0500
Message-ID: <20190801151421.21486-3-dmurphy@ti.com>
X-Mailer: git-send-email 2.22.0.214.g8dca754b1e
In-Reply-To: <20190801151421.21486-1-dmurphy@ti.com>
References: <20190801151421.21486-1-dmurphy@ti.com>
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
 drivers/leds/leds-lm3532.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/leds/leds-lm3532.c b/drivers/leds/leds-lm3532.c
index ff197adb2f22..114fea12ec21 100644
--- a/drivers/leds/leds-lm3532.c
+++ b/drivers/leds/leds-lm3532.c
@@ -91,6 +91,10 @@
 #define LM3532_NUM_AVG_VALS	8
 #define LM3532_NUM_IMP_VALS	32
 
+#define LM3532_FS_CURR_MIN	5000
+#define LM3532_FS_CURR_MAX	29800
+#define LM3532_FS_CURR_STEP	800
+
 /*
  * struct lm3532_als_data
  * @config - value of ALS configuration register
@@ -133,6 +137,7 @@ struct lm3532_led {
 	int mode;
 	int num_leds;
 	int ctrl_brt_pointer;
+	int full_scale_current;
 	u32 led_strings[LM3532_MAX_CONTROL_BANKS];
 	char label[LED_MAX_NAME_SIZE];
 };
@@ -362,6 +367,8 @@ static int lm3532_init_registers(struct lm3532_led *led)
 	unsigned int output_cfg_mask = 0;
 	int brightness_config_reg;
 	int brightness_config_val;
+	int fs_current_reg;
+	int fs_current_val;
 	int ret, i;
 
 	if (drvdata->enable_gpio)
@@ -383,6 +390,16 @@ static int lm3532_init_registers(struct lm3532_led *led)
 	if (ret)
 		return ret;
 
+	if (led->full_scale_current) {
+		fs_current_reg = LM3532_REG_CTRL_A_FS_CURR + led->control_bank * 2;
+		fs_current_val = led->full_scale_current - LM3532_FS_CURR_MIN /
+				 LM3532_FS_CURR_STEP;
+		ret = regmap_write(drvdata->regmap, fs_current_reg,
+				   fs_current_val);
+		if (ret)
+			return ret;
+	}
+
 	for (i = 0; i < led->num_leds; i++) {
 		output_cfg_shift = led->led_strings[i] * 2;
 		output_cfg_val |= (led->control_bank << output_cfg_shift);
@@ -558,6 +575,12 @@ static int lm3532_parse_node(struct lm3532_data *priv)
 			goto child_out;
 		}
 
+		ret = fwnode_property_read_u32(child, "ti,fs-current",
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

