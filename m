Return-Path: <linux-leds+bounces-6910-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KATRIM+6iWlwBQUAu9opvQ
	(envelope-from <linux-leds+bounces-6910-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 09 Feb 2026 11:45:35 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 12D1A10E46E
	for <lists+linux-leds@lfdr.de>; Mon, 09 Feb 2026 11:45:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BB8D2300898B
	for <lists+linux-leds@lfdr.de>; Mon,  9 Feb 2026 10:45:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0343336827A;
	Mon,  9 Feb 2026 10:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gM3bS39W"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98C34369220
	for <linux-leds@vger.kernel.org>; Mon,  9 Feb 2026 10:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770633885; cv=none; b=Leiq5WE9uFcG0Vyb/RCEl0NiElPwEth5jahM/kKOpMuuueXnDiFP1ZRbBUGpxahC6CDA73qHomLGjggjVAk/x4RT9aWHR4tThQ4hK5OyqYnfxzWr1l7Si6v9zmIX3nayRXsZYUo1QOiw7QQNCZT7uezoFP7AUnSSHkkDMiygGR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770633885; c=relaxed/simple;
	bh=k7KRvNMoe4RCXdyS7KBOhLVUnIAHbOo5C9BcfOqLyNg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DjJhwN2Mh/9TxXttRLkMQWkN38R5WfnylnNyxKwWHTJKSyFMrqip3aXwfY7Qty6EMKa1y1WO6H3eFPUEJCUftgHpLYlb61RcAr1GJgSmXf/dFc3Jx30hWTXvKVorzTm3fqzxiBpKcKgRR2t4fLviU59NcO+Sacuz1JWdsSIzH00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gM3bS39W; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-59dd7bfeb8aso5178442e87.0
        for <linux-leds@vger.kernel.org>; Mon, 09 Feb 2026 02:44:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770633878; x=1771238678; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KaZhNgZQVw9D9Ed/1KFIESjeSdNz3uuFn8/CvSdtQc0=;
        b=gM3bS39WMYGMqD9XN2AH9ZAnkr7u2GFXk2xFRa2h10fRRJ/7Qy+uX2H/e5uXSmDe3u
         E1TXP2k47E/75WPlDf2c8qsuKZ9Bt95x1CREAiNEq3lu4TE6PkrRt5N9f6/tSMDDLA3O
         e81X4p2HTFa802S2X21zCY/z4IC9RWg+fydxIEepc7IYNiLvxXfWoNEZuaKuGYzgPyJC
         wPfJseFZAuLPEE9myAC4G6J5KrmlfG7/dhJlWXxITCEXVWb9fV9CgWmxgXMSwViIebL8
         05KxWqItbVglZoiQ+Fzd5mC8A8jg+tvKzltBPYsDkJ/mlFRKQ1rm3OnHSK+TmkemWUXC
         2N5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770633878; x=1771238678;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KaZhNgZQVw9D9Ed/1KFIESjeSdNz3uuFn8/CvSdtQc0=;
        b=Fx7xYje0IH4Mg07uFiNR8sFVS8s5MJoaIkhhJd8QQa3z7ve4wNBUnzRbAf+H0XGjUo
         awrJ3bMuXolnoxqfEnREPgPgnMZUSEqSpJ1Olxg7D+vsVKzmeuLQ1bvP11s1Q3QmMCx6
         DIV7ZMdsYzKDLOzIaEPK9BlYSx1HCMTFytxWYOGycSiQ44Vnj58F8dccujIyo+x+xgFW
         Xj7vzao8duYy3e3fDolXKiIT8yc6jlecW/bfiU3A3g9/LkY1RsA54H6kISHwWg1FDpLs
         iYNx1NhMr4GqYXLjfXlZxcEe/PUv+vEHM6dD+6CR0o1A5dVdMuH9+4b1NLuwx5ePEDIK
         mfSg==
X-Forwarded-Encrypted: i=1; AJvYcCUt69KAckfFpOpZPgKFoe/hE5uHfRB24K61eB92SMPnXUh75KWxHpmD/hH/islTBhy4niIO2esBOCf1@vger.kernel.org
X-Gm-Message-State: AOJu0YxVS5MvwKT12bzooMrt5yklcpQTmnFWoTGBU90hfGL7aTWg6lTD
	gEcVyXdkottQs7NA8jHzqddN7LK/zWqfUqi4HIOIEeD4eyBW6mA7Ii0x
X-Gm-Gg: AZuq6aKeqWSdJCWp6L2tTik6mnssrjpYlljUJGIIkIqr6gyA2xd2k0Oi1BU02yHPEsl
	4M8Tz+pbd41y83GZCskr2nu88XYjopub7etU8UP1u7ZTb7Ni0243vzwEyQ2o5ZdfIL9fYiwraqq
	BRzku/x0MHS77UzaEUfBK0OrQ8UuqhPfd4LrGwqi/N2vVHBuXkEJmqQcy5aGHDkhoG14WrkG1Kb
	7o03UySx8UasqWjR8CjuRhZEU3GKyCGlJ0R6LH9GtNLISlI0hRKlV6UP1ZZIk9ziN14EceKt7MG
	tjUCWxrnhe2CtJ52ElVyJ5VdzUwfQPI68XEMXgtCU69Q/Mf91jbHWgoeIy2i5nDBzYaJXWS5pmi
	4XZwPiCfx2X4QH1yg8WQ9+njIF4VbkW3nq262x/t6PBQEFmI0uIo3vVwXNa56Zzj5eze7SVKXK1
	vN
X-Received: by 2002:a05:6512:ad5:b0:59e:2479:7607 with SMTP id 2adb3069b0e04-59e450452efmr3115787e87.9.1770633877613;
        Mon, 09 Feb 2026 02:44:37 -0800 (PST)
Received: from xeon ([188.163.112.51])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e44cf6f88sm2501469e87.21.2026.02.09.02.44.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 02:44:37 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Pavel Machek <pavel@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sebastian Reichel <sre@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	=?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
	Ion Agorria <ion@agorria.com>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-leds@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: [PATCH v2 9/9] power: supply: Add charger driver for Asus Transformers
Date: Mon,  9 Feb 2026 12:44:07 +0200
Message-ID: <20260209104407.116426-10-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260209104407.116426-1-clamor95@gmail.com>
References: <20260209104407.116426-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6910-lists,linux-leds=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,arndb.de,linuxfoundation.org,rere.qmqm.pl,agorria.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[17];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.985];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qmqm.pl:email]
X-Rspamd-Queue-Id: 12D1A10E46E
X-Rspamd-Action: no action

From: Michał Mirosław <mirq-linux@rere.qmqm.pl>

Add support for charger detection capabilities found in the embedded
controller of ASUS Transformer devices.

Suggested-by: Maxim Schwalm <maxim.schwalm@gmail.com>
Suggested-by: Svyatoslav Ryhel <clamor95@gmail.com>
Signed-off-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/power/supply/Kconfig           |  11 ++
 drivers/power/supply/Makefile          |   1 +
 drivers/power/supply/asus-ec-charger.c | 206 +++++++++++++++++++++++++
 3 files changed, 218 insertions(+)
 create mode 100644 drivers/power/supply/asus-ec-charger.c

diff --git a/drivers/power/supply/Kconfig b/drivers/power/supply/Kconfig
index bcf6a23858be..43b902a12795 100644
--- a/drivers/power/supply/Kconfig
+++ b/drivers/power/supply/Kconfig
@@ -497,6 +497,17 @@ config CHARGER_88PM860X
 	help
 	  Say Y here to enable charger for Marvell 88PM860x chip.
 
+config CHARGER_ASUSEC
+	tristate "Asus Transformer's charger driver"
+	depends on MFD_ASUSEC
+	help
+	  Say Y here to enable support AC plug detection on Asus Transformer
+	  Dock.
+
+	  This sub-driver supports charger detection mechanism found in Asus
+	  Transformer tablets and mobile docks and controlled by special
+	  embedded controller.
+
 config CHARGER_PF1550
 	tristate "NXP PF1550 battery charger driver"
 	depends on MFD_PF1550
diff --git a/drivers/power/supply/Makefile b/drivers/power/supply/Makefile
index 0a2cbfa96ed9..b93848227f50 100644
--- a/drivers/power/supply/Makefile
+++ b/drivers/power/supply/Makefile
@@ -23,6 +23,7 @@ obj-$(CONFIG_BATTERY_88PM860X)	+= 88pm860x_battery.o
 obj-$(CONFIG_CHARGER_ADP5061)	+= adp5061.o
 obj-$(CONFIG_BATTERY_ACT8945A)	+= act8945a_charger.o
 obj-$(CONFIG_BATTERY_ASUSEC)	+= asus-ec-battery.o
+obj-$(CONFIG_CHARGER_ASUSEC)	+= asus-ec-charger.o
 obj-$(CONFIG_BATTERY_AXP20X)	+= axp20x_battery.o
 obj-$(CONFIG_CHARGER_AXP20X)	+= axp20x_ac_power.o
 obj-$(CONFIG_BATTERY_CHAGALL)	+= chagall-battery.o
diff --git a/drivers/power/supply/asus-ec-charger.c b/drivers/power/supply/asus-ec-charger.c
new file mode 100644
index 000000000000..bcf798432755
--- /dev/null
+++ b/drivers/power/supply/asus-ec-charger.c
@@ -0,0 +1,206 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * ASUS EC driver - charger monitoring
+ */
+
+#include <linux/err.h>
+#include <linux/mfd/asus-ec.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/power_supply.h>
+#include <linux/property.h>
+
+struct asus_ec_charger_data {
+	struct notifier_block nb;
+	const struct asusec_info *ec;
+	struct power_supply *psy;
+	struct power_supply_desc psy_desc;
+};
+
+static enum power_supply_property asus_ec_charger_properties[] = {
+	POWER_SUPPLY_PROP_USB_TYPE,
+	POWER_SUPPLY_PROP_CHARGE_BEHAVIOUR,
+	POWER_SUPPLY_PROP_ONLINE,
+	POWER_SUPPLY_PROP_MODEL_NAME,
+};
+
+static int asus_ec_charger_get_property(struct power_supply *psy,
+					enum power_supply_property psp,
+					union power_supply_propval *val)
+{
+	struct asus_ec_charger_data *priv = power_supply_get_drvdata(psy);
+	enum power_supply_usb_type psu;
+	int ret;
+	u64 ctl;
+
+	ret = asus_ec_get_ctl(priv->ec, &ctl);
+	if (ret)
+		return ret;
+
+	switch (ctl & (ASUSEC_CTL_FULL_POWER_SOURCE | ASUSEC_CTL_DIRECT_POWER_SOURCE)) {
+	case ASUSEC_CTL_FULL_POWER_SOURCE:
+		psu = POWER_SUPPLY_USB_TYPE_CDP;	/* DOCK */
+		break;
+	case ASUSEC_CTL_DIRECT_POWER_SOURCE:
+		psu = POWER_SUPPLY_USB_TYPE_SDP;	/* USB */
+		break;
+	case 0:
+		psu = POWER_SUPPLY_USB_TYPE_UNKNOWN;	/* no power source connected */
+		break;
+	default:
+		psu = POWER_SUPPLY_USB_TYPE_ACA;	/* power adapter */
+		break;
+	}
+
+	switch (psp) {
+	case POWER_SUPPLY_PROP_ONLINE:
+		val->intval = psu != POWER_SUPPLY_USB_TYPE_UNKNOWN;
+		return 0;
+
+	case POWER_SUPPLY_PROP_USB_TYPE:
+		val->intval = psu;
+		return 0;
+
+	case POWER_SUPPLY_PROP_CHARGE_BEHAVIOUR:
+		if (ctl & ASUSEC_CTL_TEST_DISCHARGE)
+			val->intval = POWER_SUPPLY_CHARGE_BEHAVIOUR_FORCE_DISCHARGE;
+		else if (ctl & ASUSEC_CTL_USB_CHARGE)
+			val->intval = POWER_SUPPLY_CHARGE_BEHAVIOUR_AUTO;
+		else
+			val->intval = POWER_SUPPLY_CHARGE_BEHAVIOUR_INHIBIT_CHARGE;
+		return 0;
+
+	case POWER_SUPPLY_PROP_MODEL_NAME:
+		val->strval = priv->ec->model;
+		return 0;
+
+	default:
+		return -EINVAL;
+	}
+}
+
+static int asus_ec_charger_set_property(struct power_supply *psy,
+					enum power_supply_property psp,
+					const union power_supply_propval *val)
+{
+	struct asus_ec_charger_data *priv = power_supply_get_drvdata(psy);
+
+	switch (psp) {
+	case POWER_SUPPLY_PROP_CHARGE_BEHAVIOUR:
+		switch ((enum power_supply_charge_behaviour)val->intval) {
+		case POWER_SUPPLY_CHARGE_BEHAVIOUR_AUTO:
+			return asus_ec_update_ctl(priv->ec,
+				ASUSEC_CTL_TEST_DISCHARGE | ASUSEC_CTL_USB_CHARGE,
+				ASUSEC_CTL_USB_CHARGE);
+
+		case POWER_SUPPLY_CHARGE_BEHAVIOUR_INHIBIT_CHARGE:
+			return asus_ec_clear_ctl_bits(priv->ec,
+				ASUSEC_CTL_TEST_DISCHARGE | ASUSEC_CTL_USB_CHARGE);
+
+		case POWER_SUPPLY_CHARGE_BEHAVIOUR_FORCE_DISCHARGE:
+			return asus_ec_update_ctl(priv->ec,
+				ASUSEC_CTL_TEST_DISCHARGE | ASUSEC_CTL_USB_CHARGE,
+				ASUSEC_CTL_TEST_DISCHARGE);
+		default:
+			return -EINVAL;
+		}
+
+	default:
+		return -EINVAL;
+	}
+}
+
+static int asus_ec_charger_property_is_writeable(struct power_supply *psy,
+						 enum power_supply_property psp)
+{
+	switch (psp) {
+	case POWER_SUPPLY_PROP_CHARGE_BEHAVIOUR:
+		return true;
+	default:
+		return false;
+	}
+}
+
+static const struct power_supply_desc asus_ec_charger_desc = {
+	.name = "asus-ec-charger",
+	.type = POWER_SUPPLY_TYPE_USB,
+	.charge_behaviours = BIT(POWER_SUPPLY_CHARGE_BEHAVIOUR_AUTO) |
+			     BIT(POWER_SUPPLY_CHARGE_BEHAVIOUR_INHIBIT_CHARGE) |
+			     BIT(POWER_SUPPLY_CHARGE_BEHAVIOUR_FORCE_DISCHARGE),
+	.usb_types = BIT(POWER_SUPPLY_USB_TYPE_UNKNOWN) |
+		     BIT(POWER_SUPPLY_USB_TYPE_SDP) |
+		     BIT(POWER_SUPPLY_USB_TYPE_CDP) |
+		     BIT(POWER_SUPPLY_USB_TYPE_ACA),
+	.properties = asus_ec_charger_properties,
+	.num_properties = ARRAY_SIZE(asus_ec_charger_properties),
+	.get_property = asus_ec_charger_get_property,
+	.set_property = asus_ec_charger_set_property,
+	.property_is_writeable = asus_ec_charger_property_is_writeable,
+	.no_thermal = true,
+};
+
+static int asus_ec_charger_notify(struct notifier_block *nb,
+				  unsigned long action, void *data)
+{
+	struct asus_ec_charger_data *priv =
+		container_of(nb, struct asus_ec_charger_data, nb);
+
+	switch (action) {
+	case ASUSEC_SMI_ACTION(POWER_NOTIFY):
+	case ASUSEC_SMI_ACTION(ADAPTER_EVENT):
+		power_supply_changed(priv->psy);
+		break;
+	}
+
+	return NOTIFY_DONE;
+}
+
+static int asus_ec_charger_probe(struct platform_device *pdev)
+{
+	struct asus_ec_charger_data *priv;
+	struct device *dev = &pdev->dev;
+	struct power_supply_config cfg = { };
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	platform_set_drvdata(pdev, priv);
+	priv->ec = cell_to_ec(pdev);
+
+	cfg.fwnode = dev_fwnode(dev);
+	cfg.drv_data = priv;
+
+	memcpy(&priv->psy_desc, &asus_ec_charger_desc, sizeof(priv->psy_desc));
+	priv->psy_desc.name = devm_kasprintf(dev, GFP_KERNEL, "%s-charger",
+					     priv->ec->name);
+
+	priv->psy = devm_power_supply_register(dev, &priv->psy_desc, &cfg);
+	if (IS_ERR(priv->psy))
+		return dev_err_probe(dev, PTR_ERR(priv->psy),
+				     "Failed to register power supply\n");
+
+	priv->nb.notifier_call = asus_ec_charger_notify;
+
+	return devm_asus_ec_register_notifier(pdev, &priv->nb);
+}
+
+static const struct of_device_id asus_ec_charger_match[] = {
+	{ .compatible = "asus,ec-charger" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, asus_ec_charger_match);
+
+static struct platform_driver asus_ec_charger_driver = {
+	.driver = {
+		.name = "asus-ec-charger",
+		.of_match_table = asus_ec_charger_match,
+	},
+	.probe = asus_ec_charger_probe,
+};
+module_platform_driver(asus_ec_charger_driver);
+
+MODULE_AUTHOR("Michał Mirosław <mirq-linux@rere.qmqm.pl>");
+MODULE_DESCRIPTION("ASUS Transformer Pad battery charger driver");
+MODULE_LICENSE("GPL");
-- 
2.51.0


