Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BADBD34F3B
	for <lists+linux-leds@lfdr.de>; Tue,  4 Jun 2019 19:44:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726572AbfFDRny (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 4 Jun 2019 13:43:54 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:53252 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726422AbfFDRny (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 4 Jun 2019 13:43:54 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x54Hhn5d018132;
        Tue, 4 Jun 2019 12:43:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1559670229;
        bh=//d0ZgtUE27inP2KL+Zr2FHNs+rF3UulcIDGdywsweg=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=nTc+QpsoB2tBEkI9za/qZuZeioTPXmMn18Gct8ID9tvKRTCAl8xInGE4um53k7Lod
         4Ejf9XqvYi3wF2PYnRsh2eXcmlpSxdlq7YHgOYtNIafOqJt6xBbwj1rvgaCWLCqDha
         fN4mGUHsu5UIzBhi+nRsv6Ww0PAjTexHh0kfkNCI=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x54Hhniq057671
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 4 Jun 2019 12:43:49 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 4 Jun
 2019 12:43:48 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 4 Jun 2019 12:43:48 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x54Hhmq1123667;
        Tue, 4 Jun 2019 12:43:48 -0500
From:   Dan Murphy <dmurphy@ti.com>
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>, <broonie@kernel.org>,
        <lgirdwood@gmail.com>
CC:     <lee.jones@linaro.org>, <linux-leds@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Dan Murphy <dmurphy@ti.com>
Subject: [PATCH v5 3/6] mfd: ti-lmu: Add LM36274 support to the ti-lmu
Date:   Tue, 4 Jun 2019 12:43:42 -0500
Message-ID: <20190604174345.14841-4-dmurphy@ti.com>
X-Mailer: git-send-email 2.21.0.5.gaeb582a983
In-Reply-To: <20190604174345.14841-1-dmurphy@ti.com>
References: <20190604174345.14841-1-dmurphy@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Add the LM36274 register support to the ti-lmu MFD driver.

Signed-off-by: Dan Murphy <dmurphy@ti.com>
Acked-by: Lee Jones <lee.jones@linaro.org>
Signed-off-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
---

v5 - No changes

 drivers/mfd/Kconfig                 |  5 ++---
 drivers/mfd/ti-lmu.c                | 14 ++++++++++++++
 include/linux/mfd/ti-lmu-register.h | 23 +++++++++++++++++++++++
 include/linux/mfd/ti-lmu.h          |  4 ++++
 4 files changed, 43 insertions(+), 3 deletions(-)

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index 8933485b28e7..a69aca3c2dab 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -1335,9 +1335,8 @@ config MFD_TI_LMU
 	select REGMAP_I2C
 	help
 	  Say yes here to enable support for TI LMU chips.
-
-	  TI LMU MFD supports LM3532, LM3631, LM3632, LM3633, and LM3695.
-	  It consists of backlight, LED and regulator driver.
+	  TI LMU MFD supports LM3532, LM3631, LM3632, LM3633, LM3695 and
+	  LM36274.  It consists of backlight, LED and regulator driver.
 	  It provides consistent device controls for lighting functions.
 
 config MFD_OMAP_USB_HOST
diff --git a/drivers/mfd/ti-lmu.c b/drivers/mfd/ti-lmu.c
index 89b1c5b584af..691ab9dd6236 100644
--- a/drivers/mfd/ti-lmu.c
+++ b/drivers/mfd/ti-lmu.c
@@ -111,6 +111,17 @@ static const struct mfd_cell lm3695_devices[] = {
 	},
 };
 
+static const struct mfd_cell lm36274_devices[] = {
+	LM363X_REGULATOR(LM36274_BOOST),
+	LM363X_REGULATOR(LM36274_LDO_POS),
+	LM363X_REGULATOR(LM36274_LDO_NEG),
+	{
+		.name          = "lm36274-leds",
+		.id            = LM36274,
+		.of_compatible = "ti,lm36274-backlight",
+	},
+};
+
 #define TI_LMU_DATA(chip, max_reg)		\
 static const struct ti_lmu_data chip##_data =	\
 {						\
@@ -123,6 +134,7 @@ TI_LMU_DATA(lm3631, LM3631_MAX_REG);
 TI_LMU_DATA(lm3632, LM3632_MAX_REG);
 TI_LMU_DATA(lm3633, LM3633_MAX_REG);
 TI_LMU_DATA(lm3695, LM3695_MAX_REG);
+TI_LMU_DATA(lm36274, LM36274_MAX_REG);
 
 static int ti_lmu_probe(struct i2c_client *cl, const struct i2c_device_id *id)
 {
@@ -191,6 +203,7 @@ static const struct of_device_id ti_lmu_of_match[] = {
 	{ .compatible = "ti,lm3632", .data = &lm3632_data },
 	{ .compatible = "ti,lm3633", .data = &lm3633_data },
 	{ .compatible = "ti,lm3695", .data = &lm3695_data },
+	{ .compatible = "ti,lm36274", .data = &lm36274_data },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, ti_lmu_of_match);
@@ -200,6 +213,7 @@ static const struct i2c_device_id ti_lmu_ids[] = {
 	{ "lm3632", LM3632 },
 	{ "lm3633", LM3633 },
 	{ "lm3695", LM3695 },
+	{ "lm36274", LM36274 },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, ti_lmu_ids);
diff --git a/include/linux/mfd/ti-lmu-register.h b/include/linux/mfd/ti-lmu-register.h
index 76998b01764b..076d8dea38fd 100644
--- a/include/linux/mfd/ti-lmu-register.h
+++ b/include/linux/mfd/ti-lmu-register.h
@@ -189,4 +189,27 @@
 #define LM3695_REG_BRT_MSB			0x14
 
 #define LM3695_MAX_REG				0x14
+
+/* LM36274 */
+#define LM36274_REG_REV				0x01
+#define LM36274_REG_BL_CFG_1			0x02
+#define LM36274_REG_BL_CFG_2			0x03
+#define LM36274_REG_BRT_LSB			0x04
+#define LM36274_REG_BRT_MSB			0x05
+#define LM36274_REG_BL_EN			0x08
+
+#define LM36274_REG_BIAS_CONFIG_1		0x09
+#define LM36274_EXT_EN_MASK			BIT(0)
+#define LM36274_EN_VNEG_MASK			BIT(1)
+#define LM36274_EN_VPOS_MASK			BIT(2)
+
+#define LM36274_REG_BIAS_CONFIG_2		0x0a
+#define LM36274_REG_BIAS_CONFIG_3		0x0b
+#define LM36274_REG_VOUT_BOOST			0x0c
+#define LM36274_REG_VOUT_POS			0x0d
+#define LM36274_REG_VOUT_NEG			0x0e
+#define LM36274_VOUT_MASK			0x3F
+
+#define LM36274_MAX_REG				0x13
+
 #endif
diff --git a/include/linux/mfd/ti-lmu.h b/include/linux/mfd/ti-lmu.h
index 54e9d272e81c..0957598c7d41 100644
--- a/include/linux/mfd/ti-lmu.h
+++ b/include/linux/mfd/ti-lmu.h
@@ -26,6 +26,7 @@ enum ti_lmu_id {
 	LM3632,
 	LM3633,
 	LM3695,
+	LM36274,
 	LMU_MAX_ID,
 };
 
@@ -67,6 +68,9 @@ enum lm363x_regulator_id {
 	LM3632_BOOST,		/* Boost output */
 	LM3632_LDO_POS,		/* Positive display bias output */
 	LM3632_LDO_NEG,		/* Negative display bias output */
+	LM36274_BOOST,		/* Boost output */
+	LM36274_LDO_POS,	/* Positive display bias output */
+	LM36274_LDO_NEG,	/* Negative display bias output */
 };
 
 /**
-- 
2.21.0.5.gaeb582a983

