Return-Path: <linux-leds+bounces-8960-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id dds4GTD4TWqqAwIAu9opvQ
	(envelope-from <linux-leds+bounces-8960-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 08 Jul 2026 09:11:44 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BD5C2722816
	for <lists+linux-leds@lfdr.de>; Wed, 08 Jul 2026 09:11:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=analog.com header.s=DKIM header.b=kROOnZZN;
	dmarc=pass (policy=quarantine) header.from=analog.com;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8960-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-leds+bounces-8960-lists+linux-leds=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9824E30EC0AD
	for <lists+linux-leds@lfdr.de>; Wed,  8 Jul 2026 07:01:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A3C63F4138;
	Wed,  8 Jul 2026 07:01:00 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E95F3E7BAF;
	Wed,  8 Jul 2026 07:00:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783494056; cv=none; b=gOOVo9ZSen26iPgiOUuWh20kMC+MgMavuVGvpXpQAQ186uKdymgSZZJd5Md72kEUKCLf6hCd/HR9Z9xQX3MhKZ7fUrpnDOHELEguvTIQl90tyVc9Rz6XAXwnPgAakFBaj2tmwOXkF7OyMMRIvSog7o7Tfe6A3CctVKGjwOssXRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783494056; c=relaxed/simple;
	bh=vUaPD6dZc+iR1UBNH6MSrZ693mPZurj+WyCmqq5yywM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=jULc7GAh4XUbG+LfrN7MgvFVNA52O20pGHeDSELhH6Q39/ReHHdLNfy9AWL+K1Bpd3akyu5essqujUOAqH6jl6NOTpHT7fIDFMDIWPH5McBXx3m512gOyWBhpi/GVnTjGcFISg6DEBW3RGABWkEbz8qtKE2WVslqu8hp8yg0szw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=kROOnZZN; arc=none smtp.client-ip=148.163.135.77
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6684MnBF1279657;
	Wed, 8 Jul 2026 03:00:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=yRD41
	OIsB46mcgGWKF+FRzMFI2PLZFP41IScCdYpFl8=; b=kROOnZZNx3r+WWpxYIh0N
	tP6O7eMPt9VOU7FxtT35rXTociAk1v+GZRAqqVTfjqkOJSBVhL8VnjQ6rM5aG8gQ
	nfFq9RLUV+WQ0EG0wTODm+LaR1yD9xtz7j7sqqVjJKToBn7Px3ROAscowOjXSsT/
	GxVk0KOlstpXGo9Qt2227DpKsjPiEV3DgZEPrJ+BgxtA7WGyNo2WyZzpoXvw6LcL
	lLlNDDpWa72Wie3MoxbDd4I3veOz1Di8qlkUvvjOk2PsrC9Hx2BYmjozaQFGn91Y
	jEvwejIQDapI40va1yltizvL9zPItJ25T/MsAjr+YKJDXgoeGc24vgK4hSRhXzca
	A==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4f9ffngky7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Jul 2026 03:00:35 -0400 (EDT)
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 66870YV0044529
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 8 Jul 2026 03:00:34 -0400
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by ASHBMBX9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.37; Wed, 8 Jul
 2026 03:00:34 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.2.1748.37 via Frontend
 Transport; Wed, 8 Jul 2026 03:00:34 -0400
Received: from HYB-VFz9h4bIQxi.ad.analog.com (HYB-VFz9h4bIQxi.ad.analog.com [10.118.4.21])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 66870ADE006727;
	Wed, 8 Jul 2026 03:00:24 -0400
From: Jan Carlo Roleda <jancarlo.roleda@analog.com>
Date: Wed, 8 Jul 2026 15:00:07 +0800
Subject: [PATCH v7 2/2] leds: ltc3208: Add driver for LTC3208 Multidisplay
 LED Driver
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260708-upstream-ltc3208-v7-2-aed7f7bd461c@analog.com>
References: <20260708-upstream-ltc3208-v7-0-aed7f7bd461c@analog.com>
In-Reply-To: <20260708-upstream-ltc3208-v7-0-aed7f7bd461c@analog.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783494010; l=11316;
 i=jancarlo.roleda@analog.com; s=20260317; h=from:subject:message-id;
 bh=vUaPD6dZc+iR1UBNH6MSrZ693mPZurj+WyCmqq5yywM=;
 b=P51AHipV57iHYYQbGM/26aWqehySZ3uXG0iGy4uVb1OFVn73WhQ2N1sKoMJ/gW7/LwzGcn9lY
 cypa0LTsfbeCdFolmbi9TNZpi3P07nsBhZw5tuTVZt1RlvbMBSu1L7h
X-Developer-Key: i=jancarlo.roleda@analog.com; a=ed25519;
 pk=zPMh+eO6/Mj6tqaie75BLiTLQvE3f9pck0UejKLmLMc=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Authority-Analysis: v=2.4 cv=cvGrVV4i c=1 sm=1 tr=0 ts=6a4df593 cx=c_pps
 a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=0sLvza09kfJOxVLZPwjg:22 a=Z0pTeXoby7EwIRygza74:22 a=gAnH3GRIAAAA:8
 a=VwQbUJbxAAAA:8 a=FfwCkgHInPnU5R23u4kA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: iEnMXXf8iLRJm2oCWm4hubIUiL7C47SK
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDA2NSBTYWx0ZWRfX2KxV+H/yVHWy
 TIR5axKTUSO34qCQnw2zdABHFItizhnezwQp0sQeS77MQNmuMRe71OVb9yN6ABsJtaBDpIXacwr
 WOjFdVuMwmmyW0CK7BN56Nd+PTC+bzMVh0dX/piTNemgwOW8f3FP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDA2NSBTYWx0ZWRfX7DqP1N2c9e88
 KsPg9jZnOlC6TL8U3qZXQdl4zuVMPdV5rHcfDKTt11hJbWs3Y3z5YrDOigBx/d+0HkRnf71kud0
 ocNooE/AbmZbzE0TXDgQ7l29WUbPiEZWy2htSiX4z0Rte5kfsqJMGyVK0Fw/XKu5GzlxxB2I0QX
 zfNKglsajjbITwBbDr5uFtV96O3IoSskyMI1pVGiB/xXCd91bk36/7PaGlENS1rUJfbX50Jg2N2
 xs98Nsp601q/arWBbYPXLC/YlQMcIG6utjXDXsz2UUSixgvskMNxtx30lDkC3ARTSOO/FjRBJzg
 IdtZdz32Tub+oYljtupggvAaYQjVZyopKsfQM/HbCPICo9mQylu/nRPcok9cAAbvznggMJ1V8Pn
 RGr5WQy314jPSwya/3okNuG+8+zVkUz29bLgEtwg8D5sodcuCpo3ZBfB3K7Nad+mREN2KqSGY9D
 KKXIjs9p4CIqTSajCMg==
X-Proofpoint-GUID: iEnMXXf8iLRJm2oCWm4hubIUiL7C47SK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_06,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 adultscore=0 impostorscore=0 spamscore=0
 clxscore=1015 priorityscore=1501 malwarescore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080065
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
	TAGGED_FROM(0.00)[bounces-8960-lists,linux-leds=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,analog.com:dkim,analog.com:mid,analog.com:from_mime,analog.com:url,analog.com:email,vger.kernel.org:from_smtp];
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
X-Rspamd-Queue-Id: BD5C2722816

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
sub-channels, which current is selected via the CAMHL pin, or set to
CAMHI register only via setting the S_CAMHILO bit high in register G (0x7).

Signed-off-by: Jan Carlo Roleda <jancarlo.roleda@analog.com>
---
 MAINTAINERS                 |   1 +
 drivers/leds/Kconfig        |  12 +++
 drivers/leds/Makefile       |   1 +
 drivers/leds/leds-ltc3208.c | 251 ++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 265 insertions(+)

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
index 000000000000..484690e3763c
--- /dev/null
+++ b/drivers/leds/leds-ltc3208.c
@@ -0,0 +1,251 @@
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
+};
+
+struct ltc3208 {
+	struct ltc3208_led leds[LTC3208_NUM_LED_GRPS];
+};
+
+static const struct reg_default ltc3208_reg_defaults[LTC3208_REG_G_OPT] = {
+	{LTC3208_REG_A_GRNRED, 0},
+	{LTC3208_REG_B_AUXBLU, 0},
+	{LTC3208_REG_C_MAIN, 0},
+	{LTC3208_REG_D_SUB, 0},
+	{LTC3208_REG_E_AUX_SELECT, 0},
+	{LTC3208_REG_F_CAM, 0},
+	{LTC3208_REG_G_OPT, 0}
+};
+
+static const struct regmap_config ltc3208_regmap_cfg = {
+	.reg_bits = 8,
+	.val_bits = 8,
+	.max_register = LTC3208_REG_G_OPT,
+	.cache_type = REGCACHE_FLAT_S,
+	.reg_defaults = ltc3208_reg_defaults,
+	.num_reg_defaults = LTC3208_REG_G_OPT,
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
+		  FIELD_PREP(LTC3208_OPT_CPO_MASK, 0) |
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
+					     "%u is an invalid LED ID\n", chan);
+		else if (ddata->leds[chan].client)
+			return dev_err_probe(&client->dev, -EINVAL,
+					"%u is already registered\n", chan);
+
+		led = &ddata->leds[chan];
+
+		led->rfield = devm_regmap_field_alloc(&client->dev, regmap,
+						ltc3208_led_reg_field[chan]);
+		if (IS_ERR(led->rfield))
+			return dev_err_probe(&client->dev, PTR_ERR(led->rfield),
+					     "cannot allocate regmap field\n");
+		led->client = client;
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


