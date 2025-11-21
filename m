Return-Path: <linux-leds+bounces-6277-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EC93C7A6B9
	for <lists+linux-leds@lfdr.de>; Fri, 21 Nov 2025 16:09:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id A9C07386019
	for <lists+linux-leds@lfdr.de>; Fri, 21 Nov 2025 15:00:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B507C34A765;
	Fri, 21 Nov 2025 14:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IMta0Ziy"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9519C331225
	for <linux-leds@vger.kernel.org>; Fri, 21 Nov 2025 14:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763737167; cv=none; b=fBxpvdxpEpWmFQmMUHfUtPD8CkoGG7JaKKHPS2XRopm3a/sIfbl4NZqpBjAKi6JdRGQas59AmXEYXNJz16UBlO+B7qTWj4G+sSc7qhzOHl/kyCMt32vv0ryUgjoTvjjmqaptnBSQ6O5eHyLRIKR0U7h1FSQjOjd1eLcaQN+EpMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763737167; c=relaxed/simple;
	bh=S4sSF+WliB2XKbxy0gR75BFAM4Ei9WLGFCfdqq+fbPc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VjsDF9KVbesL9cbb70J4B6nXxFM3V5Su+ksShfWXq7WPHzlwbnUnivFivljJfWtK2hCs9Ll58I1ueICdDFQPuAIx/Eq5+Oz5VzkQoakMyDwVnmCFvwqPJi+X18ANncrK+GuFb7JMN14OMZGmg9v3EJpsalz6uQuDxft5Fd1c36U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IMta0Ziy; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-8b29ff9d18cso206831885a.3
        for <linux-leds@vger.kernel.org>; Fri, 21 Nov 2025 06:59:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763737161; x=1764341961; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bKQjWFZ6s5v1/CJZOjpbR5CY3BsDZRl41Ly30PSlyZM=;
        b=IMta0ZiyGtgrrT6svJNSK2hIxT7s5ugMrI+hIRG4v6AMSXmt2nUeYURTsT1uxG/tgW
         kFvjZlst4TE5fzGYw1EFBwE6Dz6BurLHLsOtM3DpXilqn9WCg9SQ3pSLTZrtbkVpzLhX
         yhyZMDZw0t0Xes3muOAWYn2wLDtHtEyAJPRVAaY0N8Xkct05IfaHZvdvejNSoKjWIjkw
         dMUKABQZaQ231ahYMGpb6SN50R3gKrz9zMXQy4tl8supTOyjIUpKYNSBHghavnk2oY5y
         jirUkuzFxkzK75gmm2zGFZoKQ2DPpqh+SYgY7e/ZHOOZHMbkr2RYRW1ssss+SukoWjOl
         acmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763737161; x=1764341961;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bKQjWFZ6s5v1/CJZOjpbR5CY3BsDZRl41Ly30PSlyZM=;
        b=LwyFpsj32SuH8qET8+jRn6noob8b0kWC65EzvYVwOLdd3jDtMxo5rghOWfFtDWpAvC
         2vnnIdSYh4/JCaD7L7ofu5f71aAmXVEgOj64P1UA/7bupxjMhLLKsApeSWdF2zC4oBFN
         Nw5E9zNKKPA+V+W63QjA3QaIXY+uxtB9bNuCOUw9Egh25gOhH2evkKqQF6YOY0BpIG9C
         X2XULxhoyALlAOEKyPb19m0eOZNmfS2d0ZgXhchKix0wTv0hQc9yAYAmyqF8l5GGSd2r
         VMu0fyGCaz1y6yiExB7AyrnJtoBpTUU24emYan/AFShYLGSNvpQR8hvcI6+N0uRY/xdw
         cbVg==
X-Forwarded-Encrypted: i=1; AJvYcCWTWabdMeZJqn93P8uFmrywip48RLVKM5yABbjgN2kHtXNJAc7YVYl3NNqhJdAezLjbuada0j6CQLah@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7dPkjahdl9YIZuoTkLXcKmtfStru22wN2velnWiBK8etTEvOw
	Ve0gelw67kKbMjZNY62IgsHa/nG8zivSHXeHlH+tyGLufBy+lPYdLYOO
X-Gm-Gg: ASbGncu0riRhdROFNFPrNMCic/TjlYEwJdZ1CsBzhsOqZVirEe3gvydM13uHiT1+rLy
	gOtwfPj4V870fv9mfO2dVyI27gLv2wCip/QHFXEkR7AS8XtSt4SkTcl6KaSK5wq9d3BYd8O3fIq
	NabVMESOEyEGXvc3dRV0CHdHS/XqAExiaS8JHqR8vlCjzFzwm6Hknsi512M2ZYcSABdKGZXTgxB
	ucnIPoBLDJjcWdQDbtMLVUvQUiehwSVH+eKp4QdVFbnZwi6BQBoEDymZw12euHKnZohQJMYr61E
	fOTa36Wl4knCBJt57Ebj+upRgaNDSYrl5CQ9aA3Uz3wz+BGY/zHtGo+xyBeFIJiGv2qx9dEB3WT
	VIeeGwsUN5oYwD9ET6TRpD93Ipebd5GjNSkAmu06mO6ccgU6Ac58J+58HELUNYMk2gbuOAZv6Q9
	t+M0tbJpZXeW/ZLJDDRwOC9xIJBE2jAZFojfAHl94qDS46f5ecc8tu5phc
X-Google-Smtp-Source: AGHT+IHwXqp7GKbFTLcYiJEWWM4gZ6I0auGFdL7cg8+sE9liHZy0zat6xP/oDFOT/uo59MrPrE0qng==
X-Received: by 2002:a05:620a:7106:b0:8b2:e5da:d316 with SMTP id af79cd13be357-8b33d48b7d4mr277231785a.87.1763737160462;
        Fri, 21 Nov 2025 06:59:20 -0800 (PST)
Received: from localhost (modemcable197.17-162-184.mc.videotron.ca. [184.162.17.197])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8b329431460sm376873585a.15.2025.11.21.06.59.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 06:59:20 -0800 (PST)
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
Subject: [PATCH v6 4/7] auxdisplay: Add TM16xx 7-segment LED matrix display controllers driver
Date: Fri, 21 Nov 2025 09:59:04 -0500
Message-ID: <20251121145911.176033-5-jefflessard3@gmail.com>
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

Add driver for TM16xx family LED controllers and compatible chips from
multiple vendors including Titan Micro, Fuda Hisi, i-Core, Princeton, and
Winrise. These controllers drive 7-segment digits and individual LED icons
through either I2C or SPI buses.

Successfully tested on various ARM TV boxes including H96 Max, Magicsee N5,
Tanix TX3 Mini, Tanix TX6, X92, and X96 Max across different SoC platforms
(Rockchip, Amlogic, Allwinner).

Acked-by: Paolo Sabatino <paolo.sabatino@gmail.com> # As primary user, integrated tm16xx into Armbian rockchip64
Acked-by: Christian Hewitt <christianshewitt@gmail.com> # As primary user, integrated tm16xx into LibreElec
Tested-by: Paolo Sabatino <paolo.sabatino@gmail.com> # Tested on H96 Max (XY_RK3328)
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

 MAINTAINERS                      |   2 +
 drivers/auxdisplay/Kconfig       |  12 +
 drivers/auxdisplay/Makefile      |   2 +
 drivers/auxdisplay/tm16xx.h      | 175 +++++++++++
 drivers/auxdisplay/tm16xx_core.c | 484 +++++++++++++++++++++++++++++++
 5 files changed, 675 insertions(+)
 create mode 100644 drivers/auxdisplay/tm16xx.h
 create mode 100644 drivers/auxdisplay/tm16xx_core.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 8ccf02ca2544..d9badf2c24ba 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25918,6 +25918,8 @@ TM16XX-COMPATIBLE LED CONTROLLERS DISPLAY DRIVER
 M:	Jean-François Lessard <jefflessard3@gmail.com>
 S:	Maintained
 F:	Documentation/devicetree/bindings/auxdisplay/titanmec,tm16xx.yaml
+F:	drivers/auxdisplay/tm16xx.h
+F:	drivers/auxdisplay/tm16xx_core.c
 
 TMIO/SDHI MMC DRIVER
 M:	Wolfram Sang <wsa+renesas@sang-engineering.com>
diff --git a/drivers/auxdisplay/Kconfig b/drivers/auxdisplay/Kconfig
index bedc6133f970..6b7c04902649 100644
--- a/drivers/auxdisplay/Kconfig
+++ b/drivers/auxdisplay/Kconfig
@@ -526,6 +526,18 @@ config SEG_LED_GPIO
 	  This driver can also be built as a module. If so, the module
 	  will be called seg-led-gpio.
 
+config TM16XX
+	tristate "TM16xx LED matrix display controllers" if COMPILE_TEST
+	select LEDS_CLASS
+	select LEDS_TRIGGERS
+	select LINEDISP
+	select NEW_LEDS
+	help
+	  Core support for TM16xx-compatible 7-segment LED matrix display
+	  controllers from multiple vendors (Titan Micro, Fuda Hisi, i-Core,
+	  Princeton, Winrise). Provides LED class integration for display
+	  control and optional keypad scanning support.
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
index 000000000000..ef6c004f9d89
--- /dev/null
+++ b/drivers/auxdisplay/tm16xx.h
@@ -0,0 +1,175 @@
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
+#include <linux/bits.h>
+#include <linux/bitfield.h>
+#include <linux/leds.h>
+#include <linux/mutex.h>
+#include <linux/types.h>
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
+#define FD6551_CTRL_BR_MASK	GENMASK(3, 1)
+#define FD6551_CTRL_ON		(1 << 0)
+
+#define HBS658_KEY_COL_MASK	GENMASK(7, 5)
+
+#define TM16XX_CTRL_BRIGHTNESS(on, val, prefix) \
+	((on) ? (FIELD_PREP(prefix##_CTRL_BR_MASK, (val)) | prefix##_CTRL_ON) : 0)
+
+/* Forward declarations */
+struct device;
+struct tm16xx_display;
+struct tm16xx_digit;
+struct tm16xx_led;
+
+/**
+ * struct tm16xx_controller - Controller-specific operations and limits
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
+	u8 max_grids;
+	u8 max_segments;
+	u8 max_brightness;
+	u8 max_key_rows;
+	u8 max_key_cols;
+	int (*init)(struct tm16xx_display *display);
+	int (*data)(struct tm16xx_display *display, u8 index, unsigned int grid);
+	int (*keys)(struct tm16xx_display *display);
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
index 000000000000..9c29b7fb1635
--- /dev/null
+++ b/drivers/auxdisplay/tm16xx_core.c
@@ -0,0 +1,484 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * TM16xx and compatible LED display/keypad controller driver
+ * Supports TM16xx, FD6xx, PT6964, HBS658, AIP16xx and related chips.
+ *
+ * Concurrency model:
+ * - Atomic display state bitmap writes for LED triggers in atomic context
+ * - Non-atomic display state reads in flush work provide eventual consistency
+ * - Mutex serializes hardware I2C/SPI transactions (sleeping context)
+ * - Workqueue prevents same work item running concurrently
+ *
+ * Uses explicit resource management (non-devm) for LEDs and workqueues
+ * to enforce removal ordering: unregister LEDs first to stop triggers
+ * before hardware cleanup, preventing use-after-free.
+ *
+ * Copyright (C) 2025 Jean-François Lessard
+ */
+
+#include <linux/bits.h>
+#include <linux/bitfield.h>
+#include <linux/bitmap.h>
+#include <linux/cleanup.h>
+#include <linux/container_of.h>
+#include <linux/device.h>
+#include <linux/leds.h>
+#include <linux/map_to_7segment.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/property.h>
+#include <linux/sysfs.h>
+#include <linux/types.h>
+#include <linux/workqueue.h>
+
+#include "line-display.h"
+
+#include "tm16xx.h"
+
+#define TM16XX_DIGIT_SEGMENTS	7
+
+#define linedisp_to_tm16xx(display)	container_of(display, struct tm16xx_display, linedisp)
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
+ * @on: %true to turn on, %false to turn off
+ *
+ * Atomic display state bitmap writes. May execute in atomic context.
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
+ * Non-atomic display state reads. Flush work provide eventual consistency.
+ *
+ * Return: bit pattern of all segments for the given grid
+ */
+static inline unsigned int tm16xx_get_grid(const struct tm16xx_display *display,
+					   const unsigned int index)
+{
+	return bitmap_read(display->state, index * display->num_hwseg, display->num_hwseg);
+}
+
+/* main display */
+/**
+ * tm16xx_display_flush_init() - Workqueue to configure controller and set brightness
+ * @work: pointer to work_struct
+ *
+ * Configures controller and sets brightness. If an error occurs the error code
+ * is stored in flush_status for upper layers to handle.
+ *
+ * Flush operations use mutex to serialize hardware transactions. Workqueue
+ * allows non-atomic context and ensures the same work never runs concurrently.
+ */
+static void tm16xx_display_flush_init(struct work_struct *work)
+{
+	struct tm16xx_display *display = container_of(work, struct tm16xx_display, flush_init);
+	int ret;
+
+	if (!display->controller->init)
+		return;
+
+	guard(mutex)(&display->lock);
+
+	ret = display->controller->init(display);
+	display->flush_status = ret;
+	if (ret)
+		dev_err(display->dev, "Failed to configure controller: %d\n", ret);
+}
+
+/**
+ * tm16xx_display_flush_data() - Workqueue to update display data to controller
+ * @work: pointer to work_struct
+ *
+ * Updates all hardware grids with current display state. If an error occurs
+ * during any grid write, the operation is interrupted and the error code is
+ * stored in flush_status for upper layers to handle.
+ *
+ * Flush operations use mutex to serialize hardware transactions. Workqueue
+ * allows non-atomic context and ensures the same work never runs concurrently.
+ */
+static void tm16xx_display_flush_data(struct work_struct *work)
+{
+	struct tm16xx_display *display = container_of(work, struct tm16xx_display, flush_display);
+	unsigned int grid, i;
+	int ret = 0;
+
+	if (!display->controller->data)
+		return;
+
+	guard(mutex)(&display->lock);
+
+	for (i = 0; i < display->num_hwgrid; i++) {
+		grid = tm16xx_get_grid(display, i);
+		ret = display->controller->data(display, i, grid);
+		if (ret) {
+			dev_err(display->dev, "Failed to write display data: %d\n", ret);
+			break;
+		}
+	}
+
+	display->flush_status = ret;
+}
+
+/**
+ * tm16xx_brightness_set() - Set display main LED brightness
+ * @led_cdev: pointer to led_classdev
+ * @brightness: new brightness value
+ *
+ * Cannot sleep. Display brightness can be set by LED trigger in atomic context.
+ */
+static void tm16xx_brightness_set(struct led_classdev *led_cdev, enum led_brightness brightness)
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
+ *
+ * Cannot sleep. LED brightness can be set by LED trigger in atomic context.
+ */
+static void tm16xx_led_set(struct led_classdev *led_cdev, enum led_brightness value)
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
+	int seg_pattern, ret = 0;
+	unsigned int i, j;
+	bool val;
+
+	for (i = 0; i < display->num_digits; i++) {
+		digit = &display->digits[i];
+
+		if (i < count) {
+			seg_pattern = map_to_seg7(&map->map.seg7, buf[i]);
+			if (seg_pattern < 0) {
+				dev_err(display->dev,
+					"Invalid mapping to 7 segment at position %u: %c",
+					i, buf[i]);
+				ret = -EINVAL;
+				seg_pattern = 0;
+			}
+		} else {
+			seg_pattern = 0;
+		}
+
+		for (j = 0; j < TM16XX_DIGIT_SEGMENTS; j++) {
+			val = seg_pattern & BIT(j);
+			tm16xx_set_seg(display, digit->hwgrids[j], digit->hwsegs[j], val);
+		}
+	}
+
+	schedule_work(&display->flush_display);
+	return ret;
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
+	unsigned int max_hwgrid = 0, max_hwseg = 0;
+	u32 segments[TM16XX_DIGIT_SEGMENTS * 2];
+	struct tm16xx_digit *digit;
+	struct tm16xx_led *led;
+	unsigned int i, j;
+	u32 reg[2];
+	int ret;
+
+	struct fwnode_handle *digits_node __free(fwnode_handle) =
+		device_get_named_child_node(dev, "digits");
+	struct fwnode_handle *leds_node __free(fwnode_handle) =
+		device_get_named_child_node(dev, "leds");
+
+	/* parse digits */
+	display->num_digits = fwnode_get_child_node_count(digits_node);
+	if (display->num_digits) {
+		display->digits = devm_kcalloc(dev, display->num_digits,
+					       sizeof(*display->digits), GFP_KERNEL);
+		if (!display->digits)
+			return -ENOMEM;
+
+		i = 0;
+		fwnode_for_each_available_child_node_scoped(digits_node, child) {
+			digit = &display->digits[i];
+
+			ret = fwnode_property_read_u32(child, "reg", reg);
+			if (ret)
+				return ret;
+
+			ret = fwnode_property_read_u32_array(child, "segments", segments,
+							     TM16XX_DIGIT_SEGMENTS * 2);
+			if (ret < 0)
+				return ret;
+
+			for (j = 0; j < TM16XX_DIGIT_SEGMENTS; ++j) {
+				digit->hwgrids[j] = segments[2 * j];
+				digit->hwsegs[j] = segments[2 * j + 1];
+				max_hwgrid = umax(max_hwgrid, digit->hwgrids[j]);
+				max_hwseg = umax(max_hwseg, digit->hwsegs[j]);
+			}
+			i++;
+		}
+	}
+
+	/* parse leds */
+	display->num_leds = fwnode_get_child_node_count(leds_node);
+	if (display->num_leds) {
+		display->leds = devm_kcalloc(dev, display->num_leds,
+					     sizeof(*display->leds), GFP_KERNEL);
+		if (!display->leds)
+			return -ENOMEM;
+
+		i = 0;
+		fwnode_for_each_available_child_node_scoped(leds_node, child) {
+			led = &display->leds[i];
+			ret = fwnode_property_read_u32_array(child, "reg", reg, 2);
+			if (ret < 0)
+				return ret;
+
+			led->hwgrid = reg[0];
+			led->hwseg = reg[1];
+			max_hwgrid = umax(max_hwgrid, led->hwgrid);
+			max_hwseg = umax(max_hwseg, led->hwseg);
+			i++;
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
+int tm16xx_probe(struct tm16xx_display *display)
+{
+	struct led_classdev *main = &display->main_led;
+	struct led_init_data led_init = {};
+	struct device *dev = display->dev;
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
+		return ret;
+
+	/*
+	 * Explicit (non-devm) resource management and specific order shutdown sequence
+	 * required to prevent hardware access races when triggers attempt to update
+	 * the display during removal:
+	 * 1. unregister LEDs to stop triggers
+	 * 2. clear display
+	 * 3. turn off display
+	 */
+
+	INIT_WORK(&display->flush_init, tm16xx_display_flush_init);
+	INIT_WORK(&display->flush_display, tm16xx_display_flush_data);
+
+	/* Initialize main LED properties */
+	led_init.fwnode = dev_fwnode(dev);
+	/* max_brightness: handle default value and enforce hardware ceiling */
+	main->max_brightness = display->controller->max_brightness;
+	device_property_read_u32(dev, "max-brightness", &main->max_brightness);
+	main->max_brightness = umin(main->max_brightness,
+				    display->controller->max_brightness);
+
+	/* brightness: handle default value and enforce max ceiling */
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
+		/* Individual leds are hardware-constrained to on/off */
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
+EXPORT_SYMBOL_NS_GPL(tm16xx_probe, "TM16XX");
+
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
+EXPORT_SYMBOL_NS_GPL(tm16xx_remove, "TM16XX");
+
+MODULE_AUTHOR("Jean-François Lessard");
+MODULE_DESCRIPTION("TM16xx LED Display Controllers");
+MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS("LINEDISP");
-- 
2.43.0


