Return-Path: <linux-leds+bounces-4755-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 42222AD1031
	for <lists+linux-leds@lfdr.de>; Sat,  7 Jun 2025 23:52:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 70D237A343A
	for <lists+linux-leds@lfdr.de>; Sat,  7 Jun 2025 21:51:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53F80218851;
	Sat,  7 Jun 2025 21:52:13 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BA0221ABA8;
	Sat,  7 Jun 2025 21:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749333133; cv=none; b=ii7vxCL+QMQlriWGwPPtr7+YurgLYWCri9y9Z4FwnZPbF5VqD+7s0xAdCFAHKgjjy4h0iefQRoIihaBxR0ftXAmxHVKL7pqKNE1RfzOISI2Hmya52s/a6z2CaAQ16zMutS31CTLTpPNWiNM09ipCOfdpvjtrXe8Myf5RvO0KBK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749333133; c=relaxed/simple;
	bh=ro13YKGz88KYcj43BPL02gYx2FUdYxyATbykMLPoOio=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SxzGAd/9Pwn69XYuqDDPeef3/k/QsyY+V2sQINLgT+Q4xodt7vHSxM+ZrJ+SKKyjcOJOtWEkMSZLF5grvMqEGeQJNQmu5I/v/y+465WfWu9MuxnGv7fRm+UjCWOJPwmFKCBTpHvl5FiWh0Ch1VF1oVtMXwZqzds73FKrg5fbDL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=timmermann.space; spf=pass smtp.mailfrom=timmermann.space; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=timmermann.space
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=timmermann.space
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4bFBjg2RDlz9sqq;
	Sat,  7 Jun 2025 23:52:07 +0200 (CEST)
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
Subject: [PATCH v4 2/2] leds: as3668: Driver for the ams Osram 4-channel i2c LED driver
Date: Sat,  7 Jun 2025 23:50:49 +0200
Message-ID: <20250607215049.29259-3-linux@timmermann.space>
In-Reply-To: <20250607215049.29259-1-linux@timmermann.space>
References: <20250607215049.29259-1-linux@timmermann.space>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since there were no existing drivers for the AS3668 or related devices,
a new driver was introduced in a separate file. Similar devices were
reviewed, but none shared enough characteristics to justify code reuse.
As a result, this driver is written specifically for the AS3668.

Signed-off-by: Lukas Timmermann <linux@timmermann.space>
---
 MAINTAINERS                |   1 +
 drivers/leds/Kconfig       |  13 +++
 drivers/leds/Makefile      |   1 +
 drivers/leds/leds-as3668.c | 196 +++++++++++++++++++++++++++++++++++++
 4 files changed, 211 insertions(+)
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
index a104cbb0a001..8cfb423ddf82 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -100,6 +100,19 @@ config LEDS_ARIEL
 
 	  Say Y to if your machine is a Dell Wyse 3020 thin client.
 
+config LEDS_AS3668
+	tristate "LED support for AMS AS3668"
+	depends on LEDS_CLASS
+	depends on I2C
+	help
+	  This option enables support for the AMS AS3668 LED controller.
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
index 000000000000..e3f90078f6ec
--- /dev/null
+++ b/drivers/leds/leds-as3668.c
@@ -0,0 +1,196 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ *  Osram AMS AS3668 LED Driver IC
+ *
+ *  Copyright (C) 2025 Lukas Timmermann <linux@timmermann.space>
+ */
+
+#include <linux/i2c.h>
+#include <linux/leds.h>
+#include <linux/module.h>
+#include <linux/uleds.h>
+
+#define AS3668_MAX_LEDS 4
+
+/* Chip Registers */
+#define AS3668_CHIP_ID1 0x3e
+#define AS3668_CHIP_ID2 0x3f
+
+#define AS3668_CHIP_ID2_SERIAL_MASK GENMASK(7, 4)
+#define AS3668_CHIP_ID2_REV_MASK GENMASK(3, 0)
+
+#define AS3668_CURRX_CONTROL 0x01
+#define AS3668_CURR1 0x02
+#define AS3668_CURR2 0x03
+#define AS3668_CURR3 0x04
+#define AS3668_CURR4 0x05
+
+/* Constants */
+#define AS3668_CHIP_IDENT 0xa5
+#define AS3668_CHIP_REV1 0x01
+
+struct as3668_led {
+	struct led_classdev cdev;
+	struct as3668 *chip;
+	struct fwnode_handle *fwnode;
+
+	int num;
+};
+
+struct as3668 {
+	struct i2c_client *client;
+	struct as3668_led leds[AS3668_MAX_LEDS];
+};
+
+static int as3668_read_value(struct i2c_client *client, u8 reg)
+{
+	return i2c_smbus_read_byte_data(client, reg);
+}
+
+static int as3668_write_value(struct i2c_client *client, u8 reg, u8 value)
+{
+	int err = i2c_smbus_write_byte_data(client, reg, value);
+
+	if (err)
+		dev_err(&client->dev, "error writing to reg 0x%tx, returned %d", reg, err);
+
+	return err;
+}
+
+static enum led_brightness as3668_brightness_get(struct led_classdev *cdev)
+{
+	struct as3668_led *led = container_of(cdev, struct as3668_led, cdev);
+
+	return as3668_read_value(led->chip->client, AS3668_CURR1 + led->num);
+}
+
+static void as3668_brightness_set(struct led_classdev *cdev, enum led_brightness brightness)
+{
+	struct as3668_led *led = container_of(cdev, struct as3668_led, cdev);
+
+	as3668_write_value(led->chip->client, AS3668_CURR1 + led->num, brightness);
+}
+
+static int as3668_dt_init(struct as3668 *as3668)
+{
+	struct device *dev = &as3668->client->dev;
+	struct as3668_led *led;
+	struct led_init_data init_data = {};
+	int err;
+	u32 reg;
+	int i = 0;
+
+	for_each_available_child_of_node_scoped(dev_of_node(dev), child) {
+		err = of_property_read_u32(child, "reg", &reg);
+		if (err)
+			dev_err(dev, "unable to read device tree led reg, err %d", err);
+
+		i = reg;
+
+		if (i < 0 || i > AS3668_MAX_LEDS) {
+			dev_err(dev, "unsupported led reg %d\n", i);
+			return -EOPNOTSUPP;
+		}
+
+		led = &as3668->leds[i];
+		led->fwnode = of_fwnode_handle(child);
+
+		led->num = i;
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
+		if (err) {
+			dev_err(dev, "failed to register %d LED\n", i);
+			return err;
+		}
+	}
+
+	return 0;
+}
+
+static int as3668_probe(struct i2c_client *client)
+{
+	u8 chip_id1, chip_id2, chip_serial, chip_rev;
+	struct as3668 *as3668;
+
+	/* Check for sensible i2c address */
+	if (client->addr != 0x42)
+		return dev_err_probe(&client->dev, -EFAULT,
+				     "unexpected address for as3668 device\n");
+
+	/* Read identifier from chip */
+	chip_id1 = as3668_read_value(client, AS3668_CHIP_ID1);
+
+	if (chip_id1 != AS3668_CHIP_IDENT)
+		return dev_err_probe(&client->dev, -ENODEV,
+				"chip reported wrong id: 0x%tx\n", chip_id1);
+
+	/* Check the revision*/
+	chip_id2 = as3668_read_value(client, AS3668_CHIP_ID2);
+	chip_serial = FIELD_GET(AS3668_CHIP_ID2_SERIAL_MASK, chip_id2);
+	chip_rev = FIELD_GET(AS3668_CHIP_ID2_REV_MASK, chip_id2);
+
+	if (chip_rev != AS3668_CHIP_REV1)
+		dev_warn(&client->dev, "unexpected chip revision\n");
+
+	/* Print out information about the chip */
+	dev_dbg(&client->dev,
+		"chip_id: 0x%tx | chip_id2: 0x%tx | chip_serial: 0x%tx | chip_rev: 0x%tx\n",
+		chip_id1, chip_id2, chip_serial, chip_rev);
+
+	as3668 = devm_kzalloc(&client->dev, struct_size(as3668, leds, AS3668_MAX_LEDS), GFP_KERNEL);
+	as3668->client = client;
+
+	as3668_dt_init(as3668);
+
+	/* Initialize the chip */
+	as3668_write_value(client, AS3668_CURRX_CONTROL, 0x55);
+	as3668_write_value(client, AS3668_CURR1, 0x00);
+	as3668_write_value(client, AS3668_CURR2, 0x00);
+	as3668_write_value(client, AS3668_CURR3, 0x00);
+	as3668_write_value(client, AS3668_CURR4, 0x00);
+
+	return 0;
+}
+
+static void as3668_remove(struct i2c_client *client)
+{
+	as3668_write_value(client, AS3668_CURRX_CONTROL, 0x0);
+}
+
+static const struct i2c_device_id as3668_idtable[] = {
+	{"as3668"},
+	{}
+};
+
+MODULE_DEVICE_TABLE(i2c, as3668_idtable);
+
+static const struct of_device_id as3668_match_table[] = {
+	{.compatible = "ams,as3668"},
+	{}
+};
+
+MODULE_DEVICE_TABLE(of, as3668_match_table);
+
+static struct i2c_driver as3668_driver = {
+	.driver = {
+		.name           = "leds_as3668",
+		.of_match_table = as3668_match_table,
+	},
+	.probe          = as3668_probe,
+	.remove         = as3668_remove,
+	.id_table       = as3668_idtable,
+};
+
+module_i2c_driver(as3668_driver);
+
+MODULE_AUTHOR("Lukas Timmermann <linux@timmermann.space>");
+MODULE_DESCRIPTION("AS3668 LED driver");
+MODULE_LICENSE("GPL");
-- 
2.49.0


