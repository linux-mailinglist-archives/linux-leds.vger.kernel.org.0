Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E0093437559
	for <lists+linux-leds@lfdr.de>; Fri, 22 Oct 2021 12:17:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232521AbhJVKTb (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 22 Oct 2021 06:19:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232518AbhJVKTa (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 22 Oct 2021 06:19:30 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 466BDC061764
        for <linux-leds@vger.kernel.org>; Fri, 22 Oct 2021 03:17:13 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1mdrbq-0004Pr-Np; Fri, 22 Oct 2021 12:17:10 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1mdrbo-00030F-Sc; Fri, 22 Oct 2021 12:17:08 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1mdrbo-0007op-Rj; Fri, 22 Oct 2021 12:17:08 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Riku Voipio <riku.voipio@iki.fi>, Pavel Machek <pavel@ucw.cz>
Cc:     kernel@pengutronix.de, linux-leds@vger.kernel.org
Subject: [PATCH v3] leds: pca9532: Make pca9532_destroy_devices() return void
Date:   Fri, 22 Oct 2021 12:17:07 +0200
Message-Id: <20211022101707.1194979-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211021121639.79179-1-u.kleine-koenig@pengutronix.de>
References: <20211021121639.79179-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Patch-Hashes: v=1; h=sha256; i=wteD60WHq2yuUQat+xq4gnGGLoUEF/GMIKNrrYOrulk=; m=UQEVRNw4l0E2ujy/6ePpDY2Hu0CQbSO7UBGtr08376U=; p=gwsFCJJzYkxiv34//mJxHzO6Z77GiRoQ8OL3lVrmlKI=; g=2c41a6011ef1f05c65ac007f5712860cb0dce653
X-Patch-Sig: m=pgp; i=u.kleine-koenig@pengutronix.de; s=0x0D2511F322BFAB1C1580266BE2DCDD9132669BD6; b=iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmFyj58ACgkQwfwUeK3K7AnChAgAl6c pDejAylyt0U44F4gcDOYsMZd08WVT8ySVkXF9UeQfN2EsTqavCyn++7HX8nAG2EFHQfVBUb94z/mM dOtegCuxDLbLZ2FTTqhLSQkrgvJQgFQkLT3Y7/VaD0NksS5jInO1qoNF3tbXBpVVH3COskUAYnG8J qb05QDJ1yxRt7qWBq4H2aoxVuJgVJU2JWoU0Y6Dp5JVSbQYfv3z9xAN0/ymU16+wrBywPvVhp2ICm b9EYvPLpMPnEbxeSot1ReVj2cNEMWz5bQ05mGnY+cT4qmGUTH6eSwF2A12FneZOofq9JT1wRn+G1+ wT86lNQtYcHS9k6/P85dabId8Wmmggg==
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-leds@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Up to now pca9532_destroy_devices() returns always zero because it's
always called with data != NULL. Remove the never-taken error path and
make it return void which makes it easier to see in the callers that
there is no error to handle.

Also the return value of i2c remove callbacks is ignored anyway.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
How embarrassing, I fatfingered v2 that was supposed to fix compilation
issues. I forgot to actuall add the needed changes and only adapted the
commit log :-\

This one is good now (I hope!)

Sorry for the inconvenience,
Uwe

 drivers/leds/leds-pca9532.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/leds/leds-pca9532.c b/drivers/leds/leds-pca9532.c
index 017794bb87ae..f72b5d1be3a6 100644
--- a/drivers/leds/leds-pca9532.c
+++ b/drivers/leds/leds-pca9532.c
@@ -318,13 +318,10 @@ static int pca9532_gpio_direction_output(struct gpio_chip *gc, unsigned offset,
 }
 #endif /* CONFIG_LEDS_PCA9532_GPIO */
 
-static int pca9532_destroy_devices(struct pca9532_data *data, int n_devs)
+static void pca9532_destroy_devices(struct pca9532_data *data, int n_devs)
 {
 	int i = n_devs;
 
-	if (!data)
-		return -EINVAL;
-
 	while (--i >= 0) {
 		switch (data->leds[i].type) {
 		case PCA9532_TYPE_NONE:
@@ -346,8 +343,6 @@ static int pca9532_destroy_devices(struct pca9532_data *data, int n_devs)
 	if (data->gpio.parent)
 		gpiochip_remove(&data->gpio);
 #endif
-
-	return 0;
 }
 
 static int pca9532_configure(struct i2c_client *client,
@@ -555,7 +550,9 @@ static int pca9532_remove(struct i2c_client *client)
 {
 	struct pca9532_data *data = i2c_get_clientdata(client);
 
-	return pca9532_destroy_devices(data, data->chip_info->num_leds);
+	pca9532_destroy_devices(data, data->chip_info->num_leds);
+
+	return 0;
 }
 
 module_i2c_driver(pca9532_driver);
-- 
2.30.2

