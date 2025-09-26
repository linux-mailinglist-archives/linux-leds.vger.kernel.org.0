Return-Path: <linux-leds+bounces-5605-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DC447BA4220
	for <lists+linux-leds@lfdr.de>; Fri, 26 Sep 2025 16:23:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 247B21BC34EA
	for <lists+linux-leds@lfdr.de>; Fri, 26 Sep 2025 14:23:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92FD42FB970;
	Fri, 26 Sep 2025 14:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lHY9dPzd"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58CF22F656C
	for <linux-leds@vger.kernel.org>; Fri, 26 Sep 2025 14:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758896369; cv=none; b=cBkWDBq2+6owYSqEPy+2l++mJcytPDlD559tsXSr5lwqCy57q4TIDD39ebV5iH63v0Qu2OW6mC/+QmUThS5YkO3r4Xcrj6AJwOXPeSfejEjNxtFLpLo2jC907AYgTPtUumHqRzPdez5clVYwhui6Zcg5qTBSbWPNdi1nmRbkLNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758896369; c=relaxed/simple;
	bh=asZ2Wlro/pS3p0jUjhzoemq9ZGMzI94hYes+iD0+aRM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=L7IZzLpppzs1hBsIWE70Ce9FxQwoIS7/mb3m1+SbcyFJsNgmtHnPrR1DCSf0G3KzZ4fMbyq1X+ckfAX75Orud6jjTHbPTGUl8WtMZSvupBFVgEFK//x02ZG/UTYLYit5DylppmHkzhCg/PyX9TwF1gLUDiUXqUo0FiCbfEyKgEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lHY9dPzd; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-78e4056623fso16304946d6.2
        for <linux-leds@vger.kernel.org>; Fri, 26 Sep 2025 07:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758896365; x=1759501165; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XOfQE5oBLiaIDCba7tiIUOL+BqgettvGOPK0RrU22aU=;
        b=lHY9dPzd4lUrVzlRNmRqfIlpYtIlLoER+t0uRW+IFxygx+ak0F0I6O5hc2RKWIEDnk
         fk/Ng0jUUipIZ3jICVeeSufbMdNa3gJDns+7DGWzQh0PSpO5vFWoAvVjNIYjEwWizJ1u
         D/0mF3hj/wdeTpfKVoSM26D1skr7uksnHiUUlu5Z4D82vuS/IiN9x+CDOoUa37CNj8Iy
         cksnOjlkAujPaf4VsCMrVZPAD9eEVdlazvRWwrfBxag/UYvN5293xOVV4UU9uwchX0W0
         T+TRSSfdjGmTA/L+noy6vkJykRL4Z13O5bCBhOif4Wm4Dv7c6re83A2xj1fnFIie4Tff
         kuMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758896365; x=1759501165;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XOfQE5oBLiaIDCba7tiIUOL+BqgettvGOPK0RrU22aU=;
        b=tbZEIvgjT4L/BUNNcxB0QRmliCZtwxoiN77g4+87WyNOeSdV9r5q3LTLs4lY7fDIJr
         KQ4fREizT0MMg1tXeuXjZB763WjTL4rBLfZg2iZJBK5sh6SK7BAIxxFiv3QCriUyMtgH
         UN8akVkDbR86bklKxKX0gRzeidqT76Sy/ZVVXunBmWgKzSv+8jqsor7Wez6CkeugvfTL
         uUebVpX5z/0wihV+uRHddqljD6bWYB6+YUHBKHwK77C14c5yPqeTymJI1fGGkZV+Ne2J
         MdGdZ3urv3Ap9Q+RGglzleVflV1gSKtU1p6YZErXEN1Kth0BiMLBSr6qaXoklMGo73Nu
         TT2g==
X-Forwarded-Encrypted: i=1; AJvYcCXM2eld+liVxXM4dCd3q8Q22jDi9F3ob19EoW8p0NLZ8pKRBRnspmg29Nm+c6Smny1BthrlxqKI0YWh@vger.kernel.org
X-Gm-Message-State: AOJu0YwWVF4YVSO1j/r5zfscKoYba9zDeAO8qIb2AObZYDvey4BMK/zR
	sEiT4uHjIoKb2APP1arEWizbTjHrcNqMDBIbaZ/OFHSKTFWMu+dIHFeT
X-Gm-Gg: ASbGncvKoHUdi5CmnNbpypxByVE4w2VAtp8IgpsZM8m5sw+dU2fQWRKhhek+24ohQWs
	Q0KLNCoCfc6PaMISyDu0+OwoutoIFN9AfnCCRA6pKJ5Zew/Ht7uXOs475bAY/YHz2hvsOhG7DH2
	SUKd5dKOYt/groMiH6Cek80jboU2SCX1JgNhUeyojFs4BgBoWrA0aBmbVOT2tQWeyrAoiALV+6q
	YbV47kZJ8QY9JhP1KsOg/aKDf6VHSDPuXfR/Z5HnAfo9h92NvZksSroLYgjl+eWzVutJpKzlk3p
	QM2bPrBKx7EDkjMuhsvdJcNQBCtk6rz2sQbs9SqJ3TdGtae8RMh+f+X2MteDzHjtY8ESAuBRoJL
	5XANJFBfnxq/2K3obkcPJ4WE5ViwOyjwIrigKCzdd4f30hfY91Gbld5lfhV1Y3lurbAgmpNLA4h
	ArAQA=
X-Google-Smtp-Source: AGHT+IFho9L0RXvygQQ4dAD7RopW7MUrD+j17K+DNATeBJS2QCR9SIEeHfamEuhl3BtZ4/91V2mnJw==
X-Received: by 2002:a05:6214:e44:b0:7ad:19a4:53e0 with SMTP id 6a1803df08f44-7fc2fd77573mr93046146d6.26.1758896364657;
        Fri, 26 Sep 2025 07:19:24 -0700 (PDT)
Received: from localhost (modemcable197.17-162-184.mc.videotron.ca. [184.162.17.197])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-801351c3283sm27501326d6.3.2025.09.26.07.19.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Sep 2025 07:19:24 -0700 (PDT)
From: =?UTF-8?q?Jean-Fran=C3=A7ois=20Lessard?= <jefflessard3@gmail.com>
To: Andy Shevchenko <andy@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v5 6/7] auxdisplay: TM16xx: Add support for I2C-based controllers
Date: Fri, 26 Sep 2025 10:19:07 -0400
Message-ID: <20250926141913.25919-7-jefflessard3@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250926141913.25919-1-jefflessard3@gmail.com>
References: <20250926141913.25919-1-jefflessard3@gmail.com>
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
 drivers/auxdisplay/Kconfig      |  16 ++
 drivers/auxdisplay/Makefile     |   1 +
 drivers/auxdisplay/tm16xx_i2c.c | 332 ++++++++++++++++++++++++++++++++
 4 files changed, 350 insertions(+)
 create mode 100644 drivers/auxdisplay/tm16xx_i2c.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 84f2135903cd..8a8a53efee52 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25448,6 +25448,7 @@ F:	Documentation/ABI/testing/sysfs-class-leds-tm16xx
 F:	Documentation/devicetree/bindings/auxdisplay/titanmec,tm16xx.yaml
 F:	drivers/auxdisplay/tm16xx.h
 F:	drivers/auxdisplay/tm16xx_core.c
+F:	drivers/auxdisplay/tm16xx_i2c.c
 F:	drivers/auxdisplay/tm16xx_keypad.c
 
 TMIO/SDHI MMC DRIVER
diff --git a/drivers/auxdisplay/Kconfig b/drivers/auxdisplay/Kconfig
index f9a2c0641c3c..d48c2f18950e 100644
--- a/drivers/auxdisplay/Kconfig
+++ b/drivers/auxdisplay/Kconfig
@@ -544,6 +544,22 @@ config TM16XX_KEYPAD
 	help
 	  Enable keyscan support for TM16XX driver.
 
+config TM16XX_I2C
+	tristate "TM16XX-compatible I2C 7-segment LED controllers with keyscan"
+	depends on I2C
+	select TM16XX
+	help
+	  This driver supports the following TM16XX compatible
+	  I2C (2-wire) 7-segment led display chips:
+	  - Titanmec: TM1650
+	  - Fuda Hisi: FD650, FD655, FD6551
+	  - i-Core: AiP650
+	  - Winrise: HBS658
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called tm16xx_i2c and you will also get tm16xx for the
+	  core module.
+
 #
 # Character LCD with non-conforming interface section
 #
diff --git a/drivers/auxdisplay/Makefile b/drivers/auxdisplay/Makefile
index a9b9c8ff05e8..ba7b310f5667 100644
--- a/drivers/auxdisplay/Makefile
+++ b/drivers/auxdisplay/Makefile
@@ -19,3 +19,4 @@ obj-$(CONFIG_SEG_LED_GPIO)	+= seg-led-gpio.o
 obj-$(CONFIG_TM16XX)		+= tm16xx.o
 tm16xx-y			+= tm16xx_core.o
 tm16xx-$(CONFIG_TM16XX_KEYPAD)	+= tm16xx_keypad.o
+obj-$(CONFIG_TM16XX_I2C)	+= tm16xx_i2c.o
diff --git a/drivers/auxdisplay/tm16xx_i2c.c b/drivers/auxdisplay/tm16xx_i2c.c
new file mode 100644
index 000000000000..013becedac11
--- /dev/null
+++ b/drivers/auxdisplay/tm16xx_i2c.c
@@ -0,0 +1,332 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * TM16xx and compatible LED display/keypad controller driver
+ * Supports TM16xx, FD6xx, PT6964, HBS658, AIP16xx and related chips.
+ *
+ * Copyright (C) 2025 Jean-François Lessard
+ */
+
+#include <linux/bitfield.h>
+#include <linux/device.h>
+#include <linux/i2c.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
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
+	struct i2c_client *i2c = to_i2c_client(display->dev);
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
+	ret = i2c_transfer(i2c->adapter, &msg, 1);
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
+static int tm16xx_i2c_read(struct tm16xx_display *display, u8 cmd, u8 *data, size_t len)
+{
+	struct i2c_client *i2c = to_i2c_client(display->dev);
+
+	/* expected sequence: S Command [A] [Data] [A] P */
+	struct i2c_msg msgs[1] = {{
+		.addr = cmd >> 1,
+		.flags = I2C_M_RD | I2C_M_NO_RD_ACK,
+		.len = len,
+		.buf = data,
+	}};
+	int ret;
+
+	ret = i2c_transfer(i2c->adapter, msgs, ARRAY_SIZE(msgs));
+	if (ret < 0)
+		return ret;
+
+	return (ret == ARRAY_SIZE(msgs)) ? 0 : -EIO;
+}
+
+/* I2C controller-specific functions */
+static int tm1650_init(struct tm16xx_display *display)
+{
+	const enum led_brightness brightness = display->main_led.brightness;
+	u8 cmds[2];
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
+	int row, col;
+	bool pressed;
+	u8 keycode;
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
+	const enum led_brightness brightness = display->main_led.brightness;
+	u8 cmds[2];
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
+	const enum led_brightness brightness = display->main_led.brightness;
+	u8 cmds[2];
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
+	if (ret)
+		return ret;
+
+	/* Set control command with brightness */
+	cmd = TM16XX_CMD_CTRL |
+	      TM16XX_CTRL_BRIGHTNESS(brightness, brightness - 1, TM16XX);
+	hbs658_swap_nibbles(&cmd, 1);
+	ret = tm16xx_i2c_write(display, &cmd, 1);
+	if (ret)
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
+	u8 cmd, keycode;
+	int col;
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
+static const struct of_device_id tm16xx_i2c_of_match[] = {
+	{ .compatible = "titanmec,tm1650", .data = &tm1650_controller },
+	{ .compatible = "fdhisi,fd6551",   .data = &fd6551_controller },
+	{ .compatible = "fdhisi,fd655",    .data = &fd655_controller  },
+	{ .compatible = "winrise,hbs658",  .data = &hbs658_controller },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, tm16xx_i2c_of_match);
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
+		.of_match_table = tm16xx_i2c_of_match,
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


