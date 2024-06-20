Return-Path: <linux-leds+bounces-2096-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 516D9911514
	for <lists+linux-leds@lfdr.de>; Thu, 20 Jun 2024 23:46:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 749F61C223DA
	for <lists+linux-leds@lfdr.de>; Thu, 20 Jun 2024 21:46:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 537E515CD6D;
	Thu, 20 Jun 2024 21:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VvkwzMVV"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6EA615B128;
	Thu, 20 Jun 2024 21:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718919719; cv=none; b=nO/hXhzho8Kwmhh8h5QwCJ8hBf+bLpWyTH91KhUq5KmDeaOgB66AvPkW3z41+vFxMpFOG63dxFk+INrfXUuDkbHgGF1GOpLF/xYNYuG1MgX9A1A72ssp6mwfBZVRAYFiTklKXhmL2rsT8j1XOAxLD+j8WQUcIwF8bKPCx3dTtLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718919719; c=relaxed/simple;
	bh=wINUYX9pejABlv7SU67v72B0Zzb9RE2u3+nIvhutk3o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Iwjtjk5MsG3yrXWh6gyMaK/SK6ZhB2Pw+DKiQa/b4y4J/CGyhVaw46pDpanS01HHv5xcEkzUFaN6u3ExICa5W+6hldb1SHxM1vipXQ0pUiyc4UAO1QJxh85XUInF1j2ddPbOKxCobp2yZ7GeWJ3eUmujmzZeIC/hjfV6rqVjek0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VvkwzMVV; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3627ef1fc07so1095277f8f.3;
        Thu, 20 Jun 2024 14:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718919715; x=1719524515; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1OQsFZpwEXi9lylzWtTn4BG6KCXD+UB508NyBvv1q2w=;
        b=VvkwzMVVg9dfm+OLelwvdOq/qW/8k5nLp8WhR4seOd0z/sfNBTOd2V9xwWzpvf7BFp
         cRsACjji5PSGDs2+XPYJDNq5yFhDqL0QBSILnv9eqsCyG5M1TVntQLOHU2c5beupOWj8
         RiHShWEcKoAuVp6h7V9Xc9gpk/iLonrdLLluzzJz6jKZw0Nzs5BzLI8NkBSvoJFTs7JC
         rS8MFlImC/zZbZlS569hmyjsOFjzCdnlfTH5Yx5z/C+fHXU6Mqgzo5MQW800zrQnRqXe
         19L7RkjrviMp6eY33RNFuH5N+Fj08kvJ/k0+9J9PSpQnAy5PgBq3KLC+cFww10G+s6ph
         TkQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718919715; x=1719524515;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1OQsFZpwEXi9lylzWtTn4BG6KCXD+UB508NyBvv1q2w=;
        b=bI3rxeF0A5SGzNtngtEBJzatxY4cSCXe8Rv84HG7q3yMgncz366cJ/WjpTieGyUJPN
         lFo9ZEo74iqsyXNp2zhSXQEz0COEjPByhRayioqO2NTvLHpARb+nMAKLG9BdGWqEmIPZ
         u4vZrWSL3W1zJhsIJPnOt3OkWLYbfx8e3oLrf52dlLJaVfY10MmK5pIaosAnK1cRToWd
         646ggroEUw4r3bu9JNRAA9wsHOxA4+BJQCToqyLmatYdgWarymfyfF3yFoL6WIXTUXW9
         jlmA6jip9GIL3yR2Q3uPIIikbS+Vw8Rw614mCQWbQ1o/zoB8eVWB41+8DTUjuQ7K9YxC
         GBag==
X-Forwarded-Encrypted: i=1; AJvYcCU/V22yjW7kI4r/JBbFPsHSsl2v4ya+45vkEpE6RTSdYh50DtrXlfpGl5DgM5z9zVgW13/LPCr8VUYmPSEJoDkS+liIONW1bvnzTxcd5oOtmLE381yVTXwcrkT4k83EHmfIHjIkMiUIrRpq//Olj+8HUv6Rm+oDtdI/ys4kTC/EzBeK5RM=
X-Gm-Message-State: AOJu0Yz0TBuUOtTKl1h4aL92p/6Bn0KNoy3b+qpCT/2PcYCaoyDO/Gxh
	nm4VZD8UpYAUjlOsTv3IPB36FxtdZ+AIfDErolDV/8U1UVo3nJfn
X-Google-Smtp-Source: AGHT+IEDFY8uqL011VMS+ZYlm7jM0co9XDm/8+p0l+CpcuUFHVpLDjnC9fI4sCPXdEX/5ZHwT/xpxg==
X-Received: by 2002:adf:8b91:0:b0:35f:1c34:adfc with SMTP id ffacd0b85a97d-36319a856b9mr4654863f8f.67.1718919715200;
        Thu, 20 Jun 2024 14:41:55 -0700 (PDT)
Received: from localhost.localdomain (93-34-90-105.ip49.fastwebnet.it. [93.34.90.105])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-366383f68acsm48866f8f.2.2024.06.20.14.41.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 14:41:54 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH v7 20/20] leds: leds-lp5569: Add support for Texas Instruments LP5569
Date: Thu, 20 Jun 2024 23:03:36 +0200
Message-ID: <20240620210401.22053-21-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240620210401.22053-1-ansuelsmth@gmail.com>
References: <20240620210401.22053-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for Texas Instruments LP5569 LED driver.

Texas Instruments LP5569 is 9 channels chip with programmable engines.

It almost a copy of LP5523 with fundamental changes to regs order and
regs content.

Has difference in how the clock is handled and doesn't support detecting
clock time automatically, different handling for selftest and different
scheme for the status regs.

LED chip supports ENGINE and MUX to group LED and run precompiled code
with magic values to run patterns. This is loaded via the sysfs entry
and it's passed as a string of ASCII HEX char.

One some devices using this LED Controller (a NBG7815 Router) it was
found loading big precompiled pattern with up to 96 bytes of code. To
have support for this "extended" scenario, hardcode each engine to
support 4 pages of precompiled pattern (128 bytes of code) and 1 page
for each MUX. This gives plenty of space for any kind precompiled
pattern keeping simple logic for page handling of each engine and mux.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/leds/Kconfig       |  16 +-
 drivers/leds/Makefile      |   1 +
 drivers/leds/leds-lp5569.c | 544 +++++++++++++++++++++++++++++++++++++
 3 files changed, 558 insertions(+), 3 deletions(-)
 create mode 100644 drivers/leds/leds-lp5569.c

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index 05e6af88b88c..b1d7d94317b3 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -414,7 +414,7 @@ config LEDS_LP50XX
 	  module will be called leds-lp50xx.
 
 config LEDS_LP55XX_COMMON
-	tristate "Common Driver for TI/National LP5521/5523/55231/5562/8501"
+	tristate "Common Driver for TI/National LP5521/5523/55231/5562/5569/8501"
 	depends on LEDS_CLASS
 	depends on LEDS_CLASS_MULTICOLOR
 	depends on OF
@@ -422,8 +422,8 @@ config LEDS_LP55XX_COMMON
 	select FW_LOADER
 	select FW_LOADER_USER_HELPER
 	help
-	  This option supports common operations for LP5521/5523/55231/5562/8501
-	  devices.
+	  This option supports common operations for LP5521/5523/55231/5562/5569/
+	  8501 devices.
 
 config LEDS_LP5521
 	tristate "LED Support for N.S. LP5521 LED driver chip"
@@ -456,6 +456,16 @@ config LEDS_LP5562
 	  Driver provides direct control via LED class and interface for
 	  programming the engines.
 
+config LEDS_LP5569
+	tristate "LED Support for TI LP5569 LED driver chip"
+	depends on LEDS_CLASS && I2C
+	depends on LEDS_LP55XX_COMMON
+	help
+	  If you say yes here you get support for TI LP5569 LED driver.
+	  It is 9 channels chip with programmable engines.
+	  Driver provides direct control via LED class and interface for
+	  programming the engines.
+
 config LEDS_LP8501
 	tristate "LED Support for TI LP8501 LED driver chip"
 	depends on LEDS_CLASS && I2C
diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
index effdfc6f1e95..ad21941efa19 100644
--- a/drivers/leds/Makefile
+++ b/drivers/leds/Makefile
@@ -51,6 +51,7 @@ obj-$(CONFIG_LEDS_LP50XX)		+= leds-lp50xx.o
 obj-$(CONFIG_LEDS_LP5521)		+= leds-lp5521.o
 obj-$(CONFIG_LEDS_LP5523)		+= leds-lp5523.o
 obj-$(CONFIG_LEDS_LP5562)		+= leds-lp5562.o
+obj-$(CONFIG_LEDS_LP5569)		+= leds-lp5569.o
 obj-$(CONFIG_LEDS_LP55XX_COMMON)	+= leds-lp55xx-common.o
 obj-$(CONFIG_LEDS_LP8501)		+= leds-lp8501.o
 obj-$(CONFIG_LEDS_LP8788)		+= leds-lp8788.o
diff --git a/drivers/leds/leds-lp5569.c b/drivers/leds/leds-lp5569.c
new file mode 100644
index 000000000000..7ccd8dd6026a
--- /dev/null
+++ b/drivers/leds/leds-lp5569.c
@@ -0,0 +1,544 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2024 Christian Marangi <ansuelsmth@gmail.com>
+ */
+
+#include <linux/bitfield.h>
+#include <linux/delay.h>
+#include <linux/firmware.h>
+#include <linux/i2c.h>
+#include <linux/leds.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/of.h>
+#include <linux/platform_data/leds-lp55xx.h>
+#include <linux/slab.h>
+#include <dt-bindings/leds/leds-lp55xx.h>
+
+#include "leds-lp55xx-common.h"
+
+#define LP5569_MAX_LEDS			9
+
+/* Memory is used like this:
+ * 0x00 engine 1 program (4 pages)
+ * 0x40 engine 2 program (4 pages)
+ * 0x80 engine 3 program (4 pages)
+ * 0xc0 engine 1 muxing info (1 page)
+ * 0xd0 engine 2 muxing info (1 page)
+ * 0xe0 engine 3 muxing info (1 page)
+ */
+#define LP5569_PAGES_PER_ENGINE		4
+
+#define LP5569_REG_ENABLE		0x00
+#define   LP5569_ENABLE			BIT(6)
+
+#define LP5569_REG_EXEC_CTRL		0x01
+#define   LP5569_MODE_ENG_SHIFT		2
+
+#define LP5569_REG_OP_MODE		0x02
+#define   LP5569_EXEC_ENG_SHIFT		2
+
+#define LP5569_REG_ENABLE_LEDS_MSB	0x04
+#define LP5569_REG_ENABLE_LEDS_LSB	0x05
+#define LP5569_REG_LED_CTRL_BASE	0x07
+#define   LP5569_FADER_MAPPING_MASK	GENMASK(7, 5)
+#define LP5569_REG_LED_PWM_BASE		0x16
+#define LP5569_REG_LED_CURRENT_BASE	0x22
+#define LP5569_REG_MISC			0x2F
+#define   LP5569_AUTO_INC		BIT(6)
+#define   LP5569_PWR_SAVE		BIT(5)
+#define   LP5569_CP_MODE_MASK		GENMASK(4, 3)
+#define   LP5569_PWM_PWR_SAVE		BIT(2)
+#define   LP5569_INTERNAL_CLK		BIT(0)
+#define LP5569_REG_MISC2		0x33
+#define   LP5569_LED_SHORT_TEST		BIT(4)
+#define   LP5569_LED_OPEN_TEST		BIT(3)
+#define LP5569_REG_STATUS		0x3C
+#define   LP5569_MASK_BUSY		BIT(7)
+#define   LP5569_STARTUP_BUSY		BIT(6)
+#define   LP5569_ENGINE_BUSY		BIT(5)
+#define   LP5569_ENGINE1_INT		BIT(2)
+#define   LP5569_ENGINE2_INT		BIT(1)
+#define   LP5569_ENGINE3_INT		BIT(0)
+#define   LP5569_ENG_STATUS_MASK	(LP5569_ENGINE1_INT | LP5569_ENGINE2_INT | \
+					 LP5569_ENGINE3_INT)
+#define LP5569_REG_IO_CONTROL		0x3D
+#define   LP5569_CLK_OUTPUT		BIT(3)
+#define LP5569_REG_RESET		0x3F
+#define   LP5569_RESET			0xFF
+#define LP5569_REG_MASTER_FADER_BASE	0x46
+#define LP5569_REG_CH1_PROG_START	0x4B
+#define LP5569_REG_CH2_PROG_START	0x4C
+#define LP5569_REG_CH3_PROG_START	0x4D
+#define LP5569_REG_PROG_PAGE_SEL	0x4F
+#define LP5569_REG_PROG_MEM		0x50
+#define LP5569_REG_LED_FAULT1		0x81
+#define   LP5569_LED_FAULT8		BIT(0)
+#define LP5569_REG_LED_FAULT2		0x82
+#define   LP5569_LED_FAULT7		BIT(7)
+#define   LP5569_LED_FAULT6		BIT(6)
+#define   LP5569_LED_FAULT5		BIT(5)
+#define   LP5569_LED_FAULT4		BIT(4)
+#define   LP5569_LED_FAULT3		BIT(3)
+#define   LP5569_LED_FAULT2		BIT(2)
+#define   LP5569_LED_FAULT1		BIT(1)
+#define   LP5569_LED_FAULT0		BIT(0)
+
+#define LP5569_ENG1_PROG_ADDR		0x0
+#define LP5569_ENG2_PROG_ADDR		0x40
+#define LP5569_ENG3_PROG_ADDR		0x80
+#define LP5569_ENG1_MUX_ADDR		0xc0
+#define LP5569_ENG2_MUX_ADDR		0xd0
+#define LP5569_ENG3_MUX_ADDR		0xe0
+
+#define LEDn_STATUS_FAULT(n, status)	((status) >> (n) & BIT(0))
+
+#define LP5569_DEFAULT_CONFIG \
+	(LP5569_AUTO_INC | LP5569_PWR_SAVE | LP5569_PWM_PWR_SAVE)
+
+static void lp5569_run_engine(struct lp55xx_chip *chip, bool start)
+{
+	if (!start) {
+		lp55xx_stop_engine(chip);
+		lp55xx_turn_off_channels(chip);
+		return;
+	}
+
+	lp55xx_run_engine_common(chip);
+}
+
+static int lp5569_init_program_engine(struct lp55xx_chip *chip)
+{
+	int i;
+	int j;
+	int ret;
+	u8 status;
+	/* Precompiled pattern per ENGINE setting LED MUX start and stop addresses */
+	static const u8 pattern[][LP55xx_BYTES_PER_PAGE] =  {
+		{ 0x9c, LP5569_ENG1_MUX_ADDR, 0x9c, 0xb0, 0x9d, 0x80, 0xd8, 0x00, 0},
+		{ 0x9c, LP5569_ENG2_MUX_ADDR, 0x9c, 0xc0, 0x9d, 0x80, 0xd8, 0x00, 0},
+		{ 0x9c, LP5569_ENG3_MUX_ADDR, 0x9c, 0xd0, 0x9d, 0x80, 0xd8, 0x00, 0},
+	};
+
+	/* Setup each ENGINE program start address */
+	ret = lp55xx_write(chip, LP5569_REG_CH1_PROG_START, LP5569_ENG1_PROG_ADDR);
+	if (ret)
+		return ret;
+
+	ret = lp55xx_write(chip, LP5569_REG_CH2_PROG_START, LP5569_ENG2_PROG_ADDR);
+	if (ret)
+		return ret;
+
+	ret = lp55xx_write(chip, LP5569_REG_CH3_PROG_START, LP5569_ENG3_PROG_ADDR);
+	if (ret)
+		return ret;
+
+	/* Write precompiled pattern for LED MUX address space for each ENGINE */
+	for (i = LP55XX_ENGINE_1; i <= LP55XX_ENGINE_3; i++) {
+		chip->engine_idx = i;
+		lp55xx_load_engine(chip);
+
+		for (j = 0; j < LP55xx_BYTES_PER_PAGE; j++) {
+			ret = lp55xx_write(chip, LP5569_REG_PROG_MEM + j,
+					   pattern[i - 1][j]);
+			if (ret)
+				goto out;
+		}
+	}
+
+	lp5569_run_engine(chip, true);
+
+	/* Let the programs run for couple of ms and check the engine status */
+	usleep_range(3000, 6000);
+	lp55xx_read(chip, LP5569_REG_STATUS, &status);
+	status = FIELD_GET(LP5569_ENG_STATUS_MASK, status);
+
+	if (status != LP5569_ENG_STATUS_MASK) {
+		dev_err(&chip->cl->dev,
+			"could not configure LED engine, status = 0x%.2x\n",
+			status);
+		ret = -EINVAL;
+	}
+
+out:
+	lp55xx_stop_all_engine(chip);
+	return ret;
+}
+
+static int lp5569_post_init_device(struct lp55xx_chip *chip)
+{
+	int ret;
+	int val;
+
+	ret = lp55xx_write(chip, LP5569_REG_ENABLE, LP5569_ENABLE);
+	if (ret)
+		return ret;
+
+	/* Chip startup time is 500 us, 1 - 2 ms gives some margin */
+	usleep_range(1000, 2000);
+
+	val = LP5569_DEFAULT_CONFIG;
+	val |= FIELD_PREP(LP5569_CP_MODE_MASK, chip->pdata->charge_pump_mode);
+
+	if (chip->pdata->clock_mode == LP55XX_CLOCK_INT) {
+		ret = lp55xx_update_bits(chip, LP5569_REG_IO_CONTROL,
+					 LP5569_CLK_OUTPUT,
+					 LP5569_CLK_OUTPUT);
+		if (ret)
+			return ret;
+
+		val |= LP5569_INTERNAL_CLK;
+	}
+
+	ret = lp55xx_write(chip, LP5569_REG_MISC, val);
+	if (ret)
+		return ret;
+
+	return lp5569_init_program_engine(chip);
+}
+
+static ssize_t lp5569_led_open_test(struct lp55xx_led *led, char *buf)
+{
+	struct lp55xx_chip *chip = led->chip;
+	struct lp55xx_platform_data *pdata = chip->pdata;
+	bool leds_fault[LP5569_MAX_LEDS];
+	struct lp55xx_led *led_tmp = led;
+	int i, ret, pos = 0;
+	u8 status;
+
+	/* Set in STANDBY state */
+	ret = lp55xx_write(chip, LP5569_REG_ENABLE, 0);
+	if (ret)
+		goto exit;
+
+	/* Wait 1ms for device to enter STANDBY state */
+	usleep_range(1000, 2000);
+
+	/* Set Charge Pump to 1.5x */
+	ret = lp55xx_update_bits(chip, LP5569_REG_MISC,
+				 FIELD_PREP(LP5569_CP_MODE_MASK, LP55XX_CP_BOOST),
+				 LP5569_CP_MODE_MASK);
+	if (ret)
+		goto exit;
+
+	/* Enable LED Open Test */
+	ret = lp55xx_update_bits(chip, LP5569_REG_MISC2, LP5569_LED_OPEN_TEST,
+				 LP5569_LED_OPEN_TEST);
+	if (ret)
+		goto exit;
+
+	/* Put Device in NORMAL state */
+	ret = lp55xx_write(chip, LP5569_REG_ENABLE, LP5569_ENABLE);
+	if (ret)
+		goto exit;
+
+	/* Wait 500 us for device to enter NORMAL state */
+	usleep_range(500, 750);
+
+	/* Enable LED and set to 100% brightness */
+	for (i = 0; i < pdata->num_channels; i++) {
+		ret = lp55xx_write(chip, LP5569_REG_LED_PWM_BASE + led_tmp->chan_nr,
+				   LED_FULL);
+		if (ret)
+			goto exit;
+
+		led_tmp++;
+	}
+
+	/* Wait 500 us for device to fill status regs */
+	usleep_range(500, 750);
+
+	/* Parse status led fault 1 regs */
+	ret = lp55xx_read(chip, LP5569_REG_LED_FAULT1, &status);
+	if (ret < 0)
+		goto exit;
+
+	for (i = 0; i < 8; i++)
+		leds_fault[i] = !!((status >> i) & 0x1);
+
+	/* Parse status led fault 2 regs */
+	ret = lp55xx_read(chip, LP5569_REG_LED_FAULT2, &status);
+	if (ret < 0)
+		goto exit;
+
+	for (i = 0; i < 1; i++)
+		leds_fault[i + 8] = !!((status >> i) & 0x1);
+
+	/* Report LED fault */
+	led_tmp = led;
+	for (i = 0; i < pdata->num_channels; i++) {
+		if (leds_fault[led_tmp->chan_nr])
+			pos += sprintf(buf + pos, "LED %d OPEN FAIL\n",
+				       led_tmp->chan_nr);
+
+		led_tmp++;
+	}
+
+	ret = pos;
+
+exit:
+	/* Disable LED Open Test */
+	lp55xx_update_bits(chip, LP5569_REG_MISC2, LP5569_LED_OPEN_TEST, 0);
+
+	led_tmp = led;
+	for (i = 0; i < pdata->num_channels; i++) {
+		lp55xx_write(chip, LP5569_REG_LED_PWM_BASE + led_tmp->chan_nr, 0);
+
+		led_tmp++;
+	}
+
+	return ret;
+}
+
+static ssize_t lp5569_led_short_test(struct lp55xx_led *led, char *buf)
+{
+	struct lp55xx_chip *chip = led->chip;
+	struct lp55xx_platform_data *pdata = chip->pdata;
+	bool leds_fault[LP5569_MAX_LEDS];
+	struct lp55xx_led *led_tmp = led;
+	int i, ret, pos = 0;
+	u8 status;
+
+	/* Set in STANDBY state */
+	ret = lp55xx_write(chip, LP5569_REG_ENABLE, 0);
+	if (ret)
+		goto exit;
+
+	/* Wait 1ms for device to enter STANDBY state */
+	usleep_range(1000, 2000);
+
+	/* Set Charge Pump to 1x */
+	ret = lp55xx_update_bits(chip, LP5569_REG_MISC,
+				 FIELD_PREP(LP5569_CP_MODE_MASK, LP55XX_CP_BYPASS),
+				 LP5569_CP_MODE_MASK);
+	if (ret)
+		goto exit;
+
+	/* Enable LED and set to 100% brightness and current to 100% (25.5mA) */
+	for (i = 0; i < pdata->num_channels; i++) {
+		ret = lp55xx_write(chip, LP5569_REG_LED_PWM_BASE + led_tmp->chan_nr,
+				   LED_FULL);
+		if (ret)
+			goto exit;
+
+		ret = lp55xx_write(chip, LP5569_REG_LED_CURRENT_BASE + led_tmp->chan_nr,
+				   LED_FULL);
+		if (ret)
+			goto exit;
+
+		led_tmp++;
+	}
+
+	/* Put Device in NORMAL state */
+	ret = lp55xx_write(chip, LP5569_REG_ENABLE, LP5569_ENABLE);
+	if (ret)
+		goto exit;
+
+	/* Wait 500 us for device to enter NORMAL state */
+	usleep_range(500, 750);
+
+	/* Enable LED Shorted Test */
+	ret = lp55xx_update_bits(chip, LP5569_REG_MISC2, LP5569_LED_OPEN_TEST,
+				 LP5569_LED_SHORT_TEST);
+	if (ret)
+		goto exit;
+
+	/* Wait 500 us for device to fill status regs */
+	usleep_range(500, 750);
+
+	/* Parse status led fault 1 regs */
+	ret = lp55xx_read(chip, LP5569_REG_LED_FAULT1, &status);
+	if (ret < 0)
+		goto exit;
+
+	for (i = 0; i < 8; i++)
+		leds_fault[i] = !!LEDn_STATUS_FAULT(i, status);
+
+	/* Parse status led fault 2 regs */
+	ret = lp55xx_read(chip, LP5569_REG_LED_FAULT2, &status);
+	if (ret < 0)
+		goto exit;
+
+	for (i = 0; i < 1; i++)
+		leds_fault[i + 8] = !!LEDn_STATUS_FAULT(i, status);
+
+	/* Report LED fault */
+	led_tmp = led;
+	for (i = 0; i < pdata->num_channels; i++) {
+		if (leds_fault[led_tmp->chan_nr])
+			pos += sprintf(buf + pos, "LED %d SHORTED FAIL\n",
+				       led_tmp->chan_nr);
+
+		led_tmp++;
+	}
+
+	ret = pos;
+
+exit:
+	/* Disable LED Shorted Test */
+	lp55xx_update_bits(chip, LP5569_REG_MISC2, LP5569_LED_SHORT_TEST, 0);
+
+	led_tmp = led;
+	for (i = 0; i < pdata->num_channels; i++) {
+		lp55xx_write(chip, LP5569_REG_LED_PWM_BASE + led_tmp->chan_nr, 0);
+
+		led_tmp++;
+	}
+
+	return ret;
+}
+
+static ssize_t lp5569_selftest(struct device *dev,
+			       struct device_attribute *attr,
+			       char *buf)
+{
+	struct lp55xx_led *led = i2c_get_clientdata(to_i2c_client(dev));
+	struct lp55xx_chip *chip = led->chip;
+	int i, pos = 0;
+
+	mutex_lock(&chip->lock);
+
+	/* Test LED Open */
+	pos = lp5569_led_open_test(led, buf);
+	if (pos < 0)
+		goto fail;
+
+	/* Test LED Shorted */
+	pos = lp5569_led_short_test(led, buf);
+	if (pos < 0)
+		goto fail;
+
+	for (i = 0; i < chip->pdata->num_channels; i++) {
+		/* Restore current */
+		lp55xx_write(chip, LP5569_REG_LED_CURRENT_BASE + led->chan_nr,
+			     led->led_current);
+
+		/* Restore brightness */
+		lp55xx_write(chip, LP5569_REG_LED_PWM_BASE + led->chan_nr,
+			     led->brightness);
+		led++;
+	}
+
+	if (pos == 0)
+		pos = sprintf(buf, "OK\n");
+	goto release_lock;
+fail:
+	pos = sprintf(buf, "FAIL\n");
+
+release_lock:
+	mutex_unlock(&chip->lock);
+
+	return pos;
+}
+
+LP55XX_DEV_ATTR_ENGINE_MODE(1);
+LP55XX_DEV_ATTR_ENGINE_MODE(2);
+LP55XX_DEV_ATTR_ENGINE_MODE(3);
+LP55XX_DEV_ATTR_ENGINE_LEDS(1);
+LP55XX_DEV_ATTR_ENGINE_LEDS(2);
+LP55XX_DEV_ATTR_ENGINE_LEDS(3);
+LP55XX_DEV_ATTR_ENGINE_LOAD(1);
+LP55XX_DEV_ATTR_ENGINE_LOAD(2);
+LP55XX_DEV_ATTR_ENGINE_LOAD(3);
+static LP55XX_DEV_ATTR_RO(selftest, lp5569_selftest);
+LP55XX_DEV_ATTR_MASTER_FADER(1);
+LP55XX_DEV_ATTR_MASTER_FADER(2);
+LP55XX_DEV_ATTR_MASTER_FADER(3);
+static LP55XX_DEV_ATTR_RW(master_fader_leds, lp55xx_show_master_fader_leds,
+			  lp55xx_store_master_fader_leds);
+
+static struct attribute *lp5569_attributes[] = {
+	&dev_attr_engine1_mode.attr,
+	&dev_attr_engine2_mode.attr,
+	&dev_attr_engine3_mode.attr,
+	&dev_attr_engine1_load.attr,
+	&dev_attr_engine2_load.attr,
+	&dev_attr_engine3_load.attr,
+	&dev_attr_engine1_leds.attr,
+	&dev_attr_engine2_leds.attr,
+	&dev_attr_engine3_leds.attr,
+	&dev_attr_selftest.attr,
+	&dev_attr_master_fader1.attr,
+	&dev_attr_master_fader2.attr,
+	&dev_attr_master_fader3.attr,
+	&dev_attr_master_fader_leds.attr,
+	NULL,
+};
+
+static const struct attribute_group lp5569_group = {
+	.attrs = lp5569_attributes,
+};
+
+/* Chip specific configurations */
+static struct lp55xx_device_config lp5569_cfg = {
+	.reg_op_mode = {
+		.addr = LP5569_REG_OP_MODE,
+		.shift = LP5569_MODE_ENG_SHIFT,
+	},
+	.reg_exec = {
+		.addr = LP5569_REG_EXEC_CTRL,
+		.shift = LP5569_EXEC_ENG_SHIFT,
+	},
+	.reset = {
+		.addr = LP5569_REG_RESET,
+		.val  = LP5569_RESET,
+	},
+	.enable = {
+		.addr = LP5569_REG_ENABLE,
+		.val  = LP5569_ENABLE,
+	},
+	.prog_mem_base = {
+		.addr = LP5569_REG_PROG_MEM,
+	},
+	.reg_led_pwm_base = {
+		.addr = LP5569_REG_LED_PWM_BASE,
+	},
+	.reg_led_current_base = {
+		.addr = LP5569_REG_LED_CURRENT_BASE,
+	},
+	.reg_master_fader_base = {
+		.addr = LP5569_REG_MASTER_FADER_BASE,
+	},
+	.reg_led_ctrl_base = {
+		.addr = LP5569_REG_LED_CTRL_BASE,
+	},
+	.pages_per_engine   = LP5569_PAGES_PER_ENGINE,
+	.max_channel  = LP5569_MAX_LEDS,
+	.post_init_device   = lp5569_post_init_device,
+	.brightness_fn      = lp55xx_led_brightness,
+	.multicolor_brightness_fn = lp55xx_multicolor_brightness,
+	.set_led_current    = lp55xx_set_led_current,
+	.firmware_cb        = lp55xx_firmware_loaded_cb,
+	.run_engine         = lp5569_run_engine,
+	.dev_attr_group     = &lp5569_group,
+};
+
+static const struct i2c_device_id lp5569_id[] = {
+	{ "lp5569",  .driver_data = (kernel_ulong_t)&lp5569_cfg, },
+	{ }
+};
+
+MODULE_DEVICE_TABLE(i2c, lp5569_id);
+
+static const struct of_device_id of_lp5569_leds_match[] = {
+	{ .compatible = "ti,lp5569", .data = &lp5569_cfg, },
+	{},
+};
+
+MODULE_DEVICE_TABLE(of, of_lp5569_leds_match);
+
+static struct i2c_driver lp5569_driver = {
+	.driver = {
+		.name	= "lp5569x",
+		.of_match_table = of_lp5569_leds_match,
+	},
+	.probe		= lp55xx_probe,
+	.remove		= lp55xx_remove,
+	.id_table	= lp5569_id,
+};
+
+module_i2c_driver(lp5569_driver);
+
+MODULE_AUTHOR("Christian Marangi <ansuelsmth@gmail.com>");
+MODULE_DESCRIPTION("LP5569 LED engine");
+MODULE_LICENSE("GPL");
-- 
2.45.1


