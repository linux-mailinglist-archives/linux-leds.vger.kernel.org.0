Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E63B5382389
	for <lists+linux-leds@lfdr.de>; Mon, 17 May 2021 06:46:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232927AbhEQErh (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 17 May 2021 00:47:37 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:3561 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231874AbhEQErg (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 17 May 2021 00:47:36 -0400
Received: from dggems703-chm.china.huawei.com (unknown [172.30.72.58])
        by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Fk62g3gDjzmWBf;
        Mon, 17 May 2021 12:43:23 +0800 (CST)
Received: from dggpeml500017.china.huawei.com (7.185.36.243) by
 dggems703-chm.china.huawei.com (10.3.19.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 17 May 2021 12:46:07 +0800
Received: from huawei.com (10.175.103.91) by dggpeml500017.china.huawei.com
 (7.185.36.243) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Mon, 17 May
 2021 12:46:07 +0800
From:   Yang Yingliang <yangyingliang@huawei.com>
To:     <linux-kernel@vger.kernel.org>, <linux-leds@vger.kernel.org>
CC:     <pavel@ucw.cz>
Subject: [PATCH -next] leds: class: fix W=1 warnings in led-class.c
Date:   Mon, 17 May 2021 12:48:26 +0800
Message-ID: <20210517044826.3458498-1-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpeml500017.china.huawei.com (7.185.36.243)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Fix the following make W=1 kernel build warnings:

  drivers/leds/led-class.c:521: warning: Function parameter or member 'dev' not described in 'devm_led_classdev_unregister'
  drivers/leds/led-class.c:521: warning: Excess function parameter 'parent' description in 'devm_led_classdev_unregister'

Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 drivers/leds/led-class.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
index 2e495ff67856..16271a1de12a 100644
--- a/drivers/leds/led-class.c
+++ b/drivers/leds/led-class.c
@@ -513,7 +513,7 @@ static int devm_led_classdev_match(struct device *dev, void *res, void *data)
 
 /**
  * devm_led_classdev_unregister() - resource managed led_classdev_unregister()
- * @parent: The device to unregister.
+ * @dev: The device to unregister.
  * @led_cdev: the led_classdev structure for this device.
  */
 void devm_led_classdev_unregister(struct device *dev,
-- 
2.25.1

