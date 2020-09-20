Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 94BB1271199
	for <lists+linux-leds@lfdr.de>; Sun, 20 Sep 2020 02:25:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726831AbgITAZF (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 19 Sep 2020 20:25:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726817AbgITAZF (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 19 Sep 2020 20:25:05 -0400
Received: from mail.nic.cz (lists.nic.cz [IPv6:2001:1488:800:400::400])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33374C061755
        for <linux-leds@vger.kernel.org>; Sat, 19 Sep 2020 17:25:05 -0700 (PDT)
Received: from dellmb.labs.office.nic.cz (unknown [IPv6:2001:1488:fffe:6:cac7:3539:7f1f:463])
        by mail.nic.cz (Postfix) with ESMTP id CA480140A8B;
        Sun, 20 Sep 2020 02:25:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
        t=1600561503; bh=rsJaW4cj89+RrrUWf3MkN1g8ye0CTHUXepOEYWxNWYI=;
        h=From:To:Date;
        b=s5wsHZ6O/69WeJCVJ2g7N15W1Ak55ruo1F1MEo+QA2lzQR1j/aP+60U1bEUT8KUVt
         pSFsVLlWtKZezdmuVhOB4m1vqTVixtAE+3Gx0d28dz/KFumeW1prNS+Ile9VlXbHWG
         EOO43rZSj1YcbQ/r0GkqnTPy5HHptCAIWKiwnqII=
From:   =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>
To:     linux-leds@vger.kernel.org
Cc:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>,
        Peter Meerwald <p.meerwald@bct-electronic.com>,
        Ricardo Ribalda <ribalda@kernel.org>,
        Zahari Petkov <zahari@balena.io>
Subject: [PATCH leds 6/7] leds: pca963x: register LEDs immediately after parsing, get rid of platdata
Date:   Sun, 20 Sep 2020 02:24:59 +0200
Message-Id: <20200920002500.5851-7-marek.behun@nic.cz>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200920002500.5851-1-marek.behun@nic.cz>
References: <20200920002500.5851-1-marek.behun@nic.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.nic.cz
X-Spam-Status: No, score=0.00
X-Spamd-Bar: /
X-Virus-Scanned: clamav-milter 0.102.2 at mail
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Register LEDs immediately after parsing their properties.
This allows us to get rid of platdata, and since no one in tree uses
header linux/platform_data/leds-pca963x.h, remove it.

Signed-off-by: Marek Behún <marek.behun@nic.cz>
Cc: Peter Meerwald <p.meerwald@bct-electronic.com>
Cc: Ricardo Ribalda <ribalda@kernel.org>
Cc: Zahari Petkov <zahari@balena.io>
---
 drivers/leds/leds-pca963x.c                | 188 ++++++++-------------
 include/linux/platform_data/leds-pca963x.h |  35 ----
 2 files changed, 71 insertions(+), 152 deletions(-)
 delete mode 100644 include/linux/platform_data/leds-pca963x.h

diff --git a/drivers/leds/leds-pca963x.c b/drivers/leds/leds-pca963x.c
index 73dc00787beed..5083ccce1a519 100644
--- a/drivers/leds/leds-pca963x.c
+++ b/drivers/leds/leds-pca963x.c
@@ -32,7 +32,6 @@
 #include <linux/property.h>
 #include <linux/slab.h>
 #include <linux/of.h>
-#include <linux/platform_data/leds-pca963x.h>
 
 /* LED select registers determine the source that drives LED outputs */
 #define PCA963X_LED_OFF		0x0	/* LED driver off */
@@ -102,7 +101,6 @@ struct pca963x_led {
 	struct pca963x *chip;
 	struct led_classdev led_cdev;
 	int led_num; /* 0 .. 15 potentially */
-	char name[32];
 	u8 gdc;
 	u8 gfrq;
 };
@@ -284,72 +282,85 @@ static int pca963x_blink_set(struct led_classdev *led_cdev,
 	return 0;
 }
 
-static struct pca963x_platform_data *
-pca963x_get_pdata(struct device *dev, struct pca963x_chipdef *chipdef)
+static int pca963x_register_leds(struct i2c_client *client,
+				 struct pca963x *chip)
 {
-	struct pca963x_platform_data *pdata;
-	struct led_info *pca963x_leds;
+	struct pca963x_chipdef *chipdef = chip->chipdef;
+	struct pca963x_led *led = chip->leds;
+	struct device *dev = &client->dev;
 	struct fwnode_handle *child;
-	int count;
+	const char *name;
+	char label[64];
+	bool hw_blink;
+	s32 mode2;
+	u32 reg;
+	int ret;
 
-	count = device_get_child_node_count(dev);
-	if (!count || count > chipdef->n_leds)
-		return ERR_PTR(-ENODEV);
+	if (device_property_read_u32(dev, "nxp,period-scale",
+				     &chipdef->scaling))
+		chipdef->scaling = 1000;
 
-	pca963x_leds = devm_kcalloc(dev, chipdef->n_leds,
-				    sizeof(struct led_info), GFP_KERNEL);
-	if (!pca963x_leds)
-		return ERR_PTR(-ENOMEM);
+	hw_blink = device_property_read_bool(dev, "nxp,hw-blink");
 
-	device_for_each_child_node(dev, child) {
-		struct led_info led = {};
-		u32 reg;
-		int res;
+	mode2 = i2c_smbus_read_byte_data(client, PCA963X_MODE2);
+	if (mode2 < 0)
+		return mode2;
 
-		res = fwnode_property_read_u32(child, "reg", &reg);
-		if ((res != 0) || (reg >= chipdef->n_leds))
-			continue;
+	/* default to open-drain unless totem pole (push-pull) is specified */
+	if (device_property_read_bool(dev, "nxp,totem-pole"))
+		mode2 |= PCA963X_MODE2_OUTDRV;
+	else
+		mode2 &= ~PCA963X_MODE2_OUTDRV;
 
-		res = fwnode_property_read_string(child, "label", &led.name);
-		if ((res != 0) && is_of_node(child))
-			led.name = to_of_node(child)->name;
+	/* default to non-inverted output, unless inverted is specified */
+	if (device_property_read_bool(dev, "nxp,inverted-out"))
+		mode2 |= PCA963X_MODE2_INVRT;
+	else
+		mode2 &= ~PCA963X_MODE2_INVRT;
 
-		fwnode_property_read_string(child, "linux,default-trigger",
-					    &led.default_trigger);
+	ret = i2c_smbus_write_byte_data(client, PCA963X_MODE2, mode2);
+	if (ret < 0)
+		return ret;
 
-		pca963x_leds[reg] = led;
-	}
-	pdata = devm_kzalloc(dev, sizeof(struct pca963x_platform_data),
-			     GFP_KERNEL);
-	if (!pdata)
-		return ERR_PTR(-ENOMEM);
+	device_for_each_child_node(dev, child) {
+		ret = fwnode_property_read_u32(child, "reg", &reg);
+		if (ret || reg >= chipdef->n_leds) {
+			dev_err(dev, "Invalid 'reg' property for node %pfw\n",
+				child);
+			ret = -EINVAL;
+			goto err;
+		}
 
-	pdata->leds.leds = pca963x_leds;
-	pdata->leds.num_leds = chipdef->n_leds;
+		ret = fwnode_property_read_string(child, "label", &name);
+		if (!fwnode_property_read_string(child, "label", &name))
+			snprintf(label, sizeof(label), "pca963x:%s", name);
+		else
+			snprintf(label, sizeof(label), "pca963x::");
 
-	/* default to open-drain unless totem pole (push-pull) is specified */
-	if (device_property_read_bool(dev, "nxp,totem-pole"))
-		pdata->outdrv = PCA963X_TOTEM_POLE;
-	else
-		pdata->outdrv = PCA963X_OPEN_DRAIN;
+		fwnode_property_read_string(child, "linux,default-trigger",
+					    &led->led_cdev.default_trigger);
 
-	/* default to software blinking unless hardware blinking is specified */
-	if (device_property_read_bool(dev, "nxp,hw-blink"))
-		pdata->blink_type = PCA963X_HW_BLINK;
-	else
-		pdata->blink_type = PCA963X_SW_BLINK;
+		led->led_num = reg;
+		led->chip = chip;
+		led->led_cdev.name = label;
+		led->led_cdev.brightness_set_blocking = pca963x_led_set;
+		if (hw_blink)
+			led->led_cdev.blink_set = pca963x_blink_set;
 
-	if (device_property_read_u32(dev, "nxp,period-scale",
-				     &chipdef->scaling))
-		chipdef->scaling = 1000;
+		ret = devm_led_classdev_register(dev, &led->led_cdev);
+		if (ret) {
+			dev_err(dev, "Failed to register LED for node %pfw\n",
+				child);
+			goto err;
+		}
 
-	/* default to non-inverted output, unless inverted is specified */
-	if (device_property_read_bool(dev, "nxp,inverted-out"))
-		pdata->dir = PCA963X_INVERTED;
-	else
-		pdata->dir = PCA963X_NORMAL;
+		++led;
+	}
 
-	return pdata;
+	return 0;
+err:
+	fwnode_handle_put(child);
+	return ret;
 }
 
 static const struct of_device_id of_pca963x_match[] = {
@@ -366,30 +377,19 @@ static int pca963x_probe(struct i2c_client *client,
 {
 	struct device *dev = &client->dev;
 	struct pca963x_chipdef *chipdef;
-	struct pca963x_platform_data *pdata;
 	struct pca963x *chip;
-	int i, err;
+	int i, count;
 
 	chipdef = &pca963x_chipdefs[id->driver_data];
-	pdata = dev_get_platdata(dev);
 
-	if (!pdata) {
-		pdata = pca963x_get_pdata(dev, chipdef);
-		if (IS_ERR(pdata)) {
-			dev_warn(dev, "could not parse configuration\n");
-			pdata = NULL;
-		}
-	}
-
-	if (pdata && (pdata->leds.num_leds < 1 ||
-		      pdata->leds.num_leds > chipdef->n_leds)) {
-		dev_err(dev, "board info must claim 1-%d LEDs",
-			chipdef->n_leds);
+	count = device_get_child_node_count(dev);
+	if (!count || count > chipdef->n_leds) {
+		dev_err(dev, "Node %pfw must define between 1 and %d LEDs\n",
+			dev_fwnode(dev), chipdef->n_leds);
 		return -EINVAL;
 	}
 
-	chip = devm_kzalloc(dev, struct_size(chip, leds, chipdef->n_leds),
-			    GFP_KERNEL);
+	chip = devm_kzalloc(dev, struct_size(chip, leds, count), GFP_KERNEL);
 	if (!chip)
 		return -ENOMEM;
 
@@ -403,56 +403,10 @@ static int pca963x_probe(struct i2c_client *client,
 	for (i = 0; i < chipdef->n_leds / 4; i++)
 		i2c_smbus_write_byte_data(client, chipdef->ledout_base + i, 0x00);
 
-	for (i = 0; i < chipdef->n_leds; i++) {
-		struct pca963x_led *led = &chip->leds[i];
-
-		led->led_num = i;
-		led->chip = chip;
-
-		/* Platform data can specify LED names and default triggers */
-		if (pdata && i < pdata->leds.num_leds) {
-			if (pdata->leds.leds[i].name)
-				snprintf(led->name,
-					 sizeof(led->name), "pca963x:%s",
-					 pdata->leds.leds[i].name);
-			if (pdata->leds.leds[i].default_trigger)
-				led->led_cdev.default_trigger =
-					pdata->leds.leds[i].default_trigger;
-		}
-		if (!pdata || i >= pdata->leds.num_leds ||
-						!pdata->leds.leds[i].name)
-			snprintf(led->name, sizeof(led->name),
-				 "pca963x:%d:%.2x:%d", client->adapter->nr,
-				 client->addr, i);
-
-		led->led_cdev.name = led->name;
-		led->led_cdev.brightness_set_blocking = pca963x_led_set;
-
-		if (pdata && pdata->blink_type == PCA963X_HW_BLINK)
-			led->led_cdev.blink_set = pca963x_blink_set;
-
-		err = devm_led_classdev_register(dev, &led->led_cdev);
-		if (err < 0)
-			return err;
-	}
-
 	/* Disable LED all-call address, and power down initially */
 	i2c_smbus_write_byte_data(client, PCA963X_MODE1, BIT(4));
 
-	if (pdata) {
-		u8 mode2 = i2c_smbus_read_byte_data(client, PCA963X_MODE2);
-		/* Configure output: open-drain or totem pole (push-pull) */
-		if (pdata->outdrv == PCA963X_OPEN_DRAIN)
-			mode2 &= ~PCA963X_MODE2_OUTDRV;
-		else
-			mode2 |= PCA963X_MODE2_OUTDRV;
-		/* Configure direction: normal or inverted */
-		if (pdata->dir == PCA963X_INVERTED)
-			mode2 |= PCA963X_MODE2_INVRT;
-		i2c_smbus_write_byte_data(client, PCA963X_MODE2, mode2);
-	}
-
-	return 0;
+	return pca963x_register_leds(client, chip);
 }
 
 static struct i2c_driver pca963x_driver = {
diff --git a/include/linux/platform_data/leds-pca963x.h b/include/linux/platform_data/leds-pca963x.h
deleted file mode 100644
index 6091337ce4bfb..0000000000000
--- a/include/linux/platform_data/leds-pca963x.h
+++ /dev/null
@@ -1,35 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * PCA963X LED chip driver.
- *
- * Copyright 2012 bct electronic GmbH
- * Copyright 2013 Qtechnology A/S
- */
-
-#ifndef __LINUX_PCA963X_H
-#define __LINUX_PCA963X_H
-#include <linux/leds.h>
-
-enum pca963x_outdrv {
-	PCA963X_OPEN_DRAIN,
-	PCA963X_TOTEM_POLE, /* aka push-pull */
-};
-
-enum pca963x_blink_type {
-	PCA963X_SW_BLINK,
-	PCA963X_HW_BLINK,
-};
-
-enum pca963x_direction {
-	PCA963X_NORMAL,
-	PCA963X_INVERTED,
-};
-
-struct pca963x_platform_data {
-	struct led_platform_data leds;
-	enum pca963x_outdrv outdrv;
-	enum pca963x_blink_type blink_type;
-	enum pca963x_direction dir;
-};
-
-#endif /* __LINUX_PCA963X_H*/
-- 
2.26.2

