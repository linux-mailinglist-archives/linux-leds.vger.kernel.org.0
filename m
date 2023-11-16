Return-Path: <linux-leds+bounces-21-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BCBB37EE96A
	for <lists+linux-leds@lfdr.de>; Thu, 16 Nov 2023 23:41:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5A4CBB209E8
	for <lists+linux-leds@lfdr.de>; Thu, 16 Nov 2023 22:41:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F22B1171E;
	Thu, 16 Nov 2023 22:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="PmOJMRQR"
X-Original-To: linux-leds@vger.kernel.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F883130;
	Thu, 16 Nov 2023 14:41:30 -0800 (PST)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3AGMfNnH025370;
	Thu, 16 Nov 2023 16:41:23 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1700174483;
	bh=4thN27hHqejhmVMCyJ7ddgFMYernFuj5amqf/33WzVk=;
	h=From:To:CC:Subject:Date;
	b=PmOJMRQRTOv4KZnchBRD2bkWIebguHeQj+d91ERCq4mT925dyH+WgPG3iJ/H+9R26
	 GPGz5JALVYYNIxiCz2W5r3iZpGGsMWnlgDDzdHQjgp9JhVpsyIV7oQmDo9tdXbFpmt
	 1rghKIwHvSAb7ua51NhYLgjcTnTWrijGTX5T0mrE=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3AGMfNR9128084
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 16 Nov 2023 16:41:23 -0600
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 16
 Nov 2023 16:41:23 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 16 Nov 2023 16:41:23 -0600
Received: from lelv0327.itg.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3AGMfMAW002939;
	Thu, 16 Nov 2023 16:41:23 -0600
From: Andrew Davis <afd@ti.com>
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>
CC: <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Andrew Davis
	<afd@ti.com>
Subject: [PATCH 1/2] leds: tca6507: Use devm_gpiochip_add_data() to simplify remove path
Date: Thu, 16 Nov 2023 16:41:20 -0600
Message-ID: <20231116224121.302150-1-afd@ti.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

Use devm version of gpiochip add function to handle removal for us.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 drivers/leds/leds-tca6507.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/leds/leds-tca6507.c b/drivers/leds/leds-tca6507.c
index e190746140959..9a6af6d8b5b5d 100644
--- a/drivers/leds/leds-tca6507.c
+++ b/drivers/leds/leds-tca6507.c
@@ -638,19 +638,13 @@ static int tca6507_probe_gpios(struct device *dev,
 	tca->gpio.direction_output = tca6507_gpio_direction_output;
 	tca->gpio.set = tca6507_gpio_set_value;
 	tca->gpio.parent = dev;
-	err = gpiochip_add_data(&tca->gpio, tca);
+	err = devm_gpiochip_add_data(dev, &tca->gpio, tca);
 	if (err) {
 		tca->gpio.ngpio = 0;
 		return err;
 	}
 	return 0;
 }
-
-static void tca6507_remove_gpio(struct tca6507_chip *tca)
-{
-	if (tca->gpio.ngpio)
-		gpiochip_remove(&tca->gpio);
-}
 #else /* CONFIG_GPIOLIB */
 static int tca6507_probe_gpios(struct device *dev,
 			       struct tca6507_chip *tca,
@@ -658,9 +652,6 @@ static int tca6507_probe_gpios(struct device *dev,
 {
 	return 0;
 }
-static void tca6507_remove_gpio(struct tca6507_chip *tca)
-{
-}
 #endif /* CONFIG_GPIOLIB */
 
 static struct tca6507_platform_data *
@@ -793,7 +784,6 @@ static void tca6507_remove(struct i2c_client *client)
 		if (tca_leds[i].led_cdev.name)
 			led_classdev_unregister(&tca_leds[i].led_cdev);
 	}
-	tca6507_remove_gpio(tca);
 	cancel_work_sync(&tca->work);
 }
 
-- 
2.39.2


