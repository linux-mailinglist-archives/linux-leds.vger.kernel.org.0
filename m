Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E15925E7C3
	for <lists+linux-leds@lfdr.de>; Sat,  5 Sep 2020 15:07:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728573AbgIENHX (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 5 Sep 2020 09:07:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728486AbgIENFp (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 5 Sep 2020 09:05:45 -0400
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB2C3C061247
        for <linux-leds@vger.kernel.org>; Sat,  5 Sep 2020 06:05:44 -0700 (PDT)
Received: by mail-ed1-x542.google.com with SMTP id i1so8411396edv.2
        for <linux-leds@vger.kernel.org>; Sat, 05 Sep 2020 06:05:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NmxtKjTst7Kjy3hD3ics0v0CsKKPDK+NS2czAKePEHA=;
        b=m2+NEPeM0Nk8EIXUVdk20Fi9XvW1T+u2ldRu6mCBcy9Dtkvq6ds+Fsy3dcHJ0894ey
         j2pTAEeBi3mDCLajX9+ZbgiJOi2QizFlRMFW0bUlewn2fIwyf15Oft4QgVGJFOvLyzHf
         r9fU9EXHL5KyaRVFGtGzJjfhZ6mZvBuRNYOxoNFwu8cncMg6GST8Hh/zzqiUKe8r1h1R
         pSTGvMiucKyBDT6vCx3KokkRRMHY7k7Ldjh7KcrWVX57HF17nwomDoSD6kgMgFndUNL6
         tlDj9ymIGeGyP35GmT+Mtff6y8sUeJJssnt4bMNWEVTjeT76w5pPzjskoIeXT0LvUiNd
         NyRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NmxtKjTst7Kjy3hD3ics0v0CsKKPDK+NS2czAKePEHA=;
        b=c3aUPz482R5/eitNRSlx3sdY2B+fWb3scdE1bKEgI2tDa7TmjXXep+yI0A9nKfG9VL
         k9TQfmNY4ccEZxYNXgc9hqvLuy+i3MQBF16nfzFndaS8ZLRDTsVjN1ZZkxUPza4UBPma
         NEVGqCq25RE8vb+lXE5EfircV00TmW8EhGK6wRuu3VaeU5RjgM2B3LYRDXEB0qItY0Z+
         uQSMjvF1IkiOFAKPV1TpFZJ1fi2NLVGynhessG4ZkAioXE25klUHTAxV07U9K8XDBA+a
         CX9dba2hyo6mO0MgVf5qv3rLhj0azLgJMWZiH6WBzMB7VPfSxmEAdv6iGtjqkJFwUaWO
         N9RA==
X-Gm-Message-State: AOAM5330nMXg1sCuq92++sDGiNB1FP1nY7IdV12jy3Tp0roe8bU/soj0
        I2zphRFVauVhok3rs2NHAg2+7Q==
X-Google-Smtp-Source: ABdhPJz+jDJz8jF5m4yaygyUSEwgXRccENAzfuD+GhZyIOEh2ljZnVdGwO9k91KY/l0pV2A/OoM3vQ==
X-Received: by 2002:a50:e685:: with SMTP id z5mr12199366edm.305.1599311142940;
        Sat, 05 Sep 2020 06:05:42 -0700 (PDT)
Received: from localhost.localdomain ([2a00:ee2:4b0d:3002:290:faff:fe54:449c])
        by smtp.gmail.com with ESMTPSA id s18sm9372655ejd.54.2020.09.05.06.05.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2020 06:05:42 -0700 (PDT)
From:   Luka Kovacic <luka.kovacic@sartura.hr>
To:     linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-leds@vger.kernel.org
Cc:     lee.jones@linaro.org, pavel@ucw.cz, dmurphy@ti.com,
        robh+dt@kernel.org, jdelvare@suse.com, linux@roeck-us.net,
        andrew@lunn.ch, jason@lakedaemon.net, gregory.clement@bootlin.com,
        luka.perkov@sartura.hr, Luka Kovacic <luka.kovacic@sartura.hr>
Subject: [PATCH 2/7] drivers: mfd: Add a driver for iEi WT61P803 PUZZLE MCU
Date:   Sat,  5 Sep 2020 15:03:31 +0200
Message-Id: <20200905130336.967622-3-luka.kovacic@sartura.hr>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200905130336.967622-1-luka.kovacic@sartura.hr>
References: <20200905130336.967622-1-luka.kovacic@sartura.hr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
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
---
 drivers/mfd/Kconfig                     |    8 +
 drivers/mfd/Makefile                    |    1 +
 drivers/mfd/iei-wt61p803-puzzle.c       | 1242 +++++++++++++++++++++++
 include/linux/mfd/iei-wt61p803-puzzle.h |   27 +
 4 files changed, 1278 insertions(+)
 create mode 100644 drivers/mfd/iei-wt61p803-puzzle.c
 create mode 100644 include/linux/mfd/iei-wt61p803-puzzle.h

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index 33df0837ab41..3fcda95f07a3 100644
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
+	  used for fan control, temperature sensor reading, led control
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
index 000000000000..110ea1b84c53
--- /dev/null
+++ b/drivers/mfd/iei-wt61p803-puzzle.c
@@ -0,0 +1,1242 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+/* iEi WT61P803 PUZZLE MCU Driver
+ *
+ * Copyright (C) 2020 Sartura Ltd.
+ * Author: Luka Kovacic <luka.kovacic@sartura.hr>
+ */
+
+#include <linux/atomic.h>
+#include <linux/delay.h>
+#include <linux/export.h>
+#include <linux/init.h>
+#include <linux/slab.h>
+#include <linux/kernel.h>
+#include <linux/mfd/iei-wt61p803-puzzle.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/sched.h>
+#include <linux/serdev.h>
+#include <asm/unaligned.h>
+#include <linux/delay.h>
+#include <linux/sysfs.h>
+
+#define IEI_WT61P803_PUZZLE_MAX_COMMAND_LENGTH (20 + 2)
+#define IEI_WT61P803_PUZZLE_RESP_BUF_SIZE 512
+#define IEI_WT61P803_PUZZLE_GENERAL_TIMEOUT HZ
+
+/**
+ * struct iei_wt61p803_puzzle_mcu_status - MCU flags state
+ *
+ * @ac_recovery_status_flag: AC Recovery Status Flag
+ * @power_loss_recovery: System recovery after power loss
+ * @power_status: System Power-on Method
+ */
+struct iei_wt61p803_puzzle_mcu_status {
+	u8 ac_recovery_status_flag;
+	u8 power_loss_recovery;
+	u8 power_status;
+};
+
+/**
+ * enum iei_wt61p803_puzzle_reply_state - State of the reply
+ * @FRAME_OK: The frame was completely processed/received
+ * @FRAME_PROCESSING: First bytes were received, but the frame isn't complete
+ * @FRAME_STRUCT_EMPTY: The frame struct is empty, no data was received
+ * @FRAME_TIMEOUT: The frame processing timed out, communication failed
+ *
+ * The enum iei_wt61p803_puzzle_reply_state is used to describe the general state
+ * of the frame that is currently being received.
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
+ * @size: Size of the MCU reply
+ * @data: Full MCU reply buffer
+ * @state: Current state of the packet
+ * @received: Was the response fullfilled
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
+ * @version: Primary firmware version
+ * @build_info: Build date and time
+ * @bootloader_mode: Status of the MCU operation
+ * @protocol_version: MCU communication protocol version
+ * @serial_number: Device factory serial number
+ * @mac_address: Device factory MAC addresses
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
+ * @serdev: Pointer to underlying serdev device
+ * @kobj: Pointer to kobject (sysfs)
+ * @reply_lock: Reply mutex lock
+ * @bus_lock: Bus mutex lock
+ * @reply: Pointer to the iei_wt61p803_puzzle_reply struct
+ * @version_lock: Version R/W mutex lock
+ * @version: Pointer to the iei_wt61p803_puzzle_mcu_version struct
+ * @status_lock: Status R/W mutex lock
+ * @status: Pointer to the iei_wt61p803_puzzle_mcu_status struct
+ */
+struct iei_wt61p803_puzzle {
+	struct serdev_device *serdev;
+	struct kobject *kobj;
+
+	struct mutex reply_lock;
+	struct mutex bus_lock;
+
+	struct iei_wt61p803_puzzle_reply *reply;
+
+	struct mutex version_lock;
+	struct iei_wt61p803_puzzle_mcu_version *version;
+
+	struct mutex status_lock;
+	struct iei_wt61p803_puzzle_mcu_status *status;
+};
+
+static const struct of_device_id iei_wt61p803_puzzle_dt_ids[] = {
+	{ .compatible = "iei,wt61p803-puzzle" },
+	{ /* sentinel */ }
+};
+
+unsigned char iei_wt61p803_puzzle_add_xor_checksum(unsigned char *buf,
+		unsigned char xor_len)
+{
+	unsigned char xor_sum = 0;
+	unsigned int i;
+
+	for (i = 0; i < xor_len; i++)
+		xor_sum ^= buf[i];
+
+	return xor_sum;
+}
+
+static int iei_wt61p803_puzzle_process_resp(struct iei_wt61p803_puzzle *mcu,
+		unsigned char *raw_resp_data, size_t size)
+{
+	struct device *dev = &mcu->serdev->dev;
+
+	unsigned char xor_checksum;
+
+	/*
+	 * Start receiving the frame/Continue receiving the frame
+	 *
+	 * The code below determines whether:
+	 * * we are receiving a new frame
+	 * * appending data to an existing frame
+	 *
+	 */
+
+	/* Lock the reply struct mutex */
+	mutex_lock(&mcu->reply_lock);
+
+	/* Check the incoming frame header */
+	if (!(raw_resp_data[0] == '@' || raw_resp_data[0] == '%' ||
+		(raw_resp_data[0] == 0xF7 && raw_resp_data[1] == 0xA1))) {
+
+		/* Frame header is not correct, check whether to append */
+		if (mcu->reply->state != FRAME_PROCESSING) {
+			/* The incoming frame should be discarded */
+			dev_err(dev, "Invalid frame header and state (0x%x)",
+					mcu->reply->state);
+
+			mutex_unlock(&mcu->reply_lock);
+			return -1;
+		}
+
+		/* The frame should be appended to the existing data */
+		memcpy(mcu->reply->data+mcu->reply->size, raw_resp_data, size);
+		mcu->reply->size += size;
+	} else {
+		/* Start processing a new frame */
+		memcpy(mcu->reply->data, raw_resp_data, size);
+		mcu->reply->size = size;
+		mcu->reply->state = FRAME_PROCESSING;
+	}
+
+	/* Create an xor checksum of the data */
+	xor_checksum = iei_wt61p803_puzzle_add_xor_checksum(mcu->reply->data,
+			((int)mcu->reply->size)-1);
+
+	/* Check whether the caluclated checksum matches the received one */
+	if (xor_checksum != mcu->reply->data[((int)mcu->reply->size)-1]) {
+		/* The checksum doesn't match, waiting for data */
+		mutex_unlock(&mcu->reply_lock);
+		return (int)size;
+	}
+
+	/*
+	 * Update internal driver state with the latest response code
+	 */
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
+ * Function iei_wt61p803_puzzle_write_command() sends a structured command to
+ * the MCU.
+ */
+int iei_wt61p803_puzzle_write_command(struct iei_wt61p803_puzzle *mcu,
+		unsigned char *cmd, size_t size, unsigned char *reply_data,
+		size_t *reply_size)
+{
+	struct device *dev = &mcu->serdev->dev;
+
+	int ret;
+	int len = (int)size;
+
+	if (size > IEI_WT61P803_PUZZLE_MAX_COMMAND_LENGTH)
+		return -EINVAL;
+
+	/* Create an XOR checksum for the provided command */
+	cmd[len - 1] = iei_wt61p803_puzzle_add_xor_checksum(cmd, len);
+
+	mutex_lock(&mcu->bus_lock);
+
+	/* Initialize reply struct */
+	mutex_lock(&mcu->reply_lock);
+	if (mcu->reply) {
+		reinit_completion(&mcu->reply->received);
+
+		mcu->reply->state = FRAME_STRUCT_EMPTY;
+
+		mcu->reply->size = 0;
+	} else {
+		dev_err(dev, "Reply struct is NULL.\n");
+
+		mutex_unlock(&mcu->reply_lock);
+		mutex_unlock(&mcu->bus_lock);
+
+		return -1;
+	}
+	mutex_unlock(&mcu->reply_lock);
+
+	/* Write to MCU UART */
+	ret = serdev_device_write(mcu->serdev, cmd, len,
+			IEI_WT61P803_PUZZLE_GENERAL_TIMEOUT);
+
+	if (ret < 0)
+		return ret;
+
+	/* Wait for the MCU response */
+	if (!wait_for_completion_timeout(&mcu->reply->received,
+				IEI_WT61P803_PUZZLE_GENERAL_TIMEOUT)) {
+		dev_err(dev, "Command reply receive timeout\n");
+
+		ret = -ETIMEDOUT;
+
+		mutex_lock(&mcu->reply_lock);
+		reinit_completion(&mcu->reply->received);
+		mcu->reply->state = FRAME_TIMEOUT;
+		mutex_unlock(&mcu->reply_lock);
+	}
+
+	if (ret < 0) {
+		mutex_unlock(&mcu->bus_lock);
+		return ret;
+	}
+
+	/* Verify MCU response status */
+	mutex_lock(&mcu->reply_lock);
+
+	if (mcu->reply) {
+		/* Copy response */
+		*reply_size = mcu->reply->size;
+		memcpy(reply_data, mcu->reply->data, mcu->reply->size);
+	} else {
+		dev_err(dev, "Reply struct is NULL.\n");
+
+		mutex_unlock(&mcu->reply_lock);
+		mutex_unlock(&mcu->bus_lock);
+
+		return -1;
+	}
+
+	mutex_unlock(&mcu->reply_lock);
+	mutex_unlock(&mcu->bus_lock);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(iei_wt61p803_puzzle_write_command);
+
+int iei_wt61p803_puzzle_buzzer(struct iei_wt61p803_puzzle *mcu, bool long_beep)
+{
+	/* Buzzer 0.5 sec */
+	unsigned char buzzer_short_cmd[4] = { '@', 'C', '2' };
+	/* Buzzer 1.5 sec */
+	unsigned char buzzer_long_cmd[4] = { '@', 'C', '3' };
+
+	int ret;
+
+	size_t reply_size = 0;
+	unsigned char *resp_buf;
+
+	resp_buf = kmalloc(IEI_WT61P803_PUZZLE_BUF_SIZE, GFP_KERNEL);
+	if (!resp_buf)
+		return -ENOMEM;
+
+	ret = iei_wt61p803_puzzle_write_command(mcu,
+			long_beep ? buzzer_long_cmd : buzzer_short_cmd, 4,
+			resp_buf, &reply_size);
+
+	if (ret) {
+		kfree(resp_buf);
+		return ret;
+	}
+
+	if (reply_size != 3) {
+		kfree(resp_buf);
+		return -EIO;
+	}
+
+	if (!(resp_buf[0] == '@' && resp_buf[1] == '0' &&
+				resp_buf[2] == 0x70)) {
+		kfree(resp_buf);
+		return -EPROTO;
+	}
+
+	kfree(resp_buf);
+	return 0;
+}
+
+int iei_wt61p803_puzzle_get_version(struct iei_wt61p803_puzzle *mcu)
+{
+	struct device *dev = &mcu->serdev->dev;
+
+	/* Commands */
+	unsigned char version_cmd[3] = { '%', 'V' };
+	unsigned char build_info_cmd[3] = { '%', 'B' };
+	unsigned char bootloader_mode_cmd[3] = { '%', 'M' };
+	unsigned char protocol_version_cmd[3] = { '%', 'P' };
+
+	unsigned char *rd;
+	size_t reply_size = 0;
+
+	int ret;
+
+	/* Allocate memory for the buffer */
+	rd = kmalloc(IEI_WT61P803_PUZZLE_BUF_SIZE, GFP_KERNEL);
+	if (!rd)
+		return -ENOMEM;
+
+	ret = iei_wt61p803_puzzle_write_command(mcu, version_cmd,
+			sizeof(version_cmd), rd, &reply_size);
+	if (ret)
+		goto err;
+
+	if (reply_size < 7) {
+		ret = -EIO;
+		goto err;
+	}
+
+	mcu->version->version = devm_kasprintf(dev, GFP_KERNEL, "v%c.%c%c%c",
+				rd[2], rd[3], rd[4], rd[5]);
+
+	ret = iei_wt61p803_puzzle_write_command(mcu, build_info_cmd,
+			sizeof(build_info_cmd), rd, &reply_size);
+	if (ret)
+		goto err;
+
+	if (reply_size < 15) {
+		ret = -EIO;
+		goto err;
+	}
+
+	mcu->version->build_info = devm_kasprintf(dev, GFP_KERNEL,
+			"%c%c/%c%c/%c%c%c%c %c%c:%c%c",
+			rd[8], rd[9], rd[6], rd[7], rd[2],
+			rd[3], rd[4], rd[5], rd[10], rd[11],
+			rd[12], rd[13]);
+
+	ret = iei_wt61p803_puzzle_write_command(mcu, bootloader_mode_cmd,
+			sizeof(bootloader_mode_cmd), rd, &reply_size);
+	if (ret)
+		goto err;
+
+	if (reply_size < 4) {
+		ret = -EIO;
+		goto err;
+	}
+
+	if (rd[2] == 0x31) {
+		/* The MCU is in normal mode */
+		mcu->version->bootloader_mode = false;
+	} else if (rd[2] == 0x30) {
+		/* The MCU is in bootloader mode */
+		mcu->version->bootloader_mode = true;
+	}
+
+	ret = iei_wt61p803_puzzle_write_command(mcu, protocol_version_cmd,
+			sizeof(protocol_version_cmd), rd, &reply_size);
+	if (ret)
+		goto err;
+
+	if (reply_size < 9) {
+		ret = -EIO;
+		goto err;
+	}
+
+	mcu->version->protocol_version = devm_kasprintf(dev, GFP_KERNEL,
+			"v%c.%c%c%c%c%c",
+			rd[7], rd[6], rd[5], rd[4], rd[3], rd[2]);
+
+	/* Free the allocated memory resources */
+	kfree(rd);
+
+	return 0;
+err:
+	kfree(rd);
+	return ret;
+}
+
+int iei_wt61p803_puzzle_get_mcu_status(struct iei_wt61p803_puzzle *mcu)
+{
+	/* MCU Status Command */
+	unsigned char mcu_status_cmd[5] = { '@', 'O', 'S', 'S' };
+
+	int ret;
+
+	unsigned char *rd;
+	size_t reply_size = 0;
+
+	/* Allocate memory for the buffer */
+	rd = kmalloc(IEI_WT61P803_PUZZLE_BUF_SIZE, GFP_KERNEL);
+	if (!rd)
+		return -ENOMEM;
+
+	ret = iei_wt61p803_puzzle_write_command(mcu, mcu_status_cmd,
+			sizeof(mcu_status_cmd), rd, &reply_size);
+	if (ret) {
+		kfree(rd);
+		return ret;
+	}
+
+	if (reply_size < 20) {
+		kfree(rd);
+		return -EIO;
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
+
+	if (rd[0] == '@' && rd[1] == 'O' && rd[2] == 'S' && rd[3] == 'S') {
+		mutex_lock(&mcu->status_lock);
+		mcu->status->ac_recovery_status_flag = rd[5];
+		mcu->status->power_loss_recovery = rd[10];
+		mcu->status->power_status = rd[19];
+		mutex_unlock(&mcu->status_lock);
+	}
+
+	/* Free the allocated memory resources */
+	kfree(rd);
+
+	return 0;
+}
+
+int iei_wt61p803_puzzle_get_serial_number(struct iei_wt61p803_puzzle *mcu)
+{
+	struct device *dev = &mcu->serdev->dev;
+	unsigned char serial_number_cmd[5] = { 0xF7, 0xA1, 0x00, 0x24 };
+
+	int ret;
+
+	unsigned char *rd;
+	size_t reply_size = 0;
+
+	/* Allocate memory for the buffer */
+	rd = kmalloc(IEI_WT61P803_PUZZLE_BUF_SIZE, GFP_KERNEL);
+	if (!rd)
+		return -ENOMEM;
+
+	ret = iei_wt61p803_puzzle_write_command(mcu, serial_number_cmd,
+			sizeof(serial_number_cmd), rd, &reply_size);
+	if (ret)
+		goto err;
+
+	mutex_lock(&mcu->version_lock);
+	mcu->version->serial_number = devm_kasprintf(dev, GFP_KERNEL, "%.*s",
+			(int)reply_size - 5, rd + 4);
+	mutex_unlock(&mcu->version_lock);
+
+	/* Free the allocated memory resources */
+	kfree(rd);
+
+	return 0;
+
+err:
+	kfree(rd);
+	return ret;
+
+}
+
+int iei_wt61p803_puzzle_write_serial_number(struct iei_wt61p803_puzzle *mcu,
+		unsigned char serial_number[36])
+{
+	struct device *dev = &mcu->serdev->dev;
+	unsigned char serial_number_header[4] = { 0xF7, 0xA0, 0x00, 0xC };
+
+	/* 4 byte header, 12 byte serial number chunk, 1 byte XOR checksum */
+	unsigned char serial_number_cmd[4+12+1];
+
+	int ret, sn_counter;
+
+	unsigned char *rd;
+	size_t reply_size = 0;
+
+	/* Allocate memory for the buffer */
+	rd = kmalloc(IEI_WT61P803_PUZZLE_BUF_SIZE, GFP_KERNEL);
+	if (!rd)
+		return -ENOMEM;
+
+	/* The MCU can only handle 22 byte messages, send the S/N in chunks */
+	for (sn_counter = 0; sn_counter < 3; sn_counter++) {
+		serial_number_header[2] = 0x0 + (0xC) * sn_counter;
+
+		memcpy(serial_number_cmd, serial_number_header, 4);
+		memcpy(serial_number_cmd + 4, serial_number + (0xC) * sn_counter, 0xC);
+
+		/* Initialize the last byte */
+		serial_number_cmd[sizeof(serial_number_cmd) - 1] = 0;
+
+		ret = iei_wt61p803_puzzle_write_command(mcu, serial_number_cmd,
+				sizeof(serial_number_cmd), rd, &reply_size);
+		if (ret)
+			goto err;
+
+		if (reply_size != 3) {
+			ret = -EIO;
+			goto err;
+		}
+
+		if (!(rd[0] == '@' && rd[1] == '0' && rd[2] == 0x70)) {
+			ret = -EPROTO;
+			goto err;
+		}
+	}
+
+	mutex_lock(&mcu->version_lock);
+	mcu->version->serial_number = devm_kasprintf(dev, GFP_KERNEL, "%.*s",
+			36, serial_number);
+	mutex_unlock(&mcu->version_lock);
+
+	/* Free the allocated memory resources */
+	kfree(rd);
+
+	return 0;
+
+err:
+	kfree(rd);
+	return ret;
+}
+
+int iei_wt61p803_puzzle_get_mac_addresses(struct iei_wt61p803_puzzle *mcu)
+{
+	struct device *dev = &mcu->serdev->dev;
+	unsigned char mac_address_cmd[5] = { 0xF7, 0xA1, 0x00, 0x11 };
+
+	int ret, mac_counter;
+
+	unsigned char *rd;
+	size_t reply_size = 0;
+
+	/* Allocate memory for the buffer */
+	rd = kmalloc(IEI_WT61P803_PUZZLE_BUF_SIZE, GFP_KERNEL);
+	if (!rd)
+		return -ENOMEM;
+
+	for (mac_counter = 0; mac_counter < 8; mac_counter++) {
+		mac_address_cmd[2] = 0x24 + (0x11) * mac_counter;
+		mac_address_cmd[4] = 0x00;
+
+		ret = iei_wt61p803_puzzle_write_command(mcu, mac_address_cmd,
+				sizeof(mac_address_cmd), rd, &reply_size);
+		if (ret)
+			continue;
+
+		if (reply_size < 22) {
+			ret = -EIO;
+			goto err;
+		}
+
+		mutex_lock(&mcu->version_lock);
+		mcu->version->mac_address[mac_counter] = devm_kasprintf(dev,
+				GFP_KERNEL, "%.*s", (int)reply_size - 5,
+				rd + 4);
+		mutex_unlock(&mcu->version_lock);
+	}
+
+	/* Free the allocated memory resources */
+	kfree(rd);
+
+	return 0;
+
+err:
+	kfree(rd);
+	return ret;
+}
+
+int iei_wt61p803_puzzle_write_mac_address(struct iei_wt61p803_puzzle *mcu,
+		unsigned char mac_address[17], int mac_address_idx)
+{
+	struct device *dev = &mcu->serdev->dev;
+	unsigned char mac_address_header[4] = { 0xF7, 0xA0, 0x00, 0x11 };
+
+	/* 4 byte header, 17 byte MAC address, 1 byte XOR checksum */
+	unsigned char mac_address_cmd[4+17+1];
+
+	int ret;
+
+	unsigned char *rd;
+	size_t reply_size = 0;
+
+	if (!(mac_address_idx < 8))
+		return -EINVAL;
+
+	/* Allocate memory for the buffer */
+	rd = kmalloc(IEI_WT61P803_PUZZLE_BUF_SIZE, GFP_KERNEL);
+	if (!rd)
+		return -ENOMEM;
+
+	mac_address_header[2] = 0x24 + (0x11) * mac_address_idx;
+
+	/* Concat mac_address_header, mac_address to mac_address_cmd */
+	memcpy(mac_address_cmd, mac_address_header, 4);
+	memcpy(mac_address_cmd + 4, mac_address, 17);
+
+	/* Initialize the last byte */
+	mac_address_cmd[sizeof(mac_address_cmd) - 1] = 0;
+
+	ret = iei_wt61p803_puzzle_write_command(mcu, mac_address_cmd,
+			sizeof(mac_address_cmd), rd, &reply_size);
+	if (ret)
+		goto err;
+
+	if (reply_size != 3) {
+		ret = -EIO;
+		goto err;
+	}
+
+	if (!(rd[0] == '@' && rd[1] == '0' && rd[2] == 0x70)) {
+		ret = -EPROTO;
+		goto err;
+	}
+
+	mutex_lock(&mcu->version_lock);
+	mcu->version->mac_address[mac_address_idx] = devm_kasprintf(dev,
+			GFP_KERNEL, "%.*s", 17, mac_address);
+	mutex_unlock(&mcu->version_lock);
+
+	/* Free the allocated memory resources */
+	kfree(rd);
+
+	return 0;
+
+err:
+	kfree(rd);
+	return ret;
+}
+
+int iei_wt61p803_puzzle_write_power_loss_recovery(struct iei_wt61p803_puzzle *mcu,
+		int power_loss_recovery_action)
+{
+	unsigned char power_loss_recovery_cmd[5] = { '@', 'O', 'A', '0' };
+
+	unsigned char *resp_buf;
+	size_t reply_size = 0;
+
+	/* Buffer for the power_loss_recovery_action to character */
+	unsigned char cmd_buf[2];
+
+	int ret;
+
+	/* Allocate memory for the buffer */
+	resp_buf = kmalloc(IEI_WT61P803_PUZZLE_BUF_SIZE, GFP_KERNEL);
+	if (!resp_buf)
+		return -ENOMEM;
+
+	/* Check the acceptable range */
+	if (power_loss_recovery_action < 0 || power_loss_recovery_action > 4) {
+		kfree(resp_buf);
+		return -EINVAL;
+	}
+
+	/* Convert int to char */
+	ret = snprintf(cmd_buf, sizeof(cmd_buf), "%d",
+			power_loss_recovery_action);
+	if (ret < 0) {
+		kfree(resp_buf);
+		return ret;
+	}
+
+	/* Modify the command with the action index */
+	power_loss_recovery_cmd[3] = cmd_buf[0];
+
+	ret = iei_wt61p803_puzzle_write_command(mcu, power_loss_recovery_cmd,
+			sizeof(power_loss_recovery_cmd), resp_buf, &reply_size);
+	if (ret) {
+		kfree(resp_buf);
+		return ret;
+	}
+
+	/* Update the internal status (struct) */
+	mutex_lock(&mcu->status_lock);
+	mcu->status->power_loss_recovery = power_loss_recovery_action;
+	mutex_unlock(&mcu->status_lock);
+
+	/* Free the allocated memory resources */
+	kfree(resp_buf);
+
+	return 0;
+}
+
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
+	return sprintf(buf, "%s\n", mcu->version->version);
+}
+
+static DEVICE_ATTR_RO(version);
+
+static ssize_t build_info_show(struct device *dev,
+	struct device_attribute *attr, char *buf)
+{
+	struct device *dev_container = sysfs_container(dev);
+	struct iei_wt61p803_puzzle *mcu = dev_get_drvdata(dev_container);
+
+	return sprintf(buf, "%s\n", mcu->version->build_info);
+}
+
+static DEVICE_ATTR_RO(build_info);
+
+static ssize_t bootloader_mode_show(struct device *dev,
+	struct device_attribute *attr, char *buf)
+{
+	struct device *dev_container = sysfs_container(dev);
+	struct iei_wt61p803_puzzle *mcu = dev_get_drvdata(dev_container);
+
+	return sprintf(buf, "%d\n", mcu->version->bootloader_mode);
+}
+
+static DEVICE_ATTR_RO(bootloader_mode);
+
+static ssize_t protocol_version_show(struct device *dev,
+	struct device_attribute *attr, char *buf)
+{
+	struct device *dev_container = sysfs_container(dev);
+	struct iei_wt61p803_puzzle *mcu = dev_get_drvdata(dev_container);
+
+	return sprintf(buf, "%s\n", mcu->version->protocol_version);
+}
+
+static DEVICE_ATTR_RO(protocol_version);
+
+static ssize_t serial_number_show(struct device *dev,
+	struct device_attribute *attr, char *buf)
+{
+	struct device *dev_container = sysfs_container(dev);
+	struct iei_wt61p803_puzzle *mcu = dev_get_drvdata(dev_container);
+
+	int ret;
+
+	mutex_lock(&mcu->version_lock);
+	ret = sprintf(buf, "%s\n", mcu->version->serial_number);
+	mutex_unlock(&mcu->version_lock);
+
+	return ret;
+}
+
+static ssize_t serial_number_store(struct device *dev,
+		struct device_attribute *attr,
+		const char *buf, size_t count)
+{
+	struct device *dev_container = sysfs_container(dev);
+	struct iei_wt61p803_puzzle *mcu = dev_get_drvdata(dev_container);
+
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
+
+static DEVICE_ATTR_RW(serial_number);
+
+static ssize_t mac_address_show(struct device *dev,
+	struct device_attribute *attr, char *buf)
+{
+	struct device *dev_container = sysfs_container(dev);
+	struct iei_wt61p803_puzzle *mcu = dev_get_drvdata(dev_container);
+
+	int ret;
+
+	mutex_lock(&mcu->version_lock);
+
+	if (!strcmp(attr->attr.name, "mac_address_0"))
+		ret = sprintf(buf, "%s\n", mcu->version->mac_address[0]);
+	else if (!strcmp(attr->attr.name, "mac_address_1"))
+		ret = sprintf(buf, "%s\n", mcu->version->mac_address[1]);
+	else if (!strcmp(attr->attr.name, "mac_address_2"))
+		ret = sprintf(buf, "%s\n", mcu->version->mac_address[2]);
+	else if (!strcmp(attr->attr.name, "mac_address_3"))
+		ret = sprintf(buf, "%s\n", mcu->version->mac_address[3]);
+	else if (!strcmp(attr->attr.name, "mac_address_4"))
+		ret = sprintf(buf, "%s\n", mcu->version->mac_address[4]);
+	else if (!strcmp(attr->attr.name, "mac_address_5"))
+		ret = sprintf(buf, "%s\n", mcu->version->mac_address[5]);
+	else if (!strcmp(attr->attr.name, "mac_address_6"))
+		ret = sprintf(buf, "%s\n", mcu->version->mac_address[6]);
+	else if (!strcmp(attr->attr.name, "mac_address_7"))
+		ret = sprintf(buf, "%s\n", mcu->version->mac_address[7]);
+	else
+		ret = sprintf(buf, "\n");
+
+	mutex_unlock(&mcu->version_lock);
+
+	return ret;
+}
+
+static ssize_t mac_address_store(struct device *dev,
+		struct device_attribute *attr,
+		const char *buf, size_t count)
+{
+	struct device *dev_container = sysfs_container(dev);
+	struct iei_wt61p803_puzzle *mcu = dev_get_drvdata(dev_container);
+
+	unsigned char mac_address[17];
+	int ret;
+
+	/* Check whether the MAC address is 17 characters long + null */
+	if ((int)count != 17 + 1)
+		return -EINVAL;
+
+	/* Copy 17 characters from the buffer to mac_address */
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
+
+	if (ret)
+		return ret;
+
+	return count;
+}
+
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
+	mutex_lock(&mcu->status_lock);
+	ret = sprintf(buf, "%x\n", mcu->status->ac_recovery_status_flag);
+	mutex_unlock(&mcu->status_lock);
+
+	return ret;
+}
+
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
+	mutex_lock(&mcu->status_lock);
+	ret = sprintf(buf, "%x\n", mcu->status->power_loss_recovery);
+	mutex_unlock(&mcu->status_lock);
+
+	return ret;
+}
+
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
+
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
+	mutex_lock(&mcu->status_lock);
+	ret = sprintf(buf, "%x\n", mcu->status->power_status);
+	mutex_unlock(&mcu->status_lock);
+
+	return ret;
+}
+
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
+
+ATTRIBUTE_GROUPS(iei_wt61p803_puzzle);
+
+static int iei_wt61p803_puzzle_sysfs_create(struct device *dev,
+		struct iei_wt61p803_puzzle *mcu)
+{
+	int ret;
+
+	mcu->kobj =
+		kobject_create_and_add("iei_wt61p803_puzzle_core", &dev->kobj);
+	if (!mcu->kobj)
+		return -ENOMEM;
+
+	ret = sysfs_create_groups(mcu->kobj, iei_wt61p803_puzzle_groups);
+	if (ret) {
+		dev_err(dev, "sysfs creation failed");
+
+		/* Clean up */
+		kobject_del(mcu->kobj);
+		kobject_put(mcu->kobj);
+		mcu->kobj = NULL;
+
+		return ret;
+	}
+
+	return 0;
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
+	/* Read the current-speed property from the device tree */
+	if (of_property_read_u32(dev->of_node, "current-speed", &baud)) {
+		dev_err(dev,
+			"'current-speed' is not specified in device node\n");
+		return -EINVAL;
+	}
+
+	/* Log the specified BAUD RATE */
+	dev_info(dev, "Driver baud rate: %d", baud);
+
+	/* Allocate the memory */
+	mcu = devm_kzalloc(dev, sizeof(*mcu), GFP_KERNEL);
+	if (!mcu)
+		return -ENOMEM;
+
+	mcu->version = devm_kzalloc(dev, sizeof(*mcu->version), GFP_KERNEL);
+	if (!mcu->version)
+		return -ENOMEM;
+
+	mcu->status = devm_kzalloc(dev, sizeof(*mcu->version), GFP_KERNEL);
+	if (!mcu->status)
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
+	/* Initialize device struct data */
+	mcu->serdev = serdev;
+
+	mcu->status->ac_recovery_status_flag = 0x00;
+	mcu->status->power_loss_recovery = 0x00;
+	mcu->status->power_status = 0x00;
+
+	init_completion(&mcu->reply->received);
+
+	/* Mutexes */
+	mutex_init(&mcu->reply_lock);
+	mutex_init(&mcu->bus_lock);
+	mutex_init(&mcu->status_lock);
+	mutex_init(&mcu->version_lock);
+
+	/* Setup UART interface */
+	serdev_device_set_drvdata(serdev, mcu);
+	serdev_device_set_client_ops(serdev,
+			&iei_wt61p803_puzzle_serdev_device_ops);
+
+	ret = devm_serdev_device_open(dev, serdev);
+	if (ret)
+		return ret;
+
+	serdev_device_set_baudrate(serdev, baud);
+
+	serdev_device_set_flow_control(serdev, false);
+
+	ret = serdev_device_set_parity(serdev, SERDEV_PARITY_NONE);
+	if (ret) {
+		dev_err(dev, "Failed to set parity\n");
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
+	dev_info(dev, "MCU version: %s", mcu->version->version);
+
+	dev_info(dev, "MCU firmware build info: %s", mcu->version->build_info);
+	dev_info(dev, "MCU in bootloader mode: %s",
+			mcu->version->bootloader_mode ? "true" : "false");
+	dev_info(dev, "MCU protocol version: %s", mcu->version->protocol_version);
+
+	if (of_property_read_bool(dev->of_node, "enable-probe-beep")) {
+		ret = iei_wt61p803_puzzle_buzzer(mcu, false);
+		if (ret)
+			return ret;
+	}
+
+	ret = iei_wt61p803_puzzle_sysfs_create(dev, mcu);
+	if (ret)
+		return ret;
+
+	return devm_of_platform_populate(dev);
+}
+
+static void iei_wt61p803_puzzle_remove(struct serdev_device *serdev)
+{
+	struct device *dev = &serdev->dev;
+	struct iei_wt61p803_puzzle *mcu = dev_get_drvdata(dev);
+
+	/* Remove sysfs kobjects and attributes */
+	iei_wt61p803_puzzle_sysfs_remove(dev, mcu);
+
+	dev_info(dev, "Device unregistered");
+}
+
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
index 000000000000..2bb6256574bc
--- /dev/null
+++ b/include/linux/mfd/iei-wt61p803-puzzle.h
@@ -0,0 +1,27 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+/* iEi WT61P803 PUZZLE MCU MFD Driver
+ *
+ * Copyright (C) 2020 Sartura Ltd.
+ * Author: Luka Kovacic <luka.kovacic@sartura.hr>
+ */
+
+#ifndef _LINUX_IEI_WT61P803_PUZZLE_H_
+#define _LINUX_IEI_WT61P803_PUZZLE_H_
+
+#define IEI_WT61P803_PUZZLE_BUF_SIZE 512
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
+#endif /* _LINUX_IEI_WT61P803_PUZZLE_H_ */
-- 
2.20.1

