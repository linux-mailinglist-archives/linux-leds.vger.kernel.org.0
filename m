Return-Path: <linux-leds+bounces-15-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E84E67EC73C
	for <lists+linux-leds@lfdr.de>; Wed, 15 Nov 2023 16:29:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 170D71C20B72
	for <lists+linux-leds@lfdr.de>; Wed, 15 Nov 2023 15:29:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B12139FDC;
	Wed, 15 Nov 2023 15:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=asem.it header.i=@asem.it header.b="hD5cCvM1"
X-Original-To: linux-leds@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D21BD39FC4;
	Wed, 15 Nov 2023 15:29:15 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2067.outbound.protection.outlook.com [40.107.21.67])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99F351B3;
	Wed, 15 Nov 2023 07:29:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LlgaylREHzLboHsXaig4JaWQXxR6xKOYeWcgtSwgW1QJvzZAU+vRQOPH4805TwEqabXx0BSgutibfne9gKxv4diOlpnUpobHE+OIXSUDkV3vWcDETdB09sB3t5Zr1RCmDCm0700WbX3xR2zvZnIBwczacbmqFhZVwehL4JBkDMvYojxvIu+nLf41TGbM2EZi/uFqejkYUCGSae3cvVgFNF4LNsCWqo3N8g3XKkrvmj74i2/wsMozwMwstYGi19RERgnKuuVmiQZByMaLRDA7Pn5LGxdVB9KHUmtVrJfR+ajdiDwAAqJZGrQTo3KPjfUn+l7sgjNejENZXnVnzQ/NMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ImbnSFU6h9bHHOuANParz3F3foIrZQDghM/8s8suPP8=;
 b=OuI5JIyQW8WaQkMUT0HkG/wjuUan3C/ndQknVSRKbwCVt/xYGjGksWSmHmoFKW+l/yPSwERxTEEM1HMsMu33XVitIeX7mZfUMZ7NRWRanvCPVlUNOr6SrW/GY4SVRG/cbAW6lG42Q5KXKjqRjWB+ha2vJMZ99lpsbkq82t+CqVZDWu2U6osimMIoAItFtnRPgWAv0/2T/7qCgB5A/zuhnXkhKy8gFi1RtkRAcUZGMvNoiHTp4zMe1zNZp3x+HEqqMxpYGBr7FgUjwSMZH091KqDeds4Xb9cXI4Q+Ow64S5pA1e0XaYyW19M8XmczfEjS5lPchYXBorWDjsV6rW27iA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 151.1.184.193) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=asem.it;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=asem.it;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=asem.it; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ImbnSFU6h9bHHOuANParz3F3foIrZQDghM/8s8suPP8=;
 b=hD5cCvM1FRSVqbveETn3ziaJ85gP54oLUY+1Lyd76KuDoJfVjcIxaYNQHSHu+AQGBDNwfTFcdKzGwWzJArdWLGiSW/+GJORAtpnabNoGzavJj+UzO7yT0tsRwrOCd7CPqIg8dR/7EnO0sjVBrBBvfWzKENTJHIRO/Fjbo6wNfeQ=
Received: from AM6P193CA0087.EURP193.PROD.OUTLOOK.COM (2603:10a6:209:88::28)
 by PAXPR01MB8853.eurprd01.prod.exchangelabs.com (2603:10a6:102:226::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.31; Wed, 15 Nov
 2023 15:29:09 +0000
Received: from AMS0EPF000001A6.eurprd05.prod.outlook.com
 (2603:10a6:209:88:cafe::91) by AM6P193CA0087.outlook.office365.com
 (2603:10a6:209:88::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.18 via Frontend
 Transport; Wed, 15 Nov 2023 15:29:09 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 151.1.184.193) smtp.mailfrom=asem.it; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=asem.it;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 asem.it discourages use of 151.1.184.193 as permitted sender)
Received: from asas054.asem.intra (151.1.184.193) by
 AMS0EPF000001A6.mail.protection.outlook.com (10.167.16.233) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7002.20 via Frontend Transport; Wed, 15 Nov 2023 15:29:08 +0000
Received: from flavio-x.asem.intra ([172.16.18.47]) by asas054.asem.intra with Microsoft SMTPSVC(10.0.14393.4169);
	 Wed, 15 Nov 2023 16:29:06 +0100
From: Flavio Suligoi <f.suligoi@asem.it>
To: Lee Jones <lee@kernel.org>,
	Daniel Thompson <daniel.thompson@linaro.org>,
	Jingoo Han <jingoohan1@gmail.com>,
	Helge Deller <deller@gmx.de>,
	Pavel Machek <pavel@ucw.cz>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-fbdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Flavio Suligoi <f.suligoi@asem.it>
Subject: [PATCH v6 2/2] backlight: mp3309c: Add support for MPS MP3309C
Date: Wed, 15 Nov 2023 16:29:02 +0100
Message-Id: <20231115152902.851715-3-f.suligoi@asem.it>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231115152902.851715-1-f.suligoi@asem.it>
References: <20231115152902.851715-1-f.suligoi@asem.it>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 15 Nov 2023 15:29:06.0725 (UTC) FILETIME=[78C2AD50:01DA17D8]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001A6:EE_|PAXPR01MB8853:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 205e32c2-0ce3-4a64-cb25-08dbe5ef9ca2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	GrYzm8+mVZ/DxfEVhZGveDoZHZWuu/XY5KcQ8aG8jb5C4nU0Mg3lhRuWIIMuHerHlKaGcYsQVYfg98NLE31i9VYe7wC/+5iqJ731KfcUHJnkl+58bJMKAs8gMF0CDodpnFZWc72kPYlSMCyV+6XdtE8gwAPfCzXvbeGjvZemKK/RSu4mUf8u3TdKZkyPvR3wgFELS5nlyvZoa+PBQGJZuhWXBYqYiBMODGilTQ16CBepM+W2MIvbyqo1OtRkDXLmFsSY/fmzelIeCQrpql85clmhCiyI0b6Lpxr2/Xr0KCJCu0FWlCkPuzQWsBrosQfiMiFHt0mn1SdjXM3aF4YjkNn5Ijf//n6VkB5c0P95WbhdcAbJ265YNA2nIpPEg7Ii4/GbdnqioSNMMvXH6+KjiMzbMloevej3S5lUvHx5/s+nWAM97bbK+IN8EyOlv3+ItvLKXLTWKX49IhEXXkO/zl5CacGxCp8KslxS4o5QXDC0T51yzi4pYG17DVDd8Hlhfeopp6Gt6RKX3c6Mt5RhNTCfdyZ4+u5IUt5KqME25L/yN6MZ0Il8VXFAVhHsdd4roEV+nvS+fm7XSKNYJSV6NfaRUOJHQqLaBSFHapfU01/UPIh2QesaRcZXdpW2KjXqrkYvl2k081K2gQi4mjHXgDxv5m8awO6YMHPmacp7MwE2RJ0DzI4M4W9ATTBusvFlv4MoEDHLXxhbwsw4ZvPhbv9DBRNSoVreOe3QonkjVy72wgwpYlJZLz24f8w2AdUWezWD2ti17ax9np1kuh/8Kg==
X-Forefront-Antispam-Report:
	CIP:151.1.184.193;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:asas054.asem.intra;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(396003)(39850400004)(376002)(346002)(136003)(230273577357003)(230173577357003)(230922051799003)(451199024)(1800799009)(186009)(82310400011)(64100799003)(46966006)(36840700001)(316002)(70206006)(450100002)(70586007)(478600001)(966005)(40480700001)(2616005)(5660300002)(6666004)(8676002)(110136005)(8936002)(4326008)(30864003)(26005)(1076003)(107886003)(2906002)(336012)(83380400001)(47076005)(41300700001)(36860700001)(81166007)(86362001)(82740400003)(356005)(36756003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: asem.it
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2023 15:29:08.9041
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 205e32c2-0ce3-4a64-cb25-08dbe5ef9ca2
X-MS-Exchange-CrossTenant-Id: d0a766c6-7992-4344-a4a2-a467a7bb1ed2
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d0a766c6-7992-4344-a4a2-a467a7bb1ed2;Ip=[151.1.184.193];Helo=[asas054.asem.intra]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001A6.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR01MB8853

The Monolithic Power (MPS) MP3309C is a WLED step-up converter, featuring a
programmable switching frequency to optimize efficiency.
The brightness can be controlled either by I2C commands (called "analog"
mode) or by a PWM input signal (PWM mode).
This driver supports both modes.

For DT configuration details, please refer to:
- Documentation/devicetree/bindings/leds/backlight/mps,mp3309c.yaml

The datasheet is available at:
- https://www.monolithicpower.com/en/mp3309c.html

Signed-off-by: Flavio Suligoi <f.suligoi@asem.it>
---
 MAINTAINERS                       |   7 +
 drivers/video/backlight/Kconfig   |  11 +
 drivers/video/backlight/Makefile  |   1 +
 drivers/video/backlight/mp3309c.c | 443 ++++++++++++++++++++++++++++++
 4 files changed, 462 insertions(+)
 create mode 100644 drivers/video/backlight/mp3309c.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 5c9f868e13b6..d033c2a2d120 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14657,6 +14657,13 @@ S:	Maintained
 F:	Documentation/driver-api/tty/moxa-smartio.rst
 F:	drivers/tty/mxser.*
 
+MP3309C BACKLIGHT DRIVER
+M:	Flavio Suligoi <f.suligoi@asem.it>
+L:	dri-devel@lists.freedesktop.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/leds/backlight/mps,mp3309c.yaml
+F:	drivers/video/backlight/mp3309c.c
+
 MR800 AVERMEDIA USB FM RADIO DRIVER
 M:	Alexey Klimov <klimov.linux@gmail.com>
 L:	linux-media@vger.kernel.org
diff --git a/drivers/video/backlight/Kconfig b/drivers/video/backlight/Kconfig
index 51387b1ef012..1144a54a35c0 100644
--- a/drivers/video/backlight/Kconfig
+++ b/drivers/video/backlight/Kconfig
@@ -402,6 +402,17 @@ config BACKLIGHT_LP8788
 	help
 	  This supports TI LP8788 backlight driver.
 
+config BACKLIGHT_MP3309C
+	tristate "Backlight Driver for MPS MP3309C"
+	depends on I2C && PWM
+	select REGMAP_I2C
+	help
+	  This supports MPS MP3309C backlight WLED driver in both PWM and
+	  analog/I2C dimming modes.
+
+	  To compile this driver as a module, choose M here: the module will
+	  be called mp3309c.
+
 config BACKLIGHT_PANDORA
 	tristate "Backlight driver for Pandora console"
 	depends on TWL4030_CORE
diff --git a/drivers/video/backlight/Makefile b/drivers/video/backlight/Makefile
index f72e1c3c59e9..1af583de665b 100644
--- a/drivers/video/backlight/Makefile
+++ b/drivers/video/backlight/Makefile
@@ -44,6 +44,7 @@ obj-$(CONFIG_BACKLIGHT_LP855X)		+= lp855x_bl.o
 obj-$(CONFIG_BACKLIGHT_LP8788)		+= lp8788_bl.o
 obj-$(CONFIG_BACKLIGHT_LV5207LP)	+= lv5207lp.o
 obj-$(CONFIG_BACKLIGHT_MAX8925)		+= max8925_bl.o
+obj-$(CONFIG_BACKLIGHT_MP3309C)		+= mp3309c.o
 obj-$(CONFIG_BACKLIGHT_MT6370)		+= mt6370-backlight.o
 obj-$(CONFIG_BACKLIGHT_OMAP1)		+= omap1_bl.o
 obj-$(CONFIG_BACKLIGHT_PANDORA)		+= pandora_bl.o
diff --git a/drivers/video/backlight/mp3309c.c b/drivers/video/backlight/mp3309c.c
new file mode 100644
index 000000000000..3fe4469ef43f
--- /dev/null
+++ b/drivers/video/backlight/mp3309c.c
@@ -0,0 +1,443 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Driver for MPS MP3309C White LED driver with I2C interface
+ *
+ * This driver support both analog (by I2C commands) and PWM dimming control
+ * modes.
+ *
+ * Copyright (C) 2023 ASEM Srl
+ * Author: Flavio Suligoi <f.suligoi@asem.it>
+ *
+ * Based on pwm_bl.c
+ */
+
+#include <linux/backlight.h>
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
+#include <linux/i2c.h>
+#include <linux/pwm.h>
+#include <linux/regmap.h>
+
+#define REG_I2C_0	0x00
+#define REG_I2C_1	0x01
+
+#define REG_I2C_0_EN	0x80
+#define REG_I2C_0_D0	0x40
+#define REG_I2C_0_D1	0x20
+#define REG_I2C_0_D2	0x10
+#define REG_I2C_0_D3	0x08
+#define REG_I2C_0_D4	0x04
+#define REG_I2C_0_RSRV1	0x02
+#define REG_I2C_0_RSRV2	0x01
+
+#define REG_I2C_1_RSRV1	0x80
+#define REG_I2C_1_DIMS	0x40
+#define REG_I2C_1_SYNC	0x20
+#define REG_I2C_1_OVP0	0x10
+#define REG_I2C_1_OVP1	0x08
+#define REG_I2C_1_VOS	0x04
+#define REG_I2C_1_LEDO	0x02
+#define REG_I2C_1_OTP	0x01
+
+#define ANALOG_I2C_NUM_LEVELS	32		/* 0..31 */
+#define ANALOG_I2C_REG_MASK	0x7c
+
+#define MP3309C_PWM_DEFAULT_NUM_LEVELS	256	/* 0..255 */
+
+enum mp3309c_status_value {
+	FIRST_POWER_ON,
+	BACKLIGHT_OFF,
+	BACKLIGHT_ON,
+};
+
+enum mp3309c_dimming_mode_value {
+	DIMMING_PWM,
+	DIMMING_ANALOG_I2C,
+};
+
+struct mp3309c_platform_data {
+	unsigned int max_brightness;
+	unsigned int default_brightness;
+	unsigned int *levels;
+	u8  dimming_mode;
+	u8  over_voltage_protection;
+	bool sync_mode;
+	u8 status;
+};
+
+struct mp3309c_chip {
+	struct device *dev;
+	struct mp3309c_platform_data *pdata;
+	struct backlight_device *bl;
+	struct gpio_desc *enable_gpio;
+	struct regmap *regmap;
+	struct pwm_device *pwmd;
+};
+
+static const struct regmap_config mp3309c_regmap = {
+	.name = "mp3309c_regmap",
+	.reg_bits = 8,
+	.reg_stride = 1,
+	.val_bits = 8,
+	.max_register = REG_I2C_1,
+};
+
+static int mp3309c_enable_device(struct mp3309c_chip *chip)
+{
+	u8 reg_val;
+	int ret;
+
+	/* I2C register #0 - Device enable */
+	ret = regmap_update_bits(chip->regmap, REG_I2C_0, REG_I2C_0_EN,
+				 REG_I2C_0_EN);
+	if (ret)
+		return ret;
+
+	/*
+	 * I2C register #1 - Set working mode:
+	 *  - set one of the two dimming mode:
+	 *    - PWM dimming using an external PWM dimming signal
+	 *    - analog dimming using I2C commands
+	 *  - enable/disable synchronous mode
+	 *  - set overvoltage protection (OVP)
+	 */
+	reg_val = 0x00;
+	if (chip->pdata->dimming_mode == DIMMING_PWM)
+		reg_val |= REG_I2C_1_DIMS;
+	if (chip->pdata->sync_mode)
+		reg_val |= REG_I2C_1_SYNC;
+	reg_val |= chip->pdata->over_voltage_protection;
+	ret = regmap_write(chip->regmap, REG_I2C_1, reg_val);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static int mp3309c_bl_update_status(struct backlight_device *bl)
+{
+	struct mp3309c_chip *chip = bl_get_data(bl);
+	int brightness = backlight_get_brightness(bl);
+	struct pwm_state pwmstate;
+	unsigned int analog_val, bits_val;
+	int i, ret;
+
+	if (chip->pdata->dimming_mode == DIMMING_PWM) {
+		/*
+		 * PWM control mode
+		 */
+		pwm_get_state(chip->pwmd, &pwmstate);
+		pwm_set_relative_duty_cycle(&pwmstate,
+					    chip->pdata->levels[brightness],
+					    chip->pdata->levels[chip->pdata->max_brightness]);
+		pwmstate.enabled = true;
+		ret = pwm_apply_state(chip->pwmd, &pwmstate);
+		if (ret)
+			return ret;
+
+		switch (chip->pdata->status) {
+		case FIRST_POWER_ON:
+		case BACKLIGHT_OFF:
+			/*
+			 * After 20ms of low pwm signal level, the chip turns
+			 * off automatically. In this case, before enabling the
+			 * chip again, we must wait about 10ms for pwm signal to
+			 * stabilize.
+			 */
+			if (brightness > 0) {
+				msleep(10);
+				mp3309c_enable_device(chip);
+				chip->pdata->status = BACKLIGHT_ON;
+			} else {
+				chip->pdata->status = BACKLIGHT_OFF;
+			}
+			break;
+		case BACKLIGHT_ON:
+			if (brightness == 0)
+				chip->pdata->status = BACKLIGHT_OFF;
+			break;
+		}
+	} else {
+		/*
+		 * Analog (by I2C command) control mode
+		 *
+		 * The first time, before setting brightness, we must enable the
+		 * device
+		 */
+		if (chip->pdata->status == FIRST_POWER_ON)
+			mp3309c_enable_device(chip);
+
+		/*
+		 * Dimming mode I2C command (fixed dimming range 0..31)
+		 *
+		 * The 5 bits of the dimming analog value D4..D0 is allocated
+		 * in the I2C register #0, in the following way:
+		 *
+		 *     +--+--+--+--+--+--+--+--+
+		 *     |EN|D0|D1|D2|D3|D4|XX|XX|
+		 *     +--+--+--+--+--+--+--+--+
+		 */
+		analog_val = brightness;
+		bits_val = 0;
+		for (i = 0; i <= 5; i++)
+			bits_val += ((analog_val >> i) & 0x01) << (6 - i);
+		ret = regmap_update_bits(chip->regmap, REG_I2C_0,
+					 ANALOG_I2C_REG_MASK, bits_val);
+		if (ret)
+			return ret;
+
+		if (brightness > 0)
+			chip->pdata->status = BACKLIGHT_ON;
+		else
+			chip->pdata->status = BACKLIGHT_OFF;
+	}
+
+	return 0;
+}
+
+static const struct backlight_ops mp3309c_bl_ops = {
+	.update_status = mp3309c_bl_update_status,
+};
+
+static int pm3309c_parse_dt_node(struct mp3309c_chip *chip,
+				 struct mp3309c_platform_data *pdata)
+{
+	struct device_node *node = chip->dev->of_node;
+	struct property *prop_pwms, *prop_levels;
+	int length = 0;
+	int ret, i;
+	unsigned int num_levels, tmp_value;
+
+	if (!node) {
+		dev_err(chip->dev, "failed to get DT node\n");
+		return -ENODEV;
+	}
+
+	/*
+	 * Dimming mode: the MP3309C provides two dimming control mode:
+	 *
+	 * - PWM mode
+	 * - Analog by I2C control mode (default)
+	 *
+	 * I2C control mode is assumed as default but, if the pwms property is
+	 * found in the backlight node, the mode switches to PWM mode.
+	 */
+	pdata->dimming_mode = DIMMING_ANALOG_I2C;
+	prop_pwms = of_find_property(node, "pwms", &length);
+	if (prop_pwms) {
+		chip->pwmd = devm_pwm_get(chip->dev, NULL);
+		if (IS_ERR(chip->pwmd))
+			return dev_err_probe(chip->dev, PTR_ERR(chip->pwmd),
+					     "error getting pwm data\n");
+		pdata->dimming_mode = DIMMING_PWM;
+		pwm_apply_args(chip->pwmd);
+	}
+
+	/*
+	 * In I2C control mode the dimming levels (0..31) are fixed by the
+	 * hardware, while in PWM control mode they can be chosen by the user,
+	 * to allow nonlinear mappings.
+	 */
+	if  (pdata->dimming_mode == DIMMING_ANALOG_I2C) {
+		/*
+		 * Analog (by I2C commands) control mode: fixed 0..31 brightness
+		 * levels
+		 */
+		num_levels = ANALOG_I2C_NUM_LEVELS;
+
+		/* Enable GPIO used in I2C dimming mode only */
+		chip->enable_gpio = devm_gpiod_get(chip->dev, "enable",
+						   GPIOD_OUT_HIGH);
+		if (IS_ERR(chip->enable_gpio))
+			return dev_err_probe(chip->dev,
+					     PTR_ERR(chip->enable_gpio),
+					     "error getting enable gpio\n");
+	} else {
+		/*
+		 * PWM control mode: check for brightness level in DT
+		 */
+		prop_levels = of_find_property(node, "brightness-levels",
+					       &length);
+		if (prop_levels) {
+			/* Read brightness levels from DT */
+			num_levels = length / sizeof(u32);
+			if (num_levels < 2)
+				return -EINVAL;
+		} else {
+			/* Use default brightness levels */
+			num_levels = MP3309C_PWM_DEFAULT_NUM_LEVELS;
+		}
+	}
+
+	/* Fill brightness levels array */
+	pdata->levels = devm_kcalloc(chip->dev, num_levels,
+				     sizeof(*pdata->levels), GFP_KERNEL);
+	if (!pdata->levels)
+		return -ENOMEM;
+	if (prop_levels) {
+		ret = of_property_read_u32_array(node, "brightness-levels",
+						 pdata->levels,
+						 num_levels);
+		if (ret < 0)
+			return ret;
+	} else {
+		for (i = 0; i < num_levels; i++)
+			pdata->levels[i] = i;
+	}
+
+	pdata->max_brightness = num_levels - 1;
+
+	ret = of_property_read_u32(node, "default-brightness",
+				   &pdata->default_brightness);
+	if (ret)
+		pdata->default_brightness = pdata->max_brightness;
+	if (pdata->default_brightness > pdata->max_brightness) {
+		dev_err(chip->dev,
+			"default brightness exceeds max brightness\n");
+		pdata->default_brightness = pdata->max_brightness;
+	}
+
+	/*
+	 * Over-voltage protection (OVP)
+	 *
+	 * This (optional) property values are:
+	 *
+	 *  - 13.5V
+	 *  - 24V
+	 *  - 35.5V (hardware default setting)
+	 *
+	 * If missing, the default value for OVP is 35.5V
+	 */
+	pdata->over_voltage_protection = REG_I2C_1_OVP1;
+	if (!of_property_read_u32(node, "mps,overvoltage-protection-microvolt",
+				  &tmp_value)) {
+		switch (tmp_value) {
+		case 13500000:
+			pdata->over_voltage_protection = 0x00;
+			break;
+		case 24000000:
+			pdata->over_voltage_protection = REG_I2C_1_OVP0;
+			break;
+		case 35500000:
+			pdata->over_voltage_protection = REG_I2C_1_OVP1;
+			break;
+		default:
+			return -EINVAL;
+		}
+	}
+
+	/* Synchronous (default) and non-synchronous mode */
+	pdata->sync_mode = true;
+	if (of_property_read_bool(node, "mps,no-sync-mode"))
+		pdata->sync_mode = false;
+
+	return 0;
+}
+
+static int mp3309c_probe(struct i2c_client *client)
+{
+	struct mp3309c_platform_data *pdata = dev_get_platdata(&client->dev);
+	struct mp3309c_chip *chip;
+	struct backlight_properties props;
+	struct pwm_state pwmstate;
+	int ret;
+
+	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C)) {
+		dev_err(&client->dev, "failed to check i2c functionality\n");
+		return -EOPNOTSUPP;
+	}
+
+	chip = devm_kzalloc(&client->dev, sizeof(*chip), GFP_KERNEL);
+	if (!chip)
+		return -ENOMEM;
+
+	chip->dev = &client->dev;
+
+	chip->regmap = devm_regmap_init_i2c(client, &mp3309c_regmap);
+	if (IS_ERR(chip->regmap))
+		return dev_err_probe(&client->dev, PTR_ERR(chip->regmap),
+				     "failed to allocate register map\n");
+
+	i2c_set_clientdata(client, chip);
+
+	if (!pdata) {
+		pdata = devm_kzalloc(chip->dev, sizeof(*pdata), GFP_KERNEL);
+		if (!pdata)
+			return -ENOMEM;
+
+		ret = pm3309c_parse_dt_node(chip, pdata);
+		if (ret)
+			return ret;
+	}
+	chip->pdata = pdata;
+
+	/* Backlight properties */
+	props.brightness = pdata->default_brightness;
+	props.max_brightness = pdata->max_brightness;
+	props.scale = BACKLIGHT_SCALE_LINEAR;
+	props.type = BACKLIGHT_RAW;
+	props.power = FB_BLANK_UNBLANK;
+	props.fb_blank = FB_BLANK_UNBLANK;
+	chip->bl = devm_backlight_device_register(chip->dev, "mp3309c",
+						  chip->dev, chip,
+						  &mp3309c_bl_ops, &props);
+	if (IS_ERR(chip->bl))
+		return dev_err_probe(chip->dev, PTR_ERR(chip->bl),
+				     "error registering backlight device\n");
+
+	/* In PWM dimming mode, enable pwm device */
+	if (chip->pdata->dimming_mode == DIMMING_PWM) {
+		pwm_init_state(chip->pwmd, &pwmstate);
+		pwm_set_relative_duty_cycle(&pwmstate,
+					    chip->pdata->default_brightness,
+					    chip->pdata->max_brightness);
+		pwmstate.enabled = true;
+		ret = pwm_apply_state(chip->pwmd, &pwmstate);
+		if (ret)
+			return dev_err_probe(chip->dev, ret,
+					     "error setting pwm device\n");
+	}
+
+	chip->pdata->status = FIRST_POWER_ON;
+	backlight_update_status(chip->bl);
+
+	return 0;
+}
+
+static void mp3309c_remove(struct i2c_client *client)
+{
+	struct mp3309c_chip *chip = i2c_get_clientdata(client);
+	struct backlight_device *bl = chip->bl;
+
+	bl->props.power = FB_BLANK_POWERDOWN;
+	bl->props.brightness = 0;
+	backlight_update_status(chip->bl);
+}
+
+static const struct of_device_id mp3309c_match_table[] = {
+	{ .compatible = "mps,mp3309c", },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, mp3309c_match_table);
+
+static const struct i2c_device_id mp3309c_id[] = {
+	{ "mp3309c", 0 },
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, mp3309c_id);
+
+static struct i2c_driver mp3309c_i2c_driver = {
+	.driver	= {
+			.name		= KBUILD_MODNAME,
+			.of_match_table	= mp3309c_match_table,
+	},
+	.probe		= mp3309c_probe,
+	.remove		= mp3309c_remove,
+	.id_table	= mp3309c_id,
+};
+
+module_i2c_driver(mp3309c_i2c_driver);
+
+MODULE_DESCRIPTION("Backlight Driver for MPS MP3309C");
+MODULE_AUTHOR("Flavio Suligoi <f.suligoi@asem.it>");
+MODULE_LICENSE("GPL");
-- 
2.34.1


