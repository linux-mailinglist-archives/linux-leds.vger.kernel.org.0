Return-Path: <linux-leds+bounces-5925-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D9E0C15A60
	for <lists+linux-leds@lfdr.de>; Tue, 28 Oct 2025 17:01:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A77D75672DF
	for <lists+linux-leds@lfdr.de>; Tue, 28 Oct 2025 15:53:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88EE83451C1;
	Tue, 28 Oct 2025 15:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=klarinett.li header.i=@klarinett.li header.b="sU3vrLm8"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail.hostpark.net (mail.hostpark.net [212.243.197.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95480343D8E;
	Tue, 28 Oct 2025 15:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.243.197.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761666721; cv=none; b=AyeZRTZa6JzQREsSnlo2RVd8Nf8NL9nLAmWAUPX9PT4g2meArdiQylUPsH/smDXwL5DttgBM9yX0VAvi5AYSKIBacoSxkQva/e734+kGJFNW7zBV0HMjbRLo+FOFYKflxmRbdq+DjQVQjeQR3uYJAOEkQuwLu/RvOHykQprkqcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761666721; c=relaxed/simple;
	bh=UF7eSuEBBdlXuSqT26s0+lsJpdaez8Svv47ZTzarpIs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=LMDnC24/VQSzhLsgMfgs2X4dBkLPyZTC8K5rON2FdT1KL9nrKaGdrb9UARHMoBrHsgaTs+WpH4aA+RuoLC9dhCUwOXUwlNOWqz0ruqz47gbhQ3fVpXq+7yptxEZT1H+Kigv6v50cj/akFEVDaewzv4/+qC+QOB47dUT+WRcMiV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=klarinett.li; spf=pass smtp.mailfrom=klarinett.li; dkim=pass (1024-bit key) header.d=klarinett.li header.i=@klarinett.li header.b=sU3vrLm8; arc=none smtp.client-ip=212.243.197.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=klarinett.li
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=klarinett.li
Received: from localhost (localhost [127.0.0.1])
	by mail.hostpark.net (Postfix) with ESMTP id C604216671;
	Tue, 28 Oct 2025 16:51:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=klarinett.li; h=
	content-transfer-encoding:content-type:content-type:mime-version
	:x-mailer:message-id:date:date:subject:subject:from:from; s=
	sel2011a; t=1761666710; bh=UF7eSuEBBdlXuSqT26s0+lsJpdaez8Svv47ZT
	zarpIs=; b=sU3vrLm8D70pJncbAaulxbwjFz7FSfJo+BF/6B9QHXWUoFcuKc/KA
	L23GlfowfHJKrE58uW7CVirHmDp32MC9mBu5b556XLy00wbq0YRXzjjSNhqdeNFt
	aNKlS1cLIQ5LGeyiiXXumhltjppkXASLisc/swV+KNemMhqjf2VaaM=
X-Virus-Scanned: by Hostpark/NetZone Mailprotection at hostpark.net
Received: from mail.hostpark.net ([127.0.0.1])
 by localhost (mail1.hostpark.net [127.0.0.1]) (amavis, port 10224) with ESMTP
 id KygcuKzd1zPM; Tue, 28 Oct 2025 16:51:50 +0100 (CET)
Received: from customer (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.hostpark.net (Postfix) with ESMTPSA id 5F3AF16148;
	Tue, 28 Oct 2025 16:51:48 +0100 (CET)
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
Subject: [PATCH v2] leds: leds-lp50xx: enable chip before any communication
Date: Tue, 28 Oct 2025 16:51:40 +0100
Message-ID: <20251028155141.1603193-1-christian@klarinett.li>
X-Mailer: git-send-email 2.51.1
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Christian Hitz <christian.hitz@bbv.ch>

If a GPIO is used to control the chip's enable pin, it needs to be pulled
high before any i2c communication is attempted.

Currently, the enable GPIO handling is not correct.

Assume the enable GPIO is low when the probe function is entered. In this
case the device is in SHUTDOWN mode and does not react to i2c commands.

During probe the following sequence happens:
 1. The call to lp50xx_reset() on line 548 has no effect as i2c is not
    possible yet.
 2. Then - on line 552 - lp50xx_enable_disable() is called. As
    "priv->enable_gpio“ has not yet been initialized, setting the GPIO has
    no effect. Also the i2c enable command is not executed as the device
    is still in SHUTDOWN.
 3. On line 556 the call to lp50xx_probe_dt() finally parses the rest of
    the DT and the configured priv->enable_gpio is set up.

As a result the device is still in SHUTDOWN mode and not ready for
operation.

Split lp50xx_enable_disable() into distinct enable and disable functions
to enforce correct ordering between enable_gpio manipulations and i2c
commands.
Read enable_gpio configuration from DT before attempting to manipulate
enable_gpio.
Add delays to observe correct wait timing after manipulating enable_gpio
and before any i2c communication.

Fixes: 242b81170fb8 ("leds: lp50xx: Add the LP50XX family of the RGB LED driver")

Cc: stable@vger.kernel.org
Signed-off-by: Christian Hitz <christian.hitz@bbv.ch>
---
Changes in v2:
 - Unconditionally reset in lp50xx_enable
 - Define magic numbers
 - Improve log message
---
 drivers/leds/leds-lp50xx.c | 55 +++++++++++++++++++++++++++-----------
 1 file changed, 40 insertions(+), 15 deletions(-)

diff --git a/drivers/leds/leds-lp50xx.c b/drivers/leds/leds-lp50xx.c
index 94f8ef6b482c..d3485d814cf4 100644
--- a/drivers/leds/leds-lp50xx.c
+++ b/drivers/leds/leds-lp50xx.c
@@ -50,6 +50,12 @@
 
 #define LP50XX_SW_RESET		0xff
 #define LP50XX_CHIP_EN		BIT(6)
+#define LP50XX_CHIP_DISABLE	0x00
+#define LP50XX_START_TIME_US	500
+#define LP50XX_RESET_TIME_US	3
+
+#define LP50XX_EN_GPIO_LOW	0
+#define LP50XX_EN_GPIO_HIGH	1
 
 /* There are 3 LED outputs per bank */
 #define LP50XX_LEDS_PER_MODULE	3
@@ -371,19 +377,42 @@ static int lp50xx_reset(struct lp50xx *priv)
 	return regmap_write(priv->regmap, priv->chip_info->reset_reg, LP50XX_SW_RESET);
 }
 
-static int lp50xx_enable_disable(struct lp50xx *priv, int enable_disable)
+static int lp50xx_enable(struct lp50xx *priv)
 {
 	int ret;
 
-	ret = gpiod_direction_output(priv->enable_gpio, enable_disable);
+	if (priv->enable_gpio) {
+		ret = gpiod_direction_output(priv->enable_gpio, LP50XX_EN_GPIO_HIGH);
+		if (ret)
+			return ret;
+
+		udelay(LP50XX_START_TIME_US);
+	}
+
+	ret = lp50xx_reset(priv);
 	if (ret)
 		return ret;
 
-	if (enable_disable)
-		return regmap_write(priv->regmap, LP50XX_DEV_CFG0, LP50XX_CHIP_EN);
-	else
-		return regmap_write(priv->regmap, LP50XX_DEV_CFG0, 0);
+	return regmap_write(priv->regmap, LP50XX_DEV_CFG0, LP50XX_CHIP_EN);
+}
 
+static int lp50xx_disable(struct lp50xx *priv)
+{
+	int ret;
+
+	ret = regmap_write(priv->regmap, LP50XX_DEV_CFG0, LP50XX_CHIP_DISABLE);
+	if (ret)
+		return ret;
+
+	if (priv->enable_gpio) {
+		ret = gpiod_direction_output(priv->enable_gpio, LP50XX_EN_GPIO_LOW);
+		if (ret)
+			return ret;
+
+		udelay(LP50XX_RESET_TIME_US);
+	}
+
+	return 0;
 }
 
 static int lp50xx_probe_leds(struct fwnode_handle *child, struct lp50xx *priv,
@@ -447,6 +476,10 @@ static int lp50xx_probe_dt(struct lp50xx *priv)
 		return dev_err_probe(priv->dev, PTR_ERR(priv->enable_gpio),
 				     "Failed to get enable GPIO\n");
 
+	ret = lp50xx_enable(priv);
+	if (ret)
+		return ret;
+
 	priv->regulator = devm_regulator_get(priv->dev, "vled");
 	if (IS_ERR(priv->regulator))
 		priv->regulator = NULL;
@@ -547,14 +580,6 @@ static int lp50xx_probe(struct i2c_client *client)
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
 
@@ -563,7 +588,7 @@ static void lp50xx_remove(struct i2c_client *client)
 	struct lp50xx *led = i2c_get_clientdata(client);
 	int ret;
 
-	ret = lp50xx_enable_disable(led, 0);
+	ret = lp50xx_disable(led);
 	if (ret)
 		dev_err(led->dev, "Failed to disable chip\n");
 
-- 
2.51.1


