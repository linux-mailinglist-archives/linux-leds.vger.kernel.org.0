Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 668F77A4E8B
	for <lists+linux-leds@lfdr.de>; Mon, 18 Sep 2023 18:18:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229436AbjIRQTB (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 18 Sep 2023 12:19:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230104AbjIRQSo (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 18 Sep 2023 12:18:44 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 392E06A66
        for <linux-leds@vger.kernel.org>; Mon, 18 Sep 2023 09:11:38 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F699C43142;
        Mon, 18 Sep 2023 16:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695053473;
        bh=wuTHXeiu7hGXpCNjWPeVN4T0I6qzcUPEFTnXitUj1gY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=FxEXkFzMkr7w06VC7+yeHAhjNTyACV2w9tEeBwK8NVn3vpL7vZJRxToZExDsy/FjW
         yXc8vbVCzwZPVdyr2oWoEGORPHOHm3FfcSBgUw5Q/cWwOtbkdPHg1RunKmz1zvqoyZ
         ArxK9WohooR6u0MLu0Q/pNZu6mWLNHVHqI6AJVAJsMpNaxvSJ5vvJpnhCui5+A9rbb
         81uX1SF70LIdrkf+IiQ0qVYkA1h54KzYsiKMZk5gXrGp+Psn8JT2n67go/Oo5XM7rf
         zb2qzTU82fmVmyy4BwaPdfDje04e8BbxTCK30NUCQ9T71gCWucR2MxzWdIz2d05ijQ
         rT0tOnjmh3Fvw==
From:   =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
To:     Lee Jones <lee@kernel.org>, linux-leds@vger.kernel.org
Cc:     =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
Subject: [PATCH v4 4/4] leds: turris-omnia: add support for enabling/disabling HW gamma correction
Date:   Mon, 18 Sep 2023 18:11:04 +0200
Message-ID: <20230918161104.20860-5-kabel@kernel.org>
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

If the MCU on Turris Omnia is running newer firmware versions, the LED
controller supports RGB gamma correction (and enables it by default for
newer boards).

Determine whether the gamma correction setting feature is supported and
add the ability to set it via sysfs attribute file.

Signed-off-by: Marek Behún <kabel@kernel.org>
---
 .../sysfs-class-led-driver-turris-omnia       |  14 ++
 drivers/leds/leds-turris-omnia.c              | 137 +++++++++++++++---
 2 files changed, 134 insertions(+), 17 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-class-led-driver-turris-omnia b/Documentation/ABI/testing/sysfs-class-led-driver-turris-omnia
index c4d46970c1cf..369b4ae8be5f 100644
--- a/Documentation/ABI/testing/sysfs-class-led-driver-turris-omnia
+++ b/Documentation/ABI/testing/sysfs-class-led-driver-turris-omnia
@@ -12,3 +12,17 @@ Description:	(RW) On the front panel of the Turris Omnia router there is also
 		able to change this setting from software.
 
 		Format: %i
+
+What:		/sys/class/leds/<led>/device/gamma_correction
+Date:		August 2023
+KernelVersion:	6.6
+Contact:	Marek Behún <kabel@kernel.org>
+Description:	(RW) Newer versions of the microcontroller firmware of the
+		Turris Omnia router support gamma correction for the RGB LEDs.
+		This feature can be enabled/disabled by writing to this file.
+
+		If the feature is not supported because the MCU firmware is too
+		old, the file always reads as 0, and writing to the file results
+		in the EOPNOTSUPP error.
+
+		Format: %i
diff --git a/drivers/leds/leds-turris-omnia.c b/drivers/leds/leds-turris-omnia.c
index bdccce0ec39c..e1a4629479c5 100644
--- a/drivers/leds/leds-turris-omnia.c
+++ b/drivers/leds/leds-turris-omnia.c
@@ -15,17 +15,30 @@
 #define OMNIA_BOARD_LEDS	12
 #define OMNIA_LED_NUM_CHANNELS	3
 
-#define CMD_LED_MODE		3
-#define CMD_LED_MODE_LED(l)	((l) & 0x0f)
-#define CMD_LED_MODE_USER	0x10
+/* MCU controller commands at I2C address 0x2a */
+#define OMNIA_MCU_I2C_ADDR		0x2a
 
-#define CMD_LED_STATE		4
-#define CMD_LED_STATE_LED(l)	((l) & 0x0f)
-#define CMD_LED_STATE_ON	0x10
+#define CMD_GET_STATUS_WORD		0x01
+#define STS_FEATURES_SUPPORTED		BIT(2)
 
-#define CMD_LED_COLOR		5
-#define CMD_LED_SET_BRIGHTNESS	7
-#define CMD_LED_GET_BRIGHTNESS	8
+#define CMD_GET_FEATURES		0x10
+#define FEAT_LED_GAMMA_CORRECTION	BIT(5)
+
+/* LED controller commands at I2C address 0x2b */
+#define CMD_LED_MODE			0x03
+#define CMD_LED_MODE_LED(l)		((l) & 0x0f)
+#define CMD_LED_MODE_USER		0x10
+
+#define CMD_LED_STATE			0x04
+#define CMD_LED_STATE_LED(l)		((l) & 0x0f)
+#define CMD_LED_STATE_ON		0x10
+
+#define CMD_LED_COLOR			0x05
+#define CMD_LED_SET_BRIGHTNESS		0x07
+#define CMD_LED_GET_BRIGHTNESS		0x08
+
+#define CMD_SET_GAMMA_CORRECTION	0x30
+#define CMD_GET_GAMMA_CORRECTION	0x31
 
 struct omnia_led {
 	struct led_classdev_mc mc_cdev;
@@ -40,6 +53,7 @@ struct omnia_led {
 struct omnia_leds {
 	struct i2c_client *client;
 	struct mutex lock;
+	bool has_gamma_correction;
 	struct omnia_led leds[];
 };
 
@@ -51,30 +65,42 @@ static int omnia_cmd_write_u8(const struct i2c_client *client, u8 cmd, u8 val)
 	return i2c_master_send(client, buf, sizeof(buf));
 }
 
-static int omnia_cmd_read_u8(const struct i2c_client *client, u8 cmd)
+static int omnia_cmd_read_raw(struct i2c_adapter *adapter, u8 addr, u8 cmd,
+			      void *reply, size_t len)
 {
 	struct i2c_msg msgs[2];
-	u8 reply;
 	int ret;
 
-	msgs[0].addr = client->addr;
+	msgs[0].addr = addr;
 	msgs[0].flags = 0;
 	msgs[0].len = 1;
 	msgs[0].buf = &cmd;
-	msgs[1].addr = client->addr;
+	msgs[1].addr = addr;
 	msgs[1].flags = I2C_M_RD;
-	msgs[1].len = 1;
-	msgs[1].buf = &reply;
+	msgs[1].len = len;
+	msgs[1].buf = reply;
 
-	ret = i2c_transfer(client->adapter, msgs, ARRAY_SIZE(msgs));
+	ret = i2c_transfer(adapter, msgs, ARRAY_SIZE(msgs));
 	if (likely(ret == ARRAY_SIZE(msgs)))
-		return reply;
+		return len;
 	else if (ret < 0)
 		return ret;
 	else
 		return -EIO;
 }
 
+static int omnia_cmd_read_u8(const struct i2c_client *client, u8 cmd)
+{
+	u8 reply;
+	int ret;
+
+	ret = omnia_cmd_read_raw(client->adapter, client->addr, cmd, &reply, 1);
+	if (ret < 0)
+		return ret;
+
+	return reply;
+}
+
 static int omnia_led_send_color_cmd(const struct i2c_client *client,
 				    struct omnia_led *led)
 {
@@ -353,12 +379,74 @@ static ssize_t brightness_store(struct device *dev, struct device_attribute *a,
 }
 static DEVICE_ATTR_RW(brightness);
 
+static ssize_t gamma_correction_show(struct device *dev,
+				     struct device_attribute *a, char *buf)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	struct omnia_leds *leds = i2c_get_clientdata(client);
+	int ret;
+
+	if (leds->has_gamma_correction) {
+		ret = omnia_cmd_read_u8(client, CMD_GET_GAMMA_CORRECTION);
+		if (ret < 0)
+			return ret;
+	} else {
+		ret = 0;
+	}
+
+	return sysfs_emit(buf, "%d\n", !!ret);
+}
+
+static ssize_t gamma_correction_store(struct device *dev,
+				      struct device_attribute *a,
+				      const char *buf, size_t count)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	struct omnia_leds *leds = i2c_get_clientdata(client);
+	bool val;
+	int ret;
+
+	if (!leds->has_gamma_correction)
+		return -EOPNOTSUPP;
+
+	if (kstrtobool(buf, &val) < 0)
+		return -EINVAL;
+
+	ret = omnia_cmd_write_u8(client, CMD_SET_GAMMA_CORRECTION, val);
+
+	return ret < 0 ? ret : count;
+}
+static DEVICE_ATTR_RW(gamma_correction);
+
 static struct attribute *omnia_led_controller_attrs[] = {
 	&dev_attr_brightness.attr,
+	&dev_attr_gamma_correction.attr,
 	NULL,
 };
 ATTRIBUTE_GROUPS(omnia_led_controller);
 
+static int omnia_mcu_get_features(const struct i2c_client *client)
+{
+	u16 reply;
+	int err;
+
+	err = omnia_cmd_read_raw(client->adapter, OMNIA_MCU_I2C_ADDR,
+				 CMD_GET_STATUS_WORD, &reply, sizeof(reply));
+	if (err < 0)
+		return err;
+
+	/* Check whether MCU firmware supports the CMD_GET_FEAUTRES command */
+	if (!(le16_to_cpu(reply) & STS_FEATURES_SUPPORTED))
+		return 0;
+
+	err = omnia_cmd_read_raw(client->adapter, OMNIA_MCU_I2C_ADDR,
+				 CMD_GET_FEATURES, &reply, sizeof(reply));
+	if (err < 0)
+		return err;
+
+	return le16_to_cpu(reply);
+}
+
 static int omnia_leds_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
@@ -383,6 +471,21 @@ static int omnia_leds_probe(struct i2c_client *client)
 	leds->client = client;
 	i2c_set_clientdata(client, leds);
 
+	ret = omnia_mcu_get_features(client);
+	if (ret < 0) {
+		dev_err(dev, "Cannot determine MCU supported features: %d\n",
+			ret);
+		return ret;
+	}
+
+	leds->has_gamma_correction = ret & FEAT_LED_GAMMA_CORRECTION;
+	if (!leds->has_gamma_correction) {
+		dev_info(dev,
+			 "Your board's MCU firmware does not support the LED gamma correction feature.\n");
+		dev_info(dev,
+			 "Consider upgrading MCU firmware with the omnia-mcutool utility.\n");
+	}
+
 	mutex_init(&leds->lock);
 
 	ret = devm_led_trigger_register(dev, &omnia_hw_trigger);
-- 
2.41.0

