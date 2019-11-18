Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1F3ED1009CB
	for <lists+linux-leds@lfdr.de>; Mon, 18 Nov 2019 17:54:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726976AbfKRQyQ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 18 Nov 2019 11:54:16 -0500
Received: from mail-qt1-f195.google.com ([209.85.160.195]:36371 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726967AbfKRQyP (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 18 Nov 2019 11:54:15 -0500
Received: by mail-qt1-f195.google.com with SMTP id y10so20987682qto.3;
        Mon, 18 Nov 2019 08:54:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=H4ufcAjmGAp7yczEOXUlfsJjyH4uOivnQy6YSEvUqsg=;
        b=QbziSNldeobqFF9OMXSmIQYGaJoHL/ePsUtm8eQyQmHHgsgZ68SKOMpvnRGTdR+BBW
         7YjDtKR5MKKnHtD4bKu2Rk2Jah+hpYCIZ0A6NGDt9zi3x6/rqA+i1FEuwOsH929iuJEG
         i8IPSS0uJYKJz1aUTFhxMz9P501+KwYF0PMYMhgppot6JSPr0JTeSfMdtB1ujQY9Mdo0
         pOoH0gYW2dbUJma5kp3eVbn9c8Xsk0MAHzIBXbTJez+xWUaTFKE6WVbZF5dgbTIntg7u
         qhbMU7u7LyKxLScliguO53bi7BpKKzQyPLef+oCJPlwtKrxKqVygS8h6H49VNje45tsK
         jINA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=H4ufcAjmGAp7yczEOXUlfsJjyH4uOivnQy6YSEvUqsg=;
        b=Iap3L3AJbuZZeT/RnIgijkkXI6WJF2/dQ7aOFNZl9lrAAkwdNENUS03e6nFlmHGjub
         UtJ8UIjDJ/P+JAo6pPNVQgqThLsoRQFKTfsWfKBkGdpm4kaEz6ir95RRs2euP7RjktVG
         8vctmnsY5FKWPKnACWFl+8mVF8RGOOHp2K0HIi2n673NYvex0qJm6qgREu77GUOA1jPr
         14xjv5AFT1R5FFhk+R1jDq4EOPdzoQq9UGeGN1WxPrPX5WZ7JppYi44VhR8tAcUojcDu
         MubFVJGfmSFXSkCrC4nDaasBVOBkfbzk9J0VP1aT6HyyZV58c0/35OF2ruMavP398dna
         lA7w==
X-Gm-Message-State: APjAAAXXoMh4FmQE9nEeZSVRUPL56qEQ0Wa5h7NFpbGbeGRx4HEOZ4j/
        gDhKwqpjDK5wC9YrCJKcqLA=
X-Google-Smtp-Source: APXvYqwuivbv+aucBKVlB/9FxFNP+IFXzVRozHzerseUT7JZI02d9QkrZCL2MJptvFgt1mF+o1K+pw==
X-Received: by 2002:ac8:5282:: with SMTP id s2mr28276305qtn.362.1574096053594;
        Mon, 18 Nov 2019 08:54:13 -0800 (PST)
Received: from localhost.localdomain ([72.53.229.209])
        by smtp.gmail.com with ESMTPSA id a3sm8634648qkf.76.2019.11.18.08.54.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Nov 2019 08:54:13 -0800 (PST)
From:   Sven Van Asbroeck <thesven73@gmail.com>
X-Google-Original-From: Sven Van Asbroeck <TheSven73@gmail.com>
To:     Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Grigoryev Denis <grigoryev@fastwel.ru>,
        Axel Lin <axel.lin@ingics.com>, Dan Murphy <dmurphy@ti.com>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-leds@vger.kernel.org
Subject: [PATCH v1 3/4] leds: tps6105x: add driver for mfd chip led mode
Date:   Mon, 18 Nov 2019 11:53:59 -0500
Message-Id: <20191118165400.21985-4-TheSven73@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191118165400.21985-1-TheSven73@gmail.com>
References: <20191118165400.21985-1-TheSven73@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

This driver adds support for the led operational mode of the
tps6105x mfd device.

Example usage, devicetree:

i2c0 {
	tps61052@33 {
	compatible = "ti,tps61052";
	reg = <0x33>;

		tps-led {
			compatible = "ti,tps6105x-leds";
		};
	};
};

Example usage, platform data in machine layer:

 #include <linux/mfd/tps6105x.h>

 struct tps6105x_platform_data pdata = {
         .mode = TPS6105X_MODE_TORCH,
 };

Tree: next-20191118
Signed-off-by: Sven Van Asbroeck <TheSven73@gmail.com>
---
 drivers/leds/Kconfig         | 10 ++++++
 drivers/leds/Makefile        |  1 +
 drivers/leds/leds-tps6105x.c | 68 ++++++++++++++++++++++++++++++++++++
 3 files changed, 79 insertions(+)
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
index 000000000000..c68fc5b180ed
--- /dev/null
+++ b/drivers/leds/leds-tps6105x.c
@@ -0,0 +1,68 @@
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
+};
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
+	struct device_node *np = pdev->dev.of_node;
+	struct tps6105x_priv *priv;
+	int ret;
+
+	/* This instance is not set for led mode so bail out */
+	if (pdata->mode != TPS6105X_MODE_TORCH) {
+		dev_info(&pdev->dev,
+			"chip not in torch mode, exit probe");
+		return -EINVAL;
+	}
+
+	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+	priv->regmap = tps6105x->regmap;
+	priv->cdev.name = np ? np->name : "tps6105x";
+	priv->cdev.brightness_set_blocking = tps6105x_brightness_set;
+	priv->cdev.max_brightness = 7;
+
+	ret = regmap_update_bits(tps6105x->regmap, TPS6105X_REG_0,
+		TPS6105X_REG0_MODE_MASK | TPS6105X_REG0_TORCHC_MASK,
+		TPS6105X_REG0_MODE_TORCH << TPS6105X_REG0_MODE_SHIFT);
+	if (ret)
+		return ret;
+
+	return devm_led_classdev_register(&pdev->dev, &priv->cdev);
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

