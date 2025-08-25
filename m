Return-Path: <linux-leds+bounces-5299-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 264B1B3348D
	for <lists+linux-leds@lfdr.de>; Mon, 25 Aug 2025 05:33:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E6AC717E600
	for <lists+linux-leds@lfdr.de>; Mon, 25 Aug 2025 03:33:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DFAF26D4EB;
	Mon, 25 Aug 2025 03:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kznsV13Q"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5313025D917;
	Mon, 25 Aug 2025 03:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756092769; cv=none; b=tWb0isGeNcOGub8iljTMMp4J9Wyz3Oxj8J/nvnbpRujUqsxNoX8XIFreB1hF41oPi1GuKVJ6n+k/vQHk1d8pn6HMJL3GGLfDhE/u/ofPKjeqqNzfekuTzRiD3FMB6qB8qKci9PTAPaRHD1eDSB7zEsZloMGc3n9mfwanyn2Ltv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756092769; c=relaxed/simple;
	bh=uQdUs+gRS29PSICgO4m/EfZCr5hAaQDUvp6ZoOPquHI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RB4qFTsGs4SGOTF4WBnYyWfv9qcTi5WPftxuBr4uOehM95j2EoKRCUjB7lpcUP83OjDbKk+lZz5otFE6C908jxYFbWLNh6VQWDXktZbddakGhGNewDqXRewP4EvHcjZ5bWspNxQu8mRzs/5HBc1GkJovenCibP7bAJ56x6Om91Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kznsV13Q; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-4b28184a8b3so47122401cf.1;
        Sun, 24 Aug 2025 20:32:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756092766; x=1756697566; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dXf+dqUtTAWA9fwRLFryIKYUZaDkHD+b1P+hK8T7SS4=;
        b=kznsV13QvghyuQyRddmhSgN8WoB+CVmCCw8dA3evXICILX2AIv4V+NozBoi1/6P6hh
         dC5jYsSGndDBaOSxjO/W2CZlLjACHdtlNY7RUE8IOFkZTMF17535brNdDXNzZMk3TJmX
         8AcHe4C6w69BgCYWLiixHLpFYFPfFFqcxepEch87BQz9J4c1DeC8Fbag/3m9GPYUQpAw
         YVBs52TtZN7+kxEjAGCqaK4UZ8IwkLZjnLSuDfxzSUFvjkN/GblLGyvUViWahqo0tOo7
         yzPDyImKCuyNQsvBESxqsS6/7A97yrPcx4/va5GdCqUTqtAE0680k6rgqqKdM4yZmSZu
         6Qdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756092766; x=1756697566;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dXf+dqUtTAWA9fwRLFryIKYUZaDkHD+b1P+hK8T7SS4=;
        b=C95Efrfvh3TFKwgghgqxBwXVBBh/WCxswgdfVi0OBI+kRrxyo20ZckShXnn8edQDva
         +5Kvkz79M1ZRfIvMRdMVum7c2QzqoiM1GBosfaQRaHQZ/PJDWjiT/FFLRXhjBBRVh+YB
         2iCNwX6qmwNa7Nb9fEWkLjeEOw/4wL+Ly/Lduto6u+vRaX5QY22koMwQif2FwF9u/p/G
         Qgj+n9ksew1GHkOPgafk7uIoyyoAWBnzjoI23PYP7Rx2miSuxTZVLoGP4yNWCZtbSaXX
         Z5LdNcZSrTED6wIPSpZ6I3UaGS1QKRz2+5TvUXv3KFSS2BeoEJG1lqCSaCW4j+RGXMAQ
         ngaw==
X-Forwarded-Encrypted: i=1; AJvYcCU7pdmMoCCSUfAxb4bj6g4LmgNzj0meKGTDGu4c5CenbnaHAutEOwUA5OTKTaGiLKyiqHTwRP0fnWp+@vger.kernel.org, AJvYcCW9i4OMHy8XS28fiXhr1hFVYSupX6gKeQTxR9A3WqI3wYU5/kM/KiBEdRoYQLN4FszqjX9a2IiQscMIdA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzXUpK8ckzUbhweLoiNsBhpdwPh8bj45mHilCufLoUmO6C3FRgC
	gRjDr6xvb1KAsGogswCVmuR81MH5hDEF5NQiDBhtFaL1vBPD4HKpJm4hsFSeK5Zp
X-Gm-Gg: ASbGncutOyF9gDF/5sJccTlsOwBhDy/sBgJ8DDMb6caRn3dIMCMXdwHy8+HwSSZtc0b
	we3ji5HxQkHjAOvwrVXiMo/8mK7f8FjVUzw3z59JzlH2GBeoD0dcrG5jDqg5wDfFANYR21YcBeA
	l3hhzhAkr5gtmaP2/RZikh98t3+NBD2t2NFo3P2lesqRqqxg/NQ/xs3RsHyUTM7K/kBFCePRxNp
	lWya+MUdXvaQ0Cc5voc6ASa2KPRykkYmehqNVgGskZNyqh0hLO/3Doqjtas8Mj4U7JuZA07TMaY
	FWxHya5bRUHiVfIpVFTSgcG7qAK99EI02ezxO75IvLnQspVU0uWOonMycspzdUjw1KDPW8ZFHqM
	VtAuS7hfz+DqBJu84HdwE399X0ZSQzSAaGBAowO4XInOQOIF7ZWEsMIBOajZLLIqvGinM
X-Google-Smtp-Source: AGHT+IEZxMZi3ocIIlYZ8mQpbFhBd5hqZk64cDvWc/PklYP03OTTS+gXDLjTBt/IJ9m0oQC5Vvvq4A==
X-Received: by 2002:ac8:5e49:0:b0:4b2:9ac2:686e with SMTP id d75a77b69052e-4b2aab4a159mr126509091cf.77.1756092766101;
        Sun, 24 Aug 2025 20:32:46 -0700 (PDT)
Received: from localhost (modemcable197.17-162-184.mc.videotron.ca. [184.162.17.197])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b2b8ca1609sm43240851cf.17.2025.08.24.20.32.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Aug 2025 20:32:45 -0700 (PDT)
From: =?UTF-8?q?Jean-Fran=C3=A7ois=20Lessard?= <jefflessard3@gmail.com>
To: Andy Shevchenko <andy@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v4 5/6] auxdisplay: TM16xx: Add support for I2C-based controllers
Date: Sun, 24 Aug 2025 23:32:31 -0400
Message-ID: <20250825033237.60143-6-jefflessard3@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250825033237.60143-1-jefflessard3@gmail.com>
References: <20250825033237.60143-1-jefflessard3@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add support for TM16xx-compatible auxiliary display controllers connected
via the I2C bus.

The implementation includes:
- I2C driver registration and initialization
- Probe/remove logic for I2C devices
- Controller-specific handling and communication sequences
- Integration with the TM16xx core driver for common functionality

This allows platforms using TM16xx or compatible controllers over I2C to be
managed by the TM16xx driver infrastructure.

Signed-off-by: Jean-François Lessard <jefflessard3@gmail.com>
---
 MAINTAINERS                     |   1 +
 drivers/auxdisplay/Kconfig      |   7 +
 drivers/auxdisplay/Makefile     |   1 +
 drivers/auxdisplay/tm16xx_i2c.c | 332 ++++++++++++++++++++++++++++++++
 4 files changed, 341 insertions(+)
 create mode 100644 drivers/auxdisplay/tm16xx_i2c.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 8edcdd52c..51cc910e2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25409,6 +25409,7 @@ F:	Documentation/ABI/testing/sysfs-class-leds-tm16xx
 F:	Documentation/devicetree/bindings/auxdisplay/titanmec,tm16xx.yaml
 F:	drivers/auxdisplay/tm16xx.h
 F:	drivers/auxdisplay/tm16xx_core.c
+F:	drivers/auxdisplay/tm16xx_i2c.c
 F:	drivers/auxdisplay/tm16xx_keypad.c
 
 TMIO/SDHI MMC DRIVER
diff --git a/drivers/auxdisplay/Kconfig b/drivers/auxdisplay/Kconfig
index b5dcd024d..6238e753d 100644
--- a/drivers/auxdisplay/Kconfig
+++ b/drivers/auxdisplay/Kconfig
@@ -535,6 +535,7 @@ config TM16XX
 	select LEDS_TRIGGERS
 	select INPUT_MATRIXKMAP
 	select TM16XX_KEYPAD if (INPUT)
+	select TM16XX_I2C if (I2C)
 	help
 	  This driver supports the following TM16XX compatible
 	  I2C and SPI 7-segment led display chips:
@@ -553,6 +554,12 @@ config TM16XX_KEYPAD
 	help
 	  Enable keyscan support for TM16XX driver.
 
+config TM16XX_I2C
+	tristate
+	depends on TM16XX
+	help
+	  Enable I2C support for TM16XX driver.
+
 #
 # Character LCD with non-conforming interface section
 #
diff --git a/drivers/auxdisplay/Makefile b/drivers/auxdisplay/Makefile
index a9b9c8ff0..ba7b310f5 100644
--- a/drivers/auxdisplay/Makefile
+++ b/drivers/auxdisplay/Makefile
@@ -19,3 +19,4 @@ obj-$(CONFIG_SEG_LED_GPIO)	+= seg-led-gpio.o
 obj-$(CONFIG_TM16XX)		+= tm16xx.o
 tm16xx-y			+= tm16xx_core.o
 tm16xx-$(CONFIG_TM16XX_KEYPAD)	+= tm16xx_keypad.o
+obj-$(CONFIG_TM16XX_I2C)	+= tm16xx_i2c.o
diff --git a/drivers/auxdisplay/tm16xx_i2c.c b/drivers/auxdisplay/tm16xx_i2c.c
new file mode 100644
index 000000000..3beca7e43
--- /dev/null
+++ b/drivers/auxdisplay/tm16xx_i2c.c
@@ -0,0 +1,332 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * TM16xx and compatible LED display/keypad controller driver
+ * Supports TM16xx, FD6xx, PT6964, HBS658, AIP16xx and related chips.
+ *
+ * Copyright (C) 2024 Jean-François Lessard
+ */
+
+#include <linux/i2c.h>
+#include <linux/mod_devicetable.h>
+
+#include "tm16xx.h"
+
+static int tm16xx_i2c_probe(struct i2c_client *client)
+{
+	const struct tm16xx_controller *controller;
+	struct tm16xx_display *display;
+	int ret;
+
+	controller = i2c_get_match_data(client);
+	if (!controller)
+		return -EINVAL;
+
+	display = devm_kzalloc(&client->dev, sizeof(*display), GFP_KERNEL);
+	if (!display)
+		return -ENOMEM;
+
+	display->client.i2c = client;
+	display->dev = &client->dev;
+	display->controller = controller;
+
+	i2c_set_clientdata(client, display);
+
+	ret = tm16xx_probe(display);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static void tm16xx_i2c_remove(struct i2c_client *client)
+{
+	struct tm16xx_display *display = i2c_get_clientdata(client);
+
+	tm16xx_remove(display);
+}
+
+/**
+ * tm16xx_i2c_write() - I2C write helper for controller
+ * @display: pointer to tm16xx_display structure
+ * @data: command and data bytes to send
+ * @len: number of bytes in @data
+ *
+ * Return: 0 on success, negative error code on failure
+ */
+static int tm16xx_i2c_write(struct tm16xx_display *display, u8 *data, size_t len)
+{
+	dev_dbg(display->dev, "i2c_write %*ph", (char)len, data);
+
+	/* expected sequence: S Command [A] Data [A] P */
+	struct i2c_msg msg = {
+		.addr = data[0] >> 1,
+		.flags = 0,
+		.len = len - 1,
+		.buf = &data[1],
+	};
+	int ret;
+
+	ret = i2c_transfer(display->client.i2c->adapter, &msg, 1);
+	if (ret < 0)
+		return ret;
+
+	return (ret == 1) ? 0 : -EIO;
+}
+
+/**
+ * tm16xx_i2c_read() - I2C read helper for controller
+ * @display: pointer to tm16xx_display structure
+ * @cmd: command/address byte to send before reading
+ * @data: buffer to receive data
+ * @len: number of bytes to read into @data
+ *
+ * Return: 0 on success, negative error code on failure
+ */
+static int tm16xx_i2c_read(struct tm16xx_display *display, u8 cmd, u8 *data,
+			   size_t len)
+{
+	/* expected sequence: S Command [A] [Data] [A] P */
+	struct i2c_msg msgs[1] = {{
+		.addr = cmd >> 1,
+		.flags = I2C_M_RD | I2C_M_NO_RD_ACK,
+		.len = len,
+		.buf = data,
+	}};
+	int ret;
+
+	ret = i2c_transfer(display->client.i2c->adapter, msgs, ARRAY_SIZE(msgs));
+	if (ret < 0)
+		return ret;
+
+	dev_dbg(display->dev, "i2c_read %ph: %*ph\n", &cmd, (char)len, data);
+
+	return (ret == ARRAY_SIZE(msgs)) ? 0 : -EIO;
+}
+
+/* I2C controller-specific functions */
+static int tm1650_init(struct tm16xx_display *display)
+{
+	u8 cmds[2];
+	const enum led_brightness brightness = display->main_led.brightness;
+
+	cmds[0] = TM1650_CMD_CTRL;
+	cmds[1] = TM16XX_CTRL_BRIGHTNESS(brightness, brightness, TM1650) |
+		  TM1650_CTRL_SEG8_MODE;
+
+	return tm16xx_i2c_write(display, cmds, ARRAY_SIZE(cmds));
+}
+
+static int tm1650_data(struct tm16xx_display *display, u8 index,
+		       unsigned int grid)
+{
+	u8 cmds[2];
+
+	cmds[0] = TM1650_CMD_ADDR + index * 2;
+	cmds[1] = grid; /* SEG 1 to 8 */
+
+	return tm16xx_i2c_write(display, cmds, ARRAY_SIZE(cmds));
+}
+
+static int tm1650_keys(struct tm16xx_display *display)
+{
+	u8 keycode, row, col;
+	bool pressed;
+	int ret;
+
+	ret = tm16xx_i2c_read(display, TM1650_CMD_READ, &keycode, 1);
+	if (ret)
+		return ret;
+
+	if (keycode == 0x00 || keycode == 0xFF)
+		return -EINVAL;
+
+	row = FIELD_GET(TM1650_KEY_ROW_MASK, keycode);
+	pressed = FIELD_GET(TM1650_KEY_DOWN_MASK, keycode) != 0;
+	if ((keycode & TM1650_KEY_COMBINED) == TM1650_KEY_COMBINED) {
+		tm16xx_set_key(display, row, 0, pressed);
+		tm16xx_set_key(display, row, 1, pressed);
+	} else {
+		col = FIELD_GET(TM1650_KEY_COL_MASK, keycode);
+		tm16xx_set_key(display, row, col, pressed);
+	}
+
+	return 0;
+}
+
+static int fd655_init(struct tm16xx_display *display)
+{
+	u8 cmds[2];
+	const enum led_brightness brightness = display->main_led.brightness;
+
+	cmds[0] = FD655_CMD_CTRL;
+	cmds[1] = TM16XX_CTRL_BRIGHTNESS(brightness, brightness % 3, FD655);
+
+	return tm16xx_i2c_write(display, cmds, ARRAY_SIZE(cmds));
+}
+
+static int fd655_data(struct tm16xx_display *display, u8 index,
+		      unsigned int grid)
+{
+	u8 cmds[2];
+
+	cmds[0] = FD655_CMD_ADDR + index * 2;
+	cmds[1] = grid; /* SEG 1 to 8 */
+
+	return tm16xx_i2c_write(display, cmds, ARRAY_SIZE(cmds));
+}
+
+static int fd6551_init(struct tm16xx_display *display)
+{
+	u8 cmds[2];
+	const enum led_brightness brightness = display->main_led.brightness;
+
+	cmds[0] = FD6551_CMD_CTRL;
+	cmds[1] = TM16XX_CTRL_BRIGHTNESS(brightness, ~(brightness - 1), FD6551);
+
+	return tm16xx_i2c_write(display, cmds, ARRAY_SIZE(cmds));
+}
+
+static void hbs658_swap_nibbles(u8 *data, size_t len)
+{
+	for (size_t i = 0; i < len; i++)
+		data[i] = (data[i] << 4) | (data[i] >> 4);
+}
+
+static int hbs658_init(struct tm16xx_display *display)
+{
+	const enum led_brightness brightness = display->main_led.brightness;
+	u8 cmd;
+	int ret;
+
+	/* Set data command */
+	cmd = TM16XX_CMD_WRITE | TM16XX_DATA_ADDR_AUTO;
+	hbs658_swap_nibbles(&cmd, 1);
+	ret = tm16xx_i2c_write(display, &cmd, 1);
+	if (ret < 0)
+		return ret;
+
+	/* Set control command with brightness */
+	cmd = TM16XX_CMD_CTRL |
+	      TM16XX_CTRL_BRIGHTNESS(brightness, brightness - 1, TM16XX);
+	hbs658_swap_nibbles(&cmd, 1);
+	ret = tm16xx_i2c_write(display, &cmd, 1);
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
+static int hbs658_data(struct tm16xx_display *display, u8 index,
+		       unsigned int grid)
+{
+	u8 cmds[2];
+
+	cmds[0] = TM16XX_CMD_ADDR + index * 2;
+	cmds[1] = grid;
+
+	hbs658_swap_nibbles(cmds, ARRAY_SIZE(cmds));
+	return tm16xx_i2c_write(display, cmds, ARRAY_SIZE(cmds));
+}
+
+static int hbs658_keys(struct tm16xx_display *display)
+{
+	u8 cmd, keycode, col;
+	int ret;
+
+	cmd = TM16XX_CMD_READ;
+	hbs658_swap_nibbles(&cmd, 1);
+	ret = tm16xx_i2c_read(display, cmd, &keycode, 1);
+	if (ret)
+		return ret;
+
+	hbs658_swap_nibbles(&keycode, 1);
+
+	if (keycode != 0xFF) {
+		col = FIELD_GET(HBS658_KEY_COL_MASK, keycode);
+		tm16xx_set_key(display, 0, col, true);
+	}
+
+	return 0;
+}
+
+/* I2C controller definitions */
+static const struct tm16xx_controller tm1650_controller = {
+	.max_grids = 4,
+	.max_segments = 8,
+	.max_brightness = 8,
+	.max_key_rows = 4,
+	.max_key_cols = 7,
+	.init = tm1650_init,
+	.data = tm1650_data,
+	.keys = tm1650_keys,
+};
+
+static const struct tm16xx_controller fd655_controller = {
+	.max_grids = 5,
+	.max_segments = 7,
+	.max_brightness = 3,
+	.max_key_rows = 5,
+	.max_key_cols = 7,
+	.init = fd655_init,
+	.data = fd655_data,
+	.keys = tm1650_keys,
+};
+
+static const struct tm16xx_controller fd6551_controller = {
+	.max_grids = 5,
+	.max_segments = 7,
+	.max_brightness = 8,
+	.max_key_rows = 0,
+	.max_key_cols = 0,
+	.init = fd6551_init,
+	.data = fd655_data,
+	.keys = NULL,
+};
+
+static const struct tm16xx_controller hbs658_controller = {
+	.max_grids = 5,
+	.max_segments = 8,
+	.max_brightness = 8,
+	.max_key_rows = 1,
+	.max_key_cols = 8,
+	.init = hbs658_init,
+	.data = hbs658_data,
+	.keys = hbs658_keys,
+};
+
+#if IS_ENABLED(CONFIG_OF)
+static const struct of_device_id tm16xx_i2c_of_match[] = {
+	{ .compatible = "titanmec,tm1650", .data = &tm1650_controller },
+	{ .compatible = "fdhisi,fd6551",   .data = &fd6551_controller },
+	{ .compatible = "fdhisi,fd655",    .data = &fd655_controller  },
+	{ .compatible = "winrise,hbs658",  .data = &hbs658_controller },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, tm16xx_i2c_of_match);
+#endif
+
+static const struct i2c_device_id tm16xx_i2c_id[] = {
+	{ "tm1650", (kernel_ulong_t)&tm1650_controller },
+	{ "fd6551", (kernel_ulong_t)&fd6551_controller },
+	{ "fd655",  (kernel_ulong_t)&fd655_controller  },
+	{ "hbs658", (kernel_ulong_t)&hbs658_controller },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(i2c, tm16xx_i2c_id);
+
+static struct i2c_driver tm16xx_i2c_driver = {
+	.driver = {
+		.name = "tm16xx-i2c",
+		.of_match_table = of_match_ptr(tm16xx_i2c_of_match),
+	},
+	.probe = tm16xx_i2c_probe,
+	.remove = tm16xx_i2c_remove,
+	.shutdown = tm16xx_i2c_remove,
+	.id_table = tm16xx_i2c_id,
+};
+module_i2c_driver(tm16xx_i2c_driver);
+
+MODULE_AUTHOR("Jean-François Lessard");
+MODULE_DESCRIPTION("TM16xx-i2c LED Display Controllers");
+MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS("TM16XX");
-- 
2.43.0


