Return-Path: <linux-leds+bounces-4442-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 533CCA7EC11
	for <lists+linux-leds@lfdr.de>; Mon,  7 Apr 2025 21:08:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BCFCC3BE19E
	for <lists+linux-leds@lfdr.de>; Mon,  7 Apr 2025 19:02:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FA4325E44E;
	Mon,  7 Apr 2025 18:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Iaudiz2z"
X-Original-To: linux-leds@vger.kernel.org
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F8D1254858;
	Mon,  7 Apr 2025 18:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744050965; cv=none; b=OEGfdpVEacnAekSiKFyMtgnwYRaLuyg2UQHWRuCCq+DKZ+FoBIS4C/K3apVz+/cd8i4aFgQjMX7w+ptFIIDpZJvIpqf0d7KrjqSwf82FgX3F++gKmRtOTzsY3GSqgAAaD3wGurRLSjcKyKFSMydZjRX7i9kSQJpZgGLnbN+vxbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744050965; c=relaxed/simple;
	bh=3a6KMmj9e/29kk52raqwwr4z3+K1PHadmYKG3QFR23Q=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Q+Fl+MFOoUwZfV9bvvPNX66QQJ9r5lfRwWBGN56kIq1lNokR/vkGp+rallKuQpibcLg9jwAg6liyJncXty14RuQ7tR8CGS7b/LlauyYB/tiriv9tIoavbTfNXIuJqcuocSx3XvV9WNoZYkPdiGuoz9yBM9dBuqlEcUb8tkVpv2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=Iaudiz2z; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 537IZwdA446979
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 7 Apr 2025 13:35:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744050958;
	bh=BdL1BGhmr7yMEQ6ZLPxqOL52GEnRrsfSTXAD3c2bU0o=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=Iaudiz2ztCxbs0f35kbZjMMUPlLz1/5Sviw3/KnYPnHz6m49zuXUAGQ2InlUZV2ol
	 8H2kCCPquIqYxrWpIH2CNAxHrIXaU4scc6MK4T3+Wvd/RZxAoKSHrNODTPT4oic9mq
	 X/KZxVWetPB+RzoY0DzIB/T8RRFdIrID9KY6/2z0=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 537IZwaB048428
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 7 Apr 2025 13:35:58 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 7
 Apr 2025 13:35:57 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 7 Apr 2025 13:35:58 -0500
Received: from lelvsmtp6.itg.ti.com ([10.249.42.149])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 537IZuQq072942;
	Mon, 7 Apr 2025 13:35:57 -0500
From: Andrew Davis <afd@ti.com>
To: Pavel Machek <pavel@kernel.org>, Lee Jones <lee@kernel.org>
CC: <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Andrew Davis
	<afd@ti.com>
Subject: [PATCH 4/6] leds: lp8860: Enable regulator using enable_optional helper
Date: Mon, 7 Apr 2025 13:35:53 -0500
Message-ID: <20250407183555.409687-4-afd@ti.com>
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

This allows the regulator to be optional which is the same as
done here with all the checks for NULL. This also disables
on remove for us, so remove the manual disabling.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 drivers/leds/leds-lp8860.c | 31 ++++---------------------------
 1 file changed, 4 insertions(+), 27 deletions(-)

diff --git a/drivers/leds/leds-lp8860.c b/drivers/leds/leds-lp8860.c
index 4cd1b960d504f..f913a895d8a97 100644
--- a/drivers/leds/leds-lp8860.c
+++ b/drivers/leds/leds-lp8860.c
@@ -100,7 +100,6 @@ struct lp8860_led {
 	struct regmap *regmap;
 	struct regmap *eeprom_regmap;
 	struct gpio_desc *enable_gpio;
-	struct regulator *regulator;
 };
 
 static const struct reg_sequence lp8860_eeprom_disp_regs[] = {
@@ -232,15 +231,6 @@ static int lp8860_init(struct lp8860_led *led)
 	unsigned int read_buf;
 	int ret, reg_count;
 
-	if (led->regulator) {
-		ret = regulator_enable(led->regulator);
-		if (ret) {
-			dev_err(&led->client->dev,
-				"Failed to enable regulator\n");
-			return ret;
-		}
-	}
-
 	gpiod_direction_output(led->enable_gpio, 1);
 
 	ret = lp8860_fault_check(led);
@@ -282,13 +272,6 @@ static int lp8860_init(struct lp8860_led *led)
 	if (ret)
 		gpiod_direction_output(led->enable_gpio, 0);
 
-	if (led->regulator) {
-		ret = regulator_disable(led->regulator);
-		if (ret)
-			dev_err(&led->client->dev,
-				"Failed to disable regulator\n");
-	}
-
 	return ret;
 }
 
@@ -330,9 +313,10 @@ static int lp8860_probe(struct i2c_client *client)
 		return ret;
 	}
 
-	led->regulator = devm_regulator_get(&client->dev, "vled");
-	if (IS_ERR(led->regulator))
-		led->regulator = NULL;
+	ret = devm_regulator_get_enable_optional(&client->dev, "vled");
+	if (ret && ret != -ENODEV)
+		return dev_err_probe(&client->dev, ret,
+				     "Failed to enable vled regulator\n");
 
 	led->client = client;
 	led->led_dev.brightness_set_blocking = lp8860_brightness_set;
@@ -381,13 +365,6 @@ static void lp8860_remove(struct i2c_client *client)
 	int ret;
 
 	gpiod_direction_output(led->enable_gpio, 0);
-
-	if (led->regulator) {
-		ret = regulator_disable(led->regulator);
-		if (ret)
-			dev_err(&led->client->dev,
-				"Failed to disable regulator\n");
-	}
 }
 
 static const struct i2c_device_id lp8860_id[] = {
-- 
2.39.2


