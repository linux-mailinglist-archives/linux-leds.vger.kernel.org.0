Return-Path: <linux-leds+bounces-8201-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id hvoxDMe5C2q3LgUAu9opvQ
	(envelope-from <linux-leds+bounces-8201-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Tue, 19 May 2026 03:15:51 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F69F575F38
	for <lists+linux-leds@lfdr.de>; Tue, 19 May 2026 03:15:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7F49A301FE7E
	for <lists+linux-leds@lfdr.de>; Tue, 19 May 2026 01:15:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3B332F49FD;
	Tue, 19 May 2026 01:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="Cfp7oGZV"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0b-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD7DD2DFF04;
	Tue, 19 May 2026 01:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779153289; cv=none; b=ST5nS6TihVr7buzdFasP/n/3IpHsYJ7LyVzB9IxGGwBQb4epVDssqNhz8jvlXb7JHG4os2qBpJDezwq9yS45XTqr+uJlWZl8RCAErLpwfhO8sWh/5UqFtbCPyHpZ1lIKfWDN7WPqa+pDB9td5ABVXuDMZdigYEx4+nqVLdlEnr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779153289; c=relaxed/simple;
	bh=Gg2Bd9zFX8/HDyuHb1hX15QesneVQZqt2qtc9TJmc6A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=csc38J7E4bMqsI79NMKwX+rHjrlOn1zhs0L0RAK4e4X4+WPTVCavhsaCN2gi8fM36SpdGW9pmvDj1srtUWcZB+jEHNWrTGd6bac7ptcsAO/fJY5/joETeTjJQpBWAlqCneHQEUbdZNTnbYwO522+hAy+LlABDjr5XrHVBWZt2r0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=Cfp7oGZV; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0375855.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64IJFR7X175028;
	Mon, 18 May 2026 21:14:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=g4MsK
	W2ShmHlWHfvi3zMZLAoslUSDrXZqxIjqlQOCys=; b=Cfp7oGZVaOHX8AQ3DIKrm
	yHH1Lyb4MVkRiL85D6RSSrEPv1P/CKQXPe+vzz3tk7NWe/ig3+78K467hfWHjBpn
	vyq8YFyYsLWi+YQ++co4xDUJG241W2PAorCY02LNu1w6hoiutIwptkEdN+cgCyJE
	j/fNDcmgymLl755yY/FMDp9P9N2lOa3OEMAGF1oDSbdNHcvaOL1756j6genjnF/h
	FFRfNp0Mg6Z6iuvPvw7clGzrquGOcdFcEwSsVQyCp+RQNXUCk5CwpbKMLywEQk5Z
	nSnyLiQueg5Lbf/AseY3DfeGZ3tW4TsjAxXu6tHWO31h2AowhG6I0qBhUy0LicWB
	Q==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 4e76wd67ma-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 May 2026 21:14:44 -0400 (EDT)
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 64J1EhNO049177
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 18 May 2026 21:14:43 -0400
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by ASHBMBX8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.37; Mon, 18 May
 2026 21:14:43 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.2.1748.37 via Frontend
 Transport; Mon, 18 May 2026 21:14:43 -0400
Received: from HYB-7P5GeKnsiiX.ad.analog.com (HYB-7P5GeKnsiiX.ad.analog.com [10.118.4.71])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 64J1EMo6020456;
	Mon, 18 May 2026 21:14:33 -0400
From: Edelweise Escala <edelweise.escala@analog.com>
Date: Tue, 19 May 2026 09:14:19 +0800
Subject: [PATCH v8 2/2] leds: ltc3220: Add Support for LTC3220 18 channel
 LED Driver
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260519-ltc3220-driver-v8-2-e1771c1733f7@analog.com>
References: <20260519-ltc3220-driver-v8-0-e1771c1733f7@analog.com>
In-Reply-To: <20260519-ltc3220-driver-v8-0-e1771c1733f7@analog.com>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: <linux-leds@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Edelweise Escala
	<edelweise.escala@analog.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779153262; l=15959;
 i=edelweise.escala@analog.com; s=20260106; h=from:subject:message-id;
 bh=Gg2Bd9zFX8/HDyuHb1hX15QesneVQZqt2qtc9TJmc6A=;
 b=xHDbtEB2xDEizKHb1D9H6B07MUgXf+E1MLDxtOAfKENs9VJ3tAMYgJ2N20Ad98p6tiAqE8ovl
 jCm6tLkp8qrB3u05o5NnqLEvuuuvCmQvewATWBqxtdknO9nmqw/1Q+E
X-Developer-Key: i=edelweise.escala@analog.com; a=ed25519;
 pk=lf5HLFe8ZeQjXZgkBkFMK+u9qH5/tqZhCIushTKduNQ=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDAwOSBTYWx0ZWRfX7f2KiEYwSAjU
 lV9TNVSV6HklLuENCE7KOSwhpVdAGCKfA6kR2+veNYDdJRQsSbki/Bi6A++bAxwPMzm7tlyv0+X
 7UEC+0zE+Cvb7mdaivesU3y3OMByeLO2QhgfRStHzSi57xjdwBVQlTyJJI4icrD5RxCH7qrf3Uk
 NDGYeZtACwdxlmuVVgotZ2OFrwahtwidw+GFPAeHAH5ez+HIPlGk86tRuVQ4wUDDbFqJH62EmaX
 gmTVTaq5oq8o0Sffasqh/FLvFqa4PFfBR3asCr8vmqabyF6v7fNr+a68yVmGwcMQLS33RutygIB
 o+qiPZrMzAtkGcSkBr7csiJEoX8diOGIngwqx18B7frkehkn3g/mLujmAP8DV4uMbzGzhax0NB4
 Q5fBoucFafv1acgSjej/zCVhmM7vvpgydUMaLPUaeeNA7ATw9ek3BvIFQRm4gXSbqnW4jjjvKlO
 EU5JzRwcIE97XRthbpQ==
X-Authority-Analysis: v=2.4 cv=bfRbluPB c=1 sm=1 tr=0 ts=6a0bb984 cx=c_pps
 a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=0sLvza09kfJOxVLZPwjg:22 a=N--XFCr6TIEc_64PeIT2:22 a=gAnH3GRIAAAA:8
 a=VwQbUJbxAAAA:8 a=hYaNXiyfE8bdEU5phHsA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: DNqRnBHT6n3tXbdadagI5jKV4iFeUeXk
X-Proofpoint-GUID: DNqRnBHT6n3tXbdadagI5jKV4iFeUeXk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 malwarescore=0
 impostorscore=0 spamscore=0 phishscore=0 suspectscore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605190009
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[analog.com,quarantine];
	R_DKIM_ALLOW(-0.20)[analog.com:s=DKIM];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[analog.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[edelweise.escala@analog.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-8201-lists,linux-leds=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,analog.com:url,analog.com:email,analog.com:mid,analog.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 0F69F575F38
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add driver for the LTC3220 18-channel LED driver
with I2C interface, individual brightness control, and hardware-assisted
blink/gradation features.

Signed-off-by: Edelweise Escala <edelweise.escala@analog.com>
---
 MAINTAINERS                 |   1 +
 drivers/leds/Kconfig        |  12 ++
 drivers/leds/Makefile       |   1 +
 drivers/leds/leds-ltc3220.c | 413 ++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 427 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5c10cc3e3022..7467537938bf 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14961,6 +14961,7 @@ L:	linux-leds@vger.kernel.org
 S:	Maintained
 W:	https://ez.analog.com/linux-software-drivers
 F:	Documentation/devicetree/bindings/leds/adi,ltc3220.yaml
+F:	drivers/leds/leds-ltc3220.c
 
 LTC4282 HARDWARE MONITOR DRIVER
 M:	Nuno Sa <nuno.sa@analog.com>
diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index 597d7a79c988..f00cdc11c978 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -1001,6 +1001,18 @@ config LEDS_ST1202
 	  Say Y to enable support for LEDs connected to LED1202
 	  LED driver chips accessed via the I2C bus.
 
+config LEDS_LTC3220
+	tristate "LED Driver for Analog Devices Inc. LTC3220"
+	depends on I2C && LEDS_CLASS
+	help
+	  Say Y to enable support for the Analog Devices LTC3220
+	  18-channel LED controller with I2C interface.
+	  The driver supports individual LED brightness control (64 steps),
+	  hardware-assisted blinking and gradation effects.
+
+	  To compile this driver as a module, choose M here: the module will
+	  be called leds-ltc3220.
+
 config LEDS_TPS6105X
 	tristate "LED support for TI TPS6105X"
 	depends on LEDS_CLASS
diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
index 8fdb45d5b439..5301568d9e00 100644
--- a/drivers/leds/Makefile
+++ b/drivers/leds/Makefile
@@ -61,6 +61,7 @@ obj-$(CONFIG_LEDS_LP8788)		+= leds-lp8788.o
 obj-$(CONFIG_LEDS_LP8860)		+= leds-lp8860.o
 obj-$(CONFIG_LEDS_LP8864)		+= leds-lp8864.o
 obj-$(CONFIG_LEDS_LT3593)		+= leds-lt3593.o
+obj-$(CONFIG_LEDS_LTC3220)		+= leds-ltc3220.o
 obj-$(CONFIG_LEDS_MAX5970)		+= leds-max5970.o
 obj-$(CONFIG_LEDS_MAX77650)		+= leds-max77650.o
 obj-$(CONFIG_LEDS_MAX77705)		+= leds-max77705.o
diff --git a/drivers/leds/leds-ltc3220.c b/drivers/leds/leds-ltc3220.c
new file mode 100644
index 000000000000..0941acf39118
--- /dev/null
+++ b/drivers/leds/leds-ltc3220.c
@@ -0,0 +1,413 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * LTC3220 18-Channel LED Driver
+ *
+ * Copyright 2026 Analog Devices Inc.
+ *
+ * Author: Edelweise Escala <edelweise.escala@analog.com>
+ */
+
+#include <linux/bitfield.h>
+#include <linux/delay.h>
+#include <linux/device.h>
+#include <linux/gpio/consumer.h>
+#include <linux/i2c.h>
+#include <linux/leds.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/regmap.h>
+#include <linux/types.h>
+
+/* LTC3220 Registers */
+#define LTC3220_COMMAND_REG				0x00
+#define   LTC3220_QUICK_WRITE_MASK			BIT(0)
+#define   LTC3220_SHUTDOWN_MASK				BIT(3)
+
+#define LTC3220_ULED_REG(x)				(0x01 + (x))
+#define   LTC3220_LED_CURRENT_MASK			GENMASK(5, 0)
+#define   LTC3220_LED_MODE_MASK				GENMASK(7, 6)
+
+#define LTC3220_GRAD_BLINK_REG				0x13
+#define   LTC3220_GRADATION_MASK			GENMASK(2, 0)
+#define   LTC3220_GRADATION_DIRECTION_MASK		BIT(0)
+#define   LTC3220_GRADATION_PERIOD_MASK			GENMASK(2, 1)
+#define   LTC3220_BLINK_MASK				GENMASK(4, 3)
+
+#define LTC3220_NUM_LEDS				18
+
+#define LTC3220_GRADATION_START_VALUE			128
+#define LTC3220_GRADATION_RAMP_TIME_240MS		240
+#define LTC3220_GRADATION_RAMP_TIME_480MS		480
+
+#define LTC3220_BLINK_ON_156MS				156
+#define LTC3220_BLINK_ON_625MS				625
+#define LTC3220_BLINK_PERIOD_1250MS			1250
+#define LTC3220_BLINK_PERIOD_2500MS			2500
+
+#define LTC3220_BLINK_SHORT_ON_TIME			BIT(0)
+#define LTC3220_BLINK_LONG_PERIOD			BIT(1)
+
+enum ltc3220_blink_mode {
+	LTC3220_BLINK_MODE_625MS_1250MS,
+	LTC3220_BLINK_MODE_156MS_1250MS,
+	LTC3220_BLINK_MODE_625MS_2500MS,
+	LTC3220_BLINK_MODE_156MS_2500MS
+};
+
+enum ltc3220_gradation_mode {
+	LTC3220_GRADATION_MODE_DISABLED,
+	LTC3220_GRADATION_MODE_240MS_RAMP_TIME,
+	LTC3220_GRADATION_MODE_480MS_RAMP_TIME,
+	LTC3220_GRADATION_MODE_960MS_RAMP_TIME
+};
+
+static bool ltc3220_volatile_reg(struct device *dev, unsigned int reg)
+{
+	return reg == LTC3220_GRAD_BLINK_REG;
+}
+
+static const struct regmap_config ltc3220_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+	.max_register = LTC3220_GRAD_BLINK_REG,
+	.cache_type = REGCACHE_FLAT_S,
+	.volatile_reg = ltc3220_volatile_reg,
+};
+
+struct ltc3220_uled_cfg {
+	struct led_classdev led_cdev;
+	u8 reg_value;
+	u8 led_index;
+};
+
+struct ltc3220 {
+	struct ltc3220_uled_cfg uled_cfg[LTC3220_NUM_LEDS];
+	struct regmap *regmap;
+	bool is_aggregated;
+};
+
+/*
+ * Set LED brightness and mode.
+ * The brightness value determines both the LED current and operating mode:
+ * 0-63:    Normal mode - LED current from 0-63 (off to full brightness)
+ * 64-127:  Blink mode - LED blinks with current level (brightness - 64)
+ * 128-191: Gradation mode - LED gradually changes brightness (brightness - 128)
+ * 192-255: GPO mode - LED operates as general purpose output (brightness - 192)
+ */
+static int ltc3220_set_led_data(struct led_classdev *led_cdev,
+				enum led_brightness brightness)
+{
+	struct ltc3220_uled_cfg *uled_cfg = container_of(led_cdev, struct ltc3220_uled_cfg,
+							 led_cdev);
+	struct ltc3220 *ltc3220 = container_of(uled_cfg, struct ltc3220,
+					       uled_cfg[uled_cfg->led_index]);
+	int ret;
+
+	ret = regmap_write(ltc3220->regmap, LTC3220_ULED_REG(uled_cfg->led_index),
+			   brightness);
+	if (ret)
+		return ret;
+
+	uled_cfg->reg_value = brightness;
+
+	/*
+	 * When aggregated LED mode is enabled, writing to LED 1 updates all
+	 * LEDs simultaneously via quick-write mode. Update cached values for
+	 * all LEDs to reflect the synchronized state.
+	 * See Documentation/devicetree/bindings/leds/adi,ltc3220.yaml for how
+	 * to configure aggregated LED mode.
+	 */
+	if (ltc3220->is_aggregated && uled_cfg->led_index == 0) {
+		for (int i = 0; i < LTC3220_NUM_LEDS; i++)
+			ltc3220->uled_cfg[i].reg_value = brightness;
+	}
+
+	return 0;
+}
+
+static enum led_brightness ltc3220_get_led_data(struct led_classdev *led_cdev)
+{
+	struct ltc3220_uled_cfg *uled_cfg = container_of(led_cdev, struct ltc3220_uled_cfg,
+							 led_cdev);
+
+	return uled_cfg->reg_value;
+}
+
+/*
+ * LTC3220 pattern support for hardware-assisted breathing/gradation.
+ * The hardware supports 3 gradation ramp time 240ms, 480ms, 960ms)
+ * and can ramp up or down.
+ *
+ * Pattern array interpretation:
+ *   pattern[0].brightness = start brightness (0-63)
+ *   pattern[0].delta_t = ramp time in milliseconds
+ *   pattern[1].brightness = end brightness (0-63)
+ *   pattern[1].delta_t = (optional, can be 0 or same as pattern[0].delta_t)
+ */
+static int ltc3220_pattern_set(struct led_classdev *led_cdev,
+			       struct led_pattern *pattern,
+			       u32 len, int repeat)
+{
+	struct ltc3220_uled_cfg *uled_cfg = container_of(led_cdev, struct ltc3220_uled_cfg,
+							 led_cdev);
+	struct ltc3220 *ltc3220 = container_of(uled_cfg, struct ltc3220,
+					       uled_cfg[uled_cfg->led_index]);
+	u8 gradation_period;
+	u8 start_brightness;
+	u8 end_brightness;
+	u8 gradation_val;
+	bool is_increasing;
+	int ret;
+
+	if (len != 2)
+		return -EINVAL;
+
+	start_brightness = pattern[0].brightness & LTC3220_LED_CURRENT_MASK;
+	end_brightness = pattern[1].brightness & LTC3220_LED_CURRENT_MASK;
+
+	is_increasing = end_brightness > start_brightness;
+
+	if (pattern[0].delta_t == 0)
+		gradation_period = LTC3220_GRADATION_MODE_DISABLED;
+	else if (pattern[0].delta_t <= LTC3220_GRADATION_RAMP_TIME_240MS)
+		gradation_period = LTC3220_GRADATION_MODE_240MS_RAMP_TIME;
+	else if (pattern[0].delta_t <= LTC3220_GRADATION_RAMP_TIME_480MS)
+		gradation_period = LTC3220_GRADATION_MODE_480MS_RAMP_TIME;
+	else
+		gradation_period = LTC3220_GRADATION_MODE_960MS_RAMP_TIME;
+
+	gradation_val = FIELD_PREP(LTC3220_GRADATION_PERIOD_MASK, gradation_period);
+	gradation_val |= FIELD_PREP(LTC3220_GRADATION_DIRECTION_MASK, is_increasing);
+
+	ret = regmap_update_bits(ltc3220->regmap, LTC3220_GRAD_BLINK_REG,
+				 LTC3220_GRADATION_MASK, gradation_val);
+	if (ret)
+		return ret;
+
+	ret = ltc3220_set_led_data(led_cdev, start_brightness);
+	if (ret)
+		return ret;
+
+	return ltc3220_set_led_data(led_cdev, LTC3220_GRADATION_START_VALUE + end_brightness);
+}
+
+static int ltc3220_pattern_clear(struct led_classdev *led_cdev)
+{
+	struct ltc3220_uled_cfg *uled_cfg = container_of(led_cdev, struct ltc3220_uled_cfg,
+							 led_cdev);
+	struct ltc3220 *ltc3220 = container_of(uled_cfg, struct ltc3220,
+					       uled_cfg[uled_cfg->led_index]);
+
+	return regmap_update_bits(ltc3220->regmap, LTC3220_GRAD_BLINK_REG,
+				  LTC3220_GRADATION_MASK, 0);
+}
+
+/*
+ * LTC3220 has a global blink configuration that affects all LEDs.
+ * This implementation allows per-LED blink requests, but the blink timing
+ * will be shared across all LEDs. The delay values are mapped to the
+ * hardware's discrete blink rates.
+ */
+static int ltc3220_blink_set(struct led_classdev *led_cdev,
+			     unsigned long *delay_on,
+			     unsigned long *delay_off)
+{
+	struct ltc3220_uled_cfg *uled_cfg = container_of(led_cdev, struct ltc3220_uled_cfg,
+							 led_cdev);
+	struct ltc3220 *ltc3220 = container_of(uled_cfg, struct ltc3220,
+					       uled_cfg[uled_cfg->led_index]);
+	u8 blink_mode = 0;
+
+	if (*delay_on <= LTC3220_BLINK_ON_156MS)
+		blink_mode = LTC3220_BLINK_SHORT_ON_TIME;
+
+	if (*delay_on + *delay_off > LTC3220_BLINK_PERIOD_1250MS)
+		blink_mode |= LTC3220_BLINK_LONG_PERIOD;
+
+	switch (blink_mode) {
+	case LTC3220_BLINK_MODE_625MS_1250MS:
+		*delay_on = LTC3220_BLINK_ON_625MS;
+		*delay_off = LTC3220_BLINK_PERIOD_1250MS - LTC3220_BLINK_ON_625MS;
+		break;
+	case LTC3220_BLINK_MODE_156MS_1250MS:
+		*delay_on = LTC3220_BLINK_ON_156MS;
+		*delay_off = LTC3220_BLINK_PERIOD_1250MS - LTC3220_BLINK_ON_156MS;
+		break;
+	case LTC3220_BLINK_MODE_625MS_2500MS:
+		*delay_on = LTC3220_BLINK_ON_625MS;
+		*delay_off = LTC3220_BLINK_PERIOD_2500MS - LTC3220_BLINK_ON_625MS;
+		break;
+	case LTC3220_BLINK_MODE_156MS_2500MS:
+		*delay_on = LTC3220_BLINK_ON_156MS;
+		*delay_off = LTC3220_BLINK_PERIOD_2500MS - LTC3220_BLINK_ON_156MS;
+		break;
+	}
+
+	return regmap_update_bits(ltc3220->regmap, LTC3220_GRAD_BLINK_REG,
+				  LTC3220_BLINK_MASK, blink_mode);
+}
+
+static void ltc3220_reset_gpio_action(void *data)
+{
+	struct gpio_desc *reset_gpio = data;
+
+	gpiod_set_value_cansleep(reset_gpio, 1);
+}
+
+static int ltc3220_reset(struct ltc3220 *ltc3220, struct i2c_client *client)
+{
+	struct gpio_desc *reset_gpio;
+	int ret;
+
+	reset_gpio = devm_gpiod_get_optional(&client->dev, "reset", GPIOD_OUT_HIGH);
+	if (IS_ERR(reset_gpio))
+		return dev_err_probe(&client->dev, PTR_ERR(reset_gpio), "Failed on reset GPIO\n");
+
+	if (reset_gpio) {
+		gpiod_set_value_cansleep(reset_gpio, 0);
+
+		return devm_add_action_or_reset(&client->dev, ltc3220_reset_gpio_action,
+						reset_gpio);
+	}
+
+	ret = regmap_write(ltc3220->regmap, LTC3220_COMMAND_REG, 0);
+	if (ret)
+		return ret;
+
+	for (int i = 0; i < LTC3220_NUM_LEDS; i++) {
+		ret = regmap_write(ltc3220->regmap, LTC3220_ULED_REG(i), 0);
+		if (ret)
+			return ret;
+	}
+
+	return regmap_write(ltc3220->regmap, LTC3220_GRAD_BLINK_REG, 0);
+}
+
+static int ltc3220_suspend(struct device *dev)
+{
+	struct ltc3220 *ltc3220 = i2c_get_clientdata(to_i2c_client(dev));
+
+	return regmap_update_bits(ltc3220->regmap, LTC3220_COMMAND_REG,
+				  LTC3220_SHUTDOWN_MASK, LTC3220_SHUTDOWN_MASK);
+}
+
+static int ltc3220_resume(struct device *dev)
+{
+	struct ltc3220 *ltc3220 = i2c_get_clientdata(to_i2c_client(dev));
+
+	return regmap_update_bits(ltc3220->regmap, LTC3220_COMMAND_REG,
+				  LTC3220_SHUTDOWN_MASK, 0);
+}
+
+static DEFINE_SIMPLE_DEV_PM_OPS(ltc3220_pm_ops, ltc3220_suspend, ltc3220_resume);
+
+static int ltc3220_probe(struct i2c_client *client)
+{
+	struct ltc3220 *ltc3220;
+	bool aggregated_led_found = false;
+	int num_leds = 0;
+	u8 led_index = 0;
+	int ret;
+
+	ltc3220 = devm_kzalloc(&client->dev, sizeof(*ltc3220), GFP_KERNEL);
+	if (!ltc3220)
+		return -ENOMEM;
+
+	ltc3220->regmap = devm_regmap_init_i2c(client, &ltc3220_regmap_config);
+	if (IS_ERR(ltc3220->regmap))
+		return dev_err_probe(&client->dev, PTR_ERR(ltc3220->regmap),
+				     "Failed to initialize regmap\n");
+
+	i2c_set_clientdata(client, ltc3220);
+
+	ret = ltc3220_reset(ltc3220, client);
+	if (ret)
+		return dev_err_probe(&client->dev, ret, "Failed to reset device\n");
+
+	device_for_each_child_node_scoped(&client->dev, child) {
+		struct led_init_data init_data = {};
+		struct ltc3220_uled_cfg *led;
+		u32 source;
+
+		ret = fwnode_property_read_u32(child, "reg", &source);
+		if (ret)
+			return dev_err_probe(&client->dev, ret, "Couldn't read LED address\n");
+
+		if (!source || source > LTC3220_NUM_LEDS)
+			return dev_err_probe(&client->dev, -EINVAL, "LED address out of range\n");
+
+		init_data.fwnode = child;
+		init_data.devicename = "ltc3220";
+
+		if (fwnode_property_present(child, "led-sources")) {
+			if (source != 1)
+				return dev_err_probe(&client->dev, -EINVAL,
+						     "Aggregated LED out of range\n");
+
+			if (aggregated_led_found)
+				return dev_err_probe(&client->dev, -EINVAL,
+						     "One Aggregated LED only\n");
+
+			aggregated_led_found = true;
+			ltc3220->is_aggregated = true;
+
+			ret = regmap_update_bits(ltc3220->regmap,
+						 LTC3220_COMMAND_REG,
+						 LTC3220_QUICK_WRITE_MASK,
+						 LTC3220_QUICK_WRITE_MASK);
+			if (ret)
+				return dev_err_probe(&client->dev, ret,
+						     "Failed to set quick write mode\n");
+		}
+
+		num_leds++;
+
+		/* LED node reg/index/address goes from 1 to 18 */
+		led_index = source - 1;
+		led = &ltc3220->uled_cfg[led_index];
+		led->led_index = led_index;
+		led->reg_value = 0;
+		led->led_cdev.brightness_set_blocking = ltc3220_set_led_data;
+		led->led_cdev.brightness_get = ltc3220_get_led_data;
+		led->led_cdev.max_brightness = 255;
+		led->led_cdev.blink_set = ltc3220_blink_set;
+		led->led_cdev.pattern_set = ltc3220_pattern_set;
+		led->led_cdev.pattern_clear = ltc3220_pattern_clear;
+
+		ret = devm_led_classdev_register_ext(&client->dev, &led->led_cdev, &init_data);
+		if (ret)
+			return dev_err_probe(&client->dev, ret, "Failed to register LED class\n");
+	}
+
+	/*
+	 * Aggregated LED mode uses hardware quick-write to control all 18 LEDs
+	 * simultaneously. This is mutually exclusive with individual LED control.
+	 * See Documentation/devicetree/bindings/leds/adi,ltc3220.yaml for details
+	 * on how to configure aggregated LED mode.
+	 */
+	if (aggregated_led_found && num_leds > 1)
+		return dev_err_probe(&client->dev, -EINVAL,
+				     "Aggregated LED must be the only LED node\n");
+
+	return 0;
+}
+
+static const struct of_device_id ltc3220_of_match[] = {
+	{ .compatible = "adi,ltc3220" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, ltc3220_of_match);
+
+static struct i2c_driver ltc3220_led_driver = {
+	.driver = {
+		.name = "ltc3220",
+		.of_match_table = ltc3220_of_match,
+		.pm = pm_sleep_ptr(&ltc3220_pm_ops),
+	},
+	.probe = ltc3220_probe,
+};
+module_i2c_driver(ltc3220_led_driver);
+
+MODULE_AUTHOR("Edelweise Escala <edelweise.escala@analog.com>");
+MODULE_DESCRIPTION("LED driver for LTC3220 controllers");
+MODULE_LICENSE("GPL");

-- 
2.43.0


