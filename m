Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7502F73DACA
	for <lists+linux-leds@lfdr.de>; Mon, 26 Jun 2023 11:06:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229967AbjFZJG2 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 26 Jun 2023 05:06:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230005AbjFZJGA (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 26 Jun 2023 05:06:00 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7064526BE
        for <linux-leds@vger.kernel.org>; Mon, 26 Jun 2023 02:03:02 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1qDi7e-0007eC-8R; Mon, 26 Jun 2023 11:02:58 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qDi7d-00AAWA-A4; Mon, 26 Jun 2023 11:02:57 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qDi7c-00HUqL-C0; Mon, 26 Jun 2023 11:02:56 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>
Cc:     linux-leds@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH] leds: aw200xx: Switch back to use struct i2c_driver::probe
Date:   Mon, 26 Jun 2023 11:02:54 +0200
Message-Id: <20230626090254.556206-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=791; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=lOoK5gK+/1X7tH9FhZP1Y1dqUdfblWBDwp9RYsf8a6o=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkmVQ9hgSBoNNnhVkTYIIdxdRjy9qR4p/FMzOrI CqxqJfPQmSJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZJlUPQAKCRCPgPtYfRL+ TtrACACon6Ny0pYUUfhQf8yyOXGxgKGntk4Fulrqh5ZTHGl3NI02fLg8RAPQELyNw8VXlbK/UXV kv8K7xdeS8Abm6zg1YqSh9/fEtYVIrXKOhai8QgLQwHAfH7EsqEN58whfp8M2hsXCONLltsb9DY eSbf1G83dWNYL4N6SHgm+8sfC/GFRozxij0uE278WHu2Vf58L7cPFt0NSxazHnvoUB0cHT88a/O AUtdVdbvGVwpPpZd2+lIIKUDSsZ08YnHhsblqr/dDumBlXPfbfsEkGwXRyw+SyTW7RmuwnPiEUr 2QE+kqfF/qjv/OAlRq5IrGYttThiybtBx/TdIoYLBCa0VRJY
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

struct i2c_driver::probe_new is about to go away. Switch the driver to
use the probe callback with the same prototype.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/leds/leds-aw200xx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/leds-aw200xx.c b/drivers/leds/leds-aw200xx.c
index 96979b8e09b7..1939105efbcb 100644
--- a/drivers/leds/leds-aw200xx.c
+++ b/drivers/leds/leds-aw200xx.c
@@ -583,7 +583,7 @@ static struct i2c_driver aw200xx_driver = {
 		.name = "aw200xx",
 		.of_match_table = aw200xx_match_table,
 	},
-	.probe_new = aw200xx_probe,
+	.probe = aw200xx_probe,
 	.remove = aw200xx_remove,
 	.id_table = aw200xx_id,
 };

base-commit: 9270c97c18cbd52ec47d90678e0be7c5b410d010
-- 
2.39.2

