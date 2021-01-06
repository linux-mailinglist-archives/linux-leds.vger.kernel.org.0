Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 526BB2EBE88
	for <lists+linux-leds@lfdr.de>; Wed,  6 Jan 2021 14:23:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727234AbhAFNUE (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 6 Jan 2021 08:20:04 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:10399 "EHLO
        szxga07-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726429AbhAFNUD (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 6 Jan 2021 08:20:03 -0500
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.58])
        by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4D9qgP5GPCz7QSS;
        Wed,  6 Jan 2021 21:18:25 +0800 (CST)
Received: from ubuntu.network (10.175.138.68) by
 DGGEMS408-HUB.china.huawei.com (10.3.19.208) with Microsoft SMTP Server id
 14.3.498.0; Wed, 6 Jan 2021 21:19:13 +0800
From:   Zheng Yongjun <zhengyongjun3@huawei.com>
To:     <pavel@ucw.cz>, <linux-leds@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC:     <dmurphy@ti.com>, Zheng Yongjun <zhengyongjun3@huawei.com>
Subject: [PATCH -next] leds: use resource_size
Date:   Wed, 6 Jan 2021 21:19:56 +0800
Message-ID: <20210106131956.968-1-zhengyongjun3@huawei.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.138.68]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Use resource_size rather than a verbose computation on
the end and start fields.

Signed-off-by: Zheng Yongjun <zhengyongjun3@huawei.com>
---
 drivers/leds/leds-lm3642.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/leds-lm3642.c b/drivers/leds/leds-lm3642.c
index 62c14872caf7..22035a380c4a 100644
--- a/drivers/leds/leds-lm3642.c
+++ b/drivers/leds/leds-lm3642.c
@@ -339,7 +339,7 @@ static int lm3642_probe(struct i2c_client *client,
 	chip->cdev_flash.max_brightness = 16;
 	chip->cdev_flash.brightness_set_blocking = lm3642_strobe_brightness_set;
 	chip->cdev_flash.default_trigger = "flash";
-	chip->cdev_flash.groups = lm3642_flash_groups,
+	chip->cdev_flash.groups = lm3642_flash_groups;
 	err = led_classdev_register(&client->dev, &chip->cdev_flash);
 	if (err < 0) {
 		dev_err(chip->dev, "failed to register flash\n");
@@ -351,7 +351,7 @@ static int lm3642_probe(struct i2c_client *client,
 	chip->cdev_torch.max_brightness = 8;
 	chip->cdev_torch.brightness_set_blocking = lm3642_torch_brightness_set;
 	chip->cdev_torch.default_trigger = "torch";
-	chip->cdev_torch.groups = lm3642_torch_groups,
+	chip->cdev_torch.groups = lm3642_torch_groups;
 	err = led_classdev_register(&client->dev, &chip->cdev_torch);
 	if (err < 0) {
 		dev_err(chip->dev, "failed to register torch\n");
-- 
2.22.0

