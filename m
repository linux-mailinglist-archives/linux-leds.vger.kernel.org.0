Return-Path: <linux-leds+bounces-1987-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D7A390B3D0
	for <lists+linux-leds@lfdr.de>; Mon, 17 Jun 2024 17:18:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D7E1C282430
	for <lists+linux-leds@lfdr.de>; Mon, 17 Jun 2024 15:18:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF59D15ADB7;
	Mon, 17 Jun 2024 14:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="HbOYp3un"
X-Original-To: linux-leds@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94F7D15AD86;
	Mon, 17 Jun 2024 14:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718635158; cv=none; b=Bs88AWQjfiJOMotd0yHw8FkCCUeVW24R44bTy/e9uccSzUYT4ksXT29aPmqyeFXuqd1gTPGzHL4RdiIlZTIDhWtMRowPE5Xgbxd1pbU4G2RnqgO7o8EIOu39XNa043GRHnRbgml9MLCVQAvBzDEnjpT03ifFkN7iUbvtmLQr2gI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718635158; c=relaxed/simple;
	bh=fNEcNyx2J3ltaqVb/40esraFs0i+Fi+TRItBm4S/zws=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kHOmUXZXDyk3PXWDmisRKkjPBjEVZIB7PiWHrglwh2XcRPuZ5EK+e9HbWc6tRqLSnQVq7WIwVtA3j7uJkbjslt8rC3whu0mHrn6J5Vk1s6hjhe2jry5ckljn1meznnjZPq0OYSV/FNMDYfkwtD3QUT2M/Gvo4O+Ad94pyR8RhHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=HbOYp3un; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPA id A3F811BF207;
	Mon, 17 Jun 2024 14:39:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1718635155;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HOc1KiNHDMlfberoe2a1L+3nunCrn9fY9dBs4yJhsG8=;
	b=HbOYp3unUKRaylSWxNla3PiSkRMtTYD1q1hbyN68+jbn/E6uMM++OGwfZpUUXULIhb27GN
	MGzbttMnu2qPZ5zzbtelaUCzjQwZcoBYvQqf00jIlphswiqnFQtn44XPLKJ2zci4PTX4bj
	kBC0noqrYuAoXe0ZE2U0rMwIbx+0MYyJAArOLWJCnzbul40nWUjBa01fWFaeqFx1JgIDLz
	WM+1BLUC7CpXOokj7Cu9C5GExk43XFQXg71VgAqO2OV88YXVbND24Fo2JzMxtMk58Uq927
	IcBxceVrxkJ4Tk2B0VEW+TBmGOEGmlbDd6dmqA9O19lAmjUmYNYDQnushiLjaQ==
From: Bastien Curutchet <bastien.curutchet@bootlin.com>
To: Riku Voipio <riku.voipio@iki.fi>,
	Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>
Cc: linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Christopher Cordahi <christophercordahi@nanometrics.ca>,
	Bastien Curutchet <bastien.curutchet@bootlin.com>
Subject: [PATCH v2 2/4] leds: pca9532: Use PWM1 for hardware blinking
Date: Mon, 17 Jun 2024 16:39:08 +0200
Message-ID: <20240617143910.154546-3-bastien.curutchet@bootlin.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240617143910.154546-1-bastien.curutchet@bootlin.com>
References: <20240617143910.154546-1-bastien.curutchet@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: bastien.curutchet@bootlin.com

PSC0/PWM0 are used by all LEDs for brightness and blinking. This causes
conflicts when you set a brightness of a new LED while an other one is
already using PWM0 for blinking.

Use PSC1/PWM1 for blinking.
Check that no other LED is already blinking with a different PSC1/PWM1
configuration to avoid conflict.

Signed-off-by: Bastien Curutchet <bastien.curutchet@bootlin.com>
---
 drivers/leds/leds-pca9532.c | 53 ++++++++++++++++++++++++++++++-------
 1 file changed, 43 insertions(+), 10 deletions(-)

diff --git a/drivers/leds/leds-pca9532.c b/drivers/leds/leds-pca9532.c
index b6e5f48bffe7..244ae3ff79b5 100644
--- a/drivers/leds/leds-pca9532.c
+++ b/drivers/leds/leds-pca9532.c
@@ -29,6 +29,9 @@
 #define LED_SHIFT(led)		(LED_NUM(led) * 2)
 #define LED_MASK(led)		(0x3 << LED_SHIFT(led))
 
+#define PCA9532_PWM_PERIOD_DIV	152
+#define PCA9532_PWM_DUTY_DIV	256
+
 #define ldev_to_led(c)       container_of(c, struct pca9532_led, ldev)
 
 struct pca9532_chip_info {
@@ -194,29 +197,59 @@ static int pca9532_set_brightness(struct led_classdev *led_cdev,
 	return err;
 }
 
+static int pca9532_update_hw_blink(struct pca9532_led *led,
+				   unsigned long delay_on, unsigned long delay_off)
+{
+	struct pca9532_data *data = i2c_get_clientdata(led->client);
+	unsigned int psc;
+	int i;
+
+	/* Look for others LEDs that already use PWM1 */
+	for (i = 0; i < data->chip_info->num_leds; i++) {
+		struct pca9532_led *other = &data->leds[i];
+
+		if (other == led)
+			continue;
+
+		if (other->state == PCA9532_PWM1) {
+			if (other->ldev.blink_delay_on != delay_on ||
+			    other->ldev.blink_delay_off != delay_off) {
+				dev_err(&led->client->dev,
+					"HW can handle only one blink configuration at a time\n");
+				return -EINVAL;
+			}
+		}
+	}
+
+	psc = ((delay_on + delay_off) * PCA9532_PWM_PERIOD_DIV - 1) / 1000;
+	if (psc > U8_MAX) {
+		dev_err(&led->client->dev, "Blink period too long to be handled by hardware\n");
+		return -EINVAL;
+	}
+
+	led->state = PCA9532_PWM1;
+	data->psc[PCA9532_PWM_ID_1] = psc;
+	data->pwm[PCA9532_PWM_ID_1] = (delay_on * PCA9532_PWM_DUTY_DIV) / (delay_on + delay_off);
+
+	return pca9532_setpwm(data->client, PCA9532_PWM_ID_1);
+}
+
 static int pca9532_set_blink(struct led_classdev *led_cdev,
 	unsigned long *delay_on, unsigned long *delay_off)
 {
 	struct pca9532_led *led = ldev_to_led(led_cdev);
-	struct i2c_client *client = led->client;
-	int psc;
-	int err = 0;
+	int err;
 
 	if (*delay_on == 0 && *delay_off == 0) {
 		/* led subsystem ask us for a blink rate */
 		*delay_on = 1000;
 		*delay_off = 1000;
 	}
-	if (*delay_on != *delay_off || *delay_on > 1690 || *delay_on < 6)
-		return -EINVAL;
 
-	/* Thecus specific: only use PSC/PWM 0 */
-	psc = (*delay_on * 152-1)/1000;
-	err = pca9532_calcpwm(client, PCA9532_PWM_ID_0, psc, led_cdev->brightness);
+	err = pca9532_update_hw_blink(led, *delay_on, *delay_off);
 	if (err)
 		return err;
-	if (led->state == PCA9532_PWM0)
-		pca9532_setpwm(led->client, PCA9532_PWM_ID_0);
+
 	pca9532_setled(led);
 
 	return 0;
-- 
2.45.0


