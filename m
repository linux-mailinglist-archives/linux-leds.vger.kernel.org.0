Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9559FEC15
	for <lists+linux-leds@lfdr.de>; Mon, 29 Apr 2019 23:29:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729483AbfD2V3t (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 29 Apr 2019 17:29:49 -0400
Received: from mail.nic.cz ([217.31.204.67]:52788 "EHLO mail.nic.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729370AbfD2V3s (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Mon, 29 Apr 2019 17:29:48 -0400
Received: from dellmb.labs.office.nic.cz (unknown [172.20.6.125])
        by mail.nic.cz (Postfix) with ESMTP id 09DDD63549;
        Mon, 29 Apr 2019 23:29:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
        t=1556573385; bh=H4APhhFVcGswagQ5nFQE6uewC/jQoqc/In5Gfr3YBm4=;
        h=From:To:Date;
        b=Y1S+GDb3kQMnNf0mP8gw0KvwojxGg3t6SCawjcBzwgOsf4sQtpSoegmY0u9bz9j7c
         6kkUHWr8L7c30/On7DVujNEPRLUJ/SZdGhLZMaR/OenS8K1n2iA0z7zK+KzpPBLU6O
         6FrIPv4fCzBlUA66UTEsuiUtC/EbxrlSFqcdwoes=
From:   =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>
To:     linux-leds@vger.kernel.org
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>,
        =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>
Subject: [PATCH leds/for-next v2 2/2] leds: turris-omnia: Add support for 256 brightness values
Date:   Mon, 29 Apr 2019 23:29:44 +0200
Message-Id: <20190429212944.15643-3-marek.behun@nic.cz>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190429212944.15643-1-marek.behun@nic.cz>
References: <20190429212944.15643-1-marek.behun@nic.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.99.2 at mail
X-Virus-Status: Clean
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

The controller supports setting brightness of each channel of the RGB
LEDs to values 0-255. We do not support RGB LED class yet, but we can
use this to be able to have 256 brightness levels for each LED, instead
of just on/off state.

Also add code to set all LEDs color to [255, 255, 255] on driver unbind.

Signed-off-by: Marek Behún <marek.behun@nic.cz>
---
 drivers/leds/Kconfig             |  4 ++--
 drivers/leds/leds-turris-omnia.c | 21 +++++++++++++++++++--
 2 files changed, 21 insertions(+), 4 deletions(-)

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index 3747cbd0de2c..62d17c2f4878 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -139,8 +139,8 @@ config LEDS_TURRIS_OMNIA
 	  side of CZ.NIC's Turris Omnia router. There are 12 RGB LEDs on the
 	  front panel.
 	  This driver does not currently support setting LED colors, only
-	  on/off state. Also HW triggering is disabled when the controller
-	  is probed by this driver.
+	  brightness. Also HW triggering is disabled when the controller is
+	  probed by this driver.
 
 config LEDS_LM3530
 	tristate "LCD Backlight driver for LM3530"
diff --git a/drivers/leds/leds-turris-omnia.c b/drivers/leds/leds-turris-omnia.c
index dc9fac56b13a..0e805d94f298 100644
--- a/drivers/leds/leds-turris-omnia.c
+++ b/drivers/leds/leds-turris-omnia.c
@@ -54,7 +54,7 @@ static int omnia_led_brightness_set_blocking(struct led_classdev *led,
 	struct omnia_leds *leds = dev_get_drvdata(led->dev->parent);
 	int idx = omnia_led_idx(leds, led);
 	int ret;
-	u8 state;
+	u8 buf[5], state;
 
 	if (idx < 0)
 		return idx;
@@ -63,8 +63,16 @@ static int omnia_led_brightness_set_blocking(struct led_classdev *led,
 	if (brightness)
 		state |= CMD_LED_STATE_ON;
 
+	buf[0] = CMD_LED_COLOR;
+	buf[1] = idx;
+	buf[2] = buf[3] = buf[4] = brightness;
+
 	mutex_lock(&leds->lock);
+
 	ret = i2c_smbus_write_byte_data(leds->client, CMD_LED_STATE, state);
+	if (ret >= 0 && brightness)
+		ret = i2c_master_send(leds->client, buf, 5);
+
 	mutex_unlock(&leds->lock);
 
 	return ret;
@@ -97,7 +105,7 @@ static int omnia_led_register(struct omnia_leds *leds,
 	ret = fwnode_property_read_string(node, "label", &str);
 	snprintf(led->name, sizeof(led->name), "omnia::%s", ret ? "" : str);
 
-	led->cdev.max_brightness = 1;
+	led->cdev.max_brightness = 255;
 	led->cdev.brightness_set_blocking = omnia_led_brightness_set_blocking;
 	led->cdev.name = led->name;
 
@@ -166,10 +174,19 @@ static int omnia_leds_probe(struct i2c_client *client,
 
 static int omnia_leds_remove(struct i2c_client *client)
 {
+	u8 buf[5];
+
 	/* put all LEDs into default (HW triggered) mode */
 	i2c_smbus_write_byte_data(client, CMD_LED_MODE,
 				  CMD_LED_MODE_LED(OMNIA_BOARD_LEDS));
 
+	/* set all LEDs color to [255, 255, 255] */
+	buf[0] = CMD_LED_COLOR;
+	buf[1] = OMNIA_BOARD_LEDS;
+	buf[2] = buf[3] = buf[4] = 255;
+
+	i2c_master_send(client, buf, 5);
+
 	return 0;
 }
 
-- 
2.21.0

