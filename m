Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C3D22799D7
	for <lists+linux-leds@lfdr.de>; Sat, 26 Sep 2020 15:56:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729106AbgIZNzm (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 26 Sep 2020 09:55:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728504AbgIZNzl (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 26 Sep 2020 09:55:41 -0400
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4666C0613D4
        for <linux-leds@vger.kernel.org>; Sat, 26 Sep 2020 06:55:40 -0700 (PDT)
Received: by mail-ed1-x542.google.com with SMTP id t16so5376277edw.7
        for <linux-leds@vger.kernel.org>; Sat, 26 Sep 2020 06:55:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qaLnNpsvt7SC8khaRLTdBh+DWSpXY2mXyTnplQmZGLk=;
        b=OVIevK9X9KzP5Lf5mEMhq10uLaCSSNZaRlqkgYvS2ySr9Encgl+T4grnjYanm/mauX
         gOuq44ffUDfYfgRbcIkGbgmBPbq+tduaSBLAabG9nZjFtlogwbiD6sI+k72vkAWj1zFK
         /BLj8ol5oeo5ZSd67QolumW1DPjl74VeMFLi9+Oyf/sa8lujQVDqXK27TdBbPp2I01DR
         fT8f9L4GTrSXfAC1ZRmPc2mfmpVxfMMlk10VjzgzM9M5MlX7kDb5PaN0GitfScE2a5qz
         2KyOwiOQUS54wq9+jSd79OTU1PXB3fpCvdBRQI2EDYQ7+HpXWv2259KnSsntGC1SYE5e
         hc+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qaLnNpsvt7SC8khaRLTdBh+DWSpXY2mXyTnplQmZGLk=;
        b=Sbr5FQ1qU9+3Xs+xpbR95LKoReYP/LL5M3tUEzwAb41sZKVyK6rlqYijYXA9jTG7xk
         IbuLmXp9TmRowusoviSzhWSwsJ97WC9iP0JyXWh4jO333ejz9Kl2p+MbXmZpOgfjfuVX
         4sPDJbws9tY2lgRmCS52bsZLdwlhhR1+hvHDKa9yQyM2Qkh+95eMWuekz0kgKpqUO8J/
         FaTmeLoq7QCXc97oc5pj9wEBYdazOeNQN8pFMfRLmEiCQFKDcPJ+BQQu61ktiPb53PiC
         J12O3lRzO0JTrcdMwnSLvufhgkYYzgw3/2w31zgWmytIEQXEvJ97yWfR/uE2/xVpyK56
         JIdg==
X-Gm-Message-State: AOAM531BP0SFYqr3iPuAi1zxPElZf4XE2XBoM55kI2l9ljV1u2n3vCT2
        CoYoJT7D3wNeIlbe7mJpdqmV9Q==
X-Google-Smtp-Source: ABdhPJwxTs7sxKFz/ZC8VcgUhG9BDOi+kvY1PGoDH4djuu8F2/ESuu6zILZhuQpbgxsAt5rDYrq7xQ==
X-Received: by 2002:a50:d4ce:: with SMTP id e14mr6934674edj.126.1601128539226;
        Sat, 26 Sep 2020 06:55:39 -0700 (PDT)
Received: from localhost.localdomain ([2a00:ee2:4b0d:3001:fbc5:498b:ed6d:cfac])
        by smtp.gmail.com with ESMTPSA id oq8sm4165700ejb.32.2020.09.26.06.55.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2020 06:55:38 -0700 (PDT)
From:   Luka Kovacic <luka.kovacic@sartura.hr>
To:     linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-leds@vger.kernel.org
Cc:     lee.jones@linaro.org, pavel@ucw.cz, dmurphy@ti.com,
        robh+dt@kernel.org, jdelvare@suse.com, linux@roeck-us.net,
        andrew@lunn.ch, jason@lakedaemon.net, gregory.clement@bootlin.com,
        luka.perkov@sartura.hr, robert.marko@sartura.hr,
        Luka Kovacic <luka.kovacic@sartura.hr>
Subject: [PATCH v2 2/7] drivers: mfd: Add a driver for iEi WT61P803 PUZZLE MCU
Date:   Sat, 26 Sep 2020 15:55:09 +0200
Message-Id: <20200926135514.26189-3-luka.kovacic@sartura.hr>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200926135514.26189-1-luka.kovacic@sartura.hr>
References: <20200926135514.26189-1-luka.kovacic@sartura.hr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Add a driver for the iEi WT61P803 PUZZLE microcontroller, used in some
iEi Puzzle series devices. The microcontroller controls system power,
temperature sensors, fans and LEDs.

This driver implements the core functionality for device communication
over the system serial (serdev bus). It handles MCU messages and the
internal MCU properties. Some properties can be managed over sysfs.

Signed-off-by: Luka Kovacic <luka.kovacic@sartura.hr>
Cc: Luka Perkov <luka.perkov@sartura.hr>
Cc: Robert Marko <robert.marko@sartura.hr>
---
 drivers/mfd/Kconfig                     |    8 +
 drivers/mfd/Makefile                    |    1 +
 drivers/mfd/iei-wt61p803-puzzle.c       | 1069 +++++++++++++++++++++++
 include/linux/mfd/iei-wt61p803-puzzle.h |   69 ++
 4 files changed, 1147 insertions(+)
 create mode 100644 drivers/mfd/iei-wt61p803-puzzle.c
 create mode 100644 include/linux/mfd/iei-wt61p803-puzzle.h

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index 33df0837ab41..b1588845894e 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -2118,5 +2118,13 @@ config SGI_MFD_IOC3
 	  If you have an SGI Origin, Octane, or a PCI IOC3 card,
 	  then say Y. Otherwise say N.
 
+config MFD_IEI_WT61P803_PUZZLE
+	tristate "iEi WT61P803 PUZZLE MCU driver"
+	depends on SERIAL_DEV_BUS
+	help
+	  iEi WT61P803 PUZZLE is a system power management microcontroller
+	  used for fan control, temperature sensor reading, LED control
+	  and system identification.
+
 endmenu
 endif
diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
index a60e5f835283..33b88023a68d 100644
--- a/drivers/mfd/Makefile
+++ b/drivers/mfd/Makefile
@@ -236,6 +236,7 @@ obj-$(CONFIG_MFD_HI655X_PMIC)   += hi655x-pmic.o
 obj-$(CONFIG_MFD_DLN2)		+= dln2.o
 obj-$(CONFIG_MFD_RT5033)	+= rt5033.o
 obj-$(CONFIG_MFD_SKY81452)	+= sky81452.o
+obj-$(CONFIG_MFD_IEI_WT61P803_PUZZLE)	+= iei-wt61p803-puzzle.o
 
 intel-soc-pmic-objs		:= intel_soc_pmic_core.o intel_soc_pmic_crc.o
 obj-$(CONFIG_INTEL_SOC_PMIC)	+= intel-soc-pmic.o
diff --git a/drivers/mfd/iei-wt61p803-puzzle.c b/drivers/mfd/iei-wt61p803-puzzle.c
new file mode 100644
index 000000000000..5cba010ac9b9
--- /dev/null
+++ b/drivers/mfd/iei-wt61p803-puzzle.c
@@ -0,0 +1,1069 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/* iEi WT61P803 PUZZLE MCU Driver
+ * System management microcontroller for fan control, temperature sensor reading,
+ * LED control and system identification on iEi Puzzle series ARM-based appliances.
+ *
+ * Copyright (C) 2020 Sartura Ltd.
+ * Author: Luka Kovacic <luka.kovacic@sartura.hr>
+ */
+
+#include <asm/unaligned.h>
+#include <linux/atomic.h>
+#include <linux/delay.h>
+#include <linux/delay.h>
+#include <linux/export.h>
+#include <linux/init.h>
+#include <linux/kernel.h>
+#include <linux/mfd/iei-wt61p803-puzzle.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/property.h>
+#include <linux/sched.h>
+#include <linux/serdev.h>
+#include <linux/slab.h>
+#include <linux/sysfs.h>
+
+#define IEI_WT61P803_PUZZLE_MAX_COMMAND_LENGTH	(20 + 2)
+#define IEI_WT61P803_PUZZLE_RESP_BUF_SIZE	512
+
+/* Use HZ as a timeout value throughout the driver */
+#define IEI_WT61P803_PUZZLE_GENERAL_TIMEOUT HZ
+
+/**
+ * struct iei_wt61p803_puzzle_mcu_status - MCU flags state
+ *
+ * @ac_recovery_status_flag:	AC Recovery Status Flag
+ * @power_loss_recovery:	System recovery after power loss
+ * @power_status:		System Power-on Method
+ */
+struct iei_wt61p803_puzzle_mcu_status {
+	u8 ac_recovery_status_flag;
+	u8 power_loss_recovery;
+	u8 power_status;
+};
+
+/**
+ * enum iei_wt61p803_puzzle_reply_state - State of the reply
+ * @FRAME_OK:		The frame was completely processed/received
+ * @FRAME_PROCESSING:	First bytes were received, but the frame isn't complete
+ * @FRAME_STRUCT_EMPTY:	The frame struct is empty, no data was received
+ * @FRAME_TIMEOUT:	The frame processing timed out, communication failed
+ *
+ * Describes the general state of the frame that is currently being received.
+ */
+enum iei_wt61p803_puzzle_reply_state {
+	FRAME_OK = 0x00,
+	FRAME_PROCESSING = 0x01,
+	FRAME_STRUCT_EMPTY = 0xFF,
+	FRAME_TIMEOUT = 0xFE
+};
+
+/**
+ * struct iei_wt61p803_puzzle_reply - MCU reply
+ *
+ * @size:	Size of the MCU reply
+ * @data:	Full MCU reply buffer
+ * @state:	Current state of the packet
+ * @received:	Was the response fullfilled
+ */
+struct iei_wt61p803_puzzle_reply {
+	size_t size;
+	unsigned char *data;
+	u8 state;
+	struct completion received;
+};
+
+/**
+ * struct iei_wt61p803_puzzle_mcu_version - MCU version status
+ *
+ * @version:		Primary firmware version
+ * @build_info:		Build date and time
+ * @bootloader_mode:	Status of the MCU operation
+ * @protocol_version:	MCU communication protocol version
+ * @serial_number:	Device factory serial number
+ * @mac_address:	Device factory MAC addresses
+ */
+struct iei_wt61p803_puzzle_mcu_version {
+	const char *version;
+	const char *build_info;
+	bool bootloader_mode;
+	const char *protocol_version;
+	const char *serial_number;
+	const char *mac_address[8];
+};
+
+/**
+ * struct iei_wt61p803_puzzle - iEi WT61P803 PUZZLE MCU Driver
+ *
+ * @serdev:		Pointer to underlying serdev device
+ * @kobj:		Pointer to kobject (sysfs)
+ * @reply_lock:		Reply mutex lock
+ * @bus_lock:		Bus mutex lock
+ * @reply:		Pointer to the iei_wt61p803_puzzle_reply struct
+ * @version:		MCU version related data
+ * @status:		MCU status related data
+ * @response_buffer	Command response buffer allocation
+ * @lock		General member mutex lock
+ */
+struct iei_wt61p803_puzzle {
+	struct serdev_device *serdev;
+	struct kobject *kobj;
+	struct mutex reply_lock;
+	struct mutex bus_lock;
+	struct iei_wt61p803_puzzle_reply *reply;
+	struct iei_wt61p803_puzzle_mcu_version version;
+	struct iei_wt61p803_puzzle_mcu_status status;
+	unsigned char *response_buffer;
+	struct mutex lock;
+};
+
+unsigned char iei_wt61p803_puzzle_checksum(unsigned char *buf, size_t len)
+{
+	unsigned char checksum = 0;
+	unsigned int i;
+
+	for (i = 0; i < len; i++)
+		checksum ^= buf[i];
+
+	return checksum;
+}
+
+static int iei_wt61p803_puzzle_process_resp(struct iei_wt61p803_puzzle *mcu,
+		unsigned char *raw_resp_data, size_t size)
+{
+	struct device *dev = &mcu->serdev->dev;
+
+	unsigned char checksum;
+
+	mutex_lock(&mcu->reply_lock);
+
+	/* Check the incoming frame header */
+	if (!(raw_resp_data[0] == IEI_WT61P803_PUZZLE_CMD_HEADER_START ||
+		raw_resp_data[0] == IEI_WT61P803_PUZZLE_CMD_HEADER_START_OTHER ||
+		(raw_resp_data[0] == IEI_WT61P803_PUZZLE_CMD_HEADER_EEPROM &&
+		 raw_resp_data[1] == IEI_WT61P803_PUZZLE_CMD_EEPROM_READ))) {
+
+		/* Frame header is not correct, check whether to append */
+		if (mcu->reply->state != FRAME_PROCESSING) {
+			dev_err(dev, "Invalid frame header and state (0x%x)", mcu->reply->state);
+			mutex_unlock(&mcu->reply_lock);
+			return -EIO;
+		}
+
+		/* Append the frame to existing data */
+		memcpy(mcu->reply->data+mcu->reply->size, raw_resp_data, size);
+		mcu->reply->size += size;
+	} else {
+		/* Start processing a new frame */
+		memcpy(mcu->reply->data, raw_resp_data, size);
+		mcu->reply->size = size;
+		mcu->reply->state = FRAME_PROCESSING;
+	}
+
+	checksum = iei_wt61p803_puzzle_checksum(mcu->reply->data, mcu->reply->size-1);
+
+	if (checksum != mcu->reply->data[mcu->reply->size-1]) {
+		/* The checksum isn't matched yet, wait for new frames */
+		mutex_unlock(&mcu->reply_lock);
+		return (int)size;
+	}
+
+	/* Received all the data */
+	mcu->reply->state = FRAME_OK;
+	complete(&mcu->reply->received);
+
+	mutex_unlock(&mcu->reply_lock);
+
+	return (int)size;
+}
+
+static int iei_wt61p803_puzzle_recv_buf(struct serdev_device *serdev,
+		const unsigned char *data, size_t size)
+{
+	struct iei_wt61p803_puzzle *mcu = serdev_device_get_drvdata(serdev);
+	int ret;
+
+	ret = iei_wt61p803_puzzle_process_resp(mcu, (unsigned char *)data, size);
+
+	/* Return the number of processed bytes if function returns error */
+	if (ret < 0)
+		return (int)size;
+
+	return ret;
+}
+
+static const struct serdev_device_ops iei_wt61p803_puzzle_serdev_device_ops = {
+	.receive_buf  = iei_wt61p803_puzzle_recv_buf,
+	.write_wakeup = serdev_device_write_wakeup,
+};
+
+/**
+ * iei_wt61p803_puzzle_write_command_watchdog() - Watchdog of the normal cmd
+ * @mcu: Pointer to the iei_wt61p803_puzzle core MFD struct
+ * @cmd: Pointer to the char array to send (size should be content + 1 (xor))
+ * @size: Size of the cmd char array
+ * @reply_data: Pointer to the reply/response data array (should be allocated)
+ * @reply_size: Pointer to size_t (size of reply_data)
+ * @retry_count: Number of times to retry sending the command to the MCU
+ */
+int iei_wt61p803_puzzle_write_command_watchdog(struct iei_wt61p803_puzzle *mcu,
+		unsigned char *cmd, size_t size, unsigned char *reply_data,
+		size_t *reply_size, int retry_count)
+{
+	struct device *dev = &mcu->serdev->dev;
+	int ret, i;
+
+	for (i = 0; i < retry_count; i++) {
+		ret = iei_wt61p803_puzzle_write_command(mcu, cmd, size,
+				reply_data, reply_size);
+
+		if (ret != -ETIMEDOUT)
+			return ret;
+	}
+
+	dev_err(dev, "%s: Command response timed out. Retries: %d", __func__,
+			retry_count);
+
+	return -ETIMEDOUT;
+}
+EXPORT_SYMBOL_GPL(iei_wt61p803_puzzle_write_command_watchdog);
+
+/**
+ * iei_wt61p803_puzzle_write_command() - Send a structured command to the MCU
+ * @mcu: Pointer to the iei_wt61p803_puzzle core MFD struct
+ * @cmd: Pointer to the char array to send (size should be content + 1 (xor))
+ * @size: Size of the cmd char array
+ * @reply_data: Pointer to the reply/response data array (should be allocated)
+ *
+ * Sends a structured command to the MCU.
+ */
+int iei_wt61p803_puzzle_write_command(struct iei_wt61p803_puzzle *mcu,
+		unsigned char *cmd, size_t size, unsigned char *reply_data,
+		size_t *reply_size)
+{
+	struct device *dev = &mcu->serdev->dev;
+	int ret;
+	int len = (int)size;
+
+	if (size > IEI_WT61P803_PUZZLE_MAX_COMMAND_LENGTH)
+		return -EINVAL;
+
+	cmd[len - 1] = iei_wt61p803_puzzle_checksum(cmd, size);
+
+	mutex_lock(&mcu->bus_lock);
+	mutex_lock(&mcu->reply_lock);
+
+	if (!mcu->reply) {
+		ret = -EFAULT;
+		goto exit;
+	}
+
+	/* Initialize reply struct */
+	reinit_completion(&mcu->reply->received);
+	mcu->reply->state = FRAME_STRUCT_EMPTY;
+	mcu->reply->size = 0;
+	mutex_unlock(&mcu->reply_lock);
+
+	ret = serdev_device_write(mcu->serdev, cmd, len, IEI_WT61P803_PUZZLE_GENERAL_TIMEOUT);
+
+	if (ret < 0) {
+		mutex_unlock(&mcu->bus_lock);
+		return ret;
+	}
+
+	if (!wait_for_completion_timeout(&mcu->reply->received,
+				IEI_WT61P803_PUZZLE_GENERAL_TIMEOUT)) {
+		dev_err(dev, "Command reply receive timeout\n");
+		mutex_lock(&mcu->reply_lock);
+		reinit_completion(&mcu->reply->received);
+		mcu->reply->state = FRAME_TIMEOUT;
+
+		ret = -ETIMEDOUT;
+		goto exit;
+	}
+
+	mutex_lock(&mcu->reply_lock);
+
+	if (!mcu->reply) {
+		ret = -EFAULT;
+		goto exit;
+	}
+
+	*reply_size = mcu->reply->size;
+	/* Copy the received data, as it will not be available after a new frame is received */
+	memcpy(reply_data, mcu->reply->data, mcu->reply->size);
+
+	ret = 0;
+exit:
+	mutex_unlock(&mcu->reply_lock);
+	mutex_unlock(&mcu->bus_lock);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(iei_wt61p803_puzzle_write_command);
+
+int iei_wt61p803_puzzle_buzzer(struct iei_wt61p803_puzzle *mcu, bool long_beep)
+{
+	unsigned char buzzer_short_cmd[4] = {
+		IEI_WT61P803_PUZZLE_CMD_HEADER_START,
+		IEI_WT61P803_PUZZLE_CMD_FUNCTION_SINGLE,
+		'2'
+	}; /* Buzzer 0.5 sec */
+	unsigned char buzzer_long_cmd[4] = {
+		IEI_WT61P803_PUZZLE_CMD_HEADER_START,
+		IEI_WT61P803_PUZZLE_CMD_FUNCTION_SINGLE,
+		'3'
+	}; /* Buzzer 1.5 sec */
+	unsigned char *resp_buf = mcu->response_buffer;
+	size_t reply_size = 0;
+	int ret;
+
+	mutex_lock(&mcu->lock);
+	ret = iei_wt61p803_puzzle_write_command(mcu,
+			long_beep ? buzzer_long_cmd : buzzer_short_cmd, 4,
+			resp_buf, &reply_size);
+	if (ret)
+		goto exit;
+
+	if (reply_size != 3) {
+		ret = -EIO;
+		goto exit;
+	}
+
+	if (!(resp_buf[0] == IEI_WT61P803_PUZZLE_CMD_HEADER_START &&
+			resp_buf[1] == IEI_WT61P803_PUZZLE_CMD_RESPONSE_OK &&
+			resp_buf[2] == IEI_WT61P803_PUZZLE_CHECKSUM_RESPONSE_OK)) {
+		ret = -EPROTO;
+		goto exit;
+	}
+exit:
+	mutex_unlock(&mcu->lock);
+	return ret;
+}
+
+int iei_wt61p803_puzzle_get_version(struct iei_wt61p803_puzzle *mcu)
+{
+	struct device *dev = &mcu->serdev->dev;
+	unsigned char version_cmd[3] = {
+		IEI_WT61P803_PUZZLE_CMD_HEADER_START_OTHER,
+		IEI_WT61P803_PUZZLE_CMD_OTHER_VERSION
+	};
+	unsigned char build_info_cmd[3] = {
+		IEI_WT61P803_PUZZLE_CMD_HEADER_START_OTHER,
+		IEI_WT61P803_PUZZLE_CMD_OTHER_BUILD
+	};
+	unsigned char bootloader_mode_cmd[3] = {
+		IEI_WT61P803_PUZZLE_CMD_HEADER_START_OTHER,
+		IEI_WT61P803_PUZZLE_CMD_OTHER_BOOTLOADER_MODE
+	};
+	unsigned char protocol_version_cmd[3] = {
+		IEI_WT61P803_PUZZLE_CMD_HEADER_START_OTHER,
+		IEI_WT61P803_PUZZLE_CMD_OTHER_PROTOCOL_VERSION
+	};
+	unsigned char *rb = mcu->response_buffer;
+	size_t reply_size = 0;
+	int ret;
+
+	mutex_lock(&mcu->lock);
+
+	ret = iei_wt61p803_puzzle_write_command(mcu, version_cmd,
+			sizeof(version_cmd), rb, &reply_size);
+	if (ret)
+		goto err;
+	if (reply_size < 7) {
+		ret = -EIO;
+		goto err;
+	}
+	mcu->version.version = devm_kasprintf(dev, GFP_KERNEL, "v%c.%c%c%c",
+				rb[2], rb[3], rb[4], rb[5]);
+
+	ret = iei_wt61p803_puzzle_write_command(mcu, build_info_cmd,
+			sizeof(build_info_cmd), rb, &reply_size);
+	if (ret)
+		goto err;
+	if (reply_size < 15) {
+		ret = -EIO;
+		goto err;
+	}
+	mcu->version.build_info = devm_kasprintf(dev, GFP_KERNEL,
+			"%c%c/%c%c/%c%c%c%c %c%c:%c%c",
+			rb[8], rb[9], rb[6], rb[7], rb[2],
+			rb[3], rb[4], rb[5], rb[10], rb[11],
+			rb[12], rb[13]);
+
+	ret = iei_wt61p803_puzzle_write_command(mcu, bootloader_mode_cmd,
+			sizeof(bootloader_mode_cmd), rb, &reply_size);
+	if (ret)
+		goto err;
+	if (reply_size < 4) {
+		ret = -EIO;
+		goto err;
+	}
+	if (rb[2] == IEI_WT61P803_PUZZLE_CMD_OTHER_MODE_APPS)
+		mcu->version.bootloader_mode = false;
+	else if (rb[2] == IEI_WT61P803_PUZZLE_CMD_OTHER_MODE_BOOTLOADER)
+		mcu->version.bootloader_mode = true;
+
+	ret = iei_wt61p803_puzzle_write_command(mcu, protocol_version_cmd,
+			sizeof(protocol_version_cmd), rb, &reply_size);
+	if (ret)
+		goto err;
+	if (reply_size < 9) {
+		ret = -EIO;
+		goto err;
+	}
+	mcu->version.protocol_version = devm_kasprintf(dev, GFP_KERNEL,
+			"v%c.%c%c%c%c%c",
+			rb[7], rb[6], rb[5], rb[4], rb[3], rb[2]);
+err:
+	mutex_unlock(&mcu->lock);
+	return ret;
+}
+
+int iei_wt61p803_puzzle_get_mcu_status(struct iei_wt61p803_puzzle *mcu)
+{
+	unsigned char mcu_status_cmd[5] = {
+		IEI_WT61P803_PUZZLE_CMD_HEADER_START,
+		IEI_WT61P803_PUZZLE_CMD_FUNCTION_OTHER,
+		IEI_WT61P803_PUZZLE_CMD_FUNCTION_OTHER_STATUS,
+		IEI_WT61P803_PUZZLE_CMD_FUNCTION_OTHER_STATUS
+	};
+	unsigned char *resp_buf = mcu->response_buffer;
+	size_t reply_size = 0;
+	int ret;
+
+	mutex_lock(&mcu->lock);
+	ret = iei_wt61p803_puzzle_write_command(mcu, mcu_status_cmd,
+			sizeof(mcu_status_cmd), resp_buf, &reply_size);
+	if (ret)
+		goto exit;
+	if (reply_size < 20) {
+		ret = -EIO;
+		goto exit;
+	}
+
+	/* Response format:
+	 * (IDX	RESPONSE)
+	 * 0	@
+	 * 1	O
+	 * 2	S
+	 * 3	S
+	 * ...
+	 * 5	AC Recovery Status Flag
+	 * ...
+	 * 10	Power Loss Recovery
+	 * ...
+	 * 19	Power Status (system power on method)
+	 * 20	XOR checksum
+	 */
+	if (resp_buf[0] == IEI_WT61P803_PUZZLE_CMD_HEADER_START &&
+			resp_buf[1] == IEI_WT61P803_PUZZLE_CMD_FUNCTION_OTHER &&
+			resp_buf[2] == IEI_WT61P803_PUZZLE_CMD_FUNCTION_OTHER_STATUS &&
+			resp_buf[3] == IEI_WT61P803_PUZZLE_CMD_FUNCTION_OTHER_STATUS) {
+		mcu->status.ac_recovery_status_flag = resp_buf[5];
+		mcu->status.power_loss_recovery = resp_buf[10];
+		mcu->status.power_status = resp_buf[19];
+	}
+exit:
+	mutex_unlock(&mcu->lock);
+	return ret;
+}
+
+int iei_wt61p803_puzzle_get_serial_number(struct iei_wt61p803_puzzle *mcu)
+{
+	struct device *dev = &mcu->serdev->dev;
+	unsigned char serial_number_cmd[5] = {
+		IEI_WT61P803_PUZZLE_CMD_HEADER_EEPROM,
+		IEI_WT61P803_PUZZLE_CMD_EEPROM_READ,
+		0x00,
+		0x24
+	};
+	unsigned char *resp_buf = mcu->response_buffer;
+	size_t reply_size = 0;
+	int ret;
+
+	mutex_lock(&mcu->lock);
+	ret = iei_wt61p803_puzzle_write_command(mcu, serial_number_cmd,
+			sizeof(serial_number_cmd), resp_buf, &reply_size);
+	if (ret)
+		goto err;
+
+	mcu->version.serial_number = devm_kasprintf(dev, GFP_KERNEL, "%.*s",
+			(int)reply_size - 5, resp_buf + 4);
+err:
+	mutex_unlock(&mcu->lock);
+	return ret;
+
+}
+
+int iei_wt61p803_puzzle_write_serial_number(struct iei_wt61p803_puzzle *mcu,
+		unsigned char serial_number[36])
+{
+	struct device *dev = &mcu->serdev->dev;
+	unsigned char serial_number_header[4] = {
+		IEI_WT61P803_PUZZLE_CMD_HEADER_EEPROM,
+		IEI_WT61P803_PUZZLE_CMD_EEPROM_WRITE,
+		0x00,
+		0xC
+	};
+	unsigned char *resp_buf = mcu->response_buffer;
+	unsigned char serial_number_cmd[4+12+1]; /* header, serial number chunk, XOR checksum */
+	int ret, sn_counter;
+	size_t reply_size = 0;
+
+	/* The MCU can only handle 22 byte messages, send the S/N in chunks */
+	mutex_lock(&mcu->lock);
+	for (sn_counter = 0; sn_counter < 3; sn_counter++) {
+		serial_number_header[2] = 0x0 + (0xC) * sn_counter;
+
+		memcpy(serial_number_cmd, serial_number_header, 4);
+		memcpy(serial_number_cmd + 4, serial_number + (0xC) * sn_counter, 0xC);
+
+		serial_number_cmd[sizeof(serial_number_cmd) - 1] = 0;
+
+		ret = iei_wt61p803_puzzle_write_command(mcu, serial_number_cmd,
+				sizeof(serial_number_cmd), resp_buf, &reply_size);
+		if (ret)
+			goto err;
+		if (reply_size != 3) {
+			ret = -EIO;
+			goto err;
+		}
+		if (!(resp_buf[0] == IEI_WT61P803_PUZZLE_CMD_HEADER_START &&
+				resp_buf[1] == IEI_WT61P803_PUZZLE_CMD_RESPONSE_OK &&
+				resp_buf[2] == IEI_WT61P803_PUZZLE_CHECKSUM_RESPONSE_OK)) {
+			ret = -EPROTO;
+			goto err;
+		}
+	}
+
+	mcu->version.serial_number = devm_kasprintf(dev, GFP_KERNEL, "%.*s",
+			36, serial_number);
+err:
+	mutex_unlock(&mcu->lock);
+	return ret;
+}
+
+int iei_wt61p803_puzzle_get_mac_addresses(struct iei_wt61p803_puzzle *mcu)
+{
+	struct device *dev = &mcu->serdev->dev;
+	unsigned char mac_address_cmd[5] = {
+		IEI_WT61P803_PUZZLE_CMD_HEADER_EEPROM,
+		IEI_WT61P803_PUZZLE_CMD_EEPROM_READ,
+		0x00,
+		0x11
+	};
+	unsigned char *resp_buf = mcu->response_buffer;
+	int ret, mac_counter;
+	size_t reply_size = 0;
+
+	mutex_lock(&mcu->lock);
+	for (mac_counter = 0; mac_counter < 8; mac_counter++) {
+		mac_address_cmd[2] = 0x24 + (0x11) * mac_counter;
+		mac_address_cmd[4] = 0x00;
+
+		ret = iei_wt61p803_puzzle_write_command(mcu, mac_address_cmd,
+				sizeof(mac_address_cmd), resp_buf, &reply_size);
+		if (ret)
+			continue;
+
+		if (reply_size < 22) {
+			ret = -EIO;
+			goto err;
+		}
+
+		mcu->version.mac_address[mac_counter] = devm_kasprintf(dev,
+				GFP_KERNEL, "%.*s", (int)reply_size - 5,
+				resp_buf + 4);
+	}
+err:
+	mutex_unlock(&mcu->lock);
+	return ret;
+}
+
+int iei_wt61p803_puzzle_write_mac_address(struct iei_wt61p803_puzzle *mcu,
+		unsigned char mac_address[17], int mac_address_idx)
+{
+	struct device *dev = &mcu->serdev->dev;
+	unsigned char mac_address_header[4] = {
+		IEI_WT61P803_PUZZLE_CMD_HEADER_EEPROM,
+		IEI_WT61P803_PUZZLE_CMD_EEPROM_WRITE,
+		0x00,
+		0x11
+	};
+	unsigned char mac_address_cmd[4+17+1]; /* header, MAC address, XOR checksum*/
+	unsigned char *resp_buf = mcu->response_buffer;
+	size_t reply_size = 0;
+	int ret;
+
+	if (!(mac_address_idx < 8))
+		return -EINVAL;
+
+	mac_address_header[2] = 0x24 + (0x11) * mac_address_idx;
+
+	/* Concat mac_address_header, mac_address to mac_address_cmd */
+	memcpy(mac_address_cmd, mac_address_header, 4);
+	memcpy(mac_address_cmd + 4, mac_address, 17);
+
+	mac_address_cmd[sizeof(mac_address_cmd) - 1] = 0;
+
+	mutex_lock(&mcu->lock);
+	ret = iei_wt61p803_puzzle_write_command(mcu, mac_address_cmd,
+			sizeof(mac_address_cmd), resp_buf, &reply_size);
+	if (ret)
+		goto err;
+	if (reply_size != 3) {
+		ret = -EIO;
+		goto err;
+	}
+	if (!(resp_buf[0] == IEI_WT61P803_PUZZLE_CMD_HEADER_START &&
+				resp_buf[1] == IEI_WT61P803_PUZZLE_CMD_RESPONSE_OK &&
+				resp_buf[2] == IEI_WT61P803_PUZZLE_CHECKSUM_RESPONSE_OK)) {
+		ret = -EPROTO;
+		goto err;
+	}
+
+	mcu->version.mac_address[mac_address_idx] = devm_kasprintf(dev,
+			GFP_KERNEL, "%.*s", 17, mac_address);
+err:
+	mutex_unlock(&mcu->lock);
+	return ret;
+}
+
+int iei_wt61p803_puzzle_write_power_loss_recovery(struct iei_wt61p803_puzzle *mcu,
+		int power_loss_recovery_action)
+{
+	unsigned char power_loss_recovery_cmd[5] = {
+		IEI_WT61P803_PUZZLE_CMD_HEADER_START,
+		IEI_WT61P803_PUZZLE_CMD_FUNCTION_OTHER,
+		IEI_WT61P803_PUZZLE_CMD_FUNCTION_OTHER_POWER_LOSS,
+		'0'
+	};
+	unsigned char *resp_buf = mcu->response_buffer;
+	size_t reply_size = 0;
+	unsigned char cmd_buf[2];
+	int ret;
+
+	if (power_loss_recovery_action < 0 || power_loss_recovery_action > 4)
+		return -EINVAL;
+
+	ret = snprintf(cmd_buf, sizeof(cmd_buf), "%d", power_loss_recovery_action);
+	if (ret < 0)
+		return ret;
+
+	/* Modify the command with the action index */
+	power_loss_recovery_cmd[3] = cmd_buf[0];
+
+	mutex_lock(&mcu->lock);
+	ret = iei_wt61p803_puzzle_write_command(mcu, power_loss_recovery_cmd,
+			sizeof(power_loss_recovery_cmd), resp_buf, &reply_size);
+	if (ret)
+		goto exit;
+	mcu->status.power_loss_recovery = power_loss_recovery_action;
+exit:
+	mutex_unlock(&mcu->lock);
+	return ret;
+}
+
+#define sysfs_container(dev) \
+	(container_of((dev)->kobj.parent, struct device, kobj))
+
+static ssize_t version_show(struct device *dev,
+		struct device_attribute *attr, char *buf)
+{
+	struct device *dev_container = sysfs_container(dev);
+	struct iei_wt61p803_puzzle *mcu = dev_get_drvdata(dev_container);
+
+	return sprintf(buf, "%s\n", mcu->version.version);
+}
+static DEVICE_ATTR_RO(version);
+
+static ssize_t build_info_show(struct device *dev,
+	struct device_attribute *attr, char *buf)
+{
+	struct device *dev_container = sysfs_container(dev);
+	struct iei_wt61p803_puzzle *mcu = dev_get_drvdata(dev_container);
+
+	return sprintf(buf, "%s\n", mcu->version.build_info);
+}
+static DEVICE_ATTR_RO(build_info);
+
+static ssize_t bootloader_mode_show(struct device *dev,
+	struct device_attribute *attr, char *buf)
+{
+	struct device *dev_container = sysfs_container(dev);
+	struct iei_wt61p803_puzzle *mcu = dev_get_drvdata(dev_container);
+
+	return sprintf(buf, "%d\n", mcu->version.bootloader_mode);
+}
+static DEVICE_ATTR_RO(bootloader_mode);
+
+static ssize_t protocol_version_show(struct device *dev,
+	struct device_attribute *attr, char *buf)
+{
+	struct device *dev_container = sysfs_container(dev);
+	struct iei_wt61p803_puzzle *mcu = dev_get_drvdata(dev_container);
+
+	return sprintf(buf, "%s\n", mcu->version.protocol_version);
+}
+static DEVICE_ATTR_RO(protocol_version);
+
+static ssize_t serial_number_show(struct device *dev,
+	struct device_attribute *attr, char *buf)
+{
+	struct device *dev_container = sysfs_container(dev);
+	struct iei_wt61p803_puzzle *mcu = dev_get_drvdata(dev_container);
+	int ret;
+
+	mutex_lock(&mcu->lock);
+	ret = sprintf(buf, "%s\n", mcu->version.serial_number);
+	mutex_unlock(&mcu->lock);
+
+	return ret;
+}
+static ssize_t serial_number_store(struct device *dev,
+		struct device_attribute *attr,
+		const char *buf, size_t count)
+{
+	struct device *dev_container = sysfs_container(dev);
+	struct iei_wt61p803_puzzle *mcu = dev_get_drvdata(dev_container);
+	unsigned char serial_number[36];
+	int ret;
+
+	/* Check whether the serial number is 36 characters long + null */
+	if ((int)count != 36 + 1)
+		return -EINVAL;
+
+	/* Copy 36 characters from the buffer to serial_number */
+	memcpy(serial_number, (unsigned char *)buf, 36);
+
+	ret = iei_wt61p803_puzzle_write_serial_number(mcu, serial_number);
+	if (ret)
+		return ret;
+
+	return count;
+}
+static DEVICE_ATTR_RW(serial_number);
+
+static ssize_t mac_address_show(struct device *dev,
+	struct device_attribute *attr, char *buf)
+{
+	struct device *dev_container = sysfs_container(dev);
+	struct iei_wt61p803_puzzle *mcu = dev_get_drvdata(dev_container);
+	int ret;
+
+	mutex_lock(&mcu->lock);
+	if (!strcmp(attr->attr.name, "mac_address_0"))
+		ret = sprintf(buf, "%s\n", mcu->version.mac_address[0]);
+	else if (!strcmp(attr->attr.name, "mac_address_1"))
+		ret = sprintf(buf, "%s\n", mcu->version.mac_address[1]);
+	else if (!strcmp(attr->attr.name, "mac_address_2"))
+		ret = sprintf(buf, "%s\n", mcu->version.mac_address[2]);
+	else if (!strcmp(attr->attr.name, "mac_address_3"))
+		ret = sprintf(buf, "%s\n", mcu->version.mac_address[3]);
+	else if (!strcmp(attr->attr.name, "mac_address_4"))
+		ret = sprintf(buf, "%s\n", mcu->version.mac_address[4]);
+	else if (!strcmp(attr->attr.name, "mac_address_5"))
+		ret = sprintf(buf, "%s\n", mcu->version.mac_address[5]);
+	else if (!strcmp(attr->attr.name, "mac_address_6"))
+		ret = sprintf(buf, "%s\n", mcu->version.mac_address[6]);
+	else if (!strcmp(attr->attr.name, "mac_address_7"))
+		ret = sprintf(buf, "%s\n", mcu->version.mac_address[7]);
+	else
+		ret = sprintf(buf, "\n");
+	mutex_unlock(&mcu->lock);
+
+	return ret;
+}
+static ssize_t mac_address_store(struct device *dev,
+		struct device_attribute *attr,
+		const char *buf, size_t count)
+{
+	struct device *dev_container = sysfs_container(dev);
+	struct iei_wt61p803_puzzle *mcu = dev_get_drvdata(dev_container);
+	unsigned char mac_address[17];
+	int ret;
+
+	if ((int)count != 17 + 1)
+		return -EINVAL;
+
+	memcpy(mac_address, (unsigned char *)buf, 17);
+
+	if (!strcmp(attr->attr.name, "mac_address_0"))
+		ret = iei_wt61p803_puzzle_write_mac_address(mcu, mac_address, 0);
+	else if (!strcmp(attr->attr.name, "mac_address_1"))
+		ret = iei_wt61p803_puzzle_write_mac_address(mcu, mac_address, 1);
+	else if (!strcmp(attr->attr.name, "mac_address_2"))
+		ret = iei_wt61p803_puzzle_write_mac_address(mcu, mac_address, 2);
+	else if (!strcmp(attr->attr.name, "mac_address_3"))
+		ret = iei_wt61p803_puzzle_write_mac_address(mcu, mac_address, 3);
+	else if (!strcmp(attr->attr.name, "mac_address_4"))
+		ret = iei_wt61p803_puzzle_write_mac_address(mcu, mac_address, 4);
+	else if (!strcmp(attr->attr.name, "mac_address_5"))
+		ret = iei_wt61p803_puzzle_write_mac_address(mcu, mac_address, 5);
+	else if (!strcmp(attr->attr.name, "mac_address_6"))
+		ret = iei_wt61p803_puzzle_write_mac_address(mcu, mac_address, 6);
+	else if (!strcmp(attr->attr.name, "mac_address_7"))
+		ret = iei_wt61p803_puzzle_write_mac_address(mcu, mac_address, 7);
+	if (ret)
+		return ret;
+
+	return count;
+}
+static DEVICE_ATTR(mac_address_0, 0644, mac_address_show, mac_address_store);
+static DEVICE_ATTR(mac_address_1, 0644, mac_address_show, mac_address_store);
+static DEVICE_ATTR(mac_address_2, 0644, mac_address_show, mac_address_store);
+static DEVICE_ATTR(mac_address_3, 0644, mac_address_show, mac_address_store);
+static DEVICE_ATTR(mac_address_4, 0644, mac_address_show, mac_address_store);
+static DEVICE_ATTR(mac_address_5, 0644, mac_address_show, mac_address_store);
+static DEVICE_ATTR(mac_address_6, 0644, mac_address_show, mac_address_store);
+static DEVICE_ATTR(mac_address_7, 0644, mac_address_show, mac_address_store);
+
+static ssize_t ac_recovery_status_show(struct device *dev,
+	struct device_attribute *attr, char *buf)
+{
+	struct device *dev_container = sysfs_container(dev);
+	struct iei_wt61p803_puzzle *mcu = dev_get_drvdata(dev_container);
+
+	int ret;
+
+	ret = iei_wt61p803_puzzle_get_mcu_status(mcu);
+	if (ret)
+		return ret;
+
+	mutex_lock(&mcu->lock);
+	ret = sprintf(buf, "%x\n", mcu->status.ac_recovery_status_flag);
+	mutex_unlock(&mcu->lock);
+
+	return ret;
+}
+static DEVICE_ATTR_RO(ac_recovery_status);
+
+static ssize_t power_loss_recovery_show(struct device *dev,
+	struct device_attribute *attr, char *buf)
+{
+	struct device *dev_container = sysfs_container(dev);
+	struct iei_wt61p803_puzzle *mcu = dev_get_drvdata(dev_container);
+
+	int ret;
+
+	ret = iei_wt61p803_puzzle_get_mcu_status(mcu);
+	if (ret)
+		return ret;
+
+	mutex_lock(&mcu->lock);
+	ret = sprintf(buf, "%x\n", mcu->status.power_loss_recovery);
+	mutex_unlock(&mcu->lock);
+
+	return ret;
+}
+static ssize_t power_loss_recovery_store(struct device *dev,
+		struct device_attribute *attr,
+		const char *buf, size_t count)
+{
+	struct device *dev_container = sysfs_container(dev);
+	struct iei_wt61p803_puzzle *mcu = dev_get_drvdata(dev_container);
+
+	int ret;
+	long power_loss_recovery_action = 0;
+
+	ret = kstrtol(buf, 10, &power_loss_recovery_action);
+	if (ret)
+		return ret;
+
+	ret = iei_wt61p803_puzzle_write_power_loss_recovery(mcu,
+			(int)power_loss_recovery_action);
+	if (ret)
+		return ret;
+
+	return count;
+}
+static DEVICE_ATTR_RW(power_loss_recovery);
+
+static ssize_t power_status_show(struct device *dev,
+	struct device_attribute *attr, char *buf)
+{
+	struct device *dev_container = sysfs_container(dev);
+	struct iei_wt61p803_puzzle *mcu = dev_get_drvdata(dev_container);
+
+	int ret;
+
+	ret = iei_wt61p803_puzzle_get_mcu_status(mcu);
+	if (ret)
+		return ret;
+
+	mutex_lock(&mcu->lock);
+	ret = sprintf(buf, "%x\n", mcu->status.power_status);
+	mutex_unlock(&mcu->lock);
+
+	return ret;
+}
+static DEVICE_ATTR_RO(power_status);
+
+static struct attribute *iei_wt61p803_puzzle_attrs[] = {
+	&dev_attr_version.attr,
+	&dev_attr_build_info.attr,
+	&dev_attr_bootloader_mode.attr,
+	&dev_attr_protocol_version.attr,
+	&dev_attr_serial_number.attr,
+	&dev_attr_mac_address_0.attr,
+	&dev_attr_mac_address_1.attr,
+	&dev_attr_mac_address_2.attr,
+	&dev_attr_mac_address_3.attr,
+	&dev_attr_mac_address_4.attr,
+	&dev_attr_mac_address_5.attr,
+	&dev_attr_mac_address_6.attr,
+	&dev_attr_mac_address_7.attr,
+	&dev_attr_ac_recovery_status.attr,
+	&dev_attr_power_loss_recovery.attr,
+	&dev_attr_power_status.attr,
+	NULL
+};
+ATTRIBUTE_GROUPS(iei_wt61p803_puzzle);
+
+static int iei_wt61p803_puzzle_sysfs_create(struct device *dev,
+		struct iei_wt61p803_puzzle *mcu)
+{
+	int ret;
+
+	mcu->kobj = kobject_create_and_add("iei_wt61p803_puzzle_core", &dev->kobj);
+	if (!mcu->kobj)
+		return -ENOMEM;
+
+	ret = sysfs_create_groups(mcu->kobj, iei_wt61p803_puzzle_groups);
+	if (ret) {
+		kobject_del(mcu->kobj);
+		kobject_put(mcu->kobj);
+		mcu->kobj = NULL;
+	}
+
+	return ret;
+}
+
+static int iei_wt61p803_puzzle_sysfs_remove(struct device *dev,
+		struct iei_wt61p803_puzzle *mcu)
+{
+	/* Remove sysfs groups */
+	sysfs_remove_groups(mcu->kobj, iei_wt61p803_puzzle_groups);
+
+	/* Remove the kobject */
+	kobject_del(mcu->kobj);
+	kobject_put(mcu->kobj);
+	mcu->kobj = NULL;
+
+	return 0;
+}
+
+static int iei_wt61p803_puzzle_probe(struct serdev_device *serdev)
+{
+	struct device *dev = &serdev->dev;
+	struct iei_wt61p803_puzzle *mcu;
+	u32 baud;
+	int ret;
+
+	/* Read the baud rate from 'current-speed', because the MCU supports different rates */
+	if (device_property_read_u32(dev, "current-speed", &baud)) {
+		dev_err(dev,
+			"'current-speed' is not specified in device node\n");
+		return -EINVAL;
+	}
+	dev_info(dev, "Driver baud rate: %d", baud);
+
+	/* Allocate the memory */
+	mcu = devm_kzalloc(dev, sizeof(*mcu), GFP_KERNEL);
+	if (!mcu)
+		return -ENOMEM;
+
+	mcu->reply = devm_kzalloc(dev, sizeof(*mcu->reply), GFP_KERNEL);
+	if (!mcu->reply)
+		return -ENOMEM;
+
+	mcu->reply->data = devm_kzalloc(dev, IEI_WT61P803_PUZZLE_RESP_BUF_SIZE,
+			GFP_KERNEL);
+	if (!mcu->reply->data)
+		return -ENOMEM;
+
+	mcu->response_buffer = devm_kzalloc(dev, IEI_WT61P803_PUZZLE_BUF_SIZE,
+			GFP_KERNEL);
+	if (!mcu->response_buffer)
+		return -ENOMEM;
+
+	/* Initialize device struct data */
+	mcu->serdev = serdev;
+	init_completion(&mcu->reply->received);
+	mutex_init(&mcu->reply_lock);
+	mutex_init(&mcu->bus_lock);
+	mutex_init(&mcu->lock);
+
+	/* Setup UART interface */
+	serdev_device_set_drvdata(serdev, mcu);
+	serdev_device_set_client_ops(serdev, &iei_wt61p803_puzzle_serdev_device_ops);
+	ret = devm_serdev_device_open(dev, serdev);
+	if (ret)
+		return ret;
+	serdev_device_set_baudrate(serdev, baud);
+	serdev_device_set_flow_control(serdev, false);
+	ret = serdev_device_set_parity(serdev, SERDEV_PARITY_NONE);
+	if (ret) {
+		dev_err(dev, "Failed to set parity");
+		return ret;
+	}
+
+	ret = iei_wt61p803_puzzle_get_version(mcu);
+	if (ret)
+		return ret;
+
+	ret = iei_wt61p803_puzzle_get_mac_addresses(mcu);
+	if (ret)
+		return ret;
+
+	ret = iei_wt61p803_puzzle_get_serial_number(mcu);
+	if (ret)
+		return ret;
+
+	dev_info(dev, "MCU version: %s", mcu->version.version);
+	dev_info(dev, "MCU firmware build info: %s", mcu->version.build_info);
+	dev_info(dev, "MCU in bootloader mode: %s",
+			mcu->version.bootloader_mode ? "true" : "false");
+	dev_info(dev, "MCU protocol version: %s", mcu->version.protocol_version);
+
+	if (device_property_read_bool(dev, "enable-beep")) {
+		ret = iei_wt61p803_puzzle_buzzer(mcu, false);
+		if (ret)
+			return ret;
+	}
+
+	ret = iei_wt61p803_puzzle_sysfs_create(dev, mcu);
+
+	return devm_of_platform_populate(dev);
+}
+
+static void iei_wt61p803_puzzle_remove(struct serdev_device *serdev)
+{
+	struct device *dev = &serdev->dev;
+	struct iei_wt61p803_puzzle *mcu = dev_get_drvdata(dev);
+
+	iei_wt61p803_puzzle_sysfs_remove(dev, mcu);
+}
+
+static const struct of_device_id iei_wt61p803_puzzle_dt_ids[] = {
+	{ .compatible = "iei,wt61p803-puzzle" },
+	{ }
+};
+
+MODULE_DEVICE_TABLE(of, iei_wt61p803_puzzle_dt_ids);
+
+static struct serdev_device_driver iei_wt61p803_puzzle_drv = {
+	.probe			= iei_wt61p803_puzzle_probe,
+	.remove			= iei_wt61p803_puzzle_remove,
+	.driver = {
+		.name		= "iei-wt61p803-puzzle",
+		.of_match_table	= iei_wt61p803_puzzle_dt_ids,
+	},
+};
+
+module_serdev_device_driver(iei_wt61p803_puzzle_drv);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Luka Kovacic <luka.kovacic@sartura.hr>");
+MODULE_DESCRIPTION("iEi WT61P803 PUZZLE MCU Driver");
diff --git a/include/linux/mfd/iei-wt61p803-puzzle.h b/include/linux/mfd/iei-wt61p803-puzzle.h
new file mode 100644
index 000000000000..633ceb1d00e3
--- /dev/null
+++ b/include/linux/mfd/iei-wt61p803-puzzle.h
@@ -0,0 +1,69 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/* iEi WT61P803 PUZZLE MCU Driver
+ * System management microcontroller for fan control, temperature sensor reading,
+ * LED control and system identification on iEi Puzzle series ARM-based appliances.
+ *
+ * Copyright (C) 2020 Sartura Ltd.
+ * Author: Luka Kovacic <luka.kovacic@sartura.hr>
+ */
+
+#ifndef _MFD_IEI_WT61P803_PUZZLE_H_
+#define _MFD_IEI_WT61P803_PUZZLE_H_
+
+#define IEI_WT61P803_PUZZLE_BUF_SIZE 512
+
+/* Command magic numbers */
+#define IEI_WT61P803_PUZZLE_CMD_HEADER_START		0x40 /* @ */
+#define IEI_WT61P803_PUZZLE_CMD_HEADER_START_OTHER	0x25 /* % */
+#define IEI_WT61P803_PUZZLE_CMD_HEADER_EEPROM		0xF7
+
+#define IEI_WT61P803_PUZZLE_CMD_RESPONSE_OK		0x30 /* 0 */
+#define IEI_WT61P803_PUZZLE_CHECKSUM_RESPONSE_OK	0x70
+
+#define IEI_WT61P803_PUZZLE_CMD_EEPROM_READ		0xA1
+#define IEI_WT61P803_PUZZLE_CMD_EEPROM_WRITE		0xA0
+
+#define IEI_WT61P803_PUZZLE_CMD_OTHER_VERSION		0x56 /* V */
+#define IEI_WT61P803_PUZZLE_CMD_OTHER_BUILD		0x42 /* B */
+#define IEI_WT61P803_PUZZLE_CMD_OTHER_BOOTLOADER_MODE	0x4D /* M */
+#define IEI_WT61P803_PUZZLE_CMD_OTHER_MODE_BOOTLOADER	0x30
+#define IEI_WT61P803_PUZZLE_CMD_OTHER_MODE_APPS		0x31
+#define IEI_WT61P803_PUZZLE_CMD_OTHER_PROTOCOL_VERSION	0x50 /* P */
+
+#define IEI_WT61P803_PUZZLE_CMD_FUNCTION_SINGLE		0x43 /* C */
+#define IEI_WT61P803_PUZZLE_CMD_FUNCTION_OTHER		0x4F /* O */
+#define IEI_WT61P803_PUZZLE_CMD_FUNCTION_OTHER_STATUS	0x53 /* S */
+#define IEI_WT61P803_PUZZLE_CMD_FUNCTION_OTHER_POWER_LOSS 0x41 /* A */
+
+#define IEI_WT61P803_PUZZLE_CMD_LED			0x52 /* R */
+#define IEI_WT61P803_PUZZLE_CMD_LED_POWER		0x31 /* 1 */
+
+#define IEI_WT61P803_PUZZLE_CMD_TEMP			0x54 /* T */
+#define IEI_WT61P803_PUZZLE_CMD_TEMP_ALL		0x41 /* A */
+
+#define IEI_WT61P803_PUZZLE_CMD_FAN			0x46 /* F */
+#define IEI_WT61P803_PUZZLE_CMD_FAN_PWM_0		0x30
+#define IEI_WT61P803_PUZZLE_CMD_FAN_PWM_1		0x31
+#define IEI_WT61P803_PUZZLE_CMD_FAN_PWM_READ		0x5A /* Z */
+#define IEI_WT61P803_PUZZLE_CMD_FAN_PWM_WRITE		0x57 /* W */
+#define IEI_WT61P803_PUZZLE_CMD_FAN_RPM_0		0x41 /* A */
+#define IEI_WT61P803_PUZZLE_CMD_FAN_RPM_1		0x42 /* B */
+#define IEI_WT61P803_PUZZLE_CMD_FAN_RPM_2		0x43 /* C */
+#define IEI_WT61P803_PUZZLE_CMD_FAN_RPM_3		0x44 /* D */
+#define IEI_WT61P803_PUZZLE_CMD_FAN_RPM_4		0x45 /* E */
+#define IEI_WT61P803_PUZZLE_CMD_FAN_RPM_5		0x46 /* F */
+
+struct iei_wt61p803_puzzle_mcu_version;
+struct iei_wt61p803_puzzle_reply;
+struct iei_wt61p803_puzzle;
+
+int iei_wt61p803_puzzle_write_command_watchdog(struct iei_wt61p803_puzzle *mcu,
+		unsigned char *cmd, size_t size,
+		unsigned char *reply_data, size_t *reply_size,
+		int retry_count);
+
+int iei_wt61p803_puzzle_write_command(struct iei_wt61p803_puzzle *mcu,
+		unsigned char *cmd, size_t size,
+		unsigned char *reply_data, size_t *reply_size);
+
+#endif /* _MFD_IEI_WT61P803_PUZZLE_H_ */
-- 
2.26.2

