Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C5F521E279B
	for <lists+linux-leds@lfdr.de>; Tue, 26 May 2020 18:49:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731363AbgEZQsA (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 26 May 2020 12:48:00 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:46444 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730337AbgEZQsA (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 26 May 2020 12:48:00 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 04QGlu5l056122;
        Tue, 26 May 2020 11:47:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1590511676;
        bh=iwYcaQWscbUXpurA0+8bo40RMbr/VEmvKks8cb+baDU=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=qYuyRA2yceMaB8FTp2hK8vNMWHiI6P8G0XBfV96D8h4K242xbJ98qJGLS10Fy2JtE
         lBw9TcvcxYuR9DQdMYcC9G8lJOrM9THik0T1oSa24Bb/YRbpXSTot8JuqUbmBWxZtG
         zeshAg8sLdOmiV39xSd7YdH2BNrYfNQ0Sxn+Qzu4=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 04QGluNF039425
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 26 May 2020 11:47:56 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 26
 May 2020 11:47:56 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 26 May 2020 11:47:56 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04QGlujX047716;
        Tue, 26 May 2020 11:47:56 -0500
From:   Dan Murphy <dmurphy@ti.com>
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>, <robh@kernel.org>
CC:     <devicetree@vger.kernel.org>, <linux-leds@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Dan Murphy <dmurphy@ti.com>
Subject: [PATCH v25 13/16] leds: lp5521: Add multicolor framework multicolor brightness support
Date:   Tue, 26 May 2020 11:46:49 -0500
Message-ID: <20200526164652.2331-14-dmurphy@ti.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200526164652.2331-1-dmurphy@ti.com>
References: <20200526164652.2331-1-dmurphy@ti.com>
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

Acked-by: Pavel Machek <pavel@ucw.cz>
Acked-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 drivers/leds/Kconfig       |  1 +
 drivers/leds/leds-lp5521.c | 20 ++++++++++++++++++++
 2 files changed, 21 insertions(+)

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index 8b28f73c810c..bdf8fc2652fb 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -398,6 +398,7 @@ config LEDS_LP55XX_COMMON
 config LEDS_LP5521
 	tristate "LED Support for N.S. LP5521 LED driver chip"
 	depends on LEDS_CLASS && I2C
+	depends on LEDS_CLASS_MULTI_COLOR || !LEDS_CLASS_MULTI_COLOR
 	select LEDS_LP55XX_COMMON
 	help
 	  If you say yes here you get support for the National Semiconductor
diff --git a/drivers/leds/leds-lp5521.c b/drivers/leds/leds-lp5521.c
index 6ff81d6be789..ef8c3bfa8f3c 100644
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
+				   led->mc_cdev.subled_info[i].channel,
+				   led->mc_cdev.subled_info[i].brightness);
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

