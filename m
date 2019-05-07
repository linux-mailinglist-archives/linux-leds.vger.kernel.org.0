Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D6EF416BF6
	for <lists+linux-leds@lfdr.de>; Tue,  7 May 2019 22:13:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727129AbfEGUMI (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 7 May 2019 16:12:08 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:46134 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727123AbfEGUMI (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 7 May 2019 16:12:08 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x47KBs7q003405;
        Tue, 7 May 2019 15:11:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1557259914;
        bh=itExORL3KdLT3HQGYDuVv7awOOxxOEGDK+mdWtGGt8g=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=hZOZ38E9irJM7FYIVr01cqnh8/IWg7BRsdA/RddDAUW+lqkg4fCVDQnhuWdn8/3Ng
         XB69qIIc/YIr7Nx/zUK0RZxTWK3EQyLX1arinpoPJ1Go104yYeq2Bi8p9hyNliXIDZ
         cDC9K20SjdZrnDNfvos8s7XneJKFzqex2SWL3iRQ=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x47KBs9X102938
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 7 May 2019 15:11:54 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 7 May
 2019 15:11:54 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 7 May 2019 15:11:54 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x47KBsk6013909;
        Tue, 7 May 2019 15:11:54 -0500
From:   Dan Murphy <dmurphy@ti.com>
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>
CC:     <lee.jones@linaro.org>, <rdunlap@infradead.org>,
        <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Dan Murphy <dmurphy@ti.com>
Subject: [PATCH v4 4/6] regulator: lm363x: Add support for LM36274
Date:   Tue, 7 May 2019 15:11:57 -0500
Message-ID: <20190507201159.13940-5-dmurphy@ti.com>
X-Mailer: git-send-email 2.21.0.5.gaeb582a983
In-Reply-To: <20190507201159.13940-1-dmurphy@ti.com>
References: <20190507201159.13940-1-dmurphy@ti.com>
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
---
 drivers/regulator/Kconfig            |  2 +-
 drivers/regulator/lm363x-regulator.c | 52 ++++++++++++++++++++++++++++
 2 files changed, 53 insertions(+), 1 deletion(-)

diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
index b7f249ee5e68..23252ae81fdf 100644
--- a/drivers/regulator/Kconfig
+++ b/drivers/regulator/Kconfig
@@ -362,7 +362,7 @@ config REGULATOR_LM363X
 	tristate "TI LM363X voltage regulators"
 	depends on MFD_TI_LMU
 	help
-	  This driver supports LM3631 and LM3632 voltage regulators for
+	  This driver supports LM3631, LM3632 and LM36274 voltage regulators for
 	  the LCD bias.
 	  One boost output voltage is configurable and always on.
 	  Other LDOs are used for the display module.
diff --git a/drivers/regulator/lm363x-regulator.c b/drivers/regulator/lm363x-regulator.c
index 382b1cecdd93..1944677b1448 100644
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
-- 
2.21.0.5.gaeb582a983

