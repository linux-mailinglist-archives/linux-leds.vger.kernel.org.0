Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CDBFF3F5E3D
	for <lists+linux-leds@lfdr.de>; Tue, 24 Aug 2021 14:46:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237296AbhHXMrg (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 24 Aug 2021 08:47:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237135AbhHXMrc (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 24 Aug 2021 08:47:32 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1708EC061757
        for <linux-leds@vger.kernel.org>; Tue, 24 Aug 2021 05:46:48 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id 79-20020a1c0452000000b002e6cf79e572so1807292wme.1
        for <linux-leds@vger.kernel.org>; Tue, 24 Aug 2021 05:46:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QX4KXvjdPx5HHDVgMZ3AkXURWvFxwWFSR0xjaE5bC9w=;
        b=Hm1BTToVgxaPDmBKgYdC6cDNfvNAXD+/EP+XJ8yrQAH2rdxKvnLLcm7JlEOkLDY3rZ
         FIGkNXNJfcVQ+9AuYu4kmORj5L/f+utvO0H71EXEwWOp7au+XymH4YE6EfuR3rFhn8/W
         cLmath0dfp64GANJWiifAunoY9CSLV4SAGvQzccEld4wuUfpieetazOfqnA8uOTSpv/A
         v8qCX1deEefEuWm2IWM4e9gq0ZRW82X1ZrlZDGbDuEqktiU5UC99A3rrpwyzsPr7AaPd
         Q8dMfuQIBbME2UY1EVVpE/cLLKS36t8yllXssiO6xFSvp96llt93NDoUsfJxUNnM+d/s
         8I+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QX4KXvjdPx5HHDVgMZ3AkXURWvFxwWFSR0xjaE5bC9w=;
        b=uYFvzTDjzwPT5bm2Br6yXvWrOEIFsbWaOIpg6Sz2JA53fEYaut+agR8dkaq2uYeq4Q
         0bYqXBUgbbdvyOnVED8qQLVU/GqaXUY+ROxz/I1Dg+XiOsXhe3qgqqgKngNjycLT2nnu
         rLI0WVTNcgE7LmtGQMeC4XmcAA1eRcy1IocJB0y+SCHMJc4WzVHLZhjsns9VnNpX51z6
         TPoX1h0ivgYEW7bOqNS3xUAqmm0jDGbci1FPm3pwLXH5wm1mpZTVjOiJ0Gsjmm+lUxyn
         ahlnFOOLyN0OdIiKey6UrSTAA04w9k9MyaRCY9cCEUiCKDj18krGpfQqxTP7yW9SqVbZ
         47gw==
X-Gm-Message-State: AOAM532wt4h9ETGY5XW6bu5LD5NJpAgfMhGgBQvZKBngyGrINNye1d4p
        pVH8A+b4W+QBZXr+uKwGQoOoEQ==
X-Google-Smtp-Source: ABdhPJzF9kIp+T9nEJ1Jhtx/69m8h1IXSz2c64hJkzJCm49nY2d6EOxwGrM9pdhLuCfWFUTgPF6Taw==
X-Received: by 2002:a1c:5401:: with SMTP id i1mr3849768wmb.156.1629809206600;
        Tue, 24 Aug 2021 05:46:46 -0700 (PDT)
Received: from localhost.localdomain ([2a00:ee2:4b0d:3001:fe74:75c8:e909:251b])
        by smtp.gmail.com with ESMTPSA id i14sm2255454wmq.40.2021.08.24.05.46.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Aug 2021 05:46:46 -0700 (PDT)
From:   Luka Kovacic <luka.kovacic@sartura.hr>
To:     linux-doc@vger.kernel.org, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org, geert+renesas@glider.be,
        Max.Merchel@tq-group.com, linux@rempel-privat.de, daniel@0x0f.com,
        shawnguo@kernel.org, sam@ravnborg.org, arnd@arndb.de,
        krzysztof.kozlowski@canonical.com, pavo.banicevic@sartura.hr,
        corbet@lwn.net, lee.jones@linaro.org, pavel@ucw.cz,
        robh+dt@kernel.org, linux@roeck-us.net, jdelvare@suse.com,
        goran.medic@sartura.hr, luka.perkov@sartura.hr,
        robert.marko@sartura.hr
Cc:     Luka Kovacic <luka.kovacic@sartura.hr>
Subject: [PATCH v9 3/7] drivers: hwmon: Add the IEI WT61P803 PUZZLE HWMON driver
Date:   Tue, 24 Aug 2021 14:44:34 +0200
Message-Id: <20210824124438.14519-4-luka.kovacic@sartura.hr>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210824124438.14519-1-luka.kovacic@sartura.hr>
References: <20210824124438.14519-1-luka.kovacic@sartura.hr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Add the IEI WT61P803 PUZZLE HWMON driver, that handles the fan speed
control via PWM, reading fan speed and reading on-board temperature
sensors.

The driver registers a HWMON device and a simple thermal cooling device to
enable in-kernel fan management.

This driver depends on the IEI WT61P803 PUZZLE MFD driver.

Signed-off-by: Luka Kovacic <luka.kovacic@sartura.hr>
Signed-off-by: Pavo Banicevic <pavo.banicevic@sartura.hr>
Acked-by: Guenter Roeck <linux@roeck-us.net>
Cc: Luka Perkov <luka.perkov@sartura.hr>
Cc: Robert Marko <robert.marko@sartura.hr>
---
 drivers/hwmon/Kconfig                     |   8 +
 drivers/hwmon/Makefile                    |   1 +
 drivers/hwmon/iei-wt61p803-puzzle-hwmon.c | 413 ++++++++++++++++++++++
 3 files changed, 422 insertions(+)
 create mode 100644 drivers/hwmon/iei-wt61p803-puzzle-hwmon.c

diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index e3675377bc5d..53fdc8c2ae37 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -722,6 +722,14 @@ config SENSORS_IBMPOWERNV
 	  This driver can also be built as a module. If so, the module
 	  will be called ibmpowernv.
 
+config SENSORS_IEI_WT61P803_PUZZLE_HWMON
+	tristate "IEI WT61P803 PUZZLE MFD HWMON Driver"
+	depends on MFD_IEI_WT61P803_PUZZLE
+	help
+	  The IEI WT61P803 PUZZLE MFD HWMON Driver handles reading fan speed
+	  and writing fan PWM values. It also supports reading on-board
+	  temperature sensors.
+
 config SENSORS_IIO_HWMON
 	tristate "Hwmon driver that uses channels specified via iio maps"
 	depends on IIO
diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
index d712c61c1f5e..b31f8d7e7c96 100644
--- a/drivers/hwmon/Makefile
+++ b/drivers/hwmon/Makefile
@@ -84,6 +84,7 @@ obj-$(CONFIG_SENSORS_HIH6130)	+= hih6130.o
 obj-$(CONFIG_SENSORS_ULTRA45)	+= ultra45_env.o
 obj-$(CONFIG_SENSORS_I5500)	+= i5500_temp.o
 obj-$(CONFIG_SENSORS_I5K_AMB)	+= i5k_amb.o
+obj-$(CONFIG_SENSORS_IEI_WT61P803_PUZZLE_HWMON) += iei-wt61p803-puzzle-hwmon.o
 obj-$(CONFIG_SENSORS_IBMAEM)	+= ibmaem.o
 obj-$(CONFIG_SENSORS_IBMPEX)	+= ibmpex.o
 obj-$(CONFIG_SENSORS_IBMPOWERNV)+= ibmpowernv.o
diff --git a/drivers/hwmon/iei-wt61p803-puzzle-hwmon.c b/drivers/hwmon/iei-wt61p803-puzzle-hwmon.c
new file mode 100644
index 000000000000..3a895ca08474
--- /dev/null
+++ b/drivers/hwmon/iei-wt61p803-puzzle-hwmon.c
@@ -0,0 +1,413 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/* IEI WT61P803 PUZZLE MCU HWMON Driver
+ *
+ * Copyright (C) 2020 Sartura Ltd.
+ * Author: Luka Kovacic <luka.kovacic@sartura.hr>
+ */
+
+#include <linux/err.h>
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
+#define IEI_WT61P803_PUZZLE_HWMON_MAX_PWM	2
+#define IEI_WT61P803_PUZZLE_HWMON_MAX_PWM_VAL	255
+
+/**
+ * struct iei_wt61p803_puzzle_thermal_cooling_device - Thermal cooling device instance
+ * @mcu_hwmon:		Parent driver struct pointer
+ * @tcdev:		Thermal cooling device pointer
+ * @name:		Thermal cooling device name
+ * @pwm_channel:	Controlled PWM channel (0 or 1)
+ * @cooling_levels:	Thermal cooling device cooling levels (DT)
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
+ * @mcu:				MCU struct pointer
+ * @response_buffer			Global MCU response buffer
+ * @thermal_cooling_dev_present:	Per-channel thermal cooling device control indicator
+ * @cdev:				Per-channel thermal cooling device private structure
+ */
+struct iei_wt61p803_puzzle_hwmon {
+	struct iei_wt61p803_puzzle *mcu;
+	unsigned char response_buffer[IEI_WT61P803_PUZZLE_BUF_SIZE];
+	bool thermal_cooling_dev_present[IEI_WT61P803_PUZZLE_HWMON_MAX_PWM];
+	struct iei_wt61p803_puzzle_thermal_cooling_device
+		*cdev[IEI_WT61P803_PUZZLE_HWMON_MAX_PWM];
+	struct mutex lock; /* mutex to protect response_buffer array */
+};
+
+#define raw_temp_to_milidegree_celsius(x) (((x) - 0x80) * 1000)
+static int iei_wt61p803_puzzle_read_temp_sensor(struct iei_wt61p803_puzzle_hwmon *mcu_hwmon,
+						int channel, long *value)
+{
+	unsigned char *resp_buf = mcu_hwmon->response_buffer;
+	unsigned char temp_sensor_ntc_cmd[4] = {
+		IEI_WT61P803_PUZZLE_CMD_HEADER_START,
+		IEI_WT61P803_PUZZLE_CMD_TEMP,
+		IEI_WT61P803_PUZZLE_CMD_TEMP_ALL,
+	};
+	size_t reply_size;
+	int ret;
+
+	mutex_lock(&mcu_hwmon->lock);
+	ret = iei_wt61p803_puzzle_write_command(mcu_hwmon->mcu, temp_sensor_ntc_cmd,
+						sizeof(temp_sensor_ntc_cmd), resp_buf,
+						&reply_size);
+	if (ret)
+		goto exit;
+
+	if (reply_size != 7) {
+		ret = -EIO;
+		goto exit;
+	}
+
+	/* Check the number of NTC values */
+	if (resp_buf[3] != '2') {
+		ret = -EIO;
+		goto exit;
+	}
+
+	*value = raw_temp_to_milidegree_celsius(resp_buf[4 + channel]);
+exit:
+	mutex_unlock(&mcu_hwmon->lock);
+	return ret;
+}
+
+#define raw_fan_val_to_rpm(x, y) ((((x) << 8 | (y)) / 2) * 60)
+static int iei_wt61p803_puzzle_read_fan_speed(struct iei_wt61p803_puzzle_hwmon *mcu_hwmon,
+					      int channel, long *value)
+{
+	unsigned char *resp_buf = mcu_hwmon->response_buffer;
+	unsigned char fan_speed_cmd[4] = {};
+	size_t reply_size;
+	int ret;
+
+	fan_speed_cmd[0] = IEI_WT61P803_PUZZLE_CMD_HEADER_START;
+	fan_speed_cmd[1] = IEI_WT61P803_PUZZLE_CMD_FAN;
+	fan_speed_cmd[2] = IEI_WT61P803_PUZZLE_CMD_FAN_RPM(channel);
+
+	mutex_lock(&mcu_hwmon->lock);
+	ret = iei_wt61p803_puzzle_write_command(mcu_hwmon->mcu, fan_speed_cmd,
+						sizeof(fan_speed_cmd), resp_buf,
+						&reply_size);
+	if (ret)
+		goto exit;
+
+	if (reply_size != 7) {
+		ret = -EIO;
+		goto exit;
+	}
+
+	*value = raw_fan_val_to_rpm(resp_buf[3], resp_buf[4]);
+exit:
+	mutex_unlock(&mcu_hwmon->lock);
+	return ret;
+}
+
+static int iei_wt61p803_puzzle_write_pwm_channel(struct iei_wt61p803_puzzle_hwmon *mcu_hwmon,
+						 int channel, long pwm_set_val)
+{
+	unsigned char *resp_buf = mcu_hwmon->response_buffer;
+	unsigned char pwm_set_cmd[6] = {};
+	size_t reply_size;
+	int ret;
+
+	pwm_set_cmd[0] = IEI_WT61P803_PUZZLE_CMD_HEADER_START;
+	pwm_set_cmd[1] = IEI_WT61P803_PUZZLE_CMD_FAN;
+	pwm_set_cmd[2] = IEI_WT61P803_PUZZLE_CMD_FAN_PWM_WRITE;
+	pwm_set_cmd[3] = IEI_WT61P803_PUZZLE_CMD_FAN_PWM(channel);
+	pwm_set_cmd[4] = pwm_set_val;
+
+	mutex_lock(&mcu_hwmon->lock);
+	ret = iei_wt61p803_puzzle_write_command(mcu_hwmon->mcu, pwm_set_cmd,
+						sizeof(pwm_set_cmd), resp_buf,
+						&reply_size);
+	if (ret)
+		goto exit;
+
+	if (reply_size != 3) {
+		ret = -EIO;
+		goto exit;
+	}
+
+	if (!(resp_buf[0] == IEI_WT61P803_PUZZLE_CMD_HEADER_START &&
+	      resp_buf[1] == IEI_WT61P803_PUZZLE_CMD_RESPONSE_OK &&
+	      resp_buf[2] == IEI_WT61P803_PUZZLE_CHECKSUM_RESPONSE_OK)) {
+		ret = -EIO;
+		goto exit;
+	}
+exit:
+	mutex_unlock(&mcu_hwmon->lock);
+	return ret;
+}
+
+static int iei_wt61p803_puzzle_read_pwm_channel(struct iei_wt61p803_puzzle_hwmon *mcu_hwmon,
+						int channel, long *value)
+{
+	unsigned char *resp_buf = mcu_hwmon->response_buffer;
+	unsigned char pwm_get_cmd[5] = {};
+	size_t reply_size;
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
+	if (reply_size != 5)
+		return -EIO;
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
+
+	switch (type) {
+	case hwmon_pwm:
+		return iei_wt61p803_puzzle_read_pwm_channel(mcu_hwmon, channel, val);
+	case hwmon_fan:
+		return iei_wt61p803_puzzle_read_fan_speed(mcu_hwmon, channel, val);
+	case hwmon_temp:
+		return iei_wt61p803_puzzle_read_temp_sensor(mcu_hwmon, channel, val);
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
+	return iei_wt61p803_puzzle_write_pwm_channel(mcu_hwmon, channel, val);
+}
+
+static umode_t iei_wt61p803_puzzle_is_visible(const void *data, enum hwmon_sensor_types type,
+					      u32 attr, int channel)
+{
+	const struct iei_wt61p803_puzzle_hwmon *mcu_hwmon = data;
+
+	switch (type) {
+	case hwmon_pwm:
+		if (mcu_hwmon->thermal_cooling_dev_present[channel])
+			return 0444;
+		if (attr == hwmon_pwm_input)
+			return 0644;
+		break;
+	case hwmon_fan:
+		if (attr == hwmon_fan_input)
+			return 0444;
+		break;
+	case hwmon_temp:
+		if (attr == hwmon_temp_input)
+			return 0444;
+		break;
+	default:
+		return 0;
+	}
+
+	return 0;
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
+	*state = value;
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
+static int
+iei_wt61p803_puzzle_enable_thermal_cooling_dev(struct device *dev,
+					       struct fwnode_handle *child,
+					       struct iei_wt61p803_puzzle_hwmon *mcu_hwmon)
+{
+	struct iei_wt61p803_puzzle_thermal_cooling_device *cdev;
+	u32 pwm_channel;
+	u8 num_levels;
+	int ret;
+
+	ret = fwnode_property_read_u32(child, "reg", &pwm_channel);
+	if (ret)
+		return ret;
+
+	mcu_hwmon->thermal_cooling_dev_present[pwm_channel] = true;
+
+	num_levels = fwnode_property_count_u8(child, "cooling-levels");
+	if (!num_levels)
+		return -EINVAL;
+
+	cdev = devm_kzalloc(dev, sizeof(*cdev), GFP_KERNEL);
+	if (!cdev)
+		return -ENOMEM;
+
+	cdev->cooling_levels = devm_kmalloc_array(dev, num_levels, sizeof(u8), GFP_KERNEL);
+	if (!cdev->cooling_levels)
+		return -ENOMEM;
+
+	ret = fwnode_property_read_u8_array(child, "cooling-levels",
+					    cdev->cooling_levels,
+					    num_levels);
+	if (ret) {
+		dev_err(dev, "Couldn't read property 'cooling-levels'\n");
+		return ret;
+	}
+
+	snprintf(cdev->name, THERMAL_NAME_LENGTH, "wt61p803_puzzle_%d", pwm_channel);
+	cdev->tcdev = devm_thermal_of_cooling_device_register(dev, NULL, cdev->name, cdev,
+							      &iei_wt61p803_puzzle_cooling_ops);
+	if (IS_ERR(cdev->tcdev))
+		return PTR_ERR(cdev->tcdev);
+
+	cdev->mcu_hwmon = mcu_hwmon;
+	cdev->pwm_channel = pwm_channel;
+	mcu_hwmon->cdev[pwm_channel] = cdev;
+
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
+	mcu_hwmon->mcu = mcu;
+	platform_set_drvdata(pdev, mcu_hwmon);
+	mutex_init(&mcu_hwmon->lock);
+
+	hwmon_dev = devm_hwmon_device_register_with_info(dev, "iei_wt61p803_puzzle",
+							 mcu_hwmon,
+							 &iei_wt61p803_puzzle_chip_info,
+							 NULL);
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
+MODULE_DESCRIPTION("IEI WT61P803 PUZZLE MCU HWMON Driver");
+MODULE_AUTHOR("Luka Kovacic <luka.kovacic@sartura.hr>");
+MODULE_LICENSE("GPL v2");
-- 
2.31.1

