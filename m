Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2EAC8C88D7
	for <lists+linux-leds@lfdr.de>; Wed,  2 Oct 2019 14:40:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727216AbfJBMkI (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 2 Oct 2019 08:40:08 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:39174 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727184AbfJBMkH (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 2 Oct 2019 08:40:07 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x92Ce4xp090633;
        Wed, 2 Oct 2019 07:40:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1570020004;
        bh=v06VAXtceMbBhHOflWlvtx0T0QpenZBc43NJCGqs8UQ=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=d5TXeWP8fS0Kx4u7iNKS4ngn+E7eAoZIPHXUJtFnCuFKcOliKirJL3rw85/MmsYKt
         RKroVH6hUyEPoYpDx63BYeGW4xUi6Zd0shhbZ1qNaJTrdA9zgIJcFNNtz+zzjeO8DF
         sZtCH+6/3ze/UhKyPaoeNZdxpZE1le9b+b0EqwOk=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x92Ce4nq117265
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 2 Oct 2019 07:40:04 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 2 Oct
 2019 07:39:53 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 2 Oct 2019 07:40:04 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x92Ce4Ye002032;
        Wed, 2 Oct 2019 07:40:04 -0500
From:   Dan Murphy <dmurphy@ti.com>
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Dan Murphy <dmurphy@ti.com>
Subject: [PATCH v2 3/6] leds: lm3601x: Convert class registration to device managed
Date:   Wed, 2 Oct 2019 07:40:39 -0500
Message-ID: <20191002124042.25593-3-dmurphy@ti.com>
X-Mailer: git-send-email 2.22.0.214.g8dca754b1e
In-Reply-To: <20191002124042.25593-1-dmurphy@ti.com>
References: <20191002124042.25593-1-dmurphy@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Convert LED flash class registration to device managed class
registration API.

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 drivers/leds/leds-lm3601x.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/leds/leds-lm3601x.c b/drivers/leds/leds-lm3601x.c
index b02972f1a341..fce89f2a2d92 100644
--- a/drivers/leds/leds-lm3601x.c
+++ b/drivers/leds/leds-lm3601x.c
@@ -350,8 +350,7 @@ static int lm3601x_register_leds(struct lm3601x_led *led,
 	init_data.devicename = led->client->name;
 	init_data.default_label = (led->led_mode == LM3601X_LED_TORCH) ?
 					"torch" : "infrared";
-
-	return led_classdev_flash_register_ext(&led->client->dev,
+	return devm_led_classdev_flash_register_ext(&led->client->dev,
 						&led->fled_cdev, &init_data);
 }
 
@@ -445,7 +444,6 @@ static int lm3601x_remove(struct i2c_client *client)
 {
 	struct lm3601x_led *led = i2c_get_clientdata(client);
 
-	led_classdev_flash_unregister(&led->fled_cdev);
 	mutex_destroy(&led->lock);
 
 	return regmap_update_bits(led->regmap, LM3601X_ENABLE_REG,
-- 
2.22.0.214.g8dca754b1e

