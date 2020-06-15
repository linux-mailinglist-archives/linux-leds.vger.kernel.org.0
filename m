Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C69E91FA13B
	for <lists+linux-leds@lfdr.de>; Mon, 15 Jun 2020 22:18:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731563AbgFOUQ6 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 15 Jun 2020 16:16:58 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:35476 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731549AbgFOUQ5 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 15 Jun 2020 16:16:57 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 05FKGs86091789;
        Mon, 15 Jun 2020 15:16:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1592252214;
        bh=NFhGB7Jzovu4A0Og8qnlBwEXjUNkBEbSj+3iyIw2zGI=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=Y1AyMLyhChsxKyfQ+qGPMFoAkEG1g4aEgAmwwEYlacaHU9vi2x91AQ0dveBH0oSBt
         yGb03zVCQE6WHIW3fwukBRNTh9Wu0XVVCUpBXaS2f1E6HlzDh98pQNOqaqwfP6kbje
         5q/UfDlXyBw92b2lsf0uksMlI3MvjO1v85KsVohQ=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 05FKGsqG046468;
        Mon, 15 Jun 2020 15:16:54 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 15
 Jun 2020 15:16:54 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 15 Jun 2020 15:16:54 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 05FKGs7R123117;
        Mon, 15 Jun 2020 15:16:54 -0500
From:   Dan Murphy <dmurphy@ti.com>
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>, <robh@kernel.org>
CC:     <devicetree@vger.kernel.org>, <linux-leds@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Dan Murphy <dmurphy@ti.com>
Subject: [RESEND PATCH v27 13/15] leds: lp5521: Add multicolor framework multicolor brightness support
Date:   Mon, 15 Jun 2020 15:15:20 -0500
Message-ID: <20200615201522.19677-14-dmurphy@ti.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200615201522.19677-1-dmurphy@ti.com>
References: <20200615201522.19677-1-dmurphy@ti.com>
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
index 869b299a9eed..4970bbde6ea3 100644
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
2.26.2

