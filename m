Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF26F2D9345
	for <lists+linux-leds@lfdr.de>; Mon, 14 Dec 2020 07:32:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728226AbgLNGcK (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 14 Dec 2020 01:32:10 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:9521 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727908AbgLNGcJ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 14 Dec 2020 01:32:09 -0500
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.58])
        by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CvWjk4Lbdzhsps;
        Mon, 14 Dec 2020 14:30:50 +0800 (CST)
Received: from ubuntu.network (10.175.138.68) by
 DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server id
 14.3.498.0; Mon, 14 Dec 2020 14:31:19 +0800
From:   Zheng Yongjun <zhengyongjun3@huawei.com>
To:     <pavel@ucw.cz>, <marek.behun@nic.cz>, <linux-leds@vger.kernel.org>
CC:     <linux-kernel@vger.kernel.org>,
        Zheng Yongjun <zhengyongjun3@huawei.com>
Subject: [PATCH v2 -next] leds: ss4200: simplify the return expression of register_nasgpio_led()
Date:   Mon, 14 Dec 2020 14:31:49 +0800
Message-ID: <20201214063149.1970-1-zhengyongjun3@huawei.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.138.68]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Simplify the return expression.

Signed-off-by: Zheng Yongjun <zhengyongjun3@huawei.com>
---
 drivers/leds/leds-ss4200.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/leds/leds-ss4200.c b/drivers/leds/leds-ss4200.c
index 245de443fe9c..97abab439826 100644
--- a/drivers/leds/leds-ss4200.c
+++ b/drivers/leds/leds-ss4200.c
@@ -478,7 +478,6 @@ ATTRIBUTE_GROUPS(nasgpio_led);
 
 static int register_nasgpio_led(int led_nr)
 {
-	int ret;
 	struct nasgpio_led *nas_led = &nasgpio_leds[led_nr];
 	struct led_classdev *led = get_classdev_for_led_nr(led_nr);
 
@@ -489,11 +488,8 @@ static int register_nasgpio_led(int led_nr)
 	led->brightness_set = nasgpio_led_set_brightness;
 	led->blink_set = nasgpio_led_set_blink;
 	led->groups = nasgpio_led_groups;
-	ret = led_classdev_register(&nas_gpio_pci_dev->dev, led);
-	if (ret)
-		return ret;
 
-	return 0;
+	return led_classdev_register(&nas_gpio_pci_dev->dev, led);
 }
 
 static void unregister_nasgpio_led(int led_nr)
-- 
2.22.0

