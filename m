Return-Path: <linux-leds+bounces-8981-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id X8vaDKvuTmrnWwIAu9opvQ
	(envelope-from <linux-leds+bounces-8981-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 09 Jul 2026 02:43:23 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 25A9472B5D9
	for <lists+linux-leds@lfdr.de>; Thu, 09 Jul 2026 02:43:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=analog.com header.s=DKIM header.b=hpWMb4+Y;
	dmarc=pass (policy=quarantine) header.from=analog.com;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8981-lists+linux-leds=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-leds+bounces-8981-lists+linux-leds=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id BFEE2301CD2B
	for <lists+linux-leds@lfdr.de>; Thu,  9 Jul 2026 00:42:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C4073955F2;
	Thu,  9 Jul 2026 00:42:41 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0b-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7241338F236;
	Thu,  9 Jul 2026 00:42:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783557761; cv=none; b=tPQ1G+2//9pRYQ1OR8wDXXjvrJKP7eKHKck5BXrZiZny4eSRE26AaHUXC8IweV3imZP1SY3+IjnyhckLiRRvusYZtUkVFxFlLhc0sscF9YnI2aD1tD67fs5oHpFTs+55uDHsSKs0vEg7vG5zFaKqm/kHOy2kJB6n0M61xwWzb/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783557761; c=relaxed/simple;
	bh=yHJBjqDmQOItA8XeSP7iwKE7tYALbjQsecYVol40DSc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=EMaTSKuzTVhknHWEQiFnVb0ZPS4jQzbsmHp5G2NY+VqYv3phtYjgnNmF09BcpYaSSBjXF1Mp/Gf6O+5Y110yVxTkY1BUZfi+V+JMuHZurUI38yZEIWelRr+a5qbWt5UEdmqxGp5nVfs40LKOVbOFN3SB2gyC0fbgwJuFlB6gBPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=hpWMb4+Y; arc=none smtp.client-ip=148.163.135.77
Received: from pps.filterd (m0375855.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668N5WsS3421463;
	Wed, 8 Jul 2026 20:42:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=5AyTZ
	klPL7eXfgUgLkySwNh4mG9q2/3+RaHhgsFnqew=; b=hpWMb4+Y9T/u0iyTJf/tO
	irc7l2vaDQ4kkHjoI7zC+s58TX/AFF1NJ3yQxNCRiTyG7iQlLd0i+Jy68OJIw7Nt
	cc9BCStCE1iCHaUJEV2czXNpTNF5TZI+E2vXfmYDuV48uGoaPDyq0I49c3z48rzf
	UyvD9l4wgTbvgNEX36W/JKLUrkt/790jSipEOWJzF+P9667QRcJLcu9usvdCPZyV
	pcNuG+BmAowr6ckWH5hp+I/1XIwEDJboxll1ieeFk14FXlg6ZVFCIveHnLimsq6r
	ua1Kwk/StlaUHf8gR3IY44CKodEBxJFxyuEma556RMtsv/A1y6rQL9eIWalyo0hY
	w==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 4f9v9s10b7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Jul 2026 20:42:30 -0400 (EDT)
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 6690gTqe021401
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 8 Jul 2026 20:42:29 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by ASHBMBX9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.37; Wed, 8 Jul
 2026 20:42:29 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.1748.37 via Frontend
 Transport; Wed, 8 Jul 2026 20:42:29 -0400
Received: from HYB-7P5GeKnsiiX.ad.analog.com (HYB-7P5GeKnsiiX.ad.analog.com [10.118.4.24])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 6690gAev017538;
	Wed, 8 Jul 2026 20:42:22 -0400
From: Edelweise Escala <edelweise.escala@analog.com>
Date: Thu, 9 Jul 2026 08:41:20 +0800
Subject: [PATCH v13 2/2] leds: ltc3220: Add Support for LTC3220 18 channel
 LED Driver
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260709-ltc3220-driver-v13-2-9b53237642eb@analog.com>
References: <20260709-ltc3220-driver-v13-0-9b53237642eb@analog.com>
In-Reply-To: <20260709-ltc3220-driver-v13-0-9b53237642eb@analog.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783557730; l=20750;
 i=edelweise.escala@analog.com; s=20260106; h=from:subject:message-id;
 bh=yHJBjqDmQOItA8XeSP7iwKE7tYALbjQsecYVol40DSc=;
 b=pHEqHXEp+1XKxAuaLyZooYMiUhOPEd1VTJh2juv32bUB95Oih6/oRyIGwt/8RGzLWbBV0mrm1
 YJ8VM15JZcAD0uPLONGR4iauXzwXZBb/LzedAj/fYHQEWQqdECc2CYw
X-Developer-Key: i=edelweise.escala@analog.com; a=ed25519;
 pk=lf5HLFe8ZeQjXZgkBkFMK+u9qH5/tqZhCIushTKduNQ=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDAwNCBTYWx0ZWRfX/80ulLZMrwP6
 0EXm1F/HTh0ETBVCy+ijO91hofOT695NOewDiBCPOpoasoNPkpIkRVgN3RWysnxAeYxFtWAT0LU
 i0zOuIy9ryekz9VctxubGd4h8o9Hno35qQWlmQeEUmbXxGG+KT5XcL9zTHMbqjVRB9sB8coyr4f
 1Rui/siw4xm1nTfSSZfBl0vOFkHAfajjoi3oDfWNBCguOrm9W/8E/PPQs/NcdmucPRYaddwUTHp
 0gRu1FRzp6V8CvhJ0YE8ibKCza7T/fq4spITn8JhGjkTdeg1aIxFfbacmphOpg3aI6FaV0C9Ii+
 jc+DjQ0GP8AOT79xY1nk28ASgCDDWLQlxH+3YuVOXNwIgXtoCy/bhvsBIQ8YpEAgacQAua5MmBE
 Kl1hW5ka1beFoy40P+iJQ3OvAXJEwXYKTWFTtMj3RYeQlBdPmZFCDp9M62yRs1sA/lsnonjyDgT
 I21oi2pSJIdniZfH1eQ==
X-Authority-Analysis: v=2.4 cv=BI+DalQG c=1 sm=1 tr=0 ts=6a4eee76 cx=c_pps
 a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=0sLvza09kfJOxVLZPwjg:22 a=N--XFCr6TIEc_64PeIT2:22 a=gAnH3GRIAAAA:8
 a=VwQbUJbxAAAA:8 a=JSVo1BT0YKmLet_W8J0A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: u-ER6qY3q_d8-Ir6yN14DYrM491LLw87
X-Proofpoint-ORIG-GUID: u-ER6qY3q_d8-Ir6yN14DYrM491LLw87
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDAwNCBTYWx0ZWRfX4UWg/SmescbP
 2LYjZ2Up/wvrbfuS/tQIf3MD+kNVfTU4BPgXCOAsT2g88sHHOAUZR8vOIzXVAmBNWKwMKPnxPsh
 /IKHzawNUpZAC41c2aF+qDkipUa6CIZ6F+DWuicbcxYOfKPJk0tL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_05,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 bulkscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090004
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[analog.com,quarantine];
	R_DKIM_ALLOW(-0.20)[analog.com:s=DKIM];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8981-lists,linux-leds=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[analog.com:dkim,analog.com:mid,analog.com:from_mime,analog.com:url,analog.com:email,vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:pavel@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-leds@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:edelweise.escala@analog.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[analog.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[edelweise.escala@analog.com,linux-leds@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[edelweise.escala@analog.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 25A9472B5D9

Add driver for the LTC3220 18-channel LED driver
with I2C interface, individual brightness control, and hardware-assisted
blink/gradation features.

Signed-off-by: Edelweise Escala <edelweise.escala@analog.com>
---
 MAINTAINERS                 |   1 +
 drivers/leds/Kconfig        |  13 +
 drivers/leds/Makefile       |   1 +
 drivers/leds/leds-ltc3220.c | 586 ++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 601 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index c8a242577d2f..0f553ada61d9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15229,6 +15229,7 @@ L:	linux-leds@vger.kernel.org
 S:	Maintained
 W:	https://ez.analog.com/linux-software-drivers
 F:	Documentation/devicetree/bindings/leds/adi,ltc3220.yaml
+F:	drivers/leds/leds-ltc3220.c
 
 LTC4282 HARDWARE MONITOR DRIVER
 M:	Nuno Sa <nuno.sa@analog.com>
diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index f4a0a3c8c870..31b1e3ff094c 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -1000,6 +1000,19 @@ config LEDS_ST1202
 	  Say Y to enable support for LEDs connected to LED1202
 	  LED driver chips accessed via the I2C bus.
 
+config LEDS_LTC3220
+	tristate "LED Driver for Analog Devices Inc. LTC3220"
+	depends on I2C && LEDS_CLASS
+	select REGMAP_I2C
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
index 7db3768912ca..a68244bd50fb 100644
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
index 000000000000..5060d5042fe1
--- /dev/null
+++ b/drivers/leds/leds-ltc3220.c
@@ -0,0 +1,586 @@
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
+#include <linux/module.h>
+#include <linux/property.h>
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
+#define LTC3220_MAX_BRIGHTNESS				63
+
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
+enum ltc3220_led_mode {
+	LTC3220_NORMAL_MODE,
+	LTC3220_BLINK_MODE,
+	LTC3220_GRADATION_MODE,
+};
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
+static const struct regmap_config ltc3220_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+	.max_register = LTC3220_GRAD_BLINK_REG,
+	.cache_type = REGCACHE_FLAT_S,
+};
+
+struct ltc3220_uled_cfg {
+	struct led_classdev led_cdev;
+	u8 reg_value;
+	u8 led_index;
+	bool registered;
+};
+
+struct ltc3220 {
+	struct ltc3220_uled_cfg uled_cfg[LTC3220_NUM_LEDS];
+	struct regmap *regmap;
+	struct mutex lock;
+};
+
+/*
+ * Set LED brightness. Hardware supports 0-63 brightness levels.
+ * Mode switching (blink/gradation) is handled through dedicated callbacks.
+ *
+ * In aggregated mode only a single LED (reg = 1) is registered and the
+ * hardware quick-write feature propagates the write to all 18 channels, so
+ * there is no need to update the other registers explicitly.
+ */
+static int __ltc3220_set_led_data(struct ltc3220 *ltc3220,
+				  struct ltc3220_uled_cfg *uled_cfg,
+				  enum led_brightness brightness)
+{
+	int ret;
+
+	brightness &= LTC3220_LED_CURRENT_MASK;
+
+	ret = regmap_write(ltc3220->regmap, LTC3220_ULED_REG(uled_cfg->led_index),
+			   brightness);
+	if (ret)
+		return ret;
+
+	uled_cfg->reg_value = brightness;
+
+	return 0;
+}
+
+static int ltc3220_set_led_data(struct led_classdev *led_cdev,
+				enum led_brightness brightness)
+{
+	struct ltc3220_uled_cfg *uled_cfg = container_of(led_cdev, struct ltc3220_uled_cfg,
+							 led_cdev);
+	struct ltc3220 *ltc3220 = container_of(uled_cfg - uled_cfg->led_index, struct ltc3220,
+					       uled_cfg[0]);
+	int ret;
+
+	mutex_lock(&ltc3220->lock);
+	ret = __ltc3220_set_led_data(ltc3220, uled_cfg, brightness);
+	mutex_unlock(&ltc3220->lock);
+
+	return ret;
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
+ * The hardware supports 3 gradation ramp times (240ms, 480ms, 960ms)
+ * and can ramp up or down. The gradation period and direction are chip-global
+ * registers (LTC3220_GRAD_BLINK_REG), affecting all 18 channels simultaneously.
+ * This is a hardware limitation, not a driver bug.
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
+	struct ltc3220 *ltc3220 = container_of(uled_cfg - uled_cfg->led_index, struct ltc3220,
+					       uled_cfg[0]);
+	u8 gradation_period;
+	u8 start_brightness;
+	u8 end_brightness;
+	u8 gradation_val;
+	u8 led_mode;
+	bool is_increasing;
+	int ret;
+
+	if (len != 2)
+		return -EINVAL;
+
+	start_brightness = clamp_val(pattern[0].brightness, 0, LTC3220_LED_CURRENT_MASK);
+	end_brightness = clamp_val(pattern[1].brightness, 0, LTC3220_LED_CURRENT_MASK);
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
+	/*
+	 * With the ramp disabled (delta_t == 0) there is no gradation to run,
+	 * so apply the end brightness directly in NORMAL mode instead of
+	 * leaving the channel in gradation mode with a disabled ramp.
+	 */
+	led_mode = gradation_period == LTC3220_GRADATION_MODE_DISABLED ?
+		   LTC3220_NORMAL_MODE : LTC3220_GRADATION_MODE;
+
+	mutex_lock(&ltc3220->lock);
+
+	ret = regmap_update_bits(ltc3220->regmap, LTC3220_GRAD_BLINK_REG,
+				 LTC3220_GRADATION_MASK, gradation_val);
+	if (ret)
+		goto unlock;
+
+	if (led_mode == LTC3220_GRADATION_MODE) {
+		ret = regmap_write(ltc3220->regmap, LTC3220_ULED_REG(uled_cfg->led_index),
+				   start_brightness & LTC3220_LED_CURRENT_MASK);
+		if (ret)
+			goto unlock;
+
+		ret = regmap_write(ltc3220->regmap, LTC3220_ULED_REG(uled_cfg->led_index),
+				   FIELD_PREP(LTC3220_LED_MODE_MASK, led_mode) |
+				   (end_brightness & LTC3220_LED_CURRENT_MASK));
+		if (ret)
+			goto unlock;
+
+		uled_cfg->reg_value = end_brightness;
+	} else {
+		ret = __ltc3220_set_led_data(ltc3220, uled_cfg, end_brightness);
+		if (ret)
+			goto unlock;
+	}
+
+unlock:
+	mutex_unlock(&ltc3220->lock);
+	return ret;
+}
+
+static int ltc3220_pattern_clear(struct led_classdev *led_cdev)
+{
+	struct ltc3220_uled_cfg *uled_cfg = container_of(led_cdev, struct ltc3220_uled_cfg,
+							 led_cdev);
+	struct ltc3220 *ltc3220 = container_of(uled_cfg - uled_cfg->led_index, struct ltc3220,
+					       uled_cfg[0]);
+	int ret;
+
+	mutex_lock(&ltc3220->lock);
+
+	ret = regmap_update_bits(ltc3220->regmap, LTC3220_ULED_REG(uled_cfg->led_index),
+				 LTC3220_LED_MODE_MASK, LTC3220_NORMAL_MODE);
+	if (ret)
+		goto unlock;
+
+	ret = __ltc3220_set_led_data(ltc3220, uled_cfg, LED_OFF);
+
+unlock:
+	mutex_unlock(&ltc3220->lock);
+	return ret;
+}
+
+/*
+ * LTC3220 has a global blink configuration that affects all LEDs.
+ * This implementation allows per-LED blink requests via sysfs, but setting
+ * blink on any LED reprograms the timing for all 18 channels simultaneously.
+ * The delay values are mapped to the hardware's discrete blink rates.
+ *
+ * HARDWARE LIMITATION: This is not a driver bug. Per-LED blink timing control
+ * is not possible with this hardware due to the global blink register.
+ */
+static int ltc3220_blink_set(struct led_classdev *led_cdev,
+			     unsigned long *delay_on,
+			     unsigned long *delay_off)
+{
+	struct ltc3220_uled_cfg *uled_cfg = container_of(led_cdev, struct ltc3220_uled_cfg,
+							 led_cdev);
+	struct ltc3220 *ltc3220 = container_of(uled_cfg - uled_cfg->led_index, struct ltc3220,
+					       uled_cfg[0]);
+	u8 blink_brightness;
+	u8 blink_mode = 0;
+	int ret;
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
+	mutex_lock(&ltc3220->lock);
+
+	ret = regmap_update_bits(ltc3220->regmap, LTC3220_GRAD_BLINK_REG,
+				 LTC3220_BLINK_MASK, FIELD_PREP(LTC3220_BLINK_MASK, blink_mode));
+	if (ret)
+		goto unlock;
+
+	blink_brightness = uled_cfg->reg_value ? : led_cdev->max_brightness;
+
+	ret = regmap_write(ltc3220->regmap, LTC3220_ULED_REG(uled_cfg->led_index),
+			    FIELD_PREP(LTC3220_LED_MODE_MASK, LTC3220_BLINK_MODE) |
+			    (blink_brightness & LTC3220_LED_CURRENT_MASK));
+	if (ret)
+		goto unlock;
+
+	uled_cfg->reg_value = blink_brightness;
+
+unlock:
+	mutex_unlock(&ltc3220->lock);
+	return ret;
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
+		usleep_range(10000, 12000);
+		gpiod_set_value_cansleep(reset_gpio, 0);
+		usleep_range(10000, 12000);
+
+		ret = devm_add_action_or_reset(&client->dev, ltc3220_reset_gpio_action,
+					       reset_gpio);
+		if (ret)
+			return ret;
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
+	int ret;
+
+	ret = regmap_update_bits(ltc3220->regmap, LTC3220_COMMAND_REG,
+				 LTC3220_SHUTDOWN_MASK, LTC3220_SHUTDOWN_MASK);
+	if (ret)
+		return ret;
+
+	regcache_mark_dirty(ltc3220->regmap);
+
+	return 0;
+}
+
+static int ltc3220_resume(struct device *dev)
+{
+	struct ltc3220 *ltc3220 = i2c_get_clientdata(to_i2c_client(dev));
+	bool quick_write_enabled;
+	unsigned int command_reg;
+	int ret;
+
+	ret = regmap_read(ltc3220->regmap, LTC3220_COMMAND_REG, &command_reg);
+	if (ret)
+		return ret;
+
+	quick_write_enabled = command_reg & LTC3220_QUICK_WRITE_MASK;
+
+	if (quick_write_enabled) {
+		ret = regmap_update_bits(ltc3220->regmap, LTC3220_COMMAND_REG,
+					 LTC3220_QUICK_WRITE_MASK, 0);
+		if (ret)
+			return ret;
+	}
+
+	ret = regmap_update_bits(ltc3220->regmap, LTC3220_COMMAND_REG,
+				 LTC3220_SHUTDOWN_MASK, 0);
+	if (ret)
+		return ret;
+
+	usleep_range(10000, 12000);
+
+	ret = regcache_sync(ltc3220->regmap);
+	if (ret)
+		return ret;
+
+	if (quick_write_enabled) {
+		ret = regmap_update_bits(ltc3220->regmap, LTC3220_COMMAND_REG,
+					 LTC3220_QUICK_WRITE_MASK,
+					 LTC3220_QUICK_WRITE_MASK);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
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
+	ret = devm_mutex_init(&client->dev, &ltc3220->lock);
+	if (ret)
+		return ret;
+
+	i2c_set_clientdata(client, ltc3220);
+
+	ret = ltc3220_reset(ltc3220, client);
+	if (ret)
+		return dev_err_probe(&client->dev, ret, "Failed to reset device\n");
+
+	/* First pass: validate configuration and set up LED structures */
+	device_for_each_child_node_scoped(&client->dev, child) {
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
+		if (fwnode_property_present(child, "led-sources")) {
+			u32 led_sources[LTC3220_NUM_LEDS];
+			int count;
+
+			if (source != 1)
+				return dev_err_probe(&client->dev, -EINVAL,
+						     "Aggregated LED out of range\n");
+
+			if (aggregated_led_found)
+				return dev_err_probe(&client->dev, -EINVAL,
+						     "One Aggregated LED only\n");
+
+			count = fwnode_property_count_u32(child, "led-sources");
+			if (count != LTC3220_NUM_LEDS)
+				return dev_err_probe(&client->dev, -EINVAL,
+						     "Aggregated mode requires all %d outputs in led-sources, got %d\n",
+						     LTC3220_NUM_LEDS, count);
+
+			ret = fwnode_property_read_u32_array(child, "led-sources",
+							     led_sources, LTC3220_NUM_LEDS);
+			if (ret)
+				return dev_err_probe(&client->dev, ret,
+						     "Failed to read led-sources array\n");
+
+			/*
+			 * Validate array contents for DT correctness. The hardware
+			 * quick-write broadcasts to all 18 channels regardless of
+			 * array contents, but checking helps catch DT mistakes.
+			 */
+			for (int i = 0; i < LTC3220_NUM_LEDS; i++) {
+				if (led_sources[i] < 1 || led_sources[i] > LTC3220_NUM_LEDS)
+					return dev_err_probe(&client->dev, -EINVAL,
+							     "Invalid output %u in led-sources\n",
+							     led_sources[i]);
+			}
+
+			aggregated_led_found = true;
+		}
+
+		num_leds++;
+
+		/* LED node reg/index/address goes from 1 to 18 */
+		led_index = source - 1;
+		led = &ltc3220->uled_cfg[led_index];
+
+		if (led->registered)
+			return dev_err_probe(&client->dev, -EINVAL,
+					     "Duplicate LED reg %u found\n", source);
+
+		led->registered = true;
+		led->led_index = led_index;
+		led->reg_value = 0;
+		led->led_cdev.brightness_set_blocking = ltc3220_set_led_data;
+		led->led_cdev.brightness_get = ltc3220_get_led_data;
+		led->led_cdev.max_brightness = LTC3220_MAX_BRIGHTNESS;
+		led->led_cdev.blink_set = ltc3220_blink_set;
+		led->led_cdev.pattern_set = ltc3220_pattern_set;
+		led->led_cdev.pattern_clear = ltc3220_pattern_clear;
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
+	if (num_leds == 0)
+		return dev_err_probe(&client->dev, -EINVAL,
+				     "No LED nodes found in device tree\n");
+
+	if (aggregated_led_found) {
+		ret = regmap_update_bits(ltc3220->regmap,
+						LTC3220_COMMAND_REG,
+						LTC3220_QUICK_WRITE_MASK,
+						LTC3220_QUICK_WRITE_MASK);
+		if (ret)
+			return dev_err_probe(&client->dev, ret,
+						"Failed to set quick write mode\n");
+	}
+
+	/* Second pass: register LEDs after validation */
+	device_for_each_child_node_scoped(&client->dev, child) {
+		struct led_init_data init_data = {};
+		struct ltc3220_uled_cfg *led;
+		u32 source;
+
+		ret = fwnode_property_read_u32(child, "reg", &source);
+		if (ret)
+			return ret;
+
+		if (!source || source > LTC3220_NUM_LEDS)
+			return dev_err_probe(&client->dev, -EINVAL,
+					     "LED address out of range in second pass\n");
+
+		init_data.fwnode = child;
+		init_data.devicename = "ltc3220";
+
+		led_index = source - 1;
+		led = &ltc3220->uled_cfg[led_index];
+
+		ret = devm_led_classdev_register_ext(&client->dev, &led->led_cdev, &init_data);
+		if (ret)
+			return dev_err_probe(&client->dev, ret, "Failed to register LED class\n");
+	}
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


