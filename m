Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5727C252C97
	for <lists+linux-leds@lfdr.de>; Wed, 26 Aug 2020 13:39:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729046AbgHZLjb (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 26 Aug 2020 07:39:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729014AbgHZLh5 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 26 Aug 2020 07:37:57 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2861CC061757;
        Wed, 26 Aug 2020 04:37:32 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id k13so757944plk.13;
        Wed, 26 Aug 2020 04:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=DEUgocDC7B7uAfhFsbrw1DJk3NYda5sbDS989KIDM28=;
        b=AWJrNVbkc0LbMIvmoojo/RzT644WyzOFaTBG3/k65qPrQW/XfNQmE5+DqDlZtmG61+
         ndAOij99YXhDQsZXY0hnlq+VSbcw+JKMRXA8frnCaILjjd4PkpXvbtLTgz29oU7fdLn3
         Mzpby6Uy9kdfvdmAtg06I637V2fH4XqDTlkwAbMYX4VcLnbE8L+GM13bQ34F4RjWuA/C
         sB5duLnFkYUgGNM0N/mS2c7L6581WKD6iL1/lqcqDyW5SUTEedPCZuFpWMY/jd4d4+fb
         reWeyH1cOPzyFIjTSlLqcHqeiNRnqC43GJdOEP1qfZN9XOsVEWPJCFYWOV5X3bYR+X3V
         vWqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=DEUgocDC7B7uAfhFsbrw1DJk3NYda5sbDS989KIDM28=;
        b=kSWov5wubKurSW7uruEUgYmKY4TbZTMi/wAxjRrq8Uh/Qbo6gwAp7pc9llJDFE4iHR
         4hzIuVJnRMFguJOBUEWTIrCtRMGGeSRll0IOx17q8LKWkuMIXCh80KZ7GddFDZOpCnB0
         JlnmqGXrUNhyei/P84WxNXDdin1TeWA6DkXycgxKnoN2AZYyce0sCO5k2LfsUywso34J
         MVynVirQ9f+hzxIg30RmMBrf2XHuKUx4oBpCAvlg5t6+7NexqyuEEz1Q+eql8OKhYCsp
         OAPq9fCimDULIwTvpBJTlmoDJ1bgK9pfDDWjoTpVXnLLVQBdTrevw+FvSIRCAtH1fgqO
         jRoA==
X-Gm-Message-State: AOAM532gzc590mLKFV8o+PWmOtBL+eEwXFLs6Ib1Cnd8DHUbupN26WJc
        700BNxSjscnAyDgHJzb2vWg=
X-Google-Smtp-Source: ABdhPJwPaQ9H5l8tcEXByc1KZPptORoCEXiO1upUZ0S24h4VgxkwwQDflsxxswWbRbpGAQIy1u3BfA==
X-Received: by 2002:a17:90a:fa47:: with SMTP id dt7mr5980114pjb.22.1598441851529;
        Wed, 26 Aug 2020 04:37:31 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:56a:2197:d2eb:7e49:dfa1:a882])
        by smtp.gmail.com with ESMTPSA id x5sm2591047pfj.1.2020.08.26.04.37.28
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 26 Aug 2020 04:37:31 -0700 (PDT)
From:   Gene Chen <gene.chen.richtek@gmail.com>
To:     jacek.anaszewski@gmail.com, pavel@ucw.cz, matthias.bgg@gmail.com
Cc:     dmurphy@ti.com, linux-leds@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        gene_chen@richtek.com, Wilma.Wu@mediatek.com,
        shufan_lee@richtek.com, cy_huang@richtek.com,
        benjamin.chao@mediatek.com
Subject: [PATCH 1/2] leds: mt6360: Add LED driver for MT6360
Date:   Wed, 26 Aug 2020 19:37:19 +0800
Message-Id: <1598441840-15226-2-git-send-email-gene.chen.richtek@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1598441840-15226-1-git-send-email-gene.chen.richtek@gmail.com>
References: <1598441840-15226-1-git-send-email-gene.chen.richtek@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

From: Gene Chen <gene_chen@richtek.com>

Add MT6360 LED driver include 2-channel Flash LED with torch/strobe mode,
and 4-channel RGB LED support Register/Flash/Breath Mode

Signed-off-by: Gene Chen <gene_chen@richtek.com>
---
 drivers/leds/Kconfig       |  11 +
 drivers/leds/Makefile      |   1 +
 drivers/leds/leds-mt6360.c | 680 +++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 692 insertions(+)
 create mode 100644 drivers/leds/leds-mt6360.c

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index 1c181df..ce95ead 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -271,6 +271,17 @@ config LEDS_MT6323
 	  This option enables support for on-chip LED drivers found on
 	  Mediatek MT6323 PMIC.
 
+config LEDS_MT6360
+	tristate "LED Support for Mediatek MT6360 PMIC"
+	depends on LEDS_CLASS_FLASH && OF
+	depends on V4L2_FLASH_LED_CLASS || !V4L2_FLASH_LED_CLASS
+	depends on MFD_MT6360
+	help
+	  This option enables support for dual Flash LED drivers found on
+	  Mediatek MT6360 PMIC.
+	  Support Torch and Strobe mode independently current source.
+	  Include Low-VF and short protection.
+
 config LEDS_S3C24XX
 	tristate "LED Support for Samsung S3C24XX GPIO LEDs"
 	depends on LEDS_CLASS
diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
index c2c7d7a..5596427 100644
--- a/drivers/leds/Makefile
+++ b/drivers/leds/Makefile
@@ -66,6 +66,7 @@ obj-$(CONFIG_LEDS_MIKROTIK_RB532)	+= leds-rb532.o
 obj-$(CONFIG_LEDS_MLXCPLD)		+= leds-mlxcpld.o
 obj-$(CONFIG_LEDS_MLXREG)		+= leds-mlxreg.o
 obj-$(CONFIG_LEDS_MT6323)		+= leds-mt6323.o
+obj-$(CONFIG_LEDS_MT6360)		+= leds-mt6360.o
 obj-$(CONFIG_LEDS_NET48XX)		+= leds-net48xx.o
 obj-$(CONFIG_LEDS_NETXBIG)		+= leds-netxbig.o
 obj-$(CONFIG_LEDS_NIC78BX)		+= leds-nic78bx.o
diff --git a/drivers/leds/leds-mt6360.c b/drivers/leds/leds-mt6360.c
new file mode 100644
index 0000000..3d89b59
--- /dev/null
+++ b/drivers/leds/leds-mt6360.c
@@ -0,0 +1,680 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2019 MediaTek Inc.
+ */
+
+#include <linux/delay.h>
+#include <linux/init.h>
+#include <linux/interrupt.h>
+#include <linux/kernel.h>
+#include <linux/led-class-flash.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/property.h>
+#include <linux/regmap.h>
+#include <media/v4l2-flash-led-class.h>
+
+enum {
+	MT6360_LED_ISNK1 = 0,
+	MT6360_LED_ISNK2,
+	MT6360_LED_ISNK3,
+	MT6360_LED_ISNK4,
+	MT6360_LED_FLASH1,
+	MT6360_LED_FLASH2,
+	MT6360_MAX_LEDS,
+};
+
+#define MT6360_REG_RGBEN		0x380
+#define MT6360_REG_ISNK(_led_no)	(0x381 + (_led_no))
+#define MT6360_ISNK_ENMASK(_led_no)	BIT(7 - (_led_no))
+#define MT6360_ISNK_MASK		0x1F
+#define MT6360_CHRINDSEL_MASK		BIT(3)
+
+#define MT6360_REG_FLEDEN		0x37E
+#define MT6360_REG_STRBTO		0x373
+#define MT6360_REG_FLEDBASE(_id)	(0x372 + 4 * (_id - MT6360_LED_FLASH1))
+#define MT6360_REG_FLEDISTRB(_id)	(MT6360_REG_FLEDBASE(_id) + 2)
+#define MT6360_REG_FLEDITOR(_id)	(MT6360_REG_FLEDBASE(_id) + 3)
+#define MT6360_REG_CHGSTAT2		0x3E1
+#define MT6360_REG_FLEDSTAT1		0x3E9
+#define MT6360_ITORCH_MASK		0x1F
+#define MT6360_ISTROBE_MASK		0x7F
+#define MT6360_STRBTO_MASK		0x7F
+#define MT6360_TORCHEN_MASK		BIT(3)
+#define MT6360_STROBEN_MASK		BIT(2)
+#define MT6360_FLCSEN_MASK(_id)		BIT(MT6360_LED_FLASH2 - _id)
+#define MT6360_FLEDCHGVINOVP_MASK	BIT(3)
+#define MT6360_FLED1STRBTO_MASK		BIT(11)
+#define MT6360_FLED2STRBTO_MASK		BIT(10)
+#define MT6360_FLED1STRB_MASK		BIT(9)
+#define MT6360_FLED2STRB_MASK		BIT(8)
+#define MT6360_FLED1SHORT_MASK		BIT(7)
+#define MT6360_FLED2SHORT_MASK		BIT(6)
+#define MT6360_FLEDLVF_MASK		BIT(3)
+
+/* 0 means led_off, add one for dummy */
+#define MT6360_ISNK1_MAXLEVEL		13
+#define MT6360_ISNK4_MAXLEVEL		31
+
+#define MT6360_ITORCH_MIN		25000
+#define MT6360_ITORCH_STEP		12500
+#define MT6360_ITORCH_MAX		400000
+#define MT6360_ISTRB_MIN		50000
+#define MT6360_ISTRB_STEP		12500
+#define MT6360_ISTRB_MAX		1500000
+#define MT6360_STRBTO_MIN		64000
+#define MT6360_STRBTO_STEP		32000
+#define MT6360_STRBTO_MAX		2432000
+
+#define FLED_TORCH_FLAG_MASK		0x0c
+#define FLED_TORCH_FLAG_SHFT		2
+#define FLED_STROBE_FLAG_MASK		0x03
+
+#define STATE_OFF			0
+#define STATE_KEEP			1
+#define STATE_ON			2
+
+struct mt6360_led {
+	union {
+		struct led_classdev isnk;
+		struct led_classdev_flash flash;
+	};
+	struct v4l2_flash *v4l2_flash;
+	struct mt6360_priv *priv;
+	u32 led_no;
+	u32 default_state;
+	bool active;
+};
+
+struct mt6360_priv {
+	struct device *dev;
+	struct regmap *regmap;
+	struct mt6360_led leds[MT6360_MAX_LEDS];
+	unsigned int fled_strobe_used;
+	unsigned int fled_torch_used;
+};
+
+static int mt6360_isnk_brightness_set(struct led_classdev *lcdev, enum led_brightness level)
+{
+	struct mt6360_led *led = container_of(lcdev, struct mt6360_led, isnk);
+	struct mt6360_priv *priv = led->priv;
+	u32 enable_mask = MT6360_ISNK_ENMASK(led->led_no);
+	u32 val = level ? MT6360_ISNK_ENMASK(led->led_no) : 0;
+	int ret;
+
+	dev_dbg(lcdev->dev, "[%d] brightness %d\n", led->led_no, level);
+
+	if (level) {
+		ret = regmap_update_bits(priv->regmap, MT6360_REG_ISNK(led->led_no),
+					 MT6360_ISNK_MASK, level - 1);
+		if (ret)
+			return ret;
+	}
+
+	ret = regmap_update_bits(priv->regmap, MT6360_REG_RGBEN, enable_mask, val);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static int mt6360_torch_brightness_set(struct led_classdev *lcdev, enum led_brightness level)
+{
+	struct mt6360_led *led = container_of(lcdev, struct mt6360_led, flash.led_cdev);
+	struct mt6360_priv *priv = led->priv;
+	u32 enable_mask = MT6360_TORCHEN_MASK | MT6360_FLCSEN_MASK(led->led_no);
+	u32 val = (level) ? MT6360_FLCSEN_MASK(led->led_no) : 0;
+	u32 prev = priv->fled_torch_used, curr;
+	int ret;
+
+	dev_dbg(lcdev->dev, "[%d] brightness %d\n", led->led_no, level);
+	if (priv->fled_strobe_used) {
+		dev_warn(lcdev->dev, "Please disable strobe first [%d]\n", priv->fled_strobe_used);
+		return -EINVAL;
+	}
+
+	if (level)
+		curr = prev | BIT(led->led_no);
+	else
+		curr = prev & (~BIT(led->led_no));
+
+	if (curr)
+		val |= MT6360_TORCHEN_MASK;
+
+	if (level) {
+		ret = regmap_update_bits(priv->regmap, MT6360_REG_FLEDITOR(led->led_no),
+					 MT6360_ITORCH_MASK, level - 1);
+		if (ret)
+			return ret;
+	}
+
+	ret = regmap_update_bits(priv->regmap, MT6360_REG_FLEDEN, enable_mask, val);
+	if (ret)
+		return ret;
+
+	priv->fled_torch_used = curr;
+
+	return 0;
+}
+
+static int mt6360_strobe_brightness_set(struct led_classdev_flash *fl_cdev, u32 brightness)
+{
+	struct mt6360_led *led = container_of(fl_cdev, struct mt6360_led, flash);
+	struct led_classdev *lcdev = &fl_cdev->led_cdev;
+
+	dev_dbg(lcdev->dev, "[%d] strobe brightness %d\n", led->led_no, brightness);
+	return 0;
+}
+
+static int _mt6360_strobe_brightness_set(struct led_classdev_flash *fl_cdev, u32 brightness)
+{
+	struct mt6360_led *led = container_of(fl_cdev, struct mt6360_led, flash);
+	struct mt6360_priv *priv = led->priv;
+	struct led_flash_setting *s = &fl_cdev->brightness;
+	u32 val = (brightness - s->min) / s->step;
+
+	return regmap_update_bits(priv->regmap, MT6360_REG_FLEDISTRB(led->led_no),
+				 MT6360_ISTROBE_MASK, val);
+}
+
+static int mt6360_strobe_set(struct led_classdev_flash *fl_cdev, bool state)
+{
+	struct mt6360_led *led = container_of(fl_cdev, struct mt6360_led, flash);
+	struct mt6360_priv *priv = led->priv;
+	struct led_classdev *lcdev = &fl_cdev->led_cdev;
+	struct led_flash_setting *s = &fl_cdev->brightness;
+	u32 enable_mask = MT6360_STROBEN_MASK | MT6360_FLCSEN_MASK(led->led_no);
+	u32 val = state ? MT6360_FLCSEN_MASK(led->led_no) : 0;
+	u32 prev = priv->fled_strobe_used, curr;
+	int ret;
+
+	dev_dbg(lcdev->dev, "[%d] strobe state %d\n", led->led_no, state);
+	if (priv->fled_torch_used) {
+		dev_warn(lcdev->dev, "Please disable torch first [0x%x]\n", priv->fled_torch_used);
+		return -EINVAL;
+	}
+
+	if (state)
+		curr = prev | BIT(led->led_no);
+	else
+		curr = prev & (~BIT(led->led_no));
+
+	if (curr)
+		val |= MT6360_STROBEN_MASK;
+
+	ret = regmap_update_bits(priv->regmap, MT6360_REG_FLEDEN, enable_mask, val);
+	if (ret) {
+		dev_err(lcdev->dev, "[%d] control current source %d fail\n", led->led_no, state);
+		return ret;
+	}
+
+	/* used to prevent flash current spike when torch on */
+	ret = _mt6360_strobe_brightness_set(fl_cdev, state ? s->val : s->min);
+	if (ret)
+		return ret;
+
+	if (!prev && curr)
+		usleep_range(5000, 6000);
+	else if (prev && !curr)
+		udelay(500);
+
+	priv->fled_strobe_used = curr;
+	return 0;
+}
+
+static int mt6360_strobe_get(struct led_classdev_flash *fl_cdev, bool *state)
+{
+	struct mt6360_led *led = container_of(fl_cdev, struct mt6360_led, flash);
+	struct mt6360_priv *priv = led->priv;
+
+	*state = !!(priv->fled_strobe_used & BIT(led->led_no));
+	return 0;
+}
+
+static int mt6360_timeout_set(struct led_classdev_flash *fl_cdev, u32 timeout)
+{
+	struct mt6360_led *led = container_of(fl_cdev, struct mt6360_led, flash);
+	struct mt6360_priv *priv = led->priv;
+	struct led_flash_setting *s = &fl_cdev->timeout;
+	u32 val = (timeout - s->min) / s->step;
+
+	return regmap_update_bits(priv->regmap, MT6360_REG_STRBTO, MT6360_STRBTO_MASK, val);
+
+}
+
+static int mt6360_fault_get(struct led_classdev_flash *fl_cdev, u32 *fault)
+{
+	struct mt6360_led *led = container_of(fl_cdev, struct mt6360_led, flash);
+	struct mt6360_priv *priv = led->priv;
+	u16 fled_stat;
+	unsigned int chg_stat, strobe_timeout_mask, fled_short_mask;
+	u32 rfault = 0;
+	int ret;
+
+	ret = regmap_read(priv->regmap, MT6360_REG_CHGSTAT2, &chg_stat);
+	if (ret)
+		return ret;
+
+	ret = regmap_raw_read(priv->regmap, MT6360_REG_FLEDSTAT1, &fled_stat, sizeof(fled_stat));
+	if (ret)
+		return ret;
+
+	if (led->led_no == MT6360_LED_FLASH1) {
+		strobe_timeout_mask = MT6360_FLED1STRBTO_MASK;
+		fled_short_mask = MT6360_FLED1SHORT_MASK;
+
+	} else {
+		strobe_timeout_mask = MT6360_FLED2STRBTO_MASK;
+		fled_short_mask = MT6360_FLED2SHORT_MASK;
+	}
+
+	if (chg_stat & MT6360_FLEDCHGVINOVP_MASK)
+		rfault |= LED_FAULT_INPUT_VOLTAGE;
+
+	if (fled_stat & strobe_timeout_mask)
+		rfault |= LED_FAULT_TIMEOUT;
+
+	if (fled_stat & fled_short_mask)
+		rfault |= LED_FAULT_SHORT_CIRCUIT;
+
+	if (fled_stat & MT6360_FLEDLVF_MASK)
+		rfault |= LED_FAULT_UNDER_VOLTAGE;
+
+	*fault = rfault;
+	return 0;
+}
+
+static const struct led_flash_ops mt6360_flash_ops = {
+	.flash_brightness_set = mt6360_strobe_brightness_set,
+	.strobe_set = mt6360_strobe_set,
+	.strobe_get = mt6360_strobe_get,
+	.timeout_set = mt6360_timeout_set,
+	.fault_get = mt6360_fault_get,
+};
+
+static int mt6360_isnk_init_default_state(struct mt6360_led *led)
+{
+	struct mt6360_priv *priv = led->priv;
+	unsigned int regval;
+	u32 level;
+	int ret;
+
+	ret = regmap_read(priv->regmap, MT6360_REG_ISNK(led->led_no), &regval);
+	if (ret)
+		return ret;
+	level = regval & MT6360_ISNK_MASK;
+
+	ret = regmap_read(priv->regmap, MT6360_REG_RGBEN, &regval);
+	if (ret)
+		return ret;
+
+	if (regval & MT6360_ISNK_ENMASK(led->led_no))
+		level += 1;
+	else
+		level = LED_OFF;
+
+	switch (led->default_state) {
+	case STATE_ON:
+		led->isnk.brightness = led->isnk.max_brightness;
+		break;
+	case STATE_KEEP:
+		led->isnk.brightness = min(level, led->isnk.max_brightness);
+		break;
+	default:
+		led->isnk.brightness = LED_OFF;
+	}
+
+	return mt6360_isnk_brightness_set(&led->isnk, led->isnk.brightness);
+}
+
+static int mt6360_isnk_register(struct device *parent, struct mt6360_led *led,
+				struct led_init_data *init_data)
+{
+	struct mt6360_priv *priv = led->priv;
+	int ret;
+
+	if (led->led_no == MT6360_LED_ISNK1) {
+		/* change isink to sw mode */
+		ret = regmap_update_bits(priv->regmap, MT6360_REG_RGBEN, MT6360_CHRINDSEL_MASK,
+					 MT6360_CHRINDSEL_MASK);
+		if (ret) {
+			dev_err(parent, "Failed to config ISNK1 to SW mode\n");
+			return ret;
+		}
+	}
+
+	ret = mt6360_isnk_init_default_state(led);
+	if (ret) {
+		dev_err(parent, "Failed to init %d isnk state\n", led->led_no);
+		return ret;
+	}
+
+	ret = devm_led_classdev_register_ext(parent, &led->isnk, init_data);
+	if (ret) {
+		dev_err(parent, "Couldn't register isink %d\n", led->led_no);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int mt6360_flash_init_default_state(struct mt6360_led *led)
+{
+	struct led_classdev_flash *flash = &led->flash;
+	struct mt6360_priv *priv = led->priv;
+	u32 enable_mask = MT6360_TORCHEN_MASK | MT6360_FLCSEN_MASK(led->led_no);
+	u32 level;
+	unsigned int regval;
+	int ret;
+
+	ret = regmap_read(priv->regmap, MT6360_REG_FLEDITOR(led->led_no), &regval);
+	if (ret)
+		return ret;
+	level = regval & MT6360_ITORCH_MASK;
+
+	ret = regmap_read(priv->regmap, MT6360_REG_FLEDEN, &regval);
+	if (ret)
+		return ret;
+
+	if ((regval & enable_mask) == enable_mask)
+		level += 1;
+	else
+		level = LED_OFF;
+
+	switch (led->default_state) {
+	case STATE_ON:
+		flash->led_cdev.brightness = flash->led_cdev.max_brightness;
+		break;
+	case STATE_KEEP:
+		flash->led_cdev.brightness = min(level, flash->led_cdev.max_brightness);
+		break;
+	default:
+		flash->led_cdev.brightness = LED_OFF;
+	}
+
+	return mt6360_torch_brightness_set(&flash->led_cdev, flash->led_cdev.brightness);
+}
+
+#if IS_ENABLED(CONFIG_V4L2_FLASH_LED_CLASS)
+static int mt6360_flash_external_strobe_set(struct v4l2_flash *v4l2_flash, bool enable)
+{
+	struct led_classdev_flash *flash = v4l2_flash->fled_cdev;
+	struct mt6360_led *led = container_of(flash, struct mt6360_led, flash);
+	struct mt6360_priv *priv = led->priv;
+	u32 enable_mask = MT6360_FLCSEN_MASK(led->led_no);
+	int ret;
+
+	ret = regmap_update_bits(priv->regmap, MT6360_REG_FLEDEN, enable_mask,
+				 enable ? enable_mask : 0);
+	if (ret)
+		return ret;
+
+	if (enable)
+		priv->fled_strobe_used |= BIT(led->led_no);
+	else
+		priv->fled_strobe_used &= (~BIT(led->led_no));
+
+	return 0;
+}
+
+static const struct v4l2_flash_ops v4l2_flash_ops = {
+	.external_strobe_set = mt6360_flash_external_strobe_set,
+};
+
+static void mt6360_flash_init_v4l2_config(struct mt6360_led *led, struct v4l2_flash_config *config)
+{
+	struct led_classdev_flash *flash = &led->flash;
+	struct led_classdev *lcdev = &flash->led_cdev;
+	struct led_flash_setting *s = &config->intensity;
+
+	snprintf(config->dev_name, sizeof(config->dev_name), "%s", lcdev->name);
+
+	s->min = MT6360_ITORCH_MIN;
+	s->step = MT6360_ITORCH_STEP;
+	s->val = s->max = (s->min) + (lcdev->max_brightness - 1) * s->step;
+
+	config->has_external_strobe = 1;
+}
+#else
+static const struct v4l2_flash_ops v4l2_flash_ops;
+
+static void mt6360_flash_init_v4l2_config(struct mt6360_led *led, struct v4l2_flash_config *config)
+{
+}
+#endif
+
+static int mt6360_flash_register(struct device *parent, struct mt6360_led *led,
+				 struct led_init_data *init_data)
+{
+	struct v4l2_flash_config v4l2_config = {0};
+	int ret;
+
+	ret = mt6360_flash_init_default_state(led);
+	if (ret) {
+		dev_err(parent, "Failed to init %d flash state\n", led->led_no);
+		return ret;
+	}
+
+	ret = devm_led_classdev_flash_register_ext(parent, &led->flash, init_data);
+	if (ret) {
+		dev_err(parent, "Couldn't register flash %d\n", led->led_no);
+		return ret;
+	}
+
+	mt6360_flash_init_v4l2_config(led, &v4l2_config);
+	led->v4l2_flash = v4l2_flash_init(parent, init_data->fwnode, &led->flash, &v4l2_flash_ops,
+					  &v4l2_config);
+	if (IS_ERR(led->v4l2_flash)) {
+		dev_err(parent, "Failed to register %d v4l2 sd\n", led->led_no);
+		return PTR_ERR(led->v4l2_flash);
+	}
+
+	return 0;
+}
+
+static inline unsigned int mt6360_get_isnk_max_level(u32 led_no)
+{
+	switch (led_no) {
+	case MT6360_LED_ISNK1 ... MT6360_LED_ISNK3:
+		return MT6360_ISNK1_MAXLEVEL;
+	}
+	return MT6360_ISNK4_MAXLEVEL;
+}
+
+static int mt6360_init_isnk_properties(struct mt6360_led *led, struct led_init_data *init_data)
+{
+	struct led_classdev *isnk = &led->isnk;
+
+	isnk->max_brightness = mt6360_get_isnk_max_level(led->led_no);
+	isnk->brightness_set_blocking = mt6360_isnk_brightness_set;
+
+	fwnode_property_read_string(init_data->fwnode, "linux,default-trigger",
+				    &isnk->default_trigger);
+
+	return 0;
+}
+
+static void clamp_align(u32 *v, u32 min, u32 max, u32 step)
+{
+	*v = clamp_val(*v, min, max);
+	if (step > 1)
+		*v = (*v - min) / step * step + min;
+}
+
+static int mt6360_init_flash_properties(struct mt6360_led *led, struct led_init_data *init_data)
+{
+	struct led_classdev_flash *flash = &led->flash;
+	struct led_classdev *lcdev = &flash->led_cdev;
+	struct led_flash_setting *s;
+	u32 val;
+	int ret;
+
+	ret = fwnode_property_read_u32(init_data->fwnode, "led-max-microamp", &val);
+	if (ret)
+		val = MT6360_ITORCH_MIN;
+	else
+		clamp_align(&val, MT6360_ITORCH_MIN, MT6360_ITORCH_MAX, MT6360_ITORCH_STEP);
+
+	lcdev->max_brightness = (val - MT6360_ITORCH_MIN) / MT6360_ITORCH_STEP + 1;
+	lcdev->brightness_set_blocking = mt6360_torch_brightness_set;
+	lcdev->flags |= LED_DEV_CAP_FLASH;
+
+	ret = fwnode_property_read_u32(init_data->fwnode, "flash-max-microamp", &val);
+	if (ret)
+		val = MT6360_ISTRB_MIN;
+	else
+		clamp_align(&val, MT6360_ISTRB_MIN, MT6360_ISTRB_MAX, MT6360_ISTRB_STEP);
+
+	s = &flash->brightness;
+	s->min = MT6360_ISTRB_MIN;
+	s->step = MT6360_ISTRB_STEP;
+	s->val = s->max = val;
+
+	/* always configure as min level when off to prevent flash current spike */
+	ret = _mt6360_strobe_brightness_set(flash, s->min);
+	if (ret)
+		return ret;
+
+	ret = fwnode_property_read_u32(init_data->fwnode, "flash-max-timeout-us", &val);
+	if (ret)
+		val = MT6360_STRBTO_MIN;
+	else
+		clamp_align(&val, MT6360_STRBTO_MIN, MT6360_STRBTO_MAX, MT6360_STRBTO_STEP);
+
+	s = &flash->timeout;
+	s->min = MT6360_STRBTO_MIN;
+	s->step = MT6360_STRBTO_STEP;
+	s->val = s->max = val;
+
+	flash->ops = &mt6360_flash_ops;
+
+	return 0;
+}
+
+static int mt6360_init_common_properties(struct mt6360_led *led, struct led_init_data *init_data)
+{
+	const char *str;
+
+	if (!fwnode_property_read_string(init_data->fwnode, "default-state", &str)) {
+		if (!strcmp(str, "on"))
+			led->default_state = STATE_ON;
+		else if (!strcmp(str, "keep"))
+			led->default_state = STATE_KEEP;
+		else
+			led->default_state = STATE_OFF;
+	}
+
+	return 0;
+}
+
+static int mt6360_led_probe(struct platform_device *pdev)
+{
+	struct mt6360_priv *priv;
+	struct fwnode_handle *child;
+	int i, ret;
+
+	ret = device_get_child_node_count(&pdev->dev);
+	if (!ret || ret > MT6360_MAX_LEDS)
+		return -EINVAL;
+
+	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->dev = &pdev->dev;
+
+	priv->regmap = dev_get_regmap(pdev->dev.parent, NULL);
+	if (!priv->regmap) {
+		dev_err(&pdev->dev, "Failed to get parent regmap\n");
+		return -ENODEV;
+	}
+
+	device_for_each_child_node(&pdev->dev, child) {
+		struct mt6360_led *led;
+		struct led_init_data init_data = { .fwnode = child, };
+		u32 reg;
+
+		ret = fwnode_property_read_u32(child, "reg", &reg);
+		if (ret || reg >= MT6360_MAX_LEDS || priv->leds[reg].active) {
+			ret = -EINVAL;
+			goto out;
+		}
+		led = &priv->leds[reg];
+
+		led->active = true;
+		led->led_no = reg;
+		led->priv = priv;
+
+		ret = mt6360_init_common_properties(led, &init_data);
+		if (ret)
+			goto out;
+
+		switch (reg) {
+		case MT6360_LED_ISNK1 ... MT6360_LED_ISNK4:
+			ret = mt6360_init_isnk_properties(led, &init_data);
+			if (ret)
+				goto out;
+
+			ret = mt6360_isnk_register(&pdev->dev, led, &init_data);
+			break;
+		default:
+			ret = mt6360_init_flash_properties(led, &init_data);
+			if (ret)
+				goto out;
+
+			ret = mt6360_flash_register(&pdev->dev, led, &init_data);
+		}
+
+		if (ret)
+			goto out;
+	}
+
+	platform_set_drvdata(pdev, priv);
+	return 0;
+out:
+	for (i = MT6360_LED_FLASH1; i <= MT6360_LED_FLASH2; i++) {
+		struct mt6360_led *led = &priv->leds[i];
+
+		if (led->v4l2_flash)
+			v4l2_flash_release(led->v4l2_flash);
+
+	}
+
+	return ret;
+}
+
+static int mt6360_led_remove(struct platform_device *pdev)
+{
+	struct mt6360_priv *priv = platform_get_drvdata(pdev);
+	int i;
+
+	for (i = MT6360_LED_FLASH1; i <= MT6360_LED_FLASH2; i++) {
+		struct mt6360_led *led = &priv->leds[i];
+
+		if (led->v4l2_flash)
+			v4l2_flash_release(led->v4l2_flash);
+
+	}
+
+	return 0;
+}
+
+static const struct of_device_id __maybe_unused mt6360_led_of_id[] = {
+	{ .compatible = "mediatek,mt6360-led", },
+	{},
+};
+MODULE_DEVICE_TABLE(of, mt6360_led_of_id);
+
+static struct platform_driver mt6360_led_driver = {
+	.driver = {
+		.name = "mt6360-led",
+		.of_match_table = mt6360_led_of_id,
+	},
+	.probe = mt6360_led_probe,
+	.remove = mt6360_led_remove,
+};
+module_platform_driver(mt6360_led_driver);
+
+MODULE_AUTHOR("CY_Huang <cy_huang@richtek.com>");
+MODULE_DESCRIPTION("MT6360 Led Driver");
+MODULE_LICENSE("GPL");
-- 
2.7.4

