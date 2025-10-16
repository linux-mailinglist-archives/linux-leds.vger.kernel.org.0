Return-Path: <linux-leds+bounces-5797-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E60AEBE40A1
	for <lists+linux-leds@lfdr.de>; Thu, 16 Oct 2025 16:56:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7209919A73C6
	for <lists+linux-leds@lfdr.de>; Thu, 16 Oct 2025 14:57:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5510343D80;
	Thu, 16 Oct 2025 14:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=klarinett.li header.i=@klarinett.li header.b="ZVsv7fdL"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail.hostpark.net (mail.hostpark.net [212.243.197.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62456343D85;
	Thu, 16 Oct 2025 14:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.243.197.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760626602; cv=none; b=R15N9xxNF9XHbpIp2YThPDfkLrPOgV+v2X+3SmDZDbcPMxGN8p0NkQKC082eCM+1ihY7QcEnAjiGt6xTK+vRDW3mT4G5yT5SR9pqFalAxT6728wk34HIU2gjtkQbxiznoEgVgvXbaDPpG4eGjO/+hhJmQUKGnfV1EWEz7a9iOs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760626602; c=relaxed/simple;
	bh=Ek2ILsSfxxehyC+PgeYS48DStt27lqnZk8RnptziTzg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NrmKFPXm+QX0balA9XMRI3m0uBb/CtDDQNgNeck/xAgrurtSAAx3TFWZj748d94YEgCWIiSvm3dkSDGse4tbxSGGuIiN15Jvz9oq+hMlAUAWjKPTkEiQpAaWUreTTxhh7ERqu3SUxCVItEYASZG/KIGYA5Fsi7XZFyA7hGJi1eg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=klarinett.li; spf=pass smtp.mailfrom=klarinett.li; dkim=pass (1024-bit key) header.d=klarinett.li header.i=@klarinett.li header.b=ZVsv7fdL; arc=none smtp.client-ip=212.243.197.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=klarinett.li
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=klarinett.li
Received: from localhost (localhost [127.0.0.1])
	by mail.hostpark.net (Postfix) with ESMTP id 63EFC162C9;
	Thu, 16 Oct 2025 16:56:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=klarinett.li; h=
	content-transfer-encoding:mime-version:x-mailer:message-id:date
	:date:subject:subject:from:from; s=sel2011a; t=1760626588; bh=Ek
	2ILsSfxxehyC+PgeYS48DStt27lqnZk8RnptziTzg=; b=ZVsv7fdL7vfZ/HRUQW
	5uIoZtMyEds8t98Qt1FoxgSGOUKb3LwX46ffX9hNihkET6Z2BoeLHpNEuVwVSLue
	AN3O0kFRMPdxUCJ7IjIVGwXF5pZEGyALalL2Alz1EbXD+IP20IWnxMIr5/Az7mpu
	AXxmNn7VRVmwWGiE4r2P4/mE8=
X-Virus-Scanned: by Hostpark/NetZone Mailprotection at hostpark.net
Received: from mail.hostpark.net ([127.0.0.1])
 by localhost (mail0.hostpark.net [127.0.0.1]) (amavis, port 10224) with ESMTP
 id uyut2nYIzpeB; Thu, 16 Oct 2025 16:56:28 +0200 (CEST)
Received: from customer (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.hostpark.net (Postfix) with ESMTPSA id 65BF2162C2;
	Thu, 16 Oct 2025 16:56:27 +0200 (CEST)
From: Christian Hitz <christian@klarinett.li>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>,
	Dan Murphy <dmurphy@ti.com>
Cc: Christian Hitz <christian.hitz@bbv.ch>,
	stable@vger.kernel.org,
	Pavel Machek <pavel@ucw.cz>,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] leds: leds-lp50xx: enable chip before any communication
Date: Thu, 16 Oct 2025 16:56:23 +0200
Message-ID: <20251016145623.2863553-1-christian@klarinett.li>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Christian Hitz <christian.hitz@bbv.ch>

If a GPIO is used to control the chip's enable pin, it needs to be pulled
high before any SPI communication is attempted.
Split lp50xx_enable_disable() into two distinct functions to enforce
correct ordering.
Observe correct timing after manipulating the enable GPIO and SPI
communication.

Fixes: 242b81170fb8 ("leds: lp50xx: Add the LP50XX family of the RGB LED driver")

Signed-off-by: Christian Hitz <christian.hitz@bbv.ch>
Cc: stable@vger.kernel.org
---
 drivers/leds/leds-lp50xx.c | 51 +++++++++++++++++++++++++++-----------
 1 file changed, 36 insertions(+), 15 deletions(-)

diff --git a/drivers/leds/leds-lp50xx.c b/drivers/leds/leds-lp50xx.c
index d19b6a459151..f23e9ae434e4 100644
--- a/drivers/leds/leds-lp50xx.c
+++ b/drivers/leds/leds-lp50xx.c
@@ -52,6 +52,8 @@
 
 #define LP50XX_SW_RESET		0xff
 #define LP50XX_CHIP_EN		BIT(6)
+#define LP50XX_START_TIME_US	500
+#define LP50XX_RESET_TIME_US	3
 
 /* There are 3 LED outputs per bank */
 #define LP50XX_LEDS_PER_MODULE	3
@@ -374,19 +376,42 @@ static int lp50xx_reset(struct lp50xx *priv)
 	return regmap_write(priv->regmap, priv->chip_info->reset_reg, LP50XX_SW_RESET);
 }
 
-static int lp50xx_enable_disable(struct lp50xx *priv, int enable_disable)
+static int lp50xx_enable(struct lp50xx *priv)
 {
 	int ret;
 
-	ret = gpiod_direction_output(priv->enable_gpio, enable_disable);
+	if (priv->enable_gpio) {
+		ret = gpiod_direction_output(priv->enable_gpio, 1);
+		if (ret)
+			return ret;
+
+		udelay(LP50XX_START_TIME_US);
+	} else {
+		ret = lp50xx_reset(priv);
+		if (ret)
+			return ret;
+	}
+
+	return regmap_write(priv->regmap, LP50XX_DEV_CFG0, LP50XX_CHIP_EN);
+}
+
+static int lp50xx_disable(struct lp50xx *priv)
+{
+	int ret;
+
+	ret = regmap_write(priv->regmap, LP50XX_DEV_CFG0, 0);
 	if (ret)
 		return ret;
 
-	if (enable_disable)
-		return regmap_write(priv->regmap, LP50XX_DEV_CFG0, LP50XX_CHIP_EN);
-	else
-		return regmap_write(priv->regmap, LP50XX_DEV_CFG0, 0);
+	if (priv->enable_gpio) {
+		ret = gpiod_direction_output(priv->enable_gpio, 0);
+		if (ret)
+			return ret;
+
+		udelay(LP50XX_RESET_TIME_US);
+	}
 
+	return 0;
 }
 
 static int lp50xx_probe_leds(struct fwnode_handle *child, struct lp50xx *priv,
@@ -453,6 +478,10 @@ static int lp50xx_probe_dt(struct lp50xx *priv)
 		return dev_err_probe(priv->dev, PTR_ERR(priv->enable_gpio),
 				     "Failed to get enable GPIO\n");
 
+	ret = lp50xx_enable(priv);
+	if (ret)
+		return ret;
+
 	priv->regulator = devm_regulator_get(priv->dev, "vled");
 	if (IS_ERR(priv->regulator))
 		priv->regulator = NULL;
@@ -550,14 +579,6 @@ static int lp50xx_probe(struct i2c_client *client)
 		return ret;
 	}
 
-	ret = lp50xx_reset(led);
-	if (ret)
-		return ret;
-
-	ret = lp50xx_enable_disable(led, 1);
-	if (ret)
-		return ret;
-
 	return lp50xx_probe_dt(led);
 }
 
@@ -566,7 +587,7 @@ static void lp50xx_remove(struct i2c_client *client)
 	struct lp50xx *led = i2c_get_clientdata(client);
 	int ret;
 
-	ret = lp50xx_enable_disable(led, 0);
+	ret = lp50xx_disable(led);
 	if (ret)
 		dev_err(led->dev, "Failed to disable chip\n");
 
-- 
2.51.0


