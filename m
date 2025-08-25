Return-Path: <linux-leds+bounces-5298-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C0E0B3348C
	for <lists+linux-leds@lfdr.de>; Mon, 25 Aug 2025 05:33:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7567C1B21CEB
	for <lists+linux-leds@lfdr.de>; Mon, 25 Aug 2025 03:33:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5189926CE36;
	Mon, 25 Aug 2025 03:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hCVDN/ec"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36E8625B2FA;
	Mon, 25 Aug 2025 03:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756092769; cv=none; b=EBDHmGBAWATx88+6E9ruJ4xllbw6HgpCseG1E5ETNziTH3iouQ/rG6k7GJgZkIt6RGhGpM2ngZwRfNr/9HOGm06S74nJ5CVJsz39dcxSus3xQ0Ki2ecKDn4TfdW2h3gaTPaTefsIDPS3hOhWnlTbPfuxSy8il477kzfqMbvtVtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756092769; c=relaxed/simple;
	bh=nfrC7Dq5iVIZ4wpzGKE83dY5A6KA6AGe9Beib6kpN4s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=loPald3Xz45t85da8h8P/kyKP0AZQCTS7AnzORzAMcs5NWSRoLEM5FgAbbUfsCV7RaAuMdiyZoLiKv+EqJNniGZaRxBx1JSgP3DmuLWObUSXSzyCb2BQVg5pXRXv001mwwpcq1Q88/Yk1l8KpiJyIKCEO8TANQ2xkSl0kis1s8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hCVDN/ec; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-7e87050b077so639745385a.1;
        Sun, 24 Aug 2025 20:32:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756092765; x=1756697565; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MIKdJcuaWwCgmuK0P7/LNXcVQnE6Zoh4q8hGJRCbBdw=;
        b=hCVDN/ecDz92uYSv7t/xCY5Ayr1L6mu8Xa4/nz35I5fz7DvLmA7JCcCLNKm44fF+dM
         LJiwaZjW3LG+zoms9VYcYZF/idnwcBoEE1U2jG8grhPi6UMJ94VfTfrS5q5/OI9IOp12
         GkEffCwvOvkuoAmDck2KxXcUpEnAb8CXJKgAe/kyS7Q70BQysu1MvyWfVz3x28wRu70Q
         eFS6wqzHEIF3ruTUjhKBhJWSuKNShmrYXSiYNjXdA3G++/X7KOx3xwPm7Ha7BLu8iqP3
         /UpkdCEyJj8TiBZb2S3swJbtV4cdHBGkir1JnbK68cpA8c1f0EweReGS4v4NtkADnD/s
         jtPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756092765; x=1756697565;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MIKdJcuaWwCgmuK0P7/LNXcVQnE6Zoh4q8hGJRCbBdw=;
        b=tH3BxThmjdjDY8r+RsFMFlVLgXC2Syx9kw6r4oGDneWtSEiqH2HoPIZ7gFo9e8KcPQ
         0fOhGSxFW9bK63VEp+85itrjlrG7y3l9oMEBmwOdlMNyOHSLngBKOTZ1oED0fOuyipSz
         Iz8zcN3C4r5Q6E5UpB+/7i3blSG9GYy+RgF3++ZqAi1wiGi1azh3WFx/LFgDjH1vWtY8
         U+d0LIknuZEokutyZ3nUJ21M5C1Oi7XuRcBcc/u1Hg+pRGyEpsQreSWYGvfH+paPLfeH
         uwS956ftQkGbYXZgndWWiqNwOeN+dfTo7H/R/ACrxuxciszJp8taSexuQcX7agogdw50
         MkDw==
X-Forwarded-Encrypted: i=1; AJvYcCUqi94X3ozN4i8Lpwc8fqyEddFZ83ZAKZMTtvTU0wTOksqTOxawPJ+hqcQyYtMiSFiRjLy9mVKp6qwZgA==@vger.kernel.org, AJvYcCWjaoOL4HzayR6ihEDLCMu4PVKHwjeYWoy6DLMcf/0N2gBL5nw4VKBzJRX8A26RsUGevWm3QReDIS4m@vger.kernel.org
X-Gm-Message-State: AOJu0YwI5tHRHqDi6YX24l0hti3n+ufwLlLk6XX/65eVQVDbZAPM6LSv
	le89jSW/yR5DppzV+AseP07Ng35wkF0YyhFgeQhdKTr4Vg3PZlMS6XVhqg4G1rNR
X-Gm-Gg: ASbGncuzLhrgvVQmnwcTpgnc5TEd6oveAYozj2Eiz9Zjeswuf49tgSLAnFJnBnI6k4q
	pBXEJayRe9Bv3Wrf6zsEvcwzgMZD3cuo1/tNn5Ix5+J2BroP8Rh94mtMLCSY0EHysZNJAziX87k
	DHk5oND4IXeJEyOGFK5W2AuI5ystL6bB6I0omTY5ozIEtwedqPCO9MjGxpChEwnYelbWOfuKeUo
	BbTTVeijFqm8CFsn+8LL1lo4pYw/mMQU3NjxG2c12mCh/RPNDETqEimw+JCuYiWccAMo93nftuF
	BGwulIZRr/T+nMHBL1c3e4yfEPAGM8hzgHuLLAns7M1d0ytYlx9ZUx7P9+wEWa9nZX+MHRGXFRp
	9/MPLhh9zo7iszAtTr2zhqZ7g2Jq4jDl3680eZ5NKJIYkj+dlHoePSf3snhffUMuaHCXH
X-Google-Smtp-Source: AGHT+IEHX49CCp+KtvubLICzgkECfpLuUQlpUPZMAefXMJh3H91ibhW9hvlFju9kWlgy2RP/AtFsCw==
X-Received: by 2002:a05:620a:4542:b0:7e9:f1f2:12d3 with SMTP id af79cd13be357-7ea10f94e0dmr1254199085a.13.1756092764791;
        Sun, 24 Aug 2025 20:32:44 -0700 (PDT)
Received: from localhost (modemcable197.17-162-184.mc.videotron.ca. [184.162.17.197])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7ebf2b4f01fsm398761785a.36.2025.08.24.20.32.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Aug 2025 20:32:44 -0700 (PDT)
From: =?UTF-8?q?Jean-Fran=C3=A7ois=20Lessard?= <jefflessard3@gmail.com>
To: Andy Shevchenko <andy@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v4 4/6] auxdisplay: TM16xx: Add keypad support for scanning matrix keys
Date: Sun, 24 Aug 2025 23:32:30 -0400
Message-ID: <20250825033237.60143-5-jefflessard3@gmail.com>
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

Add support for keypad scanning on TM16xx-compatible auxiliary display
controllers. It handles keypad initialization, scanning, and input
reporting for matrix keys managed by the TM16xx devices.

Key features include:
- Input device registration configured by device properties (poll-interval,
  linux,keymap, autorepeat)
- Key state tracking using managed bitmaps
- Matrix scanning and event reporting integrated with Linux input subsystem

This code is separated from main core driver to improve maintainability and
reviewability.

Signed-off-by: Jean-François Lessard <jefflessard3@gmail.com>
---

Notes:
    checkpatch reports false positives that are intentionally ignored:
    COMPLEX_MACRO/MACRO_ARG_REUSE for tm16xx_for_each_key(): This is a
    standard iterator pattern following kernel conventions (similar to
    for_each_* macros throughout the kernel). The nested for loops are
    the correct implementation for matrix iteration.

 MAINTAINERS                        |   1 +
 drivers/auxdisplay/Kconfig         |  11 +-
 drivers/auxdisplay/Makefile        |   1 +
 drivers/auxdisplay/tm16xx.h        |  27 ++++
 drivers/auxdisplay/tm16xx_core.c   |   4 +
 drivers/auxdisplay/tm16xx_keypad.c | 208 +++++++++++++++++++++++++++++
 6 files changed, 251 insertions(+), 1 deletion(-)
 create mode 100644 drivers/auxdisplay/tm16xx_keypad.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 0ed971881..8edcdd52c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25409,6 +25409,7 @@ F:	Documentation/ABI/testing/sysfs-class-leds-tm16xx
 F:	Documentation/devicetree/bindings/auxdisplay/titanmec,tm16xx.yaml
 F:	drivers/auxdisplay/tm16xx.h
 F:	drivers/auxdisplay/tm16xx_core.c
+F:	drivers/auxdisplay/tm16xx_keypad.c
 
 TMIO/SDHI MMC DRIVER
 M:	Wolfram Sang <wsa+renesas@sang-engineering.com>
diff --git a/drivers/auxdisplay/Kconfig b/drivers/auxdisplay/Kconfig
index 7b58c6cc8..b5dcd024d 100644
--- a/drivers/auxdisplay/Kconfig
+++ b/drivers/auxdisplay/Kconfig
@@ -527,11 +527,14 @@ config SEG_LED_GPIO
 	  will be called seg-led-gpio.
 
 config TM16XX
-	tristate "TM16XX-compatible 7-segment LED controllers"
+	tristate "TM16XX-compatible 7-segment LED controllers with keyscan"
 	depends on SPI || I2C
+	depends on INPUT
 	select NEW_LEDS
 	select LEDS_CLASS
 	select LEDS_TRIGGERS
+	select INPUT_MATRIXKMAP
+	select TM16XX_KEYPAD if (INPUT)
 	help
 	  This driver supports the following TM16XX compatible
 	  I2C and SPI 7-segment led display chips:
@@ -544,6 +547,12 @@ config TM16XX
 	  This driver can also be built as a module. If so, the module
 	  will be called tm16xx.
 
+config TM16XX_KEYPAD
+	bool
+	depends on TM16XX
+	help
+	  Enable keyscan support for TM16XX driver.
+
 #
 # Character LCD with non-conforming interface section
 #
diff --git a/drivers/auxdisplay/Makefile b/drivers/auxdisplay/Makefile
index 7ecf3cd4a..a9b9c8ff0 100644
--- a/drivers/auxdisplay/Makefile
+++ b/drivers/auxdisplay/Makefile
@@ -18,3 +18,4 @@ obj-$(CONFIG_PARPORT_PANEL)	+= panel.o
 obj-$(CONFIG_SEG_LED_GPIO)	+= seg-led-gpio.o
 obj-$(CONFIG_TM16XX)		+= tm16xx.o
 tm16xx-y			+= tm16xx_core.o
+tm16xx-$(CONFIG_TM16XX_KEYPAD)	+= tm16xx_keypad.o
diff --git a/drivers/auxdisplay/tm16xx.h b/drivers/auxdisplay/tm16xx.h
index a7ce483d3..65e2511cd 100644
--- a/drivers/auxdisplay/tm16xx.h
+++ b/drivers/auxdisplay/tm16xx.h
@@ -104,6 +104,7 @@
 struct tm16xx_display;
 struct tm16xx_digit;
 struct tm16xx_led;
+struct tm16xx_keypad;
 
 /**
  * DOC: struct tm16xx_controller - Controller-specific operations and limits
@@ -136,6 +137,7 @@ struct tm16xx_controller {
  * @controller: Controller-specific function table and limits.
  * @client: Union of I2C and SPI client pointers.
  * @spi_buffer: DMA-safe buffer for SPI transactions, or NULL for I2C.
+ * @keypad: Opaque pointer to tm16xx_keypad struct.
  * @num_grids: Number of controller grids in use.
  * @num_segments: Number of controller segments in use.
  * @main_led: LED class device for the entire display.
@@ -157,6 +159,7 @@ struct tm16xx_display {
 		struct spi_device *spi;
 	} client;
 	u8 *spi_buffer;
+	struct tm16xx_keypad *keypad;
 	u8 num_grids;
 	u8 num_segments;
 	struct led_classdev main_led;
@@ -174,4 +177,28 @@ struct tm16xx_display {
 int tm16xx_probe(struct tm16xx_display *display);
 void tm16xx_remove(struct tm16xx_display *display);
 
+/* keypad support */
+#if IS_ENABLED(CONFIG_TM16XX_KEYPAD)
+int tm16xx_keypad_probe(struct tm16xx_display *display);
+void tm16xx_set_key(const struct tm16xx_display *display, const u8 row,
+		    const u8 col, const bool pressed);
+#else
+static inline int tm16xx_keypad_probe(struct tm16xx_display *display)
+{
+	return 0;
+}
+
+static inline void tm16xx_set_key(const struct tm16xx_display *display,
+				  const u8 row, const u8 col,
+				  const bool pressed)
+{
+}
+#endif
+
+#define tm16xx_for_each_key(display, _r, _c) \
+	for (unsigned int _r = 0; \
+	     _r < (display)->controller->max_key_rows; _r++) \
+		for (unsigned int _c = 0; \
+		     _c < (display)->controller->max_key_cols; _c++)
+
 #endif /* _TM16XX_H */
diff --git a/drivers/auxdisplay/tm16xx_core.c b/drivers/auxdisplay/tm16xx_core.c
index 415be7747..e21c41a09 100644
--- a/drivers/auxdisplay/tm16xx_core.c
+++ b/drivers/auxdisplay/tm16xx_core.c
@@ -566,6 +566,10 @@ int tm16xx_probe(struct tm16xx_display *display)
 		goto unregister_leds;
 	}
 
+	ret = tm16xx_keypad_probe(display);
+	if (ret < 0)
+		dev_warn(dev, "Failed to initialize keypad: %d\n", ret);
+
 	return 0;
 
 unregister_leds:
diff --git a/drivers/auxdisplay/tm16xx_keypad.c b/drivers/auxdisplay/tm16xx_keypad.c
new file mode 100644
index 000000000..391ae737e
--- /dev/null
+++ b/drivers/auxdisplay/tm16xx_keypad.c
@@ -0,0 +1,208 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * TM16xx and compatible LED display/keypad controller driver
+ * Supports TM16xx, FD6xx, PT6964, HBS658, AIP16xx and related chips.
+ *
+ * Copyright (C) 2024 Jean-François Lessard
+ */
+
+#include <linux/input.h>
+#include <linux/input/matrix_keypad.h>
+#include <linux/property.h>
+
+#include "tm16xx.h"
+
+/**
+ * struct tm16xx_keypad - Keypad matrix state and input device
+ * @input: Input device for reporting key events.
+ * @state: Current bitmap of key states.
+ * @last_state: Previous bitmap of key states for change detection.
+ * @changes: Bitmap of key state changes since last poll.
+ * @row_shift: Row shift for keymap encoding.
+ */
+struct tm16xx_keypad {
+	struct input_dev *input;
+	unsigned long *state;
+	unsigned long *last_state;
+	unsigned long *changes;
+	u8 row_shift;
+};
+
+/**
+ * tm16xx_key_nbits() - Number of bits for the keypad state bitmap
+ * @display: pointer to tm16xx_display
+ *
+ * Return: total bits in keypad state bitmap (max_key_rows * max_key_cols)
+ */
+static inline unsigned int tm16xx_key_nbits(const struct tm16xx_display *display)
+{
+	return display->controller->max_key_rows *
+	       display->controller->max_key_cols;
+}
+
+/**
+ * tm16xx_get_key_row() - Get row index from keypad bit index
+ * @display: pointer to tm16xx_display
+ * @bit: bit index in state bitmap
+ *
+ * Return: row index
+ */
+static inline u8 tm16xx_get_key_row(const struct tm16xx_display *display,
+				    const unsigned int bit)
+{
+	return bit / display->controller->max_key_cols;
+}
+
+/**
+ * tm16xx_get_key_col() - Get column index from keypad bit index
+ * @display: pointer to tm16xx_display
+ * @bit: bit index in state bitmap
+ *
+ * Return: column index
+ */
+static inline u8 tm16xx_get_key_col(const struct tm16xx_display *display,
+				    const unsigned int bit)
+{
+	return bit % display->controller->max_key_cols;
+}
+
+/**
+ * tm16xx_set_key() - Set the keypad state for a key
+ * @display: pointer to tm16xx_display
+ * @row: row index
+ * @col: column index
+ * @pressed: true if pressed, false otherwise
+ */
+void tm16xx_set_key(const struct tm16xx_display *display, const u8 row,
+		    const u8 col, const bool pressed)
+{
+	__assign_bit(row * display->controller->max_key_cols + col,
+		     display->keypad->state, pressed);
+}
+EXPORT_SYMBOL_NS(tm16xx_set_key, "TM16XX");
+
+/**
+ * tm16xx_keypad_poll() - Polls the keypad, reports events
+ * @input: pointer to input_dev
+ *
+ * Reads the matrix keypad state, compares with previous state, and
+ * reports key events to the input subsystem.
+ */
+static void tm16xx_keypad_poll(struct input_dev *input)
+{
+	struct tm16xx_display *display = input_get_drvdata(input);
+	struct tm16xx_keypad *keypad = display->keypad;
+	const unsigned short *keycodes = keypad->input->keycode;
+	unsigned int nbits = tm16xx_key_nbits(display);
+	unsigned int bit, scancode;
+	u8 row, col;
+	bool pressed;
+	int ret;
+
+	bitmap_zero(keypad->state, nbits);
+	bitmap_zero(keypad->changes, nbits);
+
+	scoped_guard(mutex, &display->lock) {
+		ret = display->controller->keys(display);
+	}
+
+	if (ret < 0) {
+		dev_err(display->dev, "Reading failed: %d\n", ret);
+		return;
+	}
+
+	bitmap_xor(keypad->changes, keypad->state, keypad->last_state, nbits);
+
+	for_each_set_bit(bit, keypad->changes, nbits) {
+		row = tm16xx_get_key_row(display, bit);
+		col = tm16xx_get_key_col(display, bit);
+		pressed = _test_bit(bit, keypad->state);
+		scancode = MATRIX_SCAN_CODE(row, col, keypad->row_shift);
+
+		dev_dbg(display->dev,
+			"key changed: %u, row=%u col=%u down=%d\n", bit, row,
+			col, pressed);
+
+		input_event(keypad->input, EV_MSC, MSC_SCAN, scancode);
+		input_report_key(keypad->input, keycodes[scancode], pressed);
+	}
+	input_sync(keypad->input);
+
+	bitmap_copy(keypad->last_state, keypad->state, nbits);
+}
+
+/**
+ * tm16xx_keypad_probe() - Initialize keypad/input device
+ * @display: pointer to tm16xx_display
+ *
+ * Return: 0 on success, negative error code on failure
+ */
+int tm16xx_keypad_probe(struct tm16xx_display *display)
+{
+	const u8 rows = display->controller->max_key_rows;
+	const u8 cols = display->controller->max_key_cols;
+	struct tm16xx_keypad *keypad;
+	struct input_dev *input;
+	unsigned int poll_interval, nbits;
+	int ret;
+
+	if (!display->controller->keys || !rows || !cols) {
+		dev_dbg(display->dev, "keypad not supported\n");
+		return 0;
+	}
+
+	if (!device_property_present(display->dev, "poll-interval") ||
+	    !device_property_present(display->dev, "linux,keymap")) {
+		dev_dbg(display->dev, "keypad disabled\n");
+		return 0;
+	}
+
+	dev_dbg(display->dev, "Configuring keypad\n");
+
+	ret = device_property_read_u32(display->dev, "poll-interval",
+				       &poll_interval);
+	if (ret < 0)
+		return dev_err_probe(display->dev, ret,
+				     "Failed to read poll-interval\n");
+
+	keypad = devm_kzalloc(display->dev, sizeof(*keypad), GFP_KERNEL);
+	if (!keypad)
+		return -ENOMEM;
+	display->keypad = keypad;
+
+	nbits = tm16xx_key_nbits(display);
+	keypad->state = devm_bitmap_zalloc(display->dev, nbits, GFP_KERNEL);
+	keypad->last_state = devm_bitmap_zalloc(display->dev, nbits, GFP_KERNEL);
+	keypad->changes = devm_bitmap_zalloc(display->dev, nbits, GFP_KERNEL);
+	if (!keypad->state || !keypad->last_state || !keypad->changes)
+		return -ENOMEM;
+
+	input = devm_input_allocate_device(display->dev);
+	if (!input)
+		return -ENOMEM;
+	input->name = "tm16xx-keypad";
+	keypad->input = input;
+	input_set_drvdata(input, display);
+
+	keypad->row_shift = get_count_order(cols);
+	ret = matrix_keypad_build_keymap(NULL, "linux,keymap", rows, cols, NULL,
+					 input);
+	if (ret < 0)
+		return dev_err_probe(display->dev, ret,
+				     "Failed to build keymap\n");
+
+	if (device_property_read_bool(display->dev, "autorepeat"))
+		__set_bit(EV_REP, input->evbit);
+
+	input_setup_polling(input, tm16xx_keypad_poll);
+	input_set_poll_interval(input, poll_interval);
+	ret = input_register_device(input);
+	if (ret < 0)
+		return dev_err_probe(display->dev, ret,
+				     "Failed to register input device\n");
+
+	dev_dbg(display->dev, "keypad rows=%u, cols=%u, poll=%u\n", rows, cols,
+		poll_interval);
+
+	return 0;
+}
-- 
2.43.0


