Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA15243611C
	for <lists+linux-leds@lfdr.de>; Thu, 21 Oct 2021 14:11:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231197AbhJUMOO (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 21 Oct 2021 08:14:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229765AbhJUMON (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 21 Oct 2021 08:14:13 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BA0EC06161C
        for <linux-leds@vger.kernel.org>; Thu, 21 Oct 2021 05:11:57 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1mdWvK-0008Ah-Kh; Thu, 21 Oct 2021 14:11:54 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1mdWvI-0008ML-Ff; Thu, 21 Oct 2021 14:11:52 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1mdWvI-0001hW-Ep; Thu, 21 Oct 2021 14:11:52 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Riku Voipio <riku.voipio@iki.fi>, Pavel Machek <pavel@ucw.cz>
Cc:     linux-leds@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH] leds: pca9532: Make pca9532_destroy_devices() return void
Date:   Thu, 21 Oct 2021 14:11:47 +0200
Message-Id: <20211021121147.77774-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Patch-Hashes: v=1; h=sha256; i=wteD60WHq2yuUQat+xq4gnGGLoUEF/GMIKNrrYOrulk=; m=xESQCbuS6mmto3gpzbgulJ8Yb/5oF40lhfA2bafg118=; p=GjT/fuIsaEQQ8QKX6ta1+Qlq9ZdAONqcDdciAvcSjKM=; g=05173cdc0522f55da1841aa84fc2d38a754605e1
X-Patch-Sig: m=pgp; i=u.kleine-koenig@pengutronix.de; s=0x0D2511F322BFAB1C1580266BE2DCDD9132669BD6; b=iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmFxWQAACgkQwfwUeK3K7AmBKAf9FgF gDZfv6R0ceAZNr/KlYa6Yr9Vy2QvCRxKz4LXYESf3nvTe2erU+/avNSDw5MSZeNork1n3pge6sRsc lEMVK/ypP7Mj6Xazh5XzQ2HSsPGBUXE2pH5nBqRCxdwJk2s5awPp4bNn22sfJbtuJlTFU5FveEfm+ 1LgcNuTpvWO1qKpGBfs0vZ9fGTd1R+jTy6x/KBl5vR1ppD13MxdIv+qlWuX+blmXep+x4s82B8HZn 6n05AedecnTFbJTMkuJ91Pz4Z1S5Henx1ku00V0P17fq19JIA3uwGVFi3QQqWFnX++aZSdNaDaHbO pOsjE/LG6o/7ibrb/FdwiWrB6MV0kKA==
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-leds@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Up to now pca9532_destroy_devices() returns zero unconditionally. Make
it return void instead which makes it easier to see in the callers that
there is no error to handle.

Also the return value of i2c remove callbacks is ignored anyway.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/leds/leds-pca9532.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/leds-pca9532.c b/drivers/leds/leds-pca9532.c
index 017794bb87ae..674590576b0a 100644
--- a/drivers/leds/leds-pca9532.c
+++ b/drivers/leds/leds-pca9532.c
@@ -318,7 +318,7 @@ static int pca9532_gpio_direction_output(struct gpio_chip *gc, unsigned offset,
 }
 #endif /* CONFIG_LEDS_PCA9532_GPIO */
 
-static int pca9532_destroy_devices(struct pca9532_data *data, int n_devs)
+static void pca9532_destroy_devices(struct pca9532_data *data, int n_devs)
 {
 	int i = n_devs;
 
@@ -555,7 +555,9 @@ static int pca9532_remove(struct i2c_client *client)
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

