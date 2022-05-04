Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9DFDB51ACFA
	for <lists+linux-leds@lfdr.de>; Wed,  4 May 2022 20:36:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353781AbiEDSjj (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 4 May 2022 14:39:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377480AbiEDSjZ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 4 May 2022 14:39:25 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDB1D1AF17
        for <linux-leds@vger.kernel.org>; Wed,  4 May 2022 11:31:39 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1nmJmj-0003sc-D6; Wed, 04 May 2022 20:31:37 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1nmJmk-000MYN-2Y; Wed, 04 May 2022 20:31:36 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1nmJmh-007Ztu-Rm; Wed, 04 May 2022 20:31:35 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     linux-leds@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH] leds: is31fl32xx: Improve error reporting in .remove()
Date:   Wed,  4 May 2022 20:31:31 +0200
Message-Id: <20220504183131.52728-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1320; h=from:subject; bh=cJRA3glxO1Ke7ajkhJU/PzZSeqPTk5OSlmeEga+VuP8=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBicsZ/z+WRLs0yy1zUlykzkP1zaNUFCuBnkNjODT9X nLPnR2SJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCYnLGfwAKCRDB/BR4rcrsCXysB/ 0XmRYAZ2y+aW9ZsU/vN4x6nPm+jVjDUvuI4BdK2QybVm3LcYqiuFAXBZwGoGoyM+6TZrwh/zUE2hUI pFdutCwmLTbqwuJsQHoBbbF4Y9CYnfZijNmoCZBUpOgLcxzIZQUqpkjoFs0hr/iC0sq21Km4j/x+yL 1EDwhZh9G7gZqN1MIgHppUDqFfldeJf2+5FpF9+nMpcWiFFNhI9a/Q39IC5AEiZq4qpQ3xfHqwlaHP ceNOftWK3A0Yx+osqF0aFVlkr01p40EroBFDNo9U/w8tQaRyzjGvn7A+npyMSWWuxJIKoGBfSGYA01 R/fCpc8p1ReUQyvPE6JTtE71WXv++o
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

Returning an error value in an i2c remove callback results in a generic
error message being emitted by the i2c core, but otherwise it doesn't make
a difference. The device goes away anyhow and the devm cleanups are
called.

So instead of triggering the generic i2c error message, emit a more helpful
message if a problem occurs and return 0 to suppress the generic message.

This patch is a preparation for making i2c remove callbacks return void.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/leds/leds-is31fl32xx.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/leds/leds-is31fl32xx.c b/drivers/leds/leds-is31fl32xx.c
index 22c092a4394a..fc63fce38c19 100644
--- a/drivers/leds/leds-is31fl32xx.c
+++ b/drivers/leds/leds-is31fl32xx.c
@@ -460,8 +460,14 @@ static int is31fl32xx_probe(struct i2c_client *client,
 static int is31fl32xx_remove(struct i2c_client *client)
 {
 	struct is31fl32xx_priv *priv = i2c_get_clientdata(client);
+	int ret;
 
-	return is31fl32xx_reset_regs(priv);
+	ret = is31fl32xx_reset_regs(priv);
+	if (ret)
+		dev_err(&client->dev, "Failed to reset registers on removal (%pe)\n",
+			ERR_PTR(ret));
+
+	return 0;
 }
 
 /*

base-commit: 3123109284176b1532874591f7c81f3837bbdc17
-- 
2.35.1

