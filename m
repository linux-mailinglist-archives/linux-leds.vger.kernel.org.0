Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 515AD4AB288
	for <lists+linux-leds@lfdr.de>; Sun,  6 Feb 2022 23:08:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343801AbiBFWIY (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 6 Feb 2022 17:08:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233328AbiBFWIX (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 6 Feb 2022 17:08:23 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85931C06173B
        for <linux-leds@vger.kernel.org>; Sun,  6 Feb 2022 14:08:22 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1nGphj-0003qY-C1; Sun, 06 Feb 2022 23:08:19 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1nGphi-00EyTG-OD; Sun, 06 Feb 2022 23:08:18 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1nGphh-009q95-9d; Sun, 06 Feb 2022 23:08:17 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     linux-leds@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH] leds: lm3692x: Return 0 from remove callback
Date:   Sun,  6 Feb 2022 23:08:12 +0100
Message-Id: <20220206220812.21471-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1239; h=from:subject; bh=r70NhKNw3lWW2RLsj1ruvhBTm9TVSknw461i73g5XfI=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBiAEbHNGRNRZd5IIkSKVxJgEMgffBR5P3EEWq4shL0 Zj5FsdeJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCYgBGxwAKCRDB/BR4rcrsCWp4B/ 9Dxg9ergUYMVY41rBAttlZ7X9UWiY8UQYL8Xqsuy3dIDu4dpBDy4Yc/yOEmkQFGJphe/BMp3oF0m6m IJ+P9o/hq+WYs3795uf26wz9vgySuTE81+fIiVowFBn78z/6sL/qKblrp0DzuDvZVfLjBVy4fdNGSH rHh8uAjB9/7OlpxltcmJlFs8s4Mr850DNlrXosDwn8hCp+W1f0/hM42PVMuEV63wilz50cB0aWb5TY u/q68LXaVJjG8SJTvEXKgkai/zHL+KPPhELvi9pKdCJbgcYV6919fScHE8ZvccmkMPq/f93/i3JlfJ /S36CjjzUBBEoaVyoJmIZKPu7TL3sK
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

The only difference between returning zero or a non-zero value is that
for the non-zero case the i2c will print a generic error message
("remove failed (-ESOMETHING), will be ignored").

In this case however the driver itself already emitted a more helpful
error message, so the additional error message isn't helpful at all.

The long-term goal is to make the i2c remove callback return void, making
all implementations return 0 is preparatory work for this change.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/leds/leds-lm3692x.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/leds/leds-lm3692x.c b/drivers/leds/leds-lm3692x.c
index afe6fb297855..87cd24ce3f95 100644
--- a/drivers/leds/leds-lm3692x.c
+++ b/drivers/leds/leds-lm3692x.c
@@ -494,11 +494,8 @@ static int lm3692x_probe(struct i2c_client *client,
 static int lm3692x_remove(struct i2c_client *client)
 {
 	struct lm3692x_led *led = i2c_get_clientdata(client);
-	int ret;
 
-	ret = lm3692x_leds_disable(led);
-	if (ret)
-		return ret;
+	lm3692x_leds_disable(led);
 	mutex_destroy(&led->lock);
 
 	return 0;

base-commit: dcb85f85fa6f142aae1fe86f399d4503d49f2b60
-- 
2.34.1

