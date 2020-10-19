Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15017293112
	for <lists+linux-leds@lfdr.de>; Tue, 20 Oct 2020 00:19:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388009AbgJSWT2 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 19 Oct 2020 18:19:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387997AbgJSWT0 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 19 Oct 2020 18:19:26 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 733A9C0613CE
        for <linux-leds@vger.kernel.org>; Mon, 19 Oct 2020 15:19:26 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id h24so1234120ejg.9
        for <linux-leds@vger.kernel.org>; Mon, 19 Oct 2020 15:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5rlC/bK7of7ODh2t8oQ13hRpSEyvlcyWeDZW7koSxsE=;
        b=bkr1FD3YnnJ3Dw7CZFO/TF9YA3Fc7ey5NOgQUEIVFqfgHZ0Os3w8TO6T7ATixJULUS
         beHGc5FeVPBBVJhwr8FZZ2cKJJ7MTSojcELjm9O6iPtGMmx+2yBCA0WJ6QePWf9wcXZQ
         kEY6DZUjeOBHKeeN9ByVJ9rAmTg7IGaYOfX+iqsq8kPRkt7pvOnPf4jItAUMKVNL4qVc
         jsGBbV429ujmeIhv5LBQfpd8ORMyssiiktqP603aIz0lVhGCTBaF+rf2R80Mklj0db1A
         VzY1yS5kINtlF1Fg8Pn1/ILjOH1fhIcnL1NqamQHONp7Q6/LQ+PDTqo0MiRRVSEpunS2
         MBJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5rlC/bK7of7ODh2t8oQ13hRpSEyvlcyWeDZW7koSxsE=;
        b=rQ/yEiUlZwgk0E9bclzMV3bf2kj1ItLvJYgSYaWr4KIU0RkxH9RuLvupWJmXGnTz6w
         7wgLtWkXjH7oWkdA0GWYF0/XHEN3K9f0kPlhzSkojrEo+cQnuqB/cWhAWGs05ROMJGB4
         1lJ04R6HV2gJy+UpTT7i2S0wVy15RWlojod1cSFrPOShEPzgIdCTEp+dyTKQP1aouFJz
         b7OHjT/AD/XdqoMtJPK2KSRCCcoQ1VzplIH+LGnY5mTNOsUcQ82aXk4a/Sl3z9HeyVyX
         oc4sa2vvOMR47Kp7VMPodIIfzvegn8FZhuMqm0kWeiLwgdTgD7vjL9PGp7l4dj/REEzu
         H9VA==
X-Gm-Message-State: AOAM532itMBhMxPF2QNy4UUGjQGkjz6fa5LmsRcddNuSXQ5BiZIbiNF4
        VUUqG83YNQAc76mh3BO/liwWXHO7sw4Bv+c+
X-Google-Smtp-Source: ABdhPJxZbAvzPQ/jJjeCMvKlb0ANSV1CnMwmbfFyxjDN4KteywKOqUFoCJIkoqbJ2tS80EKTva2+kA==
X-Received: by 2002:a17:906:4b10:: with SMTP id y16mr2075125eju.395.1603145965093;
        Mon, 19 Oct 2020 15:19:25 -0700 (PDT)
Received: from localhost.localdomain ([2a00:ee2:4b0d:3001:fbc5:498b:ed6d:cfac])
        by smtp.gmail.com with ESMTPSA id e17sm1645400ejh.64.2020.10.19.15.19.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2020 15:19:24 -0700 (PDT)
From:   Luka Kovacic <luka.kovacic@sartura.hr>
To:     linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org
Cc:     lee.jones@linaro.org, pavel@ucw.cz, dmurphy@ti.com,
        robh+dt@kernel.org, jdelvare@suse.com, linux@roeck-us.net,
        marek.behun@nic.cz, luka.perkov@sartura.hr,
        andy.shevchenko@gmail.com, robert.marko@sartura.hr,
        Luka Kovacic <luka.kovacic@sartura.hr>
Subject: [PATCH v6 3/6] drivers: hwmon: Add the iEi WT61P803 PUZZLE HWMON driver
Date:   Tue, 20 Oct 2020 00:18:56 +0200
Message-Id: <20201019221859.56680-4-luka.kovacic@sartura.hr>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201019221859.56680-1-luka.kovacic@sartura.hr>
References: <20201019221859.56680-1-luka.kovacic@sartura.hr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Add the iEi WT61P803 PUZZLE HWMON driver, that handles the fan speed
control via PWM, reading fan speed and reading on-board temperature
sensors.

The driver registers a HWMON device and a simple thermal cooling device to
enable in-kernel fan management.

This driver depends on the iEi WT61P803 PUZZLE MFD driver.

Signed-off-by: Luka Kovacic <luka.kovacic@sartura.hr>
Cc: Luka Perkov <luka.perkov@sartura.hr>
Cc: Robert Marko <robert.marko@sartura.hr>
---
 drivers/hwmon/Kconfig                     |   8 +
 drivers/hwmon/Makefile                    |   1 +
 drivers/hwmon/iei-wt61p803-puzzle-hwmon.c | 410 ++++++++++++++++++++++
 3 files changed, 419 insertions(+)
 create mode 100644 drivers/hwmon/iei-wt61p803-puzzle-hwmon.c

diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 8dc28b26916e..ff279df9bf40 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -722,6 +722,14 @@ config SENSORS_IBMPOWERNV
 	  This driver can also be built as a module. If so, the module
 	  will be called ibmpowernv.
 
+config SENSORS_IEI_WT61P803_PUZZLE_HWMON
+	tristate "iEi WT61P803 PUZZLE MFD HWMON Driver"
+	depends on MFD_IEI_WT61P803_PUZZLE
+	help
+	  The iEi WT61P803 PUZZLE MFD HWMON Driver handles reading fan speed
+	  and writing fan PWM values. It also supports reading on-board
+	  temperature sensors.
+
 config SENSORS_IIO_HWMON
 	tristate "Hwmon driver that uses channels specified via iio maps"
 	depends on IIO
diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
index a8f4b35b136b..b0afb2d6896f 100644
--- a/drivers/hwmon/Makefile
+++ b/drivers/hwmon/Makefile
@@ -83,6 +83,7 @@ obj-$(CONFIG_SENSORS_HIH6130)	+= hih6130.o
 obj-$(CONFIG_SENSORS_ULTRA45)	+= ultra45_env.o
 obj-$(CONFIG_SENSORS_I5500)	+= i5500_temp.o
 obj-$(CONFIG_SENSORS_I5K_AMB)	+= i5k_amb.o
+obj-$(CONFIG_SENSORS_IEI_WT61P803_PUZZLE_HWMON) += iei-wt61p803-puzzle-hwmon.o
 obj-$(CONFIG_SENSORS_IBMAEM)	+= ibmaem.o
 obj-$(CONFIG_SENSORS_IBMPEX)	+= ibmpex.o
 obj-$(CONFIG_SENSORS_IBMPOWERNV)+= ibmpowernv.o
diff --git a/drivers/hwmon/iei-wt61p803-puzzle-hwmon.c b/drivers/hwmon/iei-wt61p803-puzzle-hwmon.c
new file mode 100644
index 000000000000..f221e2fc6312
--- /dev/null
+++ b/drivers/hwmon/iei-wt61p803-puzzle-hwmon.c
@@ -0,0 +1,410 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/* iEi WT61P803 PUZZLE MCU HWMON Driver
+ *
+ * Copyright (C) 2020 Sartura Ltd.
+ * Author: Luka Kovacic <luka.kovacic@sartura.hr>
+ */
+
+#include <linux/err.h>
+#include <linux/hwmon-sysfs.h>
+#include <linux/hwmon.h>
+#include <linux/interrupt.h>
+#include <linux/irq.h>
+#include <linux/math64.h>
+#include <linux/mfd/iei-wt61p803-puzzle.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/property.h>
+#include <linux/slab.h>
+#include <linux/thermal.h>
+
+#define IEI_WT61P803_PUZZLE_HWMON_MAX_TEMP_NUM 2
+#define IEI_WT61P803_PUZZLE_HWMON_MAX_FAN_NUM 5
+#define IEI_WT61P803_PUZZLE_HWMON_MAX_PWM_NUM 2
+#define IEI_WT61P803_PUZZLE_HWMON_MAX_PWM_VAL 255
+
+/**
+ * struct iei_wt61p803_puzzle_thermal_cooling_device - Thermal cooling device instance
+ *
+ * @mcu_hwmon:		MCU HWMON struct pointer
+ * @tcdev:		Thermal cooling device pointer
+ * @name:		Thermal cooling device name
+ * @pwm_channel:	PWM channel (0 or 1)
+ * @cooling_levels:	Thermal cooling device cooling levels
+ */
+struct iei_wt61p803_puzzle_thermal_cooling_device {
+	struct iei_wt61p803_puzzle_hwmon *mcu_hwmon;
+	struct thermal_cooling_device *tcdev;
+	char name[THERMAL_NAME_LENGTH];
+	int pwm_channel;
+	u8 *cooling_levels;
+};
+
+/**
+ * struct iei_wt61p803_puzzle_hwmon - MCU HWMON Driver
+ *
+ * @mcu:				MCU struct pointer
+ * @response_buffer			Global MCU response buffer allocation
+ * @thermal_cooling_dev_present:	Per-channel thermal cooling device control
+ * @cdev:				Per-channel thermal cooling device private structure
+ */
+struct iei_wt61p803_puzzle_hwmon {
+	struct iei_wt61p803_puzzle *mcu;
+	unsigned char *response_buffer;
+	bool thermal_cooling_dev_present[IEI_WT61P803_PUZZLE_HWMON_MAX_PWM_NUM];
+	struct iei_wt61p803_puzzle_thermal_cooling_device
+		*cdev[IEI_WT61P803_PUZZLE_HWMON_MAX_PWM_NUM];
+};
+
+#define raw_temp_to_milidegree_celsius(x) (((x) - 0x80) * 1000)
+static int iei_wt61p803_puzzle_read_temp_sensor(struct iei_wt61p803_puzzle_hwmon *mcu_hwmon,
+						int channel, long *value)
+{
+	unsigned char *resp_buf = mcu_hwmon->response_buffer;
+	static unsigned char temp_sensor_ntc_cmd[4] = {
+		IEI_WT61P803_PUZZLE_CMD_HEADER_START,
+		IEI_WT61P803_PUZZLE_CMD_TEMP,
+		IEI_WT61P803_PUZZLE_CMD_TEMP_ALL
+	};
+	size_t reply_size = 0;
+	int ret;
+
+	ret = iei_wt61p803_puzzle_write_command(mcu_hwmon->mcu, temp_sensor_ntc_cmd,
+						sizeof(temp_sensor_ntc_cmd), resp_buf,
+						&reply_size);
+
+	if (ret)
+		return ret;
+
+	/* Check the number of NTC values (should be 0x32/'2') */
+	if (resp_buf[3] != 0x32)
+		return -EIO;
+
+	*value = raw_temp_to_milidegree_celsius(resp_buf[4 + channel]);
+
+	return 0;
+}
+
+#define raw_fan_val_to_rpm(x, y) ((((x) << 8 | (y)) / 2) * 60)
+static int iei_wt61p803_puzzle_read_fan_speed(struct iei_wt61p803_puzzle_hwmon *mcu_hwmon,
+					      int channel, long *value)
+{
+	unsigned char *resp_buf = mcu_hwmon->response_buffer;
+	unsigned char fan_speed_cmd[4] = {};
+	size_t reply_size = 0;
+	int ret;
+
+	fan_speed_cmd[0] = IEI_WT61P803_PUZZLE_CMD_HEADER_START;
+	fan_speed_cmd[1] = IEI_WT61P803_PUZZLE_CMD_FAN;
+	fan_speed_cmd[2] = IEI_WT61P803_PUZZLE_CMD_FAN_RPM(channel);
+
+	ret = iei_wt61p803_puzzle_write_command(mcu_hwmon->mcu, fan_speed_cmd,
+						sizeof(fan_speed_cmd), resp_buf,
+						&reply_size);
+	if (ret)
+		return ret;
+
+	*value = raw_fan_val_to_rpm(resp_buf[3], resp_buf[4]);
+
+	return 0;
+}
+
+static int iei_wt61p803_puzzle_write_pwm_channel(struct iei_wt61p803_puzzle_hwmon *mcu_hwmon,
+						 int channel, long pwm_set_val)
+{
+	unsigned char *resp_buf = mcu_hwmon->response_buffer;
+	unsigned char pwm_set_cmd[6] = {};
+	size_t reply_size = 0;
+	int ret;
+
+	pwm_set_cmd[0] = IEI_WT61P803_PUZZLE_CMD_HEADER_START;
+	pwm_set_cmd[1] = IEI_WT61P803_PUZZLE_CMD_FAN;
+	pwm_set_cmd[2] = IEI_WT61P803_PUZZLE_CMD_FAN_PWM_WRITE;
+	pwm_set_cmd[3] = IEI_WT61P803_PUZZLE_CMD_FAN_PWM(channel);
+	pwm_set_cmd[4] = (unsigned char)pwm_set_val;
+
+	ret = iei_wt61p803_puzzle_write_command(mcu_hwmon->mcu, pwm_set_cmd,
+						sizeof(pwm_set_cmd), resp_buf,
+						&reply_size);
+	if (ret)
+		return ret;
+
+	if (!(resp_buf[0] == IEI_WT61P803_PUZZLE_CMD_HEADER_START &&
+	      resp_buf[1] == IEI_WT61P803_PUZZLE_CMD_RESPONSE_OK &&
+	      resp_buf[2] == IEI_WT61P803_PUZZLE_CHECKSUM_RESPONSE_OK))
+		return -EIO;
+
+	return 0;
+}
+
+static int iei_wt61p803_puzzle_read_pwm_channel(struct iei_wt61p803_puzzle_hwmon *mcu_hwmon,
+						int channel, long *value)
+{
+	unsigned char *resp_buf = mcu_hwmon->response_buffer;
+	unsigned char pwm_get_cmd[5] = {};
+	size_t reply_size = 0;
+	int ret;
+
+	pwm_get_cmd[0] = IEI_WT61P803_PUZZLE_CMD_HEADER_START;
+	pwm_get_cmd[1] = IEI_WT61P803_PUZZLE_CMD_FAN;
+	pwm_get_cmd[2] = IEI_WT61P803_PUZZLE_CMD_FAN_PWM_READ;
+	pwm_get_cmd[3] = IEI_WT61P803_PUZZLE_CMD_FAN_PWM(channel);
+
+	ret = iei_wt61p803_puzzle_write_command(mcu_hwmon->mcu, pwm_get_cmd,
+						sizeof(pwm_get_cmd), resp_buf,
+						&reply_size);
+	if (ret)
+		return ret;
+
+	if (resp_buf[2] != IEI_WT61P803_PUZZLE_CMD_FAN_PWM_READ)
+		return -EIO;
+
+	*value = resp_buf[3];
+
+	return 0;
+}
+
+static int iei_wt61p803_puzzle_read(struct device *dev, enum hwmon_sensor_types type,
+				    u32 attr, int channel, long *val)
+{
+	struct iei_wt61p803_puzzle_hwmon *mcu_hwmon = dev_get_drvdata(dev->parent);
+	int ret;
+
+	switch (type) {
+	case hwmon_pwm:
+		ret = iei_wt61p803_puzzle_read_pwm_channel(mcu_hwmon, channel, val);
+		return ret;
+	case hwmon_fan:
+		ret = iei_wt61p803_puzzle_read_fan_speed(mcu_hwmon, channel, val);
+		return ret;
+	case hwmon_temp:
+		ret = iei_wt61p803_puzzle_read_temp_sensor(mcu_hwmon, channel, val);
+		return ret;
+	default:
+		return -EINVAL;
+	}
+}
+
+static int iei_wt61p803_puzzle_write(struct device *dev, enum hwmon_sensor_types type,
+				     u32 attr, int channel, long val)
+{
+	struct iei_wt61p803_puzzle_hwmon *mcu_hwmon = dev_get_drvdata(dev->parent);
+
+	if (attr != hwmon_pwm_input)
+		return -EINVAL;
+	if (mcu_hwmon->thermal_cooling_dev_present[channel]) {
+		/*
+		 * The Thermal Framework has already claimed this specific PWM
+		 * channel.
+		 */
+		return -EBUSY;
+	}
+	return iei_wt61p803_puzzle_write_pwm_channel(mcu_hwmon, channel, val);
+}
+
+static umode_t iei_wt61p803_puzzle_is_visible(const void *data, enum hwmon_sensor_types type,
+					      u32 attr, int channel)
+{
+	switch (type) {
+	case hwmon_pwm:
+		switch (attr) {
+		case hwmon_pwm_input:
+			return 0644;
+		default:
+			return 0;
+		}
+	case hwmon_fan:
+		switch (attr) {
+		case hwmon_fan_input:
+			return 0444;
+		default:
+			return 0;
+		}
+	case hwmon_temp:
+		switch (attr) {
+		case hwmon_temp_input:
+			return 0444;
+		default:
+			return 0;
+		}
+	default:
+		return 0;
+	}
+}
+
+static const struct hwmon_ops iei_wt61p803_puzzle_hwmon_ops = {
+	.is_visible = iei_wt61p803_puzzle_is_visible,
+	.read = iei_wt61p803_puzzle_read,
+	.write = iei_wt61p803_puzzle_write,
+};
+
+static const struct hwmon_channel_info *iei_wt61p803_puzzle_info[] = {
+	HWMON_CHANNEL_INFO(pwm,
+			   HWMON_PWM_INPUT,
+			   HWMON_PWM_INPUT),
+	HWMON_CHANNEL_INFO(fan,
+			   HWMON_F_INPUT,
+			   HWMON_F_INPUT,
+			   HWMON_F_INPUT,
+			   HWMON_F_INPUT,
+			   HWMON_F_INPUT),
+	HWMON_CHANNEL_INFO(temp,
+			   HWMON_T_INPUT,
+			   HWMON_T_INPUT),
+	NULL
+};
+
+static const struct hwmon_chip_info iei_wt61p803_puzzle_chip_info = {
+	.ops = &iei_wt61p803_puzzle_hwmon_ops,
+	.info = iei_wt61p803_puzzle_info,
+};
+
+static int iei_wt61p803_puzzle_get_max_state(struct thermal_cooling_device *tcdev,
+					     unsigned long *state)
+{
+	*state = IEI_WT61P803_PUZZLE_HWMON_MAX_PWM_VAL;
+
+	return 0;
+}
+
+static int iei_wt61p803_puzzle_get_cur_state(struct thermal_cooling_device *tcdev,
+					     unsigned long *state)
+{
+	struct iei_wt61p803_puzzle_thermal_cooling_device *cdev = tcdev->devdata;
+	struct iei_wt61p803_puzzle_hwmon *mcu_hwmon = cdev->mcu_hwmon;
+	long value;
+	int ret;
+
+	ret = iei_wt61p803_puzzle_read_pwm_channel(mcu_hwmon, cdev->pwm_channel, &value);
+	if (ret)
+		return ret;
+
+	*state = value;
+
+	return 0;
+}
+
+static int iei_wt61p803_puzzle_set_cur_state(struct thermal_cooling_device *tcdev,
+					     unsigned long state)
+{
+	struct iei_wt61p803_puzzle_thermal_cooling_device *cdev = tcdev->devdata;
+	struct iei_wt61p803_puzzle_hwmon *mcu_hwmon = cdev->mcu_hwmon;
+
+	return iei_wt61p803_puzzle_write_pwm_channel(mcu_hwmon, cdev->pwm_channel, state);
+}
+
+static const struct thermal_cooling_device_ops iei_wt61p803_puzzle_cooling_ops = {
+	.get_max_state = iei_wt61p803_puzzle_get_max_state,
+	.get_cur_state = iei_wt61p803_puzzle_get_cur_state,
+	.set_cur_state = iei_wt61p803_puzzle_set_cur_state,
+};
+
+static int iei_wt61p803_puzzle_enable_thermal_cooling_dev(struct device *dev,
+						struct fwnode_handle *child,
+						struct iei_wt61p803_puzzle_hwmon *mcu_hwmon)
+{
+	struct iei_wt61p803_puzzle_thermal_cooling_device *cdev;
+	int ret, num_levels;
+	u32 pwm_channel;
+
+	ret = fwnode_property_read_u32(child, "reg", &pwm_channel);
+	if (ret)
+		return ret;
+
+	mcu_hwmon->thermal_cooling_dev_present[pwm_channel] = true;
+
+	num_levels = fwnode_property_read_u8_array(child, "cooling-levels", NULL, 0);
+	if (num_levels > 0) {
+		cdev = devm_kzalloc(dev, sizeof(*cdev), GFP_KERNEL);
+		if (!cdev)
+			return -ENOMEM;
+
+		cdev->cooling_levels = devm_kzalloc(dev, num_levels, GFP_KERNEL);
+		if (!cdev->cooling_levels)
+			return -ENOMEM;
+
+		ret = fwnode_property_read_u8_array(child, "cooling-levels",
+						    cdev->cooling_levels,
+						    num_levels);
+		if (ret) {
+			dev_err(dev, "Couldn't read property 'cooling-levels'");
+			return ret;
+		}
+
+		snprintf(cdev->name, THERMAL_NAME_LENGTH, "iei_wt61p803_puzzle_%d", pwm_channel);
+
+		cdev->tcdev = devm_thermal_of_cooling_device_register(dev, NULL,
+				cdev->name, cdev, &iei_wt61p803_puzzle_cooling_ops);
+		if (IS_ERR(cdev->tcdev))
+			return PTR_ERR(cdev->tcdev);
+
+		cdev->mcu_hwmon = mcu_hwmon;
+		cdev->pwm_channel = pwm_channel;
+
+		mcu_hwmon->cdev[pwm_channel] = cdev;
+	}
+	return 0;
+}
+
+static int iei_wt61p803_puzzle_hwmon_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct iei_wt61p803_puzzle *mcu = dev_get_drvdata(dev->parent);
+	struct iei_wt61p803_puzzle_hwmon *mcu_hwmon;
+	struct fwnode_handle *child;
+	struct device *hwmon_dev;
+	int ret;
+
+	mcu_hwmon = devm_kzalloc(dev, sizeof(*mcu_hwmon), GFP_KERNEL);
+	if (!mcu_hwmon)
+		return -ENOMEM;
+
+	mcu_hwmon->response_buffer = devm_kzalloc(dev, IEI_WT61P803_PUZZLE_BUF_SIZE, GFP_KERNEL);
+	if (!mcu_hwmon->response_buffer)
+		return -ENOMEM;
+
+	mcu_hwmon->mcu = mcu;
+	platform_set_drvdata(pdev, mcu_hwmon);
+
+	hwmon_dev = devm_hwmon_device_register_with_info(dev, "iei_wt61p803_puzzle",
+							 mcu_hwmon,
+							 &iei_wt61p803_puzzle_chip_info,
+							 NULL);
+
+	if (IS_ERR(hwmon_dev))
+		return PTR_ERR(hwmon_dev);
+
+	/* Control fans via PWM lines via Linux Kernel */
+	if (IS_ENABLED(CONFIG_THERMAL)) {
+		device_for_each_child_node(dev, child) {
+			ret = iei_wt61p803_puzzle_enable_thermal_cooling_dev(dev, child, mcu_hwmon);
+			if (ret) {
+				dev_err(dev, "Enabling the PWM fan failed\n");
+				fwnode_handle_put(child);
+				return ret;
+			}
+		}
+	}
+	return 0;
+}
+
+static const struct of_device_id iei_wt61p803_puzzle_hwmon_id_table[] = {
+	{ .compatible = "iei,wt61p803-puzzle-hwmon" },
+	{}
+};
+MODULE_DEVICE_TABLE(of, iei_wt61p803_puzzle_hwmon_id_table);
+
+static struct platform_driver iei_wt61p803_puzzle_hwmon_driver = {
+	.driver = {
+		.name = "iei-wt61p803-puzzle-hwmon",
+		.of_match_table = iei_wt61p803_puzzle_hwmon_id_table,
+	},
+	.probe = iei_wt61p803_puzzle_hwmon_probe,
+};
+
+module_platform_driver(iei_wt61p803_puzzle_hwmon_driver);
+
+MODULE_DESCRIPTION("iEi WT61P803 PUZZLE MCU HWMON Driver");
+MODULE_AUTHOR("Luka Kovacic <luka.kovacic@sartura.hr>");
+MODULE_LICENSE("GPL");
-- 
2.26.2

