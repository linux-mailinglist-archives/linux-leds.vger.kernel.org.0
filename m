Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 557A37CAB2F
	for <lists+linux-leds@lfdr.de>; Mon, 16 Oct 2023 16:16:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233736AbjJPOPu (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 16 Oct 2023 10:15:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233771AbjJPOPs (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 16 Oct 2023 10:15:48 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7186BF2
        for <linux-leds@vger.kernel.org>; Mon, 16 Oct 2023 07:15:43 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC842C433C9;
        Mon, 16 Oct 2023 14:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1697465742;
        bh=T7K/xUClRmaiiX8KPEQwbk3iB8YEASft/Eyn8+mdoOU=;
        h=From:To:Cc:Subject:Date:From;
        b=PJJXRt7fGxffmuJaJrpCbZhZnSZ7woQUwXadLnDAeopSYkV+LN8xk8vMsGqG/hKSl
         L8ULWKAFc/pSrwPNK4THsG0JcktJjas1a1oWYNqNH45yrxHD3b3HAw/QvoLD7a5w/o
         C9QP7QF9pSyby7uySb3QIZ1z0sFcQPHog5RkQdkdqIkqauWzQ/ymQku+WnaMKWHQ30
         Ql1+lh0SHf1p9ko+DKF7LIJSwR4Ja9YORe+1AgDBAXJo3aNPO+c/udbz3dQNWEi05J
         5+41RtLV6tloCMeAndDwwobwkeX9XAw6xYnVWsh1CJCuK2IDuhfSNqMx13Z04LPvtv
         6hb6bASnbS/sg==
From:   =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
To:     Lee Jones <lee@kernel.org>
Cc:     linux-leds@vger.kernel.org,
        =?UTF-8?q?Marek=20Moj=C3=ADk?= <marek.mojik@nic.cz>,
        =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
Subject: [PATCH] leds: turris-omnia: Fix brightness setting and trigger activating
Date:   Mon, 16 Oct 2023 16:15:38 +0200
Message-ID: <20231016141538.30037-1-kabel@kernel.org>
X-Mailer: git-send-email 2.41.0
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

I have improperly refactored commits
  4d5ed2621c24 ("leds: turris-omnia: Make set_brightness() more efficient")
and
  aaf38273cf76 ("leds: turris-omnia: Support HW controlled mode via private trigger")
after Lee requested a change in API semantics of the new functions I
introduced in commit
  28350bc0ac77 ("leds: turris-omnia: Do not use SMBUS calls").

Before the change, the function omnia_cmd_write_u8() returned 0 on
success, and afterwards it returned a positive value (number of bytes
written). The latter version was applied, but the following commits did
not properly account for this change.

This results in non-functional LED's .brightness_set_blocking() and
trigger's .activate() methods.

The main reasoning behind the semantics change was that read/write
methods should return the number of read/written bytes on success.
It was pointed to me [1] that this is not always true (for example the
regmap API does not do so), and since the driver never uses this number
of read/written bytes information, I decided to fix this issue by
changing the functions to the original semantics (return 0 on success).

[1] https://lore.kernel.org/linux-gpio/ZQnn+Gi0xVlsGCYA@smile.fi.intel.com/

Fixes: 28350bc0ac77 ("leds: turris-omnia: Do not use SMBUS calls")
Signed-off-by: Marek Behún <kabel@kernel.org>
---
 drivers/leds/leds-turris-omnia.c | 37 +++++++++++++++++---------------
 1 file changed, 20 insertions(+), 17 deletions(-)

diff --git a/drivers/leds/leds-turris-omnia.c b/drivers/leds/leds-turris-omnia.c
index f27241896970..b443f8c989fa 100644
--- a/drivers/leds/leds-turris-omnia.c
+++ b/drivers/leds/leds-turris-omnia.c
@@ -60,8 +60,11 @@ struct omnia_leds {
 static int omnia_cmd_write_u8(const struct i2c_client *client, u8 cmd, u8 val)
 {
 	u8 buf[2] = { cmd, val };
+	int ret;
+
+	ret = i2c_master_send(client, buf, sizeof(buf));
 
-	return i2c_master_send(client, buf, sizeof(buf));
+	return ret < 0 ? ret : 0;
 }
 
 static int omnia_cmd_read_raw(struct i2c_adapter *adapter, u8 addr, u8 cmd,
@@ -81,7 +84,7 @@ static int omnia_cmd_read_raw(struct i2c_adapter *adapter, u8 addr, u8 cmd,
 
 	ret = i2c_transfer(adapter, msgs, ARRAY_SIZE(msgs));
 	if (likely(ret == ARRAY_SIZE(msgs)))
-		return len;
+		return 0;
 	else if (ret < 0)
 		return ret;
 	else
@@ -91,11 +94,11 @@ static int omnia_cmd_read_raw(struct i2c_adapter *adapter, u8 addr, u8 cmd,
 static int omnia_cmd_read_u8(const struct i2c_client *client, u8 cmd)
 {
 	u8 reply;
-	int ret;
+	int err;
 
-	ret = omnia_cmd_read_raw(client->adapter, client->addr, cmd, &reply, 1);
-	if (ret < 0)
-		return ret;
+	err = omnia_cmd_read_raw(client->adapter, client->addr, cmd, &reply, 1);
+	if (err)
+		return err;
 
 	return reply;
 }
@@ -236,7 +239,7 @@ static void omnia_hwtrig_deactivate(struct led_classdev *cdev)
 
 	mutex_unlock(&leds->lock);
 
-	if (err < 0)
+	if (err)
 		dev_err(cdev->dev, "Cannot put LED to software mode: %i\n",
 			err);
 }
@@ -302,7 +305,7 @@ static int omnia_led_register(struct i2c_client *client, struct omnia_led *led,
 	ret = omnia_cmd_write_u8(client, CMD_LED_MODE,
 				 CMD_LED_MODE_LED(led->reg) |
 				 CMD_LED_MODE_USER);
-	if (ret < 0) {
+	if (ret) {
 		dev_err(dev, "Cannot set LED %pOF to software mode: %i\n", np,
 			ret);
 		return ret;
@@ -311,7 +314,7 @@ static int omnia_led_register(struct i2c_client *client, struct omnia_led *led,
 	/* disable the LED */
 	ret = omnia_cmd_write_u8(client, CMD_LED_STATE,
 				 CMD_LED_STATE_LED(led->reg));
-	if (ret < 0) {
+	if (ret) {
 		dev_err(dev, "Cannot set LED %pOF brightness: %i\n", np, ret);
 		return ret;
 	}
@@ -364,7 +367,7 @@ static ssize_t brightness_store(struct device *dev, struct device_attribute *a,
 {
 	struct i2c_client *client = to_i2c_client(dev);
 	unsigned long brightness;
-	int ret;
+	int err;
 
 	if (kstrtoul(buf, 10, &brightness))
 		return -EINVAL;
@@ -372,9 +375,9 @@ static ssize_t brightness_store(struct device *dev, struct device_attribute *a,
 	if (brightness > 100)
 		return -EINVAL;
 
-	ret = omnia_cmd_write_u8(client, CMD_LED_SET_BRIGHTNESS, brightness);
+	err = omnia_cmd_write_u8(client, CMD_LED_SET_BRIGHTNESS, brightness);
 
-	return ret < 0 ? ret : count;
+	return err ?: count;
 }
 static DEVICE_ATTR_RW(brightness);
 
@@ -403,7 +406,7 @@ static ssize_t gamma_correction_store(struct device *dev,
 	struct i2c_client *client = to_i2c_client(dev);
 	struct omnia_leds *leds = i2c_get_clientdata(client);
 	bool val;
-	int ret;
+	int err;
 
 	if (!leds->has_gamma_correction)
 		return -EOPNOTSUPP;
@@ -411,9 +414,9 @@ static ssize_t gamma_correction_store(struct device *dev,
 	if (kstrtobool(buf, &val) < 0)
 		return -EINVAL;
 
-	ret = omnia_cmd_write_u8(client, CMD_SET_GAMMA_CORRECTION, val);
+	err = omnia_cmd_write_u8(client, CMD_SET_GAMMA_CORRECTION, val);
 
-	return ret < 0 ? ret : count;
+	return err ?: count;
 }
 static DEVICE_ATTR_RW(gamma_correction);
 
@@ -431,7 +434,7 @@ static int omnia_mcu_get_features(const struct i2c_client *client)
 
 	err = omnia_cmd_read_raw(client->adapter, OMNIA_MCU_I2C_ADDR,
 				 CMD_GET_STATUS_WORD, &reply, sizeof(reply));
-	if (err < 0)
+	if (err)
 		return err;
 
 	/* Check whether MCU firmware supports the CMD_GET_FEAUTRES command */
@@ -440,7 +443,7 @@ static int omnia_mcu_get_features(const struct i2c_client *client)
 
 	err = omnia_cmd_read_raw(client->adapter, OMNIA_MCU_I2C_ADDR,
 				 CMD_GET_FEATURES, &reply, sizeof(reply));
-	if (err < 0)
+	if (err)
 		return err;
 
 	return le16_to_cpu(reply);
-- 
2.41.0

