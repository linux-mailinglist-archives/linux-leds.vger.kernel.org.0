Return-Path: <linux-leds+bounces-8728-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id uKYtDdXjPGpxtwgAu9opvQ
	(envelope-from <linux-leds+bounces-8728-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 25 Jun 2026 10:16:21 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 636796C39DC
	for <lists+linux-leds@lfdr.de>; Thu, 25 Jun 2026 10:16:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=pTDcKTLP;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8728-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-8728-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6D4B23015D5F
	for <lists+linux-leds@lfdr.de>; Thu, 25 Jun 2026 08:16:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBA59375ADC;
	Thu, 25 Jun 2026 08:16:15 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE05730E831
	for <linux-leds@vger.kernel.org>; Thu, 25 Jun 2026 08:16:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782375375; cv=none; b=a13wAZgJ5I2lMGvb79M9idg1VmNjwIDB1ZG5IVOHDekmT2F894Q8RXwsiLcJRiouii1BkkMrdBTu/eLLrT7ndOlyTd7CcGdEzVjDOBwHY83vMveV/AwMyJXI82aRkRVVqOJoGAXGW+q931LUPW0ofHTn2LrxwyV6MWW6meHdNwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782375375; c=relaxed/simple;
	bh=Nbs9t+FaKCzd9P0/l8cmYwwSWH8WM3J9kyLsEP7GK10=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qPCOmptaSDPyqIXWPg2n1WXueHNYsKcTjZ8a0RQ1auYP1icCaWMCqypxrKkp/bupJG6efIPD+lJlVbKPSuMveywXqQvu1Ewjb4eASSrifIV7knoKcoBYrehfRSLpB8kj/OIKv3BNrrFOB4VqAD+qrwI0sjV1sakY3xhftDwEM5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pTDcKTLP; arc=none smtp.client-ip=209.85.167.51
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5aa68d7d757so2562568e87.0
        for <linux-leds@vger.kernel.org>; Thu, 25 Jun 2026 01:16:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782375371; x=1782980171; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3v77cuV1OU2NxXYiQdpfa0fE5ggihvMJJO5OgBnPK90=;
        b=pTDcKTLPfxoi7BgMZ1pAU/KGeNI2BG0lamD3GI388ZbBZZJ32YiyPF7eo8Wj+bARVE
         xSXJ5Yn8xoBPbARXVi1I7iXynZpZC7YzkwcrDq5TYn6nCRyDQlAX/3vC0XQXAMZ/LnnM
         3aY2CQ9hHrkFNtQb7SqDQIusHnnzKzxjJNewvtf+9PgBHqXJrvR1k2eRV6WOpVmUTyOl
         nUIh6SSNxJROf9YI23LxdG0Afr6Y54DeBWtAUG68kUGhLzK2ShifNUObqzKYn313hPXQ
         j+LEqGs5awk6nN0O9fNTDn9vJKqtjbvgo6dEO5tsLWy9I6EiSLJlHoAsdfo7HbSgbN65
         zcYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782375371; x=1782980171;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3v77cuV1OU2NxXYiQdpfa0fE5ggihvMJJO5OgBnPK90=;
        b=o1ha9vs44HGJUtddsAIw5yBmPuK8GzAKRNi69zsk7OCxxBWZY8B22PAVTwDCHJEpqF
         x3mSxWU4mxx4KcfavHaz8MAnnqJ7SQTfKWUCx438fmFnvwVb3pv8b4HVa8TyRuKzYv+t
         7XoXxxuWhrhLtjo13SJi6ixWdhaJ+ArzuJy/D2/jRhZ4GtIz1v71EvelgalzjK77N9Vt
         eYQq/zCoT50qvwAXDfv2OxFLKwG4AEbQsDUMzdiNE7wQTPOtCaOe55isLMjljDe2zrzm
         dLo9/zMBmmoyz0ieEqyermhqIv3GbQ6X5cG9IptIvoP14jNIwiN5wTmu8vLrN6lObyam
         GqhQ==
X-Forwarded-Encrypted: i=1; AHgh+RoizJFuLI+eQcdtSyaPQU31ahSJqVujtTFGOY2RU1rUr5tqdN/FdPZ0IWdmGBZ+pcva/ffI6eTq9QGt@vger.kernel.org
X-Gm-Message-State: AOJu0YxCkrALkbjBqHBY6lynvbAgLZp818WmZ9XKa9BD932gNSF7mora
	BJc9bcecgwoQlRIQDZOuclSS3WT9mhiUhU4oG7MyYKGJSdIJ4R+bd9Ld
X-Gm-Gg: AfdE7cl9LbulyVquYjPhCTscZhmVQFJgNrJsp16CwKtKozTspXkel6nvwHli5AY+K6C
	ZCv7qWDb+y1/Yhex1r4TvvOW4AXH8140tdbmmaDziWDtWYW59JFNfVApd9wY47UbQO/p+JhmzQD
	l5nWGe/aoKi9WXexofCbcN0UIePe2WaUleXHMlQOWBjQBV4LxPi+efXldqVucyTDQR5JuR9B1pv
	dXMr9rkXsR2bfIQPe9uIBSvnmfTotuEz/Zm6h0LRB/tznbNB2MWwIYTdLQCtplAMXGzFQvnoNft
	H+rI5xEVuShJy4PNXi5YkZTNX5QARYrlFuceldiv+4CgVSsa2nQXHe9lDpSAFwzvuSjoX50EMXH
	EZUN7Bw7MvAcQjpXZJ8JdEblNu5AiEb0XDXI05bp5w3HreLC68rm9X4lQPtDRfaUVWBVFOrhxJK
	XDBRwo5LrA/rEjp18vzd4OYgpD6K58n1ZzAA==
X-Received: by 2002:a05:6512:6713:b0:5ae:a18e:b06b with SMTP id 2adb3069b0e04-5aea1f4cc9fmr452465e87.26.1782375371071;
        Thu, 25 Jun 2026 01:16:11 -0700 (PDT)
Received: from xeon ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3999afce64dsm39162221fa.14.2026.06.25.01.16.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 01:16:09 -0700 (PDT)
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
Subject: [PATCH v9 6/7] power: supply: Add driver for ASUS Transformer battery
Date: Thu, 25 Jun 2026 11:15:28 +0300
Message-ID: <20260625081529.22447-7-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260625081529.22447-1-clamor95@gmail.com>
References: <20260625081529.22447-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8728-lists,linux-leds=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:dmitry.torokhov@gmail.com,m:lee@kernel.org,m:pavel@kernel.org,m:sre@kernel.org,m:clamor95@gmail.com,m:ion@agorria.com,m:mirq-linux@rere.qmqm.pl,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-input@vger.kernel.org,m:linux-leds@vger.kernel.org,m:linux-pm@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:dmitrytorokhov@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[clamor95@gmail.com,linux-leds@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,agorria.com,rere.qmqm.pl];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-leds@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qmqm.pl:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,collabora.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 636796C39DC

From: Michał Mirosław <mirq-linux@rere.qmqm.pl>

Driver implements one battery cell per EC controller and supports reading
of battery status for ASUS Transformer's pad and mobile dock.

Co-developed-by: Svyatoslav Ryhel <clamor95@gmail.com>
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Signed-off-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/power/supply/Kconfig                  |  11 +
 drivers/power/supply/Makefile                 |   1 +
 .../supply/asus-transformer-ec-battery.c      | 289 ++++++++++++++++++
 3 files changed, 301 insertions(+)
 create mode 100644 drivers/power/supply/asus-transformer-ec-battery.c

diff --git a/drivers/power/supply/Kconfig b/drivers/power/supply/Kconfig
index 83392ed6a8da..1dc3d0b2e021 100644
--- a/drivers/power/supply/Kconfig
+++ b/drivers/power/supply/Kconfig
@@ -122,6 +122,17 @@ config BATTERY_CHAGALL
 	  This driver can also be built as a module. If so, the module will be
 	  called chagall-battery.
 
+config BATTERY_ASUS_TRANSFORMER_EC
+	tristate "Asus Transformer's battery driver"
+	depends on MFD_ASUS_TRANSFORMER_EC
+	help
+	  Say Y to enable support for battery status access on Tegra based
+	  ASUS Transformer devices.
+
+	  This sub-driver supports battery cells found in Asus Transformer
+	  tablets and mobile docks and controlled by a special embedded
+	  controller.
+
 config BATTERY_CPCAP
 	tristate "Motorola CPCAP PMIC battery driver"
 	depends on MFD_CPCAP && IIO
diff --git a/drivers/power/supply/Makefile b/drivers/power/supply/Makefile
index 7ee839dca7f3..1313f367715c 100644
--- a/drivers/power/supply/Makefile
+++ b/drivers/power/supply/Makefile
@@ -22,6 +22,7 @@ obj-$(CONFIG_TEST_POWER)	+= test_power.o
 obj-$(CONFIG_BATTERY_88PM860X)	+= 88pm860x_battery.o
 obj-$(CONFIG_CHARGER_ADP5061)	+= adp5061.o
 obj-$(CONFIG_BATTERY_ACT8945A)	+= act8945a_charger.o
+obj-$(CONFIG_BATTERY_ASUS_TRANSFORMER_EC)	+= asus-transformer-ec-battery.o
 obj-$(CONFIG_BATTERY_AXP20X)	+= axp20x_battery.o
 obj-$(CONFIG_CHARGER_AXP20X)	+= axp20x_ac_power.o
 obj-$(CONFIG_BATTERY_CHAGALL)	+= chagall-battery.o
diff --git a/drivers/power/supply/asus-transformer-ec-battery.c b/drivers/power/supply/asus-transformer-ec-battery.c
new file mode 100644
index 000000000000..4c0c6d4b09e2
--- /dev/null
+++ b/drivers/power/supply/asus-transformer-ec-battery.c
@@ -0,0 +1,289 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+
+#include <linux/array_size.h>
+#include <linux/devm-helpers.h>
+#include <linux/err.h>
+#include <linux/i2c.h>
+#include <linux/mfd/asus-transformer-ec.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/platform_device.h>
+#include <linux/power_supply.h>
+#include <linux/property.h>
+#include <linux/unaligned.h>
+
+#define ASUSEC_BATTERY_DATA_FRESH_MSEC		5000
+
+#define ASUSEC_BATTERY_DISCHARGING		BIT(6)
+#define ASUSEC_BATTERY_FULL_CHARGED		BIT(5)
+#define ASUSEC_BATTERY_NOT_CHARGING		BIT(4)
+
+#define TEMP_CELSIUS_OFFSET			2731
+
+struct asus_ec_battery_data {
+	struct asusec_core *ec;
+	struct power_supply *battery;
+	struct power_supply_desc psy_desc;
+	struct delayed_work poll_work;
+	struct mutex battery_lock; /* for data refresh */
+	unsigned long batt_data_ts;
+	int last_state;
+	u8 batt_data[ASUSEC_ENTRY_BUFSIZE];
+};
+
+static int asus_ec_battery_refresh(struct asus_ec_battery_data *priv)
+{
+	struct i2c_client *client = priv->ec->dockram;
+	struct device *dev = &client->dev;
+	int ret = 0;
+
+	if (time_before(jiffies, priv->batt_data_ts))
+		return ret;
+
+	memset(priv->batt_data, 0, ASUSEC_ENTRY_BUFSIZE);
+	ret = i2c_smbus_read_i2c_block_data(client, ASUSEC_DOCKRAM_BATT_CTL,
+					    ASUSEC_ENTRY_SIZE, priv->batt_data);
+	if (ret < ASUSEC_ENTRY_SIZE)
+		return ret < 0 ? ret : -EIO;
+
+	if (priv->batt_data[0] > ASUSEC_ENTRY_SIZE) {
+		dev_err(dev, "bad data len; buffer: %*ph; ret: %d\n",
+			ASUSEC_ENTRY_BUFSIZE, priv->batt_data, ret);
+		return -EPROTO;
+	}
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
+	guard(mutex)(&priv->battery_lock);
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
+		goto reschedule;
+
+	if (state & ASUSEC_BATTERY_FULL_CHARGED)
+		state = POWER_SUPPLY_STATUS_FULL;
+	else if (state & ASUSEC_BATTERY_NOT_CHARGING)
+		state = POWER_SUPPLY_STATUS_NOT_CHARGING;
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
+reschedule:
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
+	struct asusec_core *ec = dev_get_drvdata(pdev->dev.parent);
+	struct asus_ec_battery_data *priv;
+	struct device *dev = &pdev->dev;
+	struct power_supply_config cfg = { };
+	int ret;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	platform_set_drvdata(pdev, priv);
+
+	mutex_init(&priv->battery_lock);
+
+	priv->ec = ec;
+	priv->batt_data_ts = jiffies - 1;
+	priv->last_state = POWER_SUPPLY_STATUS_UNKNOWN;
+
+	cfg.fwnode = dev_fwnode(dev->parent);
+	cfg.drv_data = priv;
+
+	memcpy(&priv->psy_desc, &asus_ec_battery_desc, sizeof(priv->psy_desc));
+	priv->psy_desc.name = devm_kasprintf(dev, GFP_KERNEL, "%s-battery",
+					     priv->ec->name);
+	if (!priv->psy_desc.name)
+		return -ENOMEM;
+
+	priv->battery = devm_power_supply_register(dev, &priv->psy_desc, &cfg);
+	if (IS_ERR(priv->battery))
+		return dev_err_probe(dev, PTR_ERR(priv->battery),
+				     "Failed to register power supply\n");
+
+	ret = devm_delayed_work_autocancel(dev, &priv->poll_work,
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
+static struct platform_driver asus_ec_battery_driver = {
+	.driver = {
+		.name = "asus-transformer-ec-battery",
+		.pm = &asus_ec_battery_pm_ops,
+	},
+	.probe = asus_ec_battery_probe,
+};
+module_platform_driver(asus_ec_battery_driver);
+
+MODULE_ALIAS("platform:asus-transformer-ec-battery");
+MODULE_AUTHOR("Michał Mirosław <mirq-linux@rere.qmqm.pl>");
+MODULE_AUTHOR("Svyatoslav Ryhel <clamor95@gmail.com>");
+MODULE_DESCRIPTION("ASUS Transformer's battery driver");
+MODULE_LICENSE("GPL");
-- 
2.53.0


