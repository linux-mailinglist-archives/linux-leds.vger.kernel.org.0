Return-Path: <linux-leds+bounces-5785-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 88FFBBDA694
	for <lists+linux-leds@lfdr.de>; Tue, 14 Oct 2025 17:34:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5AA903B5A32
	for <lists+linux-leds@lfdr.de>; Tue, 14 Oct 2025 15:30:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07D3F301701;
	Tue, 14 Oct 2025 15:27:13 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3E1D30146F;
	Tue, 14 Oct 2025 15:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760455632; cv=none; b=FLXhrPaoyBz3HaMarArDvwqDq06NvtkSJ1rB2rXvTBG7h6zWOiMjF5RikDqOK87/CuMpEvckZh0iIGO00AenHq5KiLRqkhWOzDsYYdnDtAemqsqQp5XEz3nCsQnB6Xje33PPQhptNxEZeOv//hhj8fBNur49/Ogh55vCWAV8Ie4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760455632; c=relaxed/simple;
	bh=3qNL2hB0wu+utYS/fWpj8Op4DXmCLvFIzhP/jVTABcU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BJXWLGtuKzRLGzgmU8Idw9UBzwstR+4Er2xSyjjGC07g2MmkfqidwyZNrvXEGAJpuUZMCCCslWnkahu4jdsA+qAKO4NrdUt1Y1YX0ZTNolHFI3kQXgSp+Oo4IKp8irKYd7W1H6fL9IxlOcZjvSruI7311TO6xbL2L/Ef654FoQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=timmermann.space; spf=pass smtp.mailfrom=timmermann.space; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=timmermann.space
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=timmermann.space
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4cmJ3n1zJdz9tX6;
	Tue, 14 Oct 2025 17:27:01 +0200 (CEST)
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of linux@timmermann.space designates 2001:67c:2050:b231:465::2 as permitted sender) smtp.mailfrom=linux@timmermann.space
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
Subject: [PATCH v9 2/2] leds: as3668: Driver for the ams Osram 4-channel i2c LED driver
Date: Tue, 14 Oct 2025 17:26:04 +0200
Message-ID: <20251014152604.852487-3-linux@timmermann.space>
In-Reply-To: <20251014152604.852487-1-linux@timmermann.space>
References: <20251014152604.852487-1-linux@timmermann.space>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4cmJ3n1zJdz9tX6

Since there were no existing drivers for the AS3668 or related devices,
a new driver was introduced in a separate file. Similar devices were
reviewed, but none shared enough characteristics to justify code reuse.
As a result, this driver is written specifically for the AS3668.

Signed-off-by: Lukas Timmermann <linux@timmermann.space>
---
 MAINTAINERS                |   1 +
 drivers/leds/Kconfig       |  13 +++
 drivers/leds/Makefile      |   1 +
 drivers/leds/leds-as3668.c | 188 +++++++++++++++++++++++++++++++++++++
 4 files changed, 203 insertions(+)
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
index 000000000000..2b7b776fe2f5
--- /dev/null
+++ b/drivers/leds/leds-as3668.c
@@ -0,0 +1,188 @@
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
+#define AS3668_EXPECTED_I2C_ADDR	0x42
+
+/* Chip Ident */
+
+#define AS3668_CHIP_ID1_REG		0x3e
+#define AS3668_CHIP_ID			0xa5
+
+/* Current Control */
+
+#define AS3668_CURRX_CONTROL_REG	0x01
+#define AS3668_CURR1_REG		0x02
+#define AS3668_CURR2_REG		0x03
+#define AS3668_CURR3_REG		0x04
+#define AS3668_CURR4_REG		0x05
+#define AS3668_CURRX_MODE_ON		0x1
+#define AS3668_CURRX_CURR1_MASK		GENMASK(1, 0)
+#define AS3668_CURRX_CURR2_MASK		GENMASK(3, 2)
+#define AS3668_CURRX_CURR3_MASK		GENMASK(5, 4)
+#define AS3668_CURRX_CURR4_MASK		GENMASK(7, 6)
+
+struct as3668_led {
+	struct led_classdev cdev;
+	struct as3668 *chip;
+	struct fwnode_handle *fwnode;
+	int led_id;
+};
+
+struct as3668 {
+	struct i2c_client *client;
+	struct as3668_led leds[AS3668_MAX_LEDS];
+};
+
+static enum led_brightness as3668_brightness_get(struct led_classdev *cdev)
+{
+	struct as3668_led *led = container_of(cdev, struct as3668_led, cdev);
+
+	return i2c_smbus_read_byte_data(led->chip->client, AS3668_CURR1_REG + led->led_id);
+}
+
+static void as3668_brightness_set(struct led_classdev *cdev, enum led_brightness brightness)
+{
+	struct as3668_led *led = container_of(cdev, struct as3668_led, cdev);
+
+	int err = i2c_smbus_write_byte_data(led->chip->client,
+					    AS3668_CURR1_REG + led->led_id,
+					    brightness);
+
+	if (err)
+		dev_err(&led->chip->client->dev, "error writing to reg 0x%02x, returned %d\n",
+			AS3668_CURR1_REG + led->led_id, err);
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
+			return dev_err_probe(dev, err, "'reg' property missing from %s\n",
+					     child->name);
+
+		if (reg < 0 || reg > AS3668_MAX_LEDS)
+			return dev_err_probe(dev, -EOPNOTSUPP,
+					     "'reg' property in %s is out of scope: %d\n",
+					     child->name, reg);
+
+		led = &as3668->leds[reg];
+		led->fwnode = of_fwnode_handle(child);
+
+		led->led_id = reg;
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
+	if (client->addr != AS3668_EXPECTED_I2C_ADDR)
+		return dev_err_probe(&client->dev, -EFAULT,
+				     "expected i2c address 0x%02x, got 0x%02x\n",
+				     AS3668_EXPECTED_I2C_ADDR, client->addr);
+
+	/* Read identifier from chip */
+	chip_id = i2c_smbus_read_byte_data(client, AS3668_CHIP_ID1_REG);
+
+	if (chip_id != AS3668_CHIP_ID)
+		return dev_err_probe(&client->dev, -ENODEV,
+				     "expected chip id 0x%02x, got 0x%02x\n",
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
+	/* Set all four channel modes to 'on' */
+	err = i2c_smbus_write_byte_data(client, AS3668_CURRX_CONTROL_REG,
+					FIELD_PREP(AS3668_CURRX_CURR1_MASK, AS3668_CURRX_MODE_ON) |
+					FIELD_PREP(AS3668_CURRX_CURR2_MASK, AS3668_CURRX_MODE_ON) |
+					FIELD_PREP(AS3668_CURRX_CURR3_MASK, AS3668_CURRX_MODE_ON) |
+					FIELD_PREP(AS3668_CURRX_CURR4_MASK, AS3668_CURRX_MODE_ON));
+
+	/* Set initial currents to 0mA */
+	err |= i2c_smbus_write_byte_data(client, AS3668_CURR1_REG, 0);
+	err |= i2c_smbus_write_byte_data(client, AS3668_CURR2_REG, 0);
+	err |= i2c_smbus_write_byte_data(client, AS3668_CURR3_REG, 0);
+	err |= i2c_smbus_write_byte_data(client, AS3668_CURR4_REG, 0);
+
+	if (err)
+		return dev_err_probe(&client->dev, -EIO, "failed to write to the device\n");
+
+	return 0;
+}
+
+static void as3668_remove(struct i2c_client *client)
+{
+	int err;
+	err = i2c_smbus_write_byte_data(client, AS3668_CURRX_CONTROL_REG, 0);
+	if (err)
+		dev_err(&client->dev, "couldn't remove the device\n");
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
2.51.0


