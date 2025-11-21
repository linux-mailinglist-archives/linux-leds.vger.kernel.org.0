Return-Path: <linux-leds+bounces-6279-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E7773C7A6BF
	for <lists+linux-leds@lfdr.de>; Fri, 21 Nov 2025 16:10:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 6B4854EEF36
	for <lists+linux-leds@lfdr.de>; Fri, 21 Nov 2025 15:00:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97781334696;
	Fri, 21 Nov 2025 14:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wf7PeytL"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C8752BEFFE
	for <linux-leds@vger.kernel.org>; Fri, 21 Nov 2025 14:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763737171; cv=none; b=iHjcFzD1i9FXzrFXYJ6Ph28JvjNIGaZqaWLndr04HPegdOAvXwjQmJlD/fvjbbqwnafXtOCEHYhpp4KkIC6hRRPbA41H/jd+A9B/js3bSCxtu/ksFAJtg83lB0Hj3gvsKLADmVk54YqnZfRhn3Ne5wA/wVOc0Gx9Lh86dk2tkzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763737171; c=relaxed/simple;
	bh=w6gUg8zbITnA9iOwESIFWOP2yC/0Mg16aDL2afBAhgg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nRPTg2HiRzkMhTRQdHaxl1/dKAqKTob0I4BaD7kMpTd3AmWYUS0ruzQ+i7lr5qszVu37pyZ0jYDX26sUKuAqLTfJxeqEh0LxeA3ZMeGLnOexh5GUKg/vlOXXL769ZENhnn7yL5T2TCYHgLj+mP6p2Nkanfa6N+Kez37PupvS9zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wf7PeytL; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-4ee328b8e38so18425621cf.0
        for <linux-leds@vger.kernel.org>; Fri, 21 Nov 2025 06:59:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763737166; x=1764341966; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V6nXK5M+s4bk+xgTC+paCir4tH47tvqUs9CsNE6p2bo=;
        b=Wf7PeytL1uiaBndZssXOV+/1l8tAniFfsge/5b156CVHLyXfNvhlyLeLYP5yJBiFZV
         6cc3fIe5trx4XipjMEri2YqmqTFGsBktIg3RBcFi8SrgCIHmfqYBke0+gOJqfyNXGczv
         eDDQgJFKSnHJe6gzSsb/CyTvDebjRpEru7+LvHZx9e3CsR4gpeDTTh17zxDEVVSxdx4W
         SIeHLnMnyBu3E2PY6Qfvt7Lf9jQmb1du28BGysj5HEqCZgYGJ9u0i6jWSLc9hYxL5M9f
         UMKfWStD8Ft1vPcLOBLINK8W20XJdNRGRroxMwWzRp1HQ5JXUuVDHjXKl2He8b5ygZRJ
         cNlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763737166; x=1764341966;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=V6nXK5M+s4bk+xgTC+paCir4tH47tvqUs9CsNE6p2bo=;
        b=TGjJ5kNm/QXRfDRMM1cTGQ1mZwM5XIUIVBRNQNSLpEzbYOSang3tGKsm2ZrUS/SB5l
         +/nJZZLszwAw40wB8YXOG9qqpKxcHy+DF2OYOtXxMRk59q059t4OnXHreXvP8nw+5e3p
         kffhq5JuJCGBkAkYQH/d1+BV5cMc2AXP73xsM9ghFzHwwWtUkfy6PisFLGETJYJ+xrEc
         Yku//3qTo2pfiTK6UaXmga0vSasNHr2TX8SM7U6HpG945n+XM4AZR3sM0D+qUvFiEERc
         j+LdVjvbr0Q+n1KWLIrGZtAY6Efvp7a6zOfcFhU3336kpuqpjXMGtoLdteLWVcKYdt5F
         I7/g==
X-Forwarded-Encrypted: i=1; AJvYcCVaM6TSvfF0d/IsoXn2k3/M3jf59JrRgcKqOZDnv549j/f9knFGJIzaPtdlB8u7MHM9cDaeuTV0vHA4@vger.kernel.org
X-Gm-Message-State: AOJu0YxqgH3fL7ao4aXYOT2DPKySznVaa+Sib5QPdDvyBj4yIPV1fVBz
	RsB6gttQAD+MtNg4uI9Tjt05gqb5i0wvNUQd6y5kqxrg+H8xEnjgud0/
X-Gm-Gg: ASbGncuqSbOzz7Z1A+5jJI77gkhWXXXvp3hbYJf+1mtaVWmAzYf6MV6YS/2HA6tky/4
	ELMO16I0VXPtWklNFQ+iRbaFkikfFNN3gv3DJQMxzpIUVs702dLWCdMDtKwvHqOzVEPmRUqeQog
	9iS5kMnPw+/vH24p9CI9ofslMl4hwt85pSxqE8glRRAAbv81OnGDtYnKPzzjTN1B7h6l5RgPsQl
	K10puSATOaNBv8VRjvd+WswzZcY+ub5UsCsGc4iG81nenZ5z5vktBiXz2F2U1srOyWjJWOQs8Zn
	90mE7UED8Cvzopards+WDgA1ZiEMbJhgijiy66/9oCuT7RpC/dOvrU0kwaN/iS2dxxZsC33lDLh
	LF5dBaYo4tIo0m4VWYqRegQJcpvL+yhZ8KjPQ2O0/HBiEB/dmf+3fuOAh+qUHttHvhQNLrOaYEO
	s29dWA4HjNate4cfgtko0pP2kZNiNAQWA/CP8gVOBqtVBotTiGMNZo2UI4
X-Google-Smtp-Source: AGHT+IEBLzV/ukPeqUG34S+rJgTyaHubDtffkthvOR+ZeWjqJAV4raQ6UCkgtoXzo43gR37TWavkzw==
X-Received: by 2002:a05:622a:190f:b0:4ee:fe8:9348 with SMTP id d75a77b69052e-4ee5890e8d6mr35091391cf.72.1763737165698;
        Fri, 21 Nov 2025 06:59:25 -0800 (PST)
Received: from localhost (modemcable197.17-162-184.mc.videotron.ca. [184.162.17.197])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4ee48b45ccesm36619521cf.0.2025.11.21.06.59.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 06:59:25 -0800 (PST)
From: =?UTF-8?q?Jean-Fran=C3=A7ois=20Lessard?= <jefflessard3@gmail.com>
To: Andy Shevchenko <andy@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v6 7/7] auxdisplay: TM16xx: Add support for SPI-based controllers
Date: Fri, 21 Nov 2025 09:59:07 -0500
Message-ID: <20251121145911.176033-8-jefflessard3@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251121145911.176033-1-jefflessard3@gmail.com>
References: <20251121145911.176033-1-jefflessard3@gmail.com>
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
 drivers/auxdisplay/tm16xx_spi.c | 398 ++++++++++++++++++++++++++++++++
 4 files changed, 416 insertions(+)
 create mode 100644 drivers/auxdisplay/tm16xx_spi.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 17b3f101a0c6..b32ccca2b7f6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25922,6 +25922,7 @@ F:	drivers/auxdisplay/tm16xx.h
 F:	drivers/auxdisplay/tm16xx_core.c
 F:	drivers/auxdisplay/tm16xx_i2c.c
 F:	drivers/auxdisplay/tm16xx_keypad.c
+F:	drivers/auxdisplay/tm16xx_spi.c
 
 TMIO/SDHI MMC DRIVER
 M:	Wolfram Sang <wsa+renesas@sang-engineering.com>
diff --git a/drivers/auxdisplay/Kconfig b/drivers/auxdisplay/Kconfig
index 104a43b5baf4..c7409df72d85 100644
--- a/drivers/auxdisplay/Kconfig
+++ b/drivers/auxdisplay/Kconfig
@@ -563,6 +563,22 @@ config TM16XX_I2C
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
index 000000000000..9bd3882ca051
--- /dev/null
+++ b/drivers/auxdisplay/tm16xx_spi.c
@@ -0,0 +1,398 @@
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
+#include <linux/types.h>
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
+	u8 *codes = display->spi_buffer;
+	u8 *cmd = display->spi_buffer;
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
+	u8 *codes = display->spi_buffer;
+	u8 *cmd = display->spi_buffer;
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
+	u8 *codes = display->spi_buffer;
+	u8 *cmd = display->spi_buffer;
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
+	u8 *codes = display->spi_buffer;
+	u8 *cmd = display->spi_buffer;
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


