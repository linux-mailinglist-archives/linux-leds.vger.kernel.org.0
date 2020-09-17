Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB1D326E8A7
	for <lists+linux-leds@lfdr.de>; Fri, 18 Sep 2020 00:35:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726677AbgIQWfR (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 17 Sep 2020 18:35:17 -0400
Received: from lists.nic.cz ([217.31.204.67]:35560 "EHLO mail.nic.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726302AbgIQWeN (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Thu, 17 Sep 2020 18:34:13 -0400
Received: from dellmb.labs.office.nic.cz (unknown [IPv6:2001:1488:fffe:6:cac7:3539:7f1f:463])
        by mail.nic.cz (Postfix) with ESMTP id 0267F142059;
        Fri, 18 Sep 2020 00:34:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
        t=1600382040; bh=/t1nSFHylk9lL02X5X71l6V/n4Ec26C/fK5mF77jSUw=;
        h=From:To:Date;
        b=QePUZ4WSxKcsjqjbBBPydWuWluzIw8q2qPiQR3I1HI9esw5BzC/DRPS0jxb4Ue3zS
         bH0HY+FC4ol75s5YIQhNI30Cv8kE1z496SU7FKVyu6omwL39RH0PX7+ZD734EcHI5t
         /6KEFXuoNgXUqr2anma4vNT8fUWKFBC+jO/qJ+7E=
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
Subject: [PATCH leds v2 37/50] leds: ns2: alloc simple array instead of struct ns2_led_priv
Date:   Fri, 18 Sep 2020 00:33:25 +0200
Message-Id: <20200917223338.14164-38-marek.behun@nic.cz>
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

Since .remove method is not needed now that we use devres, there is no
need to remember the number of LEDs in struct ns2_led_priv. Alloc simple
array of ns2_led_data structs.

Signed-off-by: Marek Behún <marek.behun@nic.cz>
Cc: Simon Guinot <simon.guinot@sequanux.org>
Cc: Simon Guinot <sguinot@lacie.com>
Cc: Vincent Donnefort <vdonnefort@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/leds/leds-ns2.c | 21 +++++++--------------
 1 file changed, 7 insertions(+), 14 deletions(-)

diff --git a/drivers/leds/leds-ns2.c b/drivers/leds/leds-ns2.c
index 1a7ef66464b5d..8cd020b340840 100644
--- a/drivers/leds/leds-ns2.c
+++ b/drivers/leds/leds-ns2.c
@@ -334,15 +334,10 @@ static const struct of_device_id of_ns2_leds_match[] = {
 MODULE_DEVICE_TABLE(of, of_ns2_leds_match);
 #endif /* CONFIG_OF_GPIO */
 
-struct ns2_led_priv {
-	int num_leds;
-	struct ns2_led_data leds_data[];
-};
-
 static int ns2_led_probe(struct platform_device *pdev)
 {
 	struct ns2_led_platform_data *pdata = dev_get_platdata(&pdev->dev);
-	struct ns2_led_priv *priv;
+	struct ns2_led_data *leds;
 	int i;
 	int ret;
 
@@ -363,20 +358,18 @@ static int ns2_led_probe(struct platform_device *pdev)
 		return -EINVAL;
 #endif /* CONFIG_OF_GPIO */
 
-	priv = devm_kzalloc(&pdev->dev, struct_size(priv, leds_data, pdata->num_leds), GFP_KERNEL);
-	if (!priv)
+	leds = devm_kzalloc(&pdev->dev, array_size(sizeof(*leds),
+						   pdata->num_leds),
+			    GFP_KERNEL);
+	if (!leds)
 		return -ENOMEM;
-	priv->num_leds = pdata->num_leds;
 
-	for (i = 0; i < priv->num_leds; i++) {
-		ret = create_ns2_led(pdev, &priv->leds_data[i],
-				     &pdata->leds[i]);
+	for (i = 0; i < pdata->num_leds; i++) {
+		ret = create_ns2_led(pdev, &leds[i], &pdata->leds[i]);
 		if (ret < 0)
 			return ret;
 	}
 
-	platform_set_drvdata(pdev, priv);
-
 	return 0;
 }
 
-- 
2.26.2

