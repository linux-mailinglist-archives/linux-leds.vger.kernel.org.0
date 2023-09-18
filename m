Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CF5BC7A4F51
	for <lists+linux-leds@lfdr.de>; Mon, 18 Sep 2023 18:39:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230352AbjIRQjb (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 18 Sep 2023 12:39:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229907AbjIRQjR (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 18 Sep 2023 12:39:17 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9A106A60
        for <linux-leds@vger.kernel.org>; Mon, 18 Sep 2023 09:11:37 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF121C116A4;
        Mon, 18 Sep 2023 16:11:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695053471;
        bh=4AhIJuf9x1v9Ii0Sximf2Pwsb3GEAdwoJNPsJUDFblQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=DGplOnNoiRbZtBzAGrH1PZd7BbHj/VUvyj6giR+LJ+euaXZCY1SE3fId3r9pJQukO
         mkzSZGh/44GmzNRUGGRUUc97whop+FGbdjkDmaTkpUgke+9TbxS33JeGU+mulkcW7h
         86MFzI3f4o4ShrjSWWtw/XkMwW56oEpGWsHXOBcxIHIj2Gnn4mLiTmbns3LyBG5J6Z
         Vk+w6M3+sNzYfn4tCrugnqjmYZOqPbHigGdu8nMihbSbLzyJp2oCORAvLV/sHun1Gq
         N9W9zG//mpb2p7SSMpN2M6AdDBZAPNkk3os/zXdQOiyZQi9D73VWCBBly+A9xEWxiR
         8E40GgLaiMWhw==
From:   =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
To:     Lee Jones <lee@kernel.org>, linux-leds@vger.kernel.org
Cc:     =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
Subject: [PATCH v4 3/4] leds: turris-omnia: support HW controlled mode via private trigger
Date:   Mon, 18 Sep 2023 18:11:03 +0200
Message-ID: <20230918161104.20860-4-kabel@kernel.org>
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

Add support for enabling MCU controlled mode of the Turris Omnia LEDs
via a LED private trigger called "omnia-mcu". Recall that private LED
triggers will only be listed in the sysfs trigger file for LEDs that
support them (currently there is no user of this mechanism).

When in MCU controlled mode, the user can still set LED color, but the
blinking is done by MCU, which does different things for different LEDs:
- WAN LED is blinked according to the LED[0] pin of the WAN PHY
- LAN LEDs are blinked according to the LED[0] output of the
  corresponding port of the LAN switch
- PCIe LEDs are blinked according to the logical OR of the MiniPCIe port
  LED pins

In the future I want to make the netdev trigger to transparently offload
the blinking to the HW if user sets compatible settings for the netdev
trigger (for LEDs associated with network devices).
There was some work on this already, and hopefully we will be able to
complete it sometime, but for now there are still multiple blockers for
this, and even if there weren't, we still would not be able to configure
HW controlled mode for the LEDs associated with MiniPCIe ports.

In the meantime let's support HW controlled mode via the private LED
trigger mechanism. If, in the future, we manage to complete the netdev
trigger offloading, we can still keep this private trigger for backwards
compatibility, if needed.

We also set "omnia-mcu" to cdev->default_trigger, so that the MCU keeps
control until the user first wants to take over it. If a different
default trigger is specified in device-tree via the
'linux,default-trigger' property, LED class will overwrite
cdev->default_trigger, and so the DT property will be respected.

Signed-off-by: Marek Behún <kabel@kernel.org>
---
 drivers/leds/Kconfig             |  1 +
 drivers/leds/leds-turris-omnia.c | 98 +++++++++++++++++++++++++++++---
 2 files changed, 91 insertions(+), 8 deletions(-)

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index b92208eccdea..6292fddcc55c 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -187,6 +187,7 @@ config LEDS_TURRIS_OMNIA
 	depends on I2C
 	depends on MACH_ARMADA_38X || COMPILE_TEST
 	depends on OF
+	select LEDS_TRIGGERS
 	help
 	  This option enables basic support for the LEDs found on the front
 	  side of CZ.NIC's Turris Omnia router. There are 12 RGB LEDs on the
diff --git a/drivers/leds/leds-turris-omnia.c b/drivers/leds/leds-turris-omnia.c
index ec5c47d39e85..bdccce0ec39c 100644
--- a/drivers/leds/leds-turris-omnia.c
+++ b/drivers/leds/leds-turris-omnia.c
@@ -31,7 +31,7 @@ struct omnia_led {
 	struct led_classdev_mc mc_cdev;
 	struct mc_subled subled_info[OMNIA_LED_NUM_CHANNELS];
 	u8 cached_channels[OMNIA_LED_NUM_CHANNELS];
-	bool on;
+	bool on, hwtrig;
 	int reg;
 };
 
@@ -121,12 +121,14 @@ static int omnia_led_brightness_set_blocking(struct led_classdev *cdev,
 
 	/*
 	 * Only recalculate RGB brightnesses from intensities if brightness is
-	 * non-zero. Otherwise we won't be using them and we can save ourselves
-	 * some software divisions (Omnia's CPU does not implement the division
-	 * instruction).
+	 * non-zero (if it is zero and the LED is in HW blinking mode, we use
+	 * max_brightness as brightness). Otherwise we won't be using them and
+	 * we can save ourselves some software divisions (Omnia's CPU does not
+	 * implement the division instruction).
 	 */
-	if (brightness) {
-		led_mc_calc_color_components(mc_cdev, brightness);
+	if (brightness || led->hwtrig) {
+		led_mc_calc_color_components(mc_cdev, brightness ?:
+						      cdev->max_brightness);
 
 		/*
 		 * Send color command only if brightness is non-zero and the RGB
@@ -136,8 +138,11 @@ static int omnia_led_brightness_set_blocking(struct led_classdev *cdev,
 			err = omnia_led_send_color_cmd(leds->client, led);
 	}
 
-	/* Send on/off state change only if (bool)brightness changed */
-	if (!err && !brightness != !led->on) {
+	/*
+	 * Send on/off state change only if (bool)brightness changed and the LED
+	 * is not being blinked by HW.
+	 */
+	if (!err && !led->hwtrig && !brightness != !led->on) {
 		u8 state = CMD_LED_STATE_LED(led->reg);
 
 		if (brightness)
@@ -153,6 +158,71 @@ static int omnia_led_brightness_set_blocking(struct led_classdev *cdev,
 	return err;
 }
 
+static struct led_hw_trigger_type omnia_hw_trigger_type;
+
+static int omnia_hwtrig_activate(struct led_classdev *cdev)
+{
+	struct led_classdev_mc *mc_cdev = lcdev_to_mccdev(cdev);
+	struct omnia_leds *leds = dev_get_drvdata(cdev->dev->parent);
+	struct omnia_led *led = to_omnia_led(mc_cdev);
+	int err = 0;
+
+	mutex_lock(&leds->lock);
+
+	if (!led->on) {
+		/*
+		 * If the LED is off (brightness was set to 0), the last
+		 * configured color was not necessarily sent to the MCU.
+		 * Recompute with max_brightness and send if needed.
+		 */
+		led_mc_calc_color_components(mc_cdev, cdev->max_brightness);
+
+		if (omnia_led_channels_changed(led))
+			err = omnia_led_send_color_cmd(leds->client, led);
+	}
+
+	if (!err) {
+		/* Put the LED into MCU controlled mode */
+		err = omnia_cmd_write_u8(leds->client, CMD_LED_MODE,
+					 CMD_LED_MODE_LED(led->reg));
+		if (!err)
+			led->hwtrig = true;
+	}
+
+	mutex_unlock(&leds->lock);
+
+	return err;
+}
+
+static void omnia_hwtrig_deactivate(struct led_classdev *cdev)
+{
+	struct omnia_leds *leds = dev_get_drvdata(cdev->dev->parent);
+	struct omnia_led *led = to_omnia_led(lcdev_to_mccdev(cdev));
+	int err;
+
+	mutex_lock(&leds->lock);
+
+	led->hwtrig = false;
+
+	/* Put the LED into software mode */
+	err = omnia_cmd_write_u8(leds->client, CMD_LED_MODE,
+				 CMD_LED_MODE_LED(led->reg) |
+				 CMD_LED_MODE_USER);
+
+	mutex_unlock(&leds->lock);
+
+	if (err < 0)
+		dev_err(cdev->dev, "Cannot put LED to software mode: %i\n",
+			err);
+}
+
+static struct led_trigger omnia_hw_trigger = {
+	.name		= "omnia-mcu",
+	.activate	= omnia_hwtrig_activate,
+	.deactivate	= omnia_hwtrig_deactivate,
+	.trigger_type	= &omnia_hw_trigger_type,
+};
+
 static int omnia_led_register(struct i2c_client *client, struct omnia_led *led,
 			      struct device_node *np)
 {
@@ -196,6 +266,12 @@ static int omnia_led_register(struct i2c_client *client, struct omnia_led *led,
 	cdev = &led->mc_cdev.led_cdev;
 	cdev->max_brightness = 255;
 	cdev->brightness_set_blocking = omnia_led_brightness_set_blocking;
+	cdev->trigger_type = &omnia_hw_trigger_type;
+	/*
+	 * Use the omnia-mcu trigger as the default trigger. It may be rewritten
+	 * by LED class from the linux,default-trigger property.
+	 */
+	cdev->default_trigger = omnia_hw_trigger.name;
 
 	/* put the LED into software mode */
 	ret = omnia_cmd_write_u8(client, CMD_LED_MODE,
@@ -309,6 +385,12 @@ static int omnia_leds_probe(struct i2c_client *client)
 
 	mutex_init(&leds->lock);
 
+	ret = devm_led_trigger_register(dev, &omnia_hw_trigger);
+	if (ret < 0) {
+		dev_err(dev, "Cannot register private LED trigger: %d\n", ret);
+		return ret;
+	}
+
 	led = &leds->leds[0];
 	for_each_available_child_of_node(np, child) {
 		ret = omnia_led_register(client, led, child);
-- 
2.41.0

