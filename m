Return-Path: <linux-leds+bounces-5300-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E429FB33494
	for <lists+linux-leds@lfdr.de>; Mon, 25 Aug 2025 05:33:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A7624420411
	for <lists+linux-leds@lfdr.de>; Mon, 25 Aug 2025 03:33:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7F2F275B0D;
	Mon, 25 Aug 2025 03:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jk6PxHK+"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8BB5269AEE;
	Mon, 25 Aug 2025 03:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756092770; cv=none; b=dU11q8F0wmGHDKQ+hSVPeZz9tZj/JLe3Iojv1VZ2IYcD26aU4OKBiiM2iFx0cjBpzL8WRhOKjK8Y5ueqe61GdDOatz6l5+M2AO883/Ujw927ua4tTpHHyZ6WQyzkEYan4yyPqOW2nHcvVmA4XGaYRU4A84FHXsjHYU1xdAc049Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756092770; c=relaxed/simple;
	bh=86TleQdUi+JMz+iUg6eiKigh7Qwwees0tjmyxXdZMBA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bpQI0tluVkQRyn6f5czGHbU6lMQUB6/uuQ1VX1eHSs3F6pB1bKj0zTHtkaQwxWUKtMucq8MJPqOHHvatS8hGP4aP3SPmOrNijuTZAilgSpWXvEmjUckpy6pOjyY21XFWs413H3tQEtTYsX+Ycckjbwg8uAAA+dlMM5TyTCuyiuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jk6PxHK+; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-70d93f5799bso27264336d6.1;
        Sun, 24 Aug 2025 20:32:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756092768; x=1756697568; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TBg2VgzadmcpGOk4rK6TKexSA/3pGGW3w4j/3ZDiVuk=;
        b=Jk6PxHK+0SVKQBSqD1/Jg6YHkeYYnOSvmb8mMA11jhSICMqfAvmZEfji2kXF4YKuOD
         R+cpC6GMSpsonqY2Ko0AmVohpVoqJnSNlxjucGkpPJKcukvnznM9GL1ra84nPjnAGvZo
         EQbOfGdGJAyS+2uCcwJTTs9L1WZk0ECi4/58yGB2PdyabBkbL+JHdGqHZbM05VcKW8Rz
         hn8jEJ3iVrO8HBRe/zX9kyHBucA1LDGYYNsYZ9BjR1xsHnDbofdMUljW3yC90bswuWKN
         r/ObRrN8z7y76p+BZSGZPu+O2sG9cdz6qGHVgkrwmJ1C3+eQqbdChW1g4xqelJtmNUBs
         42kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756092768; x=1756697568;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TBg2VgzadmcpGOk4rK6TKexSA/3pGGW3w4j/3ZDiVuk=;
        b=YRCeqRTv4v5kajKXLD0jbTWUBrV378ZTaL6KCoTKGbSWFS/rqKvR6kownHTZnXYC2T
         ZUfNjkezZPDg/mnnLr6dNvmaXXQOohwhbVarsYpy3EnRCjTvajqqEFqbFUIH90E0lwe4
         IF9uNH23S0kYAZdrskU4qf98Q3xD4l3a3fiogGo/6AbAKIKuwx5pkHVnSJIgKeln8wEK
         gAmHqEg2JDKRZjTyN84IhZazq8EzzGW91IjiHL0gBtAKT6Al+P8aOzlIH9r+eCAwU2/x
         lmaKhwXA+cWi9Cm8pPceqpy1eZEaWm5H9t2PB+o/jAseTcCqetzLvlb3RwSopxhf2/Q8
         aiaA==
X-Forwarded-Encrypted: i=1; AJvYcCWGjeySqjN3q7X1Nogbd+hM6fGJSLYowMc6RQyC5ncx3WKy00AKLwhmTxHNBtdyztLrlhGQhEaBriGxFg==@vger.kernel.org, AJvYcCXxFN+82I57LPXCnEgRUIMjsCVevs62eMFU8Tih6qOd9W3osveEDCAtfXKNTp32/HbuMmSWpJm3kJWT@vger.kernel.org
X-Gm-Message-State: AOJu0YxnPk6jKReR8+HzLHQQf+JuY/rY1Rj5bhLa9guyVms+/SnwmARX
	tI8+osFkBmgDxuci9Brcetal45BJ4cW8xXryTfzwknIBTTbLi7yJiGredE4+fq87
X-Gm-Gg: ASbGnct3DheESHFpf3qPE8Sa4ZdhuC8iUTxz6w1UXY/XpUnicdGvBu8H1jqHMn6eiuL
	V3rCzhzK7KIksBDIpUsJbF9YZ75ANpJZpZHHuQG7Zv4F43HwRxGHkmUlzflp8pC/2aJMIr71UR0
	pj8WEiAKwRH+X+VcPajBQUHyfeMtG5Hyx2OwjI3eLH0pR2sutACsisU2unquZ+x3ibX+lzUFsl1
	03XNUyoCx1AIzqJ6Q66HqftMNr6UObGazv9IGBx0ZD/VR7iTSEX9HvOeOOsiRQR0KNSalGjKgg5
	WKXdbJDu5qRV1ZnkXYEB37rOCsFLv35Vtb0PgBLmDPFepL9Es2TSHU4DpcZ8OkGZWsBdOO7dVhM
	GAqoaY/MknWS02L4Ign9jfKSVTDIt9JIge2JOgAqfFIdQTjx8OTrC6CGNH+0ap2TCgcNu
X-Google-Smtp-Source: AGHT+IFhNLcyNRLc6FBOHTmkWtIT2E6LZrw6Ey2M5g78X5SqbCh1vY56jLnRhBMGDZid4Nt7qMWdQw==
X-Received: by 2002:a05:6214:2265:b0:70d:bdd2:7cbb with SMTP id 6a1803df08f44-70dbdd285c3mr24890816d6.42.1756092767433;
        Sun, 24 Aug 2025 20:32:47 -0700 (PDT)
Received: from localhost (modemcable197.17-162-184.mc.videotron.ca. [184.162.17.197])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70da72dbf82sm37709216d6.70.2025.08.24.20.32.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Aug 2025 20:32:47 -0700 (PDT)
From: =?UTF-8?q?Jean-Fran=C3=A7ois=20Lessard?= <jefflessard3@gmail.com>
To: Andy Shevchenko <andy@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v4 6/6] auxdisplay: TM16xx: Add support for SPI-based controllers
Date: Sun, 24 Aug 2025 23:32:32 -0400
Message-ID: <20250825033237.60143-7-jefflessard3@gmail.com>
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

Notes:
    include <linux/of.h> is required for of_match_ptr

 MAINTAINERS                     |   1 +
 drivers/auxdisplay/Kconfig      |   7 +
 drivers/auxdisplay/Makefile     |   1 +
 drivers/auxdisplay/tm16xx_spi.c | 398 ++++++++++++++++++++++++++++++++
 4 files changed, 407 insertions(+)
 create mode 100644 drivers/auxdisplay/tm16xx_spi.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 51cc910e2..1ee45be14 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25411,6 +25411,7 @@ F:	drivers/auxdisplay/tm16xx.h
 F:	drivers/auxdisplay/tm16xx_core.c
 F:	drivers/auxdisplay/tm16xx_i2c.c
 F:	drivers/auxdisplay/tm16xx_keypad.c
+F:	drivers/auxdisplay/tm16xx_spi.c
 
 TMIO/SDHI MMC DRIVER
 M:	Wolfram Sang <wsa+renesas@sang-engineering.com>
diff --git a/drivers/auxdisplay/Kconfig b/drivers/auxdisplay/Kconfig
index 6238e753d..868625596 100644
--- a/drivers/auxdisplay/Kconfig
+++ b/drivers/auxdisplay/Kconfig
@@ -536,6 +536,7 @@ config TM16XX
 	select INPUT_MATRIXKMAP
 	select TM16XX_KEYPAD if (INPUT)
 	select TM16XX_I2C if (I2C)
+	select TM16XX_SPI if (SPI)
 	help
 	  This driver supports the following TM16XX compatible
 	  I2C and SPI 7-segment led display chips:
@@ -560,6 +561,12 @@ config TM16XX_I2C
 	help
 	  Enable I2C support for TM16XX driver.
 
+config TM16XX_SPI
+	tristate
+	depends on TM16XX
+	help
+	  Enable SPI support for TM16XX driver.
+
 #
 # Character LCD with non-conforming interface section
 #
diff --git a/drivers/auxdisplay/Makefile b/drivers/auxdisplay/Makefile
index ba7b310f5..2485a3a67 100644
--- a/drivers/auxdisplay/Makefile
+++ b/drivers/auxdisplay/Makefile
@@ -20,3 +20,4 @@ obj-$(CONFIG_TM16XX)		+= tm16xx.o
 tm16xx-y			+= tm16xx_core.o
 tm16xx-$(CONFIG_TM16XX_KEYPAD)	+= tm16xx_keypad.o
 obj-$(CONFIG_TM16XX_I2C)	+= tm16xx_i2c.o
+obj-$(CONFIG_TM16XX_SPI)	+= tm16xx_spi.o
diff --git a/drivers/auxdisplay/tm16xx_spi.c b/drivers/auxdisplay/tm16xx_spi.c
new file mode 100644
index 000000000..fcc69c5f6
--- /dev/null
+++ b/drivers/auxdisplay/tm16xx_spi.c
@@ -0,0 +1,398 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * TM16xx and compatible LED display/keypad controller driver
+ * Supports TM16xx, FD6xx, PT6964, HBS658, AIP16xx and related chips.
+ *
+ * Copyright (C) 2024 Jean-François Lessard
+ */
+
+#include <linux/mod_devicetable.h>
+#include <linux/of.h>
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
+	display->spi_buffer = devm_kzalloc(&spi->dev, TM16XX_SPI_BUFFER_SIZE,
+					   GFP_KERNEL);
+	if (!display->spi_buffer)
+		return -ENOMEM;
+
+	display->client.spi = spi;
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
+	struct spi_device *spi = display->client.spi;
+	struct spi_message msg;
+	int ret;
+
+	dev_dbg(display->dev, "spi_write %*ph", (char)cmd_len, cmd);
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
+	dev_dbg(display->dev, "spi_read %*ph", (char)data_len, data);
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
+	dev_dbg(display->dev, "spi_write %*ph", (char)len, data);
+
+	struct spi_device *spi = display->client.spi;
+
+	return spi_write(spi, data, len);
+}
+
+/* SPI controller-specific functions */
+static int tm1628_init(struct tm16xx_display *display)
+{
+	const enum led_brightness brightness = display->main_led.brightness;
+	const u8 num_grids = display->num_grids;
+	u8 *cmd = display->spi_buffer;
+	int ret;
+
+	/* Set mode command based on grid count */
+	cmd[0] = TM16XX_CMD_MODE;
+	if (num_grids <= 4)
+		cmd[0] |= TM16XX_MODE_4GRIDS;
+	else if (num_grids == 5)
+		cmd[0] |= TM16XX_MODE_5GRIDS;
+	else if (num_grids == 6)
+		cmd[0] |= TM16XX_MODE_6GRIDS;
+	else
+		cmd[0] |= TM16XX_MODE_7GRIDS;
+
+	ret = tm16xx_spi_write(display, cmd, 1);
+	if (ret < 0)
+		return ret;
+
+	/* Set data command */
+	cmd[0] = TM16XX_CMD_WRITE | TM16XX_DATA_ADDR_AUTO;
+	ret = tm16xx_spi_write(display, cmd, 1);
+	if (ret < 0)
+		return ret;
+
+	/* Set control command with brightness */
+	cmd[0] = TM16XX_CMD_CTRL |
+		 TM16XX_CTRL_BRIGHTNESS(brightness, brightness - 1, TM16XX);
+	ret = tm16xx_spi_write(display, cmd, 1);
+	if (ret < 0)
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
+	int ret, i;
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
+		int byte = col >> 1;
+		int bit = row + ((col & 1) * 3);
+		bool value = !!(codes[byte] & BIT(bit));
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
+	int ret, i;
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
+		int byte = col >> 1;
+		int bit = (2 - row) + ((col & 1) << 2);
+		bool value = !!(codes[byte] & BIT(bit));
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
+	int ret, i;
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
+	int ret, i;
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
+	.keys = NULL,
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
+#if IS_ENABLED(CONFIG_OF)
+static const struct of_device_id tm16xx_spi_of_match[] = {
+	{ .compatible = "titanmec,tm1618",  .data = &tm1618_controller },
+	{ .compatible = "titanmec,tm1620",  .data = &tm1620_controller },
+	{ .compatible = "titanmec,tm1628",  .data = &tm1628_controller },
+	{ .compatible = "titanmec,tm1638",  .data = &tm1638_controller },
+	{ .compatible = "fdhisi,fd620",     .data = &fd620_controller  },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, tm16xx_spi_of_match);
+#endif
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
+		.of_match_table = of_match_ptr(tm16xx_spi_of_match),
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


