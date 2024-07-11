Return-Path: <linux-leds+bounces-2259-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BE8EA92E7DD
	for <lists+linux-leds@lfdr.de>; Thu, 11 Jul 2024 14:02:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E154C1C23B26
	for <lists+linux-leds@lfdr.de>; Thu, 11 Jul 2024 12:02:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C320B15D5A4;
	Thu, 11 Jul 2024 12:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="FqEc1hZw"
X-Original-To: linux-leds@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF52715B116;
	Thu, 11 Jul 2024 12:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720699305; cv=none; b=NXZK05if7NcV6UroUUCSKh+URqocLt9VRHh5sWBI508Y847/a5JJcWeV0j6N9AbCcD/WD4WBRGLUrExmdE0J0QaeZQFoMZt4uXLOaoWmCJiBwnoi40vSLJAQM7eCdtLTuaKSxvsBPrQtCm3CqBhpcdKrdppO7bE1Uj8TFMDblDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720699305; c=relaxed/simple;
	bh=yAAOMLnZM1tP3pxsOZcFJvqPrxifImFA2Y80OQgFEXE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r+xMrun98m9qcvu4VoBxkds9HMyF8HEc7y813b7VdMQmCNVACilvQ8BncEhSu9BTt+/w0NhzKpH0vtd8gZ+1ZWOPyddhaO49QJtEYiENg6Ij4DBQdv3vgAh1SxzJX0RR/AvpY5kw47+VnzbieiDynftX2KLKikUY14chPatF+Vg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=FqEc1hZw; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPA id 11D2C1BF205;
	Thu, 11 Jul 2024 12:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1720699296;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Z32I30d3WDVwn56ex/HsYu+crp2YEIjAoDzDD60NB0U=;
	b=FqEc1hZwOAf78niemoqqJd+II4+5sK17HWPHLFdH8mH5L8GIeUsJMVCsxr8UGSska+2t1Z
	ZiQrH1Qnfelf6glQruZZoNDWZeBJfJXUuIBBPMySYxdkqFG1IJUkYYYqLn3A2Ycw106+NC
	7jnvAIFXHkRszo8UnNOywncknzUtBAStqk92QRyQqGgeth2tbFbyfji9eErsTyO7YHGEZ3
	0bEzYOlk2WRfrfYTE5HN69VxdkWeQ6md0+VyizXsXTOcU5VJu6WwpEAjvy2tJIhZQ4E0jR
	39Tq8wMxdYmCcWJXpKJTfNqwxyYhPlOo6/O/dYisuTneuzqA8mf8HnaFv0Yyjw==
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
Subject: [PATCH v3 3/4] leds: pca9532: Explicitly disable hardware blink when PWM1 is unavailable
Date: Thu, 11 Jul 2024 14:01:28 +0200
Message-ID: <20240711120129.100248-4-bastien.curutchet@bootlin.com>
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

When a LED is used to drive a beeper, it uses PWM1. This can cause
conflicts if an other LED want to use PWM1 for blinking.

Disable use of hardware for blinking when one or more LEDs are used to
drive beepers.

Signed-off-by: Bastien Curutchet <bastien.curutchet@bootlin.com>
---
 drivers/leds/leds-pca9532.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/leds/leds-pca9532.c b/drivers/leds/leds-pca9532.c
index 098fd66ca43e..673d4d5b62bb 100644
--- a/drivers/leds/leds-pca9532.c
+++ b/drivers/leds/leds-pca9532.c
@@ -53,6 +53,7 @@ struct pca9532_data {
 #define PCA9532_PWM_ID_1	1
 	u8 pwm[2];
 	u8 psc[2];
+	bool hw_blink;
 };
 
 static int pca9532_probe(struct i2c_client *client);
@@ -237,8 +238,13 @@ static int pca9532_set_blink(struct led_classdev *led_cdev,
 	unsigned long *delay_on, unsigned long *delay_off)
 {
 	struct pca9532_led *led = ldev_to_led(led_cdev);
+	struct i2c_client *client = led->client;
+	struct pca9532_data *data = i2c_get_clientdata(client);
 	int err;
 
+	if (!data->hw_blink)
+		return -EINVAL;
+
 	if (*delay_on == 0 && *delay_off == 0) {
 		/* led subsystem ask us for a blink rate */
 		*delay_on = 1000;
@@ -394,6 +400,7 @@ static int pca9532_configure(struct i2c_client *client,
 			data->psc[i]);
 	}
 
+	data->hw_blink = true;
 	for (i = 0; i < data->chip_info->num_leds; i++) {
 		struct pca9532_led *led = &data->leds[i];
 		struct pca9532_led *pled = &pdata->leds[i];
@@ -428,6 +435,8 @@ static int pca9532_configure(struct i2c_client *client,
 			pca9532_setled(led);
 			break;
 		case PCA9532_TYPE_N2100_BEEP:
+			/* PWM1 is reserved for beeper so blink will not use hardware */
+			data->hw_blink = false;
 			BUG_ON(data->idev);
 			led->state = PCA9532_PWM1;
 			pca9532_setled(led);
-- 
2.45.0


