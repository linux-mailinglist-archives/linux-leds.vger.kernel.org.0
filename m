Return-Path: <linux-leds+bounces-6811-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cGr/Kvguf2kglQIAu9opvQ
	(envelope-from <linux-leds+bounces-6811-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sun, 01 Feb 2026 11:46:16 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id A1AD9C5883
	for <lists+linux-leds@lfdr.de>; Sun, 01 Feb 2026 11:46:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 09ACE300E60C
	for <lists+linux-leds@lfdr.de>; Sun,  1 Feb 2026 10:45:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEA4F33122D;
	Sun,  1 Feb 2026 10:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G+fZ9AN0"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2735732C939
	for <linux-leds@vger.kernel.org>; Sun,  1 Feb 2026 10:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769942664; cv=none; b=ufyqDaYc8ZN4decBTzISOPTko2D/Qshr1AaXfB2UIPbM+v4z+KwpPV/FUzFwVjYKChFlxifthiMFPddk63td4agTh6rJmGkpWD80VnB4JEixy/dpXUSy1VctmrHwv8cIZ0wQIJ0hh3E0SMHDEzhBbDs+DlUap433cFIuIu5Z8dI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769942664; c=relaxed/simple;
	bh=8NuHMq0VALACf4W7ccX2I+UZL6WHvoJZXHtgSaAu0K0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rMnVtCfmmlAQaJ9Fys0vk6xQDzb2ewPCqS1Fc5lc1uHc3yBUixa9tjYjjYI/gOtf7YD9a3zHqrC4XsHNKK4WZjM1JJuX05Pwo+bk6OAcras9ffcBImGxDkF42gsUnbaiGkWsgVdNnzqr5qrsCL6gKeh9E6AswyXkEgJsEgb3yFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G+fZ9AN0; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-47ee76e8656so46875715e9.0
        for <linux-leds@vger.kernel.org>; Sun, 01 Feb 2026 02:44:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769942660; x=1770547460; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OnDBGTm1Ih+jnzybSzeIGvkZ/MyRumNvTLokxTWDPVg=;
        b=G+fZ9AN0JQy5nffughlfaMVLSFEvdeft5xmFZo4QZJVPjYmuxaehSuhxy+cOdxyzwI
         hu8nJTww5I1lnffyH55m3Sutbf2Vggbo0IWW64m+JpdhuzEx2bo7Rj0Hhdwze+LbQl6B
         pt9ROObbJuc31aKc6VXM1sL/zhcp0981PU8kK9gs+vgG+Mg6WDassD8c+NsYTsmNgH3Z
         mQt2LCGLJRDiiZEx1wRogXvvduBP5fxQX1HXOJn8e9az4bSXJmrN2gGKgxmGSrWCgsvQ
         qhVE64azD/Qb4/fWn6Q2Y3V8kDlLMwnGgp6JWttA4Fava5mWWfTqamtbE0SYUMnLVSlb
         kREA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769942660; x=1770547460;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OnDBGTm1Ih+jnzybSzeIGvkZ/MyRumNvTLokxTWDPVg=;
        b=RX3jmbaJjGLFgaLlTv5vblW2ofUKhnLaeEJLzX7OSlUGY2IpECbk4Ii2Kr7LykmQ/a
         YqMA4h+esX3y7zP8NpN7eyCqd6HOShTtJ9uHuHoL+3HMR+NDjM1CIOgjk5yQhn/9jB1r
         k9iII+EnVmGWJnCqTILUfXX0z/ZzNH1D235QJPO1XCNweg1d5cKCgajX07R111aUdf4m
         I/rxd8EFmA4WHbaZ7z8bo6tBjQWOwyJqPCxXzcwIvB1nbhp5HLMkyBOxmFKLQknpy8V9
         1vNdEZzO99AYSPTjmN7QyaN78yIupoeFmtCitey+BcVqFNt/92/CO8Y5vdrUC3qG154n
         1PpA==
X-Forwarded-Encrypted: i=1; AJvYcCV9VqA5aEj1iozxiEu2aZjR/oVH8mYV/mqn1bTlUQeUcd1X6LioEMh6zxRI6SX7EZqNwRF+JJTzcO0J@vger.kernel.org
X-Gm-Message-State: AOJu0YxGwsOUKHN2jVZ59doiKStPQzqUr4qnsZwzLAOeZL4n93l9Lg6l
	eGxDHL76vCtBRnRloPuvjgfnX6RDN8UcZ3rkqwDmkTibIhAT3w7XwTXM
X-Gm-Gg: AZuq6aJzb72NXjkG7bvFKJOHVN3yQ+CY50OqF6RULy/ytKkY8fSS6t5YtoXf7vxwplY
	Bl8EueT0lmjFfIz7UgOXBTWFjGB6XfLeiXC1dZbO4BStCUsKaEIe9XWvmqz7XvGX6+7g67ytkCC
	fyFCGnckw7F7DlwxOw/H08xZc4dJl7OQ+qCHaHtg6zEH7Bf8vLbnB7WSdt2Bi9jsG7lS+JZVJ+U
	IvyEDamNOqKJUGFzyE0EnrMmjTFPWwl9JSdo2qS8O7h/rxMqlH+h+DxiHXOQlWnF0mUyERLGolE
	DwXW5XcpT8PsIsZT1U2sl8CI0Q1xwIBCjpRaHTb1J5oidRGTG+y+1/VguEkt1/x+nABBXIDtTYu
	aHu4UJzjXuVRaJTEpcnbqCH2cdvlKs7Fd7o1WxDMJ8rB9hAhgR6eascwoC2ORv8juedcF9+61ER
	83sn0RH2cNbMY=
X-Received: by 2002:a05:600c:4e89:b0:477:9fcf:3fe3 with SMTP id 5b1f17b1804b1-482db213a37mr104561035e9.0.1769942660006;
        Sun, 01 Feb 2026 02:44:20 -0800 (PST)
Received: from xeon ([188.163.112.49])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4806ce56490sm308947455e9.12.2026.02.01.02.44.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Feb 2026 02:44:19 -0800 (PST)
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
Subject: [PATCH v1 8/9] power: supply: Add driver for Asus Transformer battery
Date: Sun,  1 Feb 2026 12:43:42 +0200
Message-ID: <20260201104343.79231-9-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260201104343.79231-1-clamor95@gmail.com>
References: <20260201104343.79231-1-clamor95@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6811-lists,linux-leds=lfdr.de];
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
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qmqm.pl:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A1AD9C5883
X-Rspamd-Action: no action

From: Michał Mirosław <mirq-linux@rere.qmqm.pl>

Driver implements one battery cell per EC controller and supports reading
of battery status for Asus Transformer's pad and mobile dock.

Co-developed-by: Svyatoslav Ryhel <clamor95@gmail.com>
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Signed-off-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
---
 drivers/power/supply/Kconfig           |  11 +
 drivers/power/supply/Makefile          |   1 +
 drivers/power/supply/asus-ec-battery.c | 282 +++++++++++++++++++++++++
 3 files changed, 294 insertions(+)
 create mode 100644 drivers/power/supply/asus-ec-battery.c

diff --git a/drivers/power/supply/Kconfig b/drivers/power/supply/Kconfig
index 81fadb0695a9..bcf6a23858be 100644
--- a/drivers/power/supply/Kconfig
+++ b/drivers/power/supply/Kconfig
@@ -122,6 +122,17 @@ config BATTERY_CHAGALL
 	  This driver can also be built as a module. If so, the module will be
 	  called chagall-battery.
 
+config BATTERY_ASUSEC
+	tristate "Asus Transformer's battery driver"
+	depends on MFD_ASUSEC
+	help
+	  Say Y here to enable support APM status emulation using
+	  battery class devices.
+
+	  This sub-driver supports battery cells found in Asus Transformer
+	  tablets and mobile docks and controlled by special embedded
+	  controller.
+
 config BATTERY_CPCAP
 	tristate "Motorola CPCAP PMIC battery driver"
 	depends on MFD_CPCAP && IIO
diff --git a/drivers/power/supply/Makefile b/drivers/power/supply/Makefile
index 41c400bbf022..0a2cbfa96ed9 100644
--- a/drivers/power/supply/Makefile
+++ b/drivers/power/supply/Makefile
@@ -22,6 +22,7 @@ obj-$(CONFIG_TEST_POWER)	+= test_power.o
 obj-$(CONFIG_BATTERY_88PM860X)	+= 88pm860x_battery.o
 obj-$(CONFIG_CHARGER_ADP5061)	+= adp5061.o
 obj-$(CONFIG_BATTERY_ACT8945A)	+= act8945a_charger.o
+obj-$(CONFIG_BATTERY_ASUSEC)	+= asus-ec-battery.o
 obj-$(CONFIG_BATTERY_AXP20X)	+= axp20x_battery.o
 obj-$(CONFIG_CHARGER_AXP20X)	+= axp20x_ac_power.o
 obj-$(CONFIG_BATTERY_CHAGALL)	+= chagall-battery.o
diff --git a/drivers/power/supply/asus-ec-battery.c b/drivers/power/supply/asus-ec-battery.c
new file mode 100644
index 000000000000..7e6cb6017339
--- /dev/null
+++ b/drivers/power/supply/asus-ec-battery.c
@@ -0,0 +1,282 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * ASUS EC driver - battery monitoring
+ */
+
+#include <linux/array_size.h>
+#include <linux/devm-helpers.h>
+#include <linux/err.h>
+#include <linux/mfd/asus-ec.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/platform_device.h>
+#include <linux/power_supply.h>
+#include <linux/property.h>
+#include <linux/unaligned.h>
+
+#define ASUSEC_BATTERY_DATA_FRESH_MSEC		5000
+
+#define ASUSEC_BATTERY_DISCHARGING		0x40
+#define ASUSEC_BATTERY_FULL_CHARGED		0x20
+#define ASUSEC_BATTERY_NOT_CHARGING		0x10
+
+#define TEMP_CELSIUS_OFFSET			2731
+
+struct asus_ec_battery_data {
+	const struct asusec_info *ec;
+	struct power_supply *battery;
+	struct power_supply_desc psy_desc;
+	struct delayed_work poll_work;
+	struct mutex battery_lock; /* for data refresh */
+	unsigned long batt_data_ts;
+	int last_state;
+	u8 batt_data[DOCKRAM_ENTRY_BUFSIZE];
+};
+
+static int asus_ec_battery_refresh(struct asus_ec_battery_data *priv)
+{
+	int ret = 0;
+
+	guard(mutex)(&priv->battery_lock);
+
+	if (time_before(jiffies, priv->batt_data_ts))
+		return ret;
+
+	ret = asus_dockram_read(priv->ec->dockram, ASUSEC_DOCKRAM_BATT_CTL,
+				priv->batt_data);
+	if (ret < 0)
+		return ret;
+
+	priv->batt_data_ts = jiffies +
+		msecs_to_jiffies(ASUSEC_BATTERY_DATA_FRESH_MSEC);
+
+	return ret;
+}
+
+static enum power_supply_property asus_ec_battery_properties[] = {
+	POWER_SUPPLY_PROP_STATUS,
+	POWER_SUPPLY_PROP_VOLTAGE_MAX,
+	POWER_SUPPLY_PROP_CURRENT_MAX,
+	POWER_SUPPLY_PROP_TEMP,
+	POWER_SUPPLY_PROP_VOLTAGE_NOW,
+	POWER_SUPPLY_PROP_CURRENT_NOW,
+	POWER_SUPPLY_PROP_CAPACITY,
+	POWER_SUPPLY_PROP_CHARGE_NOW,
+	POWER_SUPPLY_PROP_TIME_TO_EMPTY_NOW,
+	POWER_SUPPLY_PROP_TIME_TO_FULL_NOW,
+	POWER_SUPPLY_PROP_PRESENT,
+};
+
+static const unsigned int asus_ec_battery_prop_offs[] = {
+	[POWER_SUPPLY_PROP_STATUS] = 1,
+	[POWER_SUPPLY_PROP_VOLTAGE_MAX] = 3,
+	[POWER_SUPPLY_PROP_CURRENT_MAX] = 5,
+	[POWER_SUPPLY_PROP_TEMP] = 7,
+	[POWER_SUPPLY_PROP_VOLTAGE_NOW] = 9,
+	[POWER_SUPPLY_PROP_CURRENT_NOW] = 11,
+	[POWER_SUPPLY_PROP_CAPACITY] = 13,
+	[POWER_SUPPLY_PROP_CHARGE_NOW] = 15,
+	[POWER_SUPPLY_PROP_TIME_TO_EMPTY_NOW] = 17,
+	[POWER_SUPPLY_PROP_TIME_TO_FULL_NOW] = 19,
+};
+
+static int asus_ec_battery_get_value(struct asus_ec_battery_data *priv,
+				     enum power_supply_property psp)
+{
+	int ret, offs;
+
+	if (psp >= ARRAY_SIZE(asus_ec_battery_prop_offs))
+		return -EINVAL;
+
+	offs = asus_ec_battery_prop_offs[psp];
+	if (!offs)
+		return -EINVAL;
+
+	ret = asus_ec_battery_refresh(priv);
+	if (ret < 0)
+		return ret;
+
+	if (offs >= priv->batt_data[0])
+		return -ENODATA;
+
+	return get_unaligned_le16(priv->batt_data + offs);
+}
+
+static int asus_ec_battery_get_property(struct power_supply *psy,
+					enum power_supply_property psp,
+					union power_supply_propval *val)
+{
+	struct asus_ec_battery_data *priv = power_supply_get_drvdata(psy);
+	int ret;
+
+	switch (psp) {
+	case POWER_SUPPLY_PROP_PRESENT:
+		val->intval = 1;
+		break;
+
+	default:
+		ret = asus_ec_battery_get_value(priv, psp);
+		if (ret < 0)
+			return ret;
+
+		val->intval = (s16)ret;
+
+		switch (psp) {
+		case POWER_SUPPLY_PROP_STATUS:
+			if (ret & ASUSEC_BATTERY_FULL_CHARGED)
+				val->intval = POWER_SUPPLY_STATUS_FULL;
+			else if (ret & ASUSEC_BATTERY_NOT_CHARGING)
+				val->intval = POWER_SUPPLY_STATUS_NOT_CHARGING;
+			else if (ret & ASUSEC_BATTERY_DISCHARGING)
+				val->intval = POWER_SUPPLY_STATUS_DISCHARGING;
+			else
+				val->intval = POWER_SUPPLY_STATUS_CHARGING;
+			break;
+
+		case POWER_SUPPLY_PROP_TEMP:
+			val->intval -= TEMP_CELSIUS_OFFSET;
+			break;
+
+		case POWER_SUPPLY_PROP_CHARGE_NOW:
+		case POWER_SUPPLY_PROP_CURRENT_NOW:
+		case POWER_SUPPLY_PROP_CURRENT_MAX:
+		case POWER_SUPPLY_PROP_VOLTAGE_NOW:
+		case POWER_SUPPLY_PROP_VOLTAGE_MAX:
+			val->intval *= 1000;
+			break;
+
+		case POWER_SUPPLY_PROP_TIME_TO_EMPTY_NOW:
+		case POWER_SUPPLY_PROP_TIME_TO_FULL_NOW:
+			val->intval *= 60;
+			break;
+
+		default:
+			break;
+		}
+
+		break;
+	}
+
+	return 0;
+}
+
+static void asus_ec_battery_poll_work(struct work_struct *work)
+{
+	struct asus_ec_battery_data *priv =
+		container_of(work, struct asus_ec_battery_data, poll_work.work);
+	int state;
+
+	state = asus_ec_battery_get_value(priv, POWER_SUPPLY_PROP_STATUS);
+	if (state < 0)
+		return;
+
+	if (state & ASUSEC_BATTERY_FULL_CHARGED)
+		state = POWER_SUPPLY_STATUS_FULL;
+	else if (state & ASUSEC_BATTERY_DISCHARGING)
+		state = POWER_SUPPLY_STATUS_DISCHARGING;
+	else
+		state = POWER_SUPPLY_STATUS_CHARGING;
+
+	if (priv->last_state != state) {
+		priv->last_state = state;
+		power_supply_changed(priv->battery);
+	}
+
+	/* continuously send uevent notification */
+	schedule_delayed_work(&priv->poll_work,
+			      msecs_to_jiffies(ASUSEC_BATTERY_DATA_FRESH_MSEC));
+}
+
+static const struct power_supply_desc asus_ec_battery_desc = {
+	.name = "asus-ec-battery",
+	.type = POWER_SUPPLY_TYPE_BATTERY,
+	.properties = asus_ec_battery_properties,
+	.num_properties = ARRAY_SIZE(asus_ec_battery_properties),
+	.get_property = asus_ec_battery_get_property,
+	.external_power_changed = power_supply_changed,
+};
+
+static int asus_ec_battery_probe(struct platform_device *pdev)
+{
+	struct asus_ec_battery_data *priv;
+	struct power_supply_config cfg = { };
+	int ret;
+
+	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	platform_set_drvdata(pdev, priv);
+
+	mutex_init(&priv->battery_lock);
+
+	priv->ec = cell_to_ec(pdev);
+	priv->batt_data_ts = jiffies - 1;
+	priv->last_state = POWER_SUPPLY_STATUS_UNKNOWN;
+
+	cfg.fwnode = dev_fwnode(&pdev->dev);
+	cfg.drv_data = priv;
+
+	memcpy(&priv->psy_desc, &asus_ec_battery_desc, sizeof(priv->psy_desc));
+	priv->psy_desc.name = devm_kasprintf(&pdev->dev, GFP_KERNEL, "%s-battery",
+					     priv->ec->name);
+
+	priv->battery = devm_power_supply_register(&pdev->dev, &priv->psy_desc, &cfg);
+	if (IS_ERR(priv->battery))
+		return dev_err_probe(&pdev->dev, PTR_ERR(priv->battery),
+				     "Failed to register power supply\n");
+
+	ret = devm_delayed_work_autocancel(&pdev->dev, &priv->poll_work,
+					   asus_ec_battery_poll_work);
+	if (ret)
+		return ret;
+
+	schedule_delayed_work(&priv->poll_work,
+			      msecs_to_jiffies(ASUSEC_BATTERY_DATA_FRESH_MSEC));
+
+	return 0;
+}
+
+static int __maybe_unused asus_ec_battery_suspend(struct device *dev)
+{
+	struct asus_ec_battery_data *priv = dev_get_drvdata(dev);
+
+	cancel_delayed_work_sync(&priv->poll_work);
+
+	return 0;
+}
+
+static int __maybe_unused asus_ec_battery_resume(struct device *dev)
+{
+	struct asus_ec_battery_data *priv = dev_get_drvdata(dev);
+
+	schedule_delayed_work(&priv->poll_work,
+			      msecs_to_jiffies(ASUSEC_BATTERY_DATA_FRESH_MSEC));
+
+	return 0;
+}
+
+static SIMPLE_DEV_PM_OPS(asus_ec_battery_pm_ops,
+			 asus_ec_battery_suspend, asus_ec_battery_resume);
+
+static const struct of_device_id asus_ec_battery_match[] = {
+	{ .compatible = "asus,ec-battery" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, asus_ec_battery_match);
+
+static struct platform_driver asus_ec_battery_driver = {
+	.driver = {
+		.name = "asus-ec-battery",
+		.of_match_table = asus_ec_battery_match,
+		.pm = &asus_ec_battery_pm_ops,
+	},
+	.probe = asus_ec_battery_probe,
+};
+module_platform_driver(asus_ec_battery_driver);
+
+MODULE_AUTHOR("Michał Mirosław <mirq-linux@rere.qmqm.pl>");
+MODULE_AUTHOR("Svyatoslav Ryhel <clamor95@gmail.com>");
+MODULE_DESCRIPTION("ASUS Transformer's battery driver");
+MODULE_LICENSE("GPL");
-- 
2.51.0


