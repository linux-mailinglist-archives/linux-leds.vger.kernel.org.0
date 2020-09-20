Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 930FC271196
	for <lists+linux-leds@lfdr.de>; Sun, 20 Sep 2020 02:25:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726707AbgITAZE (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 19 Sep 2020 20:25:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726794AbgITAZE (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 19 Sep 2020 20:25:04 -0400
Received: from mail.nic.cz (mail.nic.cz [IPv6:2001:1488:800:400::400])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B1A0C0613CE
        for <linux-leds@vger.kernel.org>; Sat, 19 Sep 2020 17:25:04 -0700 (PDT)
Received: from dellmb.labs.office.nic.cz (unknown [IPv6:2001:1488:fffe:6:cac7:3539:7f1f:463])
        by mail.nic.cz (Postfix) with ESMTP id 6412D140A7F;
        Sun, 20 Sep 2020 02:25:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
        t=1600561502; bh=4knxJBh8MOyONPnfVXDOtZ74q0g5oHvMRrhfmyUEMlA=;
        h=From:To:Date;
        b=k6H9HP2ivvb37rO61bu34n5xrt0Eqfv+fLQAsFQmk8qfWnfK/o11jCSeUx0aU9jZ8
         esuxJB2Xeqv2kvKCroP5f2zsoeGvDEjY+aRmXcdnkkOqS3rWGfE746lTVL2iPT39kC
         iV0XZ5lmCXDZufyiplAE33XKCgovqpHEH4Adac+Q=
From:   =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>
To:     linux-leds@vger.kernel.org
Cc:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>,
        Peter Meerwald <p.meerwald@bct-electronic.com>,
        Ricardo Ribalda <ribalda@kernel.org>,
        Zahari Petkov <zahari@balena.io>
Subject: [PATCH leds 4/7] leds: pca963x: cosmetic: rename variables
Date:   Sun, 20 Sep 2020 02:24:57 +0200
Message-Id: <20200920002500.5851-5-marek.behun@nic.cz>
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

Rename variable of type struct pca963x_led from pca963x to simple led.

Signed-off-by: Marek Behún <marek.behun@nic.cz>
Cc: Peter Meerwald <p.meerwald@bct-electronic.com>
Cc: Ricardo Ribalda <ribalda@kernel.org>
Cc: Zahari Petkov <zahari@balena.io>
---
 drivers/leds/leds-pca963x.c | 104 ++++++++++++++++++------------------
 1 file changed, 53 insertions(+), 51 deletions(-)

diff --git a/drivers/leds/leds-pca963x.c b/drivers/leds/leds-pca963x.c
index bdb014c76a078..a4096694925f5 100644
--- a/drivers/leds/leds-pca963x.c
+++ b/drivers/leds/leds-pca963x.c
@@ -115,17 +115,17 @@ struct pca963x_led {
 	u8 gfrq;
 };
 
-static int pca963x_brightness(struct pca963x_led *pca963x,
+static int pca963x_brightness(struct pca963x_led *led,
 			      enum led_brightness brightness)
 {
-	struct i2c_client *client = pca963x->chip->client;
-	struct pca963x_chipdef *chipdef = pca963x->chip->chipdef;
+	struct i2c_client *client = led->chip->client;
+	struct pca963x_chipdef *chipdef = led->chip->chipdef;
 	u8 ledout_addr, ledout, mask, val;
 	int shift;
 	int ret;
 
-	ledout_addr = chipdef->ledout_base + (pca963x->led_num / 4);
-	shift = 2 * (pca963x->led_num % 4);
+	ledout_addr = chipdef->ledout_base + (led->led_num / 4);
+	shift = 2 * (led->led_num % 4);
 	mask = 0x3 << shift;
 	ledout = i2c_smbus_read_byte_data(client, ledout_addr);
 
@@ -141,7 +141,7 @@ static int pca963x_brightness(struct pca963x_led *pca963x,
 	default:
 		ret = i2c_smbus_write_byte_data(client,
 						PCA963X_PWM_BASE +
-						pca963x->led_num,
+						led->led_num,
 						brightness);
 		if (ret < 0)
 			return ret;
@@ -154,27 +154,27 @@ static int pca963x_brightness(struct pca963x_led *pca963x,
 	return ret;
 }
 
-static void pca963x_blink(struct pca963x_led *pca963x)
+static void pca963x_blink(struct pca963x_led *led)
 {
-	struct i2c_client *client = pca963x->chip->client;
-	struct pca963x_chipdef *chipdef = pca963x->chip->chipdef;
+	struct i2c_client *client = led->chip->client;
+	struct pca963x_chipdef *chipdef = led->chip->chipdef;
 	u8 ledout_addr, ledout, mask, val, mode2;
 	int shift;
 
-	ledout_addr = chipdef->ledout_base + (pca963x->led_num / 4);
-	shift = 2 * (pca963x->led_num % 4);
+	ledout_addr = chipdef->ledout_base + (led->led_num / 4);
+	shift = 2 * (led->led_num % 4);
 	mask = 0x3 << shift;
 	mode2 = i2c_smbus_read_byte_data(client, PCA963X_MODE2);
 
-	i2c_smbus_write_byte_data(client, chipdef->grppwm, pca963x->gdc);
+	i2c_smbus_write_byte_data(client, chipdef->grppwm, led->gdc);
 
-	i2c_smbus_write_byte_data(client, chipdef->grpfreq, pca963x->gfrq);
+	i2c_smbus_write_byte_data(client, chipdef->grpfreq, led->gfrq);
 
 	if (!(mode2 & PCA963X_MODE2_DMBLNK))
 		i2c_smbus_write_byte_data(client, PCA963X_MODE2,
 					  mode2 | PCA963X_MODE2_DMBLNK);
 
-	mutex_lock(&pca963x->chip->mutex);
+	mutex_lock(&led->chip->mutex);
 
 	ledout = i2c_smbus_read_byte_data(client, ledout_addr);
 	if ((ledout & mask) != (PCA963X_LED_GRP_PWM << shift)) {
@@ -182,19 +182,19 @@ static void pca963x_blink(struct pca963x_led *pca963x)
 		i2c_smbus_write_byte_data(client, ledout_addr, val);
 	}
 
-	mutex_unlock(&pca963x->chip->mutex);
+	mutex_unlock(&led->chip->mutex);
 }
 
-static int pca963x_power_state(struct pca963x_led *pca963x)
+static int pca963x_power_state(struct pca963x_led *led)
 {
-	struct i2c_client *client = pca963x->chip->client;
-	unsigned long *leds_on = &pca963x->chip->leds_on;
+	struct i2c_client *client = led->chip->client;
+	unsigned long *leds_on = &led->chip->leds_on;
 	unsigned long cached_leds = *leds_on;
 
-	if (pca963x->led_cdev.brightness)
-		set_bit(pca963x->led_num, leds_on);
+	if (led->led_cdev.brightness)
+		set_bit(led->led_num, leds_on);
 	else
-		clear_bit(pca963x->led_num, leds_on);
+		clear_bit(led->led_num, leds_on);
 
 	if (!(*leds_on) != !cached_leds)
 		return i2c_smbus_write_byte_data(client, PCA963X_MODE1,
@@ -206,27 +206,27 @@ static int pca963x_power_state(struct pca963x_led *pca963x)
 static int pca963x_led_set(struct led_classdev *led_cdev,
 			   enum led_brightness value)
 {
-	struct pca963x_led *pca963x;
+	struct pca963x_led *led;
 	int ret;
 
-	pca963x = container_of(led_cdev, struct pca963x_led, led_cdev);
+	led = container_of(led_cdev, struct pca963x_led, led_cdev);
 
-	mutex_lock(&pca963x->chip->mutex);
+	mutex_lock(&led->chip->mutex);
 
-	ret = pca963x_brightness(pca963x, value);
+	ret = pca963x_brightness(led, value);
 	if (ret < 0)
 		goto unlock;
-	ret = pca963x_power_state(pca963x);
+	ret = pca963x_power_state(led);
 
 unlock:
-	mutex_unlock(&pca963x->chip->mutex);
+	mutex_unlock(&led->chip->mutex);
 	return ret;
 }
 
-static unsigned int pca963x_period_scale(struct pca963x_led *pca963x,
+static unsigned int pca963x_period_scale(struct pca963x_led *led,
 					 unsigned int val)
 {
-	unsigned int scaling = pca963x->chip->chipdef->scaling;
+	unsigned int scaling = led->chip->chipdef->scaling;
 
 	return scaling ? DIV_ROUND_CLOSEST(val * scaling, 1000) : val;
 }
@@ -234,11 +234,11 @@ static unsigned int pca963x_period_scale(struct pca963x_led *pca963x,
 static int pca963x_blink_set(struct led_classdev *led_cdev,
 			     unsigned long *delay_on, unsigned long *delay_off)
 {
-	struct pca963x_led *pca963x;
 	unsigned long time_on, time_off, period;
+	struct pca963x_led *led;
 	u8 gdc, gfrq;
 
-	pca963x = container_of(led_cdev, struct pca963x_led, led_cdev);
+	led = container_of(led_cdev, struct pca963x_led, led_cdev);
 
 	time_on = *delay_on;
 	time_off = *delay_off;
@@ -249,14 +249,14 @@ static int pca963x_blink_set(struct led_classdev *led_cdev,
 		time_off = 500;
 	}
 
-	period = pca963x_period_scale(pca963x, time_on + time_off);
+	period = pca963x_period_scale(led, time_on + time_off);
 
 	/* If period not supported by hardware, default to someting sane. */
 	if ((period < PCA963X_BLINK_PERIOD_MIN) ||
 	    (period > PCA963X_BLINK_PERIOD_MAX)) {
 		time_on = 500;
 		time_off = 500;
-		period = pca963x_period_scale(pca963x, 1000);
+		period = pca963x_period_scale(led, 1000);
 	}
 
 	/*
@@ -264,7 +264,7 @@ static int pca963x_blink_set(struct led_classdev *led_cdev,
 	 *	(time_on / period) = (GDC / 256) ->
 	 *		GDC = ((time_on * 256) / period)
 	 */
-	gdc = (pca963x_period_scale(pca963x, time_on) * 256) / period;
+	gdc = (pca963x_period_scale(led, time_on) * 256) / period;
 
 	/*
 	 * From manual: period = ((GFRQ + 1) / 24) in seconds.
@@ -273,10 +273,10 @@ static int pca963x_blink_set(struct led_classdev *led_cdev,
 	 */
 	gfrq = (period * 24 / 1000) - 1;
 
-	pca963x->gdc = gdc;
-	pca963x->gfrq = gfrq;
+	led->gdc = gdc;
+	led->gfrq = gfrq;
 
-	pca963x_blink(pca963x);
+	pca963x_blink(led);
 
 	*delay_on = time_on;
 	*delay_off = time_off;
@@ -367,7 +367,7 @@ static int pca963x_probe(struct i2c_client *client,
 	struct device *dev = &client->dev;
 	struct pca963x_chipdef *chipdef;
 	struct pca963x_platform_data *pdata;
-	struct pca963x_led *pca963x;
+	struct pca963x_led *leds;
 	struct pca963x *chip;
 	int i, err;
 
@@ -392,8 +392,8 @@ static int pca963x_probe(struct i2c_client *client,
 	chip = devm_kzalloc(dev, sizeof(*chip), GFP_KERNEL);
 	if (!chip)
 		return -ENOMEM;
-	pca963x = devm_kcalloc(dev, chipdef->n_leds, sizeof(*pca963x), GFP_KERNEL);
-	if (!pca963x)
+	leds = devm_kcalloc(dev, chipdef->n_leds, sizeof(*leds), GFP_KERNEL);
+	if (!leds)
 		return -ENOMEM;
 
 	i2c_set_clientdata(client, chip);
@@ -401,39 +401,41 @@ static int pca963x_probe(struct i2c_client *client,
 	mutex_init(&chip->mutex);
 	chip->chipdef = chipdef;
 	chip->client = client;
-	chip->leds = pca963x;
+	chip->leds = leds;
 
 	/* Turn off LEDs by default*/
 	for (i = 0; i < chipdef->n_leds / 4; i++)
 		i2c_smbus_write_byte_data(client, chipdef->ledout_base + i, 0x00);
 
 	for (i = 0; i < chipdef->n_leds; i++) {
-		pca963x[i].led_num = i;
-		pca963x[i].chip = chip;
+		struct pca963x_led *led = &leds[i];
+
+		led->led_num = i;
+		led->chip = chip;
 
 		/* Platform data can specify LED names and default triggers */
 		if (pdata && i < pdata->leds.num_leds) {
 			if (pdata->leds.leds[i].name)
-				snprintf(pca963x[i].name,
-					 sizeof(pca963x[i].name), "pca963x:%s",
+				snprintf(led->name,
+					 sizeof(led->name), "pca963x:%s",
 					 pdata->leds.leds[i].name);
 			if (pdata->leds.leds[i].default_trigger)
-				pca963x[i].led_cdev.default_trigger =
+				led->led_cdev.default_trigger =
 					pdata->leds.leds[i].default_trigger;
 		}
 		if (!pdata || i >= pdata->leds.num_leds ||
 						!pdata->leds.leds[i].name)
-			snprintf(pca963x[i].name, sizeof(pca963x[i].name),
+			snprintf(led->name, sizeof(led->name),
 				 "pca963x:%d:%.2x:%d", client->adapter->nr,
 				 client->addr, i);
 
-		pca963x[i].led_cdev.name = pca963x[i].name;
-		pca963x[i].led_cdev.brightness_set_blocking = pca963x_led_set;
+		led->led_cdev.name = led->name;
+		led->led_cdev.brightness_set_blocking = pca963x_led_set;
 
 		if (pdata && pdata->blink_type == PCA963X_HW_BLINK)
-			pca963x[i].led_cdev.blink_set = pca963x_blink_set;
+			led->led_cdev.blink_set = pca963x_blink_set;
 
-		err = devm_led_classdev_register(dev, &pca963x[i].led_cdev);
+		err = devm_led_classdev_register(dev, &led->led_cdev);
 		if (err < 0)
 			return err;
 	}
-- 
2.26.2

