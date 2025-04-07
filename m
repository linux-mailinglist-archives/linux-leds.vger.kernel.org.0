Return-Path: <linux-leds+bounces-4439-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ECD0A7EC1E
	for <lists+linux-leds@lfdr.de>; Mon,  7 Apr 2025 21:10:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DC2E13BFA2C
	for <lists+linux-leds@lfdr.de>; Mon,  7 Apr 2025 19:02:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8717425DD1A;
	Mon,  7 Apr 2025 18:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="T/wDoKe4"
X-Original-To: linux-leds@vger.kernel.org
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4A8C254AE3;
	Mon,  7 Apr 2025 18:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744050964; cv=none; b=mn84jY+0P7pJZLEp+GzxreS92K7n6Glx8DvVKXggk6c+AgRn5Z8c1c3Oyy9WEE0gMb21gLdIedsxKdkCANWHhg6jmNuiGNTRzxEH7oWGwUDpwjgfi3mTnlnn0w3ESPWY6O+XYZC66MzSg2s+yFCf9jJeBniiNbnLNmfIz1pTIgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744050964; c=relaxed/simple;
	bh=mTfyDZRB8dARD8uRRsYYR11hJg9BOSl8iO5E1H5SaNU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oR5GkOBzxONSi+XnUUAklvS8G0bY6xs5jzIllJ4gQipdaqetEija9LZz/W+JGcpXvhcObp3IoLrXcyupTWiIOIlIbC9PwNivLVVInAmQIuAJ8yFompiLPHfL4rpRA4yCcBcd7GwhGqll3tZR+tI1skRzsWqBo6XB8d6Y2OT147c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=T/wDoKe4; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 537IZw4W313999
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 7 Apr 2025 13:35:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744050958;
	bh=u+N5OhOWl/uSBLane2QUCm7X/tM4BsEnFpS9xjmDRqs=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=T/wDoKe4aR1zBPNaMQdHY2cI5urE4iX4CK++840DhXciaKZR4P4JH0vwRrl80Gj56
	 YDQ4YazqqJf2Cyp9Tq1OdnTlKGDvWT9/67DCeOiIfSfSWmXejD2je2ZcFR+D2/+67v
	 OPOnX92eE4smdLPJDG63VHP8sYcA7jeGk0j2aR+I=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 537IZwnN001102
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 7 Apr 2025 13:35:58 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 7
 Apr 2025 13:35:58 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 7 Apr 2025 13:35:58 -0500
Received: from lelvsmtp6.itg.ti.com ([10.249.42.149])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 537IZuQr072942;
	Mon, 7 Apr 2025 13:35:58 -0500
From: Andrew Davis <afd@ti.com>
To: Pavel Machek <pavel@kernel.org>, Lee Jones <lee@kernel.org>
CC: <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Andrew Davis
	<afd@ti.com>
Subject: [PATCH 5/6] leds: lp8860: Only unlock in lp8860_unlock_eeprom()
Date: Mon, 7 Apr 2025 13:35:54 -0500
Message-ID: <20250407183555.409687-5-afd@ti.com>
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

Locking is a single register write, so no need to have the unlock
function also lock. This removes the need to pass in the option
and reduces the nesting level in the function.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 drivers/leds/leds-lp8860.c | 48 ++++++++++++++------------------------
 1 file changed, 18 insertions(+), 30 deletions(-)

diff --git a/drivers/leds/leds-lp8860.c b/drivers/leds/leds-lp8860.c
index f913a895d8a97..088610988138f 100644
--- a/drivers/leds/leds-lp8860.c
+++ b/drivers/leds/leds-lp8860.c
@@ -130,39 +130,27 @@ static const struct reg_sequence lp8860_eeprom_disp_regs[] = {
 	{ LP8860_EEPROM_REG_24, 0x3E },
 };
 
-static int lp8860_unlock_eeprom(struct lp8860_led *led, int lock)
+static int lp8860_unlock_eeprom(struct lp8860_led *led)
 {
 	int ret;
 
 	guard(mutex)(&led->lock);
 
-	if (lock == LP8860_UNLOCK_EEPROM) {
-		ret = regmap_write(led->regmap,
-			LP8860_EEPROM_UNLOCK,
-			LP8860_EEPROM_CODE_1);
-		if (ret) {
-			dev_err(&led->client->dev, "EEPROM Unlock failed\n");
-			return ret;
-		}
-
-		ret = regmap_write(led->regmap,
-			LP8860_EEPROM_UNLOCK,
-			LP8860_EEPROM_CODE_2);
-		if (ret) {
-			dev_err(&led->client->dev, "EEPROM Unlock failed\n");
-			return ret;
-		}
-		ret = regmap_write(led->regmap,
-			LP8860_EEPROM_UNLOCK,
-			LP8860_EEPROM_CODE_3);
-		if (ret) {
-			dev_err(&led->client->dev, "EEPROM Unlock failed\n");
-			return ret;
-		}
-	} else {
-		ret = regmap_write(led->regmap,
-			LP8860_EEPROM_UNLOCK,
-			LP8860_LOCK_EEPROM);
+	ret = regmap_write(led->regmap, LP8860_EEPROM_UNLOCK, LP8860_EEPROM_CODE_1);
+	if (ret) {
+		dev_err(&led->client->dev, "EEPROM Unlock failed\n");
+		return ret;
+	}
+
+	ret = regmap_write(led->regmap, LP8860_EEPROM_UNLOCK, LP8860_EEPROM_CODE_2);
+	if (ret) {
+		dev_err(&led->client->dev, "EEPROM Unlock failed\n");
+		return ret;
+	}
+	ret = regmap_write(led->regmap, LP8860_EEPROM_UNLOCK, LP8860_EEPROM_CODE_3);
+	if (ret) {
+		dev_err(&led->client->dev, "EEPROM Unlock failed\n");
+		return ret;
 	}
 
 	return ret;
@@ -241,7 +229,7 @@ static int lp8860_init(struct lp8860_led *led)
 	if (ret)
 		goto out;
 
-	ret = lp8860_unlock_eeprom(led, LP8860_UNLOCK_EEPROM);
+	ret = lp8860_unlock_eeprom(led);
 	if (ret) {
 		dev_err(&led->client->dev, "Failed unlocking EEPROM\n");
 		goto out;
@@ -254,7 +242,7 @@ static int lp8860_init(struct lp8860_led *led)
 		goto out;
 	}
 
-	ret = lp8860_unlock_eeprom(led, LP8860_LOCK_EEPROM);
+	ret = regmap_write(led->regmap, LP8860_EEPROM_UNLOCK, LP8860_LOCK_EEPROM);
 	if (ret)
 		goto out;
 
-- 
2.39.2


