Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1EAF7526015
	for <lists+linux-leds@lfdr.de>; Fri, 13 May 2022 12:39:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378694AbiEMKZx (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 13 May 2022 06:25:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346802AbiEMKZt (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 13 May 2022 06:25:49 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3068DD3
        for <linux-leds@vger.kernel.org>; Fri, 13 May 2022 03:25:44 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1npSUR-0005fF-4c; Fri, 13 May 2022 12:25:43 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1npSUR-0023rt-Ol; Fri, 13 May 2022 12:25:42 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1npSUP-009R59-OS; Fri, 13 May 2022 12:25:41 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     linux-leds@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH] leds: lm3601x: Improve error reporting for problems during .remove()
Date:   Fri, 13 May 2022 12:25:16 +0200
Message-Id: <20220513102516.271920-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1593; h=from:subject; bh=QNDrpvriEHwqDk5t8nOReqYNIqQsUCWbh96J/33gN2E=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBifjIImvETG2bLKnJgdEQmNJetnxovJoeCDb96Nwf5 CeiICXCJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCYn4yCAAKCRDB/BR4rcrsCRCJB/ 9PIHjz4nEQ5jqp78GCx1CQ1AZMlXQ0f8aqSnZJLXlaZdBrIvpEgdhl/50otJHmyNCh1ZIVuGTqTGZu NGRHmJkrg5tsXdvmugj6XVaiVKs88Gzj5feizeRHLPJnmmsWYtYkTj1/y2XB/5slC4H6e5dNXLVL8I 5JGh60w4AK/9LlHsxY019spFUERiHEzEh6gUZrXrLZ94zIarmLI7iShTBb3K35tj3KwKZoYbQI/mHd AZivJbR9vagC02jugB8dZk3WgriaSE9YRqDhsinCTvs+itBsNtmWR6wHu3Hl/mxImQAWLfAjEzp52W Y3Zm9iarFqzFHEo6mzYiC20muKGLDd
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
error message being emitted by the i2c core, but otherwise it doesn't
make a difference. The device goes away anyhow and the devm cleanups are
called.

So instead of triggering the generic i2c error message, emit a more
helpful message if a problem occurs and return 0 to suppress the generic
message.

This patch is a preparation for making i2c remove callbacks return void.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/leds/flash/leds-lm3601x.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/leds/flash/leds-lm3601x.c b/drivers/leds/flash/leds-lm3601x.c
index 3d1272748201..37e1d6e68687 100644
--- a/drivers/leds/flash/leds-lm3601x.c
+++ b/drivers/leds/flash/leds-lm3601x.c
@@ -443,10 +443,15 @@ static int lm3601x_probe(struct i2c_client *client)
 static int lm3601x_remove(struct i2c_client *client)
 {
 	struct lm3601x_led *led = i2c_get_clientdata(client);
+	int ret;
 
-	return regmap_update_bits(led->regmap, LM3601X_ENABLE_REG,
-			   LM3601X_ENABLE_MASK,
-			   LM3601X_MODE_STANDBY);
+	ret = regmap_update_bits(led->regmap, LM3601X_ENABLE_REG,
+				 LM3601X_ENABLE_MASK, LM3601X_MODE_STANDBY);
+	if (ret)
+		dev_warn(&client->dev,
+			 "Failed to put into standby (%pe)\n", ERR_PTR(ret));
+
+	return 0;
 }
 
 static const struct i2c_device_id lm3601x_id[] = {

base-commit: 3123109284176b1532874591f7c81f3837bbdc17
prerequisite-patch-id: 7c8cf392f32ed54e53589e37e4c23f0bda0a5159
-- 
2.35.1

