Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ACB1539C56B
	for <lists+linux-leds@lfdr.de>; Sat,  5 Jun 2021 05:17:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230049AbhFEDTn (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 4 Jun 2021 23:19:43 -0400
Received: from szxga08-in.huawei.com ([45.249.212.255]:4310 "EHLO
        szxga08-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229998AbhFEDTn (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 4 Jun 2021 23:19:43 -0400
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.54])
        by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4Fxl7l4QrLz1BGSw;
        Sat,  5 Jun 2021 11:13:07 +0800 (CST)
Received: from dggpeml500017.china.huawei.com (7.185.36.243) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Sat, 5 Jun 2021 11:17:53 +0800
Received: from huawei.com (10.175.103.91) by dggpeml500017.china.huawei.com
 (7.185.36.243) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Sat, 5 Jun 2021
 11:17:53 +0800
From:   Yang Yingliang <yangyingliang@huawei.com>
To:     <linux-kernel@vger.kernel.org>, <linux-leds@vger.kernel.org>
CC:     <pavel@ucw.cz>
Subject: [PATCH -next] leds: wm831x-status: use devm_led_classdev_register()
Date:   Sat, 5 Jun 2021 11:22:12 +0800
Message-ID: <20210605032212.698200-1-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
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
 drivers/leds/leds-wm831x-status.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/leds/leds-wm831x-status.c b/drivers/leds/leds-wm831x-status.c
index c48b80574f02..8ccd8b472572 100644
--- a/drivers/leds/leds-wm831x-status.c
+++ b/drivers/leds/leds-wm831x-status.c
@@ -269,7 +269,7 @@ static int wm831x_status_probe(struct platform_device *pdev)
 	drvdata->cdev.blink_set = wm831x_status_blink_set;
 	drvdata->cdev.groups = wm831x_status_groups;
 
-	ret = led_classdev_register(wm831x->dev, &drvdata->cdev);
+	ret = devm_led_classdev_register(wm831x->dev, &drvdata->cdev);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "Failed to register LED: %d\n", ret);
 		return ret;
@@ -280,21 +280,11 @@ static int wm831x_status_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int wm831x_status_remove(struct platform_device *pdev)
-{
-	struct wm831x_status *drvdata = platform_get_drvdata(pdev);
-
-	led_classdev_unregister(&drvdata->cdev);
-
-	return 0;
-}
-
 static struct platform_driver wm831x_status_driver = {
 	.driver = {
 		   .name = "wm831x-status",
 		   },
 	.probe = wm831x_status_probe,
-	.remove = wm831x_status_remove,
 };
 
 module_platform_driver(wm831x_status_driver);
-- 
2.25.1

