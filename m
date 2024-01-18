Return-Path: <linux-leds+bounces-620-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 78865831E7B
	for <lists+linux-leds@lfdr.de>; Thu, 18 Jan 2024 18:33:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 22A35282FCF
	for <lists+linux-leds@lfdr.de>; Thu, 18 Jan 2024 17:33:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA1F62D600;
	Thu, 18 Jan 2024 17:33:35 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mx.skole.hr (mx2.hosting.skole.hr [161.53.165.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D81C92D78F;
	Thu, 18 Jan 2024 17:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=161.53.165.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705599215; cv=none; b=aJLySe7YuM71/PIoCbTwx7zYWu763tJVSsay/Okhtha6jO/B1Ri1MPnbckkCaisrwyDP7myd0KTH6VZv0zPMDYAYXlwHcthV5QolWYNMqYhlxfDAu6y2no6EfBbWhf/Pu9QJFrBPYYme+YhxaVQAgcyTe5ThpNseJU2+wgz5UYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705599215; c=relaxed/simple;
	bh=RL8pDKSS8GEXEpA6kwbUcC+c8mq/JIBYJcEdllWUPgM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=CixFsQcaqy7wn95JEFJS8O6Tue/709qbwUXKm+iRSv7SxIp4qpnfw1RXivkIUWlQHjZbsQ7m1mhyHMFTTjmC8TDQi0H1ZyfpSs53WnDkLAWkmHCzjATnWLA3tIxwY+cFQ20nYw77s1HV6OEzZ5yG8R4ANCco4OOImHfu/Tlt1xE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=skole.hr; spf=pass smtp.mailfrom=skole.hr; arc=none smtp.client-ip=161.53.165.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=skole.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=skole.hr
Received: from mx2.hosting.skole.hr (localhost.localdomain [127.0.0.1])
	by mx.skole.hr (mx.skole.hr) with ESMTP id 8287F83381;
	Thu, 18 Jan 2024 18:33:25 +0100 (CET)
From: =?utf-8?q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
Date: Thu, 18 Jan 2024 18:32:39 +0100
Subject: [PATCH v2 2/2] backlight: Add Kinetic KTD2801 driver
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240118-ktd2801-v2-2-425cf32e0769@skole.hr>
References: <20240118-ktd2801-v2-0-425cf32e0769@skole.hr>
In-Reply-To: <20240118-ktd2801-v2-0-425cf32e0769@skole.hr>
To: Lee Jones <lee@kernel.org>, 
 Daniel Thompson <daniel.thompson@linaro.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@ucw.cz>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>
Cc: Karel Balej <balejk@matfyz.cz>, ~postmarketos/upstreaming@lists.sr.ht, 
 dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-fbdev@vger.kernel.org, 
 =?utf-8?q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=7328;
 i=duje.mihanovic@skole.hr; h=from:subject:message-id;
 bh=RL8pDKSS8GEXEpA6kwbUcC+c8mq/JIBYJcEdllWUPgM=;
 b=owEBbQKS/ZANAwAIAZoRnrBCLZbhAcsmYgBlqWDB5L3h2dG7RFFheDJevRR/i3WGXidWHtR/D
 aLaWTJYRdSJAjMEAAEIAB0WIQRT351NnD/hEPs2LXiaEZ6wQi2W4QUCZalgwQAKCRCaEZ6wQi2W
 4UYID/9rv5+qAkM5dST6CQP69Me/+I0XI0eBe/GLSMEn8iI/9LruOL6+Yf/8nR3NbKXF1PHhmkt
 WtnQVZvVgfZqPG0bzY1okOK1GG9jSFiw0rfMHMz1sSKfTeu7y8iJN2N6IVye7XJ2WsLqDc2O8ch
 pOMw1C6m93ePflYp0JP/Lv0P9oVuAb0OuLDT1z7Ui+j6+eV34rfB/BSKTCTKF9dL/8GT9wm6Dpf
 BsshDeZ29VDbrhaOijY5XvhL89s/Wnzgg26W/WrLryxVgBnGHtUnqjac2wqC3NiXpmE9WYW+aDW
 EacCbJ5TTB9eEwkbRU/iJQ9RM/ZU/RKt5hVJfQPKmCDj/aCl68VT7qf+LJU38WytmSiA5J8hrFe
 fvSowFIw0hfwg+kv9XX2saE9vlcVn4tfoOBc3Vl4zLlGlKKmIlsfHgG5IUVzypQW+j9ImC+AN01
 dD4TB4fFo36TIo53HspodHQ4cT0c+iLFciMAOTTYSckv8ouVSOTybdWqYv0ATYKQsOLn1KfXO9Z
 cGhOWQvZChHFw+GIgrGR8DPdEDkGGLau4+qBb14qoukW9WfZXzWd5LO/lcTCvA5WC09wrFdVrRV
 LGWFDrjG0WMYinlmvENyu+ikech6ddHE5kOEfgbaSNDJCQZwCgvyen4eBkENf2ujs25o45LJASI
 mMSwXabVgpizOJQ==
X-Developer-Key: i=duje.mihanovic@skole.hr; a=openpgp;
 fpr=53DF9D4D9C3FE110FB362D789A119EB0422D96E1

Add driver for the Kinetic KTD2801 backlight driver.

Signed-off-by: Duje Mihanović <duje.mihanovic@skole.hr>

---
Shared ExpressWire handling code and preemption watchdogs haven't been
implemented in this version as my questions regarding these two weren't
answered.
---
 MAINTAINERS                                 |   6 ++
 drivers/video/backlight/Kconfig             |   7 ++
 drivers/video/backlight/Makefile            |   1 +
 drivers/video/backlight/ktd2801-backlight.c | 149 ++++++++++++++++++++++++++++
 4 files changed, 163 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index a7c4cf8201e0..1e25d760f312 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11884,6 +11884,12 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/leds/backlight/kinetic,ktd253.yaml
 F:	drivers/video/backlight/ktd253-backlight.c
 
+KTD2801 BACKLIGHT DRIVER
+M:	Duje Mihanović <duje.mihanovic@skole.hr>
+S:	Maintained
+F:	Documentation/devicetree/bindings/leds/backlight/kinetic,ktd2801.yaml
+F:	drivers/video/backlight/ktd2801-backlight.c
+
 KTEST
 M:	Steven Rostedt <rostedt@goodmis.org>
 M:	John Hawley <warthog9@eaglescrag.net>
diff --git a/drivers/video/backlight/Kconfig b/drivers/video/backlight/Kconfig
index 51387b1ef012..a2b268293345 100644
--- a/drivers/video/backlight/Kconfig
+++ b/drivers/video/backlight/Kconfig
@@ -183,6 +183,13 @@ config BACKLIGHT_KTD253
 	  which is a 1-wire GPIO-controlled backlight found in some mobile
 	  phones.
 
+config BACKLIGHT_KTD2801
+	tristate "Backlight Driver for Kinetic KTD2801"
+	depends on GPIOLIB || COMPILE_TEST
+	help
+	  Say Y to enable the backlight driver for the Kinetic KTD2801 1-wire
+	  GPIO-controlled backlight found in Samsung Galaxy Core Prime VE LTE.
+
 config BACKLIGHT_KTZ8866
 	tristate "Backlight Driver for Kinetic KTZ8866"
 	depends on I2C
diff --git a/drivers/video/backlight/Makefile b/drivers/video/backlight/Makefile
index f72e1c3c59e9..b33b647f31ca 100644
--- a/drivers/video/backlight/Makefile
+++ b/drivers/video/backlight/Makefile
@@ -35,6 +35,7 @@ obj-$(CONFIG_BACKLIGHT_HP680)		+= hp680_bl.o
 obj-$(CONFIG_BACKLIGHT_HP700)		+= jornada720_bl.o
 obj-$(CONFIG_BACKLIGHT_IPAQ_MICRO)	+= ipaq_micro_bl.o
 obj-$(CONFIG_BACKLIGHT_KTD253)		+= ktd253-backlight.o
+obj-$(CONFIG_BACKLIGHT_KTD2801)		+= ktd2801-backlight.o
 obj-$(CONFIG_BACKLIGHT_KTZ8866)		+= ktz8866.o
 obj-$(CONFIG_BACKLIGHT_LM3533)		+= lm3533_bl.o
 obj-$(CONFIG_BACKLIGHT_LM3630A)		+= lm3630a_bl.o
diff --git a/drivers/video/backlight/ktd2801-backlight.c b/drivers/video/backlight/ktd2801-backlight.c
new file mode 100644
index 000000000000..bbcb2e2059a2
--- /dev/null
+++ b/drivers/video/backlight/ktd2801-backlight.c
@@ -0,0 +1,149 @@
+// SPDX-License-Identifier: GPL-2.0-only
+#include <linux/backlight.h>
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/property.h>
+
+/* These values have been extracted from Samsung's driver. */
+#define KTD2801_EXPRESSWIRE_DETECT_DELAY_US	150
+#define KTD2801_EXPRESSWIRE_DETECT_US		270
+#define KTD2801_LOW_BIT_HIGH_TIME_US		5
+#define KTD2801_LOW_BIT_LOW_TIME_US		(4 * KTD2801_HIGH_BIT_LOW_TIME_US)
+#define KTD2801_HIGH_BIT_LOW_TIME_US		5
+#define KTD2801_HIGH_BIT_HIGH_TIME_US		(4 * KTD2801_HIGH_BIT_LOW_TIME_US)
+#define KTD2801_DATA_START_US			5
+#define KTD2801_END_OF_DATA_LOW_US		10
+#define KTD2801_END_OF_DATA_HIGH_US		350
+#define KTD2801_PWR_DOWN_DELAY_US		2600
+
+#define KTD2801_DEFAULT_BRIGHTNESS	100
+#define KTD2801_MAX_BRIGHTNESS		255
+
+struct ktd2801_backlight {
+	struct backlight_device *bd;
+	struct gpio_desc *gpiod;
+	bool was_on;
+};
+
+static int ktd2801_update_status(struct backlight_device *bd)
+{
+	struct ktd2801_backlight *ktd2801 = bl_get_data(bd);
+	u8 brightness = (u8) backlight_get_brightness(bd);
+
+	if (backlight_is_blank(bd)) {
+		gpiod_set_value(ktd2801->gpiod, 0);
+		udelay(KTD2801_PWR_DOWN_DELAY_US);
+		ktd2801->was_on = false;
+		return 0;
+	}
+
+	if (!ktd2801->was_on) {
+		gpiod_set_value(ktd2801->gpiod, 1);
+		udelay(KTD2801_EXPRESSWIRE_DETECT_DELAY_US);
+		gpiod_set_value(ktd2801->gpiod, 0);
+		udelay(KTD2801_EXPRESSWIRE_DETECT_US);
+		gpiod_set_value(ktd2801->gpiod, 1);
+		ktd2801->was_on = true;
+	}
+
+	gpiod_set_value(ktd2801->gpiod, 1);
+	udelay(KTD2801_DATA_START_US);
+
+	for (int i = 0; i < 8; i++) {
+		u8 next_bit = (brightness & 0x80) >> 7;
+
+		if (!next_bit) {
+			gpiod_set_value(ktd2801->gpiod, 0);
+			udelay(KTD2801_LOW_BIT_LOW_TIME_US);
+			gpiod_set_value(ktd2801->gpiod, 1);
+			udelay(KTD2801_LOW_BIT_HIGH_TIME_US);
+		} else {
+			gpiod_set_value(ktd2801->gpiod, 0);
+			udelay(KTD2801_HIGH_BIT_LOW_TIME_US);
+			gpiod_set_value(ktd2801->gpiod, 1);
+			udelay(KTD2801_HIGH_BIT_HIGH_TIME_US);
+		}
+		brightness <<= 1;
+	}
+	gpiod_set_value(ktd2801->gpiod, 0);
+	udelay(KTD2801_END_OF_DATA_LOW_US);
+	gpiod_set_value(ktd2801->gpiod, 1);
+	udelay(KTD2801_END_OF_DATA_HIGH_US);
+	return 0;
+}
+
+static const struct backlight_ops ktd2801_backlight_ops = {
+	.update_status = ktd2801_update_status,
+};
+
+static int ktd2801_backlight_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct backlight_device *bd;
+	struct ktd2801_backlight *ktd2801;
+	u32 brightness, max_brightness;
+	int ret;
+
+	ktd2801 = devm_kzalloc(dev, sizeof(*ktd2801), GFP_KERNEL);
+	if (!ktd2801)
+		return -ENOMEM;
+	ktd2801->was_on = true;
+
+	ret = device_property_read_u32(dev, "max-brightness", &max_brightness);
+	if (ret)
+		max_brightness = KTD2801_MAX_BRIGHTNESS;
+	if (max_brightness > KTD2801_MAX_BRIGHTNESS) {
+		dev_err(dev, "illegal max brightness specified\n");
+		max_brightness = KTD2801_MAX_BRIGHTNESS;
+	}
+
+	ret = device_property_read_u32(dev, "default-brightness", &brightness);
+	if (ret)
+		brightness = KTD2801_DEFAULT_BRIGHTNESS;
+	if (brightness > max_brightness) {
+		dev_err(dev, "default brightness exceeds max\n");
+		brightness = max_brightness;
+	}
+
+	ktd2801->gpiod = devm_gpiod_get(dev, "ctrl", GPIOD_OUT_HIGH);
+	if (IS_ERR(ktd2801->gpiod))
+		return dev_err_probe(dev, PTR_ERR(dev),
+				"failed to get backlight GPIO");
+	gpiod_set_consumer_name(ktd2801->gpiod, dev_name(dev));
+
+	bd = devm_backlight_device_register(dev, dev_name(dev), dev, ktd2801,
+			&ktd2801_backlight_ops, NULL);
+	if (IS_ERR(bd))
+		return dev_err_probe(dev, PTR_ERR(bd),
+				"failed to register backlight");
+
+	bd->props.max_brightness = max_brightness;
+	bd->props.brightness = brightness;
+
+	ktd2801->bd = bd;
+	platform_set_drvdata(pdev, bd);
+	backlight_update_status(bd);
+
+	return 0;
+}
+
+static const struct of_device_id ktd2801_of_match[] = {
+	{ .compatible = "kinetic,ktd2801" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, ktd2801_of_match);
+
+static struct platform_driver ktd2801_backlight_driver = {
+	.driver = {
+		.name = "ktd2801-backlight",
+		.of_match_table = ktd2801_of_match,
+	},
+	.probe = ktd2801_backlight_probe,
+};
+module_platform_driver(ktd2801_backlight_driver);
+
+MODULE_AUTHOR("Duje Mihanović <duje.mihanovic@skole.hr>");
+MODULE_DESCRIPTION("Kinetic KTD2801 Backlight Driver");
+MODULE_LICENSE("GPL");

-- 
2.43.0



