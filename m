Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A8E7A142389
	for <lists+linux-leds@lfdr.de>; Mon, 20 Jan 2020 07:37:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726589AbgATGhk (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 20 Jan 2020 01:37:40 -0500
Received: from mail-lf1-f66.google.com ([209.85.167.66]:41346 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725788AbgATGhj (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 20 Jan 2020 01:37:39 -0500
Received: by mail-lf1-f66.google.com with SMTP id m30so23060752lfp.8;
        Sun, 19 Jan 2020 22:37:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=g8ysw4/yA+4uYX9itP0v+Y3HyyS0BidZBKmk2oSyIqk=;
        b=n7szQB+ALQ+G8Hzg9ObGjyPELGbgbeXTg+9zSEmTGHFO34bKLAU4593jYOzK7PULJ0
         V5IaVreM9MKU5AGsnml3Cya02P8ovL4IHdHHz1R2hyj2eFVUXMa01b5ttCEa/B51ps6H
         OrnkBrTrmzUkvL+zARmCxpuyRCqwM3BM5YcOv1sgt+vZ6XsjwaWNpFus3hurKTah3yKW
         cJoUbMRIWuw/vKUPQITVCAkVCZ4svCL5CT9jaI0cm3RhG54DRhq7oarw6/3T0BqNBjzJ
         HH7bt/JvLY7w2D+wvttu2UhmV21YojbYz90oc7sjPNWKVDv7doXXWucldxydUAXi6pBj
         ZRqg==
X-Gm-Message-State: APjAAAW9JwAZRtxpzX/jAXbzB2xCOQjojBs/AkuLpl2hisqy9vezmioV
        ZFQE/j50vTzw2IAnDc5vRro=
X-Google-Smtp-Source: APXvYqw7+kSqTWkA4vdtLcqY06wto7mFx/VTxxxMr1bRZSsi3TTX/5KlOoqYNnu+ws4ZGEwgW+8odA==
X-Received: by 2002:ac2:5a43:: with SMTP id r3mr12558514lfn.150.1579502255380;
        Sun, 19 Jan 2020 22:37:35 -0800 (PST)
Received: from localhost.localdomain ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id d20sm16094916ljg.95.2020.01.19.22.37.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jan 2020 22:37:34 -0800 (PST)
Date:   Mon, 20 Jan 2020 08:37:28 +0200
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     matti.vaittinen@fi.rohmeurope.com, mazziesaccount@gmail.com
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-rtc@vger.kernel.org
Subject: [PATCH v11 07/13] clk: bd718x7: Support ROHM BD71828 clk block
Message-ID: <a7cf341993dfa89b9d757a7f260928ebe47d5c46.1579501711.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1579501711.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1579501711.git.matti.vaittinen@fi.rohmeurope.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

BD71828GW is a single-chip power management IC for battery-powered portable
devices. Add support for controlling BD71828 clk using bd718x7 driver.

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>
Acked-by: Stephen Boyd <sboyd@kernel.org>
---
No changes since v10

 drivers/clk/Kconfig              |  6 ++---
 drivers/clk/clk-bd718x7.c        | 38 +++++++++++++++++++++++---------
 include/linux/mfd/rohm-bd70528.h |  6 -----
 include/linux/mfd/rohm-bd71828.h |  4 ----
 include/linux/mfd/rohm-bd718x7.h |  6 -----
 5 files changed, 31 insertions(+), 29 deletions(-)

diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index 45653a0e6ecd..ac5981ce2477 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -305,10 +305,10 @@ config COMMON_CLK_MMP2
 	  Support for Marvell MMP2 and MMP3 SoC clocks
 
 config COMMON_CLK_BD718XX
-	tristate "Clock driver for ROHM BD718x7 PMIC"
-	depends on MFD_ROHM_BD718XX || MFD_ROHM_BD70528
+	tristate "Clock driver for 32K clk gates on ROHM PMICs"
+	depends on MFD_ROHM_BD718XX || MFD_ROHM_BD70528 || MFD_ROHM_BD71828
 	help
-	  This driver supports ROHM BD71837, ROHM BD71847 and
+	  This driver supports ROHM BD71837, ROHM BD71847, ROHM BD71828 and
 	  ROHM BD70528 PMICs clock gates.
 
 config COMMON_CLK_FIXED_MMIO
diff --git a/drivers/clk/clk-bd718x7.c b/drivers/clk/clk-bd718x7.c
index 33699ee1bdf3..b52e8d6f660c 100644
--- a/drivers/clk/clk-bd718x7.c
+++ b/drivers/clk/clk-bd718x7.c
@@ -7,12 +7,25 @@
 #include <linux/err.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
-#include <linux/mfd/rohm-bd718x7.h>
-#include <linux/mfd/rohm-bd70528.h>
+#include <linux/mfd/rohm-generic.h>
 #include <linux/clk-provider.h>
 #include <linux/clkdev.h>
 #include <linux/regmap.h>
 
+/* clk control registers */
+/* BD70528 */
+#define BD70528_REG_OUT32K	0x2c
+/* BD71828 */
+#define BD71828_REG_OUT32K	0x4B
+/* BD71837 and BD71847 */
+#define BD718XX_REG_OUT32K	0x2E
+
+/*
+ * BD71837, BD71847, BD70528 and BD71828 all use bit [0] to clk output control
+ */
+#define CLK_OUT_EN_MASK		BIT(0)
+
+
 struct bd718xx_clk {
 	struct clk_hw hw;
 	u8 reg;
@@ -21,10 +34,8 @@ struct bd718xx_clk {
 	struct rohm_regmap_dev *mfd;
 };
 
-static int bd71837_clk_set(struct clk_hw *hw, int status)
+static int bd71837_clk_set(struct bd718xx_clk *c, unsigned int status)
 {
-	struct bd718xx_clk *c = container_of(hw, struct bd718xx_clk, hw);
-
 	return regmap_update_bits(c->mfd->regmap, c->reg, c->mask, status);
 }
 
@@ -33,14 +44,16 @@ static void bd71837_clk_disable(struct clk_hw *hw)
 	int rv;
 	struct bd718xx_clk *c = container_of(hw, struct bd718xx_clk, hw);
 
-	rv = bd71837_clk_set(hw, 0);
+	rv = bd71837_clk_set(c, 0);
 	if (rv)
 		dev_dbg(&c->pdev->dev, "Failed to disable 32K clk (%d)\n", rv);
 }
 
 static int bd71837_clk_enable(struct clk_hw *hw)
 {
-	return bd71837_clk_set(hw, 1);
+	struct bd718xx_clk *c = container_of(hw, struct bd718xx_clk, hw);
+
+	return bd71837_clk_set(c, 0xffffffff);
 }
 
 static int bd71837_clk_is_enabled(struct clk_hw *hw)
@@ -92,11 +105,15 @@ static int bd71837_clk_probe(struct platform_device *pdev)
 	case ROHM_CHIP_TYPE_BD71837:
 	case ROHM_CHIP_TYPE_BD71847:
 		c->reg = BD718XX_REG_OUT32K;
-		c->mask = BD718XX_OUT32K_EN;
+		c->mask = CLK_OUT_EN_MASK;
+		break;
+	case ROHM_CHIP_TYPE_BD71828:
+		c->reg = BD71828_REG_OUT32K;
+		c->mask = CLK_OUT_EN_MASK;
 		break;
 	case ROHM_CHIP_TYPE_BD70528:
-		c->reg = BD70528_REG_CLK_OUT;
-		c->mask = BD70528_CLK_OUT_EN_MASK;
+		c->reg = BD70528_REG_OUT32K;
+		c->mask = CLK_OUT_EN_MASK;
 		break;
 	default:
 		dev_err(&pdev->dev, "Unknown clk chip\n");
@@ -126,6 +143,7 @@ static const struct platform_device_id bd718x7_clk_id[] = {
 	{ "bd71837-clk", ROHM_CHIP_TYPE_BD71837 },
 	{ "bd71847-clk", ROHM_CHIP_TYPE_BD71847 },
 	{ "bd70528-clk", ROHM_CHIP_TYPE_BD70528 },
+	{ "bd71828-clk", ROHM_CHIP_TYPE_BD71828 },
 	{ },
 };
 MODULE_DEVICE_TABLE(platform, bd718x7_clk_id);
diff --git a/include/linux/mfd/rohm-bd70528.h b/include/linux/mfd/rohm-bd70528.h
index 1013e60c5b25..2ad2320d0a96 100644
--- a/include/linux/mfd/rohm-bd70528.h
+++ b/include/linux/mfd/rohm-bd70528.h
@@ -89,10 +89,6 @@ struct bd70528_data {
 #define BD70528_REG_GPIO3_OUT	0x52
 #define BD70528_REG_GPIO4_OUT	0x54
 
-/* clk control */
-
-#define BD70528_REG_CLK_OUT	0x2c
-
 /* RTC */
 
 #define BD70528_REG_RTC_COUNT_H		0x2d
@@ -309,8 +305,6 @@ enum {
 
 #define BD70528_GPIO_IN_STATE_BASE 1
 
-#define BD70528_CLK_OUT_EN_MASK 0x1
-
 /* RTC masks to mask out reserved bits */
 
 #define BD70528_MASK_RTC_SEC		0x7f
diff --git a/include/linux/mfd/rohm-bd71828.h b/include/linux/mfd/rohm-bd71828.h
index eb0557eb5314..d013e03f742d 100644
--- a/include/linux/mfd/rohm-bd71828.h
+++ b/include/linux/mfd/rohm-bd71828.h
@@ -183,9 +183,6 @@ enum {
 #define BD71828_REG_CHG_STATE		0x65
 #define BD71828_REG_CHG_FULL		0xd2
 
-/* CLK */
-#define BD71828_REG_OUT32K		0x4B
-
 /* LEDs */
 #define BD71828_REG_LED_CTRL		0x4A
 #define BD71828_MASK_LED_AMBER		0x80
@@ -417,7 +414,6 @@ enum {
 #define BD71828_INT_RTC1_MASK				0x2
 #define BD71828_INT_RTC2_MASK				0x4
 
-#define BD71828_OUT32K_EN				0x1
 #define BD71828_OUT_TYPE_MASK				0x2
 #define BD71828_OUT_TYPE_OPEN_DRAIN			0x0
 #define BD71828_OUT_TYPE_CMOS				0x2
diff --git a/include/linux/mfd/rohm-bd718x7.h b/include/linux/mfd/rohm-bd718x7.h
index 7f2dbde402a1..bee2474a8f9f 100644
--- a/include/linux/mfd/rohm-bd718x7.h
+++ b/include/linux/mfd/rohm-bd718x7.h
@@ -191,12 +191,6 @@ enum {
 #define IRQ_ON_REQ		0x02
 #define IRQ_STBY_REQ		0x01
 
-/* BD718XX_REG_OUT32K bits */
-#define BD718XX_OUT32K_EN	0x01
-
-/* BD7183XX gated clock rate */
-#define BD718XX_CLK_RATE 32768
-
 /* ROHM BD718XX irqs */
 enum {
 	BD718XX_INT_STBY_REQ,
-- 
2.21.0


-- 
Matti Vaittinen, Linux device drivers
ROHM Semiconductors, Finland SWDC
Kiviharjunlenkki 1E
90220 OULU
FINLAND

~~~ "I don't think so," said Rene Descartes. Just then he vanished ~~~
Simon says - in Latin please.
~~~ "non cogito me" dixit Rene Descarte, deinde evanescavit ~~~
Thanks to Simon Glass for the translation =] 
