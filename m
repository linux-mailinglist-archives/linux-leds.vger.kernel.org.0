Return-Path: <linux-leds+bounces-7502-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +AniOTJjxGmBywQAu9opvQ
	(envelope-from <linux-leds+bounces-7502-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 25 Mar 2026 23:35:30 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 48AF732D129
	for <lists+linux-leds@lfdr.de>; Wed, 25 Mar 2026 23:35:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 02A143096F36
	for <lists+linux-leds@lfdr.de>; Wed, 25 Mar 2026 22:32:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFE64372B2C;
	Wed, 25 Mar 2026 22:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="o2vswXYZ"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F90B309EE9;
	Wed, 25 Mar 2026 22:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774477951; cv=none; b=l/H7cc4RftVFFBYQ7uyp/mUcUSUvnDal4Tx+ZU9ECieX2XbZ/UHjQx+VCbDKxPhCGzPi5ajPs8wD0Epd/hsuzQ4VRt3urwJaaYzBITN1qfTbMy99qFYM54N3DILkQ707y/e72TbLN+56+4RABUZK8D3iZ40c2yKrRvBYhaEzGEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774477951; c=relaxed/simple;
	bh=ursab/n2AiJf6C5AZD21xV3n11Oj8/12y2M7o6GYEA4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=Nydk9Z1D5bS8RzdXKn6v9jSBVzwOn6BVEUXPxX/tRDuv6G9ajBHv5IMQ3RlEyphYW9U3bMGpapxrXdCoT3gdc3yIiO6byhqn0HTETPSpY4ehHa99XCz/IQn+RfDVq5UTxM+72w3wbrq7fToQc8qvN9740JPiDMEr4vqxjslWr6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=o2vswXYZ; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PKMJwT039446;
	Wed, 25 Mar 2026 18:32:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=VPaEn
	dXXV6gdKYfFDumFMzxEiVrqbQDqq7Bywu9T+dw=; b=o2vswXYZaSmJa4HaUsSSj
	bd8HpNvpkhCCznAbSEd/ccy+2hvY/XOVxclAnlCiB2WNOReSLkP0lG5pxCuUVyrR
	bqRC6JGIgX9Jlu/LIWaxXR++cYoRVdoB5QlDCv+nOguuHvRqTRvVLHBO/cQzejq5
	5sYP8EIuJCIGPl+iaFL9ct8ZdatSGU26MmcqEssRTlhKT0JQuFgwI2jwo48pWuej
	vhcRsWxs6uhWx6QW7VUD8EgYYeIvXR5Q6JP/rcQhJxM1//ld1i6gxXHAceu1GokH
	YErjKJCTWSfD533lxAj4XkWNpX4jn86JHwrnBqW7XrkaYVQAC6GVVqhXdZ19oi/n
	w==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4d3un5gssh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Mar 2026 18:32:21 -0400 (EDT)
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 62PMWKpH054884
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 25 Mar 2026 18:32:20 -0400
Received: from ASHBCASHYB4.ad.analog.com (10.64.17.132) by
 ASHBMBX9.ad.analog.com (10.64.17.10) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.37; Wed, 25 Mar 2026 18:32:19 -0400
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by
 ASHBCASHYB4.ad.analog.com (10.64.17.132) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.37; Wed, 25 Mar 2026 18:32:19 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.2.1748.37 via Frontend
 Transport; Wed, 25 Mar 2026 18:32:19 -0400
Received: from HYB-VFz9h4bIQxi.ad.analog.com (HYB-VFz9h4bIQxi.ad.analog.com [10.118.4.22])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 62PMW4aj032703;
	Wed, 25 Mar 2026 18:32:15 -0400
From: Jan Carlo Roleda <jancarlo.roleda@analog.com>
Date: Thu, 26 Mar 2026 06:30:11 +0800
Subject: [PATCH v2 2/3] leds: ltc3208: add driver
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260326-upstream-ltc3208-v2-2-3dbc992b6098@analog.com>
References: <20260326-upstream-ltc3208-v2-0-3dbc992b6098@analog.com>
In-Reply-To: <20260326-upstream-ltc3208-v2-0-3dbc992b6098@analog.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774477924; l=11825;
 i=jancarlo.roleda@analog.com; s=20260317; h=from:subject:message-id;
 bh=ursab/n2AiJf6C5AZD21xV3n11Oj8/12y2M7o6GYEA4=;
 b=kUg/y6z4mlXmtYqVVl0t/O2/Cjt5ALQ0QXk8m7Z2E4ySs4k8jNSWMzb1FXCRsRemIOnVfLqQm
 pNN5ou0H+kGCZoHtsJtPVKmPCPvR8v7mF7B2b3aw0UW08RisG4mP/U/
X-Developer-Key: i=jancarlo.roleda@analog.com; a=ed25519;
 pk=zPMh+eO6/Mj6tqaie75BLiTLQvE3f9pck0UejKLmLMc=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDE2NyBTYWx0ZWRfX1Yccy6bI0TOg
 0cyvk1SoDcpFj0oWmjmb+zzNPFOIfLu0T6u24UWTp9EkdPO+YQYqPBtOUwjw4/WY6Gn87Hfba3+
 MfbFQR8MgJWMj68TBGkEHrh5ro3FVE5gB9Ep2nquPpEyLCYWTKlF0viYmf6jLWcUJ+oMY7iXHfw
 03OJvkzTM1/3j6ecLMlpCQ0p5ujRkg7q7F05ApPPHsXu4So7BNO84MwbUPMpM2ZOH4dEZ1zP8Sb
 sAhRAx+/ZCEZWvsHivhaXwuBF8m/EO+ED9tAFcOmRy9X/EPc5NkWGPm4xS15KOy/MYA61oysWG4
 5Qi/UalYhubIBJqgNI52uxmqL7WpK6eWhlTaSpbZb54mplUxrSSm5ycxM7ScH4rIBxZdAd40maU
 3HL3+mgx1XaSLAtHisyQAVeDtgqom+8yhKb8WBJ98eZB/dlPCu3FHBpEOl9IJTNuIgQBd4BzKwa
 j2agMwgqi+k1BF9HQNw==
X-Proofpoint-ORIG-GUID: WwFzaXWUfOrn-uQOLOXhJn_Wh2uYoeer
X-Authority-Analysis: v=2.4 cv=GdQaXAXL c=1 sm=1 tr=0 ts=69c46275 cx=c_pps
 a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=0sLvza09kfJOxVLZPwjg:22 a=uXIjobp8t2wMuQ0fPvqm:22 a=gAnH3GRIAAAA:8
 a=VwQbUJbxAAAA:8 a=pd7qEwP8XzxV70z26qgA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: WwFzaXWUfOrn-uQOLOXhJn_Wh2uYoeer
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_06,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 phishscore=0 spamscore=0 priorityscore=1501
 bulkscore=0 malwarescore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250167
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[analog.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[analog.com:s=DKIM];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[analog.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7502-lists,linux-leds=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[analog.com:dkim,analog.com:mid,analog.com:email,analog.com:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	FROM_NEQ_ENVFROM(0.00)[jancarlo.roleda@analog.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 48AF732D129
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Kernel driver implementation for LTC3208 Multidisplay LED Driver

Signed-off-by: Jan Carlo Roleda <jancarlo.roleda@analog.com>
---
 MAINTAINERS                 |   1 +
 drivers/leds/Kconfig        |  11 ++
 drivers/leds/Makefile       |   1 +
 drivers/leds/leds-ltc3208.c | 298 ++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 311 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 3f3331d7272a..48bae02057d5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15131,6 +15131,7 @@ M:	Jan Carlo Roleda <jancarlo.roleda@analog.com>
 L:	linux-leds@vger.kernel.org
 S:	Maintained
 W:	https://ez.analog.com/linux-software-drivers
+F:	drivers/leds/leds-ltc3208.c
 
 LTC4282 HARDWARE MONITOR DRIVER
 M:	Nuno Sa <nuno.sa@analog.com>
diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index 597d7a79c988..867b120ea8ba 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -1029,6 +1029,17 @@ config LEDS_ACER_A500
 	  This option enables support for the Power Button LED of
 	  Acer Iconia Tab A500.
 
+config LEDS_LTC3208
+	tristate "LED Driver for Analog Devices LTC3208"
+	depends on LEDS_CLASS && I2C
+	select REGMAP_I2C
+	help
+	  Say Y to enable the LTC3208 LED driver.
+	  This supports the LED device LTC3208.
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
index 000000000000..65e65cd73d73
--- /dev/null
+++ b/drivers/leds/leds-ltc3208.c
@@ -0,0 +1,298 @@
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
+#include <linux/gpio/consumer.h>
+#include <linux/i2c.h>
+#include <linux/init.h>
+#include <linux/leds.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/property.h>
+#include <linux/regmap.h>
+#include <linux/types.h>
+#include <linux/workqueue.h>
+
+#define LTC3208_SET_HIGH_BYTE_DATA(x)	FIELD_PREP(GENMASK(7, 4), (x))
+
+/* Registers */
+#define LTC3208_REG_A_GRNRED	0x1 /* Green (High half-byte) and Red (Low half-byte) current DAC*/
+#define LTC3208_REG_B_AUXBLU	0x2 /* AUX (High half-byte) and Blue (Low half-byte) current DAC*/
+#define LTC3208_REG_C_MAIN	0x3 /* Main current DAC */
+#define LTC3208_REG_D_SUB	0x4 /* Sub current DAC */
+#define LTC3208_REG_E_AUX	0x5 /* AUX DAC Select */
+#define LTC3208_REG_F_CAM	0x6 /* CAM (High half-byte and Low half-byte) current DAC*/
+#define LTC3208_REG_G_OPT	0x7 /* Device Options */
+
+/* Device Options register */
+#define LTC3208_OPT_CPO_MASK	GENMASK(7, 6)
+#define LTC3208_OPT_DIS_RGBDROP	BIT(3)
+#define LTC3208_OPT_DIS_CAMHILO	BIT(2)
+#define LTC3208_OPT_EN_RGBS	BIT(1)
+
+/* Auxiliary DAC select masks */
+#define LTC3208_AUX1_MASK	GENMASK(1, 0)
+#define LTC3208_AUX2_MASK	GENMASK(3, 2)
+#define LTC3208_AUX3_MASK	GENMASK(5, 4)
+#define LTC3208_AUX4_MASK	GENMASK(7, 6)
+
+#define LTC3208_MAX_BRIGHTNESS_4BIT 0xF
+#define LTC3208_MAX_BRIGHTNESS_8BIT 0xFF
+
+#define LTC3208_NUM_LED_GRPS	8
+#define LTC3208_NUM_AUX_LEDS	4
+
+#define LTC3208_NUM_AUX_OPT	4
+#define LTC3208_MAX_CPO_OPT	3
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
+static int ltc3208_led_set_brightness(struct led_classdev *led_cdev,
+				      enum led_brightness brightness)
+{
+	struct ltc3208_led *led = container_of(led_cdev,
+					struct ltc3208_led, cdev);
+	struct i2c_client *client = led->client;
+	struct ltc3208_dev *dev = i2c_get_clientdata(client);
+	struct regmap *map = dev->map;
+	u8 current_level = brightness;
+
+	/*
+	 * For registers with 4-bit splits (CAM, AUX/BLUE, GREEN/RED), the other
+	 * half of the byte will be retrieved from the stored DAC value before
+	 * updating the register.
+	 */
+	switch (led->channel) {
+	case LTC3208_CHAN_MAIN:
+		return regmap_write(map, LTC3208_REG_C_MAIN, current_level);
+	case LTC3208_CHAN_SUB:
+		return regmap_write(map, LTC3208_REG_D_SUB, current_level);
+	case LTC3208_CHAN_AUX:
+		/* combine both low and high halves of byte */
+		current_level = LTC3208_SET_HIGH_BYTE_DATA(current_level);
+		current_level |= dev->leds[LTC3208_CHAN_BLUE].cdev.brightness;
+		return regmap_write(map, LTC3208_REG_B_AUXBLU, current_level);
+	case LTC3208_CHAN_BLUE:
+		/* apply high bits stored in other led */
+		current_level |= LTC3208_SET_HIGH_BYTE_DATA(
+			dev->leds[LTC3208_CHAN_AUX].cdev.brightness);
+		return regmap_write(map, LTC3208_REG_B_AUXBLU, current_level);
+	case LTC3208_CHAN_CAMH:
+		current_level = LTC3208_SET_HIGH_BYTE_DATA(current_level);
+		current_level |= dev->leds[LTC3208_CHAN_CAML].cdev.brightness;
+		return regmap_write(map, LTC3208_REG_F_CAM, current_level);
+	case LTC3208_CHAN_CAML:
+		current_level |= LTC3208_SET_HIGH_BYTE_DATA(
+			dev->leds[LTC3208_CHAN_CAMH].cdev.brightness);
+		return regmap_write(map, LTC3208_REG_F_CAM, current_level);
+	case LTC3208_CHAN_GREEN:
+		current_level = LTC3208_SET_HIGH_BYTE_DATA(current_level);
+		current_level |= dev->leds[LTC3208_CHAN_RED].cdev.brightness;
+		return regmap_write(map, LTC3208_REG_A_GRNRED, current_level);
+	case LTC3208_CHAN_RED:
+		current_level |= LTC3208_SET_HIGH_BYTE_DATA(
+			dev->leds[LTC3208_CHAN_GREEN].cdev.brightness);
+		return regmap_write(map, LTC3208_REG_A_GRNRED, current_level);
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
+	u8 val =	FIELD_PREP(LTC3208_OPT_EN_RGBS, is_sub) |
+			FIELD_PREP(LTC3208_OPT_DIS_CAMHILO, is_cam_hi) |
+			FIELD_PREP(LTC3208_OPT_DIS_RGBDROP, is_rgb_drop);
+
+	return regmap_write(map, LTC3208_REG_G_OPT, val);
+}
+
+static int ltc3208_update_aux_dac(struct ltc3208_dev *dev,
+	enum ltc3208_aux_channel aux_1, enum ltc3208_aux_channel aux_2,
+	enum ltc3208_aux_channel aux_3, enum ltc3208_aux_channel aux_4)
+{
+	struct regmap *map = dev->map;
+	u8 val =	FIELD_PREP(LTC3208_AUX1_MASK, aux_1) |
+			FIELD_PREP(LTC3208_AUX2_MASK, aux_2) |
+			FIELD_PREP(LTC3208_AUX3_MASK, aux_3) |
+			FIELD_PREP(LTC3208_AUX4_MASK, aux_4);
+
+	return regmap_write(map, LTC3208_REG_E_AUX, val);
+}
+
+static int ltc3208_probe(struct i2c_client *client)
+{
+	enum ltc3208_aux_channel aux_channels[LTC3208_NUM_AUX_LEDS];
+	struct ltc3208_dev *data;
+	struct ltc3208_led *leds;
+	struct regmap *map;
+	int ret, i;
+	u32 val;
+	bool dropdis_rgb_aux4;
+	bool dis_camhl;
+	bool en_rgbs;
+
+	map = devm_regmap_init_i2c(client, &ltc3208_regmap_cfg);
+	if (IS_ERR(map))
+		return dev_err_probe(&client->dev, PTR_ERR(map),
+				     "Failed to initialize regmap\n");
+
+	data = devm_kzalloc(&client->dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	leds = devm_kcalloc(&client->dev, LTC3208_NUM_LED_GRPS,
+			    sizeof(struct ltc3208_led), GFP_KERNEL);
+	if (!leds)
+		return -ENOMEM;
+
+	data->client = client;
+	data->map = map;
+
+	/* initialize options from devicetree */
+	dis_camhl = device_property_read_bool(&client->dev,
+					      "adi,disable-camhl-pin");
+	en_rgbs = device_property_read_bool(&client->dev,
+					    "adi,cfg-enrgbs-pin");
+	dropdis_rgb_aux4 = device_property_read_bool(&client->dev,
+						     "adi,disable-rgb-aux4-dropout");
+
+	ret = ltc3208_update_options(data, en_rgbs, dis_camhl,
+				     dropdis_rgb_aux4);
+	if (ret)
+		return dev_err_probe(&client->dev, ret,
+				     "error writing to options register\n");
+
+	/* initialize aux channel configurations from devicetree */
+	for (i = 0; i < LTC3208_NUM_AUX_LEDS; i++) {
+		ret = device_property_match_property_string(&client->dev,
+							    ltc3208_dt_aux_channels[i],
+							    ltc3208_aux_opt,
+							    LTC3208_NUM_AUX_OPT);
+		/* use default value if absent in devicetree */
+		if (ret == -EINVAL)
+			aux_channels[i] = LTC3208_AUX_CHAN_AUX;
+		else if (ret >= 0)
+			aux_channels[i] = ret;
+		else
+			return dev_err_probe(&client->dev, ret,
+					     "Failed getting aux-channel.\n");
+	}
+
+	ret = ltc3208_update_aux_dac(data, aux_channels[0], aux_channels[1],
+				     aux_channels[2], aux_channels[3]);
+	if (ret)
+		return dev_err_probe(&client->dev, ret,
+				     "error writing to aux %u channel register.\n", i);
+
+	i2c_set_clientdata(client, data);
+
+	device_for_each_child_node_scoped(&client->dev, child) {
+		struct ltc3208_led *led;
+		struct led_init_data init_data = {};
+
+		ret = fwnode_property_read_u32(child, "reg", &val);
+		if (ret || val >= LTC3208_NUM_LED_GRPS)
+			return dev_err_probe(&client->dev, -EINVAL,
+					     "Invalid reg property for LED\n");
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
+			return dev_err_probe(&client->dev, ret,
+					     "Failed to register LED %u\n", val);
+	}
+
+	data->leds = leds;
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


