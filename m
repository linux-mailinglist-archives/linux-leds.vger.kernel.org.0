Return-Path: <linux-leds+bounces-4367-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D4EDA71A75
	for <lists+linux-leds@lfdr.de>; Wed, 26 Mar 2025 16:35:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BFC1916473B
	for <lists+linux-leds@lfdr.de>; Wed, 26 Mar 2025 15:35:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 845AA1F4178;
	Wed, 26 Mar 2025 15:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr header.b="JR9uKVEX"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 942EE1624D2
	for <linux-leds@vger.kernel.org>; Wed, 26 Mar 2025 15:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743003344; cv=none; b=l1OyUZgIpRhJIeSbWT/6lmW8BgTkREakFMk7DHWHgWzwxs6uA1QkwHWsVMCjNmY1TK7iwHfEs71HN70voOwkXd9h1beKO9GMkLAZ9/2133OWJupPFLMdf90Gnthhe58eJrEwSP81cqDFiYZ/g+X87rQSMqD56VT8qSoZ+eCn7YQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743003344; c=relaxed/simple;
	bh=jJ/2R3ltui6w1dmVHZ7fwXENb5/R7XMqufWtiYakBSE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eiVjNyuOAAdC71HlVGafwXRWbfNgj6WaR7cnq5KxQFBYRZEko5VMPQCTokmfrTrusxPAeNZLaCMLYuDmIU514ZR0R8Be5kXMF/HPggWe1RBIRydMRus3ngzojxU+hii/QUK/5LOH6CPcGviIQ1qZR4NRkpVylzIfTqyfICbPgVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=smile.fr; spf=pass smtp.mailfrom=smile.fr; dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr header.b=JR9uKVEX; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=smile.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smile.fr
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3996af42857so742514f8f.0
        for <linux-leds@vger.kernel.org>; Wed, 26 Mar 2025 08:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1743003340; x=1743608140; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ADMLF79/vx5jNyFYG7amyuGOGTGpcPIUlf/pqxayCOI=;
        b=JR9uKVEX2w/ZIW5GJ9asNK7gNUpS6FYmKdNffpJXaq+dLTRpbntNYwtU1Toz75ohXc
         lfqa+WmmJ5Uf8PYmzLMN3Pbofx7WLasHzj0Yx5RCuILIuSqRkLIZs1gUP3jLnrEkAjct
         zWG/ytl+Ix0F/R3QdCuUP4JWsXt4ZBg5BiGwQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743003340; x=1743608140;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ADMLF79/vx5jNyFYG7amyuGOGTGpcPIUlf/pqxayCOI=;
        b=YngujtYDe9hnCf72vdOkAnHgpMjd6C+LhMVFuy8qiqz0lPe8eb0bF14wNJAWS7LH5d
         jec2hxfVJWrO0EPFcbuWfoOXbH+lss3CdJUc5KVXQFRjtF+w2RRgxVJR57fWdg/TF4Bh
         D2WH8ohEirf1L3H5xc+r4rV7lxd6mk8bL95rQWnlxQOCuPWH9AeglT8e2u95Dyml0+BU
         FRdo++rlntEivzlThqTVvkmGRnE+X+I40jVGx4HsEmMuQ//kVSQFU+gCJu1D0gdSUcTj
         pujm0ICdezlUYLzfO2BHgCQoV1RD+epmBuYZfrWI3GtrfNEXNJ48P0E8p+Hk+TPe0j+h
         NScw==
X-Forwarded-Encrypted: i=1; AJvYcCVRaJODDlDzOv6ZHa2FZQ5lYA64TUzQXgWGQOKyiYS9ox+JyYIVYYjyj+Wms4v0GdSqCp1nWSvU799q@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7zWV0me5pA/MQCxCkLbJbp72kEnV+M8Yz1gNjtlKo5uax8sq8
	Kb5JQk2eC/QzapkH3y876VZ6LV9j5LIsWwEwfv9q7iTyrqxQfJJfGUmZPGgRXFc=
X-Gm-Gg: ASbGncuQuwAdO2xre9ksTgcsY+EF504kwddHTA3K/p5bzGfgHB7iOCBMba8uKwSDVRo
	kGrlloK7uMZUoewdN+z9y07yiZXm0W6uW15hbVcWpGbn/ykh5ULBIexbv7Ecv1m6soCPvRVG0bL
	jlbk8aHdrHOQEdbuejSQntvd5h/W+znnBpWwqPrOJTdFReH39mHvCoPtxg8pc6ZCRnRizqX35AZ
	dzlDx+7o4JVkiQmtbzQ5tGUx1vowFzE6VW0ktZjPZsDnGb3sgF1yZmaqzZU9D8Bccl3Le0h1WgX
	M1eGq/m8fef5tyvQch5dTvq0XlebMQ7e5aN6YPqM4+7m6EQbiPq21NStq6OIpdR1M9q7dEOwrw=
	=
X-Google-Smtp-Source: AGHT+IEPxk1dGiXAuVyC+ufZqlzFLjHQ6SatSuyBz9yy5jGowVXvYNlAOr2I/pdLQg3aJHAq9HL3Tw==
X-Received: by 2002:a5d:6daf:0:b0:39a:ca59:a613 with SMTP id ffacd0b85a97d-39ad1523326mr192803f8f.26.1743003339684;
        Wed, 26 Mar 2025 08:35:39 -0700 (PDT)
Received: from heaven.lanfs.local ([62.161.254.42])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9eff6esm17141771f8f.100.2025.03.26.08.35.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Mar 2025 08:35:39 -0700 (PDT)
From: Corentin Guillevic <corentin.guillevic@smile.fr>
To: Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>
Cc: Corentin Guillevic <corentin.guillevic@smile.fr>,
	linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org
Subject: [PATCH 1/2] leds: tlc5928: Driver for the TI 16 Channel spi LED driver
Date: Wed, 26 Mar 2025 16:35:32 +0100
Message-ID: <20250326153535.158137-1-corentin.guillevic@smile.fr>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The TLC59928 is an SPI-connected bus controlled 16-channel LED driver.
A single 16-bit register handles the whole LEDs. Following a write, a
latch GPIO applies the new LED configuration. An "enable" GPIO (blank
in the TLC59928 datasheet) turns off the whole LEDs when active/high.

This driver is able to handle a daisy-chain case, so when several
TLC59928 controllers are connected in serie.

Signed-off-by: Corentin Guillevic <corentin.guillevic@smile.fr>
---
 drivers/leds/Kconfig        |   9 ++
 drivers/leds/Makefile       |   1 +
 drivers/leds/leds-tlc5928.c | 248 ++++++++++++++++++++++++++++++++++++
 3 files changed, 258 insertions(+)
 create mode 100644 drivers/leds/leds-tlc5928.c

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index b784bb74a837..f429214dd9c2 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -747,6 +747,15 @@ config LEDS_TLC591XX
 	  This option enables support for Texas Instruments TLC59108
 	  and TLC59116 LED controllers.
 
+config LEDS_TLC5928
+	tristate "LED driver for TLC5928 controller"
+	depends on LEDS_CLASS && SPI
+	depends on GPIOLIB
+	select REGMAP_SPI
+	help
+	  This option enables support for Texas Instruments TLC5928
+	  LED controller.
+
 config LEDS_MAX77650
 	tristate "LED support for Maxim MAX77650 PMIC"
 	depends on LEDS_CLASS && MFD_MAX77650
diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
index 18afbb5a23ee..085d4917232a 100644
--- a/drivers/leds/Makefile
+++ b/drivers/leds/Makefile
@@ -87,6 +87,7 @@ obj-$(CONFIG_LEDS_SYSCON)		+= leds-syscon.o
 obj-$(CONFIG_LEDS_TCA6507)		+= leds-tca6507.o
 obj-$(CONFIG_LEDS_TI_LMU_COMMON)	+= leds-ti-lmu-common.o
 obj-$(CONFIG_LEDS_TLC591XX)		+= leds-tlc591xx.o
+obj-$(CONFIG_LEDS_TLC5928)		+= leds-tlc5928.o
 obj-$(CONFIG_LEDS_TPS6105X)		+= leds-tps6105x.o
 obj-$(CONFIG_LEDS_TURRIS_OMNIA)		+= leds-turris-omnia.o
 obj-$(CONFIG_LEDS_WM831X_STATUS)	+= leds-wm831x-status.o
diff --git a/drivers/leds/leds-tlc5928.c b/drivers/leds/leds-tlc5928.c
new file mode 100644
index 000000000000..5d6663d5d3f3
--- /dev/null
+++ b/drivers/leds/leds-tlc5928.c
@@ -0,0 +1,248 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright 2025 Corentin Guillevic <corentin.guillevic@smile.fr>
+ */
+
+#include <linux/gpio/consumer.h>
+#include <linux/delay.h>
+#include <linux/leds.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/slab.h>
+#include <linux/spi/spi.h>
+
+#define TLC5928_MAX_LEDS	16
+
+#define ldev_to_led(c)		container_of(c, struct tlc5928_led, ldev)
+
+struct tlc5928_led {
+	bool active;
+	unsigned int led_no;
+	struct led_classdev ldev;
+	struct tlc5928_chip *chip;
+};
+
+struct tlc5928_chip {
+	struct gpio_desc *enable_gpio;
+	struct tlc5928_led leds[TLC5928_MAX_LEDS];
+	struct list_head list;
+	struct tlc5928_priv *priv;
+	u16 leds_state;
+};
+
+struct tlc5928_priv {
+	struct spi_device *spi;
+	struct gpio_desc *latch_gpio;
+	struct list_head chips_list;
+	struct mutex lock;
+};
+
+static int
+tlc5928_set_ledout(struct tlc5928_led *led, bool val)
+{
+	struct tlc5928_chip *chip;
+	struct tlc5928_chip *chip_owner = led->chip;
+	struct tlc5928_priv *priv = chip_owner->priv;
+	int ret;
+
+	mutex_lock(&priv->lock);
+
+	if (val)
+		chip_owner->leds_state |= (1 << led->led_no);
+	else
+		chip_owner->leds_state &= ~(1 << led->led_no);
+
+	list_for_each_entry_reverse(chip, &priv->chips_list, list) {
+		u16 leds_state = cpu_to_be16(chip->leds_state);
+
+		ret = spi_write(priv->spi, &(leds_state), sizeof(leds_state));
+
+		if (ret)
+			return ret;
+	}
+
+	gpiod_set_value(priv->latch_gpio, 0);
+	udelay(1);
+	gpiod_set_value(priv->latch_gpio, 1);
+
+	mutex_unlock(&priv->lock);
+
+	return 0;
+}
+
+static int
+tlc5928_brightness_set(struct led_classdev *led_cdev,
+			enum led_brightness brightness)
+{
+	struct tlc5928_led *led = ldev_to_led(led_cdev);
+
+	/* TLC5928 only allows on/off, no brightness */
+	return tlc5928_set_ledout(led, !!brightness);
+}
+
+static const struct of_device_id of_tlc5928_leds_match[] __maybe_unused = {
+	{ .compatible = "ti,tlc5928" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, of_tlc5928_leds_match);
+
+static int tlc5928_probe_chip_dt(struct device *dev, struct device_node *node,
+		struct tlc5928_chip *chip)
+{
+	struct device_node *child;
+	int count, err, reg;
+
+	count = of_get_available_child_count(node);
+	if (!count)
+		return -EINVAL;
+
+	chip->leds_state = 0;
+
+	for_each_available_child_of_node(node, child) {
+		struct tlc5928_led *led;
+		struct led_init_data init_data = {};
+
+		init_data.fwnode = of_fwnode_handle(child);
+
+		err = of_property_read_u32(child, "reg", &reg);
+		if (err) {
+			dev_err(dev, "%pOF: failed to read reg\n", child);
+			of_node_put(child);
+			return err;
+		}
+
+		if (reg < 0 || reg >= TLC5928_MAX_LEDS ||
+				chip->leds[reg].active) {
+			of_node_put(child);
+			return -EINVAL;
+		}
+
+		led = &chip->leds[reg];
+
+		led->active = true;
+		led->chip = chip;
+		led->led_no = reg;
+		led->ldev.brightness_set_blocking = tlc5928_brightness_set;
+		err = devm_led_classdev_register_ext(dev, &led->ldev,
+							 &init_data);
+		if (err < 0) {
+			of_node_put(child);
+			dev_err(dev, "Failed to register LED for node %pfw\n",
+				init_data.fwnode);
+			return err;
+		}
+	}
+
+	return 0;
+}
+
+static int tlc5928_probe(struct spi_device *spi)
+{
+	struct device_node *node, *child;
+	struct device *dev = &spi->dev;
+	struct list_head *pos;
+	struct tlc5928_chip *chip;
+	struct tlc5928_priv *priv;
+	int count, err, i;
+
+	node = dev_of_node(dev);
+	if (!node)
+		return -ENODEV;
+
+	count = of_get_available_child_count(node);
+	if (!count)
+		return -EINVAL;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->spi = spi;
+	priv->latch_gpio = devm_gpiod_get(dev, "latch", GPIOD_OUT_HIGH);
+	if (IS_ERR(priv->latch_gpio))
+		return dev_err_probe(dev, PTR_ERR(priv->latch_gpio),
+				     "Failed to get latch GPIO\n");
+
+	mutex_init(&priv->lock);
+	INIT_LIST_HEAD(&priv->chips_list);
+
+	i = 0;
+	for_each_available_child_of_node(node, child) {
+		chip = devm_kzalloc(dev, sizeof(*chip), GFP_KERNEL);
+		if (!chip)
+			return -ENOMEM;
+
+		list_add_tail(&chip->list, &priv->chips_list);
+		chip->priv = priv;
+		chip->enable_gpio = devm_gpiod_get_index_optional(dev, "enable", i,
+				GPIOD_OUT_HIGH);
+		if (IS_ERR(chip->enable_gpio)) {
+			dev_err(dev, "Error getting enable GPIO %i property: %ld\n", i,
+					PTR_ERR(chip->enable_gpio));
+			return PTR_ERR(chip->enable_gpio);
+		}
+
+		err = tlc5928_probe_chip_dt(dev, child, chip);
+		if (err)
+			return err;
+
+		i++;
+	}
+
+	list_for_each(pos, &priv->chips_list) {
+		chip = container_of(pos, struct tlc5928_chip, list);
+		if (chip->enable_gpio)
+			gpiod_set_value(chip->enable_gpio, 0);
+	}
+
+	spi_set_drvdata(spi, priv);
+
+	return 0;
+}
+
+static int tlc5928_remove(struct spi_device *spi)
+{
+	struct list_head *pos;
+	struct tlc5928_priv *priv = spi_get_drvdata(spi);
+	int i;
+
+	list_for_each(pos, &priv->chips_list) {
+		struct tlc5928_chip *chip = container_of(pos, struct tlc5928_chip,
+				list);
+
+		for (i = 0; i < TLC5928_MAX_LEDS; i++) {
+			if (chip->leds[i].active)
+				devm_led_classdev_unregister(&spi->dev,
+					     &chip->leds[i].ldev);
+		}
+
+		if (chip->enable_gpio) {
+			gpiod_set_value(chip->enable_gpio, 1);
+			gpiod_put(chip->enable_gpio);
+		}
+	}
+
+	return 0;
+}
+
+static const struct spi_device_id tlc5928_id[] = {
+	{ "tlc5928" },
+	{},
+};
+MODULE_DEVICE_TABLE(spi, tlc5928_id);
+
+static struct spi_driver tlc5928_driver = {
+	.driver = {
+		.name = "tlc5928",
+		.of_match_table = of_match_ptr(of_tlc5928_leds_match),
+	},
+	.probe = tlc5928_probe,
+	.remove = tlc5928_remove,
+	.id_table = tlc5928_id,
+};
+
+module_spi_driver(tlc5928_driver);
+
+MODULE_AUTHOR("Corentin Guillevic <corentin.guillevic@smile.fr>");
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("TLC5928 LED driver");
-- 
2.45.2


