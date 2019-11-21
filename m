Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 74E1310545B
	for <lists+linux-leds@lfdr.de>; Thu, 21 Nov 2019 15:27:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726714AbfKUO1f (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 21 Nov 2019 09:27:35 -0500
Received: from mail-qt1-f195.google.com ([209.85.160.195]:36093 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726379AbfKUO1f (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 21 Nov 2019 09:27:35 -0500
Received: by mail-qt1-f195.google.com with SMTP id y10so3880212qto.3;
        Thu, 21 Nov 2019 06:27:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=qCFVIZu+9qwsSK6ZpbURT0WFtiz9LPTKiASRsEFWyS8=;
        b=C7zY2Dt640Tz5tApLwfxDuVWsANzhyUtVUPxVXPq4R8gng3c/t/kI+++L7egB3gZox
         NBNzXNRBeGY4FK2G4t+hOjvg8vyIeYGzCVYHoYTgNEYD7ytCKH5ABQ6l7i533ti96v6X
         BDOjbKETRT+OcbBfS8M4Oc/NHo0EdTOIqwaRJ2OqADkKGUNCjngSXbU6bsvbOdjUHVE8
         YAdV7/goTu8udWxnScbZAKTZCMOu/A0MA4RJ570XsiOD4EKiQCuN6yZ2bYeitDpZve+e
         L+KeT/cczw6l1NvYYrYJqV0Gj/rLKk5pW4nMhDv7t/2Iv77ea2QkU3pM5iA7oyIagkpb
         UTuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=qCFVIZu+9qwsSK6ZpbURT0WFtiz9LPTKiASRsEFWyS8=;
        b=tvpBhF03wC0LcmMYQBTBoBDjnsvWPkIBsD+cRiz7H79rzeAb7M6dfxgG03ijvBz3hf
         nE3plpgy8GMOaBZ4GOpyl9/ooWsj4Z1Epw3B6OJUbRNE/jCDvFcSgOue4tRAj67HGRi+
         GUImG8zOsIiZrcGsZhg3W8FpqEK9nJ5lh68PwX0grMTlv5oLK3wDgA5yxn1d+noX2PbU
         VNrFfbLXDj5LmENENIDxWhfz6IOOfM/DlXCND0X7yUpc29FT24am9HTO+xAXMXdJnLkM
         Qw+EbTKgFDAvkoW+c5kp8FU8+EeIMg4VfTSasYfNjzO9ttCaZAI6SyII8CzoxDYXVFxj
         GNOg==
X-Gm-Message-State: APjAAAV0Fkwf7hkh68bbAyD7s4FdZtBv7bD1+qUSTnYxpnipMjKkURmt
        jlq9PIz2LSkOGNcWaz6onxAK5AFf
X-Google-Smtp-Source: APXvYqyO0hjhiUhYWEigVHC06GapdoAtTzXbclEQJSvK4IpmJZn21wj5AbNMmlqO0Ky+gSsei7awvA==
X-Received: by 2002:aed:2ec6:: with SMTP id k64mr8838452qtd.61.1574346453480;
        Thu, 21 Nov 2019 06:27:33 -0800 (PST)
Received: from localhost.localdomain ([72.53.229.209])
        by smtp.gmail.com with ESMTPSA id l198sm1442931qke.70.2019.11.21.06.27.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2019 06:27:33 -0800 (PST)
From:   Sven Van Asbroeck <thesven73@gmail.com>
X-Google-Original-From: Sven Van Asbroeck <TheSven73@gmail.com>
To:     Lee Jones <lee.jones@linaro.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Grigoryev Denis <grigoryev@fastwel.ru>,
        Axel Lin <axel.lin@ingics.com>, Dan Murphy <dmurphy@ti.com>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-leds@vger.kernel.org
Subject: [PATCH v4 1/2] leds: tps6105x: add driver for mfd chip led mode
Date:   Thu, 21 Nov 2019 09:27:25 -0500
Message-Id: <20191121142726.22856-2-TheSven73@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191121142726.22856-1-TheSven73@gmail.com>
References: <20191121142726.22856-1-TheSven73@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

This driver adds support for the led operational mode of the
tps6105x mfd device.

Tree: next-20191118
Signed-off-by: Sven Van Asbroeck <TheSven73@gmail.com>
---
 drivers/leds/Kconfig         | 10 +++++
 drivers/leds/Makefile        |  1 +
 drivers/leds/leds-tps6105x.c | 83 ++++++++++++++++++++++++++++++++++++
 3 files changed, 94 insertions(+)
 create mode 100644 drivers/leds/leds-tps6105x.c

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index 4b68520ac251..7c7ceaa824a2 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -836,6 +836,16 @@ config LEDS_LM36274
 	  Say Y to enable the LM36274 LED driver for TI LMU devices.
 	  This supports the LED device LM36274.
 
+config LEDS_TPS6105X
+	tristate "LED support for TI TPS6105X"
+	depends on LEDS_CLASS
+	depends on TPS6105X
+	default y if TPS6105X
+	help
+	  This driver supports TPS61050/TPS61052 led chips.
+	  It is a single boost converter primarily for white LEDs and
+	  audio amplifiers.
+
 comment "LED Triggers"
 source "drivers/leds/trigger/Kconfig"
 
diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
index 2da39e896ce8..d7e1107753fb 100644
--- a/drivers/leds/Makefile
+++ b/drivers/leds/Makefile
@@ -85,6 +85,7 @@ obj-$(CONFIG_LEDS_LM3601X)		+= leds-lm3601x.o
 obj-$(CONFIG_LEDS_TI_LMU_COMMON)	+= leds-ti-lmu-common.o
 obj-$(CONFIG_LEDS_LM3697)		+= leds-lm3697.o
 obj-$(CONFIG_LEDS_LM36274)		+= leds-lm36274.o
+obj-$(CONFIG_LEDS_TPS6105X)		+= leds-tps6105x.o
 
 # LED SPI Drivers
 obj-$(CONFIG_LEDS_CR0014114)		+= leds-cr0014114.o
diff --git a/drivers/leds/leds-tps6105x.c b/drivers/leds/leds-tps6105x.c
new file mode 100644
index 000000000000..ea2afaa3e3f0
--- /dev/null
+++ b/drivers/leds/leds-tps6105x.c
@@ -0,0 +1,83 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include <linux/leds.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/mfd/tps6105x.h>
+#include <linux/regmap.h>
+
+struct tps6105x_priv {
+	struct regmap *regmap;
+	struct led_classdev cdev;
+	struct fwnode_handle *fwnode;
+};
+
+static void tps6105x_handle_put(void *data)
+{
+	struct tps6105x_priv *priv = data;
+
+	fwnode_handle_put(priv->fwnode);
+}
+
+static int tps6105x_brightness_set(struct led_classdev *cdev,
+				  enum led_brightness brightness)
+{
+	struct tps6105x_priv *priv = container_of(cdev, struct tps6105x_priv,
+							cdev);
+
+	return regmap_update_bits(priv->regmap, TPS6105X_REG_0,
+		TPS6105X_REG0_TORCHC_MASK,
+		brightness << TPS6105X_REG0_TORCHC_SHIFT);
+}
+
+static int tps6105x_led_probe(struct platform_device *pdev)
+{
+	struct tps6105x *tps6105x = dev_get_platdata(&pdev->dev);
+	struct tps6105x_platform_data *pdata = tps6105x->pdata;
+	struct led_init_data init_data = { };
+	struct tps6105x_priv *priv;
+	int ret;
+
+	/* This instance is not set for torch mode so bail out */
+	if (pdata->mode != TPS6105X_MODE_TORCH) {
+		dev_info(&pdev->dev,
+			"chip not in torch mode, exit probe");
+		return -EINVAL;
+	}
+
+	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+	priv->fwnode = device_get_next_child_node(pdev->dev.parent, NULL);
+	ret = devm_add_action_or_reset(&pdev->dev, tps6105x_handle_put, priv);
+	if (ret)
+		return ret;
+	priv->regmap = tps6105x->regmap;
+	priv->cdev.brightness_set_blocking = tps6105x_brightness_set;
+	priv->cdev.max_brightness = 7;
+	init_data.devicename = "tps6105x";
+	init_data.default_label = ":torch";
+	init_data.fwnode = priv->fwnode;
+
+	ret = regmap_update_bits(tps6105x->regmap, TPS6105X_REG_0,
+		TPS6105X_REG0_MODE_MASK | TPS6105X_REG0_TORCHC_MASK,
+		TPS6105X_REG0_MODE_TORCH << TPS6105X_REG0_MODE_SHIFT);
+	if (ret)
+		return ret;
+
+	return devm_led_classdev_register_ext(&pdev->dev, &priv->cdev,
+					      &init_data);
+}
+
+static struct platform_driver led_driver = {
+	.probe = tps6105x_led_probe,
+	.driver = {
+		.name = "tps6105x-leds",
+	},
+};
+
+module_platform_driver(led_driver);
+
+MODULE_DESCRIPTION("TPS6105x led driver");
+MODULE_AUTHOR("Sven Van Asbroeck <TheSven73@gmail.com>");
+MODULE_LICENSE("GPL v2");
-- 
2.17.1

