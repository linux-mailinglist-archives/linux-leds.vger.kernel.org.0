Return-Path: <linux-leds+bounces-5606-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D5EBABA4226
	for <lists+linux-leds@lfdr.de>; Fri, 26 Sep 2025 16:23:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7DA543B4AB6
	for <lists+linux-leds@lfdr.de>; Fri, 26 Sep 2025 14:23:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 901182FB99A;
	Fri, 26 Sep 2025 14:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RQEC6Lpl"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 955052F9D8C
	for <linux-leds@vger.kernel.org>; Fri, 26 Sep 2025 14:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758896370; cv=none; b=DQFDaV5DYxt+z8fN4J6vSop78gDfwl4TBc8bIRNfkHFlX2e7bNj5kFYOewI38N/yHMqdzNoTmCtZ3UY+eiysX4UNttnmuefwfbIvMt4BQlEh6Q6HcCP2f+vumvaxZQnI2O6YRkBj1D3U+W3LYNQYZSmPAv2mU7oeZ88JWXFNquc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758896370; c=relaxed/simple;
	bh=AFFdWPUAXAFNGiiOEJ3coICAhEAc2Pe4JDD1q1kvAsk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=U8Cc8ZerYo5264zsnPByXhbC8Ym8NS6Fx+K5c45EARd3YgYNQgI75oKsopd+pT8wDikx3ZS2WXnggslZ3S7+Yv0256hQXsDNbfQeNvJDc0geMtLtERb/s07z6YRFXRnrcthFQVdj2FvRe5iO/fImLMjePQFNY8CzZ8YMfAAefIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RQEC6Lpl; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-4dca66a31f7so16116331cf.3
        for <linux-leds@vger.kernel.org>; Fri, 26 Sep 2025 07:19:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758896366; x=1759501166; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UkNfR44T1+aQMXki6JhTMzsXZD4Y5zeYdM+FX7jC1nQ=;
        b=RQEC6Lplq2Ua6dRSq4fQUzYnO/zK6IQfuNrn28qSLjrZCJH5R0LBYfNIgsWfAEqPz+
         xjAxsWrmfDUb2HB17YdHFEwNap8AkpM4AgjPLO6o4u+I0ykTzfPkY0BCH0pQbTqnBqjY
         FdG5S8RopxZ5Womk/j6NdCc0E+Z9TS9MrUIVfFQ+U0VCHoFAm1/hxSRtRiOe6gEpspFa
         JeVZg8i82H6cbIOmzUZ11xsLgX51ICPk+CLrOaAXlDm3i4mdrEEOOFR8+Aw217YjqDTH
         sMgOplgNO5lZRx9KAvMCN4p8EiIA/jlQrrYHVuMK13cYA4PHC1kre+yfrRe9/3XpMj1P
         YrHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758896366; x=1759501166;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UkNfR44T1+aQMXki6JhTMzsXZD4Y5zeYdM+FX7jC1nQ=;
        b=CbGQfq1z6Bu8d/uUKzOmPZy24lPiVEYzYA9GZvUb90QnFWcrD+meR3L6DQCOGPszUd
         saFPRDdlRwQ4cr+RJl4fCmg1FNejG0Iphf3EmemITp41hfNaGKjDV7LlUEp3gb6V1JVo
         8VJ4Cy1a9KBY2686ZXufnzSfkYPy6lbuEdH6+UX3Dj6Ah3Mz47wfW/44i2JNHLrYMngE
         hiuS0/+wzrVv+3GJ5EZxtRbmfsTFA+1MjbEMZ7pjtICX6Dj4Kr7e4pHQgHEd0rRrN5m3
         Sjg0Lstyp3TBFWEMm0r7641q0Px9l/bn2gkK4NVbST6NebivgP9l0zI/k7HLkAtdyx5U
         5Pug==
X-Forwarded-Encrypted: i=1; AJvYcCXSKaNhudGrSJEu6IZP7cDjaKg8wpfesGwPpKzYljG3UNw73rpZSGTWZNd3FDg3MXfXBZecc54fQWOm@vger.kernel.org
X-Gm-Message-State: AOJu0YzTqZ1rfor8s6BOaWgQ6zVYxbh4BtSaN8mGkSnDhAFaWhZZeC74
	2LEEzZ1Dau26CdwANXVPpPAaR5Q0+2cqn+9ccxVih6WpzlDxLbEsTdARC2RI25Gk
X-Gm-Gg: ASbGncvJ8sQv5Yne0gNjEAbhWPXphp2Xah/+xoWj6T7XNeaQdtsy8EACRVWw3N6kHDo
	2j8pVh7O18W1LzNYBEUmkLcTHTZ0AkkTv72qmVsXudmLBbStZW/5fT0AhMDsXmh/f5VJ8eKp1Rm
	mByzrV/qPLffgpM1NJmPuZ6M/CVEb66t+Glb4jbORLiqaFquWG6kyeCU5i7KzYym6SxpPHsnNdm
	UK6PUKKoJs4S9rqKSBfAuzznprR1nlCD0+1TLLTHcpgGyLKf80icVPk41Pu2f3XPikL/3E8Oo2C
	/yYM6MbHOAoHsVQFb7TILEvo3sxj1Es+Q5KfCNJt2t+cbF4I7GmpyCZuJhIOBY6VtZ4vNzlzPKz
	iCbG74Kk/MdBiftKRHbIi2QOX3tNSk5klzmjp9hd2GZfYDYAeonKBxTJvzlcOguQTa28G
X-Google-Smtp-Source: AGHT+IGODqsrQGtDZCGx0icngB4w/TaZU1Mpxmyd+O5pnNZPVLJSOQqzJ+8c4HQwg7u/RJ/qyoQEbw==
X-Received: by 2002:a05:622a:2ce:b0:4d8:cb2f:7fac with SMTP id d75a77b69052e-4da4934ac23mr102100951cf.35.1758896366349;
        Fri, 26 Sep 2025 07:19:26 -0700 (PDT)
Received: from localhost (modemcable197.17-162-184.mc.videotron.ca. [184.162.17.197])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-85c341319besm286940985a.64.2025.09.26.07.19.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Sep 2025 07:19:25 -0700 (PDT)
From: =?UTF-8?q?Jean-Fran=C3=A7ois=20Lessard?= <jefflessard3@gmail.com>
To: Andy Shevchenko <andy@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v5 7/7] auxdisplay: TM16xx: Add support for SPI-based controllers
Date: Fri, 26 Sep 2025 10:19:08 -0400
Message-ID: <20250926141913.25919-8-jefflessard3@gmail.com>
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
via the SPI bus.

The implementation includes:
- SPI driver registration and initialization
- Probe/remove logic for SPI devices
- Controller-specific handling and communication sequences
- Integration with the TM16xx core driver for common functionality

This allows platforms using TM16xx or compatible controllers over SPI to be
managed by the TM16xx driver infrastructure.

Signed-off-by: Jean-François Lessard <jefflessard3@gmail.com>
---
 MAINTAINERS                     |   1 +
 drivers/auxdisplay/Kconfig      |  16 ++
 drivers/auxdisplay/Makefile     |   1 +
 drivers/auxdisplay/tm16xx_spi.c | 397 ++++++++++++++++++++++++++++++++
 4 files changed, 415 insertions(+)
 create mode 100644 drivers/auxdisplay/tm16xx_spi.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 8a8a53efee52..5d5e5f01e8ed 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25450,6 +25450,7 @@ F:	drivers/auxdisplay/tm16xx.h
 F:	drivers/auxdisplay/tm16xx_core.c
 F:	drivers/auxdisplay/tm16xx_i2c.c
 F:	drivers/auxdisplay/tm16xx_keypad.c
+F:	drivers/auxdisplay/tm16xx_spi.c
 
 TMIO/SDHI MMC DRIVER
 M:	Wolfram Sang <wsa+renesas@sang-engineering.com>
diff --git a/drivers/auxdisplay/Kconfig b/drivers/auxdisplay/Kconfig
index d48c2f18950e..61e5af8d0a3d 100644
--- a/drivers/auxdisplay/Kconfig
+++ b/drivers/auxdisplay/Kconfig
@@ -560,6 +560,22 @@ config TM16XX_I2C
 	  will be called tm16xx_i2c and you will also get tm16xx for the
 	  core module.
 
+config TM16XX_SPI
+	tristate "TM16XX-compatible SPI 7-segment LED controllers with keyscan"
+	depends on SPI
+	select TM16XX
+	help
+	  This driver supports the following TM16XX compatible
+	  SPI (3-wire) 7-segment led display chips:
+	  - Titanmec: TM1618, TM1620, TM1628, TM1638
+	  - Fuda Hisi: FD620, FD628
+	  - i-Core: AiP1618, AiP1628
+	  - Princeton: PT6964
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called tm16xx_spi and you will also get tm16xx for the
+	  core module.
+
 #
 # Character LCD with non-conforming interface section
 #
diff --git a/drivers/auxdisplay/Makefile b/drivers/auxdisplay/Makefile
index ba7b310f5667..2485a3a6769d 100644
--- a/drivers/auxdisplay/Makefile
+++ b/drivers/auxdisplay/Makefile
@@ -20,3 +20,4 @@ obj-$(CONFIG_TM16XX)		+= tm16xx.o
 tm16xx-y			+= tm16xx_core.o
 tm16xx-$(CONFIG_TM16XX_KEYPAD)	+= tm16xx_keypad.o
 obj-$(CONFIG_TM16XX_I2C)	+= tm16xx_i2c.o
+obj-$(CONFIG_TM16XX_SPI)	+= tm16xx_spi.o
diff --git a/drivers/auxdisplay/tm16xx_spi.c b/drivers/auxdisplay/tm16xx_spi.c
new file mode 100644
index 000000000000..b305301f918c
--- /dev/null
+++ b/drivers/auxdisplay/tm16xx_spi.c
@@ -0,0 +1,397 @@
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
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/spi/spi.h>
+
+#include "tm16xx.h"
+
+#define TM16XX_SPI_BUFFER_SIZE	8
+#define TM16XX_SPI_TWAIT_US	2
+
+static int tm16xx_spi_probe(struct spi_device *spi)
+{
+	const struct tm16xx_controller *controller;
+	struct tm16xx_display *display;
+	int ret;
+
+	controller = spi_get_device_match_data(spi);
+	if (!controller)
+		return -EINVAL;
+
+	display = devm_kzalloc(&spi->dev, sizeof(*display), GFP_KERNEL);
+	if (!display)
+		return -ENOMEM;
+
+	/* Allocate DMA-safe buffer */
+	display->spi_buffer = devm_kzalloc(&spi->dev, TM16XX_SPI_BUFFER_SIZE, GFP_KERNEL);
+	if (!display->spi_buffer)
+		return -ENOMEM;
+
+	display->dev = &spi->dev;
+	display->controller = controller;
+
+	spi_set_drvdata(spi, display);
+
+	ret = tm16xx_probe(display);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static void tm16xx_spi_remove(struct spi_device *spi)
+{
+	struct tm16xx_display *display = spi_get_drvdata(spi);
+
+	tm16xx_remove(display);
+}
+
+/**
+ * tm16xx_spi_read() - SPI read helper for controller
+ * @display: pointer to tm16xx_display
+ * @cmd: command to send
+ * @cmd_len: length of command
+ * @data: buffer for received data
+ * @data_len: length of data to read
+ *
+ * Return: 0 on success, negative error code on failure
+ */
+static int tm16xx_spi_read(struct tm16xx_display *display, u8 *cmd,
+			   size_t cmd_len, u8 *data, size_t data_len)
+{
+	struct spi_device *spi = to_spi_device(display->dev);
+	struct spi_message msg;
+	int ret;
+
+	/* If STB is high during transmission, command is invalid.
+	 * Reading requires a minimum 2 microseconds wait (Twait)
+	 * after the 8th CLK rising edge before reading on falling edge.
+	 */
+	struct spi_transfer xfers[2] = {
+		{
+			.tx_buf = cmd,
+			.len = cmd_len,
+			.cs_change = 0, /* NO CS toggle */
+			.delay.value = TM16XX_SPI_TWAIT_US,
+			.delay.unit = SPI_DELAY_UNIT_USECS,
+		}, {
+			.rx_buf = data,
+			.len = data_len,
+		}
+	};
+
+	spi_message_init_with_transfers(&msg, xfers, ARRAY_SIZE(xfers));
+
+	ret = spi_sync(spi, &msg);
+
+	return ret;
+}
+
+/**
+ * tm16xx_spi_write() - SPI write helper for controller
+ * @display: pointer to tm16xx_display
+ * @data: data to write
+ * @len: number of bytes to write
+ *
+ * Return: 0 on success, negative error code on failure
+ */
+static int tm16xx_spi_write(struct tm16xx_display *display, u8 *data, size_t len)
+{
+	struct spi_device *spi = to_spi_device(display->dev);
+
+	return spi_write(spi, data, len);
+}
+
+/* SPI controller-specific functions */
+static int tm1628_init(struct tm16xx_display *display)
+{
+	const enum led_brightness brightness = display->main_led.brightness;
+	const u8 num_hwgrid = display->num_hwgrid;
+	u8 *cmd = display->spi_buffer;
+	int ret;
+
+	/* Set mode command based on grid count */
+	cmd[0] = TM16XX_CMD_MODE;
+	if (num_hwgrid <= 4)
+		cmd[0] |= TM16XX_MODE_4GRIDS;
+	else if (num_hwgrid == 5)
+		cmd[0] |= TM16XX_MODE_5GRIDS;
+	else if (num_hwgrid == 6)
+		cmd[0] |= TM16XX_MODE_6GRIDS;
+	else
+		cmd[0] |= TM16XX_MODE_7GRIDS;
+
+	ret = tm16xx_spi_write(display, cmd, 1);
+	if (ret)
+		return ret;
+
+	/* Set data command */
+	cmd[0] = TM16XX_CMD_WRITE | TM16XX_DATA_ADDR_AUTO;
+	ret = tm16xx_spi_write(display, cmd, 1);
+	if (ret)
+		return ret;
+
+	/* Set control command with brightness */
+	cmd[0] = TM16XX_CMD_CTRL |
+		 TM16XX_CTRL_BRIGHTNESS(brightness, brightness - 1, TM16XX);
+	ret = tm16xx_spi_write(display, cmd, 1);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static int tm1618_data(struct tm16xx_display *display, u8 index,
+		       unsigned int grid)
+{
+	u8 *cmd = display->spi_buffer;
+
+	cmd[0] = TM16XX_CMD_ADDR + index * 2;
+	cmd[1] = FIELD_GET(TM1618_BYTE1_MASK, grid);
+	cmd[2] = FIELD_GET(TM1618_BYTE2_MASK, grid) << TM1618_BYTE2_SHIFT;
+
+	return tm16xx_spi_write(display, cmd, 3);
+}
+
+static int tm1628_data(struct tm16xx_display *display, u8 index,
+		       unsigned int grid)
+{
+	u8 *cmd = display->spi_buffer;
+
+	cmd[0] = TM16XX_CMD_ADDR + index * 2;
+	cmd[1] = FIELD_GET(TM1628_BYTE1_MASK, grid);
+	cmd[2] = FIELD_GET(TM1628_BYTE2_MASK, grid);
+
+	return tm16xx_spi_write(display, cmd, 3);
+}
+
+static int tm1628_keys(struct tm16xx_display *display)
+{
+	u8 *cmd = display->spi_buffer;
+	u8 *codes = display->spi_buffer;
+	unsigned int i;
+	int bit, byte;
+	bool value;
+	int ret;
+
+	cmd[0] = TM16XX_CMD_READ;
+	ret = tm16xx_spi_read(display, cmd, 1, codes, TM1628_KEY_READ_LEN);
+	if (ret)
+		return ret;
+
+	/* prevent false readings */
+	for (i = 0; i < TM1628_KEY_READ_LEN; i++) {
+		if (codes[i] & ~TM1628_KEY_MASK)
+			return -EINVAL;
+	}
+
+	tm16xx_for_each_key(display, row, col) {
+		byte = col >> 1;
+		bit = row + ((col & 1) * 3);
+		value = !!(codes[byte] & BIT(bit));
+
+		tm16xx_set_key(display, row, col, value);
+	}
+
+	return 0;
+}
+
+static int tm1638_keys(struct tm16xx_display *display)
+{
+	u8 *cmd = display->spi_buffer;
+	u8 *codes = display->spi_buffer;
+	unsigned int i;
+	int bit, byte;
+	bool value;
+	int ret;
+
+	cmd[0] = TM16XX_CMD_READ;
+	ret = tm16xx_spi_read(display, cmd, 1, codes, TM1638_KEY_READ_LEN);
+	if (ret)
+		return ret;
+
+	/* prevent false readings */
+	for (i = 0; i < TM1638_KEY_READ_LEN; i++) {
+		if (codes[i] & ~TM1638_KEY_MASK)
+			return -EINVAL;
+	}
+
+	tm16xx_for_each_key(display, row, col) {
+		byte = col >> 1;
+		bit = (2 - row) + ((col & 1) << 2);
+		value = !!(codes[byte] & BIT(bit));
+
+		tm16xx_set_key(display, row, col, value);
+	}
+
+	return 0;
+}
+
+static int tm1618_keys(struct tm16xx_display *display)
+{
+	u8 *cmd = display->spi_buffer;
+	u8 *codes = display->spi_buffer;
+	unsigned int i;
+	int ret;
+
+	cmd[0] = TM16XX_CMD_READ;
+	ret = tm16xx_spi_read(display, cmd, 1, codes, TM1618_KEY_READ_LEN);
+	if (ret)
+		return ret;
+
+	/* prevent false readings */
+	for (i = 0; i < TM1618_KEY_READ_LEN; i++) {
+		if (codes[i] & ~TM1618_KEY_MASK)
+			return -EINVAL;
+	}
+
+	tm16xx_set_key(display, 0, 0, !!(codes[0] & BIT(1)));
+	tm16xx_set_key(display, 0, 1, !!(codes[0] & BIT(4)));
+	tm16xx_set_key(display, 0, 2, !!(codes[1] & BIT(1)));
+	tm16xx_set_key(display, 0, 3, !!(codes[1] & BIT(4)));
+	tm16xx_set_key(display, 0, 4, !!(codes[2] & BIT(1)));
+
+	return 0;
+}
+
+static int fd620_data(struct tm16xx_display *display, u8 index,
+		      unsigned int grid)
+{
+	u8 *cmd = display->spi_buffer;
+
+	cmd[0] = TM16XX_CMD_ADDR + index * 2;
+	cmd[1] = FIELD_GET(FD620_BYTE1_MASK, grid);
+	cmd[2] = FIELD_GET(FD620_BYTE2_MASK, grid) << FD620_BYTE2_SHIFT;
+
+	return tm16xx_spi_write(display, cmd, 3);
+}
+
+static int fd620_keys(struct tm16xx_display *display)
+{
+	u8 *cmd = display->spi_buffer;
+	u8 *codes = display->spi_buffer;
+	unsigned int i;
+	int ret;
+
+	cmd[0] = TM16XX_CMD_READ;
+	ret = tm16xx_spi_read(display, cmd, 1, codes, FD620_KEY_READ_LEN);
+	if (ret)
+		return ret;
+
+	/* prevent false readings */
+	for (i = 0; i < FD620_KEY_READ_LEN; i++) {
+		if (codes[i] & ~FD620_KEY_MASK)
+			return -EINVAL;
+	}
+
+	tm16xx_set_key(display, 0, 0, codes[0] & BIT(0));
+	tm16xx_set_key(display, 0, 1, codes[0] & BIT(3));
+	tm16xx_set_key(display, 0, 2, codes[1] & BIT(0));
+	tm16xx_set_key(display, 0, 3, codes[1] & BIT(3));
+	tm16xx_set_key(display, 0, 4, codes[2] & BIT(0));
+	tm16xx_set_key(display, 0, 5, codes[2] & BIT(3));
+	tm16xx_set_key(display, 0, 6, codes[3] & BIT(0));
+
+	return 0;
+}
+
+/* SPI controller definitions */
+static const struct tm16xx_controller tm1618_controller = {
+	.max_grids = 7,
+	.max_segments = 8,
+	.max_brightness = 8,
+	.max_key_rows = 1,
+	.max_key_cols = 5,
+	.init = tm1628_init,
+	.data = tm1618_data,
+	.keys = tm1618_keys,
+};
+
+static const struct tm16xx_controller tm1620_controller = {
+	.max_grids = 6,
+	.max_segments = 10,
+	.max_brightness = 8,
+	.max_key_rows = 0,
+	.max_key_cols = 0,
+	.init = tm1628_init,
+	.data = tm1628_data,
+};
+
+static const struct tm16xx_controller tm1628_controller = {
+	.max_grids = 7,
+	.max_segments = 14, /* seg 11 unused */
+	.max_brightness = 8,
+	.max_key_rows = 2,
+	.max_key_cols = 10,
+	.init = tm1628_init,
+	.data = tm1628_data,
+	.keys = tm1628_keys,
+};
+
+static const struct tm16xx_controller tm1638_controller = {
+	.max_grids = 8,
+	.max_segments = 10,
+	.max_brightness = 8,
+	.max_key_rows = 3,
+	.max_key_cols = 8,
+	.init = tm1628_init,
+	.data = tm1628_data,
+	.keys = tm1638_keys,
+};
+
+static const struct tm16xx_controller fd620_controller = {
+	.max_grids = 5,
+	.max_segments = 8,
+	.max_brightness = 8,
+	.max_key_rows = 1,
+	.max_key_cols = 7,
+	.init = tm1628_init,
+	.data = fd620_data,
+	.keys = fd620_keys,
+};
+
+static const struct of_device_id tm16xx_spi_of_match[] = {
+	{ .compatible = "titanmec,tm1618",  .data = &tm1618_controller },
+	{ .compatible = "titanmec,tm1620",  .data = &tm1620_controller },
+	{ .compatible = "titanmec,tm1628",  .data = &tm1628_controller },
+	{ .compatible = "titanmec,tm1638",  .data = &tm1638_controller },
+	{ .compatible = "fdhisi,fd620",     .data = &fd620_controller  },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, tm16xx_spi_of_match);
+
+static const struct spi_device_id tm16xx_spi_id[] = {
+	{ "tm1618",  (kernel_ulong_t)&tm1618_controller },
+	{ "tm1620",  (kernel_ulong_t)&tm1620_controller },
+	{ "tm1628",  (kernel_ulong_t)&tm1628_controller },
+	{ "tm1638",  (kernel_ulong_t)&tm1638_controller },
+	{ "fd620",   (kernel_ulong_t)&fd620_controller  },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(spi, tm16xx_spi_id);
+
+static struct spi_driver tm16xx_spi_driver = {
+	.driver = {
+		.name = "tm16xx-spi",
+		.of_match_table = tm16xx_spi_of_match,
+	},
+	.probe = tm16xx_spi_probe,
+	.remove = tm16xx_spi_remove,
+	.shutdown = tm16xx_spi_remove,
+	.id_table = tm16xx_spi_id,
+};
+module_spi_driver(tm16xx_spi_driver);
+
+MODULE_AUTHOR("Jean-François Lessard");
+MODULE_DESCRIPTION("TM16xx-spi LED Display Controllers");
+MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS("TM16XX");
-- 
2.43.0


