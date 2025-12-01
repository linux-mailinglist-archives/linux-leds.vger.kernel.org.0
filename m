Return-Path: <linux-leds+bounces-6371-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id C5CD7C99857
	for <lists+linux-leds@lfdr.de>; Tue, 02 Dec 2025 00:07:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 62FEA345362
	for <lists+linux-leds@lfdr.de>; Mon,  1 Dec 2025 23:07:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C13D129ACC5;
	Mon,  1 Dec 2025 23:06:29 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B305728D850;
	Mon,  1 Dec 2025 23:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764630389; cv=none; b=SpF+GOYksEkpI9gmCMHsROGs3EYqFJWhCC01weuwzKOtgPWTYx6cqAqhoTKl8lTkOJRb/DAAXDIGI0C75G5aKk6wQcp8kqm7IW6WuZQozFopKPz00RcO3SGjGgFRwuw3vpX9VPrjjqmvrEhRE6agLVCIicATG+aP2nsNsYUu9jA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764630389; c=relaxed/simple;
	bh=qLwCQvwECblu4LrWLnMQ3j5CAmd0w/eHp+sm74OHE1M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f9O1hu+FJs3f5qD824EVEfC04ukBxRLYblH14vbxpU8L9rxvsWTCJpa2kyARyXcFbe/1DVw8EdzeBC2fnx3cVuWoRTJIYu0OS02DIjwRzgMh/1VNFLBfPSJWLFhVAM552tR11StLQ8FO3+2afnFz88eLr4PM4nDsz2lpzgc+rjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=timmermann.space; spf=pass smtp.mailfrom=timmermann.space; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=timmermann.space
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=timmermann.space
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4dKzzg1mcCz9vBH;
	Tue,  2 Dec 2025 00:06:23 +0100 (CET)
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of linux@timmermann.space designates 2001:67c:2050:b231:465::102 as permitted sender) smtp.mailfrom=linux@timmermann.space
From: Lukas Timmermann <linux@timmermann.space>
To: lee@kernel.org,
	pavel@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@timmermann.space
Subject: [PATCH v13 2/2] leds: as3668: Driver for the ams Osram 4-channel i2c LED driver
Date: Tue,  2 Dec 2025 00:06:01 +0100
Message-ID: <20251201230601.285641-3-linux@timmermann.space>
In-Reply-To: <20251201230601.285641-1-linux@timmermann.space>
References: <20251201230601.285641-1-linux@timmermann.space>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4dKzzg1mcCz9vBH

Since there were no existing drivers for the AS3668 or related devices,
a new driver was introduced in a separate file. Similar devices were
reviewed, but none shared enough characteristics to justify code reuse.
As a result, this driver is written specifically for the AS3668.

Signed-off-by: Lukas Timmermann <linux@timmermann.space>
---
 MAINTAINERS                |   1 +
 drivers/leds/Kconfig       |  13 +++
 drivers/leds/Makefile      |   1 +
 drivers/leds/leds-as3668.c | 202 +++++++++++++++++++++++++++++++++++++
 4 files changed, 217 insertions(+)
 create mode 100644 drivers/leds/leds-as3668.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 091206c54c63..945d78fef380 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3511,6 +3511,7 @@ M:	Lukas Timmermann <linux@timmermann.space>
 L:	linux-leds@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/leds/ams,as3668.yaml
+F:	drivers/leds/leds-as3668.c
 
 ASAHI KASEI AK7375 LENS VOICE COIL DRIVER
 M:	Tianshu Qiu <tian.shu.qiu@intel.com>
diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index a104cbb0a001..ec37d55ac14e 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -100,6 +100,19 @@ config LEDS_ARIEL
 
 	  Say Y to if your machine is a Dell Wyse 3020 thin client.
 
+config LEDS_OSRAM_AMS_AS3668
+	tristate "LED support for Osram AMS AS3668"
+	depends on LEDS_CLASS
+	depends on I2C
+	help
+	  This option enables support for the Osram AMS AS3668 LED controller.
+	  The AS3668 provides up to four LED channels and is controlled via
+	  the I2C bus. This driver offers basic brightness control for each
+	  channel, without support for blinking or other advanced features.
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called leds-as3668.
+
 config LEDS_AW200XX
 	tristate "LED support for Awinic AW20036/AW20054/AW20072/AW20108"
 	depends on LEDS_CLASS
diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
index 2f170d69dcbf..983811384fec 100644
--- a/drivers/leds/Makefile
+++ b/drivers/leds/Makefile
@@ -14,6 +14,7 @@ obj-$(CONFIG_LEDS_ADP5520)		+= leds-adp5520.o
 obj-$(CONFIG_LEDS_AN30259A)		+= leds-an30259a.o
 obj-$(CONFIG_LEDS_APU)			+= leds-apu.o
 obj-$(CONFIG_LEDS_ARIEL)		+= leds-ariel.o
+obj-$(CONFIG_LEDS_AS3668)		+= leds-as3668.o
 obj-$(CONFIG_LEDS_AW200XX)		+= leds-aw200xx.o
 obj-$(CONFIG_LEDS_AW2013)		+= leds-aw2013.o
 obj-$(CONFIG_LEDS_BCM6328)		+= leds-bcm6328.o
diff --git a/drivers/leds/leds-as3668.c b/drivers/leds/leds-as3668.c
new file mode 100644
index 000000000000..664c0376e97d
--- /dev/null
+++ b/drivers/leds/leds-as3668.c
@@ -0,0 +1,202 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ *  Osram AMS AS3668 LED Driver IC
+ *
+ *  Copyright (C) 2025 Lukas Timmermann <linux@timmermann.space>
+ */
+
+#include <linux/bitfield.h>
+#include <linux/i2c.h>
+#include <linux/leds.h>
+#include <linux/module.h>
+#include <linux/uleds.h>
+
+#define AS3668_MAX_LEDS			4
+
+/* Chip Ident */
+
+#define AS3668_CHIP_ID1_REG		0x3e
+#define AS3668_CHIP_ID			0xa5
+
+/* Current Control */
+
+#define AS3668_CURR_MODE_REG		0x01
+#define AS3668_CURR_MODE_OFF		0x0
+#define AS3668_CURR_MODE_ON		0x1
+#define AS3668_CURR1_MODE_MASK		GENMASK(1, 0)
+#define AS3668_CURR2_MODE_MASK		GENMASK(3, 2)
+#define AS3668_CURR3_MODE_MASK		GENMASK(5, 4)
+#define AS3668_CURR4_MODE_MASK		GENMASK(7, 6)
+#define AS3668_CURR1_REG		0x02
+#define AS3668_CURR2_REG		0x03
+#define AS3668_CURR3_REG		0x04
+#define AS3668_CURR4_REG		0x05
+
+#define AS3668_CURR_MODE_PACK(mode)	((mode) << 0) | \
+					((mode) << 2) | \
+					((mode) << 4) | \
+					((mode) << 6)
+
+struct as3668_led {
+	struct led_classdev cdev;
+	struct as3668 *chip;
+	struct fwnode_handle *fwnode;
+	u8 mode_mask;
+	u8 current_reg;
+};
+
+struct as3668 {
+	struct i2c_client *client;
+	struct as3668_led leds[AS3668_MAX_LEDS];
+};
+
+static int as3668_channel_mode_set(struct as3668_led *led, u8 mode)
+{
+    int ret;
+    u8 channel_modes;
+
+    ret = i2c_smbus_read_byte_data(led->chip->client, AS3668_CURR_MODE_REG);
+    if (ret < 0) {
+        dev_err(led->cdev.dev, "failed to read channel modes\n");
+        return ret;
+    }
+    channel_modes = (u8)ret;
+
+    channel_modes &= ~led->mode_mask;
+    channel_modes |= led->mode_mask & (AS3668_CURR_MODE_PACK(mode));
+
+    return i2c_smbus_write_byte_data(led->chip->client, AS3668_CURR_MODE_REG, channel_modes);
+}
+
+static enum led_brightness as3668_brightness_get(struct led_classdev *cdev)
+{
+	struct as3668_led *led = container_of(cdev, struct as3668_led, cdev);
+
+	return i2c_smbus_read_byte_data(led->chip->client, led->current_reg);
+}
+
+static void as3668_brightness_set(struct led_classdev *cdev, enum led_brightness brightness)
+{
+	struct as3668_led *led = container_of(cdev, struct as3668_led, cdev);
+	int err;
+
+	err = as3668_channel_mode_set(led, !!brightness);
+	if (err)
+		dev_err(cdev->dev, "failed to set channel mode: %d\n", err);
+
+	err = i2c_smbus_write_byte_data(led->chip->client, led->current_reg, brightness);
+	if (err)
+		dev_err(cdev->dev, "failed to set brightness: %d\n", err);
+}
+
+static int as3668_dt_init(struct as3668 *as3668)
+{
+	struct device *dev = &as3668->client->dev;
+	struct as3668_led *led;
+	struct led_init_data init_data = {};
+	int err;
+	u32 reg;
+
+	for_each_available_child_of_node_scoped(dev_of_node(dev), child) {
+		err = of_property_read_u32(child, "reg", &reg);
+		if (err)
+			return dev_err_probe(dev, err, "failed to read 'reg' property");
+
+		if (reg < 0 || reg >= AS3668_MAX_LEDS)
+			return dev_err_probe(dev, -EINVAL,
+					     "unsupported LED: %d\n", reg);
+
+		led = &as3668->leds[reg];
+		led->fwnode = of_fwnode_handle(child);
+
+		led->current_reg = reg + AS3668_CURR1_REG;
+		led->mode_mask = AS3668_CURR1_MODE_MASK << (reg * 2);
+		led->chip = as3668;
+
+		led->cdev.max_brightness = U8_MAX;
+		led->cdev.brightness_get = as3668_brightness_get;
+		led->cdev.brightness_set = as3668_brightness_set;
+
+		init_data.fwnode = led->fwnode;
+		init_data.default_label = ":";
+
+		err = devm_led_classdev_register_ext(dev, &led->cdev, &init_data);
+		if (err)
+			return dev_err_probe(dev, err, "failed to register LED %d\n", reg);
+	}
+
+	return 0;
+}
+
+static int as3668_probe(struct i2c_client *client)
+{
+	struct as3668 *as3668;
+	int err;
+	u8 chip_id;
+
+	chip_id = i2c_smbus_read_byte_data(client, AS3668_CHIP_ID1_REG);
+	if (chip_id != AS3668_CHIP_ID)
+		return dev_err_probe(&client->dev, -ENODEV,
+				     "expected chip ID 0x%02x, got 0x%02x\n",
+				     AS3668_CHIP_ID, chip_id);
+
+	as3668 = devm_kzalloc(&client->dev, sizeof(*as3668), GFP_KERNEL);
+	if (!as3668)
+		return -ENOMEM;
+
+	as3668->client = client;
+
+	err = as3668_dt_init(as3668);
+	if (err)
+		return err;
+
+	/* Set all four channel modes to 'off' */
+	err = i2c_smbus_write_byte_data(client, AS3668_CURR_MODE_REG,
+					FIELD_PREP(AS3668_CURR1_MODE_MASK, AS3668_CURR_MODE_OFF) |
+					FIELD_PREP(AS3668_CURR2_MODE_MASK, AS3668_CURR_MODE_OFF) |
+					FIELD_PREP(AS3668_CURR3_MODE_MASK, AS3668_CURR_MODE_OFF) |
+					FIELD_PREP(AS3668_CURR4_MODE_MASK, AS3668_CURR_MODE_OFF));
+
+	/* Set initial currents to 0mA */
+	err |= i2c_smbus_write_byte_data(client, AS3668_CURR1_REG, 0);
+	err |= i2c_smbus_write_byte_data(client, AS3668_CURR2_REG, 0);
+	err |= i2c_smbus_write_byte_data(client, AS3668_CURR3_REG, 0);
+	err |= i2c_smbus_write_byte_data(client, AS3668_CURR4_REG, 0);
+
+	if (err)
+		return dev_err_probe(&client->dev, -EIO, "failed to set zero initial current levels\n");
+
+	return 0;
+}
+
+static void as3668_remove(struct i2c_client *client)
+{
+	i2c_smbus_write_byte_data(client, AS3668_CURR_MODE_REG, 0);
+}
+
+static const struct i2c_device_id as3668_idtable[] = {
+	{ "as3668" },
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, as3668_idtable);
+
+static const struct of_device_id as3668_match_table[] = {
+	{ .compatible = "ams,as3668" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, as3668_match_table);
+
+static struct i2c_driver as3668_driver = {
+	.driver = {
+		.name = "leds_as3668",
+		.of_match_table = as3668_match_table,
+	},
+	.probe = as3668_probe,
+	.remove = as3668_remove,
+	.id_table = as3668_idtable,
+};
+module_i2c_driver(as3668_driver);
+
+MODULE_AUTHOR("Lukas Timmermann <linux@timmermann.space>");
+MODULE_DESCRIPTION("AS3668 LED driver");
+MODULE_LICENSE("GPL");
-- 
2.52.0


