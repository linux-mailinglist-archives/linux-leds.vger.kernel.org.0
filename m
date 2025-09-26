Return-Path: <linux-leds+bounces-5603-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CB1E8BA4211
	for <lists+linux-leds@lfdr.de>; Fri, 26 Sep 2025 16:23:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0C05C3B2D39
	for <lists+linux-leds@lfdr.de>; Fri, 26 Sep 2025 14:23:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05E4B2FAC16;
	Fri, 26 Sep 2025 14:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HNGlKgw6"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0BFF23536B
	for <linux-leds@vger.kernel.org>; Fri, 26 Sep 2025 14:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758896367; cv=none; b=IBLPZDxnnbmdBwvf61vsenh8DGZj7mduDZ+puBDxSMQ8wSVf4SNEpTbokTJNxoXRzWCymdyxBhA2HUpfD5gmPDutEZFp8XCEv/s/0JpcqY/WNdJE2hBcaoBDrYmqBjpkOsocGLnHiMMmzb2b8IDSmhr9FgNb2zCYPYFgpktAdLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758896367; c=relaxed/simple;
	bh=9Ui2JWuuTQlHA15UIIklNn4NgeHePSypmggyfQPN8kg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kWhHki8ZTCXCDoup/n8fdUHwSuseRUZuufoBR78VqcRVgJe+co7hjjDDHWsif0nnqeJUUhu9I6bKBgXIUy2Qx88/nWLkJuP9Kzg27aItSqHvBrQoGZjk/2A/LXCd613eZbNAkGUQMd94IQFys1iu4J2jUjQ1BrmPnIxJhQ7gyYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HNGlKgw6; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-78f15d5846dso21118466d6.0
        for <linux-leds@vger.kernel.org>; Fri, 26 Sep 2025 07:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758896363; x=1759501163; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+5Z53YhKXh1/2eQ3YwIKhOHKLvwo4LoMLJEfYVEMvUI=;
        b=HNGlKgw658Ucv5HHtvRGqsNqARdQQrJReUPphh+XBfJzL/iXF7tZvjVSolDTjpnQdA
         pHDWHKHUzRACD70/E2B7rUqcnUCR0IXWeeHI/au0PPEZoEHrS/dORGzT9Vi5ZiUN7PT7
         pdubRPwc80D4WKudbGVevgZo+Oxmwpwl+/9MvkTOrb/03BdNGsWR2aE2hkU47lV3g1nu
         22ez9RXLG2Ck/rP9jOP/MNUbUXbp0NnXGOZK3aTvFuwNamTWGQj4wo1IAnBDd1eFAqH1
         ajPraanAkeJY9+ZFOcarVOpst9a3jVbD4O0IECq01kuYmRoddyNl4s97vzG3b4p77pT3
         xxiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758896363; x=1759501163;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+5Z53YhKXh1/2eQ3YwIKhOHKLvwo4LoMLJEfYVEMvUI=;
        b=MZwxa5loePnb7zya6x/ny+ZyXqXUrJZ+I3eg/hJG2iVXWKbPDlMIjUOvDtXxBimlB6
         AEnU/c8QGg3XvIjt5FuOCUdPUlpFNhURzgRk/gp5IVwh++AepT9wSaYUbxfJ8uj8Ae26
         SrAR/gRr4NalbASdvELCFTtmGQ5WvUCGsyE+P/sf2v7M+7l5osZstCGtClu9dtt/fH2a
         cBbcBnmG94R2qUZPT8V9KzZ7kKT3BjqFM+yJEpH15xgb/ANPXi41u0thQKfaY1RI4APc
         DXAK6XEllELsJwbj+93qwrb5TPLCgYH08qGREGPqT72Fl+haiINSLBkq8uompkIh0ImG
         Op9Q==
X-Forwarded-Encrypted: i=1; AJvYcCVgVBWnzWZpg/NWok26b7j8P5+oGxduo/4O/AGSfj6xPBXQQjZ0r2E8iRCXAu9XhvYXb/hT5qO+DxCJ@vger.kernel.org
X-Gm-Message-State: AOJu0YxiVeTv6SsxjJC96MWxDU26ZlbXJCh78eGJ9a6Bi1SeQA1pnyw6
	4YjDNNdGX1rnPK+Ij8bMNu7/0ROPukVjQgy6olI/7g0/k8CJNd45JwMsay/k79uT
X-Gm-Gg: ASbGncv6ajktHZ1VsJM+IPNOaqWxwMWDmFXlx9rJbQlRv1slS5zj0CxcLCufC1IjZiK
	2Bzg3Fa8l5CzGliu/DSEHa8H+MtaF28B5g7reH2/ryK+5gbI8pdQ3SpVm0HKgcCh/zVIJmUXNym
	DZR0qS+OXvQBP7LQ8vjRz4onBpbsUQHWjZqkYmil4ZyWbxUB5pq6FZoeuOLD/EXmi2Bhs+ua6KN
	At8bYMyH6lnfJQprkBDa6DsfM4Dh3d5+PiKi2TydN04AptUrmP0ZRtWet1l8EyhcN28KLnVaMCb
	bVFfIPDYalWfQjkQZwFTenIenWdLRrpjC2HA59R1YrU5i6YDO/N9JI0TzjGZRl+qKJVKtxmVFuy
	iuBbIVQytoyQZdL8BQyjCB16YwnGu34dg35LWB7mdjuSzH4vO9y25u3CTn6lzb9bYMgJnKF/rg9
	ZnYnc=
X-Google-Smtp-Source: AGHT+IFwBDa6Bv27oC2ANkT+MkZSchV0/EWcocBzIVG3sPxwhPkAS2pGZM+hWYxQ2fmqa9tvX80cQA==
X-Received: by 2002:a05:6214:529d:b0:7ea:136e:92ab with SMTP id 6a1803df08f44-7fc414d0cb8mr118869026d6.57.1758896363152;
        Fri, 26 Sep 2025 07:19:23 -0700 (PDT)
Received: from localhost (modemcable197.17-162-184.mc.videotron.ca. [184.162.17.197])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-80173f45ee9sm26791986d6.64.2025.09.26.07.19.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Sep 2025 07:19:22 -0700 (PDT)
From: =?UTF-8?q?Jean-Fran=C3=A7ois=20Lessard?= <jefflessard3@gmail.com>
To: Andy Shevchenko <andy@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v5 5/7] auxdisplay: TM16xx: Add keypad support for scanning matrix keys
Date: Fri, 26 Sep 2025 10:19:06 -0400
Message-ID: <20250926141913.25919-6-jefflessard3@gmail.com>
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

Add support for keypad scanning on TM16xx-compatible auxiliary display
controllers. It handles keypad initialization, scanning, and input
reporting for matrix keys managed by the TM16xx devices.

Key features include:
- Input device registration configured by device properties
  (poll-interval, linux,keymap, autorepeat)
- Key state tracking using managed bitmaps
- Matrix scanning and event reporting integrated with Linux input
  subsystem

This code is separated from main core driver to improve maintainability
and reviewability.

Signed-off-by: Jean-François Lessard <jefflessard3@gmail.com>
---

Notes:
    checkpatch reports false positives that are intentionally ignored:
    COMPLEX_MACRO/MACRO_ARG_REUSE for tm16xx_for_each_key(): This is a
    standard iterator pattern following kernel conventions (similar to
    for_each_* macros throughout the kernel). The nested for loops are
    the correct implementation for matrix iteration.

 MAINTAINERS                        |   1 +
 drivers/auxdisplay/Kconfig         |   9 ++
 drivers/auxdisplay/Makefile        |   1 +
 drivers/auxdisplay/tm16xx.h        |  25 ++++
 drivers/auxdisplay/tm16xx_core.c   |   4 +
 drivers/auxdisplay/tm16xx_keypad.c | 196 +++++++++++++++++++++++++++++
 6 files changed, 236 insertions(+)
 create mode 100644 drivers/auxdisplay/tm16xx_keypad.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 7d5912f2d954..84f2135903cd 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25448,6 +25448,7 @@ F:	Documentation/ABI/testing/sysfs-class-leds-tm16xx
 F:	Documentation/devicetree/bindings/auxdisplay/titanmec,tm16xx.yaml
 F:	drivers/auxdisplay/tm16xx.h
 F:	drivers/auxdisplay/tm16xx_core.c
+F:	drivers/auxdisplay/tm16xx_keypad.c
 
 TMIO/SDHI MMC DRIVER
 M:	Wolfram Sang <wsa+renesas@sang-engineering.com>
diff --git a/drivers/auxdisplay/Kconfig b/drivers/auxdisplay/Kconfig
index 7bacf11112b5..f9a2c0641c3c 100644
--- a/drivers/auxdisplay/Kconfig
+++ b/drivers/auxdisplay/Kconfig
@@ -528,13 +528,22 @@ config SEG_LED_GPIO
 
 config TM16XX
 	tristate
+	depends on INPUT
+	select INPUT_MATRIXKMAP
 	select LEDS_CLASS
 	select LEDS_TRIGGERS
 	select LINEDISP
 	select NEW_LEDS
+	select TM16XX_KEYPAD if (INPUT)
 	help
 	  Core TM16XX-compatible 7-segment LED controllers module
 
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
index 7ecf3cd4a0d3..a9b9c8ff05e8 100644
--- a/drivers/auxdisplay/Makefile
+++ b/drivers/auxdisplay/Makefile
@@ -18,3 +18,4 @@ obj-$(CONFIG_PARPORT_PANEL)	+= panel.o
 obj-$(CONFIG_SEG_LED_GPIO)	+= seg-led-gpio.o
 obj-$(CONFIG_TM16XX)		+= tm16xx.o
 tm16xx-y			+= tm16xx_core.o
+tm16xx-$(CONFIG_TM16XX_KEYPAD)	+= tm16xx_keypad.o
diff --git a/drivers/auxdisplay/tm16xx.h b/drivers/auxdisplay/tm16xx.h
index 973b6ac19515..c503c6136807 100644
--- a/drivers/auxdisplay/tm16xx.h
+++ b/drivers/auxdisplay/tm16xx.h
@@ -103,6 +103,7 @@
 struct tm16xx_display;
 struct tm16xx_digit;
 struct tm16xx_led;
+struct tm16xx_keypad;
 
 /**
  * DOC: struct tm16xx_controller - Controller-specific operations and limits
@@ -133,6 +134,7 @@ struct tm16xx_controller {
  * @dev: Pointer to device struct.
  * @controller: Controller-specific function table and limits.
  * @linedisp: character line display structure
+ * @keypad: Opaque pointer to tm16xx_keypad struct.
  * @spi_buffer: DMA-safe buffer for SPI transactions, or NULL for I2C.
  * @num_hwgrid: Number of controller grids in use.
  * @num_hwseg: Number of controller segments in use.
@@ -150,6 +152,7 @@ struct tm16xx_controller {
 struct tm16xx_display {
 	struct device *dev;
 	const struct tm16xx_controller *controller;
+	struct tm16xx_keypad *keypad;
 	struct linedisp linedisp;
 	u8 *spi_buffer;
 	u8 num_hwgrid;
@@ -169,4 +172,26 @@ struct tm16xx_display {
 int tm16xx_probe(struct tm16xx_display *display);
 void tm16xx_remove(struct tm16xx_display *display);
 
+/* keypad support */
+#if IS_ENABLED(CONFIG_TM16XX_KEYPAD)
+int tm16xx_keypad_probe(struct tm16xx_display *display);
+void tm16xx_set_key(const struct tm16xx_display *display, const int row,
+		    const int col, const bool pressed);
+#else
+static inline int tm16xx_keypad_probe(struct tm16xx_display *display)
+{
+	return 0;
+}
+
+static inline void tm16xx_set_key(const struct tm16xx_display *display,
+				  const int row, const int col,
+				  const bool pressed)
+{
+}
+#endif
+
+#define tm16xx_for_each_key(display, _r, _c) \
+	for (int _r = 0; _r < (display)->controller->max_key_rows; _r++) \
+		for (int _c = 0; _c < (display)->controller->max_key_cols; _c++)
+
 #endif /* _TM16XX_H */
diff --git a/drivers/auxdisplay/tm16xx_core.c b/drivers/auxdisplay/tm16xx_core.c
index e090c578f8a0..1d474d980254 100644
--- a/drivers/auxdisplay/tm16xx_core.c
+++ b/drivers/auxdisplay/tm16xx_core.c
@@ -408,6 +408,10 @@ int tm16xx_probe(struct tm16xx_display *display)
 		goto unregister_leds;
 	}
 
+	ret = tm16xx_keypad_probe(display);
+	if (ret)
+		dev_warn(dev, "Failed to initialize keypad: %d\n", ret);
+
 	return 0;
 
 unregister_leds:
diff --git a/drivers/auxdisplay/tm16xx_keypad.c b/drivers/auxdisplay/tm16xx_keypad.c
new file mode 100644
index 000000000000..daa6afaf749a
--- /dev/null
+++ b/drivers/auxdisplay/tm16xx_keypad.c
@@ -0,0 +1,196 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * TM16xx and compatible LED display/keypad controller driver
+ * Supports TM16xx, FD6xx, PT6964, HBS658, AIP16xx and related chips.
+ *
+ * Copyright (C) 2025 Jean-François Lessard
+ */
+
+#include <linux/bitmap.h>
+#include <linux/cleanup.h>
+#include <linux/device.h>
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
+	int row_shift;
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
+static inline int tm16xx_get_key_row(const struct tm16xx_display *display,
+				     const unsigned int bit)
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
+static inline int tm16xx_get_key_col(const struct tm16xx_display *display,
+				     const unsigned int bit)
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
+void tm16xx_set_key(const struct tm16xx_display *display, const int row,
+		    const int col, const bool pressed)
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
+	unsigned int bit;
+	int row, col, scancode;
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
+	if (ret) {
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
+	const unsigned int rows = display->controller->max_key_rows;
+	const unsigned int cols = display->controller->max_key_cols;
+	struct tm16xx_keypad *keypad;
+	struct input_dev *input;
+	unsigned int poll_interval, nbits;
+	int ret;
+
+	if (!display->controller->keys || !rows || !cols)
+		return 0; /* keypad not supported */
+
+	if (!device_property_present(display->dev, "poll-interval") ||
+	    !device_property_present(display->dev, "linux,keymap"))
+		return 0; /* keypad disabled */
+
+	ret = device_property_read_u32(display->dev, "poll-interval", &poll_interval);
+	if (ret)
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
+	keypad->row_shift = get_count_order(cols); /* !cols already checked */
+	ret = matrix_keypad_build_keymap(NULL, "linux,keymap", rows, cols, NULL, input);
+	if (ret)
+		return dev_err_probe(display->dev, ret,
+				     "Failed to build keymap\n");
+
+	if (device_property_read_bool(display->dev, "autorepeat"))
+		__set_bit(EV_REP, input->evbit);
+
+	input_setup_polling(input, tm16xx_keypad_poll);
+	input_set_poll_interval(input, poll_interval);
+	ret = input_register_device(input);
+	if (ret)
+		return dev_err_probe(display->dev, ret,
+				     "Failed to register input device\n");
+
+	return 0;
+}
-- 
2.43.0


