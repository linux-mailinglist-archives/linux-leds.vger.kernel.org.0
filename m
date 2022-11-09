Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B0D25622557
	for <lists+linux-leds@lfdr.de>; Wed,  9 Nov 2022 09:28:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229645AbiKII17 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 9 Nov 2022 03:27:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229851AbiKII1x (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 9 Nov 2022 03:27:53 -0500
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62B4A13DFC;
        Wed,  9 Nov 2022 00:27:52 -0800 (PST)
Received: from canpemm500010.china.huawei.com (unknown [172.30.72.55])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4N6dPn5PQlzRp6f;
        Wed,  9 Nov 2022 16:27:41 +0800 (CST)
Received: from localhost.localdomain (10.175.112.70) by
 canpemm500010.china.huawei.com (7.192.105.118) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 9 Nov 2022 16:27:50 +0800
From:   Wang Yufen <wangyufen@huawei.com>
To:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     <pavel@ucw.cz>, Wang Yufen <wangyufen@huawei.com>,
        Dan Murphy <dmurphy@ti.com>
Subject: [PATCH 05/13] leds: lm3697: Fix devm vs. non-devm ordering
Date:   Wed, 9 Nov 2022 16:48:06 +0800
Message-ID: <1667983694-15040-6-git-send-email-wangyufen@huawei.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1667983694-15040-1-git-send-email-wangyufen@huawei.com>
References: <1667983694-15040-1-git-send-email-wangyufen@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.112.70]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 canpemm500010.china.huawei.com (7.192.105.118)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

When non-devm resources are allocated they mustn't be followed by devm
allocations, otherwise it will break the tear down ordering and might
lead to crashes or other bugs during ->remove() stage. Fix this by
wrapping mutex_destroy() call with devm_add_action_or_reset().

Fixes: 5c1d824cda9f ("leds: lm3697: Introduce the lm3697 driver")
Signed-off-by: Wang Yufen <wangyufen@huawei.com>
Cc: Dan Murphy <dmurphy@ti.com>
---
 drivers/leds/leds-lm3697.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/leds/leds-lm3697.c b/drivers/leds/leds-lm3697.c
index 71231a6..a345333 100644
--- a/drivers/leds/leds-lm3697.c
+++ b/drivers/leds/leds-lm3697.c
@@ -299,6 +299,11 @@ static int lm3697_probe_dt(struct lm3697 *priv)
 	return ret;
 }
 
+static void lm3697_mutex_destroy(void *lock)
+{
+	mutex_destroy(lock);
+}
+
 static int lm3697_probe(struct i2c_client *client,
 			const struct i2c_device_id *id)
 {
@@ -318,8 +323,12 @@ static int lm3697_probe(struct i2c_client *client,
 		return -ENOMEM;
 
 	mutex_init(&led->lock);
-	i2c_set_clientdata(client, led);
+	ret = devm_add_action_or_reset(&client->dev, lm3697_mutex_destroy,
+				       &led->lock);
+	if (ret)
+		return ret;
 
+	i2c_set_clientdata(client, led);
 	led->client = client;
 	led->dev = dev;
 	led->num_banks = count;
@@ -356,8 +365,6 @@ static void lm3697_remove(struct i2c_client *client)
 		if (ret)
 			dev_err(dev, "Failed to disable regulator\n");
 	}
-
-	mutex_destroy(&led->lock);
 }
 
 static const struct i2c_device_id lm3697_id[] = {
-- 
1.8.3.1

