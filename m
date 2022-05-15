Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A70205278B6
	for <lists+linux-leds@lfdr.de>; Sun, 15 May 2022 18:12:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231824AbiEOQMk (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 15 May 2022 12:12:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231624AbiEOQMj (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 15 May 2022 12:12:39 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2A39DF0D
        for <linux-leds@vger.kernel.org>; Sun, 15 May 2022 09:12:37 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1nqGrE-0003Vq-6l; Sun, 15 May 2022 18:12:36 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1nqGrE-002VTM-Rh; Sun, 15 May 2022 18:12:35 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1nqGrC-009ugm-CB; Sun, 15 May 2022 18:12:34 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     linux-leds@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 1/2] leds: lp50xx: Remove duplicated error reporting in .remove()
Date:   Sun, 15 May 2022 18:12:26 +0200
Message-Id: <20220515161227.339514-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1246; h=from:subject; bh=7Bjd1bXDXam/baaTxtHnj9bAXNPbvAd6zekeyal414g=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBigSZklYMSZJ+Zr2RuQYzX5Qc55arub88yYtDFFqmr KC68LjSJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCYoEmZAAKCRDB/BR4rcrsCbdAB/ 45Kpx5DnEtSpltHReewWh3kdiOPRsbPoPpLV6hiVnP389E0OhrwgPcsE9GO+Vy2JibYCpR3oHo/XuH DxecJ+qClUF+Boyv6e+3hW72gMVVmhugKzU0RAj/uJYef6s1IQnl2PDbmkodm7aRU+/A1kUhk2RUWJ 08ITR9eGh3Me1Jp24ozeYmN4T1KErwUm/5qFojIzu2dYpEfjdC8ah6KVlFdhw9OZYSE+fKDfKbpX4w +Wz8b1cWkrzOEzw7epPELwbdTRegna+jxlP0Oliw6B3HXySd4y/4GsFtXVhOeJQbBlnwvEjp/gAGAi V1CQB303WvuK6XrgfKPLP8c53wujjc
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

Returning an error value from an i2c remove callback results in an error
message being emitted by the i2c core, but otherwise it doesn't make a
difference. The device goes away anyhow and the devm cleanups are
called.

As lp50xx_remove() already emits an error message on failure and the
additional error message by the i2c core doesn't add any useful
information, don't pass the error value up the stack. Instead continue
to clean up and return 0.

This patch is a preparation for making i2c remove callbacks return void.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/leds/leds-lp50xx.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/leds/leds-lp50xx.c b/drivers/leds/leds-lp50xx.c
index 50b195ff96ca..e129dcc656b8 100644
--- a/drivers/leds/leds-lp50xx.c
+++ b/drivers/leds/leds-lp50xx.c
@@ -569,10 +569,8 @@ static int lp50xx_remove(struct i2c_client *client)
 	int ret;
 
 	ret = lp50xx_enable_disable(led, 0);
-	if (ret) {
+	if (ret)
 		dev_err(led->dev, "Failed to disable chip\n");
-		return ret;
-	}
 
 	if (led->regulator) {
 		ret = regulator_disable(led->regulator);

base-commit: 3123109284176b1532874591f7c81f3837bbdc17
-- 
2.35.1

