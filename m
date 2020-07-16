Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 09133222AD9
	for <lists+linux-leds@lfdr.de>; Thu, 16 Jul 2020 20:21:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729576AbgGPSVE (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 16 Jul 2020 14:21:04 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:40346 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728402AbgGPSVB (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 16 Jul 2020 14:21:01 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 06GIKp76062591;
        Thu, 16 Jul 2020 13:20:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1594923651;
        bh=3U1YGou84u3VUbet9dKfDOd4OJ1M3iNBcC5HTyHhUDg=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=ZDPqwSJ+bjyXN0ZEU56QQeSAKv39MsKHTFnGMszmLkoAKEBaGSnKOlnqdatMx8nQt
         1lvc5fkygd7k4bHwwHB9GD++KD8NQPj0GRrjFVVaJklOpCQyFczLkRT0AycDZuksc7
         LcdwAyt8ImKTqnmE2IsG8m+lbRPtb3MUn9zA9PlI=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 06GIKpoi122383
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 16 Jul 2020 13:20:51 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 16
 Jul 2020 13:20:50 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 16 Jul 2020 13:20:50 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 06GIKoZ1090243;
        Thu, 16 Jul 2020 13:20:50 -0500
From:   Dan Murphy <dmurphy@ti.com>
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>, <robh@kernel.org>,
        <marek.behun@nic.cz>
CC:     <devicetree@vger.kernel.org>, <linux-leds@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, Dan Murphy <dmurphy@ti.com>
Subject: [PATCH v31 09/12] leds: lp5521: Add multicolor framework multicolor brightness support
Date:   Thu, 16 Jul 2020 13:20:04 -0500
Message-ID: <20200716182007.18389-10-dmurphy@ti.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200716182007.18389-1-dmurphy@ti.com>
References: <20200716182007.18389-1-dmurphy@ti.com>
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
 drivers/leds/leds-lp5521.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

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
2.27.0

