Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 51240D408E
	for <lists+linux-leds@lfdr.de>; Fri, 11 Oct 2019 15:09:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728240AbfJKNIG (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 11 Oct 2019 09:08:06 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:36950 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728234AbfJKNHY (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 11 Oct 2019 09:07:24 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9BD7Lfb078501;
        Fri, 11 Oct 2019 08:07:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1570799241;
        bh=t6ZN8MsoaN09y80TS8iaHGApS9NVGVswvlApmF+sfMA=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=aFXqrocaWhtcW8gM8qVvZ1m+4C1YY3Usxp+H+GJ90inetE42D5D0TLHd/TbDEA8fk
         DIB7eYYhIWVjX0aRp56LKFrfZE8b4ejmaQUtpUDoU3ODBX9FNQjSm9VhqSB62XyDo8
         DevuUOC68QOkfHx4miiBN3mB3C9z/1K0CRqWIb9o=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9BD7L8h094143;
        Fri, 11 Oct 2019 08:07:21 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 11
 Oct 2019 08:07:17 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 11 Oct 2019 08:07:17 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9BD7L3K105242;
        Fri, 11 Oct 2019 08:07:21 -0500
From:   Dan Murphy <dmurphy@ti.com>
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Dan Murphy <dmurphy@ti.com>
Subject: [PATCH v12 13/16] leds: lp5523: Update the lp5523 code to add intensity function
Date:   Fri, 11 Oct 2019 08:06:54 -0500
Message-ID: <20191011130657.4713-14-dmurphy@ti.com>
X-Mailer: git-send-email 2.22.0.214.g8dca754b1e
In-Reply-To: <20191011130657.4713-1-dmurphy@ti.com>
References: <20191011130657.4713-1-dmurphy@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Add the intensity function call back to support the multicolor
framework.  This function allows setting a specific brightness on
a specific channel.

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 drivers/leds/leds-lp5523.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/leds/leds-lp5523.c b/drivers/leds/leds-lp5523.c
index d0b931a136b9..5d6002e4d657 100644
--- a/drivers/leds/leds-lp5523.c
+++ b/drivers/leds/leds-lp5523.c
@@ -791,6 +791,25 @@ static ssize_t store_master_fader_leds(struct device *dev,
 	return ret;
 }
 
+static int lp5523_led_intensity(struct lp55xx_led *led)
+{
+	struct lp55xx_chip *chip = led->chip;
+	int ret;
+	int i;
+
+	mutex_lock(&chip->lock);
+	for (i = 0; i < led->mc_cdev.num_leds; i++) {
+		ret = lp55xx_write(chip,
+				   LP5523_REG_LED_PWM_BASE +
+				   led->color_component[i].output_num,
+				   led->color_component[i].brightness);
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
+	.color_intensity_fn = lp5523_led_intensity,
 	.set_led_current    = lp5523_set_led_current,
 	.firmware_cb        = lp5523_firmware_loaded,
 	.run_engine         = lp5523_run_engine,
-- 
2.22.0.214.g8dca754b1e

