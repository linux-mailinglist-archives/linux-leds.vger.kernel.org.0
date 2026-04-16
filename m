Return-Path: <linux-leds+bounces-7737-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AIPVBl1M4GkXegAAu9opvQ
	(envelope-from <linux-leds+bounces-7737-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 16 Apr 2026 04:41:33 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BC85E409BBB
	for <lists+linux-leds@lfdr.de>; Thu, 16 Apr 2026 04:41:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EFDA0310AB48
	for <lists+linux-leds@lfdr.de>; Thu, 16 Apr 2026 02:39:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A58F270EDF;
	Thu, 16 Apr 2026 02:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="GeJdVL0b"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40ED427587D;
	Thu, 16 Apr 2026 02:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776307181; cv=none; b=EiSxmslSaO2slmh8Q7bvXUel0RVruEb/3BEBUL5ZwaOSw65jGmaXIIoepWTM3TpFzwIMurnHF/KXujr0FQcs0tmm5XJOFuL4OyxvmsVisatoAqQz21MrTxOXtQ5juyCAiUazCeO9/j7flqvERbYTKTym3Tc8B1Td+kGzyj06x2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776307181; c=relaxed/simple;
	bh=LTYgb3hao63sc4cta2ZLwb5Je3NYS1TyWh03f9mDiTU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=k4oco/FrwYes1AZ817IgvWp6bGqRt01WkvRacmrnj5k73tyMCu3S6wkCWouwjT6FjcYLou/7tP5uiKXsgncrYnU53IZ1Lk/A//DgNCFh1lpI1tholgvweWoZrC1wab6WhyrTfbHYLHnDeXIixn9wuRzGaDu8Ajv5GuNWwNfrhTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=GeJdVL0b; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0516787.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63G20q7i3360118;
	Wed, 15 Apr 2026 22:39:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=wGtOU
	5nVpb5sTOJxIDjHCeb8sIE1nCb0EjVBO1vHSOY=; b=GeJdVL0ba+55NuQEqCCJW
	oaVjfEmYbOs/ZJEujzuUQF4NNV6cqMlkcmP9cHmOdqkbEmF5Cnw00wFYyJP76Ww7
	fxAXYLGz0HX+2kCcCY5n6CaIt+EgoMp4FPhvkWq9o+LF1KeougRWLX0RCSoLJbSO
	fX+E22kPhxrkqA3/5HYh9/bJWxmZj50IDoUOcU5bH3pTfzS65b57qO20aWAWzWmD
	slHEQCVoiYp2AS9015R/vIleq+tA60x7rxwTpvQnLGmIudt3zZZoCyV67HTcynKm
	QIhogoqaQbCIjmnf+rwyOy7ZbAqj0zUNNu9njiO1ZI1ht5p3/Iwme33Px7HEXiIU
	A==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4dh859avqg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Apr 2026 22:39:36 -0400 (EDT)
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 63G2dZKj001045
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 15 Apr 2026 22:39:35 -0400
Received: from ASHBCASHYB4.ad.analog.com (10.64.17.132) by
 ASHBMBX9.ad.analog.com (10.64.17.10) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.37; Wed, 15 Apr 2026 22:39:35 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by
 ASHBCASHYB4.ad.analog.com (10.64.17.132) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.37; Wed, 15 Apr 2026 22:39:34 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.1748.37 via Frontend
 Transport; Wed, 15 Apr 2026 22:39:34 -0400
Received: from HYB-VFz9h4bIQxi.ad.analog.com (HYB-VFz9h4bIQxi.ad.analog.com [10.118.4.30])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 63G2dJpP001886;
	Wed, 15 Apr 2026 22:39:30 -0400
From: Jan Carlo Roleda <jancarlo.roleda@analog.com>
Date: Thu, 16 Apr 2026 10:39:07 +0800
Subject: [PATCH v4 2/2] leds: ltc3208: Add driver for LTC3208 Multidisplay
 LED Driver
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260416-upstream-ltc3208-v4-2-3884ed3e49f5@analog.com>
References: <20260416-upstream-ltc3208-v4-0-3884ed3e49f5@analog.com>
In-Reply-To: <20260416-upstream-ltc3208-v4-0-3884ed3e49f5@analog.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776307159; l=12099;
 i=jancarlo.roleda@analog.com; s=20260317; h=from:subject:message-id;
 bh=LTYgb3hao63sc4cta2ZLwb5Je3NYS1TyWh03f9mDiTU=;
 b=+T9F9jmiB+jNzCNeXXkQgwT0OUwaf0VbLmT4HC1X2EbL/Lsz6HGm7NBhtM47QkFp4HdO50pzm
 ez0EEVHc4/fAOdynfv8b2cChxD5/HtcXEki0Wt+7Ch03NkF82GVcpDn
X-Developer-Key: i=jancarlo.roleda@analog.com; a=ed25519;
 pk=zPMh+eO6/Mj6tqaie75BLiTLQvE3f9pck0UejKLmLMc=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-ORIG-GUID: F23AWa7Z7WdUYMSIwfMNkZiKHWZ6V_DQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE2MDAyMiBTYWx0ZWRfXw+KpY1rQfETU
 xkfQxJ0CRWPh+kbdtaeBAtztQq6QauWoF5ATfCoY+Mnb1Q/aeMTGiSFYDvEewkhsBo2OiUMzX7r
 B9hgPwGb7Q3BcC9ZL6VQ3cWKdQMEoylF78mdraMW2lZqwRBUqNTJx1m+oBhD+kkpDXjmoJugmGZ
 gZ50BKH6QeQF7SYLTMUe+wWxkOr7nF2lBGEMdveI77+VZoiYpldMeLge/LQPnm4lEMyReo4Wuep
 jge3KnVC5f7iaaeTQQTBP7lmEpRNbW8nBgGeIlRx4KiF5Lr03ii+d++V6YLJ7l8aNxymMdCGvMz
 FgYa/3EC55v+LRS2uoOVapjxzqj2Pn31CG4XjNsCkfagNJXp/v67W28f+H9yoecBVmVX4RCL9tg
 tEvgQ0HPs6JO6ent1OFDhr6S1oXHexhUTh3xQ3bI3UwEpzNtGZI7NiWl6z4EfAYFSr3PTsmYeDy
 lgGlu7lsR3Vj99uaYQQ==
X-Authority-Analysis: v=2.4 cv=Ivkutr/g c=1 sm=1 tr=0 ts=69e04be8 cx=c_pps
 a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=0sLvza09kfJOxVLZPwjg:22 a=OmVn7CZJonkx5R5zMQLL:22 a=gAnH3GRIAAAA:8
 a=VwQbUJbxAAAA:8 a=LwcTF07uJLLPXximDlYA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: F23AWa7Z7WdUYMSIwfMNkZiKHWZ6V_DQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_01,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 spamscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604160022
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[analog.com,quarantine];
	R_DKIM_ALLOW(-0.20)[analog.com:s=DKIM];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	ASN_FAIL(0.00)[1.2.3.5.c.f.2.1.0.0.0.0.0.0.0.0.b.d.0.0.1.0.0.e.a.0.c.3.0.0.6.2.asn6.rspamd.com:server fail];
	DKIM_TRACE(0.00)[analog.com:+];
	TAGGED_FROM(0.00)[bounces-7737-lists,linux-leds=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	FROM_NEQ_ENVFROM(0.00)[jancarlo.roleda@analog.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,analog.com:mid,analog.com:email,analog.com:dkim,analog.com:url]
X-Rspamd-Queue-Id: BC85E409BBB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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
 MAINTAINERS                 |   2 +-
 drivers/leds/Kconfig        |  12 ++
 drivers/leds/Makefile       |   1 +
 drivers/leds/leds-ltc3208.c | 278 ++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 292 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 19b0b84e934d..48bae02057d5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15131,7 +15131,7 @@ M:	Jan Carlo Roleda <jancarlo.roleda@analog.com>
 L:	linux-leds@vger.kernel.org
 S:	Maintained
 W:	https://ez.analog.com/linux-software-drivers
-F:	Documentation/devicetree/bindings/leds/adi,ltc3208.yaml
+F:	drivers/leds/leds-ltc3208.c
 
 LTC4282 HARDWARE MONITOR DRIVER
 M:	Nuno Sa <nuno.sa@analog.com>
diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index 597d7a79c988..d13bbec73f06 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -1029,6 +1029,18 @@ config LEDS_ACER_A500
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
index 8fdb45d5b439..b08b539112b6 100644
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
index 000000000000..9da8f4b359e3
--- /dev/null
+++ b/drivers/leds/leds-ltc3208.c
@@ -0,0 +1,278 @@
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
+#define LTC3208_LED_SET_HIGH_BYTE_DATA	GENMASK(7, 4)
+#define LTC3208_LED_SET_LOW_BYTE_DATA	GENMASK(3, 0)
+
+/* Registers */
+#define LTC3208_REG_A_GRNRED		0x1 /* Green (High half-byte) */
+					/* and Red (Low half-byte) current DAC*/
+#define LTC3208_REG_B_AUXBLU		0x2 /* AUX (High half-byte) */
+					/* and Blue (Low half-byte) current DAC*/
+#define LTC3208_REG_C_MAIN		0x3 /* Main current DAC */
+#define LTC3208_REG_D_SUB		0x4 /* Sub current DAC */
+#define LTC3208_REG_E_AUX_SELECT	0x5 /* AUX DAC Select */
+#define  LTC3208_AUX1_MASK		GENMASK(1, 0)
+#define  LTC3208_AUX2_MASK		GENMASK(3, 2)
+#define  LTC3208_AUX3_MASK		GENMASK(5, 4)
+#define  LTC3208_AUX4_MASK		GENMASK(7, 6)
+#define LTC3208_REG_F_CAM		0x6 /* CAM (High half-byte and Low half-byte) current DAC*/
+#define LTC3208_REG_G_OPT		0x7 /* Device Options */
+#define  LTC3208_OPT_CPO_MASK		GENMASK(7, 6)
+#define  LTC3208_OPT_DIS_RGBDROP	BIT(3)
+#define  LTC3208_OPT_DIS_CAMHILO	BIT(2)
+#define  LTC3208_OPT_EN_RGBS		BIT(1)
+
+#define LTC3208_MAX_BRIGHTNESS_4BIT	0xF
+#define LTC3208_MAX_BRIGHTNESS_8BIT	0xFF
+
+#define LTC3208_NUM_LED_GRPS		8
+#define LTC3208_NUM_AUX_LEDS		4
+
+#define LTC3208_NUM_AUX_OPT		4
+#define LTC3208_MAX_CPO_OPT		3
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
+	LTC3208_CHAN_GREEN
+};
+
+static const char * const ltc3208_dt_aux_channels[] = {
+	"adi,aux1-channel", "adi,aux2-channel",
+	"adi,aux3-channel", "adi,aux4-channel"
+};
+
+static const char * const ltc3208_aux_opt[] = {
+	"aux", "main", "sub", "cam"
+};
+
+struct ltc3208_led {
+	struct led_classdev cdev;
+	struct i2c_client *client;
+	enum ltc3208_channel channel;
+};
+
+struct ltc3208_dev {
+	struct i2c_client *client;
+	struct regmap *map;
+	struct ltc3208_led *leds;
+};
+
+static const struct regmap_config ltc3208_regmap_cfg = {
+	.reg_bits = 8,
+	.val_bits = 8,
+};
+
+static int ltc3208_led_set_current_low(struct regmap *regmap, u8 reg, u8 level)
+{
+	return regmap_update_bits(regmap, reg, LTC3208_LED_SET_LOW_BYTE_DATA, level);
+}
+
+static int ltc3208_led_set_current_high(struct regmap *regmap, u8 reg, u8 level)
+{
+	return regmap_update_bits(regmap, reg, LTC3208_LED_SET_HIGH_BYTE_DATA, level);
+}
+
+static int ltc3208_led_set_brightness(struct led_classdev *led_cdev, enum led_brightness brightness)
+{
+	struct ltc3208_led *led = container_of(led_cdev, struct ltc3208_led, cdev);
+	struct i2c_client *client = led->client;
+	struct ltc3208_dev *dev = i2c_get_clientdata(client);
+	struct regmap *regmap = dev->map;
+	u8 current_level = brightness;
+
+	switch (led->channel) {
+	case LTC3208_CHAN_MAIN:
+		return regmap_write(regmap, LTC3208_REG_C_MAIN, current_level);
+	case LTC3208_CHAN_SUB:
+		return regmap_write(regmap, LTC3208_REG_D_SUB, current_level);
+	case LTC3208_CHAN_AUX:
+		return ltc3208_led_set_current_high(regmap, LTC3208_REG_B_AUXBLU, current_level);
+	case LTC3208_CHAN_BLUE:
+		return ltc3208_led_set_current_low(regmap, LTC3208_REG_B_AUXBLU, current_level);
+	case LTC3208_CHAN_CAMH:
+		return ltc3208_led_set_current_high(regmap, LTC3208_REG_F_CAM, current_level);
+	case LTC3208_CHAN_CAML:
+		return ltc3208_led_set_current_low(regmap, LTC3208_REG_F_CAM, current_level);
+	case LTC3208_CHAN_GREEN:
+		return ltc3208_led_set_current_high(regmap, LTC3208_REG_A_GRNRED, current_level);
+	case LTC3208_CHAN_RED:
+		return ltc3208_led_set_current_low(regmap, LTC3208_REG_A_GRNRED, current_level);
+	default:
+		dev_err(&client->dev, "Invalid LED Channel\n");
+		return -EINVAL;
+	}
+}
+
+static int ltc3208_update_options(struct ltc3208_dev *dev,
+				  bool is_sub, bool is_cam_hi, bool is_rgb_drop)
+{
+	struct regmap *map = dev->map;
+	u8 val;
+
+	val =	FIELD_PREP(LTC3208_OPT_EN_RGBS, is_sub) |
+		FIELD_PREP(LTC3208_OPT_DIS_CAMHILO, is_cam_hi) |
+		FIELD_PREP(LTC3208_OPT_DIS_RGBDROP, is_rgb_drop);
+
+	return regmap_write(map, LTC3208_REG_G_OPT, val);
+}
+
+static int ltc3208_update_aux_dac(struct ltc3208_dev *dev, enum ltc3208_aux_channel *aux_chan)
+{
+	struct regmap *map = dev->map;
+	u8 val;
+
+	val =	FIELD_PREP(LTC3208_AUX1_MASK, aux_chan[0]) |
+		FIELD_PREP(LTC3208_AUX2_MASK, aux_chan[1]) |
+		FIELD_PREP(LTC3208_AUX3_MASK, aux_chan[2]) |
+		FIELD_PREP(LTC3208_AUX4_MASK, aux_chan[3]);
+
+	return regmap_write(map, LTC3208_REG_E_AUX_SELECT, val);
+}
+
+static int ltc3208_probe(struct i2c_client *client)
+{
+	enum ltc3208_aux_channel aux_channels[LTC3208_NUM_AUX_LEDS];
+	struct ltc3208_dev *dev_data;
+	struct ltc3208_led *leds;
+	struct regmap *regmap;
+	int ret;
+	u32 val;
+	bool dropdis_rgb_aux4;
+	bool dis_camhl;
+	bool en_rgbs;
+
+	regmap = devm_regmap_init_i2c(client, &ltc3208_regmap_cfg);
+	if (IS_ERR(regmap))
+		return dev_err_probe(&client->dev, PTR_ERR(regmap),
+				     "Failed to initialize regmap\n");
+
+	dev_data = devm_kzalloc(&client->dev, sizeof(*dev_data), GFP_KERNEL);
+	if (!dev_data)
+		return -ENOMEM;
+
+	leds = devm_kcalloc(&client->dev, LTC3208_NUM_LED_GRPS,
+			    sizeof(struct ltc3208_led), GFP_KERNEL);
+	if (!leds)
+		return -ENOMEM;
+
+	dev_data->client = client;
+	dev_data->map = regmap;
+
+	dis_camhl = device_property_read_bool(&client->dev, "adi,disable-camhl-pin");
+	en_rgbs = device_property_read_bool(&client->dev, "adi,cfg-enrgbs-pin");
+	dropdis_rgb_aux4 = device_property_read_bool(&client->dev, "adi,disable-rgb-aux4-dropout");
+
+	ret = ltc3208_update_options(dev_data, en_rgbs, dis_camhl,
+				     dropdis_rgb_aux4);
+	if (ret)
+		return dev_err_probe(&client->dev, ret, "error writing to options register\n");
+
+	/* Initialize aux channel configurations from devicetree */
+	for (int i = 0; i < LTC3208_NUM_AUX_LEDS; i++) {
+		ret = device_property_match_property_string(&client->dev,
+							    ltc3208_dt_aux_channels[i],
+							    ltc3208_aux_opt,
+							    LTC3208_NUM_AUX_OPT);
+		/* Use default value if absent in devicetree */
+		if (ret == -EINVAL)
+			aux_channels[i] = LTC3208_AUX_CHAN_AUX;
+		else if (ret >= 0)
+			aux_channels[i] = ret;
+		else
+			return dev_err_probe(&client->dev, ret,
+					     "Failed getting aux-channel %d\n", i);
+	}
+
+	ret = ltc3208_update_aux_dac(dev_data, aux_channels);
+	if (ret)
+		return dev_err_probe(&client->dev, ret, "error writing to aux channel register.\n");
+
+	i2c_set_clientdata(client, dev_data);
+
+	device_for_each_child_node_scoped(&client->dev, child) {
+		struct ltc3208_led *led;
+		struct led_init_data init_data = {};
+
+		ret = fwnode_property_read_u32(child, "reg", &val);
+		if (ret)
+			return dev_err_probe(&client->dev, -EINVAL,
+					     "Failed to get reg value of LED.\n");
+		else if (val >= LTC3208_NUM_LED_GRPS)
+			return dev_err_probe(&client->dev, -EINVAL,
+					     "LED reg value not supported.\n");
+
+		led = &leds[val];
+		led->client = client;
+		led->channel = val;
+		led->cdev.brightness_set_blocking = ltc3208_led_set_brightness;
+		led->cdev.max_brightness = LTC3208_MAX_BRIGHTNESS_4BIT;
+		if (val == LTC3208_CHAN_MAIN || val == LTC3208_CHAN_SUB)
+			led->cdev.max_brightness = LTC3208_MAX_BRIGHTNESS_8BIT;
+
+		init_data.fwnode = child;
+
+		ret = devm_led_classdev_register_ext(&client->dev, &led->cdev,
+			&init_data);
+		if (ret)
+			return dev_err_probe(&client->dev, ret, "Failed to register LED %u\n", val);
+	}
+
+	dev_data->leds = leds;
+
+	return 0;
+}
+
+static const struct of_device_id ltc3208_match_table[] = {
+	{.compatible = "adi,ltc3208"},
+	{ }
+};
+MODULE_DEVICE_TABLE(of, ltc3208_match_table);
+
+static const struct i2c_device_id ltc3208_idtable[] = {
+	{ "ltc3208" },
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


