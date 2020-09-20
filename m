Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C5E6B271193
	for <lists+linux-leds@lfdr.de>; Sun, 20 Sep 2020 02:25:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726759AbgITAZD (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 19 Sep 2020 20:25:03 -0400
Received: from lists.nic.cz ([217.31.204.67]:48736 "EHLO mail.nic.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726707AbgITAZD (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Sat, 19 Sep 2020 20:25:03 -0400
Received: from dellmb.labs.office.nic.cz (unknown [IPv6:2001:1488:fffe:6:cac7:3539:7f1f:463])
        by mail.nic.cz (Postfix) with ESMTP id 02487140A46;
        Sun, 20 Sep 2020 02:25:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
        t=1600561502; bh=eNjduB62rZ2PN/YcSdr+ZIbBqv0ZKdncDkCxTGvwt1s=;
        h=From:To:Date;
        b=SDFn0c1FehHmz5te8DM+f0S7qjvczMjUlYdfieEAYeWBVY+CBDJXVptnjFKPqERtQ
         tOj2PSyj1bcxc4waVMMgNHjF6u3eAKoUCxxERP7kdETtb2mObN15OS4rk83EEpGT/o
         j0fBOJrF/NJ6ue/qG2jaV280Dhz9xHM7056WaXYY=
From:   =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>
To:     linux-leds@vger.kernel.org
Cc:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>,
        Peter Meerwald <p.meerwald@bct-electronic.com>,
        Ricardo Ribalda <ribalda@kernel.org>,
        Zahari Petkov <zahari@balena.io>
Subject: [PATCH leds 2/7] leds: pca963x: use devres LED registering function
Date:   Sun, 20 Sep 2020 02:24:55 +0200
Message-Id: <20200920002500.5851-3-marek.behun@nic.cz>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200920002500.5851-1-marek.behun@nic.cz>
References: <20200920002500.5851-1-marek.behun@nic.cz>
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
Cc: Peter Meerwald <p.meerwald@bct-electronic.com>
Cc: Ricardo Ribalda <ribalda@kernel.org>
Cc: Zahari Petkov <zahari@balena.io>
---
 drivers/leds/leds-pca963x.c | 22 ++--------------------
 1 file changed, 2 insertions(+), 20 deletions(-)

diff --git a/drivers/leds/leds-pca963x.c b/drivers/leds/leds-pca963x.c
index c03871f92fecc..cbb3bf6c044f2 100644
--- a/drivers/leds/leds-pca963x.c
+++ b/drivers/leds/leds-pca963x.c
@@ -432,9 +432,9 @@ static int pca963x_probe(struct i2c_client *client,
 		if (pdata && pdata->blink_type == PCA963X_HW_BLINK)
 			pca963x[i].led_cdev.blink_set = pca963x_blink_set;
 
-		err = led_classdev_register(dev, &pca963x[i].led_cdev);
+		err = devm_led_classdev_register(dev, &pca963x[i].led_cdev);
 		if (err < 0)
-			goto exit;
+			return err;
 	}
 
 	/* Disable LED all-call address, and power down initially */
@@ -454,23 +454,6 @@ static int pca963x_probe(struct i2c_client *client,
 	}
 
 	return 0;
-
-exit:
-	while (i--)
-		led_classdev_unregister(&pca963x[i].led_cdev);
-
-	return err;
-}
-
-static int pca963x_remove(struct i2c_client *client)
-{
-	struct pca963x *pca963x = i2c_get_clientdata(client);
-	int i;
-
-	for (i = 0; i < pca963x->chipdef->n_leds; i++)
-		led_classdev_unregister(&pca963x->leds[i].led_cdev);
-
-	return 0;
 }
 
 static struct i2c_driver pca963x_driver = {
@@ -479,7 +462,6 @@ static struct i2c_driver pca963x_driver = {
 		.of_match_table = of_pca963x_match,
 	},
 	.probe	= pca963x_probe,
-	.remove	= pca963x_remove,
 	.id_table = pca963x_id,
 };
 
-- 
2.26.2

