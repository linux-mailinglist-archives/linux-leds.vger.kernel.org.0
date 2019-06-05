Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6F15135D52
	for <lists+linux-leds@lfdr.de>; Wed,  5 Jun 2019 14:57:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727902AbfFEM4u (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 5 Jun 2019 08:56:50 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:33068 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727866AbfFEM4m (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 5 Jun 2019 08:56:42 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x55Cubif023690;
        Wed, 5 Jun 2019 07:56:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1559739397;
        bh=AD1mvi/bZ0lPOeqqdO6nByJDcHOFWtnEw2/h59GwqJM=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=l2wUFbgcCoWLQ2z6C2chbB4VySJHaiVknW9B9sXHvp9/DhmVQLALYWvGg49h4Tm0Z
         2MpCkdH8pcDhNgZXMqUcfKsiVZdBoPFCc9VBuyHND8xZK9GSD/RaerhD3iDQgYwQlS
         Flr13AF7BbgARLNUG4O+btTAgh1ha+dssPB3q0Mk=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x55Cub9w012168
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 5 Jun 2019 07:56:37 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 5 Jun
 2019 07:56:37 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 5 Jun 2019 07:56:37 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x55CuaUB097852;
        Wed, 5 Jun 2019 07:56:36 -0500
From:   Dan Murphy <dmurphy@ti.com>
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>, <broonie@kernel.org>,
        <lgirdwood@gmail.com>
CC:     <lee.jones@linaro.org>, <linux-leds@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Dan Murphy <dmurphy@ti.com>
Subject: [PATCH v6 3/5] regulator: lm363x: Add support for LM36274
Date:   Wed, 5 Jun 2019 07:56:32 -0500
Message-ID: <20190605125634.7042-4-dmurphy@ti.com>
X-Mailer: git-send-email 2.21.0.5.gaeb582a983
In-Reply-To: <20190605125634.7042-1-dmurphy@ti.com>
References: <20190605125634.7042-1-dmurphy@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Adding regulator support for the LM36274 backlight driver.
This device can leverage this existing code as the functionality
and registers are common enough between the LM36274 and the LM363x
series of devices.

Signed-off-by: Dan Murphy <dmurphy@ti.com>
Signed-off-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
---

v6 - Squash patch 1 of the series into this patch. Add flexibility when setting
the EXT_EN GPIO bit for the LM3633 and LM36274 based on comments made in
patch 1 - https://lore.kernel.org/patchwork/patch/1077408/

 drivers/regulator/Kconfig            |  2 +-
 drivers/regulator/lm363x-regulator.c | 78 ++++++++++++++++++++++++++--
 2 files changed, 75 insertions(+), 5 deletions(-)

diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
index 6c37f0df9323..34e03691dd00 100644
--- a/drivers/regulator/Kconfig
+++ b/drivers/regulator/Kconfig
@@ -363,7 +363,7 @@ config REGULATOR_LM363X
 	tristate "TI LM363X voltage regulators"
 	depends on MFD_TI_LMU
 	help
-	  This driver supports LM3631 and LM3632 voltage regulators for
+	  This driver supports LM3631, LM3632 and LM36274 voltage regulators for
 	  the LCD bias.
 	  One boost output voltage is configurable and always on.
 	  Other LDOs are used for the display module.
diff --git a/drivers/regulator/lm363x-regulator.c b/drivers/regulator/lm363x-regulator.c
index e02fdd1dd092..12b6007a23ad 100644
--- a/drivers/regulator/lm363x-regulator.c
+++ b/drivers/regulator/lm363x-regulator.c
@@ -37,6 +37,11 @@
 #define LM3632_VBOOST_MIN		4500000
 #define LM3632_VLDO_MIN			4000000
 
+/* LM36274 */
+#define LM36274_BOOST_VSEL_MAX		0x3f
+#define LM36274_LDO_VSEL_MAX		0x34
+#define LM36274_VOLTAGE_MIN		4000000
+
 /* Common */
 #define LM363X_STEP_50mV		50000
 #define LM363X_STEP_500mV		500000
@@ -217,6 +222,51 @@ static const struct regulator_desc lm363x_regulator_desc[] = {
 		.enable_reg     = LM3632_REG_BIAS_CONFIG,
 		.enable_mask    = LM3632_EN_VNEG_MASK,
 	},
+
+	/* LM36274 */
+	{
+		.name           = "vboost",
+		.of_match	= "vboost",
+		.id             = LM36274_BOOST,
+		.ops            = &lm363x_boost_voltage_table_ops,
+		.n_voltages     = LM36274_BOOST_VSEL_MAX,
+		.min_uV         = LM36274_VOLTAGE_MIN,
+		.uV_step        = LM363X_STEP_50mV,
+		.type           = REGULATOR_VOLTAGE,
+		.owner          = THIS_MODULE,
+		.vsel_reg       = LM36274_REG_VOUT_BOOST,
+		.vsel_mask      = LM36274_VOUT_MASK,
+	},
+	{
+		.name           = "ldo_vpos",
+		.of_match	= "vpos",
+		.id             = LM36274_LDO_POS,
+		.ops            = &lm363x_regulator_voltage_table_ops,
+		.n_voltages     = LM36274_LDO_VSEL_MAX,
+		.min_uV         = LM36274_VOLTAGE_MIN,
+		.uV_step        = LM363X_STEP_50mV,
+		.type           = REGULATOR_VOLTAGE,
+		.owner          = THIS_MODULE,
+		.vsel_reg       = LM36274_REG_VOUT_POS,
+		.vsel_mask      = LM36274_VOUT_MASK,
+		.enable_reg     = LM36274_REG_BIAS_CONFIG_1,
+		.enable_mask    = LM36274_EN_VPOS_MASK,
+	},
+	{
+		.name           = "ldo_vneg",
+		.of_match	= "vneg",
+		.id             = LM36274_LDO_NEG,
+		.ops            = &lm363x_regulator_voltage_table_ops,
+		.n_voltages     = LM36274_LDO_VSEL_MAX,
+		.min_uV         = LM36274_VOLTAGE_MIN,
+		.uV_step        = LM363X_STEP_50mV,
+		.type           = REGULATOR_VOLTAGE,
+		.owner          = THIS_MODULE,
+		.vsel_reg       = LM36274_REG_VOUT_NEG,
+		.vsel_mask      = LM36274_VOUT_MASK,
+		.enable_reg     = LM36274_REG_BIAS_CONFIG_1,
+		.enable_mask    = LM36274_EN_VNEG_MASK,
+	},
 };
 
 static struct gpio_desc *lm363x_regulator_of_get_enable_gpio(struct device *dev, int id)
@@ -229,9 +279,11 @@ static struct gpio_desc *lm363x_regulator_of_get_enable_gpio(struct device *dev,
 	 */
 	switch (id) {
 	case LM3632_LDO_POS:
+	case LM36274_LDO_POS:
 		return gpiod_get_index_optional(dev, "enable", 0,
 				GPIOD_OUT_LOW | GPIOD_FLAGS_BIT_NONEXCLUSIVE);
 	case LM3632_LDO_NEG:
+	case LM36274_LDO_NEG:
 		return gpiod_get_index_optional(dev, "enable", 1,
 				GPIOD_OUT_LOW | GPIOD_FLAGS_BIT_NONEXCLUSIVE);
 	default:
@@ -239,6 +291,27 @@ static struct gpio_desc *lm363x_regulator_of_get_enable_gpio(struct device *dev,
 	}
 }
 
+static int lm363x_regulator_set_ext_en(struct regmap *regmap, int id)
+{
+	int ext_en_mask = 0;
+
+	switch (id) {
+	case LM3632_LDO_POS:
+	case LM3632_LDO_NEG:
+		ext_en_mask = LM3632_EXT_EN_MASK;
+		break;
+	case LM36274_LDO_POS:
+	case LM36274_LDO_NEG:
+		ext_en_mask = LM36274_EXT_EN_MASK;
+		break;
+	default:
+		return -ENODEV;
+	}
+
+	return regmap_update_bits(regmap, lm363x_regulator_desc[id].enable_reg,
+				 ext_en_mask, ext_en_mask);
+}
+
 static int lm363x_regulator_probe(struct platform_device *pdev)
 {
 	struct ti_lmu *lmu = dev_get_drvdata(pdev->dev.parent);
@@ -263,10 +336,7 @@ static int lm363x_regulator_probe(struct platform_device *pdev)
 
 	if (gpiod) {
 		cfg.ena_gpiod = gpiod;
-
-		ret = regmap_update_bits(regmap, LM3632_REG_BIAS_CONFIG,
-					 LM3632_EXT_EN_MASK,
-					 LM3632_EXT_EN_MASK);
+		ret = lm363x_regulator_set_ext_en(regmap, id);
 		if (ret) {
 			gpiod_put(gpiod);
 			dev_err(dev, "External pin err: %d\n", ret);
-- 
2.21.0.5.gaeb582a983

