Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 11B8D7535BA
	for <lists+linux-leds@lfdr.de>; Fri, 14 Jul 2023 10:53:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235653AbjGNIxM (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 14 Jul 2023 04:53:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235768AbjGNIxD (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 14 Jul 2023 04:53:03 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10AE02683
        for <linux-leds@vger.kernel.org>; Fri, 14 Jul 2023 01:53:03 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 8E59961CA0
        for <linux-leds@vger.kernel.org>; Fri, 14 Jul 2023 08:53:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06744C433CB;
        Fri, 14 Jul 2023 08:53:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1689324782;
        bh=nNLdCehayE1U0hFM3WDRzJ1MqL143Yu7ZqdB/bxPsso=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=R9aJxDV+By76PZZbiQIuFlpp4jE8qXcSg89nfZ+fiFK+wxPqqT8RRfr5dYG4ZDCu4
         9rZkAYUuuj0/O5TGGX0yeZ6SiGqSEtPu4V0dS/5bcBbLJuyNsAwvnO+wKCkqUwgMoo
         ql3IpN5ieFtgEq7hnWdOsQdBbGqROI5rORhJPO5OTRd+fcqV1L972MHHJXSgTaLt26
         dmMBBd9U885vlXHxrl1p07RRkx70AGBqna+RqTxfSOQckSSLjY3HX/+7eBHxCXHPtl
         aUMoCkM63lxWk2QXlYQRiF2UaX9UjcW05p0ScHJS1b8h530w1vXfzZnTu/iUXpqnf6
         goFulUKDm/dsw==
From:   =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
To:     linux-leds@vger.kernel.org, Pavel Machek <pavel@ucw.cz>,
        Lee Jones <lee@kernel.org>
Cc:     =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
Subject: [PATCH v2 3/3] leds: turris-omnia: support HW controlled mode via private trigger
Date:   Fri, 14 Jul 2023 10:52:53 +0200
Message-ID: <20230714085253.13544-4-kabel@kernel.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230714085253.13544-1-kabel@kernel.org>
References: <20230714085253.13544-1-kabel@kernel.org>
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
compatibility, if needed.

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
index 6046dfeca16f..ebb3b84d7a4f 100644
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
index 7977c0372667..6ce66e79096c 100644
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
@@ -115,6 +148,8 @@ static int omnia_led_register(struct i2c_client *client, struct omnia_led *led,
 	cdev = &led->mc_cdev.led_cdev;
 	cdev->max_brightness = 1;
 	cdev->brightness_set_blocking = omnia_led_brightness_set_blocking;
+	cdev->trigger_type = &omnia_hw_trigger_type;
+	cdev->default_trigger = omnia_hw_trigger.name;
 
 	/* put the LED into software mode */
 	ret = i2c_smbus_write_byte_data(client, CMD_LED_MODE,
@@ -230,6 +265,12 @@ static int omnia_leds_probe(struct i2c_client *client)
 
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

