Return-Path: <linux-leds+bounces-4440-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 78F16A7EC2E
	for <lists+linux-leds@lfdr.de>; Mon,  7 Apr 2025 21:11:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 78F6A446197
	for <lists+linux-leds@lfdr.de>; Mon,  7 Apr 2025 19:02:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 046CB25E440;
	Mon,  7 Apr 2025 18:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="YR2gP/Yd"
X-Original-To: linux-leds@vger.kernel.org
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 619FC25487D;
	Mon,  7 Apr 2025 18:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744050964; cv=none; b=hjLf+lcCMIscpWQNMWOt/B5Ywd/5sFO3+6ruc7ygjxtWqTsPMQGyYdtI1CQO0fBprYn3Q9+ckxxT/J8sRT32kC433rzgEAjCMQKJAAeHPi3ZpV+F/MeK0xFKBMSMu7o3CNUOH8vjePgAE6Rl+6nomLb55gwhWJPbROayDk8ddQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744050964; c=relaxed/simple;
	bh=yNaJEimCo4WkfEa7h25jnR5wd51/T+H07fAqq0lXrgI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=REvUwhQXWYp3IAqEIqlGERkIUcdFnJPckMYO9kpI7Q6/GSn495ZqWV+EP+5K8QFygj3UBiQ/Sx+bOGVwSdBZkX8PglhOXCRiWmIRflgDNLNYaeD8ZXL1C2xq7JtDZh166mKKW/3CFdKKsPNyNK3O/h9jMJrWDO7uUDUO4I8acfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=YR2gP/Yd; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 537IZvP6446975
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 7 Apr 2025 13:35:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744050957;
	bh=I0bQFuwF+tvwcknZPRO59RODH2vQWhzkEhJenpNV/Bo=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=YR2gP/YdYcnTjWboSkSBZHqUEc58IcWYzKHMHjy1mbhO7m+aHeE2sOthSchCEaa2j
	 0IwvxD8NoDIPhEaSTKOFw1RYeWsThzj3oYU0cKh/zkUcW3Y6+AFDpTF1Xy5xKX9tQY
	 8fSsgKABc8VkHaL+Iuf0bFmHHYiQrs6o5mhhPAgU=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 537IZv53001097
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 7 Apr 2025 13:35:57 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 7
 Apr 2025 13:35:57 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 7 Apr 2025 13:35:57 -0500
Received: from lelvsmtp6.itg.ti.com ([10.249.42.149])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 537IZuQo072942;
	Mon, 7 Apr 2025 13:35:57 -0500
From: Andrew Davis <afd@ti.com>
To: Pavel Machek <pavel@kernel.org>, Lee Jones <lee@kernel.org>
CC: <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Andrew Davis
	<afd@ti.com>
Subject: [PATCH 2/6] leds: lp8860: Use new mutex guards to cleanup function exits
Date: Mon, 7 Apr 2025 13:35:51 -0500
Message-ID: <20250407183555.409687-2-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250407183555.409687-1-afd@ti.com>
References: <20250407183555.409687-1-afd@ti.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Use scoped mutex guards to simplify return paths. While here use
devm_mutex_init() to register the muxex so it also is cleaned
up automatically.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 drivers/leds/leds-lp8860.c | 27 +++++++++++----------------
 1 file changed, 11 insertions(+), 16 deletions(-)

diff --git a/drivers/leds/leds-lp8860.c b/drivers/leds/leds-lp8860.c
index 2b1c68e609495..2d91f476f0b79 100644
--- a/drivers/leds/leds-lp8860.c
+++ b/drivers/leds/leds-lp8860.c
@@ -135,7 +135,7 @@ static int lp8860_unlock_eeprom(struct lp8860_led *led, int lock)
 {
 	int ret;
 
-	mutex_lock(&led->lock);
+	guard(mutex)(&led->lock);
 
 	if (lock == LP8860_UNLOCK_EEPROM) {
 		ret = regmap_write(led->regmap,
@@ -143,7 +143,7 @@ static int lp8860_unlock_eeprom(struct lp8860_led *led, int lock)
 			LP8860_EEPROM_CODE_1);
 		if (ret) {
 			dev_err(&led->client->dev, "EEPROM Unlock failed\n");
-			goto out;
+			return ret;
 		}
 
 		ret = regmap_write(led->regmap,
@@ -151,14 +151,14 @@ static int lp8860_unlock_eeprom(struct lp8860_led *led, int lock)
 			LP8860_EEPROM_CODE_2);
 		if (ret) {
 			dev_err(&led->client->dev, "EEPROM Unlock failed\n");
-			goto out;
+			return ret;
 		}
 		ret = regmap_write(led->regmap,
 			LP8860_EEPROM_UNLOCK,
 			LP8860_EEPROM_CODE_3);
 		if (ret) {
 			dev_err(&led->client->dev, "EEPROM Unlock failed\n");
-			goto out;
+			return ret;
 		}
 	} else {
 		ret = regmap_write(led->regmap,
@@ -166,8 +166,6 @@ static int lp8860_unlock_eeprom(struct lp8860_led *led, int lock)
 			LP8860_LOCK_EEPROM);
 	}
 
-out:
-	mutex_unlock(&led->lock);
 	return ret;
 }
 
@@ -204,30 +202,29 @@ static int lp8860_brightness_set(struct led_classdev *led_cdev,
 	int disp_brightness = brt_val * 255;
 	int ret;
 
-	mutex_lock(&led->lock);
+	guard(mutex)(&led->lock);
 
 	ret = lp8860_fault_check(led);
 	if (ret) {
 		dev_err(&led->client->dev, "Cannot read/clear faults\n");
-		goto out;
+		return ret;
 	}
 
 	ret = regmap_write(led->regmap, LP8860_DISP_CL1_BRT_MSB,
 			(disp_brightness & 0xff00) >> 8);
 	if (ret) {
 		dev_err(&led->client->dev, "Cannot write CL1 MSB\n");
-		goto out;
+		return ret;
 	}
 
 	ret = regmap_write(led->regmap, LP8860_DISP_CL1_BRT_LSB,
 			disp_brightness & 0xff);
 	if (ret) {
 		dev_err(&led->client->dev, "Cannot write CL1 LSB\n");
-		goto out;
+		return ret;
 	}
-out:
-	mutex_unlock(&led->lock);
-	return ret;
+
+	return 0;
 }
 
 static int lp8860_init(struct lp8860_led *led)
@@ -392,7 +389,7 @@ static int lp8860_probe(struct i2c_client *client)
 	led->client = client;
 	led->led_dev.brightness_set_blocking = lp8860_brightness_set;
 
-	mutex_init(&led->lock);
+	devm_mutex_init(&client->dev, &led->lock);
 
 	i2c_set_clientdata(client, led);
 
@@ -443,8 +440,6 @@ static void lp8860_remove(struct i2c_client *client)
 			dev_err(&led->client->dev,
 				"Failed to disable regulator\n");
 	}
-
-	mutex_destroy(&led->lock);
 }
 
 static const struct i2c_device_id lp8860_id[] = {
-- 
2.39.2


