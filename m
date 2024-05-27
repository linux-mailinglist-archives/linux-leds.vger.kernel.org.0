Return-Path: <linux-leds+bounces-1706-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 15E708D00E7
	for <lists+linux-leds@lfdr.de>; Mon, 27 May 2024 15:04:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A6154B252E9
	for <lists+linux-leds@lfdr.de>; Mon, 27 May 2024 13:04:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEEDC15FCEA;
	Mon, 27 May 2024 12:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="IwGFxU6n"
X-Original-To: linux-leds@vger.kernel.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD37315FA80;
	Mon, 27 May 2024 12:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716814789; cv=none; b=SsYDCqtDZ3H6c5BUmXoqmDua8YkWkIEu1vmrSt9PvdItsrZ9ZUWi3B6bgx5r+8tHxKMzZBc5PaJLCs1jOXK9fBGSMCrZLLOJZooi+4IJSOXIxJcujzuxrSAgc6S+Fix7Jd0i+9mFy/f0EOyxF9K2bZRm13R7v5kkk9z+M5WpGFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716814789; c=relaxed/simple;
	bh=wvSpgomwELyGtTs5fhDWes3YyCV33zBwkPA2H6KXn1w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qufvS5Dh4Xa88sI6+cfJV1pLNX/d8JOheW9Bbkv3sVDnyun1P6WscPmQpy9IIoF+x3FNVghPlLC+3h6p2arulAKrlsFPCObumd7tC+IoFR0m1AOXGxxBR9TO6FZgWb0Ndd54F9suZzGsyjSXzjbXIb+8hpDL91/n6h6PJP3LSFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=IwGFxU6n; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPA id 9E5EE1C000C;
	Mon, 27 May 2024 12:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1716814786;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/NSFwRjFuMXsw64LMgJKq520l6YyQuFRDR0k8Vcc8wI=;
	b=IwGFxU6nIa7CpzCXd/ItX41DCU35XibC9hYn+xVCOKPnGtISt2IgO3MsF7FcE3bwq8Uu7h
	WksWNcbvHZyqtL32B3JXJk00wyvqL9gOHrE+BJNvANQO71fQGWNV/4aAZlf76u5XPci3e+
	xcdU48lW91eoCfzeGS+DtjmF2QlPZfoCIGM9xGWdyMj73GSlglzt/tuwliuDgofsco1onv
	CBKmBxlfClAUEQ9v2rP/vEyV4Zz57/hKIpBnK+85ZnnzW2Ta7/KQmfctuyy9sohIhH39+R
	F1Tb6THt3CZEDJukNO6eBLybztisaymnkIEmbUXqEFG8cN6xeQms5bwt/VeCxQ==
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
Subject: [PATCH 2/3] leds: pca9532: Explicitly disable hardware blink when PWM1 is unavailable
Date: Mon, 27 May 2024 14:59:39 +0200
Message-ID: <20240527125940.155260-3-bastien.curutchet@bootlin.com>
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

When a led is used to driver a beeper, it uses PWM1. This can cause
conflicts if an other led want to use PWM1 for blinking.

Disable use of hardware for blinking when one or more leds are used to
driver beepers.

Signed-off-by: Bastien Curutchet <bastien.curutchet@bootlin.com>
---
 drivers/leds/leds-pca9532.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/leds/leds-pca9532.c b/drivers/leds/leds-pca9532.c
index c210608ad336..356b71a4b7ac 100644
--- a/drivers/leds/leds-pca9532.c
+++ b/drivers/leds/leds-pca9532.c
@@ -47,6 +47,7 @@ struct pca9532_data {
 	const struct pca9532_chip_info *chip_info;
 	u8 pwm[2];
 	u8 psc[2];
+	bool hw_blink;
 };
 
 static int pca9532_probe(struct i2c_client *client);
@@ -234,6 +235,9 @@ static int pca9532_set_blink(struct led_classdev *led_cdev,
 	struct pca9532_data *data = i2c_get_clientdata(client);
 	int err;
 
+	if (!data->hw_blink)
+		return -EINVAL;
+
 	if (*delay_on == 0 && *delay_off == 0) {
 		/* led subsystem ask us for a blink rate */
 		*delay_on = 1000;
@@ -390,6 +394,7 @@ static int pca9532_configure(struct i2c_client *client,
 			data->psc[i]);
 	}
 
+	data->hw_blink = true;
 	for (i = 0; i < data->chip_info->num_leds; i++) {
 		struct pca9532_led *led = &data->leds[i];
 		struct pca9532_led *pled = &pdata->leds[i];
@@ -424,6 +429,8 @@ static int pca9532_configure(struct i2c_client *client,
 			pca9532_setled(led);
 			break;
 		case PCA9532_TYPE_N2100_BEEP:
+			/* PWM1 is reserved for beeper so blink will not use hardware */
+			data->hw_blink = false;
 			BUG_ON(data->idev);
 			led->state = PCA9532_PWM1;
 			pca9532_setled(led);
-- 
2.44.0


