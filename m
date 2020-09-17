Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5447C26E8AA
	for <lists+linux-leds@lfdr.de>; Fri, 18 Sep 2020 00:35:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726682AbgIQWfR (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 17 Sep 2020 18:35:17 -0400
Received: from mail.nic.cz ([217.31.204.67]:36162 "EHLO mail.nic.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726273AbgIQWeN (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Thu, 17 Sep 2020 18:34:13 -0400
Received: from dellmb.labs.office.nic.cz (unknown [IPv6:2001:1488:fffe:6:cac7:3539:7f1f:463])
        by mail.nic.cz (Postfix) with ESMTP id BEBBA142057;
        Fri, 18 Sep 2020 00:33:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
        t=1600382039; bh=r26L0sWbFofPCK5+uBb+ErS6T+5q3senbfA1NrJl0WA=;
        h=From:To:Date;
        b=WyufPwDEgDkCFWxv20zn7pofIKA0QKGszWLW5eamCBLQKlpm+lSvW8E1dqkiSRLRw
         E/LV7r+cW8SakWeX55LBvqMKynu93PJQTvOEvE4ECZfD2GhWnGFsYkjQJ9TMEkT9QP
         Av3Y6cTGg83/7m8QsbxyzQihngDokMnpZ56ZD/YE=
From:   =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>
To:     linux-leds@vger.kernel.org
Cc:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        =?UTF-8?q?Ond=C5=99ej=20Jirman?= <megous@megous.com>,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org,
        =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>,
        Simon Guinot <simon.guinot@sequanux.org>,
        Simon Guinot <sguinot@lacie.com>,
        Vincent Donnefort <vdonnefort@gmail.com>,
        Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH leds v2 36/50] leds: ns2: use devres LED registering function
Date:   Fri, 18 Sep 2020 00:33:24 +0200
Message-Id: <20200917223338.14164-37-marek.behun@nic.cz>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200917223338.14164-1-marek.behun@nic.cz>
References: <20200917223338.14164-1-marek.behun@nic.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.nic.cz
X-Spam-Status: No, score=0.00
X-Spamd-Bar: /
X-Virus-Scanned: clamav-milter 0.102.2 at mail
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

By using devres version of LED registering function we can remove the
.remove method from this driver. The probe method also gets simpler.

Signed-off-by: Marek Behún <marek.behun@nic.cz>
Cc: Simon Guinot <simon.guinot@sequanux.org>
Cc: Simon Guinot <sguinot@lacie.com>
Cc: Vincent Donnefort <vdonnefort@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/leds/leds-ns2.c | 30 ++----------------------------
 1 file changed, 2 insertions(+), 28 deletions(-)

diff --git a/drivers/leds/leds-ns2.c b/drivers/leds/leds-ns2.c
index 22d38c83b6dca..1a7ef66464b5d 100644
--- a/drivers/leds/leds-ns2.c
+++ b/drivers/leds/leds-ns2.c
@@ -227,16 +227,7 @@ create_ns2_led(struct platform_device *pdev, struct ns2_led_data *led_dat,
 	led_dat->cdev.brightness =
 		(mode == NS_V2_LED_OFF) ? LED_OFF : LED_FULL;
 
-	ret = led_classdev_register(&pdev->dev, &led_dat->cdev);
-	if (ret < 0)
-		return ret;
-
-	return 0;
-}
-
-static void delete_ns2_led(struct ns2_led_data *led_dat)
-{
-	led_classdev_unregister(&led_dat->cdev);
+	return devm_led_classdev_register(&pdev->dev, &led_dat->cdev);
 }
 
 #ifdef CONFIG_OF_GPIO
@@ -380,11 +371,8 @@ static int ns2_led_probe(struct platform_device *pdev)
 	for (i = 0; i < priv->num_leds; i++) {
 		ret = create_ns2_led(pdev, &priv->leds_data[i],
 				     &pdata->leds[i]);
-		if (ret < 0) {
-			for (i = i - 1; i >= 0; i--)
-				delete_ns2_led(&priv->leds_data[i]);
+		if (ret < 0)
 			return ret;
-		}
 	}
 
 	platform_set_drvdata(pdev, priv);
@@ -392,22 +380,8 @@ static int ns2_led_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int ns2_led_remove(struct platform_device *pdev)
-{
-	int i;
-	struct ns2_led_priv *priv;
-
-	priv = platform_get_drvdata(pdev);
-
-	for (i = 0; i < priv->num_leds; i++)
-		delete_ns2_led(&priv->leds_data[i]);
-
-	return 0;
-}
-
 static struct platform_driver ns2_led_driver = {
 	.probe		= ns2_led_probe,
-	.remove		= ns2_led_remove,
 	.driver		= {
 		.name		= "leds-ns2",
 		.of_match_table	= of_match_ptr(of_ns2_leds_match),
-- 
2.26.2

