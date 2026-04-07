Return-Path: <linux-leds+bounces-7649-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6DV/IRcZ1Wli0wcAu9opvQ
	(envelope-from <linux-leds+bounces-7649-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Tue, 07 Apr 2026 16:47:51 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EF2CC3B053D
	for <lists+linux-leds@lfdr.de>; Tue, 07 Apr 2026 16:47:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6BDD730086D4
	for <lists+linux-leds@lfdr.de>; Tue,  7 Apr 2026 14:41:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9557E277818;
	Tue,  7 Apr 2026 14:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vEPn/GFA"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F6002236EE;
	Tue,  7 Apr 2026 14:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775572906; cv=none; b=uvA7ggAxgMMiVi+5ITMjnBZXTCXok20YY8QmI4KMS53VZp7XKoZ4kecZ6rhRw5lmxEd+S99x/8jFj0SHLH1Pk02Y4e8J4cij7vuGTFOjnzu2AR/MfKENskeQBT6Fy5VdUcBiu4ymAfmzd7m8BmNUB7exFxR0fxK9M9+zuvjk0LU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775572906; c=relaxed/simple;
	bh=ef1jx7OWsEKTkZ4NElBbj+7oVAsnbdFmCVkx7//t3nU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lAMS1W9qLkMbxkCn3RQ5Kr9tjV0d/7izrfl1pgW2UDj6gWTeurm0XcWZUKyITYp7CXtrs72Chg2D4VvUEl4BrjHIX7FNPcMVMkLfX/RzIdp5EovyTrrmWBqKQSs7csSTqf8sJnxldsHgwu1oiHZIB8dFUmqXjtjrXp+3EwFtheU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vEPn/GFA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 387AAC2BCB0;
	Tue,  7 Apr 2026 14:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775572906;
	bh=ef1jx7OWsEKTkZ4NElBbj+7oVAsnbdFmCVkx7//t3nU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=vEPn/GFAjO6VEpxdGL5GojtYcE0hpr7H9ChbGQ6QTtMuKa818tZRqmR0UeUVrTQuk
	 FJDqSjwifIz+QPIxDKk1kjNlX5ukqpQvfnfqElbP+VjIOW4BQ3HI/jFCqgJNGK5bib
	 FLWT+T21ecFKw79/1TlvcyTrqXqZvasjd5eJbKGgPqbUSiodS14m+0AojbyTjOlTGx
	 yLtqBLwUbS153xozcuIiTsrn3KB1WgQGWaI45Ux/02/w+r0w7UDeg5yqLSEM2GvYL6
	 Eipse8jOF4Ve1+Z2UcAFatBT6m6EcZ71Qjfsxleu7vGBZxeXaEyqQbD4FTXpxte3UE
	 xN0Kt0VOGrvqQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2ED03FEEF53;
	Tue,  7 Apr 2026 14:41:46 +0000 (UTC)
From: Maud Spierings via B4 Relay <devnull+maudspierings.gocontroll.com@kernel.org>
Date: Tue, 07 Apr 2026 16:41:43 +0200
Subject: [PATCH v8 2/4] backlight: add max25014atg backlight
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260407-max25014-v8-2-14eac7ed673a@gocontroll.com>
References: <20260407-max25014-v8-0-14eac7ed673a@gocontroll.com>
In-Reply-To: <20260407-max25014-v8-0-14eac7ed673a@gocontroll.com>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Frank Li <Frank.Li@nxp.com>
Cc: dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-fbdev@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Maud Spierings <maudspierings@gocontroll.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775572904; l=13586;
 i=maudspierings@gocontroll.com; s=20250214; h=from:subject:message-id;
 bh=uLW+QPrYLFpK9vr5ApIMHXa3cKKYw6jF1JqrJdl0OQw=;
 b=yw5E2rD9Uh9m6lW83GPT1YYTvJbPZIHrYWnj1d4uFwGZLSJIP4kkel/gsaNivBRhNYSwme4RR
 piG+WMg/bLiARblnKska4y1YGIPBu+541NXrB+W8fgLBCsoHvnulYGn
X-Developer-Key: i=maudspierings@gocontroll.com; a=ed25519;
 pk=7chUb8XpaTQDvWhzTdHC0YPMkTDloELEC7q94tOUyPg=
X-Endpoint-Received: by B4 Relay for maudspierings@gocontroll.com/20250214
 with auth_id=341
X-Original-From: Maud Spierings <maudspierings@gocontroll.com>
Reply-To: maudspierings@gocontroll.com
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7649-lists,linux-leds=lfdr.de,maudspierings.gocontroll.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,gmx.de,pengutronix.de,nxp.com];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-leds@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	HAS_REPLYTO(0.00)[maudspierings@gocontroll.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,analog.com:email,gocontroll.com:email,gocontroll.com:replyto,gocontroll.com:mid]
X-Rspamd-Queue-Id: EF2CC3B053D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Maud Spierings <maudspierings@gocontroll.com>

The Maxim MAX25014 is a 4-channel automotive grade backlight driver IC
with integrated boost controller.

Reviewed-by: Daniel Thompson (RISCstar) <danielt@kernel.org>
Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
---
 MAINTAINERS                        |   1 +
 drivers/video/backlight/Kconfig    |   7 +
 drivers/video/backlight/Makefile   |   1 +
 drivers/video/backlight/max25014.c | 377 +++++++++++++++++++++++++++++++++++++
 4 files changed, 386 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 7e3ad236537fe..1f1a5326a6aab 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15692,6 +15692,7 @@ MAX25014 BACKLIGHT DRIVER
 M:	Maud Spierings <maudspierings@gocontroll.com>
 S:	Maintained
 F:	Documentation/devicetree/bindings/leds/backlight/maxim,max25014.yaml
+F:	drivers/video/backlight/max25014.c
 
 MAX31335 RTC DRIVER
 M:	Antoniu Miclaus <antoniu.miclaus@analog.com>
diff --git a/drivers/video/backlight/Kconfig b/drivers/video/backlight/Kconfig
index a7a3fbaf7c29e..f4e99542ffe8f 100644
--- a/drivers/video/backlight/Kconfig
+++ b/drivers/video/backlight/Kconfig
@@ -282,6 +282,13 @@ config BACKLIGHT_DA9052
 	help
 	  Enable the Backlight Driver for DA9052-BC and DA9053-AA/Bx PMICs.
 
+config BACKLIGHT_MAX25014
+	tristate "Backlight driver for Maxim MAX25014"
+	depends on I2C
+	select REGMAP_I2C
+	help
+	  If you are using a MAX25014 chip as a backlight driver say Y to enable it.
+
 config BACKLIGHT_MAX8925
 	tristate "Backlight driver for MAX8925"
 	depends on MFD_MAX8925
diff --git a/drivers/video/backlight/Makefile b/drivers/video/backlight/Makefile
index 794820a98ed49..21c8313cfb121 100644
--- a/drivers/video/backlight/Makefile
+++ b/drivers/video/backlight/Makefile
@@ -47,6 +47,7 @@ obj-$(CONFIG_BACKLIGHT_LOCOMO)		+= locomolcd.o
 obj-$(CONFIG_BACKLIGHT_LP855X)		+= lp855x_bl.o
 obj-$(CONFIG_BACKLIGHT_LP8788)		+= lp8788_bl.o
 obj-$(CONFIG_BACKLIGHT_LV5207LP)	+= lv5207lp.o
+obj-$(CONFIG_BACKLIGHT_MAX25014)	+= max25014.o
 obj-$(CONFIG_BACKLIGHT_MAX8925)		+= max8925_bl.o
 obj-$(CONFIG_BACKLIGHT_MP3309C)		+= mp3309c.o
 obj-$(CONFIG_BACKLIGHT_MT6370)		+= mt6370-backlight.o
diff --git a/drivers/video/backlight/max25014.c b/drivers/video/backlight/max25014.c
new file mode 100644
index 0000000000000..3ee45617261f3
--- /dev/null
+++ b/drivers/video/backlight/max25014.c
@@ -0,0 +1,377 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Backlight driver for Maxim MAX25014
+ *
+ * Copyright (C) 2025 GOcontroll B.V.
+ * Author: Maud Spierings <maudspierings@gocontroll.com>
+ */
+
+#include <linux/backlight.h>
+#include <linux/gpio/consumer.h>
+#include <linux/i2c.h>
+#include <linux/regmap.h>
+#include <linux/slab.h>
+
+#define MAX25014_ISET_DEFAULT_100 11
+#define MAX_BRIGHTNESS            100
+#define MIN_BRIGHTNESS            0
+#define TON_MAX                   130720 /* @153Hz */
+#define TON_STEP                  1307 /* @153Hz */
+#define TON_MIN                   0
+
+#define MAX25014_DEV_ID           0x00
+#define MAX25014_REV_ID           0x01
+#define MAX25014_ISET             0x02
+#define MAX25014_IMODE            0x03
+#define MAX25014_TON1H            0x04
+#define MAX25014_TON1L            0x05
+#define MAX25014_TON2H            0x06
+#define MAX25014_TON2L            0x07
+#define MAX25014_TON3H            0x08
+#define MAX25014_TON3L            0x09
+#define MAX25014_TON4H            0x0A
+#define MAX25014_TON4L            0x0B
+#define MAX25014_TON_1_4_LSB      0x0C
+#define MAX25014_SETTING          0x12
+#define MAX25014_DISABLE          0x13
+#define MAX25014_BSTMON           0x14
+#define MAX25014_IOUT1            0x15
+#define MAX25014_IOUT2            0x16
+#define MAX25014_IOUT3            0x17
+#define MAX25014_IOUT4            0x18
+#define MAX25014_OPEN             0x1B
+#define MAX25014_SHORTGND         0x1C
+#define MAX25014_SHORTED_LED      0x1D
+#define MAX25014_MASK             0x1E
+#define MAX25014_DIAG             0x1F
+
+#define MAX25014_ISET_ENA         BIT(5)
+#define MAX25014_ISET_PSEN        BIT(4)
+#define MAX25014_IMODE_HDIM       BIT(2)
+#define MAX25014_SETTING_FPWM     GENMASK(6, 4)
+#define MAX25014_DISABLE_DIS_MASK GENMASK(3, 0)
+#define MAX25014_DIAG_OT          BIT(0)
+#define MAX25014_DIAG_OTW         BIT(1)
+#define MAX25014_DIAG_HW_RST      BIT(2)
+#define MAX25014_DIAG_BSTOV       BIT(3)
+#define MAX25014_DIAG_BSTUV       BIT(4)
+#define MAX25014_DIAG_IREFOOR     BIT(5)
+
+struct max25014 {
+	struct i2c_client *client;
+	struct backlight_device *bl;
+	struct regmap *regmap;
+	struct gpio_desc *enable;
+	uint32_t iset;
+	uint8_t strings_mask;
+};
+
+static const struct regmap_config max25014_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+	.max_register = MAX25014_DIAG,
+};
+
+static int max25014_initial_power_state(struct max25014 *maxim)
+{
+	uint32_t val;
+	int ret;
+
+	ret = regmap_read(maxim->regmap, MAX25014_ISET, &val);
+	if (ret)
+		return ret;
+
+	return val & MAX25014_ISET_ENA ? BACKLIGHT_POWER_ON : BACKLIGHT_POWER_OFF;
+}
+
+static int max25014_check_errors(struct max25014 *maxim)
+{
+	uint32_t val;
+	uint8_t i;
+	int ret;
+
+	ret = regmap_read(maxim->regmap, MAX25014_OPEN, &val);
+	if (ret)
+		return ret;
+	if (val) {
+		dev_err(&maxim->client->dev, "Open led strings detected on:\n");
+		for (i = 0; i < 4; i++) {
+			if (val & 1 << i)
+				dev_err(&maxim->client->dev, "string %d\n", i + 1);
+		}
+		return -EIO;
+	}
+
+	ret = regmap_read(maxim->regmap, MAX25014_SHORTGND, &val);
+	if (ret)
+		return ret;
+	if (val) {
+		dev_err(&maxim->client->dev, "Short to ground detected on:\n");
+		for (i = 0; i < 4; i++) {
+			if (val & 1 << i)
+				dev_err(&maxim->client->dev, "string %d\n", i + 1);
+		}
+		return -EIO;
+	}
+
+	ret = regmap_read(maxim->regmap, MAX25014_SHORTED_LED, &val);
+	if (ret)
+		return ret;
+	if (val) {
+		dev_err(&maxim->client->dev, "Shorted led detected on:\n");
+		for (i = 0; i < 4; i++) {
+			if (val & 1 << i)
+				dev_err(&maxim->client->dev, "string %d\n", i + 1);
+		}
+		return -EIO;
+	}
+
+	ret = regmap_read(maxim->regmap, MAX25014_DIAG, &val);
+	if (ret)
+		return ret;
+	/*
+	 * The HW_RST bit always starts at 1 after power up.
+	 * It is reset on first read, does not indicate an error.
+	 */
+	if (val && val != MAX25014_DIAG_HW_RST) {
+		if (val & MAX25014_DIAG_OT)
+			dev_err(&maxim->client->dev,
+				"Overtemperature shutdown\n");
+		if (val & MAX25014_DIAG_OTW)
+			dev_err(&maxim->client->dev,
+				 "Chip is getting too hot (>125C)\n");
+		if (val & MAX25014_DIAG_BSTOV)
+			dev_err(&maxim->client->dev,
+				"Boost converter overvoltage\n");
+		if (val & MAX25014_DIAG_BSTUV)
+			dev_err(&maxim->client->dev,
+				"Boost converter undervoltage\n");
+		if (val & MAX25014_DIAG_IREFOOR)
+			dev_err(&maxim->client->dev, "IREF out of range\n");
+		return -EIO;
+	}
+	return 0;
+}
+
+/*
+ * 1. disable unused strings
+ * 2. set dim mode
+ * 3. set setting register
+ * 4. enable the backlight
+ */
+static int max25014_configure(struct max25014 *maxim, int initial_state)
+{
+	uint32_t val;
+	int ret;
+
+	ret = regmap_read(maxim->regmap, MAX25014_DISABLE, &val);
+	if (ret)
+		return ret;
+
+	/*
+	 * Strings can only be disabled when MAX25014_ISET_ENA == 0, check if
+	 * it needs to be changed at all to prevent the backlight flashing when
+	 * it is configured correctly by the bootloader
+	 */
+	if (!((val & MAX25014_DISABLE_DIS_MASK) == maxim->strings_mask)) {
+		if (initial_state == BACKLIGHT_POWER_ON) {
+			ret = regmap_write(maxim->regmap, MAX25014_ISET, 0);
+			if (ret)
+				return ret;
+		}
+		ret = regmap_write(maxim->regmap, MAX25014_DISABLE, maxim->strings_mask);
+		if (ret)
+			return ret;
+	}
+
+	ret = regmap_write(maxim->regmap, MAX25014_IMODE, MAX25014_IMODE_HDIM);
+	if (ret)
+		return ret;
+
+	ret = regmap_read(maxim->regmap, MAX25014_SETTING, &val);
+	if (ret)
+		return ret;
+
+	ret = regmap_write(maxim->regmap, MAX25014_SETTING,
+			   val & ~MAX25014_SETTING_FPWM);
+	if (ret)
+		return ret;
+
+	return regmap_write(maxim->regmap, MAX25014_ISET,
+			   maxim->iset | MAX25014_ISET_ENA |
+			   MAX25014_ISET_PSEN);
+}
+
+static int max25014_update_status(struct backlight_device *bl_dev)
+{
+	struct max25014 *maxim = bl_get_data(bl_dev);
+	uint32_t reg;
+	int ret;
+
+	reg  = TON_STEP * backlight_get_brightness(bl_dev);
+
+	/*
+	 * 18 bit number lowest, 2 bits in first register,
+	 * next lowest 8 in the L register, next 8 in the H register
+	 * Seemingly setting the strength of only one string controls all of
+	 * them, individual settings don't affect the outcome.
+	 */
+	ret = regmap_write(maxim->regmap, MAX25014_TON_1_4_LSB, reg & 0b00000011);
+	if (ret != 0)
+		return ret;
+	ret = regmap_write(maxim->regmap, MAX25014_TON1L, (reg >> 2) & 0b11111111);
+	if (ret != 0)
+		return ret;
+	return regmap_write(maxim->regmap, MAX25014_TON1H, (reg >> 10) & 0b11111111);
+}
+
+static const struct backlight_ops max25014_bl_ops = {
+	.options = BL_CORE_SUSPENDRESUME,
+	.update_status = max25014_update_status,
+};
+
+static int max25014_parse_dt(struct max25014 *maxim,
+			     uint32_t *initial_brightness)
+{
+	struct device *dev = &maxim->client->dev;
+	struct device_node *node = dev->of_node;
+	uint32_t strings[4];
+	int res, i;
+
+	res = of_property_count_u32_elems(node, "maxim,strings");
+	if (res == 4) {
+		of_property_read_u32_array(node, "maxim,strings", strings, 4);
+		for (i = 0; i < 4; i++) {
+			if (strings[i] == 0)
+				maxim->strings_mask |= 1 << i;
+	}
+	} else {
+		maxim->strings_mask = 0;
+	}
+
+	*initial_brightness = 50U;
+	of_property_read_u32(node, "default-brightness", initial_brightness);
+
+	maxim->iset = MAX25014_ISET_DEFAULT_100;
+	of_property_read_u32(node, "maxim,iset", &maxim->iset);
+
+	if (maxim->iset > 15)
+		return dev_err_probe(dev, -EINVAL,
+				     "Invalid iset, should be a value from 0-15, entered was %d\n",
+				     maxim->iset);
+
+	if (*initial_brightness > 100)
+		return dev_err_probe(dev, -EINVAL,
+				     "Invalid initial brightness, should be a value from 0-100, entered was %d\n",
+				     *initial_brightness);
+
+	return 0;
+}
+
+static int max25014_probe(struct i2c_client *cl)
+{
+	const struct i2c_device_id *id = i2c_client_get_device_id(cl);
+	struct backlight_properties props;
+	uint32_t initial_brightness = 50;
+	struct backlight_device *bl;
+	struct max25014 *maxim;
+	int ret;
+
+	maxim = devm_kzalloc(&cl->dev, sizeof(struct max25014), GFP_KERNEL);
+	if (!maxim)
+		return -ENOMEM;
+
+	maxim->client = cl;
+
+	ret = max25014_parse_dt(maxim, &initial_brightness);
+	if (ret)
+		return ret;
+
+	ret = devm_regulator_get_enable(&maxim->client->dev, "power");
+	if (ret)
+		return dev_err_probe(&maxim->client->dev, ret,
+				     "failed to get power-supply");
+
+	maxim->enable = devm_gpiod_get_optional(&maxim->client->dev, "enable",
+						GPIOD_OUT_HIGH);
+	if (IS_ERR(maxim->enable))
+		return dev_err_probe(&maxim->client->dev, PTR_ERR(maxim->enable),
+				    "failed to get enable gpio\n");
+
+	/* Datasheet Electrical Characteristics tSTARTUP 2ms */
+	fsleep(2000);
+
+	maxim->regmap = devm_regmap_init_i2c(cl, &max25014_regmap_config);
+	if (IS_ERR(maxim->regmap))
+		return dev_err_probe(&maxim->client->dev, PTR_ERR(maxim->regmap),
+			"failed to initialize the i2c regmap\n");
+
+	i2c_set_clientdata(cl, maxim);
+
+	ret = max25014_check_errors(maxim);
+	if (ret) /* error is already reported in the above function */
+		return ret;
+
+	ret = max25014_initial_power_state(maxim);
+	if (ret < 0)
+		return dev_err_probe(&maxim->client->dev, ret, "Could not get enabled state\n");
+
+	memset(&props, 0, sizeof(struct backlight_properties));
+	props.type = BACKLIGHT_PLATFORM;
+	props.max_brightness = MAX_BRIGHTNESS;
+	props.brightness = initial_brightness;
+	props.scale = BACKLIGHT_SCALE_LINEAR;
+	props.power = ret;
+
+	ret = max25014_configure(maxim, ret);
+	if (ret)
+		return dev_err_probe(&maxim->client->dev, ret, "device config error");
+
+	bl = devm_backlight_device_register(&maxim->client->dev, id->name,
+					    &maxim->client->dev, maxim,
+					    &max25014_bl_ops, &props);
+	if (IS_ERR(bl))
+		return dev_err_probe(&maxim->client->dev, PTR_ERR(bl),
+				    "failed to register backlight\n");
+
+	maxim->bl = bl;
+
+	backlight_update_status(maxim->bl);
+
+	return 0;
+}
+
+static void max25014_remove(struct i2c_client *cl)
+{
+	struct max25014 *maxim = i2c_get_clientdata(cl);
+
+	backlight_device_set_brightness(maxim->bl, 0);
+	gpiod_set_value_cansleep(maxim->enable, 0);
+}
+
+static const struct of_device_id max25014_dt_ids[] = {
+	{ .compatible = "maxim,max25014", },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, max25014_dt_ids);
+
+static const struct i2c_device_id max25014_ids[] = {
+	{ "max25014" },
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, max25014_ids);
+
+static struct i2c_driver max25014_driver = {
+	.driver = {
+		.name = KBUILD_MODNAME,
+		.of_match_table = of_match_ptr(max25014_dt_ids),
+	},
+	.probe = max25014_probe,
+	.remove = max25014_remove,
+	.id_table = max25014_ids,
+};
+module_i2c_driver(max25014_driver);
+
+MODULE_DESCRIPTION("Maxim MAX25014 backlight driver");
+MODULE_AUTHOR("Maud Spierings <maudspierings@gocontroll.com>");
+MODULE_LICENSE("GPL");

-- 
2.53.0



