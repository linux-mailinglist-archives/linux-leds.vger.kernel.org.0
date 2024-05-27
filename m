Return-Path: <linux-leds+bounces-1705-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A56378D00E5
	for <lists+linux-leds@lfdr.de>; Mon, 27 May 2024 15:04:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2F6081F26226
	for <lists+linux-leds@lfdr.de>; Mon, 27 May 2024 13:04:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C97BC15FA8D;
	Mon, 27 May 2024 12:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Z4pP7Ja+"
X-Original-To: linux-leds@vger.kernel.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3DBC15F324;
	Mon, 27 May 2024 12:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716814788; cv=none; b=EYLmICdhGPGA7ZaYTEDO+2IFGenLB+vwaCxIk5TC0emEmb8Dy3K+evP7wrPCgO+tiDhKy84lN5jp/tGoZlLeP0ernyJX+GiLvjheBux2CHFs8MNfQO4luRv8Owl+UsKXZXbPV/+rO5OxS3d2P+GXoJmakEa0dkvO/4mqDe9woKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716814788; c=relaxed/simple;
	bh=fCI3nVzlU/UXq4JVVf9nJN2KFj9KRqvDKgpxyukJIjQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IT28n+y7uuku0xMcRzF7GPSitZX+a2cLzejFU6s/oHXE5G0t6jq1ucbZvtb3wzAxf41QWmN0KtZWVyrv8TUHSGkNWFzSEEXnBM1HJrb4gsr71eTo6eNhsr4sCibchxUVbHBNcVO7/PALv++BsuRIB3ob9Du1ExH22qc5wmgwmbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Z4pP7Ja+; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPA id DE2111C0004;
	Mon, 27 May 2024 12:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1716814784;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UTmMsb+LE1e+KSAs3ytZEWi1Bn5fvm909GB0m59j0+k=;
	b=Z4pP7Ja+0iiHSIWh1qS3HVQBquNCr95vXtVm50FXzvVeSNvbp0c/v19K983bTWtGuzLrXZ
	DrXEAZsC/37HTX7ODgHL/WIG50ef/6wAptMfD8mFpxTQZMmXXvrlszDvGQOCvC6XcpScFk
	4o+Y9L1p6n39BD9R0uaV7lRX9j4o4/U+gj8eP7Z+sTRMx8WGHeLaRuQglonCd1IlNu5hHv
	IyT2/e0jcE49YALY8kFy78vAOg2Ou1CvX48z3iDTiD+M6BcgRpMYcy/Zk/dQ6iB/FpKHZ4
	sJ+PPfseSjhZQvLL2DFJGNbkulmM/hilTULb2QZwAAfh6PMzQR61v2UbPt0gAw==
From: Bastien Curutchet <bastien.curutchet@bootlin.com>
To: Riku Voipio <riku.voipio@iki.fi>,
	Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>
Cc: linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	herve.codina@bootlin.com,
	christophercordahi@nanometrics.ca,
	Bastien Curutchet <bastien.curutchet@bootlin.com>
Subject: [PATCH 1/3] leds: pca9532: Use PWM1 for hardware blinking
Date: Mon, 27 May 2024 14:59:38 +0200
Message-ID: <20240527125940.155260-2-bastien.curutchet@bootlin.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240527125940.155260-1-bastien.curutchet@bootlin.com>
References: <20240527125940.155260-1-bastien.curutchet@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: bastien.curutchet@bootlin.com

PSC0/PWM0 are used by all leds for brightness and blinking. This causes
conflicts when you set a brightness of a new led while an other one is
already using PWM0 for blinking.

Use PSC1/PWM1 for blinking.
Check that no other led is already blinking with a different PSC1/PWM1
configuration to avoid conflict.

Signed-off-by: Bastien Curutchet <bastien.curutchet@bootlin.com>
---
 drivers/leds/leds-pca9532.c | 49 ++++++++++++++++++++++++++++++-------
 1 file changed, 40 insertions(+), 9 deletions(-)

diff --git a/drivers/leds/leds-pca9532.c b/drivers/leds/leds-pca9532.c
index bf8bb8fc007c..c210608ad336 100644
--- a/drivers/leds/leds-pca9532.c
+++ b/drivers/leds/leds-pca9532.c
@@ -191,29 +191,60 @@ static int pca9532_set_brightness(struct led_classdev *led_cdev,
 	return err;
 }
 
+static int pca9532_update_hw_blink(struct pca9532_led *led,
+				   unsigned long delay_on, unsigned long delay_off)
+{
+	struct pca9532_data *data = i2c_get_clientdata(led->client);
+	unsigned int psc;
+	int i;
+
+	/* Look for others leds that already use PWM1 */
+	for (i = 0; i < data->chip_info->num_leds; i++) {
+		struct pca9532_led *other = &data->leds[i];
+
+		if (other == led)
+			continue;
+		if (other->state == PCA9532_PWM1) {
+			if (other->ldev.blink_delay_on != delay_on ||
+			    other->ldev.blink_delay_off != delay_off) {
+				dev_dbg(&led->client->dev,
+					"HW can handle only one blink configuration at a time\n");
+				return -EINVAL;
+			}
+		}
+	}
+
+	psc = ((delay_on + delay_off) * 152 - 1) / 1000;
+	if (psc > 255) {
+		dev_dbg(&led->client->dev, "Blink period too long to be handled by hardware\n");
+		return -EINVAL;
+	}
+
+	data->psc[1] = psc;
+	data->pwm[1] = (delay_on * 255) / (delay_on + delay_off);
+
+	return pca9532_setpwm(data->client, 1);
+}
+
 static int pca9532_set_blink(struct led_classdev *led_cdev,
 	unsigned long *delay_on, unsigned long *delay_off)
 {
 	struct pca9532_led *led = ldev_to_led(led_cdev);
 	struct i2c_client *client = led->client;
-	int psc;
-	int err = 0;
+	struct pca9532_data *data = i2c_get_clientdata(client);
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
-	err = pca9532_calcpwm(client, 0, psc, led_cdev->brightness);
+	led->state = PCA9532_PWM1;
+	err = pca9532_update_hw_blink(led, *delay_on, *delay_off);
 	if (err)
 		return err;
-	if (led->state == PCA9532_PWM0)
-		pca9532_setpwm(led->client, 0);
+
 	pca9532_setled(led);
 
 	return 0;
-- 
2.44.0


