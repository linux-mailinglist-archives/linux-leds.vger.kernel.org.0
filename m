Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A0C785652E8
	for <lists+linux-leds@lfdr.de>; Mon,  4 Jul 2022 13:00:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234012AbiGDLAE (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 4 Jul 2022 07:00:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233991AbiGDLAD (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 4 Jul 2022 07:00:03 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72D0FDD0
        for <linux-leds@vger.kernel.org>; Mon,  4 Jul 2022 04:00:02 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 0E6E9615FA
        for <linux-leds@vger.kernel.org>; Mon,  4 Jul 2022 11:00:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5838AC341CA;
        Mon,  4 Jul 2022 11:00:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1656932401;
        bh=en1Xe8C/HDVrNVWI3aaFMA9HkzLjxs51XEis0Y/edE4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ulnEeEp7c8knVjOPYhPXmwKX0w46kTnZQNzMpvN7AXrXxirOEzxKTO1mmbT2E9Tc+
         YFLy7CMdISbF31G3UtWBguMzHd3HSR5i5kVFnyrBrRbStg0v8aaYYtokWMZfm4h6LN
         4Fc57cIR1bgOpLVuNDNYlLaKXrZt6PI33SsX81vulwJvvaiFbzNUiFCOd5Z5Jl0V0G
         QiykTld2i0q6W6Hd447VoT3YC6xkulxvDOOgemJVOZXerFmhB14osAqAHsJ7lrwevV
         QVXYq87VT7Y0qUOwbSfBsnAqfhEUzgHLYYNQfC9WqoSM3cLme/BGL8ipOjMjNEYrQ2
         YP5n9tPvKGOxA==
From:   =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
To:     Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org
Cc:     pali@kernel.org, Josef Schlehofer <josef.schlehofer@nic.cz>,
        =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
Subject: [PATCH 1/3] leds: turris-omnia: support HW controlled mode via private trigger
Date:   Mon,  4 Jul 2022 12:59:53 +0200
Message-Id: <20220704105955.15474-2-kabel@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220704105955.15474-1-kabel@kernel.org>
References: <20220704105955.15474-1-kabel@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Add support for enabling MCU controlled mode of the Turris Omnia LEDs
via a LED private trigger called "omnia-mcu".

When in MCU controlled mode, the user can still set LED color, but the
blinking is done by MCU, which does different things for various LEDs:
- WAN LED is blinked according to the LED[0] pin of the WAN PHY
- LAN LEDs are blinked according to the LED[0] output of corresponding
  port of the LAN switch
- PCIe LEDs are blinked according to the logical OR of the MiniPCIe port
  LED pins

For a long time I wanted to actually do this differently: I wanted to
make the netdev trigger to transparently offload the blinking to the HW
if user set compatible settings for the netdev trigger.
There was some work on this, and hopefully we will be able to complete
it sometime, but since there are various complications, it will probably
not be soon.

In the meantime let's support HW controlled mode via this private LED
trigger. If, in the future, we manage to complete the netdev trigger
offloading, we can still keep this private trigger for backwards
compatiblity, if needed.

We also set "omnia-mcu" to cdev->default_trigger, so that the MCU keeps
control until the user first wants to take over it. If a different
default trigger is specified in device-tree via the
`linux,default-trigger` property, LED class will overwrite
cdev->default_trigger, and so the DT property will be respected.

Signed-off-by: Marek Behún <kabel@kernel.org>
---
 drivers/leds/Kconfig             |  1 +
 drivers/leds/leds-turris-omnia.c | 41 ++++++++++++++++++++++++++++++++
 2 files changed, 42 insertions(+)

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index a49979f41eee..bc148320416d 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -163,6 +163,7 @@ config LEDS_TURRIS_OMNIA
 	depends on I2C
 	depends on MACH_ARMADA_38X || COMPILE_TEST
 	depends on OF
+	select LEDS_TRIGGERS
 	help
 	  This option enables basic support for the LEDs found on the front
 	  side of CZ.NIC's Turris Omnia router. There are 12 RGB LEDs on the
diff --git a/drivers/leds/leds-turris-omnia.c b/drivers/leds/leds-turris-omnia.c
index 1adfed1c0619..c2dfb22d3065 100644
--- a/drivers/leds/leds-turris-omnia.c
+++ b/drivers/leds/leds-turris-omnia.c
@@ -41,6 +41,39 @@ struct omnia_leds {
 	struct omnia_led leds[];
 };
 
+static struct led_hw_trigger_type omnia_hw_trigger_type;
+
+static int omnia_hwtrig_activate(struct led_classdev *cdev)
+{
+	struct omnia_leds *leds = dev_get_drvdata(cdev->dev->parent);
+	struct omnia_led *led = to_omnia_led(lcdev_to_mccdev(cdev));
+
+	/* put the LED into MCU controlled mode */
+	return i2c_smbus_write_byte_data(leds->client, CMD_LED_MODE,
+					 CMD_LED_MODE_LED(led->reg));
+}
+
+static void omnia_hwtrig_deactivate(struct led_classdev *cdev)
+{
+	struct omnia_leds *leds = dev_get_drvdata(cdev->dev->parent);
+	struct omnia_led *led = to_omnia_led(lcdev_to_mccdev(cdev));
+	int ret;
+
+	/* put the LED into software mode */
+	ret = i2c_smbus_write_byte_data(leds->client, CMD_LED_MODE,
+					CMD_LED_MODE_LED(led->reg) |
+					CMD_LED_MODE_USER);
+	if (ret < 0)
+		dev_err(cdev->dev, "Cannot put to software mode: %i\n", ret);
+}
+
+static struct led_trigger omnia_hw_trigger = {
+	.name		= "omnia-mcu",
+	.activate	= omnia_hwtrig_activate,
+	.deactivate	= omnia_hwtrig_deactivate,
+	.trigger_type	= &omnia_hw_trigger_type,
+};
+
 static int omnia_led_brightness_set_blocking(struct led_classdev *cdev,
 					     enum led_brightness brightness)
 {
@@ -112,6 +145,8 @@ static int omnia_led_register(struct i2c_client *client, struct omnia_led *led,
 	cdev = &led->mc_cdev.led_cdev;
 	cdev->max_brightness = 255;
 	cdev->brightness_set_blocking = omnia_led_brightness_set_blocking;
+	cdev->trigger_type = &omnia_hw_trigger_type;
+	cdev->default_trigger = omnia_hw_trigger.name;
 
 	/* put the LED into software mode */
 	ret = i2c_smbus_write_byte_data(client, CMD_LED_MODE,
@@ -228,6 +263,12 @@ static int omnia_leds_probe(struct i2c_client *client,
 
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
2.35.1

