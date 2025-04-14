Return-Path: <linux-leds+bounces-4467-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A1DDA8846D
	for <lists+linux-leds@lfdr.de>; Mon, 14 Apr 2025 16:19:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CAF3E1746A5
	for <lists+linux-leds@lfdr.de>; Mon, 14 Apr 2025 14:12:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 576CC28B4F2;
	Mon, 14 Apr 2025 13:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=helmholz.de header.i=@helmholz.de header.b="d0TkDnFA"
X-Original-To: linux-leds@vger.kernel.org
Received: from www253.your-server.de (www253.your-server.de [188.40.28.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A76B2472B7;
	Mon, 14 Apr 2025 13:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.28.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744638389; cv=none; b=ixESazQ5yMgXtOoS19Xf/An5DoyJghWoc8hg9oVytk5izdO5soCfXzrZSi6ZkLK7WLxBXEla4M5bHDUsHNMtPlcJw29DJxLPPT4+YtyEYO5v6Znmhr8ld4i3Apd4XpsnJGxP2Hq/e+VyvKpJUPQ/2uL8zLbazv2Q76XISoLHewU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744638389; c=relaxed/simple;
	bh=xmsOnDOjo3Gh0c8VjCn6ItGeDlnjjCWP+KrNE+An+XU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 In-Reply-To:References; b=p3b2N3rS9ss4raaOD3lnMAScCo+jbWYomIdFqA9dDlLobbCzreFXOwVugH3D24SrwvXgwgSxY+xhDoCSTAp6p9XJIgy9saq2guw3C8xoQ13ZLQEWN4DfCL5PKPec71wd7DTUC1uuDs4Z+3/W/YZjvOR1YJlHTpe/WkFF0sBy/vI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=helmholz.de; spf=fail smtp.mailfrom=helmholz.de; dkim=pass (2048-bit key) header.d=helmholz.de header.i=@helmholz.de header.b=d0TkDnFA; arc=none smtp.client-ip=188.40.28.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=helmholz.de
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=helmholz.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=helmholz.de
	; s=default2501; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=BHZt5LYaNN8WM8VT/BDNr4lbPIgy0/I77v+TYnQnxow=; b=d0TkDnFAaY4lQ+DVtf2MbRPeXm
	oHEYwJkcJ3eGfMxOn88OKkV9ubIquhun9Iw4JHdmyX8hR5IagNh5Q7AB/kA69LtMFOTdKKSqHbN96
	nK9ax4EOXTZ/5y36IiaJTwzy25YjX1SC/ZJVZLOeLb1BCGhFpUiF60lzmtXMZCD0bHLCVMgIvR7Nh
	y+3SJdtyC4Pb92COPBYoCy8AU3wiih0fpEZYRhSlaOjoyZOoBb2ufWURVXRKj0d5/OvqUFzDSCeUf
	QfSU4ECxnc3u6qkiKARFAko9FE2eTEftZDYYD8KMKD/XrU4RA50bmcD631TxttDHEUaDHxI9GGdz0
	JKxcuLFQ==;
Received: from sslproxy08.your-server.de ([78.47.166.52])
	by www253.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <ante.knezic@helmholz.de>)
	id 1u4JsV-0008nn-07;
	Mon, 14 Apr 2025 15:29:35 +0200
Received: from [217.6.86.34] (helo=linuxdev.helmholz.local)
	by sslproxy08.your-server.de with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA
	(Exim 4.96)
	(envelope-from <ante.knezic@helmholz.de>)
	id 1u4JsU-000Eer-1p;
	Mon, 14 Apr 2025 15:29:34 +0200
From: Ante Knezic <ante.knezic@helmholz.de>
To: linux-leds@vger.kernel.org
Cc: lee@kernel.org,
	pavel@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net,
	knezic@helmholz.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH 3/3] leds: add WL-ICLED SPI driver
Date: Mon, 14 Apr 2025 15:28:51 +0200
Message-Id: <d8c165eb992b73f58c2fd7dc6c4ac3b2db38248f.1744636666.git.knezic@helmholz.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1744636666.git.knezic@helmholz.com>
References: <cover.1744636666.git.knezic@helmholz.com>
In-Reply-To: <cover.1744636666.git.knezic@helmholz.com>
References: <cover.1744636666.git.knezic@helmholz.com>
X-Authenticated-Sender: knezic@helmholz.com
X-Virus-Scanned: Clear (ClamAV 1.0.7/27608/Mon Apr 14 10:34:28 2025)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

From: Ante Knezic <knezic@helmholz.com>

Add support for WL-ICLED RGB LEDs with integrated controller.
Device enables individual color control via SPI interface and
can be interfaced via single wire connection (MOSI line only)
or by two wire connection (MOSI and CLK).

Signed-off-by: Ante Knezic <knezic@helmholz.com>
---
 drivers/leds/Kconfig         |  10 +
 drivers/leds/Makefile        |   1 +
 drivers/leds/leds-wl-icled.c | 406 +++++++++++++++++++++++++++++++++++
 3 files changed, 417 insertions(+)
 create mode 100644 drivers/leds/leds-wl-icled.c

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index a104cbb0a001..a8100a7ee72b 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -950,6 +950,16 @@ config LEDS_SPI_BYTE
 	  for controlling the brightness. Currently the following controller is
 	  supported: Ubiquiti airCube ISP microcontroller based LED controller.
 
+config LEDS_WL_ICLED
+	tristate "LED Support for WL-ICLED RGB LEDs"
+	depends on LEDS_CLASS
+	depends on SPI
+	depends on OF
+	depends on LEDS_CLASS_MULTICOLOR
+	help
+	  Say yes to get support for the Wurth Elektronik WL-ICLED series RGB
+	  LEDs with integrated controller.
+
 config LEDS_TI_LMU_COMMON
 	tristate "LED driver for TI LMU" if COMPILE_TEST
 	select REGMAP
diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
index 2f170d69dcbf..42e8849fa619 100644
--- a/drivers/leds/Makefile
+++ b/drivers/leds/Makefile
@@ -106,6 +106,7 @@ obj-$(CONFIG_LEDS_CR0014114)		+= leds-cr0014114.o
 obj-$(CONFIG_LEDS_DAC124S085)		+= leds-dac124s085.o
 obj-$(CONFIG_LEDS_EL15203000)		+= leds-el15203000.o
 obj-$(CONFIG_LEDS_SPI_BYTE)		+= leds-spi-byte.o
+obj-$(CONFIG_LEDS_WL_ICLED)		+= leds-wl-icled.o
 
 # LED Userspace Drivers
 obj-$(CONFIG_LEDS_USER)			+= uleds.o
diff --git a/drivers/leds/leds-wl-icled.c b/drivers/leds/leds-wl-icled.c
new file mode 100644
index 000000000000..ce44ed4d1fe5
--- /dev/null
+++ b/drivers/leds/leds-wl-icled.c
@@ -0,0 +1,406 @@
+// SPDX-License-Identifier: GPL-2.0-only
+// LED driver for Wurth Elektronik WL-ICLED
+// Copyright (C) Systeme Helmholz - https://www.helmholz.de
+
+#include <linux/leds.h>
+#include <linux/spi/spi.h>
+#include <linux/led-class-multicolor.h>
+
+#define WL_ICLED_LEDS_PER_IC 3
+#define WL_ICLED_MAX_BRIGHTNESS 255
+
+#define WL_ICLED_32E_CMD_WRITE 0x7
+#define WL_ICLED_32E_CMD_SLEEP 0x5
+#define WL_ICLED_32E_CMD_SHIFT 5
+#define WL_ICLED_32E_MAX_GAIN 31
+#define WL_ICLED_32E_GAIN_MASK 0x1f
+#define WL_ICLED_32E_START_FRAME_SIZE 4
+
+#define WL_ICLED_48E_MAX_GAIN 15
+#define WL_ICLED_48E_MAX_PWM 4095
+#define WL_ICLED_48E_GAIN_SHIFT 12
+#define WL_ICLED_48E_PWM_MASK 0xfff
+
+enum wl_icled_type {
+	WL_ICLED_SINGLE_WIRE,
+	WL_ICLED_TWO_WIRE,
+};
+
+struct wl_icled_led {
+	struct led_classdev_mc	mc_cdev;
+	struct wl_icled	*priv;
+	int brightness;
+};
+
+struct wl_icled_info {
+	int model_id;
+	int color_sequence[WL_ICLED_LEDS_PER_IC];
+	void (*encode)(u8 *buf, struct wl_icled_led *led);
+	enum wl_icled_type type;
+	size_t bytes_per_led;
+	unsigned int speed_hz;
+};
+
+enum wl_icled_model {
+	WL1315X246,     /*1315050930246 */
+	WL1315X002,     /*1315050930002*/
+	WL131X000,      /*1313210530000*/
+			/*1312020030000*/
+	WL131161X,      /*1311610030140 */
+	WL131212X,      /*1312121320437 */
+};
+
+struct wl_icled {
+	const struct wl_icled_info *icled_info;
+	struct device *dev;
+	struct mutex lock;
+	struct spi_device *spi;
+	size_t count;
+	u8 *buf;
+	struct wl_icled_led leds[];
+};
+
+static void wl_icled_encode_24bit(u8 *buf, struct wl_icled_led *led)
+{
+ /* WE 1315050930002, 1313210530000 and 1312020030000 control sequence:
+  * +---------------------------+---+----------------------------+
+  * |            LED 1          |...|         LED n              |
+  * +---------------------------+--------------------------------+
+  * |  GREEN  |  RED   |  BLUE  |...|  GREEN   |  RED   |  BLUE  |
+  * +---------+--------+--------+--------------+--------+--------+
+  * |    8    |   8    |    8   |...|     8    |   8    |    8   |
+  * +---------------------------+---+----------------------------+
+  */
+	u8 pattern_true, pattern_false;
+	int i, j;
+
+	pattern_false = 0xc0;
+	pattern_true = (led->priv->icled_info->model_id == WL1315X002) ?
+			0xf0 : 0xfc;
+
+	for (i = 0; i < WL_ICLED_LEDS_PER_IC; i++) {
+		for (j = 7; j >= 0; j--, buf++)
+			*buf = led->mc_cdev.subled_info[i].brightness & BIT(j) ?
+			       pattern_true : pattern_false;
+	}
+}
+
+static void wl_icled_encode_48bit(u8 *buf, struct wl_icled_led *led)
+{
+ /* WE-1312121320437 control sequence:
+  * +--------------------------+---+--------------------------+
+  * |            LED 1         |...|            LED n         |
+  * +--------------------------+---+--------------------------+
+  * |  RED   |  GREEN |  BLUE  |...|  RED   |  GREEN |  BLUE  |
+  * +--------+--------+--------+---+--------+--------+--------+
+  * |GAIN|PWM|GAIN|PWM|GAIN|PWM|...|GAIN|PWM|GAIN|PWM|GAIN|PWM|
+  * +----+---+----+---+----+---+---+----+---+----+---+----+---|
+  * | 4  |12 | 4  |12 | 4  |12 |...| 4  |12 | 4  |12 | 4  |12 |
+  * +---------------------------------------------------------+
+  */
+	u8 pattern_true, pattern_false;
+	int i, j;
+
+	pattern_false = 0xc0;
+	pattern_true = 0xfc;
+
+	for (i = 0; i < WL_ICLED_LEDS_PER_IC; i++) {
+		unsigned int brightness;
+		u16 led_sequence;
+
+		brightness = led->mc_cdev.subled_info[i].brightness;
+
+		led_sequence = ((brightness * WL_ICLED_48E_MAX_PWM)/
+				WL_ICLED_MAX_BRIGHTNESS) &
+				WL_ICLED_48E_PWM_MASK;
+		led_sequence |= ((brightness * WL_ICLED_48E_MAX_GAIN)/
+				WL_ICLED_MAX_BRIGHTNESS) <<
+				WL_ICLED_48E_GAIN_SHIFT;
+
+		for (j = 15; j >= 0; j--, buf++)
+			*buf = led_sequence & BIT(j) ?
+			       pattern_true : pattern_false;
+	}
+
+}
+
+static void wl_icled_encode_32bit(u8 *buf, struct wl_icled_led *led)
+{
+ /* WE 1315050930246 and 1311610030140 control sequence:
+  * |--------------+------+------+-----------------------+-------------+
+  * |  Start Frame | Flag | Gain |      PWM  level       |  End Frame  |
+  * +--------------+------+------+-----------------------+-------------+
+  * |              |             |LED1 | LED2| LED3| LEDn|             |
+  * |              +-------------+-----+-----+-----+-----+             |
+  * |              | 3bit | 5bit |B|G|R|B|G|R|B|G|R|B|G|R|             |
+  * +--------------+-------------+-----------------------+-------------+
+  * |   3 bytes    |    1 byte   |        n * 3 bytes    |(n+7)/8bytes |
+  * +--------------+-------------+-----------------------+-------------+
+  */
+	int i;
+
+	*buf = (WL_ICLED_32E_CMD_WRITE << WL_ICLED_32E_CMD_SHIFT) |
+	       (((led->brightness * WL_ICLED_32E_MAX_GAIN)/
+		WL_ICLED_MAX_BRIGHTNESS) & WL_ICLED_32E_GAIN_MASK);
+	buf++;
+
+	for (i = 0; i < WL_ICLED_LEDS_PER_IC; i++, buf++)
+		*buf = led->mc_cdev.subled_info[i].brightness;
+}
+
+static const struct wl_icled_info wl_icled_info_tbl[] = {
+
+	[WL1315X246] = {/* 1315050930246 */
+		.model_id = WL1315X246,
+		.color_sequence = { LED_COLOR_ID_BLUE,
+				    LED_COLOR_ID_GREEN,
+				    LED_COLOR_ID_RED },
+		.bytes_per_led = 4,
+		.encode = wl_icled_encode_32bit,
+		.type = WL_ICLED_TWO_WIRE,
+	},
+	[WL1315X002] = { /*1315050930002*/
+		.model_id = WL1315X002,
+		.color_sequence = { LED_COLOR_ID_GREEN,
+				    LED_COLOR_ID_RED,
+				    LED_COLOR_ID_BLUE },
+		.bytes_per_led = 24,
+		.encode = wl_icled_encode_24bit,
+		.speed_hz = 5333333,
+		.type = WL_ICLED_SINGLE_WIRE,
+	},
+	[WL131X000] = { /*1313210530000*/ /*1312020030000*/
+		.model_id = WL131X000,
+		.color_sequence = { LED_COLOR_ID_GREEN,
+				    LED_COLOR_ID_RED,
+				    LED_COLOR_ID_BLUE },
+		.bytes_per_led = 24,
+		.encode = wl_icled_encode_24bit,
+		.speed_hz = 6666666,
+		.type = WL_ICLED_SINGLE_WIRE,
+	},
+	[WL131161X] = { /*1311610030140 */
+		.model_id = WL131161X,
+		.color_sequence = { LED_COLOR_ID_GREEN,
+				    LED_COLOR_ID_BLUE,
+				    LED_COLOR_ID_RED },
+		.bytes_per_led = 4,
+		.encode = wl_icled_encode_32bit,
+		.type = WL_ICLED_TWO_WIRE,
+	},
+	[WL131212X] = { /*1312121320437 */
+		.model_id = WL131212X,
+		.color_sequence = { LED_COLOR_ID_RED,
+				    LED_COLOR_ID_GREEN,
+				    LED_COLOR_ID_BLUE },
+		.bytes_per_led = 48,
+		.encode = wl_icled_encode_48bit,
+		.speed_hz = 6666666,
+		.type = WL_ICLED_SINGLE_WIRE,
+	},
+};
+
+static int wl_icled_sync(struct wl_icled *priv)
+{
+	size_t i, len;
+	int ret;
+	u8 *buf;
+
+	buf = priv->buf;
+	len = priv->icled_info->bytes_per_led * priv->count;
+
+	if (priv->icled_info->type == WL_ICLED_TWO_WIRE) {
+		/* Prepare start frame: 4 bytes of 0 */
+		for (i = 0; i < WL_ICLED_32E_START_FRAME_SIZE; i++, buf++)
+			*buf = 0;
+
+		/* Prepare end frame: N/2 bits (rounded to first byte) of 1s */
+		buf += priv->icled_info->bytes_per_led * priv->count;
+		for (i = 0; i < (priv->count + 15)/16; i++, buf++)
+			*buf = 0xff;
+
+		len = buf - priv->buf;
+		buf = priv->buf + WL_ICLED_32E_START_FRAME_SIZE;
+	}
+
+	for (i = 0; i < priv->count; i++)
+		priv->icled_info->encode(buf +
+					(priv->icled_info->bytes_per_led * i),
+					 &priv->leds[i]);
+
+	if (priv->icled_info->type == WL_ICLED_SINGLE_WIRE) {
+		struct spi_transfer t = {
+			.tx_buf	= priv->buf,
+			.len = len,
+			.speed_hz = priv->icled_info->speed_hz,
+			.bits_per_word = SPI_NBITS_OCTAL,
+		};
+		struct spi_message m;
+
+		spi_message_init(&m);
+		spi_message_add_tail(&t, &m);
+
+		ret = spi_sync(priv->spi, &m);
+	} else {
+		ret = spi_write(priv->spi, priv->buf, len);
+	}
+
+	return ret;
+}
+
+static int wl_icled_set_brightness(struct led_classdev *cdev,
+				   enum led_brightness brightness)
+{
+	struct led_classdev_mc *mc_dev = lcdev_to_mccdev(cdev);
+	struct wl_icled_led *led = container_of(mc_dev,
+						struct wl_icled_led,
+						mc_cdev);
+	int ret;
+
+	mutex_lock(&led->priv->lock);
+	led->brightness = brightness;
+	led_mc_calc_color_components(&led->mc_cdev, brightness);
+	ret = wl_icled_sync(led->priv);
+	mutex_unlock(&led->priv->lock);
+
+	return ret;
+}
+
+static int wl_icled_probe_dt(struct wl_icled *priv, size_t count)
+{
+	struct led_init_data init_data = {};
+	struct mc_subled *mc_led_info;
+	struct fwnode_handle *child;
+	struct wl_icled_led *led;
+	int ret, i;
+	u32 reg;
+
+	device_for_each_child_node(priv->dev, child) {
+
+		ret = fwnode_property_read_u32(child, "reg", &reg);
+		if (ret < 0 || reg >= count) {
+			dev_err(priv->dev, "reg property is invalid\n");
+			fwnode_handle_put(child);
+
+			return ret ? -EINVAL : ret;
+		}
+
+		led = &priv->leds[reg];
+		led->priv = priv;
+		led->mc_cdev.num_colors = WL_ICLED_LEDS_PER_IC;
+		led->mc_cdev.led_cdev.brightness_set_blocking =
+							wl_icled_set_brightness;
+
+		mc_led_info = devm_kcalloc(priv->dev,
+					   led->mc_cdev.num_colors,
+					   sizeof(*mc_led_info), GFP_KERNEL);
+		if (!mc_led_info) {
+			fwnode_handle_put(child);
+			return -ENOMEM;
+		}
+
+		for (i = 0; i < WL_ICLED_LEDS_PER_IC; i++)
+			mc_led_info[i].color_index =
+				priv->icled_info->color_sequence[i];
+
+		led->mc_cdev.subled_info = mc_led_info;
+		init_data.fwnode = child;
+		ret = devm_led_classdev_multicolor_register_ext(priv->dev,
+								&led->mc_cdev,
+								&init_data);
+		if (ret) {
+			dev_err(priv->dev,
+				"failed to register LED device, err %d", ret);
+			fwnode_handle_put(child);
+			return ret;
+		}
+	}
+
+	for (i = 0; i < count; i++) {
+		/* make sure all leds got assigned */
+		if (priv->leds[i].priv != priv) {
+			dev_err(priv->dev, "reg property is invalid\n");
+			return -EINVAL;
+		}
+	}
+
+	return 0;
+}
+
+static int wl_icled_probe(struct spi_device *spi)
+{
+	struct wl_icled	*dev;
+	size_t count, buf_len;
+	int ret;
+
+	count = device_get_child_node_count(&spi->dev);
+	if (!count) {
+		dev_err(&spi->dev, "LEDs are not defined in device tree!");
+		return -ENODEV;
+	}
+
+	dev = devm_kzalloc(&spi->dev, struct_size(dev, leds, count),
+			    GFP_KERNEL);
+	if (!dev)
+		return -ENOMEM;
+
+	mutex_init(&dev->lock);
+	dev->count	= count;
+	dev->dev	= &spi->dev;
+	dev->spi	= spi;
+
+	dev->icled_info = device_get_match_data(&spi->dev);
+
+	buf_len = count * dev->icled_info->bytes_per_led;
+
+	if (dev->icled_info->model_id == WL131161X ||
+	    dev->icled_info->model_id == WL1315X246) {
+		/* account for START and END frames */
+		buf_len += WL_ICLED_32E_START_FRAME_SIZE;
+		buf_len += (count + 15)/16;
+	}
+
+	dev->buf = devm_kzalloc(&spi->dev, buf_len, GFP_KERNEL);
+	if (!dev->buf)
+		return -ENOMEM;
+
+	ret = wl_icled_probe_dt(dev, count);
+	if (ret)
+		return ret;
+
+	spi_set_drvdata(spi, dev);
+
+	return 0;
+}
+
+static void wl_icled_remove(struct spi_device *spi)
+{
+	struct wl_icled *priv = spi_get_drvdata(spi);
+
+	mutex_destroy(&priv->lock);
+}
+
+static const struct of_device_id wl_icled_dt_ids[] = {
+	{ .compatible = "we,1315x246", .data = &wl_icled_info_tbl[WL1315X246]},
+	{ .compatible = "we,1315x002", .data = &wl_icled_info_tbl[WL1315X002]},
+	{ .compatible = "we,131x000", .data = &wl_icled_info_tbl[WL131X000]},
+	{ .compatible = "we,131161x", .data = &wl_icled_info_tbl[WL131161X]},
+	{ .compatible = "we,131212x", .data = &wl_icled_info_tbl[WL131212X]},
+	{},
+};
+MODULE_DEVICE_TABLE(of, wl_icled_dt_ids);
+
+static struct spi_driver wl_icled_driver = {
+	.probe		= wl_icled_probe,
+	.remove		= wl_icled_remove,
+	.driver = {
+		.name		= KBUILD_MODNAME,
+		.of_match_table	= wl_icled_dt_ids,
+	},
+};
+
+module_spi_driver(wl_icled_driver);
+
+MODULE_DESCRIPTION("LED driver for Wurth Elektronik WL-ICLEDs");
+MODULE_AUTHOR("Ante Knezic <knezic@helmholz.com>");
+MODULE_LICENSE("GPL");
-- 
2.48.1


