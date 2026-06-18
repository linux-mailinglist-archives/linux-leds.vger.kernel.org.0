Return-Path: <linux-leds+bounces-8686-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id SiseBaF1NGr3YgYAu9opvQ
	(envelope-from <linux-leds+bounces-8686-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 19 Jun 2026 00:48:01 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 625F16A2FB9
	for <lists+linux-leds@lfdr.de>; Fri, 19 Jun 2026 00:48:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=analog.com header.s=DKIM header.b="NVi/cM6+";
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8686-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-8686-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=analog.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8E7B830356DD
	for <lists+linux-leds@lfdr.de>; Thu, 18 Jun 2026 22:46:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEF6B346E57;
	Thu, 18 Jun 2026 22:46:39 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 412E32EAB6F;
	Thu, 18 Jun 2026 22:46:38 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781822799; cv=none; b=RvesC9mZIYbky1hakE9r0XESTT7/WZTssv71+bBhtBQn54QVbP1rHqA40i8J6EuBzrePSHXhE2aRry/RVgJkMFykZ0CeV6x3VwO/tgspZYlZUAiHZCMwH5FCSnwfA/Y2ayCJJaeP3gfGUnxvYZKtIW8UYtiSn1PFzcMJvDSwLBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781822799; c=relaxed/simple;
	bh=IkGWL7MIn42TFR/X7exC4T+xwCO0flBZmNrJagxdsOQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=QPQ9ruHCTm/J0R/zluxuxA1rKOF3+L/EaLcA+FYwwZS1cBw+r36nHeilghZQcgJ03pxasZP7WFjQLxYLjOQ6apNc9HZUO0z6gXIo5jv4IpKSKwpH454MwBfc1uvyoaXLthtchONHethfMkXlANle+htTCO+Y0bspy9ip2Xqsrh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=NVi/cM6+; arc=none smtp.client-ip=148.163.135.77
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65ILsCsL3008332;
	Thu, 18 Jun 2026 18:46:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=yXVdK
	5tWLlijecmBmh/UhA++LYqVfVOVjMzvdHrinXQ=; b=NVi/cM6+ZFDHLMZtgOxNL
	cVzO22sN0dgHch1Xey8oR3FgjheXVBNE56LOlLnVgX6yJEJNwduo8y4CkqYenzg8
	4XT41UM9SUdARG66A5C3YJv309DvQi8zT68pd+p7Umgqg5FqRnkvON58jZAz6V2L
	167ok8Ys7t250VUh8MzsGlXTh2OSeqWUUIqZFuWfsQgv/3dcpBPd2Pae75GLb5hU
	s0wVU8wISrczzL8yJonx203foMGswl0/Zkb0QR8hkVbUGJs4x6HFtocPpfyaJ8SV
	1oE0I5QGLr0ql75xcZcj6kLDuKL7mPnogMtTF2SK2h/JKmW5zPDgkZJ1UlVr2ROX
	Q==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4euegr9j33-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Jun 2026 18:46:30 -0400 (EDT)
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 65IMkTIA011278
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 18 Jun 2026 18:46:29 -0400
Received: from ASHBCASHYB5.ad.analog.com (10.64.17.133) by
 ASHBMBX9.ad.analog.com (10.64.17.10) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.37; Thu, 18 Jun 2026 18:46:29 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by
 ASHBCASHYB5.ad.analog.com (10.64.17.133) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.37; Thu, 18 Jun 2026 18:46:28 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.1748.37 via Frontend
 Transport; Thu, 18 Jun 2026 18:46:28 -0400
Received: from HYB-VFz9h4bIQxi.ad.analog.com (HYB-VFz9h4bIQxi.ad.analog.com [10.118.4.23])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 65IMk8mL028006;
	Thu, 18 Jun 2026 18:46:20 -0400
From: Jan Carlo Roleda <jancarlo.roleda@analog.com>
Date: Fri, 19 Jun 2026 06:45:09 +0800
Subject: [PATCH v5 2/2] leds: ltc3208: Add driver for LTC3208 Multidisplay
 LED Driver
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260619-upstream-ltc3208-v5-2-075d18060606@analog.com>
References: <20260619-upstream-ltc3208-v5-0-075d18060606@analog.com>
In-Reply-To: <20260619-upstream-ltc3208-v5-0-075d18060606@analog.com>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <linux-leds@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        Jan Carlo Roleda <jancarlo.roleda@analog.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781822768; l=10777;
 i=jancarlo.roleda@analog.com; s=20260317; h=from:subject:message-id;
 bh=IkGWL7MIn42TFR/X7exC4T+xwCO0flBZmNrJagxdsOQ=;
 b=AuxPtm8RbZzyfZu8hpdFgGWVUrckBmxXAptG//y/YyqzeqP9Jq3KhS/OaXgjEB674kJvaADfZ
 McboWnQu2EJD4T3G602WivpheA8O2wDpyxixQ6y6I1ds69jIGM3ycR4
X-Developer-Key: i=jancarlo.roleda@analog.com; a=ed25519;
 pk=zPMh+eO6/Mj6tqaie75BLiTLQvE3f9pck0UejKLmLMc=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-ORIG-GUID: 2f9V-wiwx-gb8tg9naWdCrPHf_ndE-gi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE4MDIwOCBTYWx0ZWRfX2rmIYdo5LplA
 iOvnXCmrcXi5aVxg1MqtL62m7gtb24LvEH6kJVd3isNRaA9OXoSZKt9bkXt6h/o54AYQs/N4DPh
 aMYMdeDOHVp90wjVfb2QYRoA8Xj0IszgUUQb+xLYSdi8r5KZu5uziAUaj2Nts9h6smHl/HyKigN
 Kq82Lb0DGOKbfLx3S/kuE49taPVdEy3Lr/mzb4KiR8DMRkWTNsyHyyKdLB0D+CaGDnfp9v9ANrE
 O/K4OuP16SxCRuf00WHxWFeW40fSB9QJJvheF+tCq+HjZHWE8moyMyV9cgPJbG+G98l0Ou8CsSy
 6uUNr1XsgaJc3Ea/+xNN2l9F/HDcMOfj0Djuw+ZKUlanDMPlMna6PQpquhjWKBuoOfwkn/aLYv7
 sp8TouCXrq8fLFJUGQ1MSUk9VM98wO11ZSJR0N0var8PZV3Qf0XFYlXx6QeNkP9lM0wZXBu0LTV
 1GrHKlR9FzcVKkdN1+g==
X-Proofpoint-GUID: 2f9V-wiwx-gb8tg9naWdCrPHf_ndE-gi
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE4MDIwOCBTYWx0ZWRfX6nc9Sap8/NPF
 6FKKB1I25bInuOYmvw+vvgqgS9cF+V3tjSC7EStIFT7QMhpMQoZmd3XVqMWRJPAcGXitYwAJJAu
 Hy1NIgm9csMRz/Qe39+yVlsTnEIEGfSfmIcAoE7JNsmBTj+YOCtA
X-Authority-Analysis: v=2.4 cv=B+6JFutM c=1 sm=1 tr=0 ts=6a347546 cx=c_pps
 a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=0sLvza09kfJOxVLZPwjg:22 a=Z0pTeXoby7EwIRygza74:22 a=gAnH3GRIAAAA:8
 a=VwQbUJbxAAAA:8 a=FfwCkgHInPnU5R23u4kA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-18_04,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 clxscore=1015
 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606180208
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[analog.com,quarantine];
	R_DKIM_ALLOW(-0.20)[analog.com:s=DKIM];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-8686-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[jancarlo.roleda@analog.com,linux-leds@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:pavel@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-leds@vger.kernel.org,m:devicetree@vger.kernel.org,m:jancarlo.roleda@analog.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[analog.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jancarlo.roleda@analog.com,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 625F16A2FB9

Kernel driver implementation for LTC3208 Multidisplay LED Driver.

The LTC3208 is a Multi-display LED driver, designed to control up to
7 distinct LED channels (MAIN, SUB, AUX, CAMHI, CAMLO, RED, GREEN, BLUE),
each configurable with its own current level that is equally set to its
respective output current source pins for external LEDs.

It is programmed via the I2C serial interface.
MAIN and SUB support 8-bit current level resolution,
while AUX, CAMHI/LO, RED, GREEN, and BLUE support 4-bit levels.

The AUX LED channel can be configured to mirror the CAM, SUB, and MAIN
channel current levels, or as its own independent AUX channel.

The CAM LED channel is configured as 2 separate CAMHI and CAMLO register
sub-channels, which currnet is selected via the CAMHL pin, or set to
CAMHI register only via setting the S_CAMHILO bit high in register G (0x7).

Signed-off-by: Jan Carlo Roleda <jancarlo.roleda@analog.com>
---
 MAINTAINERS                 |   1 +
 drivers/leds/Kconfig        |  12 +++
 drivers/leds/Makefile       |   1 +
 drivers/leds/leds-ltc3208.c | 239 ++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 253 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 2fd6ffdaaf04..e3b59485ecb3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15229,6 +15229,7 @@ L:	linux-leds@vger.kernel.org
 S:	Maintained
 W:	https://ez.analog.com/linux-software-drivers
 F:	Documentation/devicetree/bindings/leds/adi,ltc3208.yaml
+F:	drivers/leds/leds-ltc3208.c
 
 LTC4282 HARDWARE MONITOR DRIVER
 M:	Nuno Sa <nuno.sa@analog.com>
diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index f4a0a3c8c870..d917ce3b72f4 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -1028,6 +1028,18 @@ config LEDS_ACER_A500
 	  This option enables support for the Power Button LED of
 	  Acer Iconia Tab A500.
 
+config LEDS_LTC3208
+	tristate "LED Driver for Analog Devices LTC3208"
+	depends on LEDS_CLASS && I2C
+	select REGMAP_I2C
+	help
+	  Say Y to enable the LTC3208 LED driver.
+	  This enables the LED device LTC3208, a 7-channel, 17-current source
+	  multidisplay high-current LED driver, configured via I2C.
+
+	  To compile this driver as a module, choose M here: the module will
+	  be called ltc3208.
+
 source "drivers/leds/blink/Kconfig"
 
 comment "Flash and Torch LED drivers"
diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
index 7db3768912ca..0148b87e16ba 100644
--- a/drivers/leds/Makefile
+++ b/drivers/leds/Makefile
@@ -61,6 +61,7 @@ obj-$(CONFIG_LEDS_LP8788)		+= leds-lp8788.o
 obj-$(CONFIG_LEDS_LP8860)		+= leds-lp8860.o
 obj-$(CONFIG_LEDS_LP8864)		+= leds-lp8864.o
 obj-$(CONFIG_LEDS_LT3593)		+= leds-lt3593.o
+obj-$(CONFIG_LEDS_LTC3208)		+= leds-ltc3208.o
 obj-$(CONFIG_LEDS_MAX5970)		+= leds-max5970.o
 obj-$(CONFIG_LEDS_MAX77650)		+= leds-max77650.o
 obj-$(CONFIG_LEDS_MAX77705)		+= leds-max77705.o
diff --git a/drivers/leds/leds-ltc3208.c b/drivers/leds/leds-ltc3208.c
new file mode 100644
index 000000000000..fa2b6c6acc71
--- /dev/null
+++ b/drivers/leds/leds-ltc3208.c
@@ -0,0 +1,239 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * LED driver for Analog Devices LTC3208 Multi-Display Driver
+ *
+ * Copyright 2026 Analog Devices Inc.
+ *
+ * Author: Jan Carlo Roleda <jancarlo.roleda@analog.com>
+ */
+#include <linux/bitfield.h>
+#include <linux/errno.h>
+#include <linux/i2c.h>
+#include <linux/leds.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/property.h>
+#include <linux/regmap.h>
+#include <linux/types.h>
+
+/* Registers */
+#define LTC3208_REG_A_GRNRED 0x1 /* Green and Red current DAC*/
+#define LTC3208_REG_B_AUXBLU 0x2 /* AUX and Blue current DAC*/
+#define LTC3208_REG_C_MAIN 0x3 /* Main current DAC */
+#define LTC3208_REG_D_SUB 0x4 /* Sub current DAC */
+#define LTC3208_REG_E_AUX_SELECT 0x5 /* AUX DAC Select */
+#define  LTC3208_AUX1_MASK GENMASK(1, 0)
+#define  LTC3208_AUX2_MASK GENMASK(3, 2)
+#define  LTC3208_AUX3_MASK GENMASK(5, 4)
+#define  LTC3208_AUX4_MASK GENMASK(7, 6)
+#define LTC3208_REG_F_CAM 0x6 /* CAM (High and Low) current DAC*/
+#define LTC3208_REG_G_OPT 0x7 /* Device Options */
+#define  LTC3208_OPT_CPO_MASK GENMASK(7, 6)
+#define  LTC3208_OPT_DIS_RGBDROP BIT(3)
+#define  LTC3208_OPT_DIS_CAMHILO BIT(2)
+#define  LTC3208_OPT_EN_RGBS BIT(1)
+
+#define LTC3208_MAX_BRIGHTNESS_4BIT 0xF
+#define LTC3208_MAX_BRIGHTNESS_8BIT 0xFF
+
+#define LTC3208_NUM_LED_GRPS 8
+#define LTC3208_NUM_AUX_LEDS 4
+
+#define LTC3208_NUM_AUX_OPT 4
+#define LTC3208_MAX_CPO_OPT 3
+
+enum ltc3208_aux_channel {
+	LTC3208_AUX_CHAN_AUX = 0,
+	LTC3208_AUX_CHAN_MAIN,
+	LTC3208_AUX_CHAN_SUB,
+	LTC3208_AUX_CHAN_CAM
+};
+
+enum ltc3208_channel {
+	LTC3208_CHAN_MAIN = 0,
+	LTC3208_CHAN_SUB,
+	LTC3208_CHAN_AUX,
+	LTC3208_CHAN_CAML,
+	LTC3208_CHAN_CAMH,
+	LTC3208_CHAN_RED,
+	LTC3208_CHAN_BLUE,
+	LTC3208_CHAN_GREEN,
+	LTC3208_CHAN_N_COUNT,
+};
+
+static const char *const ltc3208_dt_aux_channels[] = { "adi,aux1-channel",
+						       "adi,aux2-channel",
+						       "adi,aux3-channel",
+						       "adi,aux4-channel" };
+
+static const char *const ltc3208_aux_opt[] = { "aux", "main", "sub", "cam" };
+
+struct ltc3208_led {
+	struct led_classdev cdev;
+	struct i2c_client *client;
+	struct regmap_field *rfield;
+	enum ltc3208_channel channel;
+};
+
+struct ltc3208 {
+	struct ltc3208_led leds[LTC3208_NUM_LED_GRPS];
+	struct regmap *regmap;
+};
+
+static const struct regmap_config ltc3208_regmap_cfg = {
+	.reg_bits = 8,
+	.val_bits = 8,
+	.max_register = LTC3208_REG_G_OPT,
+	.cache_type = REGCACHE_FLAT_S,
+};
+
+static const struct reg_field ltc3208_led_reg_field[LTC3208_CHAN_N_COUNT] = {
+	[LTC3208_CHAN_MAIN] =  REG_FIELD(LTC3208_REG_C_MAIN, 0, 7),
+	[LTC3208_CHAN_SUB] =   REG_FIELD(LTC3208_REG_D_SUB, 0, 7),
+	[LTC3208_CHAN_BLUE] =  REG_FIELD(LTC3208_REG_B_AUXBLU, 0, 3),
+	[LTC3208_CHAN_AUX] =   REG_FIELD(LTC3208_REG_B_AUXBLU, 4, 7),
+	[LTC3208_CHAN_CAML] =  REG_FIELD(LTC3208_REG_F_CAM, 0, 3),
+	[LTC3208_CHAN_CAMH] =  REG_FIELD(LTC3208_REG_F_CAM, 4, 7),
+	[LTC3208_CHAN_RED] =   REG_FIELD(LTC3208_REG_A_GRNRED, 0, 3),
+	[LTC3208_CHAN_GREEN] = REG_FIELD(LTC3208_REG_A_GRNRED, 4, 7),
+};
+
+static int ltc3208_led_set_brightness(struct led_classdev *led_cdev,
+				      enum led_brightness brightness)
+{
+	struct ltc3208_led *led =
+		container_of(led_cdev, struct ltc3208_led, cdev);
+	u8 current_level = brightness;
+
+	return regmap_field_write(led->rfield, current_level);
+}
+
+static int ltc3208_probe(struct i2c_client *client)
+{
+	enum ltc3208_aux_channel aux_channels[LTC3208_NUM_AUX_LEDS];
+	struct ltc3208 *ddata;
+	struct regmap *regmap;
+	bool disable_rgb_aux4_dropout_signal;
+	bool disable_camhl_pin;
+	bool set_sub_control_pin;
+	int ret;
+	u8 reg_val;
+
+	regmap = devm_regmap_init_i2c(client, &ltc3208_regmap_cfg);
+	if (IS_ERR(regmap))
+		return dev_err_probe(&client->dev, PTR_ERR(regmap),
+				     "Failed to initialize regmap\n");
+
+	ddata = devm_kzalloc(&client->dev, sizeof(*ddata), GFP_KERNEL);
+	if (!ddata)
+		return -ENOMEM;
+
+	ddata->regmap = regmap;
+
+	disable_camhl_pin = device_property_read_bool(&client->dev,
+						      "adi,disable-camhl-pin");
+	set_sub_control_pin =
+		device_property_read_bool(&client->dev, "adi,cfg-enrgbs-pin");
+	disable_rgb_aux4_dropout_signal = device_property_read_bool(
+		&client->dev, "adi,disable-rgb-aux4-dropout");
+
+	reg_val = FIELD_PREP(LTC3208_OPT_EN_RGBS, set_sub_control_pin) |
+		  FIELD_PREP(LTC3208_OPT_DIS_CAMHILO, disable_camhl_pin) |
+		  FIELD_PREP(LTC3208_OPT_DIS_RGBDROP,
+			     disable_rgb_aux4_dropout_signal);
+
+	ret = regmap_write(regmap, LTC3208_REG_G_OPT, reg_val);
+	if (ret)
+		return dev_err_probe(&client->dev, ret,
+				     "error writing to options register\n");
+
+	/* Initialize aux channel configurations */
+	for (int i = 0; i < LTC3208_NUM_AUX_LEDS; i++) {
+		ret = device_property_match_property_string(
+			&client->dev, ltc3208_dt_aux_channels[i],
+			ltc3208_aux_opt, LTC3208_NUM_AUX_OPT);
+		/* Fallback to default value (AUX) if not found */
+		if (ret == -EINVAL)
+			aux_channels[i] = LTC3208_AUX_CHAN_AUX;
+		else if (ret >= 0)
+			aux_channels[i] = ret;
+	}
+
+	reg_val = FIELD_PREP(LTC3208_AUX1_MASK, aux_channels[0]) |
+		  FIELD_PREP(LTC3208_AUX2_MASK, aux_channels[1]) |
+		  FIELD_PREP(LTC3208_AUX3_MASK, aux_channels[2]) |
+		  FIELD_PREP(LTC3208_AUX4_MASK, aux_channels[3]);
+
+	ret = regmap_write(regmap, LTC3208_REG_E_AUX_SELECT, reg_val);
+	if (ret)
+		return dev_err_probe(&client->dev, ret,
+			"error writing to aux channel register.\n");
+
+	i2c_set_clientdata(client, ddata);
+
+	device_for_each_child_node_scoped(&client->dev, child) {
+		struct ltc3208_led *led;
+		struct led_init_data init_data = {};
+		u32 chan;
+
+		ret = fwnode_property_read_u32(child, "reg", &chan);
+		if (ret)
+			return dev_err_probe(&client->dev, ret,
+					    "Failed to get reg value of LED\n");
+		else if (chan >= LTC3208_NUM_LED_GRPS)
+			return dev_err_probe(&client->dev, ret,
+					     "%d is an invalid LED ID\n", chan);
+
+		led = &ddata->leds[chan];
+
+		led->rfield =
+			devm_regmap_field_alloc(&client->dev, ddata->regmap,
+						ltc3208_led_reg_field[chan]);
+		if (IS_ERR(led->rfield))
+			return dev_err_probe(&client->dev, PTR_ERR(led->rfield),
+					     "cannot allocate regmap field\n");
+		led->client = client;
+		led->channel = chan;
+		led->cdev.brightness_set_blocking = ltc3208_led_set_brightness;
+		led->cdev.max_brightness = LTC3208_MAX_BRIGHTNESS_4BIT;
+
+		if (chan == LTC3208_CHAN_MAIN || chan == LTC3208_CHAN_SUB)
+			led->cdev.max_brightness = LTC3208_MAX_BRIGHTNESS_8BIT;
+
+		init_data.fwnode = child;
+
+		ret = devm_led_classdev_register_ext(&client->dev, &led->cdev,
+						     &init_data);
+		if (ret)
+			return dev_err_probe(&client->dev, ret,
+					     "LED %u Register failed.\n", chan);
+	}
+
+	return 0;
+}
+
+static const struct of_device_id ltc3208_match_table[] = {
+	{.compatible = "adi,ltc3208"},
+	{}
+};
+MODULE_DEVICE_TABLE(of, ltc3208_match_table);
+
+static const struct i2c_device_id ltc3208_idtable[] = {
+	{ "ltc3208" },
+	{}
+};
+MODULE_DEVICE_TABLE(i2c, ltc3208_idtable);
+
+static struct i2c_driver ltc3208_driver = {
+	.driver = {
+		.name = "ltc3208",
+		.of_match_table = ltc3208_match_table,
+	},
+	.id_table = ltc3208_idtable,
+	.probe = ltc3208_probe,
+};
+module_i2c_driver(ltc3208_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Jan Carlo Roleda <jancarlo.roleda@analog.com>");
+MODULE_DESCRIPTION("LTC3208 LED Driver");

-- 
2.43.0


