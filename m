Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04B7039C5F4
	for <lists+linux-leds@lfdr.de>; Sat,  5 Jun 2021 07:09:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230051AbhFEFLn (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 5 Jun 2021 01:11:43 -0400
Received: from szxga08-in.huawei.com ([45.249.212.255]:4311 "EHLO
        szxga08-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229544AbhFEFLl (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 5 Jun 2021 01:11:41 -0400
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.54])
        by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4Fxncx0rC4z1BH7R;
        Sat,  5 Jun 2021 13:05:05 +0800 (CST)
Received: from dggpeml500017.china.huawei.com (7.185.36.243) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Sat, 5 Jun 2021 13:09:51 +0800
Received: from huawei.com (10.175.103.91) by dggpeml500017.china.huawei.com
 (7.185.36.243) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Sat, 5 Jun 2021
 13:09:51 +0800
From:   Yang Yingliang <yangyingliang@huawei.com>
To:     <linux-kernel@vger.kernel.org>, <linux-leds@vger.kernel.org>
CC:     <pavel@ucw.cz>
Subject: [PATCH -next] leds: leds-asic3: use devm_led_classdev_register()
Date:   Sat, 5 Jun 2021 13:14:09 +0800
Message-ID: <20210605051409.1851974-1-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpeml500017.china.huawei.com (7.185.36.243)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Use devm_led_classdev_register() for led device registration
and remove led_classdev_unregister() in .remove(). This is done
by managed device framework.

Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 drivers/leds/leds-asic3.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/leds/leds-asic3.c b/drivers/leds/leds-asic3.c
index 8cbc1b8bafa5..e01d33431633 100644
--- a/drivers/leds/leds-asic3.c
+++ b/drivers/leds/leds-asic3.c
@@ -110,7 +110,7 @@ static int asic3_led_probe(struct platform_device *pdev)
 	led->cdev->blink_set = blink_set;
 	led->cdev->default_trigger = led->default_trigger;
 
-	ret = led_classdev_register(&pdev->dev, led->cdev);
+	ret = devm_led_classdev_register(&pdev->dev, led->cdev);
 	if (ret < 0)
 		goto out;
 
@@ -123,10 +123,6 @@ static int asic3_led_probe(struct platform_device *pdev)
 
 static int asic3_led_remove(struct platform_device *pdev)
 {
-	struct asic3_led *led = dev_get_platdata(&pdev->dev);
-
-	led_classdev_unregister(led->cdev);
-
 	return mfd_cell_disable(pdev);
 }
 
-- 
2.25.1

