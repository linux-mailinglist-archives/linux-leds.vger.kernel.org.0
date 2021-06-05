Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21F1E39C65D
	for <lists+linux-leds@lfdr.de>; Sat,  5 Jun 2021 08:44:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229726AbhFEGq3 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 5 Jun 2021 02:46:29 -0400
Received: from szxga08-in.huawei.com ([45.249.212.255]:4313 "EHLO
        szxga08-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229660AbhFEGq2 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 5 Jun 2021 02:46:28 -0400
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.53])
        by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4FxqkJ4kJpz1BGRq;
        Sat,  5 Jun 2021 14:39:52 +0800 (CST)
Received: from dggpeml500017.china.huawei.com (7.185.36.243) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Sat, 5 Jun 2021 14:44:39 +0800
Received: from huawei.com (10.175.103.91) by dggpeml500017.china.huawei.com
 (7.185.36.243) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Sat, 5 Jun 2021
 14:44:38 +0800
From:   Yang Yingliang <yangyingliang@huawei.com>
To:     <linux-kernel@vger.kernel.org>, <linux-leds@vger.kernel.org>
CC:     <pavel@ucw.cz>
Subject: [PATCH -next] leds: rb532: use devm_led_classdev_register()
Date:   Sat, 5 Jun 2021 14:48:56 +0800
Message-ID: <20210605064856.1863785-1-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpeml500017.china.huawei.com (7.185.36.243)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Use devm_led_classdev_register() for led device registration and
get rid of .remove callback to remove led device. This is done by
managed device framework.

Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 drivers/leds/leds-rb532.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/leds/leds-rb532.c b/drivers/leds/leds-rb532.c
index b6447c1721b4..6d64ac9175b9 100644
--- a/drivers/leds/leds-rb532.c
+++ b/drivers/leds/leds-rb532.c
@@ -39,18 +39,11 @@ static struct led_classdev rb532_uled = {
 
 static int rb532_led_probe(struct platform_device *pdev)
 {
-	return led_classdev_register(&pdev->dev, &rb532_uled);
-}
-
-static int rb532_led_remove(struct platform_device *pdev)
-{
-	led_classdev_unregister(&rb532_uled);
-	return 0;
+	return devm_led_classdev_register(&pdev->dev, &rb532_uled);
 }
 
 static struct platform_driver rb532_led_driver = {
 	.probe = rb532_led_probe,
-	.remove = rb532_led_remove,
 	.driver = {
 		.name = "rb532-led",
 	},
-- 
2.25.1

