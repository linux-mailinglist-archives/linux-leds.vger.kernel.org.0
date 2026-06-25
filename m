Return-Path: <linux-leds+bounces-8724-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id BCFhBALkPGqAtwgAu9opvQ
	(envelope-from <linux-leds+bounces-8724-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 25 Jun 2026 10:17:06 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A10986C3A07
	for <lists+linux-leds@lfdr.de>; Thu, 25 Jun 2026 10:17:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=ZTd93U4y;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8724-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-8724-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 26C43306FC1F
	for <lists+linux-leds@lfdr.de>; Thu, 25 Jun 2026 08:16:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFFCF3446C6;
	Thu, 25 Jun 2026 08:16:04 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B6A2374E46
	for <linux-leds@vger.kernel.org>; Thu, 25 Jun 2026 08:16:02 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782375364; cv=none; b=Cinzlmwu505KCbHUzVbO1h6T1xNfjwXd0r4oeLxPhjU5b+7eIB1Gd1sKwMiGQX+qG4CPeoPeGPC8x6+4BzUmVXtJdCGlL4oeNf59q8X8Q2gV3cTdKC32HRPwarZDbE1gR7SGBgQGE2x4Fk7MsNUgVh0jCRO8pkK/V0VcsO1a8ww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782375364; c=relaxed/simple;
	bh=o3tnK/Ps/0fAfdbfa3eFlhTTKBfBkLXr16Aq4ojxr5Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OunayEqJXzwIxW+fWBQB1bqA7RNwNdkhQlDUiLebY89anvz7DIkysu7PJa2DtPKJ5QsYYUMYwtR4HPbqW6AIS7MOr/WMhnPV+5On4YTs8y+JI2/UEa06C7LYnauW9x+7KzJaqKmPF0qWcSkiVf/LJ97B6HHRvBJGo+R/Ps2TLi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZTd93U4y; arc=none smtp.client-ip=209.85.167.46
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5ad4ee80f65so1834363e87.0
        for <linux-leds@vger.kernel.org>; Thu, 25 Jun 2026 01:16:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782375361; x=1782980161; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HneaqNt9HVOlbTlszJLkVExFl0j4GxnRhh/CUnr7+Tc=;
        b=ZTd93U4yKO8wH1BGDYl9ZkSFOMUUwFJ+C+PgovF/6Avd4K2kDRCfQzZZToErizNoy9
         XbbrAyGqFAW3lRwYzjtxLqmQG4hFumwfHtd41TkZ3vR4OFzgCKKvXTaNQS2jQsLu+x97
         ddmRbiETBk3bMxlB3/j9NALUNVnB/9oXGx4GGsrHkGpzSucivU4w2+htfZfB9TpMpT2A
         HqgiuVOtcLK44JY6BIXvpSr+M2IvzWutO/uxG5zn1iGHLwgiohrKkv+pyndrXrLTq8as
         KjmOOY9Ms1ng2t75n522TMdAxB3i8jLnAczi7/isZc8ickmuaOruD68KBgOGKtsJuTBb
         n6Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782375361; x=1782980161;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HneaqNt9HVOlbTlszJLkVExFl0j4GxnRhh/CUnr7+Tc=;
        b=l4IfJrhysvT0tpvfBKuCeSG8GBLOByZ0nAc0MzTQHlMvInxAk2zfL1aR6R60vFpNjF
         wZZxSbxW7FLLDno/kQoRwT7ydx1I3e3sNwutva2kd5kbDI0oedFl+aqr771ZinchHWfY
         ye0aSiTmMgpMdTTu+YYNu+fFq9hMyM9zN2mT3kcYeTkUpSWM4P/gk16l7eMmaEW2jNUS
         zRUcOgWaOvner0aXl4wQo8OI4/ei6m0eGVc3BNqm5xp3LC2SEl4ydkpngYUBFJanIzfV
         yMZq0vonifHF3OI2ta+B0hUheX6VHcLecHW1smbm9A1SjThFvR1N6W/i5KRynpjC1yBz
         75Fw==
X-Forwarded-Encrypted: i=1; AHgh+RoRNFyDlBtS7l6MLpuB8aq9st06RV4O2IYmxO5DUezr51urohIVEa8FB51ymPFW6ta4LurSuCsHkbVK@vger.kernel.org
X-Gm-Message-State: AOJu0Yxm7VkSq94p3X4c3HQyS9lGKzFnEQTfMoEKK3bTumd4fiVJjDYI
	oFuwJDIbQRANuQtTE5VZaJDa6jVnCPG4Ga5w+jMfodhm1cJSYkxMb5fb
X-Gm-Gg: AfdE7cmauf8B5Vqq/zeEJcvzfUzqGcxAA8vnUM++9qx39gQeZzw275kzqU1S/mOdK4X
	K5q+vRNDrzWxfm85zqeN/Kcv50Qm8SogBF4mx7N+QLXwefHbw992aBHBbFH1X79eLqg+vykoABS
	eag8LOla4o7jHLKl5RKZadio0PfJa52mXFImEM8ZaV6YFcWzzkwKu2av9T3Rj9agaG04HK1qheX
	6OaQa55BM/dIn+D+m8uVCsLm4ZeWHvnk+5CCf9gVz9Hs/kObfIiuOL631PuvQcmzsAGTOeUO1bz
	e/ILIu/uDeUXTwVZDNpRu2Nghiof3ixSJDOwotUe9VFu61mtMefgyi1TXcOeXeimXS/uv4nLEB0
	xRN/TxQup0u58uceQ9kuDmSOEduM8ccsHyoFTg9VbEAOL97sK8ptk4AB5SaU0/87A7eda45WC17
	V5zN8XnZiSdU1p9BW+U+0Ht0MHM7nOeo7ZEseLlVr45htk
X-Received: by 2002:a05:6512:1352:b0:5aa:8824:156f with SMTP id 2adb3069b0e04-5aea1f57454mr442936e87.47.1782375360325;
        Thu, 25 Jun 2026 01:16:00 -0700 (PDT)
Received: from xeon ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3999afce64dsm39162221fa.14.2026.06.25.01.15.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 01:15:59 -0700 (PDT)
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
Subject: [PATCH v9 2/7] mfd: Add driver for ASUS Transformer embedded controller
Date: Thu, 25 Jun 2026 11:15:24 +0300
Message-ID: <20260625081529.22447-3-clamor95@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8724-lists,linux-leds=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qmqm.pl:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A10986C3A07

From: Michał Mirosław <mirq-linux@rere.qmqm.pl>

Support Nuvoton NPCE795-based ECs as used in Asus Transformer TF201,
TF300T, TF300TG, TF300TL and TF700T pad and dock, as well as TF101 dock
and TF600T, P1801-T and TF701T pad. This is a glue driver handling
detection and common operations for EC's functions.

Co-developed-by: Svyatoslav Ryhel <clamor95@gmail.com>
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Signed-off-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
---
 drivers/mfd/Kconfig                     |  16 +
 drivers/mfd/Makefile                    |   1 +
 drivers/mfd/asus-transformer-ec.c       | 549 ++++++++++++++++++++++++
 include/linux/mfd/asus-transformer-ec.h |  92 ++++
 4 files changed, 658 insertions(+)
 create mode 100644 drivers/mfd/asus-transformer-ec.c
 create mode 100644 include/linux/mfd/asus-transformer-ec.h

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index 7192c9d1d268..e1c32505b97a 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -137,6 +137,22 @@ config MFD_AAT2870_CORE
 	  additional drivers must be enabled in order to use the
 	  functionality of the device.
 
+config MFD_ASUS_TRANSFORMER_EC
+	tristate "ASUS Transformer's embedded controller"
+	select MFD_CORE
+	depends on I2C && OF
+	help
+	  Select this to enable support for the Embedded Controller (EC)
+	  found in Tegra based ASUS Transformer series tablets and mobile
+	  docks.
+
+	  This driver handles the core I2C communication with the EC and
+	  provides support for its sub-devices, including battery management,
+	  charger detection, LEDs and keyboard dock functions support.
+
+	  This driver can also be built as a module. If so, the module
+	  will be called asus-transformer-ec.
+
 config MFD_AT91_USART
 	tristate "AT91 USART Driver"
 	select MFD_CORE
diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
index e75e8045c28a..fd80088d8a9a 100644
--- a/drivers/mfd/Makefile
+++ b/drivers/mfd/Makefile
@@ -10,6 +10,7 @@ obj-$(CONFIG_MFD_88PM805)	+= 88pm805.o 88pm80x.o
 obj-$(CONFIG_MFD_88PM886_PMIC)	+= 88pm886.o
 obj-$(CONFIG_MFD_ACT8945A)	+= act8945a.o
 obj-$(CONFIG_MFD_SM501)		+= sm501.o
+obj-$(CONFIG_MFD_ASUS_TRANSFORMER_EC)	+= asus-transformer-ec.o
 obj-$(CONFIG_ARCH_BCM2835)	+= bcm2835-pm.o
 obj-$(CONFIG_MFD_BCM590XX)	+= bcm590xx.o
 obj-$(CONFIG_MFD_BD9571MWV)	+= bd9571mwv.o
diff --git a/drivers/mfd/asus-transformer-ec.c b/drivers/mfd/asus-transformer-ec.c
new file mode 100644
index 000000000000..739c66fdaf22
--- /dev/null
+++ b/drivers/mfd/asus-transformer-ec.c
@@ -0,0 +1,549 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+
+#include <linux/array_size.h>
+#include <linux/debugfs.h>
+#include <linux/delay.h>
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/gpio/consumer.h>
+#include <linux/i2c.h>
+#include <linux/interrupt.h>
+#include <linux/mfd/asus-transformer-ec.h>
+#include <linux/mfd/core.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/property.h>
+#include <linux/slab.h>
+#include <linux/string.h>
+#include <linux/types.h>
+#include <linux/unaligned.h>
+
+#define ASUSEC_ACCESS_TIMEOUT		300
+#define ASUSEC_DOCKRAM_OFFSET		2
+#define ASUSEC_ECREQ_DELAY		50
+#define ASUSEC_ECREQ_TIMEOUT		200
+#define ASUSEC_RESET			0
+#define ASUSEC_RETRY_MAX		3
+#define ASUSEC_RSP_BUFFER_SIZE		(ASUSEC_ENTRIES / ASUSEC_ENTRY_SIZE)
+
+enum asusec_variant {
+	ASUSEC_SL101_DOCK = 1,
+	ASUSEC_TF101_DOCK,
+	ASUSEC_TF201_PAD,
+	ASUSEC_TF600T_PAD,
+	ASUSEC_MAX
+};
+
+enum asusec_mode {
+	ASUSEC_MODE_NONE,
+	ASUSEC_MODE_NORMAL,
+	ASUSEC_MODE_FACTORY,
+	ASUSEC_MODE_MAX
+};
+
+/**
+ * struct asus_ec_chip_info
+ *
+ * @name: prefix associated with the EC
+ * @variant: id of programming model of EC
+ * @mode: state of Factory Mode bit in EC control register
+ */
+struct asus_ec_chip_info {
+	const char *name;
+	enum asusec_variant variant;
+	enum asusec_mode fmode;
+};
+
+/**
+ * struct asus_ec_data
+ *
+ * @ec: public part shared with all cells (must be first)
+ * @ecreq_lock: prevents simultaneous access to EC
+ * @ecreq_gpio: EC request GPIO
+ * @client: pointer to EC's i2c_client
+ * @info: pointer to EC's version description
+ * @ec_buf: buffer for EC read
+ * @logging_disabled: flag disabling logging on reset events
+ */
+struct asus_ec_data {
+	struct asusec_core ec;
+	struct mutex ecreq_lock;
+	struct gpio_desc *ecreq_gpio;
+	struct i2c_client *client;
+	const struct asus_ec_chip_info *info;
+	u8 ec_buf[ASUSEC_ENTRY_BUFSIZE];
+};
+
+/**
+ * struct dockram_ec_data
+ *
+ * @ctl_lock: prevent simultaneous access to Dockram
+ * @ctl_buf: buffer for Dockram read
+ */
+struct dockram_ec_data {
+	struct mutex ctl_lock;
+	u8 ctl_buf[ASUSEC_ENTRY_BUFSIZE];
+};
+
+/**
+ * asus_dockram_access_ctl - Read from or write to the DockRAM control register.
+ * @client: Handle to the DockRAM device.
+ * @out: Pointer to a variable where the register value will be stored.
+ * @mask: Bitmask of bits to be cleared.
+ * @xor: Bitmask of bits to be set (via XOR).
+ *
+ * This performs a control register read if @out is provided and both @mask
+ * and @xor are zero. Otherwise, it performs a control register update if
+ * @mask and @xor are provided.
+ *
+ * Returns a negative errno code else zero on success.
+ */
+int asus_dockram_access_ctl(struct i2c_client *client, u64 *out, u64 mask,
+			    u64 xor)
+{
+	struct dockram_ec_data *ddata = i2c_get_clientdata(client);
+	u8 *buf = ddata->ctl_buf;
+	u64 val;
+	int ret = 0;
+
+	guard(mutex)(&ddata->ctl_lock);
+
+	memset(buf, 0, ASUSEC_ENTRY_BUFSIZE);
+	ret = i2c_smbus_read_i2c_block_data(client, ASUSEC_DOCKRAM_CONTROL,
+					    ASUSEC_ENTRY_SIZE, buf);
+	if (ret < ASUSEC_ENTRY_SIZE) {
+		dev_err(&client->dev, "failed to access control buffer: %d\n",
+			ret);
+		return ret < 0 ? ret : -EIO;
+	}
+
+	if (buf[0] != ASUSEC_CTL_SIZE) {
+		dev_err(&client->dev, "buffer size exceeds %d: %d\n",
+			ASUSEC_CTL_SIZE, buf[0]);
+		return -EPROTO;
+	}
+
+	val = get_unaligned_le64(buf + 1);
+
+	if (out)
+		*out = val;
+
+	if (mask || xor) {
+		put_unaligned_le64((val & ~mask) ^ xor, buf + 1);
+		ret = i2c_smbus_write_i2c_block_data(client,
+						     ASUSEC_DOCKRAM_CONTROL,
+						     ASUSEC_ENTRY_SIZE, buf);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(asus_dockram_access_ctl);
+
+static int asus_ec_signal_request(struct asus_ec_data *ddata)
+{
+	guard(mutex)(&ddata->ecreq_lock);
+
+	gpiod_set_value_cansleep(ddata->ecreq_gpio, 1);
+	msleep(ASUSEC_ECREQ_DELAY);
+
+	gpiod_set_value_cansleep(ddata->ecreq_gpio, 0);
+	msleep(ASUSEC_ECREQ_TIMEOUT);
+
+	return 0;
+}
+
+static int asus_ec_log_info(struct asus_ec_data *ddata, unsigned int reg,
+			    const char *name)
+{
+	struct device *dev = &ddata->client->dev;
+	u8 buf[ASUSEC_ENTRY_BUFSIZE];
+	int ret;
+
+	memset(buf, 0, ASUSEC_ENTRY_BUFSIZE);
+	ret = i2c_smbus_read_i2c_block_data(ddata->ec.dockram, reg,
+					    ASUSEC_ENTRY_SIZE, buf);
+	if (ret < ASUSEC_ENTRY_SIZE)
+		return ret < 0 ? ret : -EIO;
+
+	if (buf[0] > ASUSEC_ENTRY_SIZE) {
+		dev_err(dev, "bad data len; buffer: %*ph; ret: %d\n",
+			ASUSEC_ENTRY_BUFSIZE, buf, ret);
+		return -EPROTO;
+	}
+
+	dev_info(dev, "%-14s: %.*s\n", name, buf[0], buf + 1);
+
+	if (!ddata->ec.model) {
+		ddata->ec.model = devm_kasprintf(dev, GFP_KERNEL, "%.*s",
+						 buf[0], buf + 1);
+		if (!ddata->ec.model)
+			return -ENOMEM;
+	}
+
+	return 0;
+}
+
+static int asus_ec_detect(struct asus_ec_data *ddata)
+{
+	int ret;
+
+	ret = asus_ec_log_info(ddata, ASUSEC_DOCKRAM_INFO_MODEL, "Model");
+	if (ret)
+		return ret;
+
+	ret = asus_ec_log_info(ddata, ASUSEC_DOCKRAM_INFO_FW, "FW version");
+	if (ret)
+		return ret;
+
+	ret = asus_ec_log_info(ddata, ASUSEC_DOCKRAM_INFO_CFGFMT, "Config format");
+	if (ret)
+		return ret;
+
+	ret = asus_ec_log_info(ddata, ASUSEC_DOCKRAM_INFO_HW, "HW version");
+	if (ret)
+		return ret;
+
+	ddata->ec.name = ddata->info->name;
+
+	return 0;
+}
+
+static int asus_ec_reset(struct asus_ec_data *ddata)
+{
+	int retry, ret;
+
+	guard(mutex)(&ddata->ecreq_lock);
+
+	for (retry = 0; retry < ASUSEC_RETRY_MAX; retry++) {
+		ret = i2c_smbus_write_word_data(ddata->client, ASUSEC_WRITE_BUF,
+						ASUSEC_RESET);
+		if (!ret)
+			return 0;
+
+		msleep(ASUSEC_ACCESS_TIMEOUT);
+	}
+
+	return ret;
+}
+
+static void asus_ec_clear_buffer(struct asus_ec_data *ddata)
+{
+	int ret, retry = ASUSEC_RSP_BUFFER_SIZE;
+
+	/*
+	 * Read the buffer till we get valid data by checking ASUSEC_OBF_MASK
+	 * of the status byte or till we reach end of the 256 byte buffer.
+	 */
+	while (retry--) {
+		ret = i2c_smbus_read_i2c_block_data(ddata->client, ASUSEC_READ_BUF,
+						    ASUSEC_ENTRY_SIZE,
+						    ddata->ec_buf);
+		if (ret < ASUSEC_ENTRY_SIZE)
+			continue;
+
+		if (ddata->ec_buf[ASUSEC_IRQ_STATUS] & ASUSEC_OBF_MASK)
+			continue;
+
+		break;
+	}
+}
+
+static int asus_ec_susb_on_status(struct asus_ec_data *ddata)
+{
+	u64 flag;
+	int ret;
+
+	ret = asus_dockram_access_ctl(ddata->ec.dockram, &flag, 0, 0);
+	if (ret)
+		return ret;
+
+	flag &= ASUSEC_CTL_SUSB_MODE;
+	dev_info(&ddata->client->dev, "EC FW behaviour: %s\n",
+		 flag ? "susb on when receive ec_req" :
+		 "susb on when system wakeup");
+
+	return 0;
+}
+
+static int asus_ec_set_factory_mode(struct asus_ec_data *ddata,
+				    enum asusec_mode fmode)
+{
+	dev_info(&ddata->client->dev, "Entering %s mode.\n",
+		 fmode == ASUSEC_MODE_FACTORY ? "factory" : "normal");
+
+	return asus_dockram_access_ctl(ddata->ec.dockram, NULL,
+				       ASUSEC_CTL_FACTORY_MODE,
+				       fmode == ASUSEC_MODE_FACTORY ?
+				       ASUSEC_CTL_FACTORY_MODE : 0);
+}
+
+static int asus_ec_init(struct asus_ec_data *ddata)
+{
+	int ret;
+
+	ret = asus_ec_reset(ddata);
+	if (ret)
+		goto err_exit;
+
+	asus_ec_clear_buffer(ddata);
+
+	/* Check and inform about EC firmware behavior */
+	ret = asus_ec_susb_on_status(ddata);
+	if (ret)
+		goto err_exit;
+
+	/* Some EC require factory mode to be set normal on each request */
+	if (ddata->info->fmode)
+		ret = asus_ec_set_factory_mode(ddata, ddata->info->fmode);
+
+err_exit:
+	if (ret)
+		dev_err(&ddata->client->dev, "failed to access EC: %d\n", ret);
+
+	return ret;
+}
+
+static void asus_ec_handle_smi(struct asus_ec_data *ddata, unsigned int code)
+{
+	switch (code) {
+	case ASUSEC_SMI_HANDSHAKE:
+	case ASUSEC_SMI_RESET:
+		asus_ec_init(ddata);
+		break;
+	}
+}
+
+static irqreturn_t asus_ec_interrupt(int irq, void *dev_id)
+{
+	struct asus_ec_data *ddata = dev_id;
+	unsigned long notify_action;
+	int ret;
+
+	ret = i2c_smbus_read_i2c_block_data(ddata->client, ASUSEC_READ_BUF,
+					    ASUSEC_ENTRY_SIZE, ddata->ec_buf);
+	if (ret < ASUSEC_ENTRY_SIZE)
+		return IRQ_NONE;
+
+	/* Check status byte with ASUSEC_OBF_MASK if data is valid */
+	ret = ddata->ec_buf[ASUSEC_IRQ_STATUS] & ASUSEC_OBF_MASK;
+	if (!ret)
+		return IRQ_NONE;
+
+	notify_action = ddata->ec_buf[ASUSEC_IRQ_STATUS];
+	if (notify_action & ASUSEC_SMI_MASK) {
+		unsigned int code = ddata->ec_buf[ASUSEC_SMI_CODE];
+
+		asus_ec_handle_smi(ddata, code);
+
+		notify_action |= code << 8;
+	}
+
+	blocking_notifier_call_chain(&ddata->ec.notify_list,
+				     notify_action, ddata->ec_buf);
+
+	return IRQ_HANDLED;
+}
+
+static void asus_ec_release_dockram_dev(void *client)
+{
+	i2c_unregister_device(client);
+}
+
+static struct i2c_client *devm_asus_dockram_get(struct device *dev)
+{
+	struct i2c_client *parent = to_i2c_client(dev);
+	struct i2c_client *dockram;
+	struct dockram_ec_data *ddata;
+	int ret;
+
+	dockram = i2c_new_ancillary_device(parent, "dockram",
+					   parent->addr + ASUSEC_DOCKRAM_OFFSET);
+	if (IS_ERR(dockram))
+		return dockram;
+
+	ret = devm_add_action_or_reset(dev, asus_ec_release_dockram_dev,
+				       dockram);
+	if (ret)
+		return ERR_PTR(ret);
+
+	ddata = devm_kzalloc(&dockram->dev, sizeof(*ddata), GFP_KERNEL);
+	if (!ddata)
+		return ERR_PTR(-ENOMEM);
+
+	i2c_set_clientdata(dockram, ddata);
+	mutex_init(&ddata->ctl_lock);
+
+	return dockram;
+}
+
+static const struct mfd_cell asus_ec_sl101_dock_mfd_devices[] = {
+	MFD_CELL_NAME("asus-transformer-ec-kbc"),
+};
+
+static const struct mfd_cell asus_ec_tf101_dock_mfd_devices[] = {
+	MFD_CELL_BASIC("asus-transformer-ec-battery", NULL, NULL, 0, 1),
+	MFD_CELL_BASIC("asus-transformer-ec-charger", NULL, NULL, 0, 1),
+	MFD_CELL_BASIC("asus-transformer-ec-led", NULL, NULL, 0, 1),
+	MFD_CELL_NAME("asus-transformer-ec-kbc"),
+	MFD_CELL_NAME("asus-transformer-ec-keys"),
+};
+
+static const struct mfd_cell asus_ec_tf201_pad_mfd_devices[] = {
+	MFD_CELL_NAME("asus-transformer-ec-battery"),
+	MFD_CELL_NAME("asus-transformer-ec-led"),
+};
+
+static const struct mfd_cell asus_ec_tf600t_pad_mfd_devices[] = {
+	MFD_CELL_NAME("asus-transformer-ec-battery"),
+	MFD_CELL_NAME("asus-transformer-ec-charger"),
+	MFD_CELL_NAME("asus-transformer-ec-led"),
+};
+
+static int asus_ec_probe(struct i2c_client *client)
+{
+	struct device *dev = &client->dev;
+	struct asus_ec_data *ddata;
+	const struct mfd_cell *cells;
+	unsigned int num_cells;
+	unsigned long irqflags;
+	int ret;
+
+	if (!i2c_check_functionality(client->adapter, I2C_FUNC_SMBUS_I2C_BLOCK))
+		return dev_err_probe(dev, -ENXIO,
+			"I2C bus is missing required SMBus block mode support\n");
+
+	ddata = devm_kzalloc(dev, sizeof(*ddata), GFP_KERNEL);
+	if (!ddata)
+		return -ENOMEM;
+
+	ddata->info = device_get_match_data(dev);
+	if (!ddata->info)
+		return -ENODEV;
+
+	switch (ddata->info->variant) {
+	case ASUSEC_SL101_DOCK:
+		cells = asus_ec_sl101_dock_mfd_devices;
+		num_cells = ARRAY_SIZE(asus_ec_sl101_dock_mfd_devices);
+		break;
+	case ASUSEC_TF101_DOCK:
+		cells = asus_ec_tf101_dock_mfd_devices;
+		num_cells = ARRAY_SIZE(asus_ec_tf101_dock_mfd_devices);
+		break;
+	case ASUSEC_TF201_PAD:
+		cells = asus_ec_tf201_pad_mfd_devices;
+		num_cells = ARRAY_SIZE(asus_ec_tf201_pad_mfd_devices);
+		break;
+	case ASUSEC_TF600T_PAD:
+		cells = asus_ec_tf600t_pad_mfd_devices;
+		num_cells = ARRAY_SIZE(asus_ec_tf600t_pad_mfd_devices);
+		break;
+	default:
+		return dev_err_probe(dev, -EINVAL,
+				     "unknown device variant %d\n",
+				     ddata->info->variant);
+	}
+
+	i2c_set_clientdata(client, ddata);
+	ddata->client = client;
+
+	ddata->ec.dockram = devm_asus_dockram_get(dev);
+	if (IS_ERR(ddata->ec.dockram))
+		return dev_err_probe(dev, PTR_ERR(ddata->ec.dockram),
+				     "failed to get dockram\n");
+
+	ddata->ecreq_gpio = devm_gpiod_get(dev, "request", GPIOD_OUT_LOW);
+	if (IS_ERR(ddata->ecreq_gpio))
+		return dev_err_probe(dev, PTR_ERR(ddata->ecreq_gpio),
+				     "failed to get EC request GPIO\n");
+
+	BLOCKING_INIT_NOTIFIER_HEAD(&ddata->ec.notify_list);
+	mutex_init(&ddata->ecreq_lock);
+
+	asus_ec_signal_request(ddata);
+
+	ret = asus_ec_detect(ddata);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to detect EC version\n");
+
+	ret = asus_ec_init(ddata);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to init EC\n");
+
+	/*
+	 * Systems using device tree should set up interrupt via DTS,
+	 * the rest will use the default low interrupt.
+	 */
+	irqflags = dev->of_node ? 0 : IRQF_TRIGGER_LOW;
+
+	ret = devm_request_threaded_irq(dev, client->irq, NULL,
+					&asus_ec_interrupt,
+					IRQF_ONESHOT | irqflags,
+					client->name, ddata);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to register IRQ\n");
+
+	/* Parent I2C controller uses DMA, ASUS EC and child devices do not */
+	client->dev.coherent_dma_mask = 0;
+	client->dev.dma_mask = &client->dev.coherent_dma_mask;
+
+	return devm_mfd_add_devices(dev, 0, cells, num_cells, NULL, 0, NULL);
+}
+
+static const struct asus_ec_chip_info asus_ec_sl101_dock_data = {
+	.name = "dock",
+	.variant = ASUSEC_SL101_DOCK,
+	.fmode = ASUSEC_MODE_NONE,
+};
+
+static const struct asus_ec_chip_info asus_ec_tf101_dock_data = {
+	.name = "dock",
+	.variant = ASUSEC_TF101_DOCK,
+	.fmode = ASUSEC_MODE_NONE,
+};
+
+static const struct asus_ec_chip_info asus_ec_tf201_pad_data = {
+	.name = "pad",
+	.variant = ASUSEC_TF201_PAD,
+	.fmode = ASUSEC_MODE_NORMAL,
+};
+
+static const struct asus_ec_chip_info asus_ec_tf600t_pad_data = {
+	.name = "pad",
+	.variant = ASUSEC_TF600T_PAD,
+	.fmode = ASUSEC_MODE_NORMAL,
+};
+
+static const struct of_device_id asus_ec_match[] = {
+	{
+		.compatible = "asus,sl101-ec-dock",
+		.data = &asus_ec_sl101_dock_data
+	}, {
+		.compatible = "asus,tf101-ec-dock",
+		.data = &asus_ec_tf101_dock_data
+	}, {
+		.compatible = "asus,tf201-ec-pad",
+		.data = &asus_ec_tf201_pad_data
+	}, {
+		.compatible = "asus,tf600t-ec-pad",
+		.data = &asus_ec_tf600t_pad_data
+	},
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, asus_ec_match);
+
+static struct i2c_driver asus_ec_driver = {
+	.driver	= {
+		.name = "asus-transformer-ec",
+		.of_match_table = asus_ec_match,
+	},
+	.probe = asus_ec_probe,
+};
+module_i2c_driver(asus_ec_driver);
+
+MODULE_AUTHOR("Michał Mirosław <mirq-linux@rere.qmqm.pl>");
+MODULE_AUTHOR("Svyatoslav Ryhel <clamor95@gmail.com>");
+MODULE_DESCRIPTION("ASUS Transformer's EC driver");
+MODULE_LICENSE("GPL");
diff --git a/include/linux/mfd/asus-transformer-ec.h b/include/linux/mfd/asus-transformer-ec.h
new file mode 100644
index 000000000000..1c25c3a18355
--- /dev/null
+++ b/include/linux/mfd/asus-transformer-ec.h
@@ -0,0 +1,92 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef __MFD_ASUS_TRANSFORMER_EC_H
+#define __MFD_ASUS_TRANSFORMER_EC_H
+
+#include <linux/notifier.h>
+#include <linux/platform_device.h>
+
+#define ASUSEC_ENTRIES			0x100
+#define ASUSEC_ENTRY_SIZE		32
+#define ASUSEC_ENTRY_BUFSIZE		(ASUSEC_ENTRY_SIZE + 1)
+
+struct i2c_client;
+
+/**
+ * struct asusec_core - public part shared with all cells
+ *
+ * @model: firmware version running on the EC
+ * @name: prefix associated with the EC
+ * @dockram: pointer to Dockram's i2c_client
+ * @notify_list: notify list used by cells
+ */
+struct asusec_core {
+	const char *model;
+	const char *name;
+	struct i2c_client *dockram;
+	struct blocking_notifier_head notify_list;
+};
+
+/* interrupt sources */
+#define ASUSEC_IRQ_STATUS		1
+#define ASUSEC_OBF_MASK			BIT(0)
+#define ASUSEC_KEY_MASK			BIT(2)
+#define ASUSEC_KBC_MASK			BIT(3)
+#define ASUSEC_AUX_MASK			BIT(5)
+#define ASUSEC_SCI_MASK			BIT(6)
+#define ASUSEC_SMI_MASK			BIT(7)
+
+/* SMI notification codes */
+#define ASUSEC_SMI_CODE			2
+#define ASUSEC_SMI_POWER_NOTIFY		0x31	/* USB cable plug event */
+#define ASUSEC_SMI_HANDSHAKE		0x50	/* response to ec_req edge */
+#define ASUSEC_SMI_WAKE			0x53
+#define ASUSEC_SMI_RESET		0x5f
+#define ASUSEC_SMI_ADAPTER_EVENT	0x60	/* charger to dock plug event */
+#define ASUSEC_SMI_BACKLIGHT_ON		0x63
+#define ASUSEC_SMI_AUDIO_DOCK_IN	0x70
+
+#define ASUSEC_SMI_ACTION(code)		(ASUSEC_SMI_MASK | ASUSEC_OBF_MASK | \
+					(ASUSEC_SMI_##code << 8))
+
+/* control register [0x0a] layout */
+#define ASUSEC_CTL_SIZE			8
+
+/*
+ * EC reports power from 40-pin connector in the LSB of the control
+ * register.  The following values have been observed (xor 0x02):
+ *
+ * PAD-ec no-plug  0x40 / PAD-ec DOCK     0x20 / DOCK-ec no-plug 0x40
+ * PAD-ec AC       0x25 / PAD-ec DOCK+AC  0x24 / DOCK-ec AC      0x25
+ * PAD-ec USB      0x45 / PAD-ec DOCK+USB 0x24 / DOCK-ec USB     0x41
+ */
+
+#define ASUSEC_CTL_DIRECT_POWER_SOURCE	BIT_ULL(0)
+#define ASUSEC_STAT_CHARGING		BIT_ULL(2)
+#define ASUSEC_CTL_FULL_POWER_SOURCE	BIT_ULL(5)
+#define ASUSEC_CTL_SUSB_MODE		BIT_ULL(9)
+#define ASUSEC_CMD_SUSPEND_S3		BIT_ULL(33)
+#define ASUSEC_CTL_TEST_DISCHARGE	BIT_ULL(35)
+#define ASUSEC_CMD_SUSPEND_INHIBIT	BIT_ULL(37)
+#define ASUSEC_CTL_FACTORY_MODE		BIT_ULL(38)
+#define ASUSEC_CTL_KEEP_AWAKE		BIT_ULL(39)
+#define ASUSEC_CTL_USB_CHARGE		BIT_ULL(40)
+#define ASUSEC_CTL_LED_BLINK		BIT_ULL(40)
+#define ASUSEC_CTL_LED_AMBER		BIT_ULL(41)
+#define ASUSEC_CTL_LED_GREEN		BIT_ULL(42)
+#define ASUSEC_CMD_SWITCH_HDMI		BIT_ULL(56)
+#define ASUSEC_CMD_WIN_SHUTDOWN		BIT_ULL(62)
+
+#define ASUSEC_DOCKRAM_INFO_MODEL	0x01
+#define ASUSEC_DOCKRAM_INFO_FW		0x02
+#define ASUSEC_DOCKRAM_INFO_CFGFMT	0x03
+#define ASUSEC_DOCKRAM_INFO_HW		0x04
+#define ASUSEC_DOCKRAM_CONTROL		0x0a
+#define ASUSEC_DOCKRAM_BATT_CTL		0x14
+
+#define ASUSEC_WRITE_BUF		0x64
+#define ASUSEC_READ_BUF			0x6a
+
+int asus_dockram_access_ctl(struct i2c_client *client,
+			    u64 *out, u64 mask, u64 xor);
+
+#endif /* __MFD_ASUS_TRANSFORMER_EC_H */
-- 
2.53.0


