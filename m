Return-Path: <linux-leds+bounces-3544-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 54D0A9E925E
	for <lists+linux-leds@lfdr.de>; Mon,  9 Dec 2024 12:31:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9DAD6165683
	for <lists+linux-leds@lfdr.de>; Mon,  9 Dec 2024 11:31:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCC00224888;
	Mon,  9 Dec 2024 11:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fgv6LkMT"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 078DC21B8FF;
	Mon,  9 Dec 2024 11:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733743777; cv=none; b=Qdaa9xkc9Dv0omyVHB+jI2Qk+ffRjR8lNYd4Jw7kV1bbzFitEQArIPTwULDfMSh72SJqhxVmp/8uDHFFHlrnAvYxYk8KuNefy4r+5pWFEYiz0wFvBy6/FnSoroDNPiAI+BQMDJbpU4dECJ68KZGA9Vi4ZzQhJs+yCLlLOCDO86E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733743777; c=relaxed/simple;
	bh=rN9hGlthg/kYq7SaIPoJfascgOz1C20LFdB/2ikrWdY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iJWckd/89IbrHdkw8gu+ELR/kU/Ycq8+H9hHNKU5pyIrEYztzT+e9UqbT3CjfOYUnM9fR5Eay12pKk6RUcpUm0+2hwBDLwbsnsOyJ26V/2f5Z4EW/AI3z1IBbb7X5jXsqPaFme2bV3yxE48aWkiG78dl+zpcF89gyWQw7H9a0ec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fgv6LkMT; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5ceb03aadb1so5485318a12.0;
        Mon, 09 Dec 2024 03:29:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733743773; x=1734348573; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XJyG0VljDYT5KY0vyto81RBvY0buF7EjYJR+rWwlULQ=;
        b=Fgv6LkMTL53RbUYUWdekqZ2UCNOk5Mmyeg+XcIhgfpxSgMKyKWft3gMg3q3Y+ug1Uz
         nbmv6fLzo1Xt6bkhi3tfVd5zVZtrkWPOnUp6iaCcjgPcGWm64iBbkytwC81TSae2VOm8
         GPiJ88o8x33yrF8YVtNfKkn5IpH5ltEyEf9l1D0yszVpQZq7aeAhT4VFFfpDe+59421Z
         v7ndJ7+HIIxP65/UuAK3062HzkZGqAz09eu5zNZMRlX07F4ZOrPsQNNTk3VN+PFn2ekt
         pJlukYah3jwc7ETMJzc9cTTEmJygtHFz37Lf+YpDASsMA46zL46bya2a4Vvp8Jn0AhcD
         4spA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733743773; x=1734348573;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XJyG0VljDYT5KY0vyto81RBvY0buF7EjYJR+rWwlULQ=;
        b=Xi/C+NrkGd3gIrbh95AJwpOetgaJdvROUse6Furpm0cN5qrFGFMw6SiBGlSjNVGklI
         So2GhCBM8UidsTwAuTo3Ilzks4bTlwL6BQnN9Tul92JgIFdyvnzwdXrHE4emLNxPfTXQ
         BSUHDEwx7UW+evgpHv8WDVLyLsAN9+c9VL6xtzXSQ9Xyc7+UtFTHWILRWCBPERC063Z0
         aJPDobISKtJ0WcL3j3725V+sWOTxqijBC2QVimNE0rFUP6phRKFy5F34lG1jpK89ISZ0
         vxa0Q889pRfHv4US27SiLHHVZXvNGuseNAFmaPrh/RqYhmcYisEiiKrF079fZBfHj1oc
         kYeA==
X-Forwarded-Encrypted: i=1; AJvYcCV78hd4gRc28Tq93zkjW2NpTF5fdnq83WfO50uGdpDvejDE4zsFvH7ueGDxzlEoF7/FW3/U80jgpDTv1w==@vger.kernel.org, AJvYcCW6Y+MT+LNcsHYb8lPV9ZwFBEuCufaqzXsmpFn8bXedOkrwk9kR1LIB7hMlqgS1fqE0EiLXnJ803t5E@vger.kernel.org, AJvYcCWJlFxlhuEkvUPkWNOfxizTIUNk/lNXKmwE5kqPsWJDxM2p9EThiIwz5hbnIVeMpL1S3TJLdrLmdHBxA78=@vger.kernel.org, AJvYcCXz6ecjWUobz7q7vqlBzA8gxZyfHKUDlLFIqAaMgmY1rmhIkxBhJswcP7LvuT6IvvD1npv3RqLvFSeRToIH@vger.kernel.org
X-Gm-Message-State: AOJu0Yzl4a/h2KZd4k+edrenwTpKRYPV46qxm9hreiM8uPk4HrrDwwcq
	dIZv6hfxBjU0XKOrX0W0yNU9P9m2EqOJvDwopuAIUBA06lTbjxG8
X-Gm-Gg: ASbGncvHUlqGQdyTFbgxrIw841T2LdtTnACeA8oUddbpC1kJVjCfcoBhetheNWjLt2f
	YpDPtW+5J3FQMtZTNp7kRVBtP6RBSp0tFV7kdE+OWpRbZ3rALvBx1aBYbhVVyXK3iewYEDUR/Xf
	ryrPrUJZ0wpYjyNoWJn0BukfNTL0izhsOOZZmbEn6oDrpuNoUuZ4b7KE4nca4/6s9U57apH/igi
	X4DUVcyg/vEtX5b9zePMtn5ooyj/RSNt2I0GpPqP0XjVzpc
X-Google-Smtp-Source: AGHT+IGaGFiPCiHdKjn15Viml36dqcmLhiGclUWP5pimcpTl94eB53ORT2G0/vMMsA/l6RCE0mevig==
X-Received: by 2002:a05:6402:2744:b0:5d1:22d2:8965 with SMTP id 4fb4d7f45d1cf-5d41863b7e8mr235238a12.30.1733743773120;
        Mon, 09 Dec 2024 03:29:33 -0800 (PST)
Received: from [127.0.1.1] ([46.53.242.72])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-5d14b608faesm5980350a12.44.2024.12.09.03.29.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 03:29:32 -0800 (PST)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Mon, 09 Dec 2024 14:26:32 +0300
Subject: [PATCH v11 8/9] power: supply: max77705: Add charger driver for
 Maxim 77705
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241209-starqltechn_integration_upstream-v11-8-dc0598828e01@gmail.com>
References: <20241209-starqltechn_integration_upstream-v11-0-dc0598828e01@gmail.com>
In-Reply-To: <20241209-starqltechn_integration_upstream-v11-0-dc0598828e01@gmail.com>
To: Sebastian Reichel <sre@kernel.org>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Pavel Machek <pavel@ucw.cz>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>, 
 Purism Kernel Team <kernel@puri.sm>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-input@vger.kernel.org, 
 linux-leds@vger.kernel.org, Dzmitry Sankouski <dsankouski@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733743755; l=27537;
 i=dsankouski@gmail.com; s=20240619; h=from:subject:message-id;
 bh=rN9hGlthg/kYq7SaIPoJfascgOz1C20LFdB/2ikrWdY=;
 b=MCBkMNpkge48UwggreyepSN/eAZ8GW1KZ+LnmDpocun5kUwxlkWQ+htecm5Y3FSZvTzwTCtPR
 Y3SWtgFkPWgAi2+we/leTphsFoD0cs+91f2TyKkLld4XoVW6da3j39U
X-Developer-Key: i=dsankouski@gmail.com; a=ed25519;
 pk=YJcXFcN1EWrzBYuiE2yi5Mn6WLn6L1H71J+f7X8fMag=

Add driver for Maxim 77705 switch-mode charger (part of max77705
MFD driver) providing power supply class information to userspace.

The driver is configured through DTS (battery and system related
settings).

Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>

---
Changes in v11:
- remove multiple blank lines
- return dev_err_probe
- fit on one line where possible;

Changes in v10:
- never blank line between call and its error check
- replace remove function with devm_add_action_or_reset
- remove unused inline functions from header
- use dev_err_probe for error handling

Changes in v9:
- move power supply registration before interrupts to prevent
  NULL exceptions when handling interrupts

Changes for v8:
- join lines, where fits 100 chars
- change comment style C++ -> C
- remove author from 'based on' file header statement
Changes for v6:
- add i2c init in driver
- replace remove_new back on remove
- handle IS_ERR(i2c_chg)
Changes for v5:
- remove const modifier from max77705_charger_irq_chip
  because it's modified with irq_drv_data in probe function
- fix license to GPL 2.0 only, where old vendor code used
  GPL 2.0 only
- move power header to power include dir
- use same hardware name in Kconfig and module descriptions

Changes for v4:
- start from scratch
- change word delimiters in filenames to '_'
- use GENMASK in header
- remove debugfs code
- migrate to regmap_add_irq_chip
- fix property getters to follow the same style
---
 drivers/power/supply/Kconfig            |   6 ++
 drivers/power/supply/Makefile           |   1 +
 drivers/power/supply/max77705_charger.c | 586 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 include/linux/power/max77705_charger.h  | 194 +++++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 787 insertions(+)

diff --git a/drivers/power/supply/Kconfig b/drivers/power/supply/Kconfig
index 9f2eef6787f7..66264036b65d 100644
--- a/drivers/power/supply/Kconfig
+++ b/drivers/power/supply/Kconfig
@@ -583,6 +583,12 @@ config CHARGER_MAX77693
 	help
 	  Say Y to enable support for the Maxim MAX77693 battery charger.
 
+config CHARGER_MAX77705
+	tristate "Maxim MAX77705 battery charger driver"
+	depends on MFD_MAX77705
+	help
+	  Say Y to enable support for the Maxim MAX77705 battery charger.
+
 config CHARGER_MAX77976
 	tristate "Maxim MAX77976 battery charger driver"
 	depends on I2C
diff --git a/drivers/power/supply/Makefile b/drivers/power/supply/Makefile
index 59c4a9f40d28..85d65b7aee1c 100644
--- a/drivers/power/supply/Makefile
+++ b/drivers/power/supply/Makefile
@@ -80,6 +80,7 @@ obj-$(CONFIG_CHARGER_MAX14577)	+= max14577_charger.o
 obj-$(CONFIG_CHARGER_DETECTOR_MAX14656)	+= max14656_charger_detector.o
 obj-$(CONFIG_CHARGER_MAX77650)	+= max77650-charger.o
 obj-$(CONFIG_CHARGER_MAX77693)	+= max77693_charger.o
+obj-$(CONFIG_CHARGER_MAX77705)	+= max77705_charger.o
 obj-$(CONFIG_CHARGER_MAX77976)	+= max77976_charger.o
 obj-$(CONFIG_CHARGER_MAX8997)	+= max8997_charger.o
 obj-$(CONFIG_CHARGER_MAX8998)	+= max8998_charger.o
diff --git a/drivers/power/supply/max77705_charger.c b/drivers/power/supply/max77705_charger.c
new file mode 100644
index 000000000000..0a4f0619c735
--- /dev/null
+++ b/drivers/power/supply/max77705_charger.c
@@ -0,0 +1,586 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Based on max77650-charger.c
+ *
+ * Copyright (C) 2024 Dzmitry Sankouski <dsankouski@gmail.org>
+ *
+ * Battery charger driver for MAXIM 77705 charger/power-supply.
+ */
+
+#include <linux/i2c.h>
+#include <linux/interrupt.h>
+#include <linux/mfd/max77693-common.h>
+#include <linux/mfd/max77705-private.h>
+#include <linux/power/max77705_charger.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/power_supply.h>
+#include <linux/regmap.h>
+
+#define I2C_ADDR_CHG    0x69
+
+static const char *max77705_charger_model		= "max77705";
+static const char *max77705_charger_manufacturer	= "Maxim Integrated";
+
+static const struct regmap_config max77705_chg_regmap_config = {
+	.reg_base = MAX77705_CHG_REG_BASE,
+	.reg_bits = 8,
+	.val_bits = 8,
+	.max_register = MAX77705_CHG_REG_SAFEOUT_CTRL,
+};
+
+static enum power_supply_property max77705_charger_props[] = {
+	POWER_SUPPLY_PROP_ONLINE,
+	POWER_SUPPLY_PROP_PRESENT,
+	POWER_SUPPLY_PROP_STATUS,
+	POWER_SUPPLY_PROP_CHARGE_TYPE,
+	POWER_SUPPLY_PROP_HEALTH,
+	POWER_SUPPLY_PROP_VOLTAGE_MAX_DESIGN,
+	POWER_SUPPLY_PROP_CONSTANT_CHARGE_VOLTAGE,
+	POWER_SUPPLY_PROP_CONSTANT_CHARGE_CURRENT,
+	POWER_SUPPLY_PROP_INPUT_CURRENT_LIMIT,
+};
+
+static int max77705_chgin_irq(void *irq_drv_data)
+{
+	struct max77705_charger_data *charger = irq_drv_data;
+
+	queue_work(charger->wqueue, &charger->chgin_work);
+
+	return 0;
+}
+
+static const struct regmap_irq max77705_charger_irqs[] = {
+	{ .mask = MAX77705_BYP_IM,   },
+	{ .mask = MAX77705_INP_LIMIT_IM,   },
+	{ .mask = MAX77705_BATP_IM,   },
+	{ .mask = MAX77705_BAT_IM,   },
+	{ .mask = MAX77705_CHG_IM,   },
+	{ .mask = MAX77705_WCIN_IM,   },
+	{ .mask = MAX77705_CHGIN_IM,   },
+	{ .mask = MAX77705_AICL_IM,   },
+};
+
+static struct regmap_irq_chip max77705_charger_irq_chip = {
+	.name			= "max77705-charger",
+	.status_base		= MAX77705_CHG_REG_INT,
+	.mask_base		= MAX77705_CHG_REG_INT_MASK,
+	.handle_post_irq	= max77705_chgin_irq,
+	.num_regs		= 1,
+	.irqs			= max77705_charger_irqs,
+	.num_irqs		= ARRAY_SIZE(max77705_charger_irqs),
+};
+
+static int max77705_charger_enable(struct max77705_charger_data *chg)
+{
+	int rv;
+
+	rv = regmap_update_bits(chg->regmap, MAX77705_CHG_REG_CNFG_09,
+				MAX77705_CHG_EN_MASK, MAX77705_CHG_EN_MASK);
+	if (rv)
+		dev_err(chg->dev, "unable to enable the charger: %d\n", rv);
+
+	return rv;
+}
+
+static void max77705_charger_disable(void *data)
+{
+	struct max77705_charger_data *chg = data;
+	int rv;
+
+	rv = regmap_update_bits(chg->regmap,
+				MAX77705_CHG_REG_CNFG_09,
+				MAX77705_CHG_EN_MASK,
+				MAX77705_CHG_DISABLE);
+	if (rv)
+		dev_err(chg->dev, "unable to disable the charger: %d\n", rv);
+}
+
+static int max77705_get_online(struct regmap *regmap, int *val)
+{
+	unsigned int data;
+	int ret;
+
+	ret = regmap_read(regmap, MAX77705_CHG_REG_INT_OK, &data);
+	if (ret < 0)
+		return ret;
+
+	*val = !!(data & MAX77705_CHGIN_OK);
+
+	return 0;
+}
+
+static int max77705_check_battery(struct max77705_charger_data *charger, int *val)
+{
+	unsigned int reg_data;
+	unsigned int reg_data2;
+	struct regmap *regmap = charger->regmap;
+
+	regmap_read(regmap, MAX77705_CHG_REG_INT_OK, &reg_data);
+
+	dev_dbg(charger->dev, "CHG_INT_OK(0x%x)\n", reg_data);
+
+	regmap_read(regmap, MAX77705_CHG_REG_DETAILS_00, &reg_data2);
+
+	dev_dbg(charger->dev, "CHG_DETAILS00(0x%x)\n", reg_data2);
+
+	if ((reg_data & MAX77705_BATP_OK) || !(reg_data2 & MAX77705_BATP_DTLS))
+		*val = true;
+	else
+		*val = false;
+
+	return 0;
+}
+
+static int max77705_get_charge_type(struct max77705_charger_data *charger, int *val)
+{
+	struct regmap *regmap = charger->regmap;
+	unsigned int reg_data;
+
+	regmap_read(regmap, MAX77705_CHG_REG_CNFG_09, &reg_data);
+	if (!MAX77705_CHARGER_CHG_CHARGING(reg_data)) {
+		*val = POWER_SUPPLY_CHARGE_TYPE_NONE;
+		return 0;
+	}
+
+	regmap_read(regmap, MAX77705_CHG_REG_DETAILS_01, &reg_data);
+	reg_data &= MAX77705_CHG_DTLS;
+
+	switch (reg_data) {
+	case 0x0:
+	case MAX77705_CHARGER_CONSTANT_CURRENT:
+	case MAX77705_CHARGER_CONSTANT_VOLTAGE:
+		*val = POWER_SUPPLY_CHARGE_TYPE_FAST;
+		return 0;
+	default:
+		*val = POWER_SUPPLY_CHARGE_TYPE_NONE;
+		return 0;
+	}
+
+	return 0;
+}
+
+static int max77705_get_status(struct max77705_charger_data *charger, int *val)
+{
+	struct regmap *regmap = charger->regmap;
+	unsigned int reg_data;
+
+	regmap_read(regmap, MAX77705_CHG_REG_CNFG_09, &reg_data);
+	if (!MAX77705_CHARGER_CHG_CHARGING(reg_data)) {
+		*val = POWER_SUPPLY_CHARGE_TYPE_NONE;
+		return 0;
+	}
+
+	regmap_read(regmap, MAX77705_CHG_REG_DETAILS_01, &reg_data);
+	reg_data &= MAX77705_CHG_DTLS;
+
+	switch (reg_data) {
+	case 0x0:
+	case MAX77705_CHARGER_CONSTANT_CURRENT:
+	case MAX77705_CHARGER_CONSTANT_VOLTAGE:
+		*val = POWER_SUPPLY_STATUS_CHARGING;
+		return 0;
+	case MAX77705_CHARGER_END_OF_CHARGE:
+	case MAX77705_CHARGER_DONE:
+		*val = POWER_SUPPLY_STATUS_FULL;
+		return 0;
+	/* those values hard coded as in vendor kernel, because of */
+	/* failure to determine it's actual meaning. */
+	case 0x05:
+	case 0x06:
+	case 0x07:
+		*val = POWER_SUPPLY_STATUS_NOT_CHARGING;
+		return 0;
+	case 0x08:
+	case 0xA:
+	case 0xB:
+		*val = POWER_SUPPLY_STATUS_DISCHARGING;
+		return 0;
+	default:
+		*val = POWER_SUPPLY_STATUS_UNKNOWN;
+		return 0;
+	}
+
+	return 0;
+}
+
+static int max77705_get_vbus_state(struct regmap *regmap, int *value)
+{
+	int ret;
+	unsigned int charge_dtls;
+
+	ret = regmap_read(regmap, MAX77705_CHG_REG_DETAILS_00, &charge_dtls);
+	if (ret)
+		return ret;
+
+	charge_dtls = ((charge_dtls & MAX77705_CHGIN_DTLS) >>
+			MAX77705_CHGIN_DTLS_SHIFT);
+
+	switch (charge_dtls) {
+	case 0x00:
+		*value = POWER_SUPPLY_HEALTH_UNDERVOLTAGE;
+		break;
+	case 0x01:
+		*value = POWER_SUPPLY_HEALTH_UNDERVOLTAGE;
+		break;
+	case 0x02:
+		*value = POWER_SUPPLY_HEALTH_OVERVOLTAGE;
+		break;
+	case 0x03:
+		*value = POWER_SUPPLY_HEALTH_GOOD;
+		break;
+	default:
+		return 0;
+	}
+	return 0;
+}
+
+static int max77705_get_battery_health(struct max77705_charger_data *charger,
+					int *value)
+{
+	struct regmap *regmap = charger->regmap;
+	unsigned int bat_dtls;
+
+	regmap_read(regmap, MAX77705_CHG_REG_DETAILS_01, &bat_dtls);
+	bat_dtls = ((bat_dtls & MAX77705_BAT_DTLS) >> MAX77705_BAT_DTLS_SHIFT);
+
+	switch (bat_dtls) {
+	case MAX77705_BATTERY_NOBAT:
+		dev_dbg(charger->dev, "%s: No battery and the charger is suspended\n",
+			__func__);
+		*value = POWER_SUPPLY_HEALTH_NO_BATTERY;
+		break;
+	case MAX77705_BATTERY_PREQUALIFICATION:
+		dev_dbg(charger->dev, "%s: battery is okay but its voltage is low(~VPQLB)\n",
+			__func__);
+		break;
+	case MAX77705_BATTERY_DEAD:
+		dev_dbg(charger->dev, "%s: battery dead\n", __func__);
+		*value = POWER_SUPPLY_HEALTH_DEAD;
+		break;
+	case MAX77705_BATTERY_GOOD:
+	case MAX77705_BATTERY_LOWVOLTAGE:
+		*value = POWER_SUPPLY_HEALTH_GOOD;
+		break;
+	case MAX77705_BATTERY_OVERVOLTAGE:
+		dev_dbg(charger->dev, "%s: battery ovp\n", __func__);
+		*value = POWER_SUPPLY_HEALTH_OVERVOLTAGE;
+		break;
+	default:
+		dev_dbg(charger->dev, "%s: battery unknown\n", __func__);
+		*value = POWER_SUPPLY_HEALTH_UNSPEC_FAILURE;
+		break;
+	}
+
+	return 0;
+}
+
+static int max77705_get_health(struct max77705_charger_data *charger, int *val)
+{
+	struct regmap *regmap = charger->regmap;
+	int ret, is_online = 0;
+
+	ret = max77705_get_online(regmap, &is_online);
+	if (ret)
+		return ret;
+	if (is_online) {
+		ret = max77705_get_vbus_state(regmap, val);
+		if (ret || (*val != POWER_SUPPLY_HEALTH_GOOD))
+			return ret;
+	}
+	return max77705_get_battery_health(charger, val);
+}
+
+static int max77705_get_input_current(struct max77705_charger_data *charger,
+					int *val)
+{
+	unsigned int reg_data;
+	int get_current = 0;
+	struct regmap *regmap = charger->regmap;
+
+	regmap_read(regmap, MAX77705_CHG_REG_CNFG_09, &reg_data);
+
+	reg_data &= MAX77705_CHG_CHGIN_LIM_MASK;
+
+	if (reg_data <= 3)
+		get_current = 100;
+	else if (reg_data >= MAX77705_CHG_CHGIN_LIM_MASK)
+		get_current = MAX77705_CURRENT_CHGIN_MAX;
+	else
+		get_current = (reg_data + 1) * 25;
+
+	*val = get_current;
+
+	return 0;
+}
+
+static int max77705_get_charge_current(struct max77705_charger_data *charger,
+					int *val)
+{
+	unsigned int reg_data;
+	struct regmap *regmap = charger->regmap;
+
+	regmap_read(regmap, MAX77705_CHG_REG_CNFG_02, &reg_data);
+	reg_data &= MAX77705_CHG_CC;
+
+	*val = reg_data <= 0x2 ? 100 : reg_data * 50;
+
+	return 0;
+}
+
+static int max77705_set_float_voltage(struct max77705_charger_data *charger,
+					int float_voltage)
+{
+	int float_voltage_mv;
+	unsigned int reg_data = 0;
+	struct regmap *regmap = charger->regmap;
+
+	float_voltage_mv = float_voltage / 1000;
+	reg_data = float_voltage_mv <= 4000 ? 0x0 :
+		float_voltage_mv >= 4500 ? 0x23 :
+		(float_voltage_mv <= 4200) ? (float_voltage_mv - 4000) / 50 :
+		(((float_voltage_mv - 4200) / 10) + 0x04);
+
+	return regmap_update_bits(regmap, MAX77705_CHG_REG_CNFG_04,
+				MAX77705_CHG_CV_PRM_MASK,
+				(reg_data << MAX77705_CHG_CV_PRM_SHIFT));
+}
+
+static int max77705_get_float_voltage(struct max77705_charger_data *charger,
+					int *val)
+{
+	unsigned int reg_data = 0;
+	struct regmap *regmap = charger->regmap;
+
+	regmap_read(regmap, MAX77705_CHG_REG_CNFG_04, &reg_data);
+	reg_data &= MAX77705_CHG_PRM_MASK;
+	*val = reg_data <= 0x04 ? reg_data * 50 + 4000 :
+					(reg_data - 4) * 10 + 4200;
+
+	return 0;
+}
+
+static int max77705_chg_get_property(struct power_supply *psy,
+					enum power_supply_property psp,
+					union power_supply_propval *val)
+{
+	struct max77705_charger_data *charger = power_supply_get_drvdata(psy);
+	struct regmap *regmap = charger->regmap;
+
+	switch (psp) {
+	case POWER_SUPPLY_PROP_ONLINE:
+		return max77705_get_online(regmap, &val->intval);
+	case POWER_SUPPLY_PROP_PRESENT:
+		return max77705_check_battery(charger, &val->intval);
+	case POWER_SUPPLY_PROP_STATUS:
+		return max77705_get_status(charger, &val->intval);
+	case POWER_SUPPLY_PROP_CHARGE_TYPE:
+		return max77705_get_charge_type(charger, &val->intval);
+	case POWER_SUPPLY_PROP_HEALTH:
+		return max77705_get_health(charger, &val->intval);
+	case POWER_SUPPLY_PROP_INPUT_CURRENT_LIMIT:
+		return max77705_get_input_current(charger, &val->intval);
+	case POWER_SUPPLY_PROP_CONSTANT_CHARGE_CURRENT:
+		return max77705_get_charge_current(charger, &val->intval);
+	case POWER_SUPPLY_PROP_CONSTANT_CHARGE_VOLTAGE:
+		return max77705_get_float_voltage(charger, &val->intval);
+	case POWER_SUPPLY_PROP_VOLTAGE_MAX_DESIGN:
+		val->intval = charger->bat_info->voltage_max_design_uv;
+		break;
+	case POWER_SUPPLY_PROP_MODEL_NAME:
+		val->strval = max77705_charger_model;
+		break;
+	case POWER_SUPPLY_PROP_MANUFACTURER:
+		val->strval = max77705_charger_manufacturer;
+		break;
+	default:
+		return -EINVAL;
+	}
+	return 0;
+}
+
+static const struct power_supply_desc max77705_charger_psy_desc = {
+	.name = "max77705-charger",
+	.type		= POWER_SUPPLY_TYPE_USB,
+	.properties = max77705_charger_props,
+	.num_properties = ARRAY_SIZE(max77705_charger_props),
+	.get_property = max77705_chg_get_property,
+};
+
+static void max77705_chgin_isr_work(struct work_struct *work)
+{
+	struct max77705_charger_data *charger =
+		container_of(work, struct max77705_charger_data, chgin_work);
+	power_supply_changed(charger->psy_chg);
+}
+
+static void max77705_charger_initialize(struct max77705_charger_data *chg)
+{
+	u8 reg_data;
+	struct power_supply_battery_info *info;
+	struct regmap *regmap = chg->regmap;
+
+	if (power_supply_get_battery_info(chg->psy_chg, &info) < 0)
+		return;
+
+	chg->bat_info = info;
+
+	/* unlock charger setting protect */
+	/* slowest LX slope */
+	reg_data = MAX77705_CHGPROT_MASK | MAX77705_SLOWEST_LX_SLOPE;
+	regmap_update_bits(regmap, MAX77705_CHG_REG_CNFG_06, reg_data,
+						reg_data);
+
+	/* fast charge timer disable */
+	/* restart threshold disable */
+	/* pre-qual charge disable */
+	reg_data = (MAX77705_FCHGTIME_DISABLE << MAX77705_FCHGTIME_SHIFT) |
+			(MAX77705_CHG_RSTRT_DISABLE << MAX77705_CHG_RSTRT_SHIFT) |
+			(MAX77705_CHG_PQEN_DISABLE << MAX77705_PQEN_SHIFT);
+	regmap_update_bits(regmap, MAX77705_CHG_REG_CNFG_01,
+						(MAX77705_FCHGTIME_MASK |
+						MAX77705_CHG_RSTRT_MASK |
+						MAX77705_PQEN_MASK),
+						reg_data);
+
+	/* OTG off(UNO on), boost off */
+	regmap_update_bits(regmap, MAX77705_CHG_REG_CNFG_00,
+				MAX77705_OTG_CTRL, 0);
+
+	/* charge current 450mA(default) */
+	/* otg current limit 900mA */
+	regmap_update_bits(regmap, MAX77705_CHG_REG_CNFG_02,
+				MAX77705_OTG_ILIM_MASK,
+				MAX77705_OTG_ILIM_900 << MAX77705_OTG_ILIM_SHIFT);
+
+	/* BAT to SYS OCP 4.80A */
+	regmap_update_bits(regmap, MAX77705_CHG_REG_CNFG_05,
+				MAX77705_REG_B2SOVRC_MASK,
+				MAX77705_B2SOVRC_4_8A << MAX77705_REG_B2SOVRC_SHIFT);
+	/* top off current 150mA */
+	/* top off timer 30min */
+	reg_data = (MAX77705_TO_ITH_150MA << MAX77705_TO_ITH_SHIFT) |
+			(MAX77705_TO_TIME_30M << MAX77705_TO_TIME_SHIFT) |
+			(MAX77705_SYS_TRACK_DISABLE << MAX77705_SYS_TRACK_DIS_SHIFT);
+	regmap_update_bits(regmap, MAX77705_CHG_REG_CNFG_03,
+			   (MAX77705_TO_ITH_MASK |
+			   MAX77705_TO_TIME_MASK |
+			   MAX77705_SYS_TRACK_DIS_MASK), reg_data);
+
+	/* cv voltage 4.2V or 4.35V */
+	/* MINVSYS 3.6V(default) */
+	if (info->voltage_max_design_uv < 0) {
+		dev_warn(chg->dev, "missing battery:voltage-max-design-microvolt\n");
+		max77705_set_float_voltage(chg, 4200000);
+	} else {
+		max77705_set_float_voltage(chg, info->voltage_max_design_uv);
+	}
+
+	regmap_update_bits(regmap, MAX77705_CHG_REG_CNFG_12,
+				MAX77705_VCHGIN_REG_MASK, MAX77705_VCHGIN_4_5);
+	regmap_update_bits(regmap, MAX77705_CHG_REG_CNFG_12,
+				MAX77705_WCIN_REG_MASK, MAX77705_WCIN_4_5);
+
+	/* Watchdog timer */
+	regmap_update_bits(regmap, MAX77705_CHG_REG_CNFG_00,
+				MAX77705_WDTEN_MASK, 0);
+
+	/* Active Discharge Enable */
+	regmap_update_bits(regmap, MAX77705_PMIC_REG_MAINCTRL1, 1, 1);
+
+	/* VBYPSET=5.0V */
+	regmap_update_bits(regmap, MAX77705_CHG_REG_CNFG_11, MAX77705_VBYPSET_MASK, 0);
+
+	/* Switching Frequency : 1.5MHz */
+	regmap_update_bits(regmap, MAX77705_CHG_REG_CNFG_08, MAX77705_REG_FSW_MASK,
+				(MAX77705_CHG_FSW_1_5MHz << MAX77705_REG_FSW_SHIFT));
+
+	/* Auto skip mode */
+	regmap_update_bits(regmap, MAX77705_CHG_REG_CNFG_12, MAX77705_REG_DISKIP_MASK,
+				(MAX77705_AUTO_SKIP << MAX77705_REG_DISKIP_SHIFT));
+}
+
+static int max77705_charger_probe(struct platform_device *pdev)
+{
+	struct power_supply_config pscfg = {};
+	struct i2c_client *i2c_chg;
+	struct max77693_dev *max77705;
+	struct max77705_charger_data *chg;
+	struct device *dev, *parent;
+	struct regmap_irq_chip_data *irq_data;
+	int ret;
+
+	dev = &pdev->dev;
+	parent = dev->parent;
+	max77705 = dev_get_drvdata(parent);
+
+	chg = devm_kzalloc(dev, sizeof(*chg), GFP_KERNEL);
+	if (!chg)
+		return -ENOMEM;
+
+	platform_set_drvdata(pdev, chg);
+
+	i2c_chg = devm_i2c_new_dummy_device(dev, max77705->i2c->adapter, I2C_ADDR_CHG);
+	if (IS_ERR(i2c_chg))
+		return PTR_ERR(i2c_chg);
+
+	chg->regmap = devm_regmap_init_i2c(i2c_chg, &max77705_chg_regmap_config);
+	if (IS_ERR(chg->regmap))
+		return PTR_ERR(chg->regmap);
+
+	chg->dev = dev;
+
+	ret = regmap_update_bits(chg->regmap,
+				MAX77705_CHG_REG_INT_MASK,
+				MAX77705_CHGIN_IM, 0);
+	if (ret)
+		return ret;
+
+	pscfg.of_node = dev->of_node;
+	pscfg.drv_data = chg;
+
+	chg->psy_chg = devm_power_supply_register(dev, &max77705_charger_psy_desc, &pscfg);
+	if (IS_ERR(chg->psy_chg))
+		return PTR_ERR(chg->psy_chg);
+
+	max77705_charger_irq_chip.irq_drv_data = chg;
+	ret = devm_regmap_add_irq_chip(chg->dev, chg->regmap, max77705->irq,
+					IRQF_ONESHOT | IRQF_SHARED, 0,
+					&max77705_charger_irq_chip,
+					&irq_data);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to add irq chip\n");
+
+	chg->wqueue = create_singlethread_workqueue(dev_name(dev));
+	if (IS_ERR(chg->wqueue))
+		return dev_err_probe(dev, PTR_ERR(chg->wqueue), "failed to create workqueue\n");
+
+	INIT_WORK(&chg->chgin_work, max77705_chgin_isr_work);
+
+	max77705_charger_initialize(chg);
+
+	ret = devm_add_action_or_reset(dev, max77705_charger_disable, chg);
+	if (ret)
+		return ret;
+
+	return max77705_charger_enable(chg);
+}
+
+static const struct of_device_id max77705_charger_of_match[] = {
+	{ .compatible = "maxim,max77705-charger" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, max77705_charger_of_match);
+
+static struct platform_driver max77705_charger_driver = {
+	.driver = {
+		.name = "max77705-charger",
+		.of_match_table = max77705_charger_of_match,
+	},
+	.probe = max77705_charger_probe,
+};
+module_platform_driver(max77705_charger_driver);
+
+MODULE_AUTHOR("Dzmitry Sankouski <dsankouski@gmail.com>");
+MODULE_DESCRIPTION("Maxim MAX77705 charger driver");
+MODULE_LICENSE("GPL");
diff --git a/include/linux/power/max77705_charger.h b/include/linux/power/max77705_charger.h
new file mode 100644
index 000000000000..cb5cd03e54e2
--- /dev/null
+++ b/include/linux/power/max77705_charger.h
@@ -0,0 +1,194 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Maxim MAX77705 definitions.
+ *
+ * Copyright (C) 2015 Samsung Electronics, Inc.
+ * Copyright (C) 2024 Dzmitry Sankouski <dsankouski@gmail.com>
+ */
+
+#ifndef __MAX77705_CHARGER_H
+#define __MAX77705_CHARGER_H __FILE__
+
+/* MAX77705_CHG_REG_CHG_INT */
+#define MAX77705_BYP_I		BIT(0)
+#define MAX77705_INP_LIMIT_I	BIT(1)
+#define MAX77705_BATP_I		BIT(2)
+#define MAX77705_BAT_I		BIT(3)
+#define MAX77705_CHG_I		BIT(4)
+#define MAX77705_WCIN_I		BIT(5)
+#define MAX77705_CHGIN_I	BIT(6)
+#define MAX77705_AICL_I		BIT(7)
+
+/* MAX77705_CHG_REG_CHG_INT_MASK */
+#define MAX77705_BYP_IM		BIT(0)
+#define MAX77705_INP_LIMIT_IM	BIT(1)
+#define MAX77705_BATP_IM	BIT(2)
+#define MAX77705_BAT_IM		BIT(3)
+#define MAX77705_CHG_IM		BIT(4)
+#define MAX77705_WCIN_IM	BIT(5)
+#define MAX77705_CHGIN_IM	BIT(6)
+#define MAX77705_AICL_IM	BIT(7)
+
+/* MAX77705_CHG_REG_CHG_INT_OK */
+#define MAX77705_BYP_OK		BIT(0)
+#define MAX77705_DISQBAT_OK	BIT(1)
+#define MAX77705_BATP_OK	BIT(2)
+#define MAX77705_BAT_OK		BIT(3)
+#define MAX77705_CHG_OK		BIT(4)
+#define MAX77705_WCIN_OK	BIT(5)
+#define MAX77705_CHGIN_OK	BIT(6)
+#define MAX77705_AICL_OK	BIT(7)
+
+/* MAX77705_CHG_REG_DETAILS_00 */
+#define MAX77705_BATP_DTLS		BIT(0)
+#define MAX77705_WCIN_DTLS		GENMASK(4, 3)
+#define MAX77705_WCIN_DTLS_SHIFT	3
+#define MAX77705_CHGIN_DTLS		GENMASK(6, 5)
+#define MAX77705_CHGIN_DTLS_SHIFT	5
+
+/* MAX77705_CHG_REG_DETAILS_01 */
+#define MAX77705_CHG_DTLS	GENMASK(3, 0)
+#define MAX77705_CHG_DTLS_SHIFT	0
+#define MAX77705_BAT_DTLS	GENMASK(6, 4)
+#define MAX77705_BAT_DTLS_SHIFT	4
+
+/* MAX77705_CHG_REG_DETAILS_02 */
+#define MAX77705_BYP_DTLS	GENMASK(3, 0)
+#define MAX77705_BYP_DTLS_SHIFT	0
+
+/* MAX77705_CHG_REG_CNFG_00 */
+#define MAX77705_CHG_SHIFT	0
+#define MAX77705_UNO_SHIFT	1
+#define MAX77705_OTG_SHIFT	1
+#define MAX77705_BUCK_SHIFT	2
+#define MAX77705_BOOST_SHIFT	3
+#define MAX77705_WDTEN_SHIFT	4
+#define MAX77705_MODE_MASK	GENMASK(3, 0)
+#define MAX77705_CHG_MASK	BIT(MAX77705_CHG_SHIFT)
+#define MAX77705_UNO_MASK	BIT(MAX77705_UNO_SHIFT)
+#define MAX77705_OTG_MASK	BIT(MAX77705_OTG_SHIFT)
+#define MAX77705_BUCK_MASK	BIT(MAX77705_BUCK_SHIFT)
+#define MAX77705_BOOST_MASK	BIT(MAX77705_BOOST_SHIFT)
+#define MAX77705_WDTEN_MASK	BIT(MAX77705_WDTEN_SHIFT)
+#define MAX77705_UNO_CTRL	(MAX77705_UNO_MASK | MAX77705_BOOST_MASK)
+#define MAX77705_OTG_CTRL	(MAX77705_OTG_MASK | MAX77705_BOOST_MASK)
+
+/* MAX77705_CHG_REG_CNFG_01 */
+#define MAX77705_FCHGTIME_SHIFT		0
+#define MAX77705_FCHGTIME_MASK		GENMASK(2, 0)
+#define MAX77705_CHG_RSTRT_SHIFT	4
+#define MAX77705_CHG_RSTRT_MASK		GENMASK(5, 4)
+#define MAX77705_FCHGTIME_DISABLE	0
+#define MAX77705_CHG_RSTRT_DISABLE	0x3
+
+#define MAX77705_PQEN_SHIFT		7
+#define MAX77705_PQEN_MASK		BIT(7)
+#define MAX77705_CHG_PQEN_DISABLE	0
+#define MAX77705_CHG_PQEN_ENABLE	1
+
+/* MAX77705_CHG_REG_CNFG_02 */
+#define MAX77705_OTG_ILIM_SHIFT		6
+#define MAX77705_OTG_ILIM_MASK		GENMASK(7, 6)
+#define MAX77705_OTG_ILIM_500		0
+#define MAX77705_OTG_ILIM_900		1
+#define MAX77705_OTG_ILIM_1200		2
+#define MAX77705_OTG_ILIM_1500		3
+#define MAX77705_CHG_CC			GENMASK(5, 0)
+
+/* MAX77705_CHG_REG_CNFG_03 */
+#define MAX77705_TO_ITH_SHIFT		0
+#define MAX77705_TO_ITH_MASK		GENMASK(2, 0)
+#define MAX77705_TO_TIME_SHIFT		3
+#define MAX77705_TO_TIME_MASK		GENMASK(5, 3)
+#define MAX77705_SYS_TRACK_DIS_SHIFT	7
+#define MAX77705_SYS_TRACK_DIS_MASK	BIT(7)
+#define MAX77705_TO_ITH_150MA		0
+#define MAX77705_TO_TIME_30M		3
+#define MAX77705_SYS_TRACK_ENABLE	0
+#define MAX77705_SYS_TRACK_DISABLE	1
+
+/* MAX77705_CHG_REG_CNFG_04 */
+#define MAX77705_CHG_MINVSYS_SHIFT	6
+#define MAX77705_CHG_MINVSYS_MASK	GENMASK(7, 6)
+#define MAX77705_CHG_PRM_SHIFT		0
+#define MAX77705_CHG_PRM_MASK		GENMASK(5, 0)
+
+#define MAX77705_CHG_CV_PRM_SHIFT	0
+#define MAX77705_CHG_CV_PRM_MASK	GENMASK(5, 0)
+
+/* MAX77705_CHG_REG_CNFG_05 */
+#define MAX77705_REG_B2SOVRC_SHIFT	0
+#define MAX77705_REG_B2SOVRC_MASK	GENMASK(3, 0)
+#define MAX77705_B2SOVRC_DISABLE	0
+#define MAX77705_B2SOVRC_4_5A		6
+#define MAX77705_B2SOVRC_4_8A		8
+#define MAX77705_B2SOVRC_5_0A		9
+
+/* MAX77705_CHG_CNFG_06 */
+#define MAX77705_WDTCLR_SHIFT		0
+#define MAX77705_WDTCLR_MASK		GENMASK(1, 0)
+#define MAX77705_WDTCLR			1
+#define MAX77705_CHGPROT_MASK		GENMASK(3, 2)
+#define MAX77705_CHGPROT_UNLOCKED	GENMASK(3, 2)
+#define MAX77705_SLOWEST_LX_SLOPE	GENMASK(6, 5)
+
+/* MAX77705_CHG_REG_CNFG_07 */
+#define MAX77705_CHG_FMBST		4
+#define MAX77705_REG_FMBST_SHIFT	2
+#define MAX77705_REG_FMBST_MASK		BIT(MAX77705_REG_FMBST_SHIFT)
+#define MAX77705_REG_FGSRC_SHIFT	1
+#define MAX77705_REG_FGSRC_MASK		BIT(MAX77705_REG_FGSRC_SHIFT)
+
+/* MAX77705_CHG_REG_CNFG_08 */
+#define MAX77705_REG_FSW_SHIFT		0
+#define MAX77705_REG_FSW_MASK		GENMASK(1, 0)
+#define MAX77705_CHG_FSW_3MHz		0
+#define MAX77705_CHG_FSW_2MHz		1
+#define MAX77705_CHG_FSW_1_5MHz		2
+
+/* MAX77705_CHG_REG_CNFG_09 */
+#define MAX77705_CHG_CHGIN_LIM_MASK		GENMASK(6, 0)
+#define MAX77705_CHG_EN_MASK			BIT(7)
+#define MAX77705_CHG_DISABLE			0
+#define MAX77705_CHARGER_CHG_CHARGING(_reg) \
+				(((_reg) & MAX77705_CHG_EN_MASK) > 1)
+
+
+/* MAX77705_CHG_REG_CNFG_10 */
+#define MAX77705_CHG_WCIN_LIM		GENMASK(5, 0)
+
+/* MAX77705_CHG_REG_CNFG_11 */
+#define MAX77705_VBYPSET_SHIFT		0
+#define MAX77705_VBYPSET_MASK		GENMASK(6, 0)
+
+/* MAX77705_CHG_REG_CNFG_12 */
+#define MAX77705_CHGINSEL_SHIFT		5
+#define MAX77705_CHGINSEL_MASK		BIT(MAX77705_CHGINSEL_SHIFT)
+#define MAX77705_WCINSEL_SHIFT		6
+#define MAX77705_WCINSEL_MASK		BIT(MAX77705_WCINSEL_SHIFT)
+#define MAX77705_VCHGIN_REG_MASK	GENMASK(4, 3)
+#define MAX77705_WCIN_REG_MASK		GENMASK(2, 1)
+#define MAX77705_REG_DISKIP_SHIFT	0
+#define MAX77705_REG_DISKIP_MASK	BIT(MAX77705_REG_DISKIP_SHIFT)
+/* REG=4.5V, UVLO=4.7V */
+#define MAX77705_VCHGIN_4_5		0
+/* REG=4.5V, UVLO=4.7V */
+#define MAX77705_WCIN_4_5		0
+#define MAX77705_DISABLE_SKIP		1
+#define MAX77705_AUTO_SKIP		0
+
+/* mA */
+#define MAX77705_CURRENT_STEP		25
+#define MAX77705_CURRENT_WCIN_MAX	1600
+#define MAX77705_CURRENT_CHGIN_MAX	3200
+
+struct max77705_charger_data {
+	struct device			*dev;
+	struct regmap		*regmap;
+	struct power_supply_battery_info *bat_info;
+	struct workqueue_struct *wqueue;
+	struct work_struct	chgin_work;
+	struct power_supply	*psy_chg;
+};
+
+#endif /* __MAX77705_CHARGER_H */

-- 
2.39.5


