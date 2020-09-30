Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6AAEF27DDE1
	for <lists+linux-leds@lfdr.de>; Wed, 30 Sep 2020 03:41:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729796AbgI3Bl3 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 29 Sep 2020 21:41:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729765AbgI3BlW (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 29 Sep 2020 21:41:22 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6824C0613D4
        for <linux-leds@vger.kernel.org>; Tue, 29 Sep 2020 18:41:19 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id dd13so429975ejb.5
        for <linux-leds@vger.kernel.org>; Tue, 29 Sep 2020 18:41:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FuidiMlloV7rQD3tHI0jgrmBm7wWwMcHXMWm1Kz5L9A=;
        b=nmNDjekelX7Df7z6RSP+Cka1a8Sk6b9KATK7wNovW2teCCyEQn/rmTi8em+pI3jFlB
         0guGvt5ABB82u8TH+mgRFmNOxA4VakiS7sP7F+USO0KcXhw86zZiGVhY8QblgPpUW5LK
         JjFfND2znUK2HAK0vyXu/TpXZWLjAWN6kzp/JoOpxnLW+Awv4g65gMQJ+kTdyofYTan4
         sy1eWu+1Z9U0nPStbeUKD4/GqwLQeqSP6dlLibya89TjEYazJGQuCbHppdjJQQg3BnUB
         Gk80HY23yi1x+X5AE/5BCpwg7u/ZPPciyzg38VVtkudKv7eAbIT1ZBwFlkPdtA5oWAso
         /c4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FuidiMlloV7rQD3tHI0jgrmBm7wWwMcHXMWm1Kz5L9A=;
        b=cQh7+nAvx+hic/iU/VYkW+0EgeZRvyvDuOsI6Yb36RRbrXYBQi1XkuoICETu7M3NJT
         pyrk+MA9t9w0/RVXFnMFuQWfXl1Yp/wwu6+b2cIHfllfg/BcP7DeGYT9kSfHdpMpEyFu
         buQ/eZE4RkU4fjN+8lWThdVpnUjzTndWEZASsdHn0Yqx29+Q5YFjCi/dYWvF9kqX7GPE
         IizMqw9VN+IqhR2SK+XaISc8cvD2pF5VFzelqS8Rz9PWgjxZh8TXIBcOUqD6VqL36453
         2AMZ/F9ha63z+QvkyRwspXFcGTMcoNT4lPQ3E/NS1/jQfTUoaDp9J3WAw/F8yT/onnzk
         fGGg==
X-Gm-Message-State: AOAM532PlVH7PxoeCdsRBJHSH4fGLi8+9Nr6Hrb51xhDT4cbzDikizgo
        vd9B1OTWC3Fg0p5/VEpQovSXwQ==
X-Google-Smtp-Source: ABdhPJzaKAsMdK2QkP07L2fNrkxPfh+u4dF2LjbTkvqBStdh6q52dGVk6aj2ttmJSHcdxYi8Yo9WiA==
X-Received: by 2002:a17:906:3495:: with SMTP id g21mr443849ejb.121.1601430078283;
        Tue, 29 Sep 2020 18:41:18 -0700 (PDT)
Received: from localhost.localdomain ([2a00:ee2:4b0d:3000:290:faff:fe54:449c])
        by smtp.gmail.com with ESMTPSA id q1sm203258ejy.37.2020.09.29.18.41.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2020 18:41:17 -0700 (PDT)
From:   Luka Kovacic <luka.kovacic@sartura.hr>
To:     linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-leds@vger.kernel.org
Cc:     lee.jones@linaro.org, pavel@ucw.cz, dmurphy@ti.com,
        robh+dt@kernel.org, jdelvare@suse.com, linux@roeck-us.net,
        andrew@lunn.ch, jason@lakedaemon.net, gregory.clement@bootlin.com,
        marek.behun@nic.cz, luka.perkov@sartura.hr,
        robert.marko@sartura.hr, Luka Kovacic <luka.kovacic@sartura.hr>
Subject: [PATCH v3 3/7] drivers: hwmon: Add the iEi WT61P803 PUZZLE HWMON driver
Date:   Wed, 30 Sep 2020 03:40:54 +0200
Message-Id: <20200930014058.44460-4-luka.kovacic@sartura.hr>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200930014058.44460-1-luka.kovacic@sartura.hr>
References: <20200930014058.44460-1-luka.kovacic@sartura.hr>
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
 drivers/hwmon/iei-wt61p803-puzzle-hwmon.c | 513 ++++++++++++++++++++++
 3 files changed, 522 insertions(+)
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
index 000000000000..990016329578
--- /dev/null
+++ b/drivers/hwmon/iei-wt61p803-puzzle-hwmon.c
@@ -0,0 +1,513 @@
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
+ * @lock				General member lock
+ * @response_buffer			Global MCU response buffer allocation
+ * @temp_sensor_val:			Temperature sensor values
+ * @fan_speed_val:			FAN speed (RPM) values
+ * @pwm_val:				PWM values (0-255)
+ * @thermal_cooling_dev_present:	Per-channel thermal cooling device control
+ * @cdev:				Per-channel thermal cooling device private structure
+ */
+struct iei_wt61p803_puzzle_hwmon {
+	struct iei_wt61p803_puzzle *mcu;
+	struct mutex lock;
+	unsigned char *response_buffer;
+	int temp_sensor_val[IEI_WT61P803_PUZZLE_HWMON_MAX_TEMP_NUM];
+	int fan_speed_val[IEI_WT61P803_PUZZLE_HWMON_MAX_FAN_NUM];
+	int pwm_val[IEI_WT61P803_PUZZLE_HWMON_MAX_PWM_NUM];
+	bool thermal_cooling_dev_present[IEI_WT61P803_PUZZLE_HWMON_MAX_PWM_NUM];
+	struct iei_wt61p803_puzzle_thermal_cooling_device
+		*cdev[IEI_WT61P803_PUZZLE_HWMON_MAX_PWM_NUM];
+};
+
+#define raw_temp_to_milidegree_celsius(x) ((int)((x - 0x80)*1000))
+static int iei_wt61p803_puzzle_read_temp_sensor
+(struct iei_wt61p803_puzzle_hwmon *mcu_hwmon, int channel, int *value)
+{
+	unsigned char *resp_buf = mcu_hwmon->response_buffer;
+	unsigned char temp_sensor_ntc_cmd[4] = {
+		IEI_WT61P803_PUZZLE_CMD_HEADER_START,
+		IEI_WT61P803_PUZZLE_CMD_TEMP,
+		IEI_WT61P803_PUZZLE_CMD_TEMP_ALL
+	};
+	size_t reply_size = 0;
+	int ret;
+
+	if (channel > 1 && channel < 0)
+		return -EINVAL;
+
+	mutex_lock(&mcu_hwmon->lock);
+	ret = iei_wt61p803_puzzle_write_command(mcu_hwmon->mcu,
+			temp_sensor_ntc_cmd, sizeof(temp_sensor_ntc_cmd),
+			resp_buf, &reply_size);
+	if (!ret) {
+		/* Check the number of NTC values (should be 0x32/'2') */
+		if (resp_buf[3] == 0x32) {
+			/* Write values to the struct */
+			mcu_hwmon->temp_sensor_val[0] =
+				raw_temp_to_milidegree_celsius(resp_buf[4]);
+			mcu_hwmon->temp_sensor_val[1] =
+				raw_temp_to_milidegree_celsius(resp_buf[5]);
+		}
+
+	}
+	*value = mcu_hwmon->temp_sensor_val[channel];
+	mutex_unlock(&mcu_hwmon->lock);
+
+	return ret;
+}
+
+#define raw_fan_val_to_rpm(x, y) ((int)(((x)<<8|(y))/2)*60)
+static int iei_wt61p803_puzzle_read_fan_speed
+(struct iei_wt61p803_puzzle_hwmon *mcu_hwmon, int channel, int *value)
+{
+	unsigned char *resp_buf = mcu_hwmon->response_buffer;
+	unsigned char fan_speed_cmd[4] = {
+		IEI_WT61P803_PUZZLE_CMD_HEADER_START,
+		IEI_WT61P803_PUZZLE_CMD_FAN,
+		IEI_WT61P803_PUZZLE_CMD_FAN_RPM_0
+	};
+	size_t reply_size = 0;
+	int ret;
+
+	switch (channel) {
+	case 0:
+		fan_speed_cmd[2] = IEI_WT61P803_PUZZLE_CMD_FAN_RPM_0;
+		break;
+	case 1:
+		fan_speed_cmd[2] = IEI_WT61P803_PUZZLE_CMD_FAN_RPM_1;
+		break;
+	case 2:
+		fan_speed_cmd[2] = IEI_WT61P803_PUZZLE_CMD_FAN_RPM_2;
+		break;
+	case 3:
+		fan_speed_cmd[2] = IEI_WT61P803_PUZZLE_CMD_FAN_RPM_3;
+		break;
+	case 4:
+		fan_speed_cmd[2] = IEI_WT61P803_PUZZLE_CMD_FAN_RPM_4;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	mutex_lock(&mcu_hwmon->lock);
+	ret = iei_wt61p803_puzzle_write_command(mcu_hwmon->mcu, fan_speed_cmd,
+			sizeof(fan_speed_cmd), resp_buf, &reply_size);
+	if (!ret)
+		mcu_hwmon->fan_speed_val[channel] = raw_fan_val_to_rpm(resp_buf[3],
+				resp_buf[4]);
+
+	*value = mcu_hwmon->fan_speed_val[channel];
+	mutex_unlock(&mcu_hwmon->lock);
+
+	return 0;
+}
+
+static int iei_wt61p803_puzzle_write_pwm_channel
+(struct iei_wt61p803_puzzle_hwmon *mcu_hwmon, int channel, long pwm_set_val)
+{
+	unsigned char *resp_buf = mcu_hwmon->response_buffer;
+	unsigned char pwm_set_cmd[6] = {
+		IEI_WT61P803_PUZZLE_CMD_HEADER_START,
+		IEI_WT61P803_PUZZLE_CMD_FAN,
+		IEI_WT61P803_PUZZLE_CMD_FAN_PWM_WRITE,
+		IEI_WT61P803_PUZZLE_CMD_FAN_PWM_0,
+		0x00
+	};
+	size_t reply_size = 0;
+	int ret;
+
+	switch (channel) {
+	case 0:
+		pwm_set_cmd[3] = IEI_WT61P803_PUZZLE_CMD_FAN_PWM_0;
+		break;
+	case 1:
+		pwm_set_cmd[3] = IEI_WT61P803_PUZZLE_CMD_FAN_PWM_1;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	if (pwm_set_val < 0 || pwm_set_val > IEI_WT61P803_PUZZLE_HWMON_MAX_PWM_VAL)
+		return -EINVAL;
+
+	/* Add the PWM value to the command */
+	pwm_set_cmd[4] = (char)pwm_set_val;
+
+	mutex_lock(&mcu_hwmon->lock);
+	ret = iei_wt61p803_puzzle_write_command(mcu_hwmon->mcu, pwm_set_cmd,
+			sizeof(pwm_set_cmd), resp_buf, &reply_size);
+	if (!ret) {
+		/* Store the PWM value */
+		if (resp_buf[0] == IEI_WT61P803_PUZZLE_CMD_HEADER_START &&
+				resp_buf[1] == IEI_WT61P803_PUZZLE_CMD_RESPONSE_OK &&
+				resp_buf[2] == IEI_WT61P803_PUZZLE_CHECKSUM_RESPONSE_OK)
+			mcu_hwmon->pwm_val[channel] = (int)pwm_set_val;
+	}
+	mutex_unlock(&mcu_hwmon->lock);
+
+	return 0;
+}
+
+static int iei_wt61p803_puzzle_read_pwm_channel
+(struct iei_wt61p803_puzzle_hwmon *mcu_hwmon, int channel, int *value)
+{
+	unsigned char *resp_buf = mcu_hwmon->response_buffer;
+	unsigned char pwm_get_cmd[5] = {
+		IEI_WT61P803_PUZZLE_CMD_HEADER_START,
+		IEI_WT61P803_PUZZLE_CMD_FAN,
+		IEI_WT61P803_PUZZLE_CMD_FAN_PWM_READ,
+		IEI_WT61P803_PUZZLE_CMD_FAN_PWM_0
+	};
+	size_t reply_size = 0;
+	int ret;
+
+	switch (channel) {
+	case 0:
+		pwm_get_cmd[3] = IEI_WT61P803_PUZZLE_CMD_FAN_PWM_0;
+		break;
+	case 1:
+		pwm_get_cmd[3] = IEI_WT61P803_PUZZLE_CMD_FAN_PWM_1;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	mutex_lock(&mcu_hwmon->lock);
+	ret = iei_wt61p803_puzzle_write_command(mcu_hwmon->mcu, pwm_get_cmd,
+			sizeof(pwm_get_cmd), resp_buf, &reply_size);
+	if (!ret) {
+		/* Store the PWM value */
+		if (resp_buf[2] == IEI_WT61P803_PUZZLE_CMD_FAN_PWM_READ)
+			mcu_hwmon->pwm_val[channel] = (int)resp_buf[3];
+	}
+	*value = mcu_hwmon->pwm_val[channel];
+	mutex_unlock(&mcu_hwmon->lock);
+
+	return 0;
+}
+
+static int iei_wt61p803_puzzle_read(struct device *dev, enum hwmon_sensor_types type,
+		u32 attr, int channel, long *val)
+{
+	struct iei_wt61p803_puzzle_hwmon *mcu_hwmon =
+		dev_get_drvdata(dev->parent);
+	int ret, value;
+
+	switch (type) {
+	case hwmon_pwm:
+		if (attr != hwmon_pwm_input)
+			return -ENODEV;
+		ret = iei_wt61p803_puzzle_read_pwm_channel(mcu_hwmon, channel, &value);
+		if (ret)
+			return ret;
+		*val = (long)value;
+		return ret;
+	case hwmon_fan:
+		if (attr != hwmon_fan_input)
+			return -ENODEV;
+		ret = iei_wt61p803_puzzle_read_fan_speed(mcu_hwmon, channel, &value);
+		if (ret)
+			return ret;
+		*val = (long)value;
+		return ret;
+	case hwmon_temp:
+		if (attr != hwmon_temp_input)
+			return -ENODEV;
+		ret = iei_wt61p803_puzzle_read_temp_sensor(mcu_hwmon, channel, &value);
+		if (ret)
+			return ret;
+		*val = (long)value;
+		return ret;
+	default:
+		return -ENODEV;
+	}
+}
+
+static int iei_wt61p803_puzzle_write(struct device *dev, enum hwmon_sensor_types type,
+		u32 attr, int channel, long val)
+{
+	struct iei_wt61p803_puzzle_hwmon *mcu_hwmon =
+		dev_get_drvdata(dev->parent);
+
+	switch (type) {
+	case hwmon_pwm:
+		if (attr != hwmon_pwm_input)
+			return -ENODEV;
+		if (mcu_hwmon->thermal_cooling_dev_present[channel]) {
+			/*
+			 * The Thermal Framework has already claimed this specific PWM
+			 * channel.
+			 */
+			return -EBUSY;
+		}
+		return iei_wt61p803_puzzle_write_pwm_channel(mcu_hwmon, channel, val);
+	default:
+		return -ENODEV;
+	}
+}
+
+static umode_t iei_wt61p803_puzzle_is_visible(const void *data,
+		enum hwmon_sensor_types type, u32 attr, int channel)
+{
+	const struct iei_wt61p803_puzzle_hwmon *mcu_hwmon = data;
+
+	switch (type) {
+	case hwmon_pwm:
+		switch (attr) {
+		case hwmon_pwm_input:
+			if (mcu_hwmon->thermal_cooling_dev_present[channel])
+				return 0444;
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
+			HWMON_PWM_INPUT,
+			HWMON_PWM_INPUT),
+	HWMON_CHANNEL_INFO(fan,
+			HWMON_F_INPUT,
+			HWMON_F_INPUT,
+			HWMON_F_INPUT,
+			HWMON_F_INPUT,
+			HWMON_F_INPUT),
+	HWMON_CHANNEL_INFO(temp,
+			HWMON_T_INPUT,
+			HWMON_T_INPUT),
+	NULL
+};
+
+static const struct hwmon_chip_info iei_wt61p803_puzzle_chip_info = {
+	.ops = &iei_wt61p803_puzzle_hwmon_ops,
+	.info = iei_wt61p803_puzzle_info,
+};
+
+static int iei_wt61p803_puzzle_get_max_state
+(struct thermal_cooling_device *tcdev, unsigned long *state)
+{
+	*state = IEI_WT61P803_PUZZLE_HWMON_MAX_PWM_VAL;
+
+	return 0;
+}
+static int iei_wt61p803_puzzle_get_cur_state
+(struct thermal_cooling_device *tcdev, unsigned long *state)
+{
+	struct iei_wt61p803_puzzle_thermal_cooling_device *cdev = tcdev->devdata;
+	struct iei_wt61p803_puzzle_hwmon *mcu_hwmon = cdev->mcu_hwmon;
+
+	int ret, value;
+
+	if (!mcu_hwmon)
+		return -EINVAL;
+
+	ret = iei_wt61p803_puzzle_read_pwm_channel(mcu_hwmon,
+			cdev->pwm_channel, &value);
+	if (ret)
+		return ret;
+
+	*state = (unsigned long)value;
+
+	return 0;
+}
+static int iei_wt61p803_puzzle_set_cur_state
+(struct thermal_cooling_device *tcdev, unsigned long state)
+{
+	struct iei_wt61p803_puzzle_thermal_cooling_device *cdev = tcdev->devdata;
+	struct iei_wt61p803_puzzle_hwmon *mcu_hwmon = cdev->mcu_hwmon;
+
+	if (!mcu_hwmon)
+		return -EINVAL;
+
+	return iei_wt61p803_puzzle_write_pwm_channel(mcu_hwmon,
+			cdev->pwm_channel, state);
+}
+static const struct thermal_cooling_device_ops iei_wt61p803_puzzle_cooling_ops = {
+	.get_max_state = iei_wt61p803_puzzle_get_max_state,
+	.get_cur_state = iei_wt61p803_puzzle_get_cur_state,
+	.set_cur_state = iei_wt61p803_puzzle_set_cur_state,
+};
+
+static int iei_wt61p803_puzzle_enable_thermal_cooling_dev
+(struct device *dev, struct fwnode_handle *child, struct iei_wt61p803_puzzle_hwmon *mcu_hwmon)
+{
+	struct iei_wt61p803_puzzle_thermal_cooling_device *cdev;
+	int ret, num_levels;
+	u32 pwm_channel;
+
+	ret = fwnode_property_read_u32(child, "reg", &pwm_channel);
+	if (ret)
+		return ret;
+
+	mutex_lock(&mcu_hwmon->lock);
+	mcu_hwmon->thermal_cooling_dev_present[pwm_channel] = true;
+	mutex_unlock(&mcu_hwmon->lock);
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
+				cdev->cooling_levels, num_levels);
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
+		mutex_lock(&mcu_hwmon->lock);
+		mcu_hwmon->cdev[pwm_channel] = cdev;
+		mutex_unlock(&mcu_hwmon->lock);
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
+	mcu_hwmon->response_buffer = devm_kzalloc(dev,
+			IEI_WT61P803_PUZZLE_BUF_SIZE, GFP_KERNEL);
+	if (!mcu_hwmon->response_buffer)
+		return -ENOMEM;
+
+	mcu_hwmon->mcu = mcu;
+	mutex_init(&mcu_hwmon->lock);
+	platform_set_drvdata(pdev, mcu_hwmon);
+
+	hwmon_dev = devm_hwmon_device_register_with_info(dev,
+					"iei_wt61p803_puzzle",
+					mcu_hwmon,
+					&iei_wt61p803_puzzle_chip_info,
+					NULL);
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

