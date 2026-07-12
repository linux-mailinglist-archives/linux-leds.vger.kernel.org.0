Return-Path: <linux-leds+bounces-9052-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id jVVqMALiU2pwfwMAu9opvQ
	(envelope-from <linux-leds+bounces-9052-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sun, 12 Jul 2026 20:50:42 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C650D745A9C
	for <lists+linux-leds@lfdr.de>; Sun, 12 Jul 2026 20:50:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=alistairbell.org header.s=mail header.b=Xjbqt+E+;
	dmarc=pass (policy=reject) header.from=alistairbell.org;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-9052-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-leds+bounces-9052-lists+linux-leds=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D985C30151D8
	for <lists+linux-leds@lfdr.de>; Sun, 12 Jul 2026 18:50:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D09B3B38AB;
	Sun, 12 Jul 2026 18:50:16 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from alistairbell.org (alistairbell.org [88.208.227.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42FB53B14C1
	for <linux-leds@vger.kernel.org>; Sun, 12 Jul 2026 18:50:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783882216; cv=none; b=HfRA7eUb/ekxcdB8hZKYci3aYtdGFQApWqOtMqXbApeeFVveqCcjzTAUL/JKg/T5AU9vxCL3dLoA1f1gHlKQ54pYloxiv+v3HLso5F7yDjRL8CKo8pTHoyAQ+8bvxu3i2lAIqqGftCwj3Cpw/Zzi7TFz6C7mw9vMV4CUs/LdVvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783882216; c=relaxed/simple;
	bh=9H8znkMKgpX2MqE6BdSFR+lekHDODhwFeg4h8dsFlUY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sTy5rIzJx5RrH5aW3cbgVtC+szag28MHHrCC2jVkk18b468/8WvKbZXwMvwSaZeSiuu3JIOlOXexTEvljLsSFSLGQa2DKf0SfvQOLjma/c925JxoR5Q2COMbzmd7xWXiKXlQNqkakzFdLQZ72L2/G+ug3TF5IaY2SAqlSsQ3h34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=alistairbell.org; spf=pass smtp.mailfrom=alistairbell.org; dkim=pass (2048-bit key) header.d=alistairbell.org header.i=@alistairbell.org header.b=Xjbqt+E+; arc=none smtp.client-ip=88.208.227.103
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alistairbell.org;
	s=mail; t=1783881844;
	bh=9H8znkMKgpX2MqE6BdSFR+lekHDODhwFeg4h8dsFlUY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Xjbqt+E+HDCAvpSmuWatiA2GYaOO1Bidcq3THUh/ItD5Kv8jypcQIt/l7p0Lvy3sy
	 rcTX4BNTc7XSWWPeJJSdRewfD5H3RSf3asOvmoCPaJvOs+QQFaSzirIOI6Fjw+DyJP
	 GjArujRNmSvHyvS/xrDq07yvkz87lPG+A34Mt/kb5R4OARKjwNPk2qtIAdd9w0Ju5L
	 o/i+AzJYwoChM7ajLIek9U6TTmiNCRkg4u+9Gbq4QCobOjv2Tl2eHHo4N4ftQA51U2
	 wtq5ymOUI2w+u0TpcxetFlCctWTic3UcuQU3YBGtJqHUr+yk/rsCQXw+zv76bzVYgI
	 z0/V4ea+A1F+g==
Received: from localhost (host-78-150-86-125.as13285.net [78.150.86.125])
	by alistairbell.org (Postfix) with ESMTPSA id 6EBE14EC4;
	Sun, 12 Jul 2026 18:44:04 +0000 (UTC)
From: Alistair Bell <dev@alistairbell.org>
To: linux-leds@vger.kernel.org
Cc: lee@kernel.org,
	pavel@kernel.org,
	Alistair Bell <dev@alistairbell.org>
Subject: [PATCH 1/2] leds: Texas Instruments LP5816 driver
Date: Sun, 12 Jul 2026 19:43:17 +0100
Message-ID: <20260712184318.78852-2-dev@alistairbell.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260712184318.78852-1-dev@alistairbell.org>
References: <20260712184318.78852-1-dev@alistairbell.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[alistairbell.org,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[alistairbell.org:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-9052-lists,linux-leds=lfdr.de];
	FORGED_SENDER(0.00)[dev@alistairbell.org,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:linux-leds@vger.kernel.org,m:lee@kernel.org,m:pavel@kernel.org,m:dev@alistairbell.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dev@alistairbell.org,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[alistairbell.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C650D745A9C

Add support for Texas Instruments LP5816 4-channel I2C device,
the driver provides:

- Independent 4-channel control via the multicolor sysfs class
- Configurable fade effects, duration, fade profile and maximum
  operating current via sysfs

Signed-off-by: Alistair Bell <dev@alistairbell.org>
---
 MAINTAINERS                |   8 +
 drivers/leds/Kconfig       |  12 +
 drivers/leds/Makefile      |   1 +
 drivers/leds/leds-lp5816.c | 443 +++++++++++++++++++++++++++++++++++++
 4 files changed, 464 insertions(+)
 create mode 100644 drivers/leds/leds-lp5816.c

diff --git a/MAINTAINERS b/MAINTAINERS
index f37a81950..b6a8c812a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -26761,6 +26761,14 @@ F:	drivers/leds/rgb/Makefile
 F:	drivers/leds/rgb/leds-lp5812.c
 F:	drivers/leds/rgb/leds-lp5812.h
 
+TEXAS INSTRUMENTS' LP5816 RGBW LED DRIVER
+M:	Alistair Bell <dev@alistairbell.org>
+L:	linux-leds@vger.kernel.org
+S:	Maintained
+F:	drivers/leds/Kconfig
+F:	drivers/leds/Makefile
+F:	drivers/leds/leds-lp5816.c
+
 TEXAS INSTRUMENTS' LB8864 LED BACKLIGHT DRIVER
 M:	Alexander Sverdlin <alexander.sverdlin@siemens.com>
 L:	linux-leds@vger.kernel.org
diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index f4a0a3c8c..ce3776adf 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -541,6 +541,18 @@ config LEDS_LP8864
 	  To compile this driver as a module, choose M here: the
 	  module will be called leds-lp8864.
 
+config LEDS_LP5816
+    tristate "LED driver for LP5816 chip"
+    depends on I2C
+    depends on LEDS_CLASS && LEDS_CLASS_MULTICOLOR
+	select REGMAP_I2C
+    help
+      Say Y to enable support for the Texas Instruments LP5816
+      RGBW LED connected via I2C.
+
+      To compile this driver as a module, choose M here:
+      the module will be called lp5816.
+
 config LEDS_CLEVO_MAIL
 	tristate "Mail LED on Clevo notebook"
 	depends on LEDS_CLASS && BROKEN
diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
index 7db376891..5ba7de099 100644
--- a/drivers/leds/Makefile
+++ b/drivers/leds/Makefile
@@ -56,6 +56,7 @@ obj-$(CONFIG_LEDS_LP5523)		+= leds-lp5523.o
 obj-$(CONFIG_LEDS_LP5562)		+= leds-lp5562.o
 obj-$(CONFIG_LEDS_LP5569)		+= leds-lp5569.o
 obj-$(CONFIG_LEDS_LP55XX_COMMON)	+= leds-lp55xx-common.o
+obj-$(CONFIG_LEDS_LP5816)   	+= leds-lp5816.o
 obj-$(CONFIG_LEDS_LP8501)		+= leds-lp8501.o
 obj-$(CONFIG_LEDS_LP8788)		+= leds-lp8788.o
 obj-$(CONFIG_LEDS_LP8860)		+= leds-lp8860.o
diff --git a/drivers/leds/leds-lp5816.c b/drivers/leds/leds-lp5816.c
new file mode 100644
index 000000000..584c348a7
--- /dev/null
+++ b/drivers/leds/leds-lp5816.c
@@ -0,0 +1,443 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Texas Instruments LP5816 4-Channel I2C Interface RGBW LED Driver
+ * Copyright (C) 2026 Alistair Bell <dev@alistairbell.org>
+ */
+
+#include <linux/delay.h>
+#include <linux/i2c.h>
+#include <linux/leds.h>
+#include <linux/led-class-multicolor.h>
+#include <linux/minmax.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/regmap.h>
+#include <linux/string.h>
+
+#define REG_CHIP_EN 0x0
+#define CHIP_EN_ENABLE 0x1
+
+#define REG_DEV_CONFIG0 0x1
+#define DEV_CONFIG0_25_5_MA 0x0
+#define DEV_CONFIG0_51_MA 0x1
+
+#define REG_DEV_CONFIG1 0x2
+#define REG_DEV_CONFIG2 0x3
+#define REG_DEV_CONFIG3 0x4
+
+#define REG_RESET_CMD 0xe
+#define RESET_CMD 0xcc
+
+#define REG_UPDATE_CMD 0xf
+#define UPDATE_CMD 0x55
+
+#define REG_OUT0_DC 0x14
+#define REG_OUT1_DC 0x15
+#define REG_OUT2_DC 0x16
+#define REG_OUT3_DC 0x17
+#define REG_OUT0_MANUAL_PWM 0x18
+
+struct lp5816 {
+	struct led_classdev_mc mcdev;
+	struct regmap *regmap;
+	/* For register read/writes. */
+	struct mutex mtx;
+	struct device *dev;
+	struct mc_subled subleds[4];
+};
+
+static const struct regmap_config lp5816_regmap_config = {
+	.max_register = 0x40,
+	.reg_bits = 8,
+	.val_bits = 8,
+};
+
+static ssize_t max_current_show(struct device *dev,
+				struct device_attribute *attr,
+								char *buf);
+static ssize_t max_current_store(struct device *dev,
+				 struct device_attribute *attr,
+								const char *buf, size_t count);
+static DEVICE_ATTR_RW(max_current);
+
+static ssize_t fade_show(struct device *dev, struct device_attribute *attr,
+			 char *buf);
+static ssize_t fade_store(struct device *dev, struct device_attribute *attr,
+			  const char *buf, size_t count);
+static DEVICE_ATTR_RW(fade);
+
+static ssize_t fade_mode_show(struct device *dev, struct device_attribute *attr,
+			      char *buf);
+static ssize_t fade_mode_store(struct device *dev,
+			       struct device_attribute *attr, const char *buf,
+							size_t count);
+static DEVICE_ATTR_RW(fade_mode);
+
+static struct attribute *lp5816_attrs[] = {
+	&dev_attr_max_current.attr,
+	&dev_attr_fade.attr,
+	&dev_attr_fade_mode.attr,
+	NULL,
+};
+
+static struct attribute_group lp5816_group = {
+	.attrs = lp5816_attrs,
+};
+
+static int lp5816_multi_lock_write(struct lp5816 *chip, const struct reg_sequence seq[], int count)
+{
+	int res;
+
+	mutex_lock(&chip->mtx);
+	res = regmap_multi_reg_write(chip->regmap, seq, count);
+	mutex_unlock(&chip->mtx);
+	return res;
+}
+
+static int lp5816_split_string(const char *in, int out[], const int lim)
+{
+	char *tk, *step, *local;
+	int n, res;
+
+	local = kstrdup(in, GFP_KERNEL);
+	if (!local)
+		return -ENOMEM;
+	step = strim(local);
+
+	n = 0;
+	while ((tk = strsep(&step, " ")) != NULL && n < lim) {
+		if (*tk == '\0')
+			continue;
+
+		res = kstrtoint(tk, 0, &out[n]);
+		if (res < 0) {
+			kfree(local);
+			return res;
+		}
+		n++;
+	}
+
+	kfree(local);
+	return n;
+}
+
+static int lp5816_startup(struct lp5816 *chip)
+{
+	int res;
+	const struct reg_sequence sequence[] = {
+		/* Ensure that all registers are the default values. */
+		{ .reg = REG_RESET_CMD, .def = RESET_CMD },
+		/* Moves from standby to normal operating mode. */
+		{ .reg = REG_CHIP_EN, .def = CHIP_EN_ENABLE },
+		/* Sets maximum operating max_current to 51mA. */
+		{ .reg = REG_DEV_CONFIG0, .def = DEV_CONFIG0_51_MA },
+		/* Enables all four outputs. */
+		{ .reg = REG_DEV_CONFIG1, .def = 0xf },
+		/* Sets the red current to 100% of Imax (controlled by CONFIG0). */
+		{ .reg = REG_OUT0_DC, .def = 0xff },
+		/* Sets the green, .def = blue and white to 80% of Imax. */
+		{ .reg = REG_OUT1_DC, .def = 0xcc },
+		{ .reg = REG_OUT2_DC, .def = 0xcc },
+		{ .reg = REG_OUT3_DC, .def = 0xcc },
+		/* Posts the update cmd. */
+		{ .reg = REG_UPDATE_CMD, .def = UPDATE_CMD }
+	};
+
+	res = regmap_multi_reg_write(chip->regmap, sequence, ARRAY_SIZE(sequence));
+	if (res < 0)
+		return dev_err_probe(chip->dev, res, "failed to write startup sequence values\n");
+	return 0;
+}
+
+static ssize_t max_current_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	struct led_classdev *cdev;
+	struct lp5816 *chip;
+	unsigned int val;
+	int res;
+
+	cdev = dev_get_drvdata(dev);
+	chip = container_of(cdev, struct lp5816, mcdev.led_cdev);
+
+	mutex_lock(&chip->mtx);
+	res = regmap_read(chip->regmap, REG_DEV_CONFIG0, &val);
+	mutex_unlock(&chip->mtx);
+
+	if (res < 0)
+		return res;
+	if (val > 1)
+		return -EPROTO;
+
+	return sysfs_emit(buf, "%d\n", val);
+}
+
+static ssize_t max_current_store(struct device *dev,
+				 struct device_attribute *attr,
+								const char *buf, size_t count)
+{
+	struct led_classdev *cdev;
+	struct lp5816 *chip;
+	int res, val;
+
+	cdev = dev_get_drvdata(dev);
+	chip = container_of(cdev, struct lp5816, mcdev.led_cdev);
+
+	res = kstrtoint(buf, 0, &val);
+	if (res < 0)
+		return res;
+	if (val < 0 || val > 1)
+		return -EINVAL;
+
+	res = lp5816_multi_lock_write(chip, (const struct reg_sequence[]) {
+		{ .reg = REG_DEV_CONFIG0, .def = val },
+		{ .reg = REG_UPDATE_CMD, .def = UPDATE_CMD } }, 2);
+	return (res < 0) ? res : count;
+}
+
+static ssize_t fade_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	struct led_classdev *cdev;
+	struct lp5816 *chip;
+	unsigned int val;
+	int res;
+
+	cdev = dev_get_drvdata(dev);
+	chip = container_of(cdev, struct lp5816, mcdev.led_cdev);
+
+	mutex_lock(&chip->mtx);
+	res = regmap_read(chip->regmap, REG_DEV_CONFIG2, &val);
+	mutex_unlock(&chip->mtx);
+
+	if (res < 0)
+		return res;
+
+	return sysfs_emit(buf, "%d %d %d %d %d\n",
+			(val >> 0) & 0x1,
+			(val >> 1) & 0x1,
+			(val >> 2) & 0x1,
+			(val >> 3) & 0x1,
+			(val >> 4) & 0xf);
+}
+
+static ssize_t fade_store(struct device *dev, struct device_attribute *attr,
+			  const char *buf, size_t count)
+{
+	struct led_classdev *cdev;
+	struct lp5816 *chip;
+	int vals[5], i, val, res;
+
+	cdev = dev_get_drvdata(dev);
+	chip = container_of(cdev, struct lp5816, mcdev.led_cdev);
+
+	res = lp5816_split_string(buf, vals, ARRAY_SIZE(vals));
+	if (res != ARRAY_SIZE(vals))
+		return (res < 0) ? res : -EINVAL;
+
+	for (i = 0, val = 0; i < ARRAY_SIZE(vals); i++) {
+		if (i < 4) {
+			if (vals[i] < 0 || vals[i] > 1)
+				return -EINVAL;
+			val |= vals[i] << i;
+		} else {
+			if (vals[i] < 0 || vals[i] > 15)
+				return -EINVAL;
+			val |= (vals[i] & 0xf) << 4;
+		}
+	}
+
+	res = lp5816_multi_lock_write(chip, (const struct reg_sequence[]) {
+			{ .reg = REG_DEV_CONFIG2, .def = val },
+			{ .reg = REG_UPDATE_CMD, .def = UPDATE_CMD }}, 2);
+	return (res < 0) ? res : count;
+}
+
+static ssize_t fade_mode_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	struct led_classdev *cdev;
+	struct lp5816 *chip;
+	int res, val;
+
+	cdev = dev_get_drvdata(dev);
+	chip = container_of(cdev, struct lp5816, mcdev.led_cdev);
+
+	mutex_lock(&chip->mtx);
+	res = regmap_read(chip->regmap, REG_DEV_CONFIG3, &val);
+	mutex_unlock(&chip->mtx);
+
+	if (res < 0)
+		return res;
+
+	val >>= 4;
+	return sysfs_emit(buf, "%d %d %d %d\n",
+			val & 0x1,
+			(val >> 1) & 0x1,
+			(val >> 2) & 0x1,
+			(val >> 3) & 0x1);
+}
+
+static ssize_t fade_mode_store(struct device *dev,
+			       struct device_attribute *attr, const char *buf,
+							size_t count)
+{
+	struct led_classdev *cdev;
+	struct lp5816 *chip;
+	int vals[4], res, i;
+	u8 val;
+
+	cdev = dev_get_drvdata(dev);
+	chip = container_of(cdev, struct lp5816, mcdev.led_cdev);
+
+	res = lp5816_split_string(buf, vals, ARRAY_SIZE(vals));
+	if (res != ARRAY_SIZE(vals))
+		return (res < 0) ? res : -EINVAL;
+
+	/*
+	 * Requires 4 values of either 0 or 1,
+	 * which disable/enable exponential fade mode per LED.
+	 */
+	for (i = 0, val = 0; i < ARRAY_SIZE(vals); i++) {
+		if (vals[i] < 0 || vals[i] > 1)
+			return -EINVAL;
+		val |= (vals[i] << i);
+	}
+
+	res = lp5816_multi_lock_write(chip, (const struct reg_sequence[]) {
+		{ .reg = REG_DEV_CONFIG3, .def = val << 4 },
+		{ .reg = REG_UPDATE_CMD, .def = UPDATE_CMD }}, 2);
+	return (res < 0) ? res : count;
+}
+
+static enum led_brightness lp5816_brightness_get(struct led_classdev *cdev)
+{
+	struct mc_subled *leds;
+	struct lp5816 *chip;
+	int intensity;
+
+	chip = container_of(cdev, struct lp5816, mcdev.led_cdev);
+
+	mutex_lock(&chip->mtx);
+	leds = lcdev_to_mccdev(cdev)->subled_info;
+	intensity = MAX(leds[0].intensity, leds[1].intensity);
+	intensity = MAX(intensity, MAX(leds[2].intensity, leds[3].intensity));
+	mutex_unlock(&chip->mtx);
+	return intensity & 0xff;
+}
+
+static int lp5816_brightness_set(struct led_classdev *cdev, enum led_brightness br)
+{
+	struct lp5816 *chip;
+	struct led_classdev_mc *mc;
+	u8 vals[4];
+
+	mc = lcdev_to_mccdev(cdev);
+	chip = container_of(cdev, struct lp5816, mcdev.led_cdev);
+
+	vals[0] = mc->subled_info[0].intensity & 0xff;
+	vals[1] = mc->subled_info[1].intensity & 0xff;
+	vals[2] = mc->subled_info[2].intensity & 0xff;
+	vals[3] = mc->subled_info[3].intensity & 0xff;
+
+	chip = container_of(cdev, struct lp5816, mcdev.led_cdev);
+
+	mutex_lock(&chip->mtx);
+	regmap_bulk_write(chip->regmap, REG_OUT0_MANUAL_PWM, vals, ARRAY_SIZE(vals));
+	mutex_unlock(&chip->mtx);
+	return 0;
+}
+
+static int lp5816_probe(struct i2c_client *client)
+{
+	struct lp5816 *chip;
+	char *name;
+	int res;
+
+	chip = devm_kzalloc(&client->dev, sizeof(*chip), GFP_KERNEL);
+	if (!chip)
+		return dev_err_probe(&client->dev, -ENOMEM,
+			"failed to allocate lp5816 internal structure\n");
+
+	i2c_set_clientdata(client, chip);
+	mutex_init(&chip->mtx);
+
+	(*chip) = (struct lp5816) {
+		.dev = &client->dev,
+		.regmap = devm_regmap_init_i2c(client, &lp5816_regmap_config),
+		.subleds = {
+			{ .color_index = LED_COLOR_ID_RED, .intensity = 0 },
+			{ .color_index = LED_COLOR_ID_GREEN, .intensity = 0 },
+			{ .color_index = LED_COLOR_ID_BLUE, .intensity = 0 },
+			{ .color_index = LED_COLOR_ID_WHITE, .intensity = 0 },
+		},
+	};
+
+	if (IS_ERR(chip->regmap))
+		return dev_err_probe(&client->dev, PTR_ERR(chip->regmap),
+				"failed to allocate register map\n");
+
+	name = devm_kasprintf(&client->dev, GFP_KERNEL, "%s:rgbw", dev_name(&client->dev));
+	if (!name)
+		return dev_err_probe(&client->dev, -ENOMEM,
+				"failed to allocate led-classdev name\n");
+
+	chip->mcdev = (struct led_classdev_mc){
+		.led_cdev = (struct led_classdev){
+			.brightness_set_blocking = lp5816_brightness_set,
+			.brightness_get = lp5816_brightness_get,
+			.name = name,
+		},
+		.num_colors = ARRAY_SIZE(chip->subleds),
+		.subled_info = chip->subleds,
+	};
+
+	res = devm_led_classdev_multicolor_register(&client->dev, &chip->mcdev);
+	if (res < 0)
+		return dev_err_probe(&client->dev, res, "failed to register classdev multicolor\n");
+
+	res = devm_device_add_group(chip->mcdev.led_cdev.dev, &lp5816_group);
+	if (res < 0)
+		return dev_err_probe(&client->dev, res, "failed to add led device group\n");
+
+	res = lp5816_startup(chip);
+	if (res < 0)
+		return dev_err_probe(&client->dev, res,
+				"failed to execute chip startup procedure\n");
+	return 0;
+}
+
+static void lp5816_remove(struct i2c_client *client)
+{
+	struct lp5816 *chip;
+
+	chip = i2c_get_clientdata(client);
+	if (!chip)
+		return;
+
+	mutex_lock(&chip->mtx);
+	regmap_multi_reg_write(chip->regmap, (const struct reg_sequence[]) {
+		{ .reg = REG_RESET_CMD, .def = RESET_CMD },
+		{ .reg = REG_UPDATE_CMD, .def = UPDATE_CMD }}, 2);
+	mutex_unlock(&chip->mtx);
+}
+
+static const struct of_device_id lp5816_of_match[] = {
+	{ .compatible = "ti,lp5816" },
+	{ }
+};
+
+MODULE_DEVICE_TABLE(of, lp5816_of_match);
+
+static struct i2c_driver lp5816_driver = {
+	.driver = {
+		.name = "leds-lp5816",
+		.of_match_table = lp5816_of_match,
+	},
+	.probe = lp5816_probe,
+	.remove = lp5816_remove,
+};
+
+module_i2c_driver(lp5816_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Alistair Bell <dev@alistairbell.org>");
+MODULE_DESCRIPTION("TI LP5816 LED driver");
-- 
2.54.0


