Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06AC61FD091
	for <lists+linux-leds@lfdr.de>; Wed, 17 Jun 2020 17:11:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727771AbgFQPKe (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 17 Jun 2020 11:10:34 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:32896 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727121AbgFQPKc (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 17 Jun 2020 11:10:32 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 05HFATQ5117079;
        Wed, 17 Jun 2020 10:10:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1592406629;
        bh=+LYKN1Pq2F/LuV9iJvrrRWifuR4y4GQ5OVW8WFHqYck=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=Mjuj0dqFIBqtUp92BS3SjGGdaO2dJfiE0413B+rz3zXaST7hJaaN0jPDV6hB28ipd
         2f/YmXUUAd+plQvUh9UMHTPNyvPYa6IOo45RatBpQ/cc2iMUMI/jkRM6lTdLoldU/5
         H75CL6C8nP2codtVew8FsX/ABwQdjDo/94uMSXwU=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 05HFATOj112797;
        Wed, 17 Jun 2020 10:10:29 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 17
 Jun 2020 10:10:28 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 17 Jun 2020 10:10:28 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 05HFASCi042118;
        Wed, 17 Jun 2020 10:10:28 -0500
From:   Dan Murphy <dmurphy@ti.com>
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>, <robh@kernel.org>
CC:     <devicetree@vger.kernel.org>, <linux-leds@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Dan Murphy <dmurphy@ti.com>
Subject: [PATCH v28 12/15] leds: lp5523: Update the lp5523 code to add multicolor brightness function
Date:   Wed, 17 Jun 2020 10:09:21 -0500
Message-ID: <20200617150924.12665-13-dmurphy@ti.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200617150924.12665-1-dmurphy@ti.com>
References: <20200617150924.12665-1-dmurphy@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Add the multicolor brightness call back to support the multicolor
framework.  This call back allows setting  brightness on grouped channels
in a single function.

Acked-by: Pavel Machek <pavel@ucw.cz>
Acked-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 drivers/leds/Kconfig       |  1 +
 drivers/leds/leds-lp5523.c | 20 ++++++++++++++++++++
 2 files changed, 21 insertions(+)

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index 04e0cb39f92e..44d8b2293436 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -418,6 +418,7 @@ config LEDS_LP5521
 config LEDS_LP5523
 	tristate "LED Support for TI/National LP5523/55231 LED driver chip"
 	depends on LEDS_CLASS && I2C
+	depends on LEDS_CLASS_MULTI_COLOR || !LEDS_CLASS_MULTI_COLOR
 	select LEDS_LP55XX_COMMON
 	help
 	  If you say yes here you get support for TI/National Semiconductor
diff --git a/drivers/leds/leds-lp5523.c b/drivers/leds/leds-lp5523.c
index b076c16df9ab..9776dc72a764 100644
--- a/drivers/leds/leds-lp5523.c
+++ b/drivers/leds/leds-lp5523.c
@@ -791,6 +791,25 @@ static ssize_t store_master_fader_leds(struct device *dev,
 	return ret;
 }
 
+static int lp5523_multicolor_brightness(struct lp55xx_led *led)
+{
+	struct lp55xx_chip *chip = led->chip;
+	int ret;
+	int i;
+
+	mutex_lock(&chip->lock);
+	for (i = 0; i < led->mc_cdev.num_colors; i++) {
+		ret = lp55xx_write(chip,
+				   LP5523_REG_LED_PWM_BASE +
+				   led->mc_cdev.subled_info[i].channel,
+				   led->mc_cdev.subled_info[i].brightness);
+		if (ret)
+			break;
+	}
+	mutex_unlock(&chip->lock);
+	return ret;
+}
+
 static int lp5523_led_brightness(struct lp55xx_led *led)
 {
 	struct lp55xx_chip *chip = led->chip;
@@ -857,6 +876,7 @@ static struct lp55xx_device_config lp5523_cfg = {
 	.max_channel  = LP5523_MAX_LEDS,
 	.post_init_device   = lp5523_post_init_device,
 	.brightness_fn      = lp5523_led_brightness,
+	.multicolor_brightness_fn = lp5523_multicolor_brightness,
 	.set_led_current    = lp5523_set_led_current,
 	.firmware_cb        = lp5523_firmware_loaded,
 	.run_engine         = lp5523_run_engine,
-- 
2.26.2

