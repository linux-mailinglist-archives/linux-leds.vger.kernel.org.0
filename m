Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EEBB319CC0B
	for <lists+linux-leds@lfdr.de>; Thu,  2 Apr 2020 22:50:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731892AbgDBUuM (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 2 Apr 2020 16:50:12 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:46958 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727412AbgDBUuM (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 2 Apr 2020 16:50:12 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 032Ko9eR088578;
        Thu, 2 Apr 2020 15:50:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1585860609;
        bh=AkNzSOM+cfzfMgPFZCofsyuNFkmoUeBEW5VcELdPpsA=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=b73bz3sQBZRdvRvSZr8PEXE5qVE3lWzQOEAnKS6z4fYuJA8ccP2OSecQ3XO54HcFy
         W+RHIObC4mELZ+0KRG1ycI2Wrqaex0kOUV1jcOISQNyu2HTEIQkXEqkXmXFGB3RMpg
         fHPC/6lWTsV2iaKSERtKN7MJ1YxvKXpGsT4UE43A=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 032Ko9CJ048720
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 2 Apr 2020 15:50:09 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 2 Apr
 2020 15:50:09 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 2 Apr 2020 15:50:09 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 032Ko94l010393;
        Thu, 2 Apr 2020 15:50:09 -0500
From:   Dan Murphy <dmurphy@ti.com>
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Dan Murphy <dmurphy@ti.com>
Subject: [PATCH v19 15/18] leds: lp5521: Add multicolor framework multicolor brightness support
Date:   Thu, 2 Apr 2020 15:43:08 -0500
Message-ID: <20200402204311.14998-16-dmurphy@ti.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200402204311.14998-1-dmurphy@ti.com>
References: <20200402204311.14998-1-dmurphy@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Add the multicolor brightness call back to support the multicolor
framework. This function allows setting the brightness across
grouped LED channels in a single call.

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 drivers/leds/leds-lp5521.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/leds/leds-lp5521.c b/drivers/leds/leds-lp5521.c
index 6ff81d6be789..26498d5d3bb3 100644
--- a/drivers/leds/leds-lp5521.c
+++ b/drivers/leds/leds-lp5521.c
@@ -349,6 +349,25 @@ static int lp5521_run_selftest(struct lp55xx_chip *chip, char *buf)
 	return 0;
 }
 
+static int lp5521_multicolor_brightness(struct lp55xx_led *led)
+{
+	struct lp55xx_chip *chip = led->chip;
+	int ret;
+	int i;
+
+	mutex_lock(&chip->lock);
+	for (i = 0; i < led->mc_cdev.num_colors; i++) {
+		ret = lp55xx_write(chip,
+				   LP5521_REG_LED_PWM_BASE +
+				   led->mc_cdev.multicolor_info[i].color_channel,
+				   led->mc_cdev.multicolor_info[i].color_brightness);
+		if (ret)
+			break;
+	}
+	mutex_unlock(&chip->lock);
+	return ret;
+}
+
 static int lp5521_led_brightness(struct lp55xx_led *led)
 {
 	struct lp55xx_chip *chip = led->chip;
@@ -490,6 +509,7 @@ static struct lp55xx_device_config lp5521_cfg = {
 	.max_channel  = LP5521_MAX_LEDS,
 	.post_init_device   = lp5521_post_init_device,
 	.brightness_fn      = lp5521_led_brightness,
+	.multicolor_brightness_fn = lp5521_multicolor_brightness,
 	.set_led_current    = lp5521_set_led_current,
 	.firmware_cb        = lp5521_firmware_loaded,
 	.run_engine         = lp5521_run_engine,
-- 
2.25.1

