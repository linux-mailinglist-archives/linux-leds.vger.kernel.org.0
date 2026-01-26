Return-Path: <linux-leds+bounces-6755-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GHNHHkixdmm7UgEAu9opvQ
	(envelope-from <linux-leds+bounces-6755-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 26 Jan 2026 01:11:52 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 006FA832DE
	for <lists+linux-leds@lfdr.de>; Mon, 26 Jan 2026 01:11:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 868B03007979
	for <lists+linux-leds@lfdr.de>; Mon, 26 Jan 2026 00:11:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D7F73594F;
	Mon, 26 Jan 2026 00:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="quDiu2j8"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 646E55695;
	Mon, 26 Jan 2026 00:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769386304; cv=none; b=nYMOlxHMtwEa+ONEr83Pynl3bcZMmxff1hGMjxJoq+umblUR1qfNrl7KebNGwONxoD7sNs1j3M3WioDxH7/EBXdgXArGKWxm1pbD5Bad1h0d0yuEhUnMYjaPgqEIpInhReyfhbekve09AOAKcNnHuSHVK8pp1toEU8wKblLuq0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769386304; c=relaxed/simple;
	bh=MI57UJAgpVPOpAqj64Oz2TV/kQubDPvndZG4tj4MTxg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=tv0C6sfsUPHSuTQ8ume0OcpBwqKY64x5/vYqYW553pt8NXOoRSgmEQlgKvdqlh9eAOrOoQO5cCnz+hM8CceNnHsIS1E8S7UPYIjCEMCRssfneqHLehGbotA8hWgyxDmBupTjwOkY4/xKvtyXEWJ2OP4j5WULCiP7brrOLs4IbbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=quDiu2j8; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60PIOVKT659975;
	Sun, 25 Jan 2026 19:11:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=oWZaI
	ukWXu1eTn4U/+cGWtDSzuEIk85V6s9XucJfO8Y=; b=quDiu2j8PugXOpOy6W+66
	st3O9yzSuAc/yfmlL+VC/Hyru3G3sd0ugYiZW2uQ+Ug23pvzz9kgOf5RNk5kLGgH
	Hq3Wuhc48x1v3mK8Nqc86j5xsnMlo8AlR13LA6uBTNFEUf/IssfHnEFq895Aywg7
	324ETFDLaBw4GMFOoAKV7eCcQ2amXaIeWjdxMEPhDSS1oyglDMmMLD8vVM9AEX8s
	bFzcWaOPeFRnb4zpmPjujOh24s3uOsUiTZ7d4Qf861xLQj5kDMNubLoBM3rFtkyY
	P4DOpwwJ86zM34Nl6g/JuTZtBfEono+xJiNimHTkqgIlserON28f8gONWjKgGT+c
	w==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4bvrt3mwqj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 25 Jan 2026 19:11:33 -0500 (EST)
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 60Q0BWO8004302
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sun, 25 Jan 2026 19:11:32 -0500
Received: from ASHBCASHYB4.ad.analog.com (10.64.17.132) by
 ASHBMBX9.ad.analog.com (10.64.17.10) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.37; Sun, 25 Jan 2026 19:11:32 -0500
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by
 ASHBCASHYB4.ad.analog.com (10.64.17.132) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.37; Sun, 25 Jan 2026 19:11:32 -0500
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.1748.37 via Frontend
 Transport; Sun, 25 Jan 2026 19:11:32 -0500
Received: from HYB-7P5GeKnsiiX.ad.analog.com (HYB-7P5GeKnsiiX.ad.analog.com [10.118.4.53])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 60Q0BBnk003036;
	Sun, 25 Jan 2026 19:11:22 -0500
From: Edelweise Escala <edelweise.escala@analog.com>
Date: Mon, 26 Jan 2026 08:10:44 +0800
Subject: [PATCH v4 2/2] leds: ltc3220: Add Support for LTC3220 18 channel
 LED Driver
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260126-ltc3220-driver-v4-2-c59517206c24@analog.com>
References: <20260126-ltc3220-driver-v4-0-c59517206c24@analog.com>
In-Reply-To: <20260126-ltc3220-driver-v4-0-c59517206c24@analog.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769386271; l=15675;
 i=edelweise.escala@analog.com; s=20260106; h=from:subject:message-id;
 bh=MI57UJAgpVPOpAqj64Oz2TV/kQubDPvndZG4tj4MTxg=;
 b=i6liG/wGem/yYm+Q6SaKkj2oie/+9VoF71Gtqebf32IYKTgDrL0M7FtP3GUa39hvDW/OLJ2Ae
 4Oj98CqIEd8DcooOj6Zp1ZRcfg03dzo5adRZNzxAjiQT/x7mHfWPVd1
X-Developer-Key: i=edelweise.escala@analog.com; a=ed25519;
 pk=lf5HLFe8ZeQjXZgkBkFMK+u9qH5/tqZhCIushTKduNQ=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI2MDAwMCBTYWx0ZWRfX5kuPtuHCp9Q7
 WzyyL9WguFhsHRdUsDVzFOwahxsixKwMcsiZGhXrLb6chnQbj50JEeMP0j2/G3TTMlszSi7Ecxl
 qZfAih77Nnlh+od3x7dlgYFbP/io6Udc4ClggYkiHRDfrsOc+ZaI3Z8FdNySChg85OWmOTu4RvH
 8k405IMfWbhPIZrYbsO4q3HYrR89IMcVnmLd+/pC+usUigDu4bJEleneAHTuAhde+rMwdQZ+GwO
 /k4DH7YlcCjwBFzxypTJXklS9NFpMsKjl0ssuZa2kX2rwwlAX06q+jlr1/ZDgd+livdwxdjq3r8
 c8mTyefshgUrrhjDiEsn69KofE+u3wwhY0d8zujvjXHKJKtxiJMy8aoxaciqX3gF4v+lcl0TsIz
 348hbv7pIKc/TfcMINHjLnJpbdgQL8z1YLEjYVbfBtiDuLmG+eVyvsh2Eq7TK8uRYc1yWkXiQ0T
 8UGcE2zvfGoB29ZtKbw==
X-Proofpoint-GUID: fLVH-jXq0jioBEl52ka6oZhZnz6a4fAv
X-Authority-Analysis: v=2.4 cv=U/SfzOru c=1 sm=1 tr=0 ts=6976b135 cx=c_pps
 a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=gAnH3GRIAAAA:8 a=VwQbUJbxAAAA:8 a=hYaNXiyfE8bdEU5phHsA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: fLVH-jXq0jioBEl52ka6oZhZnz6a4fAv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-25_06,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 adultscore=0 clxscore=1015
 suspectscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601260000
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[analog.com,quarantine];
	R_DKIM_ALLOW(-0.20)[analog.com:s=DKIM];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[edelweise.escala@analog.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-6755-lists,linux-leds=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[analog.com:+]
X-Rspamd-Queue-Id: 006FA832DE
X-Rspamd-Action: no action

Add driver for the LTC3220 18-channel LED driver
with I2C interface, individual brightness control, and hardware-assisted
blink/gradation features.

Signed-off-by: Edelweise Escala <edelweise.escala@analog.com>
---
 MAINTAINERS                 |   1 +
 drivers/leds/Kconfig        |  10 +
 drivers/leds/Makefile       |   1 +
 drivers/leds/leds-ltc3220.c | 455 ++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 467 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index d640c35d1f93..fda0d2963c4f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14961,6 +14961,7 @@ L:	linux-leds@vger.kernel.org
 S:	Maintained
 W:	https://ez.analog.com/linux-software-drivers
 F:	Documentation/devicetree/bindings/leds/leds-ltc3220.yaml
+F:	drivers/leds/leds-ltc3220.c
 
 LTC4282 HARDWARE MONITOR DRIVER
 M:	Nuno Sa <nuno.sa@analog.com>
diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index 597d7a79c988..a1c34b2deded 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -1001,6 +1001,16 @@ config LEDS_ST1202
 	  Say Y to enable support for LEDs connected to LED1202
 	  LED driver chips accessed via the I2C bus.
 
+config LEDS_LTC3220
+	tristate "LED Driver for LTC3220/LTC3220-1"
+	depends on I2C && LEDS_CLASS
+	help
+	  If you have an 18-Channel LED Driver connected to LTC3220, or LTC3220-1
+	  say Y here to enable this driver.
+
+	  To compile this driver as a module, choose M here: the module will
+	  be called ltc3220.
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
index 000000000000..6a5d967ae7e8
--- /dev/null
+++ b/drivers/leds/leds-ltc3220.c
@@ -0,0 +1,455 @@
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
+#include <linux/types.h>
+
+/* LTC3220 Registers */
+#define LTC3220_COMMAND				0x00
+#define LTC3220_ULED(x)				(0x01 + (x))
+#define LTC3220_GRAD_BLINK			0x13
+
+#define LTC3220_GRAD_COUNT_UP		BIT(0)
+#define LTC3220_COMMAND_QUICK_WRITE	BIT(0)
+#define LTC3220_COMMAND_SHUTDOWN	BIT(3)
+
+#define LTC3220_LED_CURRENT_MASK	GENMASK(5, 0)
+#define LTC3220_LED_MODE_MASK		GENMASK(7, 6)
+#define LTC3220_BLINK_MASK			GENMASK(4, 3)
+#define LTC3220_GRADATION_MASK		GENMASK(2, 1)
+
+#define LTC3220_NUM_LEDS 18
+
+struct ltc3220_command_cfg {
+	bool is_aggregated;
+	bool is_shutdown;
+};
+
+struct ltc3220_uled_cfg {
+	struct ltc3220_state *ltc3220_state;
+	struct led_classdev led_cdev;
+	u8 reg_value;
+	u8 led_index;
+};
+
+struct ltc3220_grad_cfg {
+	bool is_increasing;
+	u8 gradation_period_ms;
+};
+
+struct ltc3220_state {
+	struct ltc3220_command_cfg command_cfg;
+	struct ltc3220_uled_cfg uled_cfg[LTC3220_NUM_LEDS];
+	struct ltc3220_grad_cfg grad_cfg;
+	struct i2c_client *client;
+	u8 blink_mode;
+};
+
+static int ltc3220_set_command(struct ltc3220_state *ltc3220_state)
+{
+	struct i2c_client *client = ltc3220_state->client;
+	u8 reg_val;
+
+	reg_val = FIELD_PREP(LTC3220_COMMAND_SHUTDOWN,
+			     ltc3220_state->command_cfg.is_shutdown);
+	reg_val |= FIELD_PREP(LTC3220_COMMAND_QUICK_WRITE,
+			      ltc3220_state->command_cfg.is_aggregated);
+
+	return i2c_smbus_write_byte_data(client, LTC3220_COMMAND, reg_val);
+}
+
+static int ltc3220_shutdown(struct ltc3220_state *ltc3220_state)
+{
+	int ret;
+
+	ltc3220_state->command_cfg.is_shutdown = true;
+	ret = ltc3220_set_command(ltc3220_state);
+	if (ret < 0)
+		ltc3220_state->command_cfg.is_shutdown = false;
+
+	return ret;
+}
+
+static int ltc3220_resume_from_shutdown(struct ltc3220_state *ltc3220_state)
+{
+	int ret;
+
+	ltc3220_state->command_cfg.is_shutdown = false;
+	ret = ltc3220_set_command(ltc3220_state);
+	if (ret < 0)
+		ltc3220_state->command_cfg.is_shutdown = true;
+
+	return ret;
+}
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
+	struct ltc3220_state *ltc3220_state;
+	struct ltc3220_uled_cfg *uled_cfg;
+	int ret;
+	int i;
+
+	uled_cfg = container_of(led_cdev, struct ltc3220_uled_cfg, led_cdev);
+	ltc3220_state = uled_cfg->ltc3220_state;
+
+	ret = i2c_smbus_write_byte_data(ltc3220_state->client,
+			LTC3220_ULED(uled_cfg->led_index), brightness);
+	if (ret < 0)
+		return ret;
+
+	uled_cfg->reg_value = brightness;
+
+	/*
+	 * When aggregated LED mode is enabled, writing to LED 1 updates all
+	 * LEDs simultaneously via quick-write mode. Update cached values for
+	 * all LEDs to reflect the synchronized state.
+	 */
+	if (ltc3220_state->command_cfg.is_aggregated && uled_cfg->led_index == 0) {
+		for (i = 0; i < LTC3220_NUM_LEDS; i++)
+			ltc3220_state->uled_cfg[i].reg_value = brightness;
+	}
+
+	return 0;
+}
+
+static enum led_brightness ltc3220_get_led_data(struct led_classdev *led_cdev)
+{
+	struct ltc3220_uled_cfg *uled_cfg;
+
+	uled_cfg = container_of(led_cdev, struct ltc3220_uled_cfg, led_cdev);
+
+	return uled_cfg->reg_value;
+}
+
+static int ltc3220_set_blink_and_gradation(struct ltc3220_state *ltc3220_state,
+		    u8 blink_cfg, u8 gradation_period_ms, bool is_increasing)
+{
+	struct i2c_client *client = ltc3220_state->client;
+	u8 reg_val;
+
+	reg_val = FIELD_PREP(LTC3220_BLINK_MASK, blink_cfg);
+	reg_val |= FIELD_PREP(LTC3220_GRADATION_MASK, gradation_period_ms);
+	reg_val |= FIELD_PREP(LTC3220_GRAD_COUNT_UP, is_increasing);
+
+	return i2c_smbus_write_byte_data(client, LTC3220_GRAD_BLINK, reg_val);
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
+	struct ltc3220_state *ltc3220_state;
+	struct ltc3220_uled_cfg *uled_cfg;
+	u8 gradation_period;
+	u8 start_brightness;
+	u8 end_brightness;
+	bool is_increasing;
+	int ret;
+
+	if (len != 2)
+		return -EINVAL;
+
+	uled_cfg = container_of(led_cdev, struct ltc3220_uled_cfg, led_cdev);
+	ltc3220_state = uled_cfg->ltc3220_state;
+
+	start_brightness = pattern[0].brightness & LTC3220_LED_CURRENT_MASK;
+	end_brightness = pattern[1].brightness & LTC3220_LED_CURRENT_MASK;
+
+	is_increasing = end_brightness > start_brightness;
+
+	if (pattern[0].delta_t == 0)
+		gradation_period = 0;
+	else if (pattern[0].delta_t <= 240)
+		gradation_period = 1;
+	else if (pattern[0].delta_t <= 480)
+		gradation_period = 2;
+	else
+		gradation_period = 3;
+
+	ret = ltc3220_set_blink_and_gradation(ltc3220_state,
+					       ltc3220_state->blink_mode,
+					       gradation_period,
+					       is_increasing);
+	if (ret < 0)
+		return ret;
+
+	ltc3220_state->grad_cfg.gradation_period_ms = gradation_period;
+	ltc3220_state->grad_cfg.is_increasing = is_increasing;
+
+	ret = ltc3220_set_led_data(led_cdev, start_brightness);
+	if (ret < 0)
+		return ret;
+
+	return ltc3220_set_led_data(led_cdev, 128 + end_brightness);
+}
+
+static int ltc3220_pattern_clear(struct led_classdev *led_cdev)
+{
+	struct ltc3220_state *ltc3220_state;
+	struct ltc3220_uled_cfg *uled_cfg;
+	int ret;
+
+	uled_cfg = container_of(led_cdev, struct ltc3220_uled_cfg, led_cdev);
+	ltc3220_state = uled_cfg->ltc3220_state;
+
+	ret = ltc3220_set_blink_and_gradation(ltc3220_state,
+					       ltc3220_state->blink_mode,
+					       0, false);
+	if (ret < 0)
+		return ret;
+
+	ltc3220_state->grad_cfg.gradation_period_ms = 0;
+	ltc3220_state->grad_cfg.is_increasing = false;
+
+	return 0;
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
+	struct ltc3220_state *ltc3220_state;
+	struct ltc3220_uled_cfg *uled_cfg;
+	unsigned long period;
+	u8 blink_mode;
+	int ret;
+
+	uled_cfg = container_of(led_cdev, struct ltc3220_uled_cfg, led_cdev);
+	ltc3220_state = uled_cfg->ltc3220_state;
+
+	if (*delay_on == 0 && *delay_off == 0) {
+		blink_mode = 1;
+		*delay_on = 500;
+		*delay_off = 500;
+	} else {
+		period = *delay_on + *delay_off;
+
+		if (period <= 750) {
+			blink_mode = 0;
+			*delay_on = 250;
+			*delay_off = 250;
+		} else if (period <= 1500) {
+			blink_mode = 1;
+			*delay_on = 500;
+			*delay_off = 500;
+		} else if (period <= 3000) {
+			blink_mode = 2;
+			*delay_on = 1000;
+			*delay_off = 1000;
+		} else {
+			blink_mode = 3;
+			*delay_on = 2000;
+			*delay_off = 2000;
+		}
+	}
+
+	ret = ltc3220_set_blink_and_gradation(ltc3220_state, blink_mode,
+					       ltc3220_state->grad_cfg.gradation_period_ms,
+					       ltc3220_state->grad_cfg.is_increasing);
+	if (ret < 0)
+		return ret;
+
+	ltc3220_state->blink_mode = blink_mode;
+
+	return 0;
+}
+
+static void ltc3220_reset_gpio_action(void *data)
+{
+	struct gpio_desc *reset_gpio = data;
+
+	gpiod_set_value_cansleep(reset_gpio, 1);
+}
+
+static int ltc3220_reset(struct ltc3220_state *ltc3220_state, struct i2c_client *client)
+{
+	struct gpio_desc *reset_gpio;
+	int ret;
+	int i;
+
+	reset_gpio = devm_gpiod_get_optional(&client->dev, "reset", GPIOD_OUT_HIGH);
+	if (IS_ERR(reset_gpio))
+		return dev_err_probe(&client->dev, PTR_ERR(reset_gpio), "Failed on reset GPIO\n");
+
+	if (reset_gpio) {
+		gpiod_set_value_cansleep(reset_gpio, 0);
+
+		ret = devm_add_action_or_reset(&client->dev, ltc3220_reset_gpio_action, reset_gpio);
+		if (ret)
+			return ret;
+
+	} else {
+		ret = ltc3220_set_command(ltc3220_state);
+		if (ret < 0)
+			return ret;
+
+		for (i = 0; i < LTC3220_NUM_LEDS; i++) {
+			ret = i2c_smbus_write_byte_data(client, LTC3220_ULED(i), 0);
+			if (ret < 0)
+				return ret;
+		}
+
+		ret = ltc3220_set_blink_and_gradation(ltc3220_state, 0, 0, 0);
+		if (ret < 0)
+			return ret;
+	}
+
+	return 0;
+}
+
+static int ltc3220_suspend(struct device *dev)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	struct ltc3220_state *ltc3220_state = i2c_get_clientdata(client);
+
+	return ltc3220_shutdown(ltc3220_state);
+}
+
+static int ltc3220_resume(struct device *dev)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	struct ltc3220_state *ltc3220_state = i2c_get_clientdata(client);
+
+	return ltc3220_resume_from_shutdown(ltc3220_state);
+}
+
+static DEFINE_SIMPLE_DEV_PM_OPS(ltc3220_pm_ops, ltc3220_suspend, ltc3220_resume);
+
+static int ltc3220_probe(struct i2c_client *client)
+{
+	struct ltc3220_state *ltc3220_state;
+	bool aggregated_led_found = false;
+	int num_leds = 0;
+	u8 i = 0;
+	int ret;
+
+	if (!i2c_check_functionality(client->adapter, I2C_FUNC_SMBUS_BYTE_DATA))
+		return dev_err_probe(&client->dev, -EIO, "SMBUS Byte Data not Supported\n");
+
+	ltc3220_state = devm_kzalloc(&client->dev, sizeof(*ltc3220_state), GFP_KERNEL);
+	if (!ltc3220_state)
+		return -ENOMEM;
+
+	ltc3220_state->client = client;
+	i2c_set_clientdata(client, ltc3220_state);
+
+	ret = ltc3220_reset(ltc3220_state, client);
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
+							"Aggregated LED out of range\n");
+
+			if (aggregated_led_found)
+				return dev_err_probe(&client->dev, -EINVAL,
+							"One Aggregated LED only\n");
+
+			aggregated_led_found = true;
+			ltc3220_state->command_cfg.is_aggregated = true;
+			ret = ltc3220_set_command(ltc3220_state);
+			if (ret < 0)
+				return dev_err_probe(&client->dev, ret, "Failed to set command\n");
+		}
+
+		num_leds++;
+
+		/* LED node reg/index/address goes from 1 to 18 */
+		i = source - 1;
+		led = &ltc3220_state->uled_cfg[i];
+		led->led_index = i;
+		led->reg_value = 0;
+		led->ltc3220_state = ltc3220_state;
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
+	if (aggregated_led_found && num_leds > 1)
+		return dev_err_probe(&client->dev, -EINVAL,
+					"Aggregated LED must be the only LED node\n");
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
+		.pm	= pm_sleep_ptr(&ltc3220_pm_ops),
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


