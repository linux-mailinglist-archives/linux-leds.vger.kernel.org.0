Return-Path: <linux-leds+bounces-1928-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C6701908945
	for <lists+linux-leds@lfdr.de>; Fri, 14 Jun 2024 12:07:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6A9FF283D8F
	for <lists+linux-leds@lfdr.de>; Fri, 14 Jun 2024 10:07:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBAAE1946D5;
	Fri, 14 Jun 2024 10:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="alvdrXnc"
X-Original-To: linux-leds@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5717C192B7D;
	Fri, 14 Jun 2024 10:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718359480; cv=none; b=Z5df6HCpr3ojH8Sw5qFiKsOotQJefgxYDSxKx2lEdn78yB4D5Yapk5QQAFnjlyirVKFMDXOqKbUsptxBho/G/KzHoXMvyTfWtX4iryWcCr9LmBBi6Wo7k3aPJOaSaBbNa6ccCGFtOIjfI5UF7ZaLTGjpY/9hxutqH0RGCL/HZQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718359480; c=relaxed/simple;
	bh=G7HAy6RB0CVVPe1ouzdeSx44OWMoH2sLvWjILX5aMx4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Tn5OHkzJBKXjwrNocmoHHQLDwdjGzGzTLdbVE1aCP/dowy3W/JAdXcbo8zbT2b0FedPZizOI9sQnCDmOBJr6HK7r2gh0R8CT9GGJFPddI0A/KIqJRnUd5xbN+bFVwCb253cC5YXw2Xmuoe0H6EEua4gsbhBDG54L+WScg3kYHY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=alvdrXnc; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1718359476;
	bh=G7HAy6RB0CVVPe1ouzdeSx44OWMoH2sLvWjILX5aMx4=;
	h=From:Date:Subject:To:Cc:From;
	b=alvdrXncrJYx/H4SKHJ+FwREHFnwadGfM/9/k7tCPI8KM6OAKkvg1E6NjhtahnJcW
	 dLYTa1qt8ITwUDFn7wL4CFmESI0OW9fymJhkU/SOPTJEmP/EUXsYKsbcLUPBU/Xi+2
	 6RIf7t3FQ5WPsmN3xvR3r1vHvrploSS32H/kEwAQ=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Fri, 14 Jun 2024 12:04:29 +0200
Subject: [PATCH] leds: cros_ec: Implement review comments from Lee
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240614-cros_ec-led-review-v1-1-946f2549fac2@weissschuh.net>
X-B4-Tracking: v=1; b=H4sIAKwVbGYC/x3M0QpAQBBG4VfRXJvCongVSWv8mBLaLZS8u+XyX
 HznJg+n8FRHNzkc6nVbQ6RxRDLbdQLrEJqyJMuTMs1Z3OY7CC8Y+AM4GVIZ20tZVMZQgLvDqNc
 /bdrneQHG9gOxZAAAAA==
To: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas@weissschuh.net>, 
 Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
 Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>
Cc: linux-leds@vger.kernel.org, chrome-platform@lists.linux.dev, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1718359476; l=4274;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=G7HAy6RB0CVVPe1ouzdeSx44OWMoH2sLvWjILX5aMx4=;
 b=uiD9pGnNZpgmiwedlFEzAECWQGAArHZE2wsPQAYu6qGS7H/vXYgZO0fDn0T+g3JB6IlMH67hO
 cMAHGEqL/dgCM9YsqvSGinGeo9eDksCEclZj9obm1pG9aRzX09ZrhN7
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

Implement review comments from Lee as requested in [0] for
"leds: Add ChromeOS EC driver".

Changes:
* Inline DRV_NAME string constant.
* Use dev_err() instead of dev_warn() to report errors.
* Rename cros_ec_led_probe_led() to cros_ec_led_probe_one().
* Make loop variable "int" where they belong.
* Move "Unknown LED" comment to where it belongs.
* Register trigger during _probe().
* Use module_platform_driver() and drop all the custom boilerplate.

[0] https://lore.kernel.org/lkml/20240614093445.GF3029315@google.com/T/#m8750abdef6a968ace765645189170814196c9ce9

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 drivers/leds/leds-cros_ec.c | 50 +++++++++++++--------------------------------
 1 file changed, 14 insertions(+), 36 deletions(-)

diff --git a/drivers/leds/leds-cros_ec.c b/drivers/leds/leds-cros_ec.c
index 7bb21a587713..275522b81ea5 100644
--- a/drivers/leds/leds-cros_ec.c
+++ b/drivers/leds/leds-cros_ec.c
@@ -14,8 +14,6 @@
 #include <linux/platform_data/cros_ec_commands.h>
 #include <linux/platform_data/cros_ec_proto.h>
 
-#define DRV_NAME	"cros-ec-led"
-
 static const char * const cros_ec_led_functions[] = {
 	[EC_LED_ID_BATTERY_LED]            = LED_FUNCTION_CHARGING,
 	[EC_LED_ID_POWER_LED]              = LED_FUNCTION_POWER,
@@ -152,7 +150,7 @@ static int cros_ec_led_count_subleds(struct device *dev,
 
 		if (common_range != range) {
 			/* The multicolor LED API expects a uniform max_brightness */
-			dev_warn(dev, "Inconsistent LED brightness values\n");
+			dev_err(dev, "Inconsistent LED brightness values\n");
 			return -EINVAL;
 		}
 	}
@@ -176,22 +174,21 @@ static const char *cros_ec_led_get_color_name(struct led_classdev_mc *led_mc_cde
 	return led_get_color_name(color);
 }
 
-static int cros_ec_led_probe_led(struct device *dev, struct cros_ec_device *cros_ec,
+static int cros_ec_led_probe_one(struct device *dev, struct cros_ec_device *cros_ec,
 				 enum ec_led_id id)
 {
 	union cros_ec_led_cmd_data arg = {};
 	struct cros_ec_led_priv *priv;
 	struct led_classdev *led_cdev;
 	struct mc_subled *subleds;
-	int ret, num_subleds;
-	size_t i, subled;
+	int i, ret, num_subleds;
+	size_t subled;
 
 	arg.req.led_id = id;
 	arg.req.flags = EC_LED_FLAGS_QUERY;
 	ret = cros_ec_led_send_cmd(cros_ec, &arg);
-	/* Unknown LED, skip */
 	if (ret == -EINVAL)
-		return 0;
+		return 0; /* Unknown LED, skip */
 	if (ret == -EOPNOTSUPP)
 		return -ENODEV;
 	if (ret < 0)
@@ -247,11 +244,14 @@ static int cros_ec_led_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct cros_ec_dev *ec_dev = dev_get_drvdata(dev->parent);
 	struct cros_ec_device *cros_ec = ec_dev->ec_dev;
-	int ret = 0;
-	size_t i;
+	int i, ret = 0;
+
+	ret = devm_led_trigger_register(dev, &cros_ec_led_trigger);
+	if (ret)
+		return ret;
 
 	for (i = 0; i < EC_LED_ID_COUNT; i++) {
-		ret = cros_ec_led_probe_led(dev, cros_ec, i);
+		ret = cros_ec_led_probe_one(dev, cros_ec, i);
 		if (ret)
 			break;
 	}
@@ -260,38 +260,16 @@ static int cros_ec_led_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id cros_ec_led_id[] = {
-	{ DRV_NAME, 0 },
+	{ "cros-ec-led", 0 },
 	{}
 };
 
 static struct platform_driver cros_ec_led_driver = {
-	.driver.name	= DRV_NAME,
+	.driver.name	= "cros-ec-led",
 	.probe		= cros_ec_led_probe,
 	.id_table	= cros_ec_led_id,
 };
-
-static int __init cros_ec_led_init(void)
-{
-	int ret;
-
-	ret = led_trigger_register(&cros_ec_led_trigger);
-	if (ret)
-		return ret;
-
-	ret = platform_driver_register(&cros_ec_led_driver);
-	if (ret)
-		led_trigger_unregister(&cros_ec_led_trigger);
-
-	return ret;
-};
-module_init(cros_ec_led_init);
-
-static void __exit cros_ec_led_exit(void)
-{
-	platform_driver_unregister(&cros_ec_led_driver);
-	led_trigger_unregister(&cros_ec_led_trigger);
-};
-module_exit(cros_ec_led_exit);
+module_platform_driver(cros_ec_led_driver);
 
 MODULE_DEVICE_TABLE(platform, cros_ec_led_id);
 MODULE_DESCRIPTION("ChromeOS EC LED Driver");

---
base-commit: b6774dd948171c478c7aa19318b1d7ae9cf6d7a4
change-id: 20240614-cros_ec-led-review-ec93abc65933

Best regards,
-- 
Thomas Weißschuh <linux@weissschuh.net>


