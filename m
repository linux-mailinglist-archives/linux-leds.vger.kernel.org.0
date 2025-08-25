Return-Path: <linux-leds+bounces-5297-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4739FB33489
	for <lists+linux-leds@lfdr.de>; Mon, 25 Aug 2025 05:33:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F08E61B21CD7
	for <lists+linux-leds@lfdr.de>; Mon, 25 Aug 2025 03:33:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFBBB26AA94;
	Mon, 25 Aug 2025 03:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CxPnpiVp"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0955C243968;
	Mon, 25 Aug 2025 03:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756092768; cv=none; b=rHrdTZheL8gP5F7fzPZogwFoCeI1xdkYCtizmn2Q+D7BPPapWcGMGapWlnAHqxlOLQH2Dxs8DICR9z09whOVRPP9N9MZO90KEL1UDNheRdX/NAAoFTFSyfg/MRG6PhQl8DTy6cE9M+3sMi2LCg54RzapbvcYcK7m8pmZcW4J7xI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756092768; c=relaxed/simple;
	bh=GpPJOp/sP3uGgfOfD6oz3FmYVJ4yKf+ZJZKZv72/G6E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JeZJHwPnDvPG9IPSf0mNe5aE984E7/CYHPClYx5p9AgsCdKV8qdhhi5dk7DdL3QpCnvIXO4Kx3n0hM5tDannFJqUkapALdkIcGFCZ3rlVnfJgz4727A0HIp9WouWqK2uMPMDmZQcU6zfar/OlQ1VEu0q2vekM4RzTI6EttWLLME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CxPnpiVp; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-4b2d501db08so5004031cf.3;
        Sun, 24 Aug 2025 20:32:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756092764; x=1756697564; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6xy/XO0wCzzN9qB0m2Lh+Z8NvY6FhR7tENrvLTwy0ko=;
        b=CxPnpiVpJ+W8ttW7J8YT7q0jYQh5hHFgitmCrvQyA3iNzDXO5z5MIRaFcyF87jQATn
         0/du4RNiJ4Uv1/Lic9qOjywCz2Ram4rV3uYXHSZE5YZQQV3aMy/fW3nb4WGWR5joKHb9
         F/Gjj+qL4ql8xqYfA/fjssU/xfhzWtoq0gFCk+nSjGOsPvCyNu63M81xhsTi7r3kgk2n
         REBkYrJEl9vCYb/jyWM4IoxOanWI5mE42oiIAcehnCrxztGPsFs7xmLHP1Q6LGXWyMh3
         leQh8/mEbQOow//48lfc0BBUoIAsdmLCqEqmKNA6GyIfhRfvFQqb7753X/uYxRqnV67t
         wquQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756092764; x=1756697564;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6xy/XO0wCzzN9qB0m2Lh+Z8NvY6FhR7tENrvLTwy0ko=;
        b=dqfm6e/aiJCAWFeIbAQBiX5M7MG6hir1Emgb3TSjg9zLRlr3Qmlfi8j3yHZcbGSka+
         sY3P/qlOm1tsyugYQHVi01U6HXMnttpvQkonsOhfbnSIU0UUpGS0z5nW6tzleWmtB9Ua
         nBbkP8xqcbm7t8Xr/41NhITqdgxHt4H0t9RP1rUrAihxLTN1b4s3VGRMKqbU4bKDHlRU
         SnEs2Ve/DMNrzzp8uiKA7gFCU4x2c1SeeOlQ87RHUjfvkviByLA9EmknJPZlAVwA739c
         PeDC3/gmtCoKRg1v1KNbEjrwVqZePKS/gBtDAa4c2sHdFi6lCqx5LIqusmprnA7F4dSC
         b7VQ==
X-Forwarded-Encrypted: i=1; AJvYcCXXadh7dp4TAuhU5dzs7cT18S34px9MkUIxXz7UYOISxJnBE3/Ymz6QmIoUd7vMjMeFhXyedCLshQLF@vger.kernel.org, AJvYcCXoLbvZCoqpjLe3RBO7Rq/ErlLUOpLNb6/p5t2EAQcN2ZjwI4SqihKow74c8Tv5LFVHwjUXkMypiS5W+g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5hCBkK2jExZhj5hTRXyN7iZkazONfJq5PT4/a33opHE2RssK6
	+znWZ8+iwAL+v3SPNw2POpkLA3SajWoV4i60PdNfq1x4rfSno7yNvyC8Ykp29YiV
X-Gm-Gg: ASbGnctDKUljRmrhNvlKrQBQ4PVB0c5APCJEAwGgWf6MvILMzsB5T/ldJMu2/Zun9ie
	NI5OgEvl/RLdUNK97y3l5rIcEt5pU2lCQS8icKV0H8KBDurfm7yq6dtZil1hRh8E2NY/1IkeONw
	amasjhnYtn4LWufK8zfQq0gnE6P8mpDa1x3w49gQQn2dUvwguiRmrlLuZ2wdD5xxTu9ZMe7qeri
	hqFNLOeZ0JvNzVxQtbQIW2QhoqcJB7FmsZ7X1iMDtoFEt7/YRsR+8bqilr5RSbF7cISt0kBFOjD
	9bMBzWvXSGsI3CeMG8niCUBe65GoY7cQiFaoGKXHjVzBT073IUPQJzFGAkEiPZmxn4CUWzbjCoo
	vguBNEMvVFUn9ZQBfVzZoaItHPM+KK0E/fTa+IFyPWaRQT2Dlr4RUcsG2zsa9h9pnCGCl
X-Google-Smtp-Source: AGHT+IGdLGR3buHUeCZQPsPnHGE1ip483AQhzZLezduvp1cUsw0HZphDbEHVObFLJPBKodAjxfovsQ==
X-Received: by 2002:a05:620a:d93:b0:7e8:2c81:6f13 with SMTP id af79cd13be357-7ea10e8f3a6mr1217902585a.0.1756092763354;
        Sun, 24 Aug 2025 20:32:43 -0700 (PDT)
Received: from localhost (modemcable197.17-162-184.mc.videotron.ca. [184.162.17.197])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7ebed8911aesm400501685a.19.2025.08.24.20.32.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Aug 2025 20:32:42 -0700 (PDT)
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
	Boris Gjenero <boris.gjenero@gmail.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v4 3/6] auxdisplay: Add TM16xx 7-segment LED matrix display controllers driver
Date: Sun, 24 Aug 2025 23:32:29 -0400
Message-ID: <20250825033237.60143-4-jefflessard3@gmail.com>
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

Add driver for TM16xx family LED controllers and compatible chips from
multiple vendors including Titan Micro, Fuda Hisi, i-Core, Princeton, and
Winrise. These controllers drive 7-segment digits and individual LED icons
through either I2C or SPI buses.

Successfully tested on various ARM TV boxes including H96 Max, Magicsee N5,
Tanix TX3 Mini, Tanix TX6, X92, and X96 Max across different SoC platforms
(Rockchip, Amlogic, Allwinner).

Acked-by: Paolo Sabatino <paolo.sabatino@gmail.com> # As primary user, integrated tm16xx into Armbian rockchip64
Acked-by: Christian Hewitt <christianshewitt@gmail.com> # As primary user, integrated tm16xx into LibreElec
Tested-by: Boris Gjenero <boris.gjenero@gmail.com> # Tested on X92
Tested-by: Paolo Sabatino <paolo.sabatino@gmail.com> # Tested on H96 Max (XY_RK3328)
Tested-by: Christian Hewitt <christianshewitt@gmail.com> # Tested on X96 Max, Tanix TX3 Mini
Tested-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com> # Tested on Tanix TX3 Mini
Signed-off-by: Jean-François Lessard <jefflessard3@gmail.com>
---

Notes:
    checkpatch reports false positives that are intentionally ignored:
    DEVICE_ATTR_FUNCTIONS: Functions are correctly prefixed with driver
    name (tm16xx_*) following standard kernel practice for device
    attribute functions to avoid namespace conflicts.
    BIT_MACRO: bit shifts are used for field values while GENMASK/BIT
    are used for bit positions per semantic convention
    
    include <linux/of.h> is required for the default name of the main led
    device, excluding the unit address, as implemented in
    drivers/leds/led-core.c which relies on of_node->name
    
    LED registration uses non-devm variant on-purpose to allow explicit
    unregistration on device removal, ensuring LED triggers are
    immediately stopped. This prevents stale LED trigger activity from
    continuing after the hardware is gone, avoiding the need for complex
    state tracking in brightness callbacks.

 .../ABI/testing/sysfs-class-leds-tm16xx       |  57 ++
 MAINTAINERS                                   |   3 +
 drivers/auxdisplay/Kconfig                    |  20 +-
 drivers/auxdisplay/Makefile                   |   2 +
 drivers/auxdisplay/tm16xx.h                   | 177 +++++
 drivers/auxdisplay/tm16xx_core.c              | 618 ++++++++++++++++++
 6 files changed, 876 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/ABI/testing/sysfs-class-leds-tm16xx
 create mode 100644 drivers/auxdisplay/tm16xx.h
 create mode 100644 drivers/auxdisplay/tm16xx_core.c

diff --git a/Documentation/ABI/testing/sysfs-class-leds-tm16xx b/Documentation/ABI/testing/sysfs-class-leds-tm16xx
new file mode 100644
index 000000000..c01cca251
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-class-leds-tm16xx
@@ -0,0 +1,57 @@
+What:		/sys/class/leds/<led>/value
+Date:		August 2025
+KernelVersion:	6.17
+Contact:	Jean-François Lessard <jefflessard3@gmail.com>
+Description:
+		Controls the text displayed on the TM16xx 7-segment display.
+
+		Reading returns the current display content as ASCII characters,
+		one character per digit position, followed by a newline.
+
+		Writing sets new display content. Input characters are mapped
+		to 7-segment patterns using the configured character map. The
+		string length should not exceed the number of available digits
+		(see num_digits). Shorter strings will clear remaining digits.
+
+		Example:
+		  echo "1234" > value    # Display "1234"
+		  cat value              # Returns "1234\n"
+
+What:		/sys/class/leds/<led>/num_digits
+Date:		August 2025
+KernelVersion:	6.17
+Contact:	Jean-François Lessard <jefflessard3@gmail.com>
+Description:
+		Read-only attribute showing the number of 7-segment digit
+		positions available on this TM16xx display controller.
+
+		The value is determined by the device tree configuration
+		and represents the maximum length for the 'value' attribute.
+
+		Example:
+		  cat num_digits         # Returns "4\n" for 4-digit display
+
+What:		/sys/class/leds/<led>/map_seg7
+Date:		August 2025
+KernelVersion:	6.17
+Contact:	Jean-François Lessard <jefflessard3@gmail.com>
+Description:
+		Read/write binary blob representing the ASCII-to-7-segment
+		display conversion table used by the TM16xx driver, as defined
+		by struct seg7_conversion_map in <linux/map_to_7segment.h>.
+
+		This attribute is not human-readable. Writes must match the
+		struct size exactly, else -EINVAL is returned; reads return the
+		entire mapping as a binary blob.
+
+		This interface and its implementation match existing conventions
+		used in auxdisplay and segment-mapped display drivers since 2005.
+
+		ABI note: This style of binary sysfs attribute *is an exception*
+		to current "one value per file, text only" sysfs rules, for
+		historical compatibility and driver uniformity. New drivers are
+		discouraged from introducing additional binary sysfs ABIs.
+
+		Reference interface guidance:
+		- include/uapi/linux/map_to_7segment.h
+Users:		Display configuration utilities and embedded system scripts/tools.
diff --git a/MAINTAINERS b/MAINTAINERS
index 4e5a7db6d..0ed971881 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25405,7 +25405,10 @@ F:	drivers/net/ethernet/ti/tlan.*
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
index bedc6133f..7b58c6cc8 100644
--- a/drivers/auxdisplay/Kconfig
+++ b/drivers/auxdisplay/Kconfig
@@ -316,7 +316,7 @@ endif # PARPORT_PANEL
 
 config PANEL_CHANGE_MESSAGE
 	bool "Change LCD initialization message ?"
-	depends on CHARLCD || LINEDISP
+	depends on CHARLCD || LINEDISP || TM16XX
 	help
 	  This allows you to replace the boot message indicating the kernel version
 	  and the driver version with a custom message. This is useful on appliances
@@ -526,6 +526,24 @@ config SEG_LED_GPIO
 	  This driver can also be built as a module. If so, the module
 	  will be called seg-led-gpio.
 
+config TM16XX
+	tristate "TM16XX-compatible 7-segment LED controllers"
+	depends on SPI || I2C
+	select NEW_LEDS
+	select LEDS_CLASS
+	select LEDS_TRIGGERS
+	help
+	  This driver supports the following TM16XX compatible
+	  I2C and SPI 7-segment led display chips:
+	  - Titanmec: TM1618, TM1620, TM1628, TM1638, TM1650
+	  - Fuda Hisi: FD620, FD628, FD650, FD655, FD6551
+	  - i-Core: AiP650, AiP1618, AiP1628
+	  - Princeton: PT6964
+	  - Winrise: HBS658
+
+	  This driver can also be built as a module. If so, the module
+	  will be called tm16xx.
+
 #
 # Character LCD with non-conforming interface section
 #
diff --git a/drivers/auxdisplay/Makefile b/drivers/auxdisplay/Makefile
index f5c13ed1c..7ecf3cd4a 100644
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
index 000000000..a7ce483d3
--- /dev/null
+++ b/drivers/auxdisplay/tm16xx.h
@@ -0,0 +1,177 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * TM16xx and compatible LED display/keypad controller driver
+ * Supports TM16xx, FD6xx, PT6964, HBS658, AIP16xx and related chips.
+ *
+ * Copyright (C) 2024 Jean-François Lessard
+ */
+
+#ifndef _TM16XX_H
+#define _TM16XX_H
+
+#include <linux/bitfield.h>
+#include <linux/bitmap.h>
+#include <linux/leds.h>
+#include <linux/workqueue.h>
+
+#define TM16XX_DIGIT_SEGMENTS	7
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
+#define TM16XX_CTRL_BRIGHTNESS(on, val, prfx) \
+	((on) ? (FIELD_PREP(prfx##_CTRL_BR_MASK, (val)) | prfx##_CTRL_ON) : 0)
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
+	int (*const data)(struct tm16xx_display *display, u8 index,
+			  unsigned int grid);
+	int (*const keys)(struct tm16xx_display *display);
+};
+
+/**
+ * struct tm16xx_display - Main driver structure for the display
+ * @dev: Pointer to device struct.
+ * @controller: Controller-specific function table and limits.
+ * @client: Union of I2C and SPI client pointers.
+ * @spi_buffer: DMA-safe buffer for SPI transactions, or NULL for I2C.
+ * @num_grids: Number of controller grids in use.
+ * @num_segments: Number of controller segments in use.
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
+	union {
+		struct i2c_client *i2c;
+		struct spi_device *spi;
+	} client;
+	u8 *spi_buffer;
+	u8 num_grids;
+	u8 num_segments;
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
index 000000000..415be7747
--- /dev/null
+++ b/drivers/auxdisplay/tm16xx_core.c
@@ -0,0 +1,618 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * TM16xx and compatible LED display/keypad controller driver
+ * Supports TM16xx, FD6xx, PT6964, HBS658, AIP16xx and related chips.
+ *
+ * Copyright (C) 2024 Jean-François Lessard
+ */
+
+#include <linux/map_to_7segment.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/property.h>
+
+#include "tm16xx.h"
+
+static const char *tm16xx_init_value;
+#ifdef CONFIG_PANEL_BOOT_MESSAGE
+tm16xx_init_value = CONFIG_PANEL_BOOT_MESSAGE;
+#endif
+
+static SEG7_CONVERSION_MAP(map_seg7, MAP_ASCII7SEG_ALPHANUM);
+
+/**
+ * struct tm16xx_led - Individual LED icon mapping
+ * @cdev: LED class device for sysfs interface.
+ * @grid: Controller grid index of the LED.
+ * @segment: Controller segment index of the LED.
+ */
+struct tm16xx_led {
+	struct led_classdev cdev;
+	u8 grid;
+	u8 segment;
+};
+
+/**
+ * struct tm16xx_digit_segment - Digit segment mapping to display coordinates
+ * @grid: Controller grid index for this segment.
+ * @segment: Controller segment index for this segment.
+ */
+struct tm16xx_digit_segment {
+	u8 grid;
+	u8 segment;
+};
+
+/**
+ * struct tm16xx_digit - 7-segment digit mapping and value
+ * @segments: Array mapping each 7-segment position to a grid/segment on the controller.
+ * @value: Current character value displayed on this digit.
+ */
+struct tm16xx_digit {
+	struct tm16xx_digit_segment segments[TM16XX_DIGIT_SEGMENTS];
+	char value;
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
+	return display->num_grids * display->num_segments;
+}
+
+/**
+ * tm16xx_set_seg() - Set the display state for a specific grid/segment
+ * @display: pointer to tm16xx_display
+ * @grid: grid index
+ * @seg: segment index
+ * @on: true to turn on, false to turn off
+ */
+static inline void tm16xx_set_seg(const struct tm16xx_display *display,
+				  const u8 grid, const u8 seg, const bool on)
+{
+	assign_bit(grid * display->num_segments + seg, display->state, on);
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
+	return bitmap_read(display->state, index * display->num_segments,
+			   display->num_segments);
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
+		dev_dbg(display->dev, "Configuring controller\n");
+		scoped_guard(mutex, &display->lock) {
+			ret = display->controller->init(display);
+			display->flush_status = ret;
+		}
+		if (ret < 0)
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
+	int i, ret = 0;
+	unsigned int grid;
+
+	dev_dbg(display->dev, "Sending data to controller\n");
+	scoped_guard(mutex, &display->lock) {
+		if (display->controller->data) {
+			for (i = 0; i < display->num_grids; i++) {
+				grid = tm16xx_get_grid(display, i);
+				ret = display->controller->data(display, i,
+								grid);
+				if (ret < 0) {
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
+	dev_dbg(display->dev, "Setting brightness to %d\n", brightness);
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
+	dev_dbg(display->dev, "Setting led %u,%u to %d\n", led->grid,
+		led->segment, value);
+
+	tm16xx_set_seg(display, led->grid, led->segment, value);
+	schedule_work(&display->flush_display);
+}
+
+/**
+ * tm16xx_value_show() - Sysfs: show current display digit values
+ * @dev: pointer to device
+ * @attr: device attribute (unused)
+ * @buf: output buffer
+ *
+ * Return: number of bytes written to output buffer
+ */
+static ssize_t tm16xx_value_show(struct device *dev,
+				 struct device_attribute *attr, char *buf)
+{
+	struct led_classdev *led_cdev = dev_get_drvdata(dev);
+	struct tm16xx_display *display = dev_get_drvdata(led_cdev->dev->parent);
+	int i;
+
+	for (i = 0; i < display->num_digits && i < PAGE_SIZE - 1; i++)
+		buf[i] = display->digits[i].value;
+
+	buf[i++] = '\n';
+	return i;
+}
+
+/**
+ * tm16xx_value_store() - Sysfs: set display digit values
+ * @dev: pointer to device
+ * @attr: device attribute (unused)
+ * @buf: new digit values (ASCII chars)
+ * @count: buffer length
+ *
+ * Return: number of bytes written or negative error code
+ */
+static ssize_t tm16xx_value_store(struct device *dev,
+				  struct device_attribute *attr,
+				  const char *buf, size_t count)
+{
+	struct led_classdev *led_cdev = dev_get_drvdata(dev);
+	struct tm16xx_display *display = dev_get_drvdata(led_cdev->dev->parent);
+	struct tm16xx_digit *digit;
+	struct tm16xx_digit_segment *ds;
+	int i, j;
+	int seg_pattern;
+	bool val;
+
+	dev_dbg(display->dev, "Setting value to %s\n", buf);
+
+	for (i = 0; i < display->num_digits && i < count; i++) {
+		digit = &display->digits[i];
+		digit->value = buf[i];
+		seg_pattern = map_to_seg7(&map_seg7, digit->value);
+
+		for (j = 0; j < TM16XX_DIGIT_SEGMENTS; j++) {
+			ds = &digit->segments[j];
+			val = seg_pattern & BIT(j);
+			tm16xx_set_seg(display, ds->grid, ds->segment, val);
+		}
+	}
+
+	for (; i < display->num_digits; i++) {
+		digit = &display->digits[i];
+		digit->value = 0;
+		for (j = 0; j < TM16XX_DIGIT_SEGMENTS; j++) {
+			ds = &digit->segments[j];
+			tm16xx_set_seg(display, ds->grid, ds->segment, 0);
+		}
+	}
+
+	schedule_work(&display->flush_display);
+	return count;
+}
+
+/**
+ * tm16xx_num_digits_show() - Sysfs: show number of digits on display
+ * @dev: pointer to device
+ * @attr: device attribute (unused)
+ * @buf: output buffer
+ *
+ * Return: number of bytes written
+ */
+static ssize_t tm16xx_num_digits_show(struct device *dev,
+				      struct device_attribute *attr, char *buf)
+{
+	struct led_classdev *led_cdev = dev_get_drvdata(dev);
+	struct tm16xx_display *display = dev_get_drvdata(led_cdev->dev->parent);
+
+	return sprintf(buf, "%u\n", display->num_digits);
+}
+
+/**
+ * tm16xx_map_seg7_show() - Sysfs: show current 7-segment character map (binary blob)
+ * @dev: pointer to device
+ * @attr: device attribute (unused)
+ * @buf: output buffer
+ *
+ * Return: size of map_seg7
+ */
+static ssize_t tm16xx_map_seg7_show(struct device *dev,
+				    struct device_attribute *attr, char *buf)
+{
+	memcpy(buf, &map_seg7, sizeof(map_seg7));
+	return sizeof(map_seg7);
+}
+
+/**
+ * tm16xx_map_seg7_store() - Sysfs: set 7-segment character map (binary blob)
+ * @dev: pointer to device
+ * @attr: device attribute (unused)
+ * @buf: new mapping (must match size of map_seg7)
+ * @cnt: buffer length
+ *
+ * Return: cnt on success, negative errno on failure
+ */
+static ssize_t tm16xx_map_seg7_store(struct device *dev,
+				     struct device_attribute *attr,
+				     const char *buf, size_t cnt)
+{
+	if (cnt != sizeof(map_seg7))
+		return -EINVAL;
+	memcpy(&map_seg7, buf, cnt);
+	return cnt;
+}
+
+static DEVICE_ATTR(value, 0644, tm16xx_value_show, tm16xx_value_store);
+static DEVICE_ATTR(num_digits, 0444, tm16xx_num_digits_show, NULL);
+static DEVICE_ATTR(map_seg7, 0644, tm16xx_map_seg7_show, tm16xx_map_seg7_store);
+
+static struct attribute *tm16xx_main_led_attrs[] = {
+	&dev_attr_value.attr,
+	&dev_attr_num_digits.attr,
+	&dev_attr_map_seg7.attr,
+	NULL,
+};
+ATTRIBUTE_GROUPS(tm16xx_main_led);
+
+/**
+ * tm16xx_display_init() - Initialize display hardware and state
+ * @display: pointer to tm16xx_display
+ *
+ * Return: 0 on success, negative error code on failure
+ */
+static int tm16xx_display_init(struct tm16xx_display *display)
+{
+	unsigned int nbits = tm16xx_led_nbits(display);
+
+	dev_dbg(display->dev, "Initializing display\n");
+	schedule_work(&display->flush_init);
+	flush_work(&display->flush_init);
+	if (display->flush_status < 0)
+		return display->flush_status;
+
+	if (tm16xx_init_value) {
+		tm16xx_value_store(display->main_led.dev, NULL,
+				   tm16xx_init_value,
+				   strlen(tm16xx_init_value));
+	} else {
+		bitmap_fill(display->state, nbits);
+		schedule_work(&display->flush_display);
+		flush_work(&display->flush_display);
+		bitmap_zero(display->state, nbits);
+		if (display->flush_status < 0)
+			return display->flush_status;
+	}
+
+	dev_info(display->dev, "Display turned on\n");
+
+	return 0;
+}
+
+/**
+ * tm16xx_parse_dt() - Parse device tree for digit and LED mapping
+ * @dev: pointer to struct device
+ * @display: pointer to tm16xx_display
+ *
+ * Return: 0 on success, negative error code on failure
+ */
+static int tm16xx_parse_dt(struct device *dev, struct tm16xx_display *display)
+{
+	struct fwnode_handle *leds_node, *digits_node, *child;
+	struct tm16xx_led *led;
+	struct tm16xx_digit *digit;
+	int max_grid = 0, max_segment = 0;
+	int ret, i, j;
+	u32 segments[TM16XX_DIGIT_SEGMENTS * 2];
+	u32 reg[2];
+
+	/* parse digits */
+	digits_node = device_get_named_child_node(dev, "digits");
+	if (digits_node) {
+		display->num_digits = 0;
+		fwnode_for_each_child_node(digits_node, child)
+			display->num_digits++;
+
+		dev_dbg(dev, "Number of digits: %u\n", display->num_digits);
+
+		if (display->num_digits) {
+			display->digits = devm_kcalloc(dev, display->num_digits,
+						       sizeof(*display->digits),
+						       GFP_KERNEL);
+			if (!display->digits) {
+				fwnode_handle_put(digits_node);
+				return -ENOMEM;
+			}
+
+			i = 0;
+			fwnode_for_each_child_node(digits_node, child) {
+				digit = &display->digits[i];
+
+				ret = fwnode_property_read_u32(child, "reg",
+							       reg);
+				if (ret < 0) {
+					fwnode_handle_put(child);
+					fwnode_handle_put(digits_node);
+					return ret;
+				}
+
+				ret = fwnode_property_read_u32_array(child,
+								     "segments",
+								     segments,
+								     TM16XX_DIGIT_SEGMENTS * 2);
+				if (ret < 0) {
+					fwnode_handle_put(child);
+					fwnode_handle_put(digits_node);
+					return ret;
+				}
+
+				for (j = 0; j < TM16XX_DIGIT_SEGMENTS; ++j) {
+					digit->segments[j].grid = segments[2 * j];
+					digit->segments[j].segment = segments[2 * j + 1];
+					max_grid = umax(max_grid,
+							digit->segments[j].grid);
+					max_segment = umax(max_segment,
+							   digit->segments[j].segment);
+				}
+				digit->value = 0;
+				i++;
+			}
+
+			fwnode_handle_put(digits_node);
+		}
+	}
+
+	/* parse leds */
+	leds_node = device_get_named_child_node(dev, "leds");
+	if (leds_node) {
+		display->num_leds = 0;
+		fwnode_for_each_child_node(leds_node, child)
+			display->num_leds++;
+
+		dev_dbg(dev, "Number of LEDs: %u\n", display->num_leds);
+
+		if (display->num_leds) {
+			display->leds = devm_kcalloc(dev, display->num_leds,
+						     sizeof(*display->leds),
+						     GFP_KERNEL);
+			if (!display->leds) {
+				fwnode_handle_put(leds_node);
+				return -ENOMEM;
+			}
+
+			i = 0;
+			fwnode_for_each_child_node(leds_node, child) {
+				led = &display->leds[i];
+				ret = fwnode_property_read_u32_array(child,
+								     "reg", reg,
+								     2);
+				if (ret < 0) {
+					fwnode_handle_put(child);
+					fwnode_handle_put(leds_node);
+					return ret;
+				}
+
+				led->grid = reg[0];
+				led->segment = reg[1];
+				max_grid = umax(max_grid, led->grid);
+				max_segment = umax(max_segment, led->segment);
+				i++;
+			}
+		}
+
+		fwnode_handle_put(leds_node);
+	}
+
+	if (max_grid >= display->controller->max_grids) {
+		dev_err(dev, "grid %u exceeds controller max_grids %u\n",
+			max_grid, display->controller->max_grids);
+		return -EINVAL;
+	}
+
+	if (max_segment >= display->controller->max_segments) {
+		dev_err(dev, "segment %u exceeds controller max_segments %u\n",
+			max_segment, display->controller->max_segments);
+		return -EINVAL;
+	}
+
+	display->num_grids = max_grid + 1;
+	display->num_segments = max_segment + 1;
+
+	dev_dbg(dev, "Number of grids: %u\n", display->num_grids);
+	dev_dbg(dev, "Number of segments: %u\n", display->num_segments);
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
+	struct fwnode_handle *leds_node, *child;
+	unsigned int nbits;
+	int ret, i;
+
+	dev_dbg(dev, "Probing device\n");
+	ret = tm16xx_parse_dt(dev, display);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "Failed to parse device tree\n");
+
+	nbits = tm16xx_led_nbits(display);
+	display->state = devm_bitmap_zalloc(dev, nbits, GFP_KERNEL);
+	if (!display->state)
+		return -ENOMEM;
+
+	mutex_init(&display->lock);
+	INIT_WORK(&display->flush_init, tm16xx_display_flush_init);
+	INIT_WORK(&display->flush_display, tm16xx_display_flush_data);
+
+	/* Initialize main LED properties */
+	if (dev->of_node)
+		main->name = dev->of_node->name;
+	if (!main->name)
+		main->name = "display";
+	device_property_read_string(dev, "label", &main->name);
+
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
+	main->groups = tm16xx_main_led_groups;
+	main->flags = LED_RETAIN_AT_SHUTDOWN | LED_CORE_SUSPENDRESUME;
+
+	ret = led_classdev_register(dev, main);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "Failed to register main LED\n");
+
+	i = 0;
+	leds_node = device_get_named_child_node(dev, "leds");
+	fwnode_for_each_child_node(leds_node, child) {
+		struct tm16xx_led *led = &display->leds[i];
+		struct led_init_data led_init = {
+			.fwnode = child,
+			.devicename = dev_name(main->dev),
+			.devname_mandatory = true,
+			.default_label = "led",
+		};
+		led->cdev.max_brightness = 1;
+		led->cdev.brightness_set = tm16xx_led_set;
+		led->cdev.flags = LED_RETAIN_AT_SHUTDOWN |
+				  LED_CORE_SUSPENDRESUME;
+
+		ret = led_classdev_register_ext(dev, &led->cdev, &led_init);
+		if (ret < 0) {
+			fwnode_handle_put(child);
+			dev_err_probe(dev, ret, "Failed to register LED %s\n",
+				      led->cdev.name);
+			goto unregister_leds;
+		}
+
+		i++;
+	}
+
+	ret = tm16xx_display_init(display);
+	if (ret < 0) {
+		dev_err_probe(dev, ret, "Failed to initialize display\n");
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
+	dev_dbg(display->dev, "Removing display\n");
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
+
+	dev_info(display->dev, "Display turned off\n");
+}
+EXPORT_SYMBOL_NS(tm16xx_remove, "TM16XX");
+
+MODULE_AUTHOR("Jean-François Lessard");
+MODULE_DESCRIPTION("TM16xx LED Display Controllers");
+MODULE_LICENSE("GPL");
-- 
2.43.0


