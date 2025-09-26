Return-Path: <linux-leds+bounces-5602-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DFCC5BA41FC
	for <lists+linux-leds@lfdr.de>; Fri, 26 Sep 2025 16:22:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 89B3817696A
	for <lists+linux-leds@lfdr.de>; Fri, 26 Sep 2025 14:22:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D8281D5ACE;
	Fri, 26 Sep 2025 14:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A/G/Hq2r"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 173EB2264B9
	for <linux-leds@vger.kernel.org>; Fri, 26 Sep 2025 14:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758896366; cv=none; b=LIywOS07YkDR3RiV48hliKm81SETO0mZv7aOP7sezy7UUACQGKDIZ+JHruJxxMt6X+XRSWrDh767tOFSwmRPiD4cDllo1fUwF/djnNcF+l22VaYk38TzSSqZULFt2C88eij3YItDgAPLW5U99O6dLRYccQPeE/DA3O6grH8Upuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758896366; c=relaxed/simple;
	bh=2OMwKz/1ATmuVTJbraJlU8IK2jN/MaoeuTI10GJZZvQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ii6uyxreLp4GknuzcLZX9nm6VfPXVL5IWOXk/OI3Rxcq+G797Y99ai8kRqlqUnN0Uz8OlKxKWyhOLW6Jcc74uYq6KMk8Pzsk+IWQkzeG04AjQYUxSywinfPozGJjD5+jXYM7hXr3L8z6USXRET3/wiiAwE99VpMYNPqiCbXDsW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A/G/Hq2r; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-863fa984ef5so4450185a.3
        for <linux-leds@vger.kernel.org>; Fri, 26 Sep 2025 07:19:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758896362; x=1759501162; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4Uy9+jaFxRcqCv0UwqDi99lZCm8ucSVuU36R2L4NzEY=;
        b=A/G/Hq2r3cemsMsnoBfmqU959W1YxlmrqU869O2rpzrRmRufK8ZnIl40Mg9lkHCA7V
         Ii4tayhXaF3OilVUrxgXLveSGIGQTn6/70Q8HV9oLrVQHozPhfk572jLk0A8KSqFjcaX
         Ex5EXBsyzKI8Vhl6HBcGx7dytgPHSd9ct0DSw/0WmOIdKGw5zzSqHhr8b1nNjFAoBQbU
         ACPdM4NBkQFNA3GaCv14IeAT3EPuaHS6t24IYh6swxEQMLPUnfJ+MrGI9j8pzILOlnaD
         ruc9dHoZWv0OWcldNdrnRfcUonV0q5ZG0fNxxODYDyslT9npVolziaXzRFdJUDB7F+mf
         aL7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758896362; x=1759501162;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4Uy9+jaFxRcqCv0UwqDi99lZCm8ucSVuU36R2L4NzEY=;
        b=l7Jr1kiHm6av0pVNIw7cD39AfOuN/kFQ4Thpzv7K1o5x+MdkD/DxtmmomsLk74aI7p
         ju04cxXKAk8lcBMcQOv+vuUKn8f9jEPzOv/Eb7rIz8WAQuEyvsRcv8LjGcqFqlmNlSkn
         eGe/2gxbgHeTd5ohBT73Ps9xL4y9OlES6Myalv7gGhm8Rx79MuOqTOEEOzAetukVyBt4
         rl7Yjb9lD9a8QzL3Jqpi0YbzGb0E63tgzFD5Xfzqkd6lrIbrb9H3R702cO8K55XHH2Lm
         a9kTjCcoRcEqoHYVWNXCJEbF4GTq9/Q/o/Dz2zBPl67HzamDykL7I9lfgbjrEeoBkq4P
         ZPuQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJ+L/v3Oi6exkl9VXIg11zVZ5fQN5/f7w5jG+Vzlqzd0eizC46jweMJ+UlnWLOMMbzK0Y+sQizYNdL@vger.kernel.org
X-Gm-Message-State: AOJu0YxYvQbRibEpv+ZGaRm0QjpkH4FS4k4QaP3yg90YWNccaCZzcLj0
	MpSOuFLFV1pJxb38tpS9iEWeJFfEqCxgdc5LvM4HX4LYd559ubnbVDDr
X-Gm-Gg: ASbGncsU583uxDMvu4ZRAaqNrQmoqqJ/L+e/wUFWtZMI7g9PBHrSXbAU5ACroLTWLtN
	0p3m1/mURrDmoYpd4ZYP3yANz4drhUX5MqhnlECDMq9j/ckNDWhC1Q0lOc8x6Y0+Knp8TIbKnk3
	7ieXBZ16I+Yxtlb36X495lcFsIrIYImLVXfRdRL/fJu8g1sFga886uWl3nTD9DrDnLgtD8h/cqk
	QLrwboB5MBtYSNpbW8Rgup/lpQ7VH/ELRk0h7IiwEP9Gmqi6YE+vvJQh+twv0XgUDCQPgaMsEi2
	YHQvFk05wpYyu6wQxjcshaW+KaQ+Hfnk2Opq/B/u7VGKorXRvFWjIFurhtYbVF9I9cnR0OzeIlE
	mrUFNDVxrLhZkGm82Ay0DloOrrIxQchPO5x7lCyqKcM+kG0nUlQqZjuS5uGDfrxXytmjJlwyO+a
	U6YLk=
X-Google-Smtp-Source: AGHT+IH4DaQf5/6yYaeUP1YUsHvoy00yGi30pFOaVpofDbsKFOyEiBpS4GTO1pu03hhfewNCaKwpGw==
X-Received: by 2002:a05:6214:2528:b0:78d:5c0b:eda5 with SMTP id 6a1803df08f44-7fc3ec907cdmr109095236d6.45.1758896361560;
        Fri, 26 Sep 2025 07:19:21 -0700 (PDT)
Received: from localhost (modemcable197.17-162-184.mc.videotron.ca. [184.162.17.197])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-801667815bbsm27303716d6.40.2025.09.26.07.19.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Sep 2025 07:19:21 -0700 (PDT)
From: =?UTF-8?q?Jean-Fran=C3=A7ois=20Lessard?= <jefflessard3@gmail.com>
To: Andy Shevchenko <andy@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	Paolo Sabatino <paolo.sabatino@gmail.com>,
	Christian Hewitt <christianshewitt@gmail.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v5 4/7] auxdisplay: Add TM16xx 7-segment LED matrix display controllers driver
Date: Fri, 26 Sep 2025 10:19:05 -0400
Message-ID: <20250926141913.25919-5-jefflessard3@gmail.com>
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

Add driver for TM16xx family LED controllers and compatible chips from
multiple vendors including Titan Micro, Fuda Hisi, i-Core, Princeton, and
Winrise. These controllers drive 7-segment digits and individual LED icons
through either I2C or SPI buses.

Successfully tested on various ARM TV boxes including H96 Max, Magicsee N5,
Tanix TX3 Mini, Tanix TX6, X92, and X96 Max across different SoC platforms
(Rockchip, Amlogic, Allwinner).

Acked-by: Paolo Sabatino <paolo.sabatino@gmail.com> # As primary user, integrated tm16xx into Armbian rockchip64
Acked-by: Christian Hewitt <christianshewitt@gmail.com> # As primary user, integrated tm16xx into LibreElec
Tested-by: Christian Hewitt <christianshewitt@gmail.com> # Tested on X96 Max, Tanix TX3 Mini
Tested-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com> # Tested on Tanix TX3 Mini
Signed-off-by: Jean-François Lessard <jefflessard3@gmail.com>
---

Notes:
    checkpatch reports false positives that are intentionally ignored:
    BIT_MACRO: bit shifts are used for field values while GENMASK/BIT
    are used for bit positions per semantic convention
    
    LED registration uses non-devm variant on-purpose to allow explicit
    unregistration on device removal, ensuring LED triggers are
    immediately stopped. This prevents stale LED trigger activity from
    continuing after the hardware is gone, avoiding the need for complex
    state tracking in brightness callbacks.

 MAINTAINERS                      |   3 +
 drivers/auxdisplay/Kconfig       |   9 +
 drivers/auxdisplay/Makefile      |   2 +
 drivers/auxdisplay/tm16xx.h      | 172 ++++++++++++
 drivers/auxdisplay/tm16xx_core.c | 459 +++++++++++++++++++++++++++++++
 5 files changed, 645 insertions(+)
 create mode 100644 drivers/auxdisplay/tm16xx.h
 create mode 100644 drivers/auxdisplay/tm16xx_core.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 9449dfc43a15..7d5912f2d954 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25444,7 +25444,10 @@ F:	drivers/net/ethernet/ti/tlan.*
 TM16XX-COMPATIBLE LED CONTROLLERS DISPLAY DRIVER
 M:	Jean-François Lessard <jefflessard3@gmail.com>
 S:	Maintained
+F:	Documentation/ABI/testing/sysfs-class-leds-tm16xx
 F:	Documentation/devicetree/bindings/auxdisplay/titanmec,tm16xx.yaml
+F:	drivers/auxdisplay/tm16xx.h
+F:	drivers/auxdisplay/tm16xx_core.c
 
 TMIO/SDHI MMC DRIVER
 M:	Wolfram Sang <wsa+renesas@sang-engineering.com>
diff --git a/drivers/auxdisplay/Kconfig b/drivers/auxdisplay/Kconfig
index bedc6133f970..7bacf11112b5 100644
--- a/drivers/auxdisplay/Kconfig
+++ b/drivers/auxdisplay/Kconfig
@@ -526,6 +526,15 @@ config SEG_LED_GPIO
 	  This driver can also be built as a module. If so, the module
 	  will be called seg-led-gpio.
 
+config TM16XX
+	tristate
+	select LEDS_CLASS
+	select LEDS_TRIGGERS
+	select LINEDISP
+	select NEW_LEDS
+	help
+	  Core TM16XX-compatible 7-segment LED controllers module
+
 #
 # Character LCD with non-conforming interface section
 #
diff --git a/drivers/auxdisplay/Makefile b/drivers/auxdisplay/Makefile
index f5c13ed1cd4f..7ecf3cd4a0d3 100644
--- a/drivers/auxdisplay/Makefile
+++ b/drivers/auxdisplay/Makefile
@@ -16,3 +16,5 @@ obj-$(CONFIG_LINEDISP)		+= line-display.o
 obj-$(CONFIG_MAX6959)		+= max6959.o
 obj-$(CONFIG_PARPORT_PANEL)	+= panel.o
 obj-$(CONFIG_SEG_LED_GPIO)	+= seg-led-gpio.o
+obj-$(CONFIG_TM16XX)		+= tm16xx.o
+tm16xx-y			+= tm16xx_core.o
diff --git a/drivers/auxdisplay/tm16xx.h b/drivers/auxdisplay/tm16xx.h
new file mode 100644
index 000000000000..973b6ac19515
--- /dev/null
+++ b/drivers/auxdisplay/tm16xx.h
@@ -0,0 +1,172 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * TM16xx and compatible LED display/keypad controller driver
+ * Supports TM16xx, FD6xx, PT6964, HBS658, AIP16xx and related chips.
+ *
+ * Copyright (C) 2025 Jean-François Lessard
+ */
+
+#ifndef _TM16XX_H
+#define _TM16XX_H
+
+#include <linux/bitfield.h>
+#include <linux/leds.h>
+#include <linux/workqueue.h>
+
+#include "line-display.h"
+
+/* Common bit field definitions */
+
+/* Command type bits (bits 7-6) */
+#define TM16XX_CMD_MASK		GENMASK(7, 6)
+#define TM16XX_CMD_MODE		(0 << 6)
+#define TM16XX_CMD_DATA		(1 << 6)
+#define TM16XX_CMD_CTRL		(2 << 6)
+#define TM16XX_CMD_ADDR		(3 << 6)
+#define TM16XX_CMD_WRITE	(TM16XX_CMD_DATA | TM16XX_DATA_MODE_WRITE)
+#define TM16XX_CMD_READ		(TM16XX_CMD_DATA | TM16XX_DATA_MODE_READ)
+
+/* Mode command grid settings (bits 1-0) */
+#define TM16XX_MODE_GRID_MASK	GENMASK(1, 0)
+#define TM16XX_MODE_4GRIDS	(0 << 0)
+#define TM16XX_MODE_5GRIDS	(1 << 0)
+#define TM16XX_MODE_6GRIDS	(2 << 0)
+#define TM16XX_MODE_7GRIDS	(3 << 0)
+
+/* Data command settings */
+#define TM16XX_DATA_ADDR_MASK	BIT(2)
+#define TM16XX_DATA_ADDR_AUTO	(0 << 2)
+#define TM16XX_DATA_ADDR_FIXED	(1 << 2)
+#define TM16XX_DATA_MODE_MASK	GENMASK(1, 0)
+#define TM16XX_DATA_MODE_WRITE	(0 << 0)
+#define TM16XX_DATA_MODE_READ	(2 << 0)
+
+/* Control command settings */
+#define TM16XX_CTRL_BR_MASK	GENMASK(2, 0)
+#define TM16XX_CTRL_ON		(1 << 3)
+
+/* TM1618 specific constants */
+#define TM1618_BYTE1_MASK	GENMASK(4, 0)
+#define TM1618_BYTE2_MASK	GENMASK(7, 5)
+#define TM1618_BYTE2_SHIFT	3
+#define TM1618_KEY_READ_LEN	3
+#define TM1618_KEY_MASK		(BIT(4) | BIT(1))
+
+/* TM1628 specific constants */
+#define TM1628_BYTE1_MASK	GENMASK(7, 0)
+#define TM1628_BYTE2_MASK	GENMASK(13, 8)
+#define TM1628_KEY_READ_LEN	5
+#define TM1628_KEY_MASK		(GENMASK(4, 3) | GENMASK(1, 0))
+
+/* TM1638 specific constants */
+#define TM1638_KEY_READ_LEN	4
+#define TM1638_KEY_MASK		(GENMASK(6, 4) | GENMASK(2, 0))
+
+/* FD620 specific constants */
+#define FD620_BYTE1_MASK	GENMASK(6, 0)
+
+#define FD620_BYTE2_MASK	BIT(7)
+#define FD620_BYTE2_SHIFT	5
+#define FD620_KEY_READ_LEN	4
+#define FD620_KEY_MASK		(BIT(3) | BIT(0))
+
+/* I2C controller addresses and control settings */
+#define TM1650_CMD_CTRL		0x48
+#define TM1650_CMD_READ		0x4F
+#define TM1650_CMD_ADDR		0x68
+#define TM1650_CTRL_BR_MASK	GENMASK(6, 4)
+#define TM1650_CTRL_ON		(1 << 0)
+#define TM1650_CTRL_SLEEP	(1 << 2)
+#define TM1650_CTRL_SEG_MASK	BIT(3)
+#define TM1650_CTRL_SEG8_MODE	(0 << 3)
+#define TM1650_CTRL_SEG7_MODE	(1 << 3)
+#define TM1650_KEY_ROW_MASK	GENMASK(1, 0)
+#define TM1650_KEY_COL_MASK	GENMASK(5, 3)
+#define TM1650_KEY_DOWN_MASK	BIT(6)
+#define TM1650_KEY_COMBINED	GENMASK(5, 3)
+
+#define FD655_CMD_CTRL		0x48
+#define FD655_CMD_ADDR		0x66
+#define FD655_CTRL_BR_MASK	GENMASK(6, 5)
+#define FD655_CTRL_ON		(1 << 0)
+
+#define FD6551_CMD_CTRL		0x48
+#define FD6551_CTRL_BR_MASK	GENMASK(3, 1)
+#define FD6551_CTRL_ON		(1 << 0)
+
+#define HBS658_KEY_COL_MASK	GENMASK(7, 5)
+
+#define TM16XX_CTRL_BRIGHTNESS(on, val, prefix) \
+	((on) ? (FIELD_PREP(prefix##_CTRL_BR_MASK, (val)) | prefix##_CTRL_ON) : 0)
+
+/* Forward declarations */
+struct tm16xx_display;
+struct tm16xx_digit;
+struct tm16xx_led;
+
+/**
+ * DOC: struct tm16xx_controller - Controller-specific operations and limits
+ * @max_grids: Maximum number of grids supported by the controller.
+ * @max_segments: Maximum number of segments supported by the controller.
+ * @max_brightness: Maximum brightness level supported by the controller.
+ * @max_key_rows: Maximum number of key input rows supported by the controller.
+ * @max_key_cols: Maximum number of key input columns supported by the controller.
+ * @init: Pointer to controller mode/brightness configuration function.
+ * @data: Pointer to function writing display data to the controller.
+ * @keys: Pointer to function reading controller key state into bitmap.
+ *
+ * Holds function pointers and limits for controller-specific operations.
+ */
+struct tm16xx_controller {
+	const u8 max_grids;
+	const u8 max_segments;
+	const u8 max_brightness;
+	const u8 max_key_rows;
+	const u8 max_key_cols;
+	int (*const init)(struct tm16xx_display *display);
+	int (*const data)(struct tm16xx_display *display, u8 index, unsigned int grid);
+	int (*const keys)(struct tm16xx_display *display);
+};
+
+/**
+ * struct tm16xx_display - Main driver structure for the display
+ * @dev: Pointer to device struct.
+ * @controller: Controller-specific function table and limits.
+ * @linedisp: character line display structure
+ * @spi_buffer: DMA-safe buffer for SPI transactions, or NULL for I2C.
+ * @num_hwgrid: Number of controller grids in use.
+ * @num_hwseg: Number of controller segments in use.
+ * @main_led: LED class device for the entire display.
+ * @leds: Array of individual LED icon structures.
+ * @num_leds: Number of individual LED icons.
+ * @digits: Array of 7-segment digit structures.
+ * @num_digits: Number of 7-segment digits.
+ * @flush_init: Work struct for configuration update.
+ * @flush_display: Work struct for display update.
+ * @flush_status: Status/result of last flush work.
+ * @lock: Mutex protecting concurrent access to work operations.
+ * @state: Bitmap holding current raw display state.
+ */
+struct tm16xx_display {
+	struct device *dev;
+	const struct tm16xx_controller *controller;
+	struct linedisp linedisp;
+	u8 *spi_buffer;
+	u8 num_hwgrid;
+	u8 num_hwseg;
+	struct led_classdev main_led;
+	struct tm16xx_led *leds;
+	u8 num_leds;
+	struct tm16xx_digit *digits;
+	u8 num_digits;
+	struct work_struct flush_init;
+	struct work_struct flush_display;
+	int flush_status;
+	struct mutex lock; /* prevents concurrent work operations */
+	unsigned long *state;
+};
+
+int tm16xx_probe(struct tm16xx_display *display);
+void tm16xx_remove(struct tm16xx_display *display);
+
+#endif /* _TM16XX_H */
diff --git a/drivers/auxdisplay/tm16xx_core.c b/drivers/auxdisplay/tm16xx_core.c
new file mode 100644
index 000000000000..e090c578f8a0
--- /dev/null
+++ b/drivers/auxdisplay/tm16xx_core.c
@@ -0,0 +1,459 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * TM16xx and compatible LED display/keypad controller driver
+ * Supports TM16xx, FD6xx, PT6964, HBS658, AIP16xx and related chips.
+ *
+ * Copyright (C) 2025 Jean-François Lessard
+ */
+
+#include <linux/bitfield.h>
+#include <linux/bitmap.h>
+#include <linux/cleanup.h>
+#include <linux/container_of.h>
+#include <linux/device.h>
+#include <linux/leds.h>
+#include <linux/map_to_7segment.h>
+#include <linux/module.h>
+#include <linux/property.h>
+#include <linux/sysfs.h>
+#include <linux/workqueue.h>
+
+#include "line-display.h"
+#include "tm16xx.h"
+
+#define TM16XX_DIGIT_SEGMENTS	7
+
+#define linedisp_to_tm16xx(display) \
+	container_of(display, struct tm16xx_display, linedisp)
+
+/**
+ * struct tm16xx_led - Individual LED icon mapping
+ * @cdev: LED class device for sysfs interface.
+ * @hwgrid: Controller grid index of the LED.
+ * @hwseg: Controller segment index of the LED.
+ */
+struct tm16xx_led {
+	struct led_classdev cdev;
+	u8 hwgrid;
+	u8 hwseg;
+};
+
+/**
+ * struct tm16xx_digit - 7-segment digit mapping and value
+ * @hwgrids: Array mapping each 7-segment position to a grid on the controller.
+ * @hwsegs: Array mapping each 7-segment position to a segment on the controller.
+ * @value: Current character value displayed on this digit.
+ */
+struct tm16xx_digit {
+	u8 hwgrids[TM16XX_DIGIT_SEGMENTS];
+	u8 hwsegs[TM16XX_DIGIT_SEGMENTS];
+};
+
+/* state bitmap helpers */
+/**
+ * tm16xx_led_nbits() - Number of bits used for the display state bitmap
+ * @display: pointer to tm16xx_display
+ *
+ * Return: total bits in the display state bitmap (grids * segments)
+ */
+static inline unsigned int tm16xx_led_nbits(const struct tm16xx_display *display)
+{
+	return display->num_hwgrid * display->num_hwseg;
+}
+
+/**
+ * tm16xx_set_seg() - Set the display state for a specific grid/segment
+ * @display: pointer to tm16xx_display
+ * @hwgrid: grid index
+ * @hwseg: segment index
+ * @on: true to turn on, false to turn off
+ */
+static inline void tm16xx_set_seg(const struct tm16xx_display *display,
+				  const u8 hwgrid, const u8 hwseg, const bool on)
+{
+	assign_bit(hwgrid * display->num_hwseg + hwseg, display->state, on);
+}
+
+/**
+ * tm16xx_get_grid() - Get the current segment pattern for a grid
+ * @display: pointer to tm16xx_display
+ * @index: grid index
+ *
+ * Return: bit pattern of all segments for the given grid
+ */
+static inline unsigned int tm16xx_get_grid(const struct tm16xx_display *display,
+					   const unsigned int index)
+{
+	return bitmap_read(display->state, index * display->num_hwseg,
+			   display->num_hwseg);
+}
+
+/* main display */
+/**
+ * tm16xx_display_flush_init() - Workqueue to configure controller and set brightness
+ * @work: pointer to work_struct
+ */
+static void tm16xx_display_flush_init(struct work_struct *work)
+{
+	struct tm16xx_display *display = container_of(work,
+						      struct tm16xx_display,
+						      flush_init);
+	int ret;
+
+	if (display->controller->init) {
+		scoped_guard(mutex, &display->lock) {
+			ret = display->controller->init(display);
+			display->flush_status = ret;
+		}
+		if (ret)
+			dev_err(display->dev,
+				"Failed to configure controller: %d\n", ret);
+	}
+}
+
+/**
+ * tm16xx_display_flush_data() - Workqueue to update display data to controller
+ * @work: pointer to work_struct
+ */
+static void tm16xx_display_flush_data(struct work_struct *work)
+{
+	struct tm16xx_display *display = container_of(work,
+						      struct tm16xx_display,
+						      flush_display);
+	unsigned int grid, i;
+	int ret = 0;
+
+	scoped_guard(mutex, &display->lock) {
+		if (display->controller->data) {
+			for (i = 0; i < display->num_hwgrid; i++) {
+				grid = tm16xx_get_grid(display, i);
+				ret = display->controller->data(display, i, grid);
+				if (ret) {
+					dev_err(display->dev,
+						"Failed to write display data: %d\n",
+						ret);
+					break;
+				}
+			}
+		}
+
+		display->flush_status = ret;
+	}
+}
+
+/**
+ * tm16xx_brightness_set() - Set display main LED brightness
+ * @led_cdev: pointer to led_classdev
+ * @brightness: new brightness value
+ */
+static void tm16xx_brightness_set(struct led_classdev *led_cdev,
+				  enum led_brightness brightness)
+{
+	struct tm16xx_display *display = dev_get_drvdata(led_cdev->dev->parent);
+
+	led_cdev->brightness = brightness;
+	schedule_work(&display->flush_init);
+}
+
+/**
+ * tm16xx_led_set() - Set state of an individual LED icon
+ * @led_cdev: pointer to led_classdev
+ * @value: new brightness (0/1)
+ */
+static void tm16xx_led_set(struct led_classdev *led_cdev,
+			   enum led_brightness value)
+{
+	struct tm16xx_led *led = container_of(led_cdev, struct tm16xx_led, cdev);
+	struct tm16xx_display *display = dev_get_drvdata(led_cdev->dev->parent);
+
+	tm16xx_set_seg(display, led->hwgrid, led->hwseg, value);
+	schedule_work(&display->flush_display);
+}
+
+static int tm16xx_display_value(struct tm16xx_display *display, const char *buf, size_t count)
+{
+	struct linedisp *linedisp = &display->linedisp;
+	struct linedisp_map *map = linedisp->map;
+	struct tm16xx_digit *digit;
+	unsigned int i, j;
+	int seg_pattern;
+	bool val;
+
+	for (i = 0; i < display->num_digits && i < count; i++) {
+		digit = &display->digits[i];
+		seg_pattern = map_to_seg7(&map->map.seg7, buf[i]);
+
+		for (j = 0; j < TM16XX_DIGIT_SEGMENTS; j++) {
+			val = seg_pattern & BIT(j);
+			tm16xx_set_seg(display, digit->hwgrids[j], digit->hwsegs[j], val);
+		}
+	}
+
+	for (; i < display->num_digits; i++) {
+		digit = &display->digits[i];
+		for (j = 0; j < TM16XX_DIGIT_SEGMENTS; j++)
+			tm16xx_set_seg(display, digit->hwgrids[j], digit->hwsegs[j], 0);
+	}
+
+	schedule_work(&display->flush_display);
+	return 0;
+}
+
+static int tm16xx_linedisp_get_map_type(struct linedisp *linedisp)
+{
+	return LINEDISP_MAP_SEG7;
+}
+
+static void tm16xx_linedisp_update(struct linedisp *linedisp)
+{
+	struct tm16xx_display *display = linedisp_to_tm16xx(linedisp);
+
+	tm16xx_display_value(display, linedisp->buf, linedisp->num_chars);
+}
+
+static const struct linedisp_ops tm16xx_linedisp_ops = {
+	.get_map_type = tm16xx_linedisp_get_map_type,
+	.update = tm16xx_linedisp_update,
+};
+
+static int tm16xx_display_init(struct tm16xx_display *display)
+{
+	schedule_work(&display->flush_init);
+	flush_work(&display->flush_init);
+	if (display->flush_status)
+		return display->flush_status;
+
+	return 0;
+}
+
+static int tm16xx_parse_fwnode(struct device *dev, struct tm16xx_display *display)
+{
+	struct tm16xx_led *led;
+	struct tm16xx_digit *digit;
+	unsigned int max_hwgrid = 0, max_hwseg = 0;
+	unsigned int i, j;
+	int ret;
+	u32 segments[TM16XX_DIGIT_SEGMENTS * 2];
+	u32 reg[2];
+
+	struct fwnode_handle *digits_node __free(fwnode_handle) =
+		device_get_named_child_node(dev, "digits");
+	struct fwnode_handle *leds_node __free(fwnode_handle) =
+		device_get_named_child_node(dev, "leds");
+
+	/* parse digits */
+	if (digits_node) {
+		display->num_digits = fwnode_get_child_node_count(digits_node);
+
+		if (display->num_digits) {
+			display->digits = devm_kcalloc(dev, display->num_digits,
+						       sizeof(*display->digits),
+						       GFP_KERNEL);
+			if (!display->digits)
+				return -ENOMEM;
+
+			i = 0;
+			fwnode_for_each_available_child_node_scoped(digits_node, child) {
+				digit = &display->digits[i];
+
+				ret = fwnode_property_read_u32(child, "reg", reg);
+				if (ret)
+					return ret;
+
+				ret = fwnode_property_read_u32_array(child,
+								     "segments", segments,
+								     TM16XX_DIGIT_SEGMENTS * 2);
+				if (ret < 0)
+					return ret;
+
+				for (j = 0; j < TM16XX_DIGIT_SEGMENTS; ++j) {
+					digit->hwgrids[j] = segments[2 * j];
+					digit->hwsegs[j] = segments[2 * j + 1];
+					max_hwgrid = umax(max_hwgrid, digit->hwgrids[j]);
+					max_hwseg = umax(max_hwseg, digit->hwsegs[j]);
+				}
+				i++;
+			}
+		}
+	}
+
+	/* parse leds */
+	if (leds_node) {
+		display->num_leds = fwnode_get_child_node_count(leds_node);
+
+		if (display->num_leds) {
+			display->leds = devm_kcalloc(dev, display->num_leds,
+						     sizeof(*display->leds),
+						     GFP_KERNEL);
+			if (!display->leds)
+				return -ENOMEM;
+
+			i = 0;
+			fwnode_for_each_available_child_node_scoped(leds_node, child) {
+				led = &display->leds[i];
+				ret = fwnode_property_read_u32_array(child, "reg", reg, 2);
+				if (ret < 0)
+					return ret;
+
+				led->hwgrid = reg[0];
+				led->hwseg = reg[1];
+				max_hwgrid = umax(max_hwgrid, led->hwgrid);
+				max_hwseg = umax(max_hwseg, led->hwseg);
+				i++;
+			}
+		}
+	}
+
+	if (max_hwgrid >= display->controller->max_grids) {
+		dev_err(dev, "grid %u exceeds controller max_grids %u\n",
+			max_hwgrid, display->controller->max_grids);
+		return -EINVAL;
+	}
+
+	if (max_hwseg >= display->controller->max_segments) {
+		dev_err(dev, "segment %u exceeds controller max_segments %u\n",
+			max_hwseg, display->controller->max_segments);
+		return -EINVAL;
+	}
+
+	display->num_hwgrid = max_hwgrid + 1;
+	display->num_hwseg = max_hwseg + 1;
+
+	return 0;
+}
+
+/**
+ * tm16xx_probe() - Probe and initialize display device, register LEDs
+ * @display: pointer to tm16xx_display
+ *
+ * Return: 0 on success, negative error code on failure
+ */
+int tm16xx_probe(struct tm16xx_display *display)
+{
+	struct device *dev = display->dev;
+	struct led_classdev *main = &display->main_led;
+	struct led_init_data led_init = {0};
+	struct fwnode_handle *leds_node;
+	struct tm16xx_led *led;
+	unsigned int nbits, i;
+	int ret;
+
+	ret = tm16xx_parse_fwnode(dev, display);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to parse device tree\n");
+
+	nbits = tm16xx_led_nbits(display);
+	display->state = devm_bitmap_zalloc(dev, nbits, GFP_KERNEL);
+	if (!display->state)
+		return -ENOMEM;
+
+	ret = devm_mutex_init(display->dev, &display->lock);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to initialize mutex\n");
+
+	INIT_WORK(&display->flush_init, tm16xx_display_flush_init);
+	INIT_WORK(&display->flush_display, tm16xx_display_flush_data);
+
+	/* Initialize main LED properties */
+	led_init.fwnode = dev_fwnode(dev); /* apply label property */
+	main->max_brightness = display->controller->max_brightness;
+	device_property_read_u32(dev, "max-brightness", &main->max_brightness);
+	main->max_brightness = umin(main->max_brightness,
+				    display->controller->max_brightness);
+
+	main->brightness = main->max_brightness;
+	device_property_read_u32(dev, "default-brightness", &main->brightness);
+	main->brightness = umin(main->brightness, main->max_brightness);
+
+	main->brightness_set = tm16xx_brightness_set;
+	main->flags = LED_RETAIN_AT_SHUTDOWN | LED_CORE_SUSPENDRESUME;
+
+	/* Register individual LEDs from device tree */
+	ret = led_classdev_register_ext(dev, main, &led_init);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to register main LED\n");
+
+	i = 0;
+	led_init.devicename = dev_name(main->dev);
+	led_init.devname_mandatory = true;
+	led_init.default_label = "led";
+	leds_node = device_get_named_child_node(dev, "leds");
+	fwnode_for_each_available_child_node_scoped(leds_node, child) {
+		led_init.fwnode = child;
+		led = &display->leds[i];
+		led->cdev.max_brightness = 1;
+		led->cdev.brightness_set = tm16xx_led_set;
+		led->cdev.flags = LED_RETAIN_AT_SHUTDOWN | LED_CORE_SUSPENDRESUME;
+
+		ret = led_classdev_register_ext(dev, &led->cdev, &led_init);
+		if (ret) {
+			dev_err_probe(dev, ret, "Failed to register LED %s\n",
+				      led->cdev.name);
+			goto unregister_leds;
+		}
+
+		i++;
+	}
+
+	ret = tm16xx_display_init(display);
+	if (ret) {
+		dev_err_probe(dev, ret, "Failed to initialize display\n");
+		goto unregister_leds;
+	}
+
+	ret = linedisp_attach(&display->linedisp, display->main_led.dev,
+			      display->num_digits, &tm16xx_linedisp_ops);
+	if (ret) {
+		dev_err_probe(dev, ret, "Failed to initialize line-display\n");
+		goto unregister_leds;
+	}
+
+	return 0;
+
+unregister_leds:
+	while (i--)
+		led_classdev_unregister(&display->leds[i].cdev);
+
+	led_classdev_unregister(main);
+	return ret;
+}
+EXPORT_SYMBOL_NS(tm16xx_probe, "TM16XX");
+
+/**
+ * tm16xx_remove() - Remove display, unregister LEDs, blank output
+ * @display: pointer to tm16xx_display
+ */
+void tm16xx_remove(struct tm16xx_display *display)
+{
+	unsigned int nbits = tm16xx_led_nbits(display);
+	struct tm16xx_led *led;
+
+	linedisp_detach(display->main_led.dev);
+
+	/*
+	 * Unregister LEDs first to immediately stop trigger activity.
+	 * This prevents LED triggers from attempting to access hardware
+	 * after it's been disconnected or driver unloaded.
+	 */
+	for (int i = 0; i < display->num_leds; i++) {
+		led = &display->leds[i];
+		led_classdev_unregister(&led->cdev);
+	}
+	led_classdev_unregister(&display->main_led);
+
+	/* Clear display state */
+	bitmap_zero(display->state, nbits);
+	schedule_work(&display->flush_display);
+	flush_work(&display->flush_display);
+
+	/* Turn off display */
+	display->main_led.brightness = LED_OFF;
+	schedule_work(&display->flush_init);
+	flush_work(&display->flush_init);
+}
+EXPORT_SYMBOL_NS(tm16xx_remove, "TM16XX");
+
+MODULE_AUTHOR("Jean-François Lessard");
+MODULE_DESCRIPTION("TM16xx LED Display Controllers");
+MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS("LINEDISP");
-- 
2.43.0


