Return-Path: <linux-leds+bounces-131-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 20F7F7F6FED
	for <lists+linux-leds@lfdr.de>; Fri, 24 Nov 2023 10:33:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 43F831C2121F
	for <lists+linux-leds@lfdr.de>; Fri, 24 Nov 2023 09:33:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78F5515AFC;
	Fri, 24 Nov 2023 09:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=monolithicpower.com header.i=@monolithicpower.com header.b="EBiHd/Ul"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0b-002bf204.pphosted.com (mx0b-002bf204.pphosted.com [205.220.172.86])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D10DCD54;
	Fri, 24 Nov 2023 01:33:36 -0800 (PST)
Received: from pps.filterd (m0207525.ppops.net [127.0.0.1])
	by mx0a-002bf204.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 3AO4uPox030525;
	Fri, 24 Nov 2023 01:33:21 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	monolithicpower.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding
	:content-type; s=pps1; bh=0eqek6SdnZkhx1HKqsJRJpuItss4lBBKCj/FFi
	NqpzY=; b=EBiHd/UlAZ7k4UETabXkoAfU/kZ8g1HcfePd4r4wnpX+zJ/KAxU0PW
	PHYvSxxAah7Ormii0WU9y1g5oGYnj5X4A+ofTASJzHcBGwGj2DevcxL7N/d3LD61
	ZUfmuHlXAgkrsu/ad2UMV/onf7Y3GIOcOGxxSk6S9Bh43UFx/CKpXHjZdwscW4ow
	ho/GbsFlf7XHk5Mk7cazaXCK4yS2J/WBCh3Dpx+9+6griHx7QHNi5HI7+4e6aMPN
	wIrzilFINNcOWwtpFZ07mM2/svzo1nukKuWkec4j+ycZvHfsE+kwsd6NSi3E1HhU
	M8gh2SJp3qVHzIczzIDzK2A+67FRABYw==
Received: from webmail.monolithicpower.com (mps-mslbn02.monolithicpower.com [12.192.228.33])
	by mx0a-002bf204.pphosted.com (PPS) with ESMTPS id 3uetu4rc0a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 24 Nov 2023 01:33:21 -0800 (PST)
Received: from CD-MSH04.monolithicpower.com (10.10.70.213) by
 mps-mslbn02.monolithicpower.com (12.192.228.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Fri, 24 Nov 2023 01:33:13 -0800
Received: from smtp.gmail.com (10.10.86.78) by CD-MSH04.monolithicpower.com
 (10.10.70.213) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Fri, 24 Nov
 2023 17:33:11 +0800
From: Yuxi Wang <Yuxi.Wang@monolithicpower.com>
To: <pavel@ucw.cz>, <lee@kernel.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <Yuxi.Wang@monolithicpower.com>
CC: <linux-kernel@vger.kernel.org>, <linux-leds@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <wyx137120466@gmail.com>
Subject: [PATCH 2/2] leds: add mp3326 driver
Date: Fri, 24 Nov 2023 17:30:33 +0800
Message-ID: <20231124093034.951-3-Yuxi.Wang@monolithicpower.com>
X-Mailer: git-send-email 2.42.0.windows.2
In-Reply-To: <20231124093034.951-1-Yuxi.Wang@monolithicpower.com>
References: <20231124093034.951-1-Yuxi.Wang@monolithicpower.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CD-MSLBN02.monolithicpower.com (192.168.86.32) To
 CD-MSH04.monolithicpower.com (10.10.70.213)
X-Proofpoint-GUID: HMIacrSXq9WNaGy41g6tZA0idzQqjgoA
X-Proofpoint-ORIG-GUID: HMIacrSXq9WNaGy41g6tZA0idzQqjgoA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-23_15,2023-11-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 bulkscore=0
 adultscore=0 suspectscore=0 clxscore=1015 mlxlogscore=999 mlxscore=0
 impostorscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311060001 definitions=main-2311240074

This commit adds support for MPS MP3326 LED driver.

Signed-off-by: Yuxi Wang <Yuxi.Wang@monolithicpower.com>
---
 drivers/leds/Kconfig       |   7 +
 drivers/leds/Makefile      |   1 +
 drivers/leds/leds-mp3326.c | 622 +++++++++++++++++++++++++++++++++++++
 3 files changed, 630 insertions(+)
 create mode 100644 drivers/leds/leds-mp3326.c

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index bfa11e7b157f..f9da210c89a2 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -262,6 +262,13 @@ config LEDS_MIKROTIK_RB532
 	  This option enables support for the so called "User LED" of
 	  Mikrotik's Routerboard 532.
 
+config LEDS_MP3326
+	tristate "LED Support for MPS MP3326"
+	depends on LEDS_CLASS
+	help
+	  This option enables support for on-chip LED drivers found on
+	  MPS MP3326.
+
 config LEDS_MT6323
 	tristate "LED Support for Mediatek MT6323 PMIC"
 	depends on LEDS_CLASS
diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
index ce07dc295ff0..c0a8b4b3e7c8 100644
--- a/drivers/leds/Makefile
+++ b/drivers/leds/Makefile
@@ -64,6 +64,7 @@ obj-$(CONFIG_LEDS_MENF21BMC)		+= leds-menf21bmc.o
 obj-$(CONFIG_LEDS_MIKROTIK_RB532)	+= leds-rb532.o
 obj-$(CONFIG_LEDS_MLXCPLD)		+= leds-mlxcpld.o
 obj-$(CONFIG_LEDS_MLXREG)		+= leds-mlxreg.o
+obj-$(CONFIG_LEDS_MP3326)		+= leds-mp3326.o
 obj-$(CONFIG_LEDS_MT6323)		+= leds-mt6323.o
 obj-$(CONFIG_LEDS_NET48XX)		+= leds-net48xx.o
 obj-$(CONFIG_LEDS_NETXBIG)		+= leds-netxbig.o
diff --git a/drivers/leds/leds-mp3326.c b/drivers/leds/leds-mp3326.c
new file mode 100644
index 000000000000..aca95da8c839
--- /dev/null
+++ b/drivers/leds/leds-mp3326.c
@@ -0,0 +1,622 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * MP3326 Led driver
+ *
+ * Copyright 2023 Monolithic Power Systems, Inc
+ *
+ * Author: Yuxi Wang <wyx137120466@gmail.com>
+ */
+#include <linux/bits.h>
+#include <linux/module.h>
+#include <linux/mod_devicetable.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/i2c.h>
+#include <linux/of.h>
+#include <linux/slab.h>
+#include <linux/interrupt.h>
+#include <linux/mutex.h>
+#include <linux/leds.h>
+#include <linux/device.h>
+#include <linux/led-class-multicolor.h>
+
+#define MP3326_PWM_DIM_FREQUENCY_CONFIG			0x00
+#define MP3326_PWM_CTRL							0x01
+#define MP3326_PWM_DIM_FREQUENCY_CONFIG			0x00
+#define MP3326_PWM_CTRL_CHANNEL_9_16			0x04
+#define MP3326_PWM_CTRL_CHANNEL_1_8				0x05
+#define MP3326_PWM_OPEN_FAULT_CHANNEL_9_16		0x06
+#define MP3326_PWM_OPEN_FAULT_CHANNEL_1_8		0x07
+#define MP3326_PWM_SHORT_FAULT_CHANNEL_9_16		0x08
+#define MP3326_PWM_SHORT_FAULT_CHANNEL_1_8		0x09
+#define MP3326_PWM_CURRENT_SET_CHANNEL1			0x0A
+#define MP3326_PWM_DUTY_LSB_SET_CHANNEL1		0x0B
+#define MP3326_PWM_DUTY_MSB_SET_CHANNEL1		0x0C
+#define MP3326_PWM_CURRENT_SET_CHANNEL2			0x0D
+#define MP3326_PWM_DUTY_LSB_SET_CHANNEL2		0x0E
+#define MP3326_PWM_DUTY_MSB_SET_CHANNEL2		0x0F
+#define MP3326_PWM_CURRENT_SET_CHANNEL3			0x10
+#define MP3326_PWM_DUTY_LSB_SET_CHANNEL3		0x11
+#define MP3326_PWM_DUTY_MSB_SET_CHANNEL3		0x12
+#define MP3326_PWM_CURRENT_SET_CHANNEL4			0x13
+#define MP3326_PWM_DUTY_LSB_SET_CHANNEL4		0x14
+#define MP3326_PWM_DUTY_MSB_SET_CHANNEL4		0x15
+#define MP3326_PWM_CURRENT_SET_CHANNEL5			0x16
+#define MP3326_PWM_DUTY_LSB_SET_CHANNEL5		0x17
+#define MP3326_PWM_DUTY_MSB_SET_CHANNEL5		0x18
+#define MP3326_PWM_CURRENT_SET_CHANNEL6			0x19
+#define MP3326_PWM_DUTY_LSB_SET_CHANNEL6		0x1A
+#define MP3326_PWM_DUTY_MSB_SET_CHANNEL6		0x1B
+#define MP3326_PWM_CURRENT_SET_CHANNEL7			0x1C
+#define MP3326_PWM_DUTY_LSB_SET_CHANNEL7		0x1D
+#define MP3326_PWM_DUTY_MSB_SET_CHANNEL7		0x1E
+#define MP3326_PWM_CURRENT_SET_CHANNEL8			0x1F
+#define MP3326_PWM_DUTY_LSB_SET_CHANNEL8		0x20
+#define MP3326_PWM_DUTY_MSB_SET_CHANNEL8		0x21
+#define MP3326_PWM_CURRENT_SET_CHANNEL9			0x22
+#define MP3326_PWM_DUTY_LSB_SET_CHANNEL9		0x23
+#define MP3326_PWM_DUTY_MSB_SET_CHANNEL9		0x24
+#define MP3326_PWM_CURRENT_SET_CHANNEL10		0x25
+#define MP3326_PWM_DUTY_LSB_SET_CHANNEL10		0x26
+#define MP3326_PWM_DUTY_MSB_SET_CHANNEL10		0x27
+#define MP3326_PWM_CURRENT_SET_CHANNEL11		0x28
+#define MP3326_PWM_DUTY_LSB_SET_CHANNEL11		0x29
+#define MP3326_PWM_DUTY_MSB_SET_CHANNEL11		0x2A
+#define MP3326_PWM_CURRENT_SET_CHANNEL12		0x2B
+#define MP3326_PWM_DUTY_LSB_SET_CHANNEL12		0x2C
+#define MP3326_PWM_DUTY_MSB_SET_CHANNEL12		0x2D
+#define MP3326_PWM_CURRENT_SET_CHANNEL13		0x2E
+#define MP3326_PWM_DUTY_LSB_SET_CHANNEL13		0x2F
+#define MP3326_PWM_DUTY_MSB_SET_CHANNEL13		0x30
+#define MP3326_PWM_CURRENT_SET_CHANNEL14		0x31
+#define MP3326_PWM_DUTY_LSB_SET_CHANNEL14		0x32
+#define MP3326_PWM_DUTY_MSB_SET_CHANNEL14		0x33
+#define MP3326_PWM_CURRENT_SET_CHANNEL15		0x34
+#define MP3326_PWM_DUTY_LSB_SET_CHANNEL15		0x35
+#define MP3326_PWM_DUTY_MSB_SET_CHANNEL15		0x36
+#define MP3326_PWM_CURRENT_SET_CHANNEL16		0x37
+#define MP3326_PWM_DUTY_LSB_SET_CHANNEL16		0x38
+#define MP3326_PWM_DUTY_MSB_SET_CHANNEL16		0x39
+#define MAX_BRIGHTNESS	63
+
+enum led_ctrl {
+	ENABLE = 0,
+	BRIGHTNESS,
+	COLOR_L4,
+	COLOR_H8,
+	OPEN_FAULT,
+	SHORT_FAULT,
+	MAX_CTRL,
+};
+
+enum mp3326_channel {
+	CHANNEL1,
+	CHANNEL2,
+	CHANNEL3,
+	CHANNEL4,
+	CHANNEL5,
+	CHANNEL6,
+	CHANNEL7,
+	CHANNEL8,
+	CHANNEL9,
+	CHANNEL10,
+	CHANNEL11,
+	CHANNEL12,
+	CHANNEL13,
+	CHANNEL14,
+	CHANNEL15,
+	CHANNEL16,
+	MAX_CHANNEL,
+};
+
+#define MP3326_REG_CONNECT_INNER(prefix, range)	prefix##range
+#define MP3326_REG_CONNECT(prefix, range)		MP3326_REG_CONNECT_INNER(prefix, range)
+#define MP3326_REG_FIELD(reg, minbit, maxbit)	REG_FIELD(reg, minbit, maxbit)
+#define RANGE(a, b) MP3326_REG_CONNECT_INNER(a, b)
+
+#define MP3326_CHANNEL_FIELD(bit, num, range) { \
+	MP3326_REG_FIELD(MP3326_REG_CONNECT(MP3326_PWM_CTRL_CHANNEL, range), bit, bit),	\
+	MP3326_REG_FIELD(MP3326_REG_CONNECT(MP3326_PWM_CURRENT_SET_CHANNEL, num), 0, 5),	\
+	MP3326_REG_FIELD(MP3326_REG_CONNECT(MP3326_PWM_DUTY_LSB_SET_CHANNEL, num), 0, 3),	\
+	MP3326_REG_FIELD(MP3326_REG_CONNECT(MP3326_PWM_DUTY_MSB_SET_CHANNEL, num), 0, 7),	\
+	MP3326_REG_FIELD(MP3326_REG_CONNECT(MP3326_PWM_OPEN_FAULT_CHANNEL, range), bit, bit),	\
+	MP3326_REG_FIELD(MP3326_REG_CONNECT(MP3326_PWM_SHORT_FAULT_CHANNEL, range), bit, bit), \
+	}
+struct mp3326_led {
+	struct mp3326 *private_data;
+	struct led_classdev cdev;
+	struct mc_subled *subled_info;
+	int num_colors;
+};
+
+struct mp3326 {
+	struct i2c_client *client;
+	struct regmap *regmap;
+	struct regmap_field *regmap_fields[MAX_CHANNEL][MAX_CTRL];
+	int num_of_leds;
+	struct mp3326_led leds[];
+};
+
+static const struct regmap_config MP3326_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+};
+
+static const struct reg_field channels_reg_fields[MAX_CHANNEL][MAX_CTRL] = {
+	[CHANNEL1] = MP3326_CHANNEL_FIELD(0, 1, RANGE(_1, _8)),
+	[CHANNEL2] = MP3326_CHANNEL_FIELD(1, 2, RANGE(_1, _8)),
+	[CHANNEL3] = MP3326_CHANNEL_FIELD(2, 3, RANGE(_1, _8)),
+	[CHANNEL4] = MP3326_CHANNEL_FIELD(3, 4, RANGE(_1, _8)),
+	[CHANNEL5] = MP3326_CHANNEL_FIELD(4, 5, RANGE(_1, _8)),
+	[CHANNEL6] = MP3326_CHANNEL_FIELD(5, 6, RANGE(_1, _8)),
+	[CHANNEL7] = MP3326_CHANNEL_FIELD(6, 7, RANGE(_1, _8)),
+	[CHANNEL8] = MP3326_CHANNEL_FIELD(7, 8, RANGE(_1, _8)),
+	[CHANNEL9] = MP3326_CHANNEL_FIELD(0, 9, RANGE(_9, _16)),
+	[CHANNEL10] = MP3326_CHANNEL_FIELD(1, 10, RANGE(_9, _16)),
+	[CHANNEL11] = MP3326_CHANNEL_FIELD(2, 11, RANGE(_9, _16)),
+	[CHANNEL12] = MP3326_CHANNEL_FIELD(3, 12, RANGE(_9, _16)),
+	[CHANNEL13] = MP3326_CHANNEL_FIELD(4, 13, RANGE(_9, _16)),
+	[CHANNEL14] = MP3326_CHANNEL_FIELD(5, 14, RANGE(_9, _16)),
+	[CHANNEL15] = MP3326_CHANNEL_FIELD(6, 15, RANGE(_9, _16)),
+	[CHANNEL16] = MP3326_CHANNEL_FIELD(7, 16, RANGE(_9, _16)),
+};
+
+static int led_brightness_set(struct led_classdev *led_cdev, enum led_brightness brightness)
+{
+	struct mp3326_led *led = container_of(led_cdev, struct mp3326_led, cdev);
+	struct mp3326 *chip = led->private_data;
+	int ret;
+	int i;
+
+	if (brightness > led_cdev->max_brightness)
+		brightness = led_cdev->max_brightness;
+	if (brightness < 0)
+		brightness = 0;
+	for (i = 0; i < led->num_colors; i++) {
+		ret = regmap_field_write(
+			chip->regmap_fields[led->subled_info[i].channel][BRIGHTNESS],
+			brightness);
+		if (ret)
+			return ret;
+		led->subled_info[i].brightness = brightness;
+	}
+	led_cdev->brightness = brightness;
+	return 0;
+}
+
+static ssize_t led_pwm_store(struct device *dev, struct device_attribute *attr,
+			 const char *buf, size_t count)
+{
+	struct led_classdev *lcdev = dev_get_drvdata(dev);
+	struct mp3326_led *led = container_of(lcdev, struct mp3326_led, cdev);
+	struct mp3326 *chip = led->private_data;
+	ssize_t ret;
+	int r_val, g_val, b_val;
+	int i;
+
+	ret = sscanf(buf, "%i %i %i", &r_val, &g_val, &b_val);
+	if (ret != 3 && ret != 1)
+		return ret;
+	r_val = r_val * 4095 / 255 + (r_val * 4095 % 255) / (255 / 2);
+	g_val = g_val * 4095 / 255 + (g_val * 4095 % 255) / (255 / 2);
+	b_val = b_val * 4095 / 255 + (b_val * 4095 % 255) / (255 / 2);
+	for (i = 0; i < led->num_colors; i++) {
+		switch (led->subled_info[i].color_index) {
+		case LED_COLOR_ID_RED:
+			ret = regmap_field_write(
+				chip->regmap_fields[led->subled_info[i].channel][COLOR_L4],
+				r_val & 0x0f);
+			if (ret)
+				return ret;
+			ret = regmap_field_write(
+				chip->regmap_fields[led->subled_info[i].channel][COLOR_H8],
+				r_val >> 4);
+			if (ret)
+				return ret;
+			break;
+		case LED_COLOR_ID_GREEN:
+			ret = regmap_field_write(
+				chip->regmap_fields[led->subled_info[i].channel][COLOR_L4],
+				g_val & 0x0f);
+			if (ret)
+				return ret;
+			ret = regmap_field_write(
+				chip->regmap_fields[led->subled_info[i].channel][COLOR_H8],
+				g_val >> 4);
+			if (ret)
+				return ret;
+			break;
+		case LED_COLOR_ID_BLUE:
+			ret = regmap_field_write(
+				chip->regmap_fields[led->subled_info[i].channel][COLOR_L4],
+				b_val & 0x0f);
+			if (ret)
+				return ret;
+			ret = regmap_field_write(
+				chip->regmap_fields[led->subled_info[i].channel][COLOR_H8],
+				b_val >> 4);
+			if (ret)
+				return ret;
+			break;
+		default:
+			ret = regmap_field_write(
+				chip->regmap_fields[led->subled_info[i].channel][COLOR_L4],
+				r_val & 0x0f);
+			if (ret)
+				return ret;
+			ret = regmap_field_write(
+				chip->regmap_fields[led->subled_info[i].channel][COLOR_H8],
+				r_val >> 4);
+			if (ret)
+				return ret;
+			break;
+		}
+	}
+	return count;
+}
+
+static ssize_t led_pwm_show(struct device *dev, struct device_attribute *attr,
+			char *buf)
+{
+	struct led_classdev *lcdev = dev_get_drvdata(dev);
+	struct mp3326_led *led = container_of(lcdev, struct mp3326_led, cdev);
+	struct mp3326 *chip = led->private_data;
+	ssize_t ret;
+	int r_val = 0, g_val = 0, b_val = 0, val;
+	int i;
+
+	for (i = 0; i < led->num_colors; i++) {
+		switch (led->subled_info[i].color_index) {
+		case LED_COLOR_ID_RED:
+			ret = regmap_field_read(
+				chip->regmap_fields[led->subled_info[i].channel][COLOR_L4], &val);
+			if (ret)
+				return ret;
+			r_val |= val;
+			ret = regmap_field_read(
+				chip->regmap_fields[led->subled_info[i].channel][COLOR_H8], &val);
+			if (ret)
+				return ret;
+			r_val |= val << 4;
+			break;
+		case LED_COLOR_ID_GREEN:
+			ret = regmap_field_read(
+				chip->regmap_fields[led->subled_info[i].channel][COLOR_L4], &val);
+			if (ret)
+				return ret;
+			g_val |= val;
+			ret = regmap_field_read(
+				chip->regmap_fields[led->subled_info[i].channel][COLOR_H8], &val);
+			if (ret)
+				return ret;
+			g_val |= val << 4;
+			break;
+		case LED_COLOR_ID_BLUE:
+			ret = regmap_field_read(
+				chip->regmap_fields[led->subled_info[i].channel][COLOR_L4], &val);
+			if (ret)
+				return ret;
+			b_val |= val;
+			ret = regmap_field_read(
+				chip->regmap_fields[led->subled_info[i].channel][COLOR_H8], &val);
+			if (ret)
+				return ret;
+			b_val |= val << 4;
+			break;
+		default:
+			ret = regmap_field_read(
+				chip->regmap_fields[led->subled_info[i].channel][COLOR_L4], &val);
+			if (ret)
+				return ret;
+			r_val |= val;
+			ret = regmap_field_read(
+				chip->regmap_fields[led->subled_info[i].channel][COLOR_H8], &val);
+			if (ret)
+				return ret;
+			r_val |= val << 4;
+			break;
+		}
+	}
+	r_val = r_val * 255 / 4095 + (r_val * 255 % 4095) / (4095 / 2);
+	g_val = g_val * 255 / 4095 + (g_val * 255 % 4095) / (4095 / 2);
+	b_val = b_val * 255 / 4095 + (b_val * 255 % 4095) / (4095 / 2);
+	if (led->num_colors == 1)
+		return sysfs_emit(buf, "0x%x\n", r_val);
+	else
+		return sysfs_emit(buf, "0x%x 0x%x 0x%x\n", r_val, g_val, b_val);
+}
+
+static ssize_t led_enable_store(struct device *dev, struct device_attribute *attr,
+			 const char *buf, size_t count)
+{
+	struct led_classdev *lcdev = dev_get_drvdata(dev);
+	struct mp3326_led *led = container_of(lcdev, struct mp3326_led, cdev);
+	struct mp3326 *chip = led->private_data;
+	ssize_t ret;
+	uint val, i;
+
+	ret = kstrtouint(buf, 0, &val);
+	if (ret)
+		return ret;
+	for (i = 0; i < led->num_colors; i++) {
+		ret = regmap_field_write(
+			chip->regmap_fields[led->subled_info[i].channel][BRIGHTNESS],
+			led->subled_info[i].brightness);
+		if (ret)
+			return ret;
+		ret = regmap_field_write(
+			chip->regmap_fields[led->subled_info[i].channel][ENABLE], !!val);
+		if (ret)
+			return ret;
+	}
+
+	return count;
+}
+
+static ssize_t led_enable_show(struct device *dev, struct device_attribute *attr,
+			char *buf)
+{
+	struct led_classdev *lcdev = dev_get_drvdata(dev);
+	struct mp3326_led *led = container_of(lcdev, struct mp3326_led, cdev);
+	struct mp3326 *chip = led->private_data;
+	uint val, rval = 0;
+	int i, ret;
+
+	for (i = 0; i < led->num_colors; i++) {
+		ret = regmap_field_read(
+			chip->regmap_fields[led->subled_info[i].channel][ENABLE], &val);
+
+		rval |= val << i;
+		if (ret)
+			return ret;
+	}
+
+	if (rval)
+		return sysfs_emit(buf, "%s\n", "True");
+	else
+		return sysfs_emit(buf, "%s\n", "False");
+}
+
+static ssize_t led_short_fault_show(struct device *dev, struct device_attribute *attr,
+			char *buf)
+{
+	struct led_classdev *lcdev = dev_get_drvdata(dev);
+	struct mp3326_led *led = container_of(lcdev, struct mp3326_led, cdev);
+	struct mp3326 *chip = led->private_data;
+	uint val, rval = 0, i;
+	int ret;
+
+	for (i = 0; i < led->num_colors; i++) {
+		ret = regmap_field_read(
+			chip->regmap_fields[led->subled_info[i].channel][SHORT_FAULT], &val);
+		rval |= val << i;
+		if (ret)
+			return ret;
+	}
+
+	if (rval)
+		return sysfs_emit(buf, "%s\n", "Occur");
+	else
+		return sysfs_emit(buf, "%s\n", "None");
+}
+
+static ssize_t led_open_fault_show(struct device *dev, struct device_attribute *attr,
+			char *buf)
+{
+	struct led_classdev *lcdev = dev_get_drvdata(dev);
+	struct mp3326_led *led = container_of(lcdev, struct mp3326_led, cdev);
+	struct mp3326 *chip = led->private_data;
+	uint val, rval = 0, i;
+	int ret;
+
+	for (i = 0; i < led->num_colors; i++) {
+		ret = regmap_field_read(
+			chip->regmap_fields[led->subled_info[i].channel][OPEN_FAULT], &val);
+		rval |= val << i;
+		if (ret)
+			return ret;
+	}
+
+	if (rval)
+		return sysfs_emit(buf, "%s\n", "Occur");
+	else
+		return sysfs_emit(buf, "%s\n", "None");
+}
+
+static DEVICE_ATTR_RW(led_pwm);
+static DEVICE_ATTR_RW(led_enable);
+static DEVICE_ATTR_RO(led_short_fault);
+static DEVICE_ATTR_RO(led_open_fault);
+
+static struct attribute *led_sysfs_attrs[] = {
+	&dev_attr_led_pwm.attr,
+	&dev_attr_led_enable.attr,
+	&dev_attr_led_short_fault.attr,
+	&dev_attr_led_open_fault.attr,
+	NULL,
+};
+
+ATTRIBUTE_GROUPS(led_sysfs);
+
+static int mp3326_add_led(struct mp3326 *chip, struct device_node *np, int index)
+{
+	struct mp3326_led *led = &chip->leds[index];
+	struct mc_subled *info;
+	struct device_node *child;
+	struct led_classdev *cdev;
+	struct led_init_data init_data = {};
+	int ret;
+	int i = 0;
+	int count;
+	u32 color = 0;
+	u32 reg = 0;
+
+	ret = of_property_read_u32(np, "color", &color);
+	if (ret) {
+		dev_err(&chip->client->dev, "Miss color in the node\n");
+		return ret;
+	}
+	led->private_data = chip;
+	if (color == LED_COLOR_ID_RGB) {
+		count = of_get_child_count(np);
+		if (count != 3) {
+			dev_err(&chip->client->dev, "RGB must have three node.\n");
+			return -EINVAL;
+		}
+
+		info = devm_kcalloc(&chip->client->dev, 3, sizeof(*info), GFP_KERNEL);
+		if (!info)
+			return -ENOMEM;
+
+		for_each_available_child_of_node(np, child) {
+			ret = of_property_read_u32(child, "reg", &reg);
+			if (ret || reg > MAX_CHANNEL) {
+				dev_err(&chip->client->dev,
+				"reg must less or equal than %d\n", MAX_CHANNEL);
+				return -EINVAL;
+			}
+
+			ret = of_property_read_u32(child, "color", &color);
+			if (ret) {
+				dev_err(&chip->client->dev, "color must have value\n");
+				return ret;
+			}
+
+			if (color > 3 || !color) {
+				dev_err(&chip->client->dev,
+				"color must be Red, Green and Blue. The color is %d\n", color);
+				return ret;
+			}
+			info[i].color_index = color;
+			info[i].channel = reg - 1;
+			info[i].brightness = 0;
+			i++;
+		}
+
+		led->subled_info = info;
+		led->num_colors = 3;
+		cdev = &led->cdev;
+		cdev->max_brightness = MAX_BRIGHTNESS;
+		cdev->brightness_set_blocking = led_brightness_set;
+		cdev->groups = led_sysfs_groups;
+		init_data.fwnode = &np->fwnode;
+
+		ret = devm_led_classdev_register_ext(&chip->client->dev, &led->cdev, &init_data);
+
+		if (ret) {
+			dev_err(&chip->client->dev, "Unable register multicolor:%s\n", cdev->name);
+			return ret;
+		}
+	} else {
+		ret = of_property_read_u32(np, "reg", &reg);
+		if (ret || reg > MAX_CHANNEL) {
+			dev_err(&chip->client->dev,
+			"reg must less or equal than %d\n", MAX_CHANNEL);
+			return -EINVAL;
+		}
+		info = devm_kcalloc(&chip->client->dev, 1, sizeof(*info), GFP_KERNEL);
+		led->num_colors = 1;
+		info[i].color_index = LED_COLOR_ID_WHITE;
+		info[i].channel = reg - 1;
+		info[i].brightness = 0;
+		led->subled_info = info;
+		cdev = &led->cdev;
+		cdev->max_brightness = MAX_BRIGHTNESS;
+		cdev->brightness_set_blocking = led_brightness_set;
+		cdev->groups = led_sysfs_groups;
+		init_data.fwnode = &np->fwnode;
+		ret = devm_led_classdev_register_ext(&chip->client->dev, &led->cdev, &init_data);
+		if (ret) {
+			dev_err(&chip->client->dev, "Unable register led:%s\n", cdev->name);
+			return ret;
+		}
+	}
+	return ret;
+}
+
+static int mp3326_parse_dt(struct mp3326 *chip)
+{
+	struct device_node *np = dev_of_node(&chip->client->dev);
+	struct device_node *child;
+	int ret;
+	int i = 0;
+	int val;
+
+	for_each_available_child_of_node(np, child) {
+		ret = mp3326_add_led(chip, child, i);
+		if (ret)
+			return ret;
+		i++;
+	}
+
+	ret = regmap_write(chip->regmap, MP3326_PWM_CTRL_CHANNEL_9_16, 0);
+	if (ret)
+		return ret;
+	ret = regmap_write(chip->regmap, MP3326_PWM_CTRL_CHANNEL_1_8, 0);
+	if (ret)
+		return ret;
+	return 0;
+}
+
+static int mp3326_leds_probe(struct i2c_client *client)
+{
+	struct mp3326 *chip;
+	const struct reg_field *reg_fields;
+	int count, i, j;
+
+	count = device_get_child_node_count(&client->dev);
+	if (!count) {
+		return dev_err_probe(&client->dev, -EINVAL,
+				"Incorrect number of leds (%d)", count);
+	}
+	chip = devm_kzalloc(&client->dev, struct_size(chip, leds, count), GFP_KERNEL);
+	if (!chip)
+		return -ENOMEM;
+
+	chip->client = client;
+	chip->num_of_leds = count;
+	i2c_set_clientdata(client, chip);
+	chip->regmap = devm_regmap_init_i2c(client, &MP3326_regmap_config);
+	if (IS_ERR(chip->regmap))
+		return PTR_ERR(chip->regmap);
+
+	for (i = 0; i < MAX_CHANNEL; i++) {
+		reg_fields = channels_reg_fields[i];
+		for (j = 0; j < MAX_CTRL; j++) {
+			chip->regmap_fields[i][j] = devm_regmap_field_alloc(&client->dev,
+			chip->regmap, reg_fields[j]);
+			if (IS_ERR(chip->regmap_fields[i][j]))
+				return PTR_ERR(chip->regmap_fields[i][j]);
+		}
+	}
+	if (mp3326_parse_dt(chip))
+		return 1;
+	else
+		return 0;
+}
+
+static const struct i2c_device_id mp3326_id[] = {
+	{"mp3326", 0},
+	{}
+};
+MODULE_DEVICE_TABLE(i2c, mp3326_id);
+
+static const struct of_device_id mp3326_of_match[] = {
+	{ .compatible = "mps,mp3326" },
+	{}
+};
+MODULE_DEVICE_TABLE(of, mp3326_of_match);
+
+static struct i2c_driver mp3326_driver = {
+	.probe_new = mp3326_leds_probe,
+	.driver = {
+			.name = "mp3326_led",
+			.of_match_table = mp3326_of_match,
+		   },
+	.id_table = mp3326_id,
+};
+
+module_i2c_driver(mp3326_driver);
+MODULE_AUTHOR("Yuxi Wang <wyx137120466@gmail.com>");
+MODULE_DESCRIPTION("MPS MP3326 LED driver");
+MODULE_LICENSE("GPL");
-- 
2.25.1


