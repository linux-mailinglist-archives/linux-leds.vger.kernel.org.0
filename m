Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E0D3776D352
	for <lists+linux-leds@lfdr.de>; Wed,  2 Aug 2023 18:08:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229913AbjHBQIR (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 2 Aug 2023 12:08:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235485AbjHBQH7 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 2 Aug 2023 12:07:59 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BAD01981
        for <linux-leds@vger.kernel.org>; Wed,  2 Aug 2023 09:07:56 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 9C11461A24
        for <linux-leds@vger.kernel.org>; Wed,  2 Aug 2023 16:07:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18101C433CA;
        Wed,  2 Aug 2023 16:07:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690992475;
        bh=1sJMn5zHlsQRF/6HJlV+cFo3X9IzKb30odH+NLo3VR0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=tVJE8MFZGjWq0wK+tblZdE0Y5DhXdXrr+bNj0AfFGiHslHBJBndkoE6jO3kkX6nvY
         kHF8h/38ztd0G9PcWkjb8jYFx3IYyaEORVIUoAgqNQrk2mxVrAjviVuuEeIRapIdmO
         86fCHYos2TWEhtQshyudG8cWmxUNVu9HJRnmLbQjc5/Nb5J+JUjVJl/9M6tWZOt+8Y
         KpyVQbSp7O6USa/1pekxJEWYcyruyDZLRc98CUNj/3gj2L+ekWeG6q9tQyGv2OJbQ5
         Tt1L0PaYpp/zA8IrOdDC4Q6YZd/illyq4hXHX4KTRE1E4hwBmKxFd8Nisd7gw84fvK
         F+ttdJ6p1vjag==
From:   =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
To:     Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
        linux-leds@vger.kernel.org
Cc:     =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
Subject: [PATCH v3 2/6] leds: turris-omnia: do not use SMBUS calls
Date:   Wed,  2 Aug 2023 18:07:44 +0200
Message-ID: <20230802160748.11208-3-kabel@kernel.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230802160748.11208-1-kabel@kernel.org>
References: <20230802160748.11208-1-kabel@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

The leds-turris-omnia driver uses three function for I2C access:
- i2c_smbus_write_byte_data() and i2c_smbus_read_byte_data(), which
  cause an emulated SMBUS transfer,
- i2c_master_send(), which causes an ordinary I2C transfer.

The Turris Omnia MCU LED controller is not semantically SMBUS, it
operates as a simple I2C bus. It does not implement any of the SMBUS
specific features, like PEC, or procedure calls, or anything. Moreover
the I2C controller driver also does not implement SMBUS, and so the
emulated SMBUS procedure from drivers/i2c/i2c-core-smbus.c is used for
the SMBUS calls, which gives an unnecessary overhead.

When I first wrote the driver, I was unaware of these facts, and I
simply used the first function that worked.

Drop the I2C SMBUS calls and instead use simple I2C transfers.

Fixes: 089381b27abe ("leds: initial support for Turris Omnia LEDs")
Signed-off-by: Marek Behún <kabel@kernel.org>
---
 drivers/leds/leds-turris-omnia.c | 56 +++++++++++++++++++++++++-------
 1 file changed, 44 insertions(+), 12 deletions(-)

diff --git a/drivers/leds/leds-turris-omnia.c b/drivers/leds/leds-turris-omnia.c
index bbd610100e41..bb2a2b411a56 100644
--- a/drivers/leds/leds-turris-omnia.c
+++ b/drivers/leds/leds-turris-omnia.c
@@ -2,7 +2,7 @@
 /*
  * CZ.NIC's Turris Omnia LEDs driver
  *
- * 2020 by Marek Behún <kabel@kernel.org>
+ * 2020, 2023 by Marek Behún <kabel@kernel.org>
  */
 
 #include <linux/i2c.h>
@@ -41,6 +41,40 @@ struct omnia_leds {
 	struct omnia_led leds[];
 };
 
+static int omnia_cmd_write(const struct i2c_client *client, u8 cmd, u8 val)
+{
+	u8 buf[2] = { cmd, val };
+	int ret;
+
+	ret = i2c_master_send(client, buf, sizeof(buf));
+
+	return ret < 0 ? ret : 0;
+}
+
+static int omnia_cmd_read(const struct i2c_client *client, u8 cmd)
+{
+	struct i2c_msg msgs[2];
+	u8 reply;
+	int ret;
+
+	msgs[0].addr = client->addr;
+	msgs[0].flags = 0;
+	msgs[0].len = 1;
+	msgs[0].buf = &cmd;
+	msgs[1].addr = client->addr;
+	msgs[1].flags = I2C_M_RD;
+	msgs[1].len = 1;
+	msgs[1].buf = &reply;
+
+	ret = i2c_transfer(client->adapter, msgs, ARRAY_SIZE(msgs));
+	if (likely(ret == ARRAY_SIZE(msgs)))
+		return reply;
+	else if (ret < 0)
+		return ret;
+	else
+		return -EIO;
+}
+
 static int omnia_led_brightness_set_blocking(struct led_classdev *cdev,
 					     enum led_brightness brightness)
 {
@@ -64,7 +98,7 @@ static int omnia_led_brightness_set_blocking(struct led_classdev *cdev,
 	if (buf[2] || buf[3] || buf[4])
 		state |= CMD_LED_STATE_ON;
 
-	ret = i2c_smbus_write_byte_data(leds->client, CMD_LED_STATE, state);
+	ret = omnia_cmd_write(leds->client, CMD_LED_STATE, state);
 	if (ret >= 0 && (state & CMD_LED_STATE_ON))
 		ret = i2c_master_send(leds->client, buf, 5);
 
@@ -114,9 +148,8 @@ static int omnia_led_register(struct i2c_client *client, struct omnia_led *led,
 	cdev->brightness_set_blocking = omnia_led_brightness_set_blocking;
 
 	/* put the LED into software mode */
-	ret = i2c_smbus_write_byte_data(client, CMD_LED_MODE,
-					CMD_LED_MODE_LED(led->reg) |
-					CMD_LED_MODE_USER);
+	ret = omnia_cmd_write(client, CMD_LED_MODE, CMD_LED_MODE_LED(led->reg) |
+						    CMD_LED_MODE_USER);
 	if (ret < 0) {
 		dev_err(dev, "Cannot set LED %pOF to software mode: %i\n", np,
 			ret);
@@ -124,8 +157,8 @@ static int omnia_led_register(struct i2c_client *client, struct omnia_led *led,
 	}
 
 	/* disable the LED */
-	ret = i2c_smbus_write_byte_data(client, CMD_LED_STATE,
-					CMD_LED_STATE_LED(led->reg));
+	ret = omnia_cmd_write(client, CMD_LED_STATE,
+			      CMD_LED_STATE_LED(led->reg));
 	if (ret < 0) {
 		dev_err(dev, "Cannot set LED %pOF brightness: %i\n", np, ret);
 		return ret;
@@ -158,7 +191,7 @@ static ssize_t brightness_show(struct device *dev, struct device_attribute *a,
 	struct i2c_client *client = to_i2c_client(dev);
 	int ret;
 
-	ret = i2c_smbus_read_byte_data(client, CMD_LED_GET_BRIGHTNESS);
+	ret = omnia_cmd_read(client, CMD_LED_GET_BRIGHTNESS);
 
 	if (ret < 0)
 		return ret;
@@ -179,8 +212,7 @@ static ssize_t brightness_store(struct device *dev, struct device_attribute *a,
 	if (brightness > 100)
 		return -EINVAL;
 
-	ret = i2c_smbus_write_byte_data(client, CMD_LED_SET_BRIGHTNESS,
-					(u8)brightness);
+	ret = omnia_cmd_write(client, CMD_LED_SET_BRIGHTNESS, brightness);
 
 	return ret < 0 ? ret : count;
 }
@@ -237,8 +269,8 @@ static void omnia_leds_remove(struct i2c_client *client)
 	u8 buf[5];
 
 	/* put all LEDs into default (HW triggered) mode */
-	i2c_smbus_write_byte_data(client, CMD_LED_MODE,
-				  CMD_LED_MODE_LED(OMNIA_BOARD_LEDS));
+	omnia_cmd_write(client, CMD_LED_MODE,
+			CMD_LED_MODE_LED(OMNIA_BOARD_LEDS));
 
 	/* set all LEDs color to [255, 255, 255] */
 	buf[0] = CMD_LED_COLOR;
-- 
2.41.0

