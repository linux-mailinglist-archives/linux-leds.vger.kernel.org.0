Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9DC1B63076B
	for <lists+linux-leds@lfdr.de>; Sat, 19 Nov 2022 01:35:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235743AbiKSAf1 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 18 Nov 2022 19:35:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232146AbiKSAe7 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 18 Nov 2022 19:34:59 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CB416B3B8
        for <linux-leds@vger.kernel.org>; Fri, 18 Nov 2022 15:42:56 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1owA8h-0002bn-Da; Fri, 18 Nov 2022 23:47:15 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1owA8e-0058US-6Z; Fri, 18 Nov 2022 23:47:13 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1owA8e-0000A7-9t; Fri, 18 Nov 2022 23:47:12 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>
To:     Angel Iglesias <ang.iglesiasg@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Grant Likely <grant.likely@linaro.org>,
        Wolfram Sang <wsa@kernel.org>,
        Riku Voipio <riku.voipio@iki.fi>, Pavel Machek <pavel@ucw.cz>
Cc:     linux-i2c@vger.kernel.org, kernel@pengutronix.de,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 284/606] leds: pca9532: Convert to i2c's .probe_new()
Date:   Fri, 18 Nov 2022 23:40:18 +0100
Message-Id: <20221118224540.619276-285-uwe@kleine-koenig.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221118224540.619276-1-uwe@kleine-koenig.org>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-leds@vger.kernel.org
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

From: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

.probe_new() doesn't get the i2c_device_id * parameter, so determine
that explicitly in the probe function.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/leds/leds-pca9532.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/leds/leds-pca9532.c b/drivers/leds/leds-pca9532.c
index df83d97cb479..15b1acfa442e 100644
--- a/drivers/leds/leds-pca9532.c
+++ b/drivers/leds/leds-pca9532.c
@@ -50,8 +50,7 @@ struct pca9532_data {
 	u8 psc[2];
 };
 
-static int pca9532_probe(struct i2c_client *client,
-	const struct i2c_device_id *id);
+static int pca9532_probe(struct i2c_client *client);
 static void pca9532_remove(struct i2c_client *client);
 
 enum {
@@ -103,7 +102,7 @@ static struct i2c_driver pca9532_driver = {
 		.name = "leds-pca953x",
 		.of_match_table = of_match_ptr(of_pca9532_leds_match),
 	},
-	.probe = pca9532_probe,
+	.probe_new = pca9532_probe,
 	.remove = pca9532_remove,
 	.id_table = pca9532_id,
 };
@@ -504,9 +503,9 @@ pca9532_of_populate_pdata(struct device *dev, struct device_node *np)
 	return pdata;
 }
 
-static int pca9532_probe(struct i2c_client *client,
-	const struct i2c_device_id *id)
+static int pca9532_probe(struct i2c_client *client)
 {
+	const struct i2c_device_id *id = i2c_client_get_device_id(client);
 	int devid;
 	struct pca9532_data *data = i2c_get_clientdata(client);
 	struct pca9532_platform_data *pca9532_pdata =
-- 
2.38.1

