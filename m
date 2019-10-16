Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 330FCD9636
	for <lists+linux-leds@lfdr.de>; Wed, 16 Oct 2019 18:01:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405928AbfJPQAe (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 16 Oct 2019 12:00:34 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:55610 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2393136AbfJPQAe (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 16 Oct 2019 12:00:34 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9GG0VuH039210;
        Wed, 16 Oct 2019 11:00:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1571241631;
        bh=J2Vk2Ajsq3pQz40ndtf+q535T0FSNHipw5rnG1vK/ho=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=mCT66qcW52M4j4FAqDhqc132Zj2cmA9m1YpoLY1nRkWidCJaStaZcl0bxZfmmYQ/M
         ukTuA/sRKbr5ZOXrq0EiSUq90SmOv6LTgNo0YRGDRG0yLQVxrQxyu6HZmaeCPDjyZj
         xWRWQxI8SJpAlfWPWZPhw6T8LeShDF4Xa8JXRuBU=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9GG0VAM094835
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 16 Oct 2019 11:00:31 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 16
 Oct 2019 11:00:24 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 16 Oct 2019 11:00:24 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9GG0V8Z096990;
        Wed, 16 Oct 2019 11:00:31 -0500
From:   Dan Murphy <dmurphy@ti.com>
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Dan Murphy <dmurphy@ti.com>
Subject: [PATCH v13 12/18] leds: lp55xx: Convert LED class registration to devm_*
Date:   Wed, 16 Oct 2019 10:59:48 -0500
Message-ID: <20191016155954.29044-13-dmurphy@ti.com>
X-Mailer: git-send-email 2.22.0.214.g8dca754b1e
In-Reply-To: <20191016155954.29044-1-dmurphy@ti.com>
References: <20191016155954.29044-1-dmurphy@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Convert the LED class registration calls to the LED devm_*
registration calls.

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 drivers/leds/leds-lp55xx-common.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/leds-lp55xx-common.c b/drivers/leds/leds-lp55xx-common.c
index 44ced02b49f9..824d1d73dde1 100644
--- a/drivers/leds/leds-lp55xx-common.c
+++ b/drivers/leds/leds-lp55xx-common.c
@@ -181,7 +181,7 @@ static int lp55xx_init_led(struct lp55xx_led *led,
 		led->cdev.name = name;
 	}
 
-	ret = led_classdev_register(dev, &led->cdev);
+	ret = devm_led_classdev_register(dev, &led->cdev);
 	if (ret) {
 		dev_err(dev, "led register err: %d\n", ret);
 		return ret;
@@ -502,7 +502,7 @@ void lp55xx_unregister_leds(struct lp55xx_led *led, struct lp55xx_chip *chip)
 
 	for (i = 0; i < chip->num_leds; i++) {
 		each = led + i;
-		led_classdev_unregister(&each->cdev);
+		devm_led_classdev_unregister(each->cdev.dev, &each->cdev);
 	}
 }
 EXPORT_SYMBOL_GPL(lp55xx_unregister_leds);
-- 
2.22.0.214.g8dca754b1e

