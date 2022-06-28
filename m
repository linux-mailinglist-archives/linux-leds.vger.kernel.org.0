Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A8FB655E70E
	for <lists+linux-leds@lfdr.de>; Tue, 28 Jun 2022 18:31:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347342AbiF1OD2 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 28 Jun 2022 10:03:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347330AbiF1OD1 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 28 Jun 2022 10:03:27 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1D732E0A7
        for <linux-leds@vger.kernel.org>; Tue, 28 Jun 2022 07:03:23 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1o6BoG-0008KT-Ov; Tue, 28 Jun 2022 16:03:20 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1o6BoC-003DT0-0i; Tue, 28 Jun 2022 16:03:19 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1o6BoE-001gzH-Jb; Tue, 28 Jun 2022 16:03:18 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Pavel Machek <pavel@ucw.cz>,
        Linus Walleij <linus.walleij@linaro.org>,
        Dan Murphy <dmurphy@ti.com>
Cc:     linux-leds@vger.kernel.org, kernel@pengutronix.de,
        linux-i2c@vger.kernel.org
Subject: [PATCH 3/6] leds: lm3601x: Don't use mutex after it was destroyed
Date:   Tue, 28 Jun 2022 16:03:09 +0200
Message-Id: <20220628140313.74984-4-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220628140313.74984-1-u.kleine-koenig@pengutronix.de>
References: <20220628140313.74984-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=994; h=from:subject; bh=EsInce88HYeHFMRoYmy8/2ZrNKMbIYaMWaDzIC3C+qY=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBiuwoN7cAf2ei8+tU45xAilSNmDo2H31Pwth6qa5Jf ZKVMwseJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCYrsKDQAKCRDB/BR4rcrsCdcCCA CZzSBPgzMU5YcOO4wroDwQRF6NgftgkgTKfByfdA3pHvEg/5XzvrZbbW7RMEYJOOMdmGB+uOsa4aPo EAP9LndHemzv2IHzcfg5brG0xMplVzyiNbv4C+B/cpDe16lgobHhFLQmd5sc5y8VZ0dxYP3jqmOaNM I3zvXFkMTo24Zgxrx1DgJD5PSYhFm9xqlAUS8eiqNgkn85eC5C8ngpe0o8TgA+wuj09gAURScMoPi4 rp+nyqetYLcPCBBY07m67wi07a9wKdwX0+v/ItmF/7YG2bdIbg3NF0mYJaH3IQ3mZOUOxypwzKFbfD JCh0uJFmN/OzfgTi7z0kzd0E/x4Vxc
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
Forwarded: id:20220513081832.263863-1-u.kleine-koenig@pengutronix.de
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
2.36.1

