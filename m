Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A14626E890
	for <lists+linux-leds@lfdr.de>; Fri, 18 Sep 2020 00:34:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726553AbgIQWeo (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 17 Sep 2020 18:34:44 -0400
Received: from mail.nic.cz ([217.31.204.67]:35842 "EHLO mail.nic.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726344AbgIQWeS (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Thu, 17 Sep 2020 18:34:18 -0400
Received: from dellmb.labs.office.nic.cz (unknown [IPv6:2001:1488:fffe:6:cac7:3539:7f1f:463])
        by mail.nic.cz (Postfix) with ESMTP id 88985142066;
        Fri, 18 Sep 2020 00:34:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
        t=1600382041; bh=KyoQbN7zEtG1uv+Pu41Y0V6Z7eh7NxeLV28us6kXmE8=;
        h=From:To:Date;
        b=tmtTVYUaZxj57qHSwsrDrCOHMwRCTfX6m4ST8tOxjUYS8FNAqPlKj97GPxK+WxHSF
         44alVESairypb+d5e1dSTnrJVYKkRKp4c08WGUiLPvlu2jOtpNkAmiOdPEVH55YcK1
         1F6H74x3SSJ8VoRGaKk8qOBNB4ufuYsUmbHeo8bE=
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
Subject: [PATCH leds v2 44/50] leds: ns2: cosmetic change: use helper variable
Date:   Fri, 18 Sep 2020 00:33:32 +0200
Message-Id: <20200917223338.14164-45-marek.behun@nic.cz>
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

Use helper variable dev instead of always writing &pdev->dev.

Signed-off-by: Marek Behún <marek.behun@nic.cz>
Cc: Simon Guinot <simon.guinot@sequanux.org>
Cc: Simon Guinot <sguinot@lacie.com>
Cc: Vincent Donnefort <vdonnefort@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/leds/leds-ns2.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/leds/leds-ns2.c b/drivers/leds/leds-ns2.c
index 912db40c51183..801b7f851be7a 100644
--- a/drivers/leds/leds-ns2.c
+++ b/drivers/leds/leds-ns2.c
@@ -185,7 +185,7 @@ static struct attribute *ns2_led_attrs[] = {
 ATTRIBUTE_GROUPS(ns2_led);
 
 static int
-create_ns2_led(struct platform_device *pdev, struct ns2_led *led,
+create_ns2_led(struct device *dev, struct ns2_led *led,
 	       const struct ns2_led_of_one *template)
 {
 	int ret;
@@ -216,7 +216,7 @@ create_ns2_led(struct platform_device *pdev, struct ns2_led *led,
 	led->sata = (mode == NS_V2_LED_SATA) ? 1 : 0;
 	led->cdev.brightness = (mode == NS_V2_LED_OFF) ? LED_OFF : LED_FULL;
 
-	return devm_led_classdev_register(&pdev->dev, &led->cdev);
+	return devm_led_classdev_register(dev, &led->cdev);
 }
 
 static int ns2_leds_parse_one(struct device *dev, struct device_node *np,
@@ -313,28 +313,27 @@ MODULE_DEVICE_TABLE(of, of_ns2_leds_match);
 
 static int ns2_led_probe(struct platform_device *pdev)
 {
+	struct device *dev = &pdev->dev;
 	struct ns2_led_of *ofdata;
 	struct ns2_led *leds;
 	int i;
 	int ret;
 
-	ofdata = devm_kzalloc(&pdev->dev, sizeof(struct ns2_led_of),
-			      GFP_KERNEL);
+	ofdata = devm_kzalloc(dev, sizeof(struct ns2_led_of), GFP_KERNEL);
 	if (!ofdata)
 		return -ENOMEM;
 
-	ret = ns2_leds_parse_of(&pdev->dev, ofdata);
+	ret = ns2_leds_parse_of(dev, ofdata);
 	if (ret)
 		return ret;
 
-	leds = devm_kzalloc(&pdev->dev, array_size(sizeof(*leds),
-						   ofdata->num_leds),
+	leds = devm_kzalloc(dev, array_size(sizeof(*leds), ofdata->num_leds),
 			    GFP_KERNEL);
 	if (!leds)
 		return -ENOMEM;
 
 	for (i = 0; i < ofdata->num_leds; i++) {
-		ret = create_ns2_led(pdev, &leds[i], &ofdata->leds[i]);
+		ret = create_ns2_led(dev, &leds[i], &ofdata->leds[i]);
 		if (ret < 0)
 			return ret;
 	}
-- 
2.26.2

