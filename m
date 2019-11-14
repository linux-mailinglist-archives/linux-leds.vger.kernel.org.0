Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DA6C4FC7A6
	for <lists+linux-leds@lfdr.de>; Thu, 14 Nov 2019 14:33:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727104AbfKNNci (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 14 Nov 2019 08:32:38 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:48218 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726980AbfKNNch (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 14 Nov 2019 08:32:37 -0500
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id xAEDWZ2a007656;
        Thu, 14 Nov 2019 07:32:35 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1573738355;
        bh=g7UL6cJtcQdVkWq2mI0FrMGiupDZ0AbMcCYXx+3Cao4=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=HefRmZLNVIqDmekQktQbIpzAp2FvU9idqywEWYPTgFlgv4IXYBdqKoB9FaRXJfI4Y
         urL67jFg4O4TF9vRYa44aQBCZZp3Rw9N815+Fxn3QdpAxKL27XlDerBniXugcLk/z2
         jHlJLjviSdyBkJZNzdyNUY2IkYvPbjCpWkEIXgwo=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xAEDWZAL020697
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 14 Nov 2019 07:32:35 -0600
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 14
 Nov 2019 07:32:34 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 14 Nov 2019 07:32:34 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id xAEDWYxZ036892;
        Thu, 14 Nov 2019 07:32:34 -0600
From:   Dan Murphy <dmurphy@ti.com>
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Dan Murphy <dmurphy@ti.com>
Subject: [PATCH v17 14/19] leds: lp5523: Update the lp5523 code to add multicolor brightness function
Date:   Thu, 14 Nov 2019 07:30:18 -0600
Message-ID: <20191114133023.32185-15-dmurphy@ti.com>
X-Mailer: git-send-email 2.22.0.214.g8dca754b1e
In-Reply-To: <20191114133023.32185-1-dmurphy@ti.com>
References: <20191114133023.32185-1-dmurphy@ti.com>
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

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 drivers/leds/leds-lp5523.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/leds/leds-lp5523.c b/drivers/leds/leds-lp5523.c
index b076c16df9ab..609288077917 100644
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
+	for (i = 0; i < led->mc_cdev.num_leds; i++) {
+		ret = lp55xx_write(chip,
+				   LP5523_REG_LED_PWM_BASE +
+				   led->color_components[i].output_num,
+				   led->color_components[i].brightness);
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
2.22.0.214.g8dca754b1e

