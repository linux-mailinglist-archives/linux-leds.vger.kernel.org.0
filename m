Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BD1CE7A4F54
	for <lists+linux-leds@lfdr.de>; Mon, 18 Sep 2023 18:39:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231261AbjIRQkA (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 18 Sep 2023 12:40:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230319AbjIRQj1 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 18 Sep 2023 12:39:27 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E99906A42
        for <linux-leds@vger.kernel.org>; Mon, 18 Sep 2023 09:11:34 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAF70C433CD;
        Mon, 18 Sep 2023 16:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695053470;
        bh=/RQ7TYAIFzht6NVLjMKBMaIxxzIq6zaMgwaPy/v0MBM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=EJd69T6JZC+kc9K7rNDOdD6xc3iCq237kN1JZ7hiXObdM26K5FYXypAFXtAuOrSQH
         Daed4Uhfs8IPzn8FQ4poO++nGzETnyRBpYTh1LqXH9PE+FrjbBUQng41vCu4rtoucc
         JUQdWiRs1i19/cu+hMvJ+hcXF8uE2JYjiS1f6ZvcLvVzrKcRgcyXSF4CH/YpIwY8MP
         hK0oKXLcs4RKSs/GpOUosdKnGjv7QJKw/7ZqCFWtTFxMkcvEmWSUKOGmTZG7JGAjco
         jgP3fQxUmAiyJB4vLRTtCyo1xMNBnZ51v5Hq2hpFgyCzEEfuorO27LjJs3OxleH4cm
         x4H+oCsVl+Iwg==
From:   =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
To:     Lee Jones <lee@kernel.org>, linux-leds@vger.kernel.org
Cc:     =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
Subject: [PATCH v4 2/4] leds: turris-omnia: make set_brightness() more efficient
Date:   Mon, 18 Sep 2023 18:11:02 +0200
Message-ID: <20230918161104.20860-3-kabel@kernel.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230918161104.20860-1-kabel@kernel.org>
References: <20230918161104.20860-1-kabel@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Implement caching of the LED color and state values that are sent to MCU
in order to make the set_brightness() operation more efficient by
avoiding I2C transactions which are not needed.

On Turris Omnia's MCU, which acts as the RGB LED controller, each LED
has a RGB color, and a ON/OFF state, which are configurable via I2C
commands CMD_LED_COLOR and CMD_LED_STATE.

The CMD_LED_COLOR command sends 5 bytes and the CMD_LED_STATE command 2
bytes over the I2C bus, which operates at 100 kHz. With I2C overhead
this allows ~1670 color changing commands and ~3200 state changing
commands per second (or around 1000 color + state changes per second).
This may seem more than enough, but the issue is that the I2C bus is
shared with another peripheral, the MCU. The MCU exposes an interrupt
interface, and it can trigger hundreds of interrupts per second. Each
time, we need to read the interrupt state register over this I2C bus.
Whenever we are sending a LED color/state changing command, the
interrupt reading is waiting.

Currently, every time LED brightness or LED multi intensity is changed,
we send a CMD_LED_STATE command, and if the computed color (brightness
adjusted multi_intensity) is non-zero, we also send a CMD_LED_COLOR
command.

Consider for example the situation when we have a netdev trigger enabled
for a LED. The netdev trigger does not change the LED color, only the
brightness (either to 0 or to currently configured brightness), and so
there is no need to send the CMD_LED_COLOR command. But each change of
brightness to 0 sends one CMD_LED_STATE command, and each change of
brightness to max_brightness sends one CMD_LED_STATE command and one
CMD_LED_COLOR command:
    set_brightness(0)   ->  CMD_LED_STATE
    set_brightness(255) ->  CMD_LED_STATE + CMD_LED_COLOR
                                            (unnecessary)

We can avoid the unnecessary I2C transactions if we cache the values of
state and color that are sent to the controller. If the color does not
change from the one previously sent, there is no need to do the
CMD_LED_COLOR I2C transaction, and if the state does not change, there
is no need to do the CMD_LED_STATE transaction.

Because we need to make sure that our cached values are consistent with
the controller state, add explicit setting of the LED color to white at
probe time (this is the default setting when MCU resets, but does not
necessarily need to be the case, for example if U-Boot played with the
LED colors).

Signed-off-by: Marek Behún <kabel@kernel.org>
---
 drivers/leds/leds-turris-omnia.c | 96 ++++++++++++++++++++++++++------
 1 file changed, 78 insertions(+), 18 deletions(-)

diff --git a/drivers/leds/leds-turris-omnia.c b/drivers/leds/leds-turris-omnia.c
index 6ef44de773fe..ec5c47d39e85 100644
--- a/drivers/leds/leds-turris-omnia.c
+++ b/drivers/leds/leds-turris-omnia.c
@@ -30,6 +30,8 @@
 struct omnia_led {
 	struct led_classdev_mc mc_cdev;
 	struct mc_subled subled_info[OMNIA_LED_NUM_CHANNELS];
+	u8 cached_channels[OMNIA_LED_NUM_CHANNELS];
+	bool on;
 	int reg;
 };
 
@@ -73,36 +75,82 @@ static int omnia_cmd_read_u8(const struct i2c_client *client, u8 cmd)
 		return -EIO;
 }
 
+static int omnia_led_send_color_cmd(const struct i2c_client *client,
+				    struct omnia_led *led)
+{
+	char cmd[5];
+	int ret;
+
+	cmd[0] = CMD_LED_COLOR;
+	cmd[1] = led->reg;
+	cmd[2] = led->subled_info[0].brightness;
+	cmd[3] = led->subled_info[1].brightness;
+	cmd[4] = led->subled_info[2].brightness;
+
+	/* Send the color change command */
+	ret = i2c_master_send(client, cmd, 5);
+	if (ret < 0)
+		return ret;
+
+	/* Cache the RGB channel brightnesses */
+	for (int i = 0; i < OMNIA_LED_NUM_CHANNELS; ++i)
+		led->cached_channels[i] = led->subled_info[i].brightness;
+
+	return 0;
+}
+
+/* Determine if the computed RGB channels are different from the cached ones */
+static bool omnia_led_channels_changed(struct omnia_led *led)
+{
+	for (int i = 0; i < OMNIA_LED_NUM_CHANNELS; ++i)
+		if (led->subled_info[i].brightness != led->cached_channels[i])
+			return true;
+
+	return false;
+}
+
 static int omnia_led_brightness_set_blocking(struct led_classdev *cdev,
 					     enum led_brightness brightness)
 {
 	struct led_classdev_mc *mc_cdev = lcdev_to_mccdev(cdev);
 	struct omnia_leds *leds = dev_get_drvdata(cdev->dev->parent);
 	struct omnia_led *led = to_omnia_led(mc_cdev);
-	u8 buf[5], state;
-	int ret;
+	int err = 0;
 
 	mutex_lock(&leds->lock);
 
-	led_mc_calc_color_components(&led->mc_cdev, brightness);
+	/*
+	 * Only recalculate RGB brightnesses from intensities if brightness is
+	 * non-zero. Otherwise we won't be using them and we can save ourselves
+	 * some software divisions (Omnia's CPU does not implement the division
+	 * instruction).
+	 */
+	if (brightness) {
+		led_mc_calc_color_components(mc_cdev, brightness);
+
+		/*
+		 * Send color command only if brightness is non-zero and the RGB
+		 * channel brightnesses changed.
+		 */
+		if (omnia_led_channels_changed(led))
+			err = omnia_led_send_color_cmd(leds->client, led);
+	}
 
-	buf[0] = CMD_LED_COLOR;
-	buf[1] = led->reg;
-	buf[2] = mc_cdev->subled_info[0].brightness;
-	buf[3] = mc_cdev->subled_info[1].brightness;
-	buf[4] = mc_cdev->subled_info[2].brightness;
+	/* Send on/off state change only if (bool)brightness changed */
+	if (!err && !brightness != !led->on) {
+		u8 state = CMD_LED_STATE_LED(led->reg);
 
-	state = CMD_LED_STATE_LED(led->reg);
-	if (buf[2] || buf[3] || buf[4])
-		state |= CMD_LED_STATE_ON;
+		if (brightness)
+			state |= CMD_LED_STATE_ON;
 
-	ret = omnia_cmd_write_u8(leds->client, CMD_LED_STATE, state);
-	if (ret >= 0 && (state & CMD_LED_STATE_ON))
-		ret = i2c_master_send(leds->client, buf, 5);
+		err = omnia_cmd_write_u8(leds->client, CMD_LED_STATE, state);
+		if (!err)
+			led->on = !!brightness;
+	}
 
 	mutex_unlock(&leds->lock);
 
-	return ret;
+	return err;
 }
 
 static int omnia_led_register(struct i2c_client *client, struct omnia_led *led,
@@ -130,11 +178,15 @@ static int omnia_led_register(struct i2c_client *client, struct omnia_led *led,
 	}
 
 	led->subled_info[0].color_index = LED_COLOR_ID_RED;
-	led->subled_info[0].channel = 0;
 	led->subled_info[1].color_index = LED_COLOR_ID_GREEN;
-	led->subled_info[1].channel = 1;
 	led->subled_info[2].color_index = LED_COLOR_ID_BLUE;
-	led->subled_info[2].channel = 2;
+
+	/* Initial color is white */
+	for (int i = 0; i < OMNIA_LED_NUM_CHANNELS; ++i) {
+		led->subled_info[i].intensity = 255;
+		led->subled_info[i].brightness = 255;
+		led->subled_info[i].channel = i;
+	}
 
 	led->mc_cdev.subled_info = led->subled_info;
 	led->mc_cdev.num_colors = OMNIA_LED_NUM_CHANNELS;
@@ -163,6 +215,14 @@ static int omnia_led_register(struct i2c_client *client, struct omnia_led *led,
 		return ret;
 	}
 
+	/* Set initial color and cache it */
+	ret = omnia_led_send_color_cmd(client, led);
+	if (ret < 0) {
+		dev_err(dev, "Cannot set LED %pOF initial color: %i\n", np,
+			ret);
+		return ret;
+	}
+
 	ret = devm_led_classdev_multicolor_register_ext(dev, &led->mc_cdev,
 							&init_data);
 	if (ret < 0) {
-- 
2.41.0

