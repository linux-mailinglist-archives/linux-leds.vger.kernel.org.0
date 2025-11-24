Return-Path: <linux-leds+bounces-6304-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 224CEC82787
	for <lists+linux-leds@lfdr.de>; Mon, 24 Nov 2025 22:05:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 187AE4E0681
	for <lists+linux-leds@lfdr.de>; Mon, 24 Nov 2025 21:05:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 725BC261B8D;
	Mon, 24 Nov 2025 21:05:38 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mail.prodrive-technologies.com (mail.prodrive-technologies.com [212.61.153.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 514082586C8;
	Mon, 24 Nov 2025 21:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.61.153.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764018338; cv=none; b=padzhhOCYjgAU7ikDJAIR4su90N/DB5YIYjowyAJENXtAoEKo1OWoisA6BvY82aWMQoxlGcHHdTF9Os8j34Fkj4Bp5GNd67oxVGf7258BdFRqS6pdoNLG4WmwJksk2vDORks5Wayk6Du8h6UCgKwW9tbvjsGXmg8LS+4xT+6On4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764018338; c=relaxed/simple;
	bh=qAY9uWjo2On3Knsq1B9cc5A7xmd2SMVecubLhi5DZs4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=j5U/S3Js4K577lDy74JTG3AQdjU6UtiP7kC633oGOndrJfq1IY0fbhXOHmKozqrVg0mQ/UO6RwsD/70quEQGKddjzN4ybWo/De6GYvzL9r6Fh/M1p49VBUxi6L2DpZQosKuPuOoGrX/OSJRJesbwLahHCvmufKKWuUm5B4QJkH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=prodrive-technologies.com; spf=pass smtp.mailfrom=prodrive-technologies.com; arc=none smtp.client-ip=212.61.153.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=prodrive-technologies.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=prodrive-technologies.com
Received: from EXCOP01.bk.prodrive.nl (10.1.0.22) by EXCOP01.bk.prodrive.nl
 (10.1.0.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 24 Nov
 2025 22:05:27 +0100
Received: from lnxdevrm02.prodrive.nl (10.1.1.121) by EXCOP01.bk.prodrive.nl
 (10.1.0.22) with Microsoft SMTP Server id 15.2.1544.4 via Frontend Transport;
 Mon, 24 Nov 2025 22:05:27 +0100
From: Martijn de Gouw <martijn.de.gouw@prodrive-technologies.com>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>
CC: Martijn de Gouw <martijn.de.gouw@prodrive-technologies.com>,
	<linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2] leds: group-multicolor: Add support for initial value.
Date: Mon, 24 Nov 2025 22:05:20 +0100
Message-ID: <20251124210521.2064660-1-martijn.de.gouw@prodrive-technologies.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

When the driver is loaded, it turned off all LEDs in the group. This
patch changes the driver to take over existing LED states and set
the brighness and intensity in the group accordingly.

Signed-off-by: Martijn de Gouw <martijn.de.gouw@prodrive-technologies.com>
---
 drivers/leds/rgb/leds-group-multicolor.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/rgb/leds-group-multicolor.c b/drivers/leds/rgb/leds-group-multicolor.c
index 548c7dd63ba1e..a12720d73f188 100644
--- a/drivers/leds/rgb/leds-group-multicolor.c
+++ b/drivers/leds/rgb/leds-group-multicolor.c
@@ -69,6 +69,7 @@ static int leds_gmc_probe(struct platform_device *pdev)
 	struct mc_subled *subled;
 	struct leds_multicolor *priv;
 	unsigned int max_brightness = 0;
+	unsigned int default_brightness = 0;
 	int i, ret, count = 0, common_flags = 0;
 
 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
@@ -96,6 +97,13 @@ static int leds_gmc_probe(struct platform_device *pdev)
 
 		max_brightness = max(max_brightness, led_cdev->max_brightness);
 
+		/*
+		 * If any LED is on, set brightness to the max brightness.
+		 * The actual brightness of the LED is set as intensity value.
+		 */
+		if (led_cdev->brightness)
+			default_brightness = max_brightness;
+
 		count++;
 	}
 
@@ -109,14 +117,16 @@ static int leds_gmc_probe(struct platform_device *pdev)
 
 		subled[i].color_index = led_cdev->color;
 
-		/* Configure the LED intensity to its maximum */
-		subled[i].intensity = max_brightness;
+		/* Configure the LED intensity to its current brightness */
+		subled[i].intensity = DIV_ROUND_CLOSEST(led_cdev->brightness * max_brightness,
+							led_cdev->max_brightness);
 	}
 
 	/* Initialise the multicolor's LED class device */
 	cdev = &priv->mc_cdev.led_cdev;
 	cdev->brightness_set_blocking = leds_gmc_set;
 	cdev->max_brightness = max_brightness;
+	cdev->brightness = default_brightness;
 	cdev->color = LED_COLOR_ID_MULTI;
 	priv->mc_cdev.num_colors = count;
 
-- 
2.39.2


