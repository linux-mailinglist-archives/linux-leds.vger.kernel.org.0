Return-Path: <linux-leds+bounces-2257-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B4EB92E7D9
	for <lists+linux-leds@lfdr.de>; Thu, 11 Jul 2024 14:01:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 03FEE286060
	for <lists+linux-leds@lfdr.de>; Thu, 11 Jul 2024 12:01:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46FB015B125;
	Thu, 11 Jul 2024 12:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="H2I3oWp5"
X-Original-To: linux-leds@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0941915ADB4;
	Thu, 11 Jul 2024 12:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720699304; cv=none; b=Hxgqyy9GECXVoqtyzHRi2aS0rbHCVVlvexGWY+W0liVJXBOfvRFOFgYGPxI3FTCzNeYpCRcpNvakuVqDwJL3y2wcBQ/L+/OEJKIn1Va5Jr9qEyjrLcK3Z+frCosGNVpFNpIOVQUwFnVtsQ761OnTC+mjxMsYCsYuNouOIKHY2gY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720699304; c=relaxed/simple;
	bh=YMbrlYAacq8VnF6uzSYjpNqyLR/Zwj3QjxxEfxNoWV0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V03/qBt/GstIUdc7AlhneILTD2W6vv07L6HLzbFn9ZHW2DjYCxnxu7NikD1jbT9RXh6o/L1YMhtV9pnPbB0MDDNER2zoz8ZUPO96riLlw8Y0CD3jI5qA5yUmGtCE9Zd1ASp1sanxjrbWNEWuCRUz77DpRRmR2WMSIoqJ6pAoHwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=H2I3oWp5; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPA id 4C8C61BF20F;
	Thu, 11 Jul 2024 12:01:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1720699293;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Qt7UmrwvNzoZ4+Yje8MDhIVAuMdtzcc+/RmUSruDHcw=;
	b=H2I3oWp5iw1bBZE/lzsXWp4ybyEurGYZ2hBB7tkrdoGxiv1v1xn7+2op+0YvYHiju+W1Sp
	GaS7Ww4+FlQPldWhMIpwToEEYU4WahcubZYSH63azYbbjB26pXgr+NsdjEF9CI3n5v8OGr
	1PvcfXN25bzwDKQtqWMos0kBr42J8EfnWop0kxv6A4M4r/VDBaFThKOr6dM1cI6z9mYHUD
	/NE30YqVF0zECKCKlyEbYSd+qpl2xyAOuzNDRpw8aUxu/q/zs2/g+xGbY50JAQ5ulCh0Cp
	v8sjGHyATKN9wRAJMpkuyrXmqpDHWnJk4qqDd5ZQSxHeYeC3jLHhfkR7Lp9b+A==
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
Subject: [PATCH v3 1/4] leds: pca9532: Use defines to select PWM instance
Date: Thu, 11 Jul 2024 14:01:26 +0200
Message-ID: <20240711120129.100248-2-bastien.curutchet@bootlin.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240711120129.100248-1-bastien.curutchet@bootlin.com>
References: <20240711120129.100248-1-bastien.curutchet@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: bastien.curutchet@bootlin.com

Two tables are used to configure the PWM and PSC registers of the two
PWM available in the pca9532. Magic numbers are used to access this table
instead of defines.

Add defines PCA9532_PWM_ID_0 and PCA9532_PWM_ID_1 and use them in place of
these magic numbers.

Signed-off-by: Bastien Curutchet <bastien.curutchet@bootlin.com>
---
 drivers/leds/leds-pca9532.c | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/drivers/leds/leds-pca9532.c b/drivers/leds/leds-pca9532.c
index bf8bb8fc007c..b6e5f48bffe7 100644
--- a/drivers/leds/leds-pca9532.c
+++ b/drivers/leds/leds-pca9532.c
@@ -45,6 +45,9 @@ struct pca9532_data {
 	struct gpio_chip gpio;
 #endif
 	const struct pca9532_chip_info *chip_info;
+
+#define PCA9532_PWM_ID_0	0
+#define PCA9532_PWM_ID_1	1
 	u8 pwm[2];
 	u8 psc[2];
 };
@@ -181,12 +184,12 @@ static int pca9532_set_brightness(struct led_classdev *led_cdev,
 		led->state = PCA9532_ON;
 	else {
 		led->state = PCA9532_PWM0; /* Thecus: hardcode one pwm */
-		err = pca9532_calcpwm(led->client, 0, 0, value);
+		err = pca9532_calcpwm(led->client, PCA9532_PWM_ID_0, 0, value);
 		if (err)
 			return err;
 	}
 	if (led->state == PCA9532_PWM0)
-		pca9532_setpwm(led->client, 0);
+		pca9532_setpwm(led->client, PCA9532_PWM_ID_0);
 	pca9532_setled(led);
 	return err;
 }
@@ -209,11 +212,11 @@ static int pca9532_set_blink(struct led_classdev *led_cdev,
 
 	/* Thecus specific: only use PSC/PWM 0 */
 	psc = (*delay_on * 152-1)/1000;
-	err = pca9532_calcpwm(client, 0, psc, led_cdev->brightness);
+	err = pca9532_calcpwm(client, PCA9532_PWM_ID_0, psc, led_cdev->brightness);
 	if (err)
 		return err;
 	if (led->state == PCA9532_PWM0)
-		pca9532_setpwm(led->client, 0);
+		pca9532_setpwm(led->client, PCA9532_PWM_ID_0);
 	pca9532_setled(led);
 
 	return 0;
@@ -229,9 +232,9 @@ static int pca9532_event(struct input_dev *dev, unsigned int type,
 
 	/* XXX: allow different kind of beeps with psc/pwm modifications */
 	if (value > 1 && value < 32767)
-		data->pwm[1] = 127;
+		data->pwm[PCA9532_PWM_ID_1] = 127;
 	else
-		data->pwm[1] = 0;
+		data->pwm[PCA9532_PWM_ID_1] = 0;
 
 	schedule_work(&data->work);
 
@@ -246,7 +249,7 @@ static void pca9532_input_work(struct work_struct *work)
 
 	mutex_lock(&data->update_lock);
 	i2c_smbus_write_byte_data(data->client, PCA9532_REG_PWM(maxleds, 1),
-		data->pwm[1]);
+		data->pwm[PCA9532_PWM_ID_1]);
 	mutex_unlock(&data->update_lock);
 }
 
@@ -475,9 +478,9 @@ pca9532_of_populate_pdata(struct device *dev, struct device_node *np)
 
 	pdata->gpio_base = -1;
 
-	of_property_read_u8_array(np, "nxp,pwm", &pdata->pwm[0],
+	of_property_read_u8_array(np, "nxp,pwm", &pdata->pwm[PCA9532_PWM_ID_0],
 				  ARRAY_SIZE(pdata->pwm));
-	of_property_read_u8_array(np, "nxp,psc", &pdata->psc[0],
+	of_property_read_u8_array(np, "nxp,psc", &pdata->psc[PCA9532_PWM_ID_0],
 				  ARRAY_SIZE(pdata->psc));
 
 	for_each_available_child_of_node(np, child) {
-- 
2.45.0


