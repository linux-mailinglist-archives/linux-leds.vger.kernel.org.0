Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 736C836ACDA
	for <lists+linux-leds@lfdr.de>; Mon, 26 Apr 2021 09:19:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232062AbhDZHTS (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 26 Apr 2021 03:19:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232172AbhDZHTS (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 26 Apr 2021 03:19:18 -0400
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D47A2C061574;
        Mon, 26 Apr 2021 00:18:33 -0700 (PDT)
Received: by mail-pl1-x62f.google.com with SMTP id s20so12600741plr.13;
        Mon, 26 Apr 2021 00:18:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=aNe+3A3fR9ErXpEX7+SEfiaWTuDgeUeDk5z1TRFa6UM=;
        b=O5UlCKW17P6pxA9Dw1S2dIRBZUYHigAz4QEBWplo7z3bRx2urDnUebwVjDT0IESPnQ
         5QRQvcTBg3kEGpRZTO9OTk/8ZxUNFjLnH3RMP1qtsbB8HA6GwH8mDTYqteo5z6IsGsbh
         jbQ4Xo87pKOgbGrd2qGAjqfVtqtEbibD/zqgfBXa3XFBPExPrn3khcwyE2qp5WW2bzVX
         V6ZO0fyBIvCmof6w+RyHYz0FobXbwuTP9iNLtBgmRq9BWwP5nBTLeFkmU1Q8op+9/YIW
         6beQ3DN81fIQ/AG9z6Xz6Eyq+GIFe/Ug/YmgFxNsMd5pvUp4afxzpq6/xANSg22ITPUH
         e1ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=aNe+3A3fR9ErXpEX7+SEfiaWTuDgeUeDk5z1TRFa6UM=;
        b=T5eYAPAMYFGWEKgif++AqRh6jqamQCf6Einbqf7/DMBBcaabhPOcpLtsPishQBpVCa
         F/KRO8fRPMroMBFrGxyZRM61h3EzxiGx1TxnDIrRAkIFb8fAOxwG8eI83nTz8mlanZ0V
         u3sBI+PIJRTOnWfbgFoFoWxU16y7u+i2lipIwhFphMUtGnHVP9TAw/O2SxETYtjpE6Tu
         r1M3SI5St5zJYufoM0MQdBpCRN+lU+zbsSn2rdPcHbWUk70QY3MnVUjY3YMOcOhleftR
         R7twSgvqtYV1MboQsIrHQk/kWdom490mHc8+5wooHQ4WCxCiJwZW23jaEnlgOy6JAPk3
         KMiA==
X-Gm-Message-State: AOAM531luUHh69awWLGH4+WM5gujl8uw9Cgi6u2mnAw0lSM0C0g7dKYs
        vT77DoEpUUfW1YAnjqhyg4bFO36iNs5VaA==
X-Google-Smtp-Source: ABdhPJxYf6jZhmaLTBYcYM6+YrtaZjxdCeO+w9A6RR1leuZcgp/O43c5eT1YVlTxdI389nSeHU5J5A==
X-Received: by 2002:a17:90a:7e02:: with SMTP id i2mr12832281pjl.58.1619421513411;
        Mon, 26 Apr 2021 00:18:33 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:492:3af5:75cd:677a:81f7:a9fe])
        by smtp.gmail.com with ESMTPSA id u21sm9848952pfm.89.2021.04.26.00.18.29
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 26 Apr 2021 00:18:32 -0700 (PDT)
From:   cy_huang <u0084500@gmail.com>
To:     lee.jones@linaro.org, lgirdwood@gmail.com, broonie@kernel.org,
        daniel.thompson@linaro.org, jingoohan1@gmail.com,
        b.zolnierkie@samsung.com, pavel@ucw.cz, robh+dt@kernel.org
Cc:     dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, cy_huang@richtek.com
Subject: [RESEND PATCH v6 4/4] backlight: rt4831: Adds support for Richtek RT4831 backlight
Date:   Mon, 26 Apr 2021 15:18:11 +0800
Message-Id: <1619421491-31494-4-git-send-email-u0084500@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1619421491-31494-1-git-send-email-u0084500@gmail.com>
References: <1619421491-31494-1-git-send-email-u0084500@gmail.com>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

From: ChiYuan Huang <cy_huang@richtek.com>

Adds support for Richtek RT4831 backlight.

Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
---
Resend this v6 patch series to loop devicetree reviewers.

For next, if the typo in Kconfig 'common' to 'commonly' can be added the below line
Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
---
 drivers/video/backlight/Kconfig            |   8 ++
 drivers/video/backlight/Makefile           |   1 +
 drivers/video/backlight/rt4831-backlight.c | 203 +++++++++++++++++++++++++++++
 3 files changed, 212 insertions(+)
 create mode 100644 drivers/video/backlight/rt4831-backlight.c

diff --git a/drivers/video/backlight/Kconfig b/drivers/video/backlight/Kconfig
index d83c87b..de96441 100644
--- a/drivers/video/backlight/Kconfig
+++ b/drivers/video/backlight/Kconfig
@@ -289,6 +289,14 @@ config BACKLIGHT_QCOM_WLED
 	  If you have the Qualcomm PMIC, say Y to enable a driver for the
 	  WLED block. Currently it supports PM8941 and PMI8998.
 
+config BACKLIGHT_RT4831
+	tristate "Richtek RT4831 Backlight Driver"
+	depends on MFD_RT4831
+	help
+	  This enables support for Richtek RT4831 Backlight driver.
+	  It's common used to drive the display WLED. There're four channels
+	  inisde, and each channel can provide up to 30mA current.
+
 config BACKLIGHT_SAHARA
 	tristate "Tabletkiosk Sahara Touch-iT Backlight Driver"
 	depends on X86
diff --git a/drivers/video/backlight/Makefile b/drivers/video/backlight/Makefile
index 685f3f1..cae2c83 100644
--- a/drivers/video/backlight/Makefile
+++ b/drivers/video/backlight/Makefile
@@ -49,6 +49,7 @@ obj-$(CONFIG_BACKLIGHT_PANDORA)		+= pandora_bl.o
 obj-$(CONFIG_BACKLIGHT_PCF50633)	+= pcf50633-backlight.o
 obj-$(CONFIG_BACKLIGHT_PWM)		+= pwm_bl.o
 obj-$(CONFIG_BACKLIGHT_QCOM_WLED)	+= qcom-wled.o
+obj-$(CONFIG_BACKLIGHT_RT4831)		+= rt4831-backlight.o
 obj-$(CONFIG_BACKLIGHT_SAHARA)		+= kb3886_bl.o
 obj-$(CONFIG_BACKLIGHT_SKY81452)	+= sky81452-backlight.o
 obj-$(CONFIG_BACKLIGHT_TOSA)		+= tosa_bl.o
diff --git a/drivers/video/backlight/rt4831-backlight.c b/drivers/video/backlight/rt4831-backlight.c
new file mode 100644
index 00000000..42155c7
--- /dev/null
+++ b/drivers/video/backlight/rt4831-backlight.c
@@ -0,0 +1,203 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include <dt-bindings/leds/rt4831-backlight.h>
+#include <linux/backlight.h>
+#include <linux/bitops.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/property.h>
+#include <linux/regmap.h>
+
+#define RT4831_REG_BLCFG	0x02
+#define RT4831_REG_BLDIML	0x04
+#define RT4831_REG_ENABLE	0x08
+
+#define RT4831_BLMAX_BRIGHTNESS	2048
+
+#define RT4831_BLOVP_MASK	GENMASK(7, 5)
+#define RT4831_BLOVP_SHIFT	5
+#define RT4831_BLPWMEN_MASK	BIT(0)
+#define RT4831_BLEN_MASK	BIT(4)
+#define RT4831_BLCH_MASK	GENMASK(3, 0)
+#define RT4831_BLDIML_MASK	GENMASK(2, 0)
+#define RT4831_BLDIMH_MASK	GENMASK(10, 3)
+#define RT4831_BLDIMH_SHIFT	3
+
+struct rt4831_priv {
+	struct device *dev;
+	struct regmap *regmap;
+	struct backlight_device *bl;
+};
+
+static int rt4831_bl_update_status(struct backlight_device *bl_dev)
+{
+	struct rt4831_priv *priv = bl_get_data(bl_dev);
+	int brightness = backlight_get_brightness(bl_dev);
+	unsigned int enable = brightness ? RT4831_BLEN_MASK : 0;
+	u8 v[2];
+	int ret;
+
+	if (brightness) {
+		v[0] = (brightness - 1) & RT4831_BLDIML_MASK;
+		v[1] = ((brightness - 1) & RT4831_BLDIMH_MASK) >> RT4831_BLDIMH_SHIFT;
+
+		ret = regmap_raw_write(priv->regmap, RT4831_REG_BLDIML, v, sizeof(v));
+		if (ret)
+			return ret;
+	}
+
+	return regmap_update_bits(priv->regmap, RT4831_REG_ENABLE, RT4831_BLEN_MASK, enable);
+
+}
+
+static int rt4831_bl_get_brightness(struct backlight_device *bl_dev)
+{
+	struct rt4831_priv *priv = bl_get_data(bl_dev);
+	unsigned int val;
+	u8 v[2];
+	int ret;
+
+	ret = regmap_read(priv->regmap, RT4831_REG_ENABLE, &val);
+	if (ret)
+		return ret;
+
+	if (!(val & RT4831_BLEN_MASK))
+		return 0;
+
+	ret = regmap_raw_read(priv->regmap, RT4831_REG_BLDIML, v, sizeof(v));
+	if (ret)
+		return ret;
+
+	ret = (v[1] << RT4831_BLDIMH_SHIFT) + (v[0] & RT4831_BLDIML_MASK) + 1;
+
+	return ret;
+}
+
+static const struct backlight_ops rt4831_bl_ops = {
+	.options = BL_CORE_SUSPENDRESUME,
+	.update_status = rt4831_bl_update_status,
+	.get_brightness = rt4831_bl_get_brightness,
+};
+
+static int rt4831_parse_backlight_properties(struct rt4831_priv *priv,
+					     struct backlight_properties *bl_props)
+{
+	struct device *dev = priv->dev;
+	u8 propval;
+	u32 brightness;
+	unsigned int val = 0;
+	int ret;
+
+	/* common properties */
+	ret = device_property_read_u32(dev, "max-brightness", &brightness);
+	if (ret)
+		brightness = RT4831_BLMAX_BRIGHTNESS;
+
+	bl_props->max_brightness = min_t(u32, brightness, RT4831_BLMAX_BRIGHTNESS);
+
+	ret = device_property_read_u32(dev, "default-brightness", &brightness);
+	if (ret)
+		brightness = bl_props->max_brightness;
+
+	bl_props->brightness = min_t(u32, brightness, bl_props->max_brightness);
+
+	/* vendor properties */
+	if (device_property_read_bool(dev, "richtek,pwm-enable"))
+		val = RT4831_BLPWMEN_MASK;
+
+	ret = regmap_update_bits(priv->regmap, RT4831_REG_BLCFG, RT4831_BLPWMEN_MASK, val);
+	if (ret)
+		return ret;
+
+	ret = device_property_read_u8(dev, "richtek,bled-ovp-sel", &propval);
+	if (ret)
+		propval = RT4831_BLOVPLVL_21V;
+
+	propval = min_t(u8, propval, RT4831_BLOVPLVL_29V);
+	ret = regmap_update_bits(priv->regmap, RT4831_REG_BLCFG, RT4831_BLOVP_MASK,
+				 propval << RT4831_BLOVP_SHIFT);
+	if (ret)
+		return ret;
+
+	ret = device_property_read_u8(dev, "richtek,channel-use", &propval);
+	if (ret) {
+		dev_err(dev, "richtek,channel-use DT property missing\n");
+		return ret;
+	}
+
+	if (!(propval & RT4831_BLCH_MASK)) {
+		dev_err(dev, "No channel specified\n");
+		return -EINVAL;
+	}
+
+	return regmap_update_bits(priv->regmap, RT4831_REG_ENABLE, RT4831_BLCH_MASK, propval);
+}
+
+static int rt4831_bl_probe(struct platform_device *pdev)
+{
+	struct rt4831_priv *priv;
+	struct backlight_properties bl_props = { .type = BACKLIGHT_RAW,
+						 .scale = BACKLIGHT_SCALE_LINEAR };
+	int ret;
+
+	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->dev = &pdev->dev;
+
+	priv->regmap = dev_get_regmap(pdev->dev.parent, NULL);
+	if (!priv->regmap) {
+		dev_err(&pdev->dev, "Failed to init regmap\n");
+		return -ENODEV;
+	}
+
+	ret = rt4831_parse_backlight_properties(priv, &bl_props);
+	if (ret) {
+		dev_err(&pdev->dev, "Failed to parse backlight properties\n");
+		return ret;
+	}
+
+	priv->bl = devm_backlight_device_register(&pdev->dev, pdev->name, &pdev->dev, priv,
+						  &rt4831_bl_ops, &bl_props);
+	if (IS_ERR(priv->bl)) {
+		dev_err(&pdev->dev, "Failed to register backlight\n");
+		return PTR_ERR(priv->bl);
+	}
+
+	backlight_update_status(priv->bl);
+	platform_set_drvdata(pdev, priv);
+
+	return 0;
+}
+
+static int rt4831_bl_remove(struct platform_device *pdev)
+{
+	struct rt4831_priv *priv = platform_get_drvdata(pdev);
+	struct backlight_device *bl_dev = priv->bl;
+
+	bl_dev->props.brightness = 0;
+	backlight_update_status(priv->bl);
+
+	return 0;
+}
+
+static const struct of_device_id __maybe_unused rt4831_bl_of_match[] = {
+	{ .compatible = "richtek,rt4831-backlight", },
+	{}
+};
+MODULE_DEVICE_TABLE(of, rt4831_bl_of_match);
+
+static struct platform_driver rt4831_bl_driver = {
+	.driver = {
+		.name = "rt4831-backlight",
+		.of_match_table = rt4831_bl_of_match,
+	},
+	.probe = rt4831_bl_probe,
+	.remove = rt4831_bl_remove,
+};
+module_platform_driver(rt4831_bl_driver);
+
+MODULE_AUTHOR("ChiYuan Huang <cy_huang@richtek.com>");
+MODULE_LICENSE("GPL v2");
-- 
2.7.4

