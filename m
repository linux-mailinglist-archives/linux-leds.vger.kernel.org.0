Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DF09D63068E
	for <lists+linux-leds@lfdr.de>; Sat, 19 Nov 2022 01:11:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237678AbiKSALD (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 18 Nov 2022 19:11:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229596AbiKSAJ5 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 18 Nov 2022 19:09:57 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55291FD2
        for <linux-leds@vger.kernel.org>; Fri, 18 Nov 2022 15:33:20 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1owA8h-0002cV-DY; Fri, 18 Nov 2022 23:47:15 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1owA8e-0058UW-Gb; Fri, 18 Nov 2022 23:47:13 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1owA8e-0000AG-Np; Fri, 18 Nov 2022 23:47:12 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>
To:     Angel Iglesias <ang.iglesiasg@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Grant Likely <grant.likely@linaro.org>,
        Wolfram Sang <wsa@kernel.org>, Pavel Machek <pavel@ucw.cz>
Cc:     linux-i2c@vger.kernel.org, kernel@pengutronix.de,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 286/606] leds: tca6507: Convert to i2c's .probe_new()
Date:   Fri, 18 Nov 2022 23:40:20 +0100
Message-Id: <20221118224540.619276-287-uwe@kleine-koenig.org>
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
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

From: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

The probe function doesn't make use of the i2c_device_id * parameter so it
can be trivially converted.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/leds/leds-tca6507.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/leds/leds-tca6507.c b/drivers/leds/leds-tca6507.c
index 161bef65c6b7..46e76b894651 100644
--- a/drivers/leds/leds-tca6507.c
+++ b/drivers/leds/leds-tca6507.c
@@ -728,8 +728,7 @@ static const struct of_device_id __maybe_unused of_tca6507_leds_match[] = {
 };
 MODULE_DEVICE_TABLE(of, of_tca6507_leds_match);
 
-static int tca6507_probe(struct i2c_client *client,
-		const struct i2c_device_id *id)
+static int tca6507_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
 	struct i2c_adapter *adapter;
@@ -809,7 +808,7 @@ static struct i2c_driver tca6507_driver = {
 		.name    = "leds-tca6507",
 		.of_match_table = of_match_ptr(of_tca6507_leds_match),
 	},
-	.probe    = tca6507_probe,
+	.probe_new = tca6507_probe,
 	.remove   = tca6507_remove,
 	.id_table = tca6507_id,
 };
-- 
2.38.1

