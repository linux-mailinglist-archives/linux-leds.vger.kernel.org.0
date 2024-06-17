Return-Path: <linux-leds+bounces-1988-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FD7690B3D5
	for <lists+linux-leds@lfdr.de>; Mon, 17 Jun 2024 17:18:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3A11F28808B
	for <lists+linux-leds@lfdr.de>; Mon, 17 Jun 2024 15:18:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2CFB15B102;
	Mon, 17 Jun 2024 14:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="NCqCDfEZ"
X-Original-To: linux-leds@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B90D415ADA3;
	Mon, 17 Jun 2024 14:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718635159; cv=none; b=KW0XsXYKvi47xcEn2jTdUJOCh+oyONGQ6atVSvDR973qjulb+tVYjbMmGLuR15JoIY+eUBpHuoSowyKT45fecd9lGoCO5cMdstQOptMHP2NxE2sBhLpP1ITbmXdf/Pw1XQqDfIeH8SrYPqn02zZVhrskE3W/fWD621WM096PJm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718635159; c=relaxed/simple;
	bh=6nrj6/a24QJFSZToJHuf9ql/CkxfXffm9v3w8u7tOAw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=joZxtbjBXMT4cuahG9aTCfaiAt/639hONaOakmu5D9sQDxkk9/3RW20vGV6f/xc3x5tUJ9xOLi9kMfcWY3EV/ghuhY3nCIKS17HKLVAkaCHI9A40nslcOt3YP3zVZo3qp+QqjzAd1CZ4sQdsqhhEE4f8CMFdRqp7/0h4xsHMWpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=NCqCDfEZ; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPA id AF23D1BF209;
	Mon, 17 Jun 2024 14:39:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1718635156;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ycSwcZwlwGJEHJqy8a8Ha4d7p1eYd2BTEw/EOqHej6c=;
	b=NCqCDfEZyIIlsmA4TsHp2maSO5CD9xfVZZn/fBywNXGwncfmy5yUAtjKj5PA/YXJ7sjbJx
	/aaXx64kY0Mi7k7hbiJHz6OOCEDC9AWPHTIpE/7D6WDpAKKHdJu2EerIYpebDr+ySTB6eP
	XXxw9lIn8OkZK/fcePfl3AHFQnsdPlI4JmwHbFfS3anfX7DnaUW+LDoYDo+cb2vDeaAxN9
	9al9RUgWEDTguUqBRNklt/KkgLlM2opsuLrR75SwOUA6960dgbHAJJbBgYmubmPAF7mXIx
	pRD8O40AM3fo6olm2MOkDcpkOqK/4jhom3Db1ZaKqf/P0uUppvdtREvrEbF5Kg==
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
Subject: [PATCH v2 3/4] leds: pca9532: Explicitly disable hardware blink when PWM1 is unavailable
Date: Mon, 17 Jun 2024 16:39:09 +0200
Message-ID: <20240617143910.154546-4-bastien.curutchet@bootlin.com>
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

When a LED is used to drive a beeper, it uses PWM1. This can cause
conflicts if an other LED want to use PWM1 for blinking.

Disable use of hardware for blinking when one or more LEDs are used to
drive beepers.

Signed-off-by: Bastien Curutchet <bastien.curutchet@bootlin.com>
---
 drivers/leds/leds-pca9532.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/leds/leds-pca9532.c b/drivers/leds/leds-pca9532.c
index 244ae3ff79b5..c7a4f677ed4d 100644
--- a/drivers/leds/leds-pca9532.c
+++ b/drivers/leds/leds-pca9532.c
@@ -53,6 +53,7 @@ struct pca9532_data {
 #define PCA9532_PWM_ID_1	1
 	u8 pwm[2];
 	u8 psc[2];
+	bool hw_blink;
 };
 
 static int pca9532_probe(struct i2c_client *client);
@@ -238,8 +239,13 @@ static int pca9532_set_blink(struct led_classdev *led_cdev,
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
@@ -395,6 +401,7 @@ static int pca9532_configure(struct i2c_client *client,
 			data->psc[i]);
 	}
 
+	data->hw_blink = true;
 	for (i = 0; i < data->chip_info->num_leds; i++) {
 		struct pca9532_led *led = &data->leds[i];
 		struct pca9532_led *pled = &pdata->leds[i];
@@ -429,6 +436,8 @@ static int pca9532_configure(struct i2c_client *client,
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


