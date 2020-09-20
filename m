Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3EAEC271194
	for <lists+linux-leds@lfdr.de>; Sun, 20 Sep 2020 02:25:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726794AbgITAZE (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 19 Sep 2020 20:25:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726788AbgITAZE (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 19 Sep 2020 20:25:04 -0400
Received: from mail.nic.cz (mail.nic.cz [IPv6:2001:1488:800:400::400])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24EFAC061755
        for <linux-leds@vger.kernel.org>; Sat, 19 Sep 2020 17:25:04 -0700 (PDT)
Received: from dellmb.labs.office.nic.cz (unknown [IPv6:2001:1488:fffe:6:cac7:3539:7f1f:463])
        by mail.nic.cz (Postfix) with ESMTP id C6E681409FE;
        Sun, 20 Sep 2020 02:25:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
        t=1600561501; bh=c36vTawmxUEpQjE8ats+SMT3UvI5xX5w3mAfE+naLCI=;
        h=From:To:Date;
        b=D/J1QSE+BEP2V//+k1bk3oemnVdkM1XW1fuWAWbc7ewnjmENE85d68+HQ2knNDhDw
         Al5rkXiuCF6VvuJR04phHwgmqgYEBlGckj4xiZ8BM+ILk9cuLcc8MIx2nxFks+WiMR
         UT/LceajvJbuB4BZcHmPZ+Bb65sEoMRX3rdt1BsI=
From:   =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>
To:     linux-leds@vger.kernel.org
Cc:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>,
        Peter Meerwald <p.meerwald@bct-electronic.com>,
        Ricardo Ribalda <ribalda@kernel.org>,
        Zahari Petkov <zahari@balena.io>
Subject: [PATCH leds 1/7] leds: pca963x: cosmetic: use helper variables, better indentation
Date:   Sun, 20 Sep 2020 02:24:54 +0200
Message-Id: <20200920002500.5851-2-marek.behun@nic.cz>
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

Use helper variables: instead of writing &client->dev at many places,
write only dev. The same with pca963x->chip->chipdef,
pca963x->chip->client).

Use helper variable u8 val for i2c_smbus_write_byte_data, for better
indentation.

Indent better on various places.

Signed-off-by: Marek Behún <marek.behun@nic.cz>
Cc: Peter Meerwald <p.meerwald@bct-electronic.com>
Cc: Ricardo Ribalda <ribalda@kernel.org>
Cc: Zahari Petkov <zahari@balena.io>
---
 drivers/leds/leds-pca963x.c | 139 ++++++++++++++++++------------------
 1 file changed, 71 insertions(+), 68 deletions(-)

diff --git a/drivers/leds/leds-pca963x.c b/drivers/leds/leds-pca963x.c
index d288acbc99c7c..c03871f92fecc 100644
--- a/drivers/leds/leds-pca963x.c
+++ b/drivers/leds/leds-pca963x.c
@@ -116,35 +116,38 @@ struct pca963x_led {
 };
 
 static int pca963x_brightness(struct pca963x_led *pca963x,
-			       enum led_brightness brightness)
+			      enum led_brightness brightness)
 {
-	u8 ledout_addr = pca963x->chip->chipdef->ledout_base
-		+ (pca963x->led_num / 4);
-	u8 ledout;
-	int shift = 2 * (pca963x->led_num % 4);
-	u8 mask = 0x3 << shift;
+	struct i2c_client *client = pca963x->chip->client;
+	struct pca963x_chipdef *chipdef = pca963x->chip->chipdef;
+	u8 ledout_addr, ledout, mask, val;
+	int shift;
 	int ret;
 
-	ledout = i2c_smbus_read_byte_data(pca963x->chip->client, ledout_addr);
+	ledout_addr = chipdef->ledout_base + (pca963x->led_num / 4);
+	shift = 2 * (pca963x->led_num % 4);
+	mask = 0x3 << shift;
+	ledout = i2c_smbus_read_byte_data(client, ledout_addr);
+
 	switch (brightness) {
 	case LED_FULL:
-		ret = i2c_smbus_write_byte_data(pca963x->chip->client,
-			ledout_addr,
-			(ledout & ~mask) | (PCA963X_LED_ON << shift));
+		val = (ledout & ~mask) | (PCA963X_LED_ON << shift);
+		ret = i2c_smbus_write_byte_data(client, ledout_addr, val);
 		break;
 	case LED_OFF:
-		ret = i2c_smbus_write_byte_data(pca963x->chip->client,
-			ledout_addr, ledout & ~mask);
+		val = ledout & ~mask;
+		ret = i2c_smbus_write_byte_data(client, ledout_addr, val);
 		break;
 	default:
-		ret = i2c_smbus_write_byte_data(pca963x->chip->client,
-			PCA963X_PWM_BASE + pca963x->led_num,
-			brightness);
+		ret = i2c_smbus_write_byte_data(client,
+						PCA963X_PWM_BASE +
+						pca963x->led_num,
+						brightness);
 		if (ret < 0)
 			return ret;
-		ret = i2c_smbus_write_byte_data(pca963x->chip->client,
-			ledout_addr,
-			(ledout & ~mask) | (PCA963X_LED_PWM << shift));
+
+		val = (ledout & ~mask) | (PCA963X_LED_PWM << shift);
+		ret = i2c_smbus_write_byte_data(client, ledout_addr, val);
 		break;
 	}
 
@@ -153,36 +156,40 @@ static int pca963x_brightness(struct pca963x_led *pca963x,
 
 static void pca963x_blink(struct pca963x_led *pca963x)
 {
-	u8 ledout_addr = pca963x->chip->chipdef->ledout_base +
-		(pca963x->led_num / 4);
-	u8 ledout;
-	u8 mode2 = i2c_smbus_read_byte_data(pca963x->chip->client,
-							PCA963X_MODE2);
-	int shift = 2 * (pca963x->led_num % 4);
-	u8 mask = 0x3 << shift;
+	struct i2c_client *client = pca963x->chip->client;
+	struct pca963x_chipdef *chipdef = pca963x->chip->chipdef;
+	u8 ledout_addr, ledout, mask, val, mode2;
+	int shift;
+
+	ledout_addr = chipdef->ledout_base + (pca963x->led_num / 4);
+	shift = 2 * (pca963x->led_num % 4);
+	mask = 0x3 << shift;
+	mode2 = i2c_smbus_read_byte_data(client, PCA963X_MODE2);
 
-	i2c_smbus_write_byte_data(pca963x->chip->client,
-			pca963x->chip->chipdef->grppwm,	pca963x->gdc);
+	i2c_smbus_write_byte_data(client, chipdef->grppwm, pca963x->gdc);
 
-	i2c_smbus_write_byte_data(pca963x->chip->client,
-			pca963x->chip->chipdef->grpfreq, pca963x->gfrq);
+	i2c_smbus_write_byte_data(client, chipdef->grpfreq, pca963x->gfrq);
 
 	if (!(mode2 & PCA963X_MODE2_DMBLNK))
-		i2c_smbus_write_byte_data(pca963x->chip->client, PCA963X_MODE2,
-			mode2 | PCA963X_MODE2_DMBLNK);
+		i2c_smbus_write_byte_data(client, PCA963X_MODE2,
+					  mode2 | PCA963X_MODE2_DMBLNK);
 
 	mutex_lock(&pca963x->chip->mutex);
-	ledout = i2c_smbus_read_byte_data(pca963x->chip->client, ledout_addr);
-	if ((ledout & mask) != (PCA963X_LED_GRP_PWM << shift))
-		i2c_smbus_write_byte_data(pca963x->chip->client, ledout_addr,
-			(ledout & ~mask) | (PCA963X_LED_GRP_PWM << shift));
+
+	ledout = i2c_smbus_read_byte_data(client, ledout_addr);
+	if ((ledout & mask) != (PCA963X_LED_GRP_PWM << shift)) {
+		val = (ledout & ~mask) | (PCA963X_LED_GRP_PWM << shift);
+		i2c_smbus_write_byte_data(client, ledout_addr, val);
+	}
+
 	mutex_unlock(&pca963x->chip->mutex);
 }
 
 static int pca963x_power_state(struct pca963x_led *pca963x)
 {
+	struct i2c_client *client = pca963x->chip->client;
 	unsigned long *leds_on = &pca963x->chip->leds_on;
-	unsigned long cached_leds = pca963x->chip->leds_on;
+	unsigned long cached_leds = *leds_on;
 
 	if (pca963x->led_cdev.brightness)
 		set_bit(pca963x->led_num, leds_on);
@@ -190,14 +197,14 @@ static int pca963x_power_state(struct pca963x_led *pca963x)
 		clear_bit(pca963x->led_num, leds_on);
 
 	if (!(*leds_on) != !cached_leds)
-		return i2c_smbus_write_byte_data(pca963x->chip->client,
-			PCA963X_MODE1, *leds_on ? 0 : BIT(4));
+		return i2c_smbus_write_byte_data(client, PCA963X_MODE1,
+						 *leds_on ? 0 : BIT(4));
 
 	return 0;
 }
 
 static int pca963x_led_set(struct led_classdev *led_cdev,
-	enum led_brightness value)
+			   enum led_brightness value)
 {
 	struct pca963x_led *pca963x;
 	int ret;
@@ -217,7 +224,7 @@ static int pca963x_led_set(struct led_classdev *led_cdev,
 }
 
 static unsigned int pca963x_period_scale(struct pca963x_led *pca963x,
-	unsigned int val)
+					 unsigned int val)
 {
 	unsigned int scaling = pca963x->chip->chipdef->scaling;
 
@@ -225,7 +232,7 @@ static unsigned int pca963x_period_scale(struct pca963x_led *pca963x,
 }
 
 static int pca963x_blink_set(struct led_classdev *led_cdev,
-		unsigned long *delay_on, unsigned long *delay_off)
+			     unsigned long *delay_on, unsigned long *delay_off)
 {
 	struct pca963x_led *pca963x;
 	unsigned long time_on, time_off, period;
@@ -278,23 +285,23 @@ static int pca963x_blink_set(struct led_classdev *led_cdev,
 }
 
 static struct pca963x_platform_data *
-pca963x_get_pdata(struct i2c_client *client, struct pca963x_chipdef *chip)
+pca963x_get_pdata(struct device *dev, struct pca963x_chipdef *chip)
 {
 	struct pca963x_platform_data *pdata;
 	struct led_info *pca963x_leds;
 	struct fwnode_handle *child;
 	int count;
 
-	count = device_get_child_node_count(&client->dev);
+	count = device_get_child_node_count(dev);
 	if (!count || count > chip->n_leds)
 		return ERR_PTR(-ENODEV);
 
-	pca963x_leds = devm_kcalloc(&client->dev,
-			chip->n_leds, sizeof(struct led_info), GFP_KERNEL);
+	pca963x_leds = devm_kcalloc(dev, chip->n_leds, sizeof(struct led_info),
+				    GFP_KERNEL);
 	if (!pca963x_leds)
 		return ERR_PTR(-ENOMEM);
 
-	device_for_each_child_node(&client->dev, child) {
+	device_for_each_child_node(dev, child) {
 		struct led_info led = {};
 		u32 reg;
 		int res;
@@ -312,8 +319,8 @@ pca963x_get_pdata(struct i2c_client *client, struct pca963x_chipdef *chip)
 
 		pca963x_leds[reg] = led;
 	}
-	pdata = devm_kzalloc(&client->dev,
-			     sizeof(struct pca963x_platform_data), GFP_KERNEL);
+	pdata = devm_kzalloc(dev, sizeof(struct pca963x_platform_data),
+			     GFP_KERNEL);
 	if (!pdata)
 		return ERR_PTR(-ENOMEM);
 
@@ -321,23 +328,23 @@ pca963x_get_pdata(struct i2c_client *client, struct pca963x_chipdef *chip)
 	pdata->leds.num_leds = chip->n_leds;
 
 	/* default to open-drain unless totem pole (push-pull) is specified */
-	if (device_property_read_bool(&client->dev, "nxp,totem-pole"))
+	if (device_property_read_bool(dev, "nxp,totem-pole"))
 		pdata->outdrv = PCA963X_TOTEM_POLE;
 	else
 		pdata->outdrv = PCA963X_OPEN_DRAIN;
 
 	/* default to software blinking unless hardware blinking is specified */
-	if (device_property_read_bool(&client->dev, "nxp,hw-blink"))
+	if (device_property_read_bool(dev, "nxp,hw-blink"))
 		pdata->blink_type = PCA963X_HW_BLINK;
 	else
 		pdata->blink_type = PCA963X_SW_BLINK;
 
-	if (device_property_read_u32(&client->dev, "nxp,period-scale",
+	if (device_property_read_u32(dev, "nxp,period-scale",
 				     &chip->scaling))
 		chip->scaling = 1000;
 
 	/* default to non-inverted output, unless inverted is specified */
-	if (device_property_read_bool(&client->dev, "nxp,inverted-out"))
+	if (device_property_read_bool(dev, "nxp,inverted-out"))
 		pdata->dir = PCA963X_INVERTED;
 	else
 		pdata->dir = PCA963X_NORMAL;
@@ -355,8 +362,9 @@ static const struct of_device_id of_pca963x_match[] = {
 MODULE_DEVICE_TABLE(of, of_pca963x_match);
 
 static int pca963x_probe(struct i2c_client *client,
-					const struct i2c_device_id *id)
+			 const struct i2c_device_id *id)
 {
+	struct device *dev = &client->dev;
 	struct pca963x *pca963x_chip;
 	struct pca963x_led *pca963x;
 	struct pca963x_platform_data *pdata;
@@ -364,29 +372,26 @@ static int pca963x_probe(struct i2c_client *client,
 	int i, err;
 
 	chip = &pca963x_chipdefs[id->driver_data];
-	pdata = dev_get_platdata(&client->dev);
+	pdata = dev_get_platdata(dev);
 
 	if (!pdata) {
-		pdata = pca963x_get_pdata(client, chip);
+		pdata = pca963x_get_pdata(dev, chip);
 		if (IS_ERR(pdata)) {
-			dev_warn(&client->dev, "could not parse configuration\n");
+			dev_warn(dev, "could not parse configuration\n");
 			pdata = NULL;
 		}
 	}
 
 	if (pdata && (pdata->leds.num_leds < 1 ||
-				 pdata->leds.num_leds > chip->n_leds)) {
-		dev_err(&client->dev, "board info must claim 1-%d LEDs",
-								chip->n_leds);
+		      pdata->leds.num_leds > chip->n_leds)) {
+		dev_err(dev, "board info must claim 1-%d LEDs", chip->n_leds);
 		return -EINVAL;
 	}
 
-	pca963x_chip = devm_kzalloc(&client->dev, sizeof(*pca963x_chip),
-								GFP_KERNEL);
+	pca963x_chip = devm_kzalloc(dev, sizeof(*pca963x_chip), GFP_KERNEL);
 	if (!pca963x_chip)
 		return -ENOMEM;
-	pca963x = devm_kcalloc(&client->dev, chip->n_leds, sizeof(*pca963x),
-								GFP_KERNEL);
+	pca963x = devm_kcalloc(dev, chip->n_leds, sizeof(*pca963x), GFP_KERNEL);
 	if (!pca963x)
 		return -ENOMEM;
 
@@ -427,7 +432,7 @@ static int pca963x_probe(struct i2c_client *client,
 		if (pdata && pdata->blink_type == PCA963X_HW_BLINK)
 			pca963x[i].led_cdev.blink_set = pca963x_blink_set;
 
-		err = led_classdev_register(&client->dev, &pca963x[i].led_cdev);
+		err = led_classdev_register(dev, &pca963x[i].led_cdev);
 		if (err < 0)
 			goto exit;
 	}
@@ -436,8 +441,7 @@ static int pca963x_probe(struct i2c_client *client,
 	i2c_smbus_write_byte_data(client, PCA963X_MODE1, BIT(4));
 
 	if (pdata) {
-		u8 mode2 = i2c_smbus_read_byte_data(pca963x->chip->client,
-						    PCA963X_MODE2);
+		u8 mode2 = i2c_smbus_read_byte_data(client, PCA963X_MODE2);
 		/* Configure output: open-drain or totem pole (push-pull) */
 		if (pdata->outdrv == PCA963X_OPEN_DRAIN)
 			mode2 &= ~PCA963X_MODE2_OUTDRV;
@@ -446,8 +450,7 @@ static int pca963x_probe(struct i2c_client *client,
 		/* Configure direction: normal or inverted */
 		if (pdata->dir == PCA963X_INVERTED)
 			mode2 |= PCA963X_MODE2_INVRT;
-		i2c_smbus_write_byte_data(pca963x->chip->client, PCA963X_MODE2,
-					  mode2);
+		i2c_smbus_write_byte_data(client, PCA963X_MODE2, mode2);
 	}
 
 	return 0;
-- 
2.26.2

