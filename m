Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 14FA829FB7A
	for <lists+linux-leds@lfdr.de>; Fri, 30 Oct 2020 03:39:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725861AbgJ3CjT (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 29 Oct 2020 22:39:19 -0400
Received: from mail.kernel.org ([198.145.29.99]:38606 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725797AbgJ3CjS (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Thu, 29 Oct 2020 22:39:18 -0400
Received: from dellmb.labs.office.nic.cz (nat-1.nic.cz [217.31.205.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E51AA20791;
        Fri, 30 Oct 2020 02:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604025557;
        bh=gcjrrvS7U5iVsjhfYDOUPvA4LGd2Mva+yWnKU1Rcsno=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=DMLHHPn/1l1Q/AipZ2upN35uEnnPoCFBeUV8jnZfC9HaQfuyQtmj0RIYcSVHp3893
         tglAX6kBLsilSHp5E6lVl+/VXMU9VJA05+lUMe35V6UeESVFvhkmviuic0IqV8KlC5
         +66XAKbSe8DFK9I6IovqgLluKsjK/FGV0vzKuJ+o=
From:   =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
To:     linux-leds@vger.kernel.org
Cc:     Dan Murphy <dmurphy@ti.com>, Pavel Machek <pavel@ucw.cz>,
        =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
Subject: [PATCH leds 2/5] leds: turris-omnia: wrap to 80 columns
Date:   Fri, 30 Oct 2020 03:39:03 +0100
Message-Id: <20201030023906.24259-2-kabel@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201030023906.24259-1-kabel@kernel.org>
References: <20201030023906.24259-1-kabel@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Although checkpatch changed the max-line-length default to 100 columns,
we still prefer 80 columns somewhere.

Signed-off-by: Marek Behún <kabel@kernel.org>
---
 drivers/leds/leds-turris-omnia.c | 43 ++++++++++++++++++--------------
 1 file changed, 24 insertions(+), 19 deletions(-)

diff --git a/drivers/leds/leds-turris-omnia.c b/drivers/leds/leds-turris-omnia.c
index 80b2d94844f2..096ed7b81957 100644
--- a/drivers/leds/leds-turris-omnia.c
+++ b/drivers/leds/leds-turris-omnia.c
@@ -12,20 +12,20 @@
 #include <linux/of.h>
 #include "leds.h"
 
-#define OMNIA_BOARD_LEDS		12
-#define OMNIA_LED_NUM_CHANNELS		3
+#define OMNIA_BOARD_LEDS	12
+#define OMNIA_LED_NUM_CHANNELS	3
 
-#define CMD_LED_MODE			3
-#define CMD_LED_MODE_LED(l)		((l) & 0x0f)
-#define CMD_LED_MODE_USER		0x10
+#define CMD_LED_MODE		3
+#define CMD_LED_MODE_LED(l)	((l) & 0x0f)
+#define CMD_LED_MODE_USER	0x10
 
-#define CMD_LED_STATE			4
-#define CMD_LED_STATE_LED(l)		((l) & 0x0f)
-#define CMD_LED_STATE_ON		0x10
+#define CMD_LED_STATE		4
+#define CMD_LED_STATE_LED(l)	((l) & 0x0f)
+#define CMD_LED_STATE_ON	0x10
 
-#define CMD_LED_COLOR			5
-#define CMD_LED_SET_BRIGHTNESS		7
-#define CMD_LED_GET_BRIGHTNESS		8
+#define CMD_LED_COLOR		5
+#define CMD_LED_SET_BRIGHTNESS	7
+#define CMD_LED_GET_BRIGHTNESS	8
 
 struct omnia_led {
 	struct led_classdev_mc mc_cdev;
@@ -33,7 +33,7 @@ struct omnia_led {
 	int reg;
 };
 
-#define to_omnia_led(l)			container_of(l, struct omnia_led, mc_cdev)
+#define to_omnia_led(l)		container_of(l, struct omnia_led, mc_cdev)
 
 struct omnia_leds {
 	struct i2c_client *client;
@@ -118,18 +118,21 @@ static int omnia_led_register(struct i2c_client *client, struct omnia_led *led,
 					CMD_LED_MODE_LED(led->reg) |
 					CMD_LED_MODE_USER);
 	if (ret < 0) {
-		dev_err(dev, "Cannot set LED %pOF to software mode: %i\n", np, ret);
+		dev_err(dev, "Cannot set LED %pOF to software mode: %i\n", np,
+			ret);
 		return ret;
 	}
 
 	/* disable the LED */
-	ret = i2c_smbus_write_byte_data(client, CMD_LED_STATE, CMD_LED_STATE_LED(led->reg));
+	ret = i2c_smbus_write_byte_data(client, CMD_LED_STATE,
+					CMD_LED_STATE_LED(led->reg));
 	if (ret < 0) {
 		dev_err(dev, "Cannot set LED %pOF brightness: %i\n", np, ret);
 		return ret;
 	}
 
-	ret = devm_led_classdev_multicolor_register_ext(dev, &led->mc_cdev, &init_data);
+	ret = devm_led_classdev_multicolor_register_ext(dev, &led->mc_cdev,
+							&init_data);
 	if (ret < 0) {
 		dev_err(dev, "Cannot register LED %pOF: %i\n", np, ret);
 		return ret;
@@ -149,7 +152,8 @@ static int omnia_led_register(struct i2c_client *client, struct omnia_led *led,
  * file lives in the device directory of the LED controller, not an individual
  * LED, so it should not confuse users.
  */
-static ssize_t brightness_show(struct device *dev, struct device_attribute *a, char *buf)
+static ssize_t brightness_show(struct device *dev, struct device_attribute *a,
+			       char *buf)
 {
 	struct i2c_client *client = to_i2c_client(dev);
 	struct omnia_leds *leds = i2c_get_clientdata(client);
@@ -165,8 +169,8 @@ static ssize_t brightness_show(struct device *dev, struct device_attribute *a, c
 	return sprintf(buf, "%d\n", ret);
 }
 
-static ssize_t brightness_store(struct device *dev, struct device_attribute *a, const char *buf,
-				size_t count)
+static ssize_t brightness_store(struct device *dev, struct device_attribute *a,
+				const char *buf, size_t count)
 {
 	struct i2c_client *client = to_i2c_client(dev);
 	struct omnia_leds *leds = i2c_get_clientdata(client);
@@ -180,7 +184,8 @@ static ssize_t brightness_store(struct device *dev, struct device_attribute *a,
 		return -EINVAL;
 
 	mutex_lock(&leds->lock);
-	ret = i2c_smbus_write_byte_data(client, CMD_LED_SET_BRIGHTNESS, (u8) brightness);
+	ret = i2c_smbus_write_byte_data(client, CMD_LED_SET_BRIGHTNESS,
+					(u8)brightness);
 	mutex_unlock(&leds->lock);
 
 	if (ret < 0)
-- 
2.26.2

