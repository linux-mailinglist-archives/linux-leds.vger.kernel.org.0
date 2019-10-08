Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B2F2FD026B
	for <lists+linux-leds@lfdr.de>; Tue,  8 Oct 2019 22:49:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731051AbfJHUsz (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 8 Oct 2019 16:48:55 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:45800 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731127AbfJHUsY (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 8 Oct 2019 16:48:24 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x98KmMlk097369;
        Tue, 8 Oct 2019 15:48:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1570567702;
        bh=DWlAPkPyGPLMlgt95vLmSAWY5AQ+1wT9MtJDSpag9us=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=LYGHrPTnNtKtCzDRJsLgICNdgnZSZ9b3wbgwf4ovaCzoKPWOfo8bj1lVo0LmeGJrY
         mD7tQENm72502kHdhA2hUfm+8UX1uhx0QeycmSAgom+KqTwwpkSfMOwCjRjOCFr645
         YFVu9KB65NL4mUijJsGkLvNS+4Ib9yGhv73go6qk=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x98KmM2T042373
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 8 Oct 2019 15:48:22 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 8 Oct
 2019 15:48:19 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 8 Oct 2019 15:48:22 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x98KmLSN073126;
        Tue, 8 Oct 2019 15:48:21 -0500
From:   Dan Murphy <dmurphy@ti.com>
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Dan Murphy <dmurphy@ti.com>
Subject: [PATCH v11 14/16] leds: lp5521: Add multicolor framework intensity support
Date:   Tue, 8 Oct 2019 15:47:58 -0500
Message-ID: <20191008204800.19870-15-dmurphy@ti.com>
X-Mailer: git-send-email 2.22.0.214.g8dca754b1e
In-Reply-To: <20191008204800.19870-1-dmurphy@ti.com>
References: <20191008204800.19870-1-dmurphy@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Add the intensity function call back to support the multicolor
framework. This function allows setting a specific brightness on
a specific channel.

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 drivers/leds/leds-lp5521.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/leds/leds-lp5521.c b/drivers/leds/leds-lp5521.c
index 6f0272249dc8..05731f405c9a 100644
--- a/drivers/leds/leds-lp5521.c
+++ b/drivers/leds/leds-lp5521.c
@@ -349,6 +349,25 @@ static int lp5521_run_selftest(struct lp55xx_chip *chip, char *buf)
 	return 0;
 }
 
+static int lp5521_led_intensity(struct lp55xx_led *led)
+{
+	struct lp55xx_chip *chip = led->chip;
+	int ret;
+	int i;
+
+	mutex_lock(&chip->lock);
+	for (i = 0; i < led->mc_cdev.num_leds; i++) {
+		ret = lp55xx_write(chip,
+				   LP5521_REG_LED_PWM_BASE +
+				   led->color_component[i].output_num,
+				   led->color_component[i].brightness);
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
+	.color_intensity_fn = lp5521_led_intensity,
 	.set_led_current    = lp5521_set_led_current,
 	.firmware_cb        = lp5521_firmware_loaded,
 	.run_engine         = lp5521_run_engine,
-- 
2.22.0.214.g8dca754b1e

