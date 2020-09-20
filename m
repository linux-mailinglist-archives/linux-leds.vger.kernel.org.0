Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3AAE271197
	for <lists+linux-leds@lfdr.de>; Sun, 20 Sep 2020 02:25:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726788AbgITAZE (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 19 Sep 2020 20:25:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726817AbgITAZE (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 19 Sep 2020 20:25:04 -0400
Received: from mail.nic.cz (lists.nic.cz [IPv6:2001:1488:800:400::400])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37223C0613D0
        for <linux-leds@vger.kernel.org>; Sat, 19 Sep 2020 17:25:04 -0700 (PDT)
Received: from dellmb.labs.office.nic.cz (unknown [IPv6:2001:1488:fffe:6:cac7:3539:7f1f:463])
        by mail.nic.cz (Postfix) with ESMTP id 310E5140A47;
        Sun, 20 Sep 2020 02:25:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
        t=1600561502; bh=Ao7+J5az9H50oGgl98+iP5TJOMIQsye7USnc/OZrvnM=;
        h=From:To:Date;
        b=Z0ko/LNW5V6Bk40OMiez/TFPdHOPD5EH75TY1cR8Mlj7vCr7im15Pd3eHJMwagpp7
         HPsRUaG96m+bd9gXipLB2qAJw0W91qnZn78UnnjhuLiNm/bnuUGZnlzQsBBiboMv2O
         fGeOZvY/HBQhYfz5KHVs+AbEpJjZEKblNpnkVCRg=
From:   =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>
To:     linux-leds@vger.kernel.org
Cc:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>,
        Peter Meerwald <p.meerwald@bct-electronic.com>,
        Ricardo Ribalda <ribalda@kernel.org>,
        Zahari Petkov <zahari@balena.io>
Subject: [PATCH leds 3/7] leds: pca963x: cosmetic: rename variables
Date:   Sun, 20 Sep 2020 02:24:56 +0200
Message-Id: <20200920002500.5851-4-marek.behun@nic.cz>
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

Rename variables chip and pca963x_chip to chipdef and chip,
respectively, so that their names correspond to the names of their
types.

Signed-off-by: Marek Behún <marek.behun@nic.cz>
Cc: Peter Meerwald <p.meerwald@bct-electronic.com>
Cc: Ricardo Ribalda <ribalda@kernel.org>
Cc: Zahari Petkov <zahari@balena.io>
---
 drivers/leds/leds-pca963x.c | 55 +++++++++++++++++++------------------
 1 file changed, 28 insertions(+), 27 deletions(-)

diff --git a/drivers/leds/leds-pca963x.c b/drivers/leds/leds-pca963x.c
index cbb3bf6c044f2..bdb014c76a078 100644
--- a/drivers/leds/leds-pca963x.c
+++ b/drivers/leds/leds-pca963x.c
@@ -285,7 +285,7 @@ static int pca963x_blink_set(struct led_classdev *led_cdev,
 }
 
 static struct pca963x_platform_data *
-pca963x_get_pdata(struct device *dev, struct pca963x_chipdef *chip)
+pca963x_get_pdata(struct device *dev, struct pca963x_chipdef *chipdef)
 {
 	struct pca963x_platform_data *pdata;
 	struct led_info *pca963x_leds;
@@ -293,11 +293,11 @@ pca963x_get_pdata(struct device *dev, struct pca963x_chipdef *chip)
 	int count;
 
 	count = device_get_child_node_count(dev);
-	if (!count || count > chip->n_leds)
+	if (!count || count > chipdef->n_leds)
 		return ERR_PTR(-ENODEV);
 
-	pca963x_leds = devm_kcalloc(dev, chip->n_leds, sizeof(struct led_info),
-				    GFP_KERNEL);
+	pca963x_leds = devm_kcalloc(dev, chipdef->n_leds,
+				    sizeof(struct led_info), GFP_KERNEL);
 	if (!pca963x_leds)
 		return ERR_PTR(-ENOMEM);
 
@@ -307,7 +307,7 @@ pca963x_get_pdata(struct device *dev, struct pca963x_chipdef *chip)
 		int res;
 
 		res = fwnode_property_read_u32(child, "reg", &reg);
-		if ((res != 0) || (reg >= chip->n_leds))
+		if ((res != 0) || (reg >= chipdef->n_leds))
 			continue;
 
 		res = fwnode_property_read_string(child, "label", &led.name);
@@ -325,7 +325,7 @@ pca963x_get_pdata(struct device *dev, struct pca963x_chipdef *chip)
 		return ERR_PTR(-ENOMEM);
 
 	pdata->leds.leds = pca963x_leds;
-	pdata->leds.num_leds = chip->n_leds;
+	pdata->leds.num_leds = chipdef->n_leds;
 
 	/* default to open-drain unless totem pole (push-pull) is specified */
 	if (device_property_read_bool(dev, "nxp,totem-pole"))
@@ -340,8 +340,8 @@ pca963x_get_pdata(struct device *dev, struct pca963x_chipdef *chip)
 		pdata->blink_type = PCA963X_SW_BLINK;
 
 	if (device_property_read_u32(dev, "nxp,period-scale",
-				     &chip->scaling))
-		chip->scaling = 1000;
+				     &chipdef->scaling))
+		chipdef->scaling = 1000;
 
 	/* default to non-inverted output, unless inverted is specified */
 	if (device_property_read_bool(dev, "nxp,inverted-out"))
@@ -365,17 +365,17 @@ static int pca963x_probe(struct i2c_client *client,
 			 const struct i2c_device_id *id)
 {
 	struct device *dev = &client->dev;
-	struct pca963x *pca963x_chip;
-	struct pca963x_led *pca963x;
+	struct pca963x_chipdef *chipdef;
 	struct pca963x_platform_data *pdata;
-	struct pca963x_chipdef *chip;
+	struct pca963x_led *pca963x;
+	struct pca963x *chip;
 	int i, err;
 
-	chip = &pca963x_chipdefs[id->driver_data];
+	chipdef = &pca963x_chipdefs[id->driver_data];
 	pdata = dev_get_platdata(dev);
 
 	if (!pdata) {
-		pdata = pca963x_get_pdata(dev, chip);
+		pdata = pca963x_get_pdata(dev, chipdef);
 		if (IS_ERR(pdata)) {
 			dev_warn(dev, "could not parse configuration\n");
 			pdata = NULL;
@@ -383,32 +383,33 @@ static int pca963x_probe(struct i2c_client *client,
 	}
 
 	if (pdata && (pdata->leds.num_leds < 1 ||
-		      pdata->leds.num_leds > chip->n_leds)) {
-		dev_err(dev, "board info must claim 1-%d LEDs", chip->n_leds);
+		      pdata->leds.num_leds > chipdef->n_leds)) {
+		dev_err(dev, "board info must claim 1-%d LEDs",
+			chipdef->n_leds);
 		return -EINVAL;
 	}
 
-	pca963x_chip = devm_kzalloc(dev, sizeof(*pca963x_chip), GFP_KERNEL);
-	if (!pca963x_chip)
+	chip = devm_kzalloc(dev, sizeof(*chip), GFP_KERNEL);
+	if (!chip)
 		return -ENOMEM;
-	pca963x = devm_kcalloc(dev, chip->n_leds, sizeof(*pca963x), GFP_KERNEL);
+	pca963x = devm_kcalloc(dev, chipdef->n_leds, sizeof(*pca963x), GFP_KERNEL);
 	if (!pca963x)
 		return -ENOMEM;
 
-	i2c_set_clientdata(client, pca963x_chip);
+	i2c_set_clientdata(client, chip);
 
-	mutex_init(&pca963x_chip->mutex);
-	pca963x_chip->chipdef = chip;
-	pca963x_chip->client = client;
-	pca963x_chip->leds = pca963x;
+	mutex_init(&chip->mutex);
+	chip->chipdef = chipdef;
+	chip->client = client;
+	chip->leds = pca963x;
 
 	/* Turn off LEDs by default*/
-	for (i = 0; i < chip->n_leds / 4; i++)
-		i2c_smbus_write_byte_data(client, chip->ledout_base + i, 0x00);
+	for (i = 0; i < chipdef->n_leds / 4; i++)
+		i2c_smbus_write_byte_data(client, chipdef->ledout_base + i, 0x00);
 
-	for (i = 0; i < chip->n_leds; i++) {
+	for (i = 0; i < chipdef->n_leds; i++) {
 		pca963x[i].led_num = i;
-		pca963x[i].chip = pca963x_chip;
+		pca963x[i].chip = chip;
 
 		/* Platform data can specify LED names and default triggers */
 		if (pdata && i < pdata->leds.num_leds) {
-- 
2.26.2

