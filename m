Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A7C60525D2A
	for <lists+linux-leds@lfdr.de>; Fri, 13 May 2022 10:24:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350874AbiEMITJ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 13 May 2022 04:19:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236562AbiEMITI (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 13 May 2022 04:19:08 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A669C216843
        for <linux-leds@vger.kernel.org>; Fri, 13 May 2022 01:19:06 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1npQVr-0004pp-2c; Fri, 13 May 2022 10:19:03 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1npQVq-0022sC-Pe; Fri, 13 May 2022 10:19:01 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1npQVo-009Pxa-PH; Fri, 13 May 2022 10:19:00 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Pavel Machek <pavel@ucw.cz>,
        Linus Walleij <linus.walleij@linaro.org>,
        Dan Murphy <dmurphy@ti.com>
Cc:     linux-leds@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH] leds: lm3601x: Don't use mutex after it was destroyed
Date:   Fri, 13 May 2022 10:18:32 +0200
Message-Id: <20220513081832.263863-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=924; h=from:subject; bh=pe2CobvB2OJHKjKvSgRHaS7Ld724w6ZS4hoYmbqtnEo=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBifhRTlCyODvgOEJiFQCEk0MMMZDcO2JkadIhftim5 xNOQoEKJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCYn4UUwAKCRDB/BR4rcrsCWRGB/ 4tJJDohGn8wnXe/R05JvKTEj9wb5e3DkZX4jiX4mORozPzASgr9M8eWnOeYiLMqGs7RCqnE/LBLGqr B6HMRE7+mvAcsScHmGXTpukP0scLhtVOKPKykcgpHAHXpcrLEG5bCY1MXgU7Ods/hfee27GPvpEEVP zxaEFPaiU1DEZ/dQXiaI7utuWQ0ujaNsvYxjbZQxtAjhisaVTGDGjokVAWHkz8yJKUIouixbSyxDcg l/A+zbcLyGR4l5Jxz5R8W3RFSGjiM3MegQKU83Js7VSGz5rVKdL3T5Ynbl+A3X779vPndYHsJaUgHU DyPPeobOg8PMBXVtCMsrLZhEgcKmEU
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-leds@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

The mutex might still be in use until the devm cleanup callback
devm_led_classdev_flash_release() is called. This only happens some time
after lm3601x_remove() completed.

Fixes: e63a744871a3 ("leds: lm3601x: Convert class registration to device managed")
Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/leds/flash/leds-lm3601x.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/leds/flash/leds-lm3601x.c b/drivers/leds/flash/leds-lm3601x.c
index d0e1d4814042..3d1272748201 100644
--- a/drivers/leds/flash/leds-lm3601x.c
+++ b/drivers/leds/flash/leds-lm3601x.c
@@ -444,8 +444,6 @@ static int lm3601x_remove(struct i2c_client *client)
 {
 	struct lm3601x_led *led = i2c_get_clientdata(client);
 
-	mutex_destroy(&led->lock);
-
 	return regmap_update_bits(led->regmap, LM3601X_ENABLE_REG,
 			   LM3601X_ENABLE_MASK,
 			   LM3601X_MODE_STANDBY);
-- 
2.35.1

