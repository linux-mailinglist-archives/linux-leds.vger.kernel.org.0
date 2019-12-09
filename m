Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 53121116E7A
	for <lists+linux-leds@lfdr.de>; Mon,  9 Dec 2019 15:02:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727696AbfLIOCm (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 9 Dec 2019 09:02:42 -0500
Received: from mail-qt1-f194.google.com ([209.85.160.194]:45826 "EHLO
        mail-qt1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726687AbfLIOCl (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 9 Dec 2019 09:02:41 -0500
Received: by mail-qt1-f194.google.com with SMTP id p5so15592832qtq.12;
        Mon, 09 Dec 2019 06:02:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=abq/JZSAZcKH9qO+Dux+14ymcOyCPcLsqnIBHXTH4u8=;
        b=vW8KbnTQvWIfIS724qImX1VmFhuraXlB3q/AxKufmN7+tSP3cwqD6taPlPBrvZcrSk
         WvkgDdNvgPZKDiIXHpijX2FLJ0IpxegIUH+gaY5L8ZVGyWkn4hgeEd9wHOzQLyfMvzJF
         I/bBqYjczQRVgvC+LBnApmHjdbyxv1Fa48a9GrrbDpqG/AtrBPDluc8YFbL6325GemOV
         IoJOFmiHKtDzMDcpk47XEHi6wFuD0CTPptFP4lXPD8GFVeWCpNO2C1HdQ7HBjJ+dFGP8
         ZRpQamMqXJ9kXhuRCntcUlizbNSODnreklirXkbO0l17FV8RNH/a00UqIviFIQ5tBxF3
         gf3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=abq/JZSAZcKH9qO+Dux+14ymcOyCPcLsqnIBHXTH4u8=;
        b=joBUnCukTIcZ3sBsk+tiC7ZzK4ijiVdw+rqfuUnZKcHZcnGUMnz3D3oFdPGAkH+4bo
         zTsQMVR/ICJwXu4ERnCCdbtOI0uh9L28INhCfsHRu0OiZBjPuvZcv//P5jz44ks525tY
         CBmTVi+NHok211tmHyR1a49z6RyMmOKNBS2KT+LEN6rwrRtbqZQ5WAd8srPeA2ciQlrE
         2kQuvFLQuTYBeSQ6sfZGEnQaBUloLAEywkARxHyEbQleqZWfyPkZBeLqMJgQ35KQRsV4
         dCBGb2zWkgCasEPd7kUpC3dRMz1h+uFf88wLFugPrUkUHnaSxDE83AWbtXV5BQhgbaHg
         23dg==
X-Gm-Message-State: APjAAAXbDFFtPKn/jiVE86pRTPhiz4tFdzuge1O7kXZSpk35ulv3BKOL
        ot+SZpX5thbs6TSVDlvan1g=
X-Google-Smtp-Source: APXvYqzAlr9a5jIbkIvgf5nu/a2QgT5wjEEnY4u6NjGFDEKf9N0yo3eVeK6rAUVzZudQ5kDufE4fgw==
X-Received: by 2002:ac8:7297:: with SMTP id v23mr24911865qto.135.1575900159178;
        Mon, 09 Dec 2019 06:02:39 -0800 (PST)
Received: from localhost.localdomain ([72.53.229.209])
        by smtp.gmail.com with ESMTPSA id h28sm10128023qte.54.2019.12.09.06.02.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2019 06:02:38 -0800 (PST)
From:   Sven Van Asbroeck <thesven73@gmail.com>
X-Google-Original-From: Sven Van Asbroeck <TheSven73@gmail.com>
To:     Lee Jones <lee.jones@linaro.org>, Pavel Machek <pavel@ucw.cz>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Grigoryev Denis <grigoryev@fastwel.ru>,
        Axel Lin <axel.lin@ingics.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Dan Murphy <dmurphy@ti.com>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-leds@vger.kernel.org
Subject: [PATCH v5 1/2] leds: tps6105x: add driver for mfd chip led mode
Date:   Mon,  9 Dec 2019 09:02:33 -0500
Message-Id: <20191209140234.6558-2-TheSven73@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191209140234.6558-1-TheSven73@gmail.com>
References: <20191209140234.6558-1-TheSven73@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

This driver adds support for the led operational mode of the
tps6105x mfd device.

Tree: next-20191118
Acked-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
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

