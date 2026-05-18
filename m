Return-Path: <linux-leds+bounces-8193-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8A0KKtrjCmo29AQAu9opvQ
	(envelope-from <linux-leds+bounces-8193-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 18 May 2026 12:03:06 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 248B856A450
	for <lists+linux-leds@lfdr.de>; Mon, 18 May 2026 12:03:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 76FC4304BCD7
	for <lists+linux-leds@lfdr.de>; Mon, 18 May 2026 10:00:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 856CE3E9C1C;
	Mon, 18 May 2026 09:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SBj0a/KF"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE5E93DE427
	for <linux-leds@vger.kernel.org>; Mon, 18 May 2026 09:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779098391; cv=none; b=hXFFnPHL5aH2hVxtozeh4heW4RmQITNUtaqTY57vGB7Zorm5q3Xn9D3IFGrBfVoR1d5Od1tRXPD6npdLawbnII0KySlNhUYUhAB5NPzCLrCNQZxcbiUInQobwkcLnw5bjMG36HHl3mmUVNbE0buVQpT3chE8RcT8X9MuiX1gxDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779098391; c=relaxed/simple;
	bh=ax773twRtLZJ0kJ5Lx9vuD3uvjMxRvnjoBBROl6thDk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EJCHh7bAuq9bOqZd56xZM0vIcsa+aGiNZ/s4KlTzfOt97LdhPv8fnw/k6eWQRH6S5DpWtWNA29qVaE8JQBwTNXjnMFaC9mABEPfW3AIwU7tnCY443dOgKPdkd7zXNNJtgstDrQ2k04uWS/JMOZOEqI9mlRQ8/jpYXMjL+uc3uWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SBj0a/KF; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-48984d29fe3so22495335e9.0
        for <linux-leds@vger.kernel.org>; Mon, 18 May 2026 02:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779098385; x=1779703185; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gppl+gtYL3otiuD11521yssyTqiCyHjPQDRoRmP2Zfc=;
        b=SBj0a/KFcUOBJujGo3nHtKiu7UA6ZVhFLXchJSeM5xLr28tAkpMQE9cdPaXXHiq7n/
         AE6oyvQaGjjRH0oErDGHfhMak4I+NWfECYkbr1O984jBlztkIgQKMU1izdFeXhX53AVp
         anxS+5e0f+YRuTpra2+NOHWMf/YQENm6j1lvxGRohNEGEe3T4D7p0v2zmd4InLDva6Ea
         WNt44kJlB0INxLrdNNXqqM5U6y1ANW5/tblQxepekk3NLndow6Tlxn8fXJHoQVTnM7Eq
         /GI0lFrPVXQQ4n7QLPARUXLYdG2RKKmVr1L1xRIZfzBYZ9L0Nwu3Z+MP2tcvw6Asw1k6
         21xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779098385; x=1779703185;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gppl+gtYL3otiuD11521yssyTqiCyHjPQDRoRmP2Zfc=;
        b=UFEiSTexOZbvyC7SnhgS4ksOCDej6wf8BfgvoPOxSUhV/V+An9MEHiVbXgelBZay9Q
         v4+sSnPFMNlO8oZ9FicME+ugZzPlAYsEx3j9iPH/ZwdeVkskumAeURUmdrZH6jpN2czB
         8UBs+zByOrfx1PJ4sNzIPh6OeUpYMFLyptfV4G5ZS90SeCh9mh9JwxJlFrQv0ejtoert
         IT///UxwC3wJQGeyrUEZubFX72CRHN9oE1tIEUYUFPsWOBWK7FRm46GeKixIETWhH5sK
         jPGHpc6cacHQcGXx8UJc0iMEhptUMgtiDkpnXX2GvJPmLmkBFr/kA8wIEs+3sbKeuURe
         Ro+w==
X-Forwarded-Encrypted: i=1; AFNElJ9Egts4H6HbB5iiYQKp3Bo46kTEzaZMqjEHr6/KqITNOdyqQvqCQEPw6eoZrSLnRvSrY2Sm3F387nIT@vger.kernel.org
X-Gm-Message-State: AOJu0YzQ8owq8FGdEwLdgqnhqu0u+jdB2TG19DwN4I7rPOAGPYJHwFzB
	Brvi0ebMlRtknxZLvppAE1vBpPqgVbMSeokma3z8kVoS2qd0+WQj8Dff
X-Gm-Gg: Acq92OEliwgFHS1/mbfEbqa0dBT+0/gYM3Z4VK6BA+vHS0zMTb5Wvbc9Qj/+lWWNGrw
	G7gSXuTrPU0vEADDv/yHNARa7T1BQfyUfLY6jXceVtVUe9p/Yl0WaP4yG56bIziJU2x0m1iHTES
	U3gKpRGzRuam8vfqJhytVnw+8kn0P2Jq0aaxetZyQLhBuT5qPz4vp/f6gQgO1pgTHQnO/ehNNCa
	naAr97Q4gUcpNXCm8yf8bA5p123jZt9tvlJmPSUvCsu1YqGIj7W74UTPz5OvqsQHu6Nj2qjeiqj
	PWDV0sqWppHcYx6h8mC3Y5uvvWA05T5zaH+MZnxaJlFuD0wwv0CqOlkDMguBkVrSwl4KFmMe+BG
	8MF9bf+RuzTBsCVX8S0Vj9gZnE77teGmY9gQl1kclcq8ZqPif3fzVQBfqX+QRWePYqjev8f9R9C
	Oxr46SK1kQGvJA5YVrWQ4MJPU=
X-Received: by 2002:a05:600c:4a1a:b0:48a:592c:e655 with SMTP id 5b1f17b1804b1-48fe6325f25mr129726485e9.17.1779098385065;
        Mon, 18 May 2026 02:59:45 -0700 (PDT)
Received: from xeon ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48febe7dd22sm102995005e9.7.2026.05.18.02.59.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 02:59:44 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Sebastian Reichel <sre@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Ion Agorria <ion@agorria.com>,
	=?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-leds@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: [PATCH v7 7/7] power: supply: Add charger driver for Asus Transformers
Date: Mon, 18 May 2026 12:59:07 +0300
Message-ID: <20260518095907.36158-8-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260518095907.36158-1-clamor95@gmail.com>
References: <20260518095907.36158-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 248B856A450
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8193-lists,linux-leds=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,agorria.com,rere.qmqm.pl];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:email,qmqm.pl:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

From: Michał Mirosław <mirq-linux@rere.qmqm.pl>

Add support for charger detection capabilities found in the embedded
controller of ASUS Transformer devices.

Suggested-by: Maxim Schwalm <maxim.schwalm@gmail.com>
Suggested-by: Svyatoslav Ryhel <clamor95@gmail.com>
Signed-off-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/power/supply/Kconfig                  |  11 +
 drivers/power/supply/Makefile                 |   1 +
 .../supply/asus-transformer-ec-charger.c      | 207 ++++++++++++++++++
 3 files changed, 219 insertions(+)
 create mode 100644 drivers/power/supply/asus-transformer-ec-charger.c

diff --git a/drivers/power/supply/Kconfig b/drivers/power/supply/Kconfig
index 1dc3d0b2e021..ebc6d5c01330 100644
--- a/drivers/power/supply/Kconfig
+++ b/drivers/power/supply/Kconfig
@@ -508,6 +508,17 @@ config CHARGER_88PM860X
 	help
 	  Say Y here to enable charger for Marvell 88PM860x chip.
 
+config CHARGER_ASUS_TRANSFORMER_EC
+	tristate "Asus Transformer's charger driver"
+	depends on MFD_ASUS_TRANSFORMER_EC
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
index 1313f367715c..93d17d28081e 100644
--- a/drivers/power/supply/Makefile
+++ b/drivers/power/supply/Makefile
@@ -69,6 +69,7 @@ obj-$(CONFIG_CHARGER_RT9471)	+= rt9471.o
 obj-$(CONFIG_CHARGER_RT9756)	+= rt9756.o
 obj-$(CONFIG_BATTERY_TWL4030_MADC)	+= twl4030_madc_battery.o
 obj-$(CONFIG_CHARGER_88PM860X)	+= 88pm860x_charger.o
+obj-$(CONFIG_CHARGER_ASUS_TRANSFORMER_EC)	+= asus-transformer-ec-charger.o
 obj-$(CONFIG_CHARGER_PF1550)	+= pf1550-charger.o
 obj-$(CONFIG_BATTERY_RX51)	+= rx51_battery.o
 obj-$(CONFIG_AB8500_BM)		+= ab8500_bmdata.o ab8500_charger.o ab8500_fg.o ab8500_btemp.o ab8500_chargalg.o
diff --git a/drivers/power/supply/asus-transformer-ec-charger.c b/drivers/power/supply/asus-transformer-ec-charger.c
new file mode 100644
index 000000000000..e33f4389d337
--- /dev/null
+++ b/drivers/power/supply/asus-transformer-ec-charger.c
@@ -0,0 +1,207 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+
+#include <linux/err.h>
+#include <linux/mfd/asus-transformer-ec.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/power_supply.h>
+#include <linux/property.h>
+
+struct asus_ec_charger_data {
+	struct notifier_block nb;
+	struct asusec_core *ec;
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
+	/* Check if model name is requested first since it needs no hw access */
+	if (psp == POWER_SUPPLY_PROP_MODEL_NAME) {
+		val->strval = priv->ec->model;
+		return 0;
+	}
+
+	ret = asus_dockram_access_ctl(priv->ec->dockram, &ctl, 0, 0);
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
+			return asus_dockram_access_ctl(priv->ec->dockram, NULL,
+				ASUSEC_CTL_TEST_DISCHARGE | ASUSEC_CTL_USB_CHARGE,
+				ASUSEC_CTL_USB_CHARGE);
+
+		case POWER_SUPPLY_CHARGE_BEHAVIOUR_INHIBIT_CHARGE:
+			return asus_dockram_access_ctl(priv->ec->dockram, NULL,
+				ASUSEC_CTL_TEST_DISCHARGE | ASUSEC_CTL_USB_CHARGE, 0);
+
+		case POWER_SUPPLY_CHARGE_BEHAVIOUR_FORCE_DISCHARGE:
+			return asus_dockram_access_ctl(priv->ec->dockram, NULL,
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
+	struct asusec_core *ec = dev_get_drvdata(pdev->dev.parent);
+	struct asus_ec_charger_data *priv;
+	struct device *dev = &pdev->dev;
+	struct power_supply_config cfg = { };
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	platform_set_drvdata(pdev, priv);
+	priv->ec = ec;
+
+	cfg.fwnode = dev_fwnode(dev->parent);
+	cfg.drv_data = priv;
+
+	memcpy(&priv->psy_desc, &asus_ec_charger_desc, sizeof(priv->psy_desc));
+	priv->psy_desc.name = devm_kasprintf(dev, GFP_KERNEL, "%s-charger",
+					     priv->ec->name);
+	if (!priv->psy_desc.name)
+		return -ENOMEM;
+
+	priv->psy = devm_power_supply_register(dev, &priv->psy_desc, &cfg);
+	if (IS_ERR(priv->psy))
+		return dev_err_probe(dev, PTR_ERR(priv->psy),
+				     "Failed to register power supply\n");
+
+	priv->nb.notifier_call = asus_ec_charger_notify;
+
+	return blocking_notifier_chain_register(&ec->notify_list, &priv->nb);
+}
+
+static void asus_ec_charger_remove(struct platform_device *pdev)
+{
+	struct asus_ec_charger_data *priv = platform_get_drvdata(pdev);
+	struct asusec_core *ec = priv->ec;
+
+	blocking_notifier_chain_unregister(&ec->notify_list, &priv->nb);
+}
+
+static struct platform_driver asus_ec_charger_driver = {
+	.driver.name = "asus-transformer-ec-charger",
+	.probe = asus_ec_charger_probe,
+	.remove = asus_ec_charger_remove,
+};
+module_platform_driver(asus_ec_charger_driver);
+
+MODULE_AUTHOR("Michał Mirosław <mirq-linux@rere.qmqm.pl>");
+MODULE_DESCRIPTION("ASUS Transformer Pad battery charger driver");
+MODULE_LICENSE("GPL");
-- 
2.51.0


