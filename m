Return-Path: <linux-leds+bounces-8708-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id jH12EfAoOmo/3AcAu9opvQ
	(envelope-from <linux-leds+bounces-8708-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Tue, 23 Jun 2026 08:34:24 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B1546B4904
	for <lists+linux-leds@lfdr.de>; Tue, 23 Jun 2026 08:34:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=analog.com header.s=DKIM header.b=t8N0WJ8o;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8708-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-leds+bounces-8708-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=analog.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 536F53055932
	for <lists+linux-leds@lfdr.de>; Tue, 23 Jun 2026 06:33:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15AAA3C3442;
	Tue, 23 Jun 2026 06:33:24 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 347723C3782;
	Tue, 23 Jun 2026 06:33:22 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782196404; cv=none; b=EzzYYEzzceqgJ9SHbNreBEybSesLbLvhvLzhp5+qBef8nzCFJ5WGpbKqOOHYHI/ldYnkiycObCkxhmAPLUc0VEf1ahS2ILivQIu6ZlsZg01KIoPUr2wz3UngEExyzOWg6+gxc76HCBQx/pyGP/1Sxdld7SwxrSLxrccYAdQTDZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782196404; c=relaxed/simple;
	bh=2Mh4DTn+jz1SP44XLSrYsqdXoORxEFc/Vw2dw/cKQUw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=NenLuoARoldYP6QW5Y3GZKOIqVwECTsU26JLBd0VXYtmrS8w5+3DnLD1Fu/spNaawf+lirBdCLO55RJuLAI3XuGjNWMLALsxE4EemDgGoBjzmn8ns9VH873xPnAvVJSFBrgoprUZDrK0gW3c5v5PU4G1FL0QJ0cmqjt8JobUoIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=t8N0WJ8o; arc=none smtp.client-ip=148.163.135.77
Received: from pps.filterd (m0516787.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65N4MgKs1060007;
	Tue, 23 Jun 2026 02:33:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=UM5vr
	y1l9Lkdp2GL3NxdHUFFNMXp6P43+vQygQCilE0=; b=t8N0WJ8oSl0VjOIbjtSrF
	ZSnYUw4srENdb6KGEvRe8497ZYXhX9Y6H93Ub6nZN9QyfafHifvSMeEUA5woOBrB
	dHInKG3MGsrSeyvxDNRpAI2JulPL7Ca2BZTfhC5IPH28LbyF1nXKVIA192GU6Yvd
	uj7MB9yB7bnuFVerNrDc4Tlzt/c6AUo7ib/br2p1+jgPzsm9HK4k+Xju6SXHtrJM
	PTxSH8+8hfoENAbHnUIhb+qTPgKAIqxzM8GoZ745j39i/9xWGQshxrmug63YNXB6
	oZbWigslbpJHFCKi87oSoQLCAjv+F7pq84nE/x5j8P3oZ+gqz2w2DXsgn7x46RZn
	w==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4exc6gg2ej-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 23 Jun 2026 02:33:08 -0400 (EDT)
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 65N6X7Ur003627
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 23 Jun 2026 02:33:07 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by ASHBMBX8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.37; Tue, 23 Jun
 2026 02:33:07 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.1748.37 via Frontend
 Transport; Tue, 23 Jun 2026 02:33:07 -0400
Received: from HYB-VFz9h4bIQxi.ad.analog.com (HYB-VFz9h4bIQxi.ad.analog.com [10.118.4.27])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 65N6WlDL023894;
	Tue, 23 Jun 2026 02:33:00 -0400
From: Jan Carlo Roleda <jancarlo.roleda@analog.com>
Date: Tue, 23 Jun 2026 14:32:30 +0800
Subject: [PATCH v6 2/2] leds: ltc3208: Add driver for LTC3208 Multidisplay
 LED Driver
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260623-upstream-ltc3208-v6-2-fc6bd9749166@analog.com>
References: <20260623-upstream-ltc3208-v6-0-fc6bd9749166@analog.com>
In-Reply-To: <20260623-upstream-ltc3208-v6-0-fc6bd9749166@analog.com>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <linux-leds@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        =?utf-8?q?Uwe_Kleine-K=C3=B6nig?=
	<u.kleine-koenig@baylibre.com>,
        Jan Carlo Roleda <jancarlo.roleda@analog.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782196367; l=11027;
 i=jancarlo.roleda@analog.com; s=20260317; h=from:subject:message-id;
 bh=2Mh4DTn+jz1SP44XLSrYsqdXoORxEFc/Vw2dw/cKQUw=;
 b=HP7kA9uRTFPsuLyZxVBW6M+KIRTkgbFymbFXlE59CiGsQtUqRIEKp+1SdI5DyYpVlwE0Rq3A9
 mjCgpcc1dALBIO63U7Z8R4GpGu53AcFzBbrNdLmOSAXgNMhxTUQlILH
X-Developer-Key: i=jancarlo.roleda@analog.com; a=ed25519;
 pk=zPMh+eO6/Mj6tqaie75BLiTLQvE3f9pck0UejKLmLMc=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-GUID: JE9JCRUKADJ_Lwjmw6EucPGr2yzUkdcu
X-Proofpoint-ORIG-GUID: JE9JCRUKADJ_Lwjmw6EucPGr2yzUkdcu
X-Authority-Analysis: v=2.4 cv=SOZykuvH c=1 sm=1 tr=0 ts=6a3a28a4 cx=c_pps
 a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=0sLvza09kfJOxVLZPwjg:22 a=OmVn7CZJonkx5R5zMQLL:22 a=gAnH3GRIAAAA:8
 a=VwQbUJbxAAAA:8 a=FfwCkgHInPnU5R23u4kA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDA1MCBTYWx0ZWRfXz3TvNIFdaH9V
 5/vuOEfa5LDsqGC8Zj7DKucn603JfND9oroKktM0oO/pkO5eIjB1UBOhOxfNFcC/4eALQsZ18M4
 eANl5NRiCiZwmPwsnPfquCS1Nfkt0zcdSzY4IpkqupE8EF3LE8Ds
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDA1MCBTYWx0ZWRfX4KW30mK9CU8H
 wzHgP0q6ZGPiU3eqY0sXyfld/97jzMPu8Sl8aW8tb4NtC930wjfbKWYljJp/AwKPJwaPWGibHNv
 sPgt/K4zFzvKhUER0aS4E4tj8zg39ns5MppwnRPcugyW2wdNmMyMrAkOg/5dz3cLD+fMEhm5cH0
 kVdhtHwz5RcBbnY8Fewp1HLF0iI7KtDwusyRlsrkK+AuaOvi+ZBXb/KKjVMUh5Cq+wXJZXCdMp8
 74nXix4ZUmp1gGI05zJcXKBrU0OB3ug2JhroDgpXyuMTrwEf3TF7r0BBrse0s2/jXDxJ9vQZpiN
 xYZrnOtFMHbUutBhz3HnbO1sTA5NL59vxbzV2cd++Ico3EmGU3fKUKUxE0kpKgUACZJh/R/h5wC
 nL+TlO8IehbZg7yv5HWtzplcKYwqefRF/AnLyjGBrPcd1SLWrh+Bp13SLodAJR3gZ6X/qEVjk2N
 lBmeR6qgv2+vpXpyp4g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_01,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0
 spamscore=0 priorityscore=1501 adultscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606230050
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[analog.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[analog.com:s=DKIM];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8708-lists,linux-leds=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[analog.com:url,analog.com:from_mime,analog.com:dkim,analog.com:email,analog.com:mid,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	FORGED_SENDER(0.00)[jancarlo.roleda@analog.com,linux-leds@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:pavel@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-leds@vger.kernel.org,m:devicetree@vger.kernel.org,m:u.kleine-koenig@baylibre.com,m:jancarlo.roleda@analog.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[analog.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jancarlo.roleda@analog.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8B1546B4904

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
 drivers/leds/leds-ltc3208.c | 244 ++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 258 insertions(+)

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
index 000000000000..3d6bec99e9ea
--- /dev/null
+++ b/drivers/leds/leds-ltc3208.c
@@ -0,0 +1,244 @@
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
+	disable_rgb_aux4_dropout_signal =
+				device_property_read_bool(&client->dev,
+						"adi,disable-rgb-aux4-dropout");
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
+		if (ret == -ENODATA || ret == -EINVAL)
+			aux_channels[i] = LTC3208_AUX_CHAN_AUX;
+		else if (ret < 0)
+			return dev_err_probe(&client->dev, ret,
+					     "Error reading AUX Channel %d", i);
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
+			return dev_err_probe(&client->dev, -EINVAL,
+					     "%d is an invalid LED ID\n", chan);
+		else if (ddata->leds[chan].client)
+			return dev_err_probe(&client->dev, -EINVAL,
+					"%d is already registered\n", chan);
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
+	{ .compatible = "adi,ltc3208" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, ltc3208_match_table);
+
+static const struct i2c_device_id ltc3208_idtable[] = {
+	{ .name = "ltc3208" },
+	{ }
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


