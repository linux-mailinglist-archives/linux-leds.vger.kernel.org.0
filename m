Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18B122DF374
	for <lists+linux-leds@lfdr.de>; Sun, 20 Dec 2020 04:47:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727449AbgLTDqB (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 19 Dec 2020 22:46:01 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:9541 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727355AbgLTDqA (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 19 Dec 2020 22:46:00 -0500
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.59])
        by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Cz7lB09rXzhvBL;
        Sun, 20 Dec 2020 11:44:38 +0800 (CST)
Received: from use12-sp2.huawei.com (10.67.189.174) by
 DGGEMS407-HUB.china.huawei.com (10.3.19.207) with Microsoft SMTP Server id
 14.3.498.0; Sun, 20 Dec 2020 11:45:08 +0800
From:   Xiaoming Ni <nixiaoming@huawei.com>
To:     <linux-kernel@vger.kernel.org>, <linux-leds@vger.kernel.org>,
        <pavel@ucw.cz>, <dmurphy@ti.com>, <akpm@linux-foundation.org>,
        <keescook@chromium.org>, <gpiccoli@canonical.com>,
        <penguin-kernel@i-love.sakura.ne.jp>, <rdunlap@infradead.org>
CC:     <nixiaoming@huawei.com>, <wangle6@huawei.com>
Subject: [PATCH v2 3/4] leds:trigger:ledtrig-activity Replace "panic_detected" with in_panic_state()
Date:   Sun, 20 Dec 2020 11:45:04 +0800
Message-ID: <20201220034505.113118-4-nixiaoming@huawei.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201220034505.113118-1-nixiaoming@huawei.com>
References: <20201220034505.113118-1-nixiaoming@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.67.189.174]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Replace the global variable "panic_detected" with in_panic_state()

Signed-off-by: Xiaoming Ni <nixiaoming@huawei.com>
---
 drivers/leds/trigger/ledtrig-activity.c | 19 +------------------
 1 file changed, 1 insertion(+), 18 deletions(-)

diff --git a/drivers/leds/trigger/ledtrig-activity.c b/drivers/leds/trigger/ledtrig-activity.c
index 14ba7faaed9e..9675c9348516 100644
--- a/drivers/leds/trigger/ledtrig-activity.c
+++ b/drivers/leds/trigger/ledtrig-activity.c
@@ -17,8 +17,6 @@
 #include <linux/timer.h>
 #include "../leds.h"
 
-static int panic_detected;
-
 struct activity_data {
 	struct timer_list timer;
 	struct led_classdev *led_cdev;
@@ -47,7 +45,7 @@ static void led_activity_function(struct timer_list *t)
 	if (test_and_clear_bit(LED_BLINK_BRIGHTNESS_CHANGE, &led_cdev->work_flags))
 		led_cdev->blink_brightness = led_cdev->new_blink_brightness;
 
-	if (unlikely(panic_detected)) {
+	if (unlikely(in_panic_state())) {
 		/* full brightness in case of panic */
 		led_set_brightness_nosleep(led_cdev, led_cdev->blink_brightness);
 		return;
@@ -226,28 +224,15 @@ static int activity_reboot_notifier(struct notifier_block *nb,
 	return NOTIFY_DONE;
 }
 
-static int activity_panic_notifier(struct notifier_block *nb,
-                                   unsigned long code, void *unused)
-{
-	panic_detected = 1;
-	return NOTIFY_DONE;
-}
-
 static struct notifier_block activity_reboot_nb = {
 	.notifier_call = activity_reboot_notifier,
 };
 
-static struct notifier_block activity_panic_nb = {
-	.notifier_call = activity_panic_notifier,
-};
-
 static int __init activity_init(void)
 {
 	int rc = led_trigger_register(&activity_led_trigger);
 
 	if (!rc) {
-		atomic_notifier_chain_register(&panic_notifier_list,
-					       &activity_panic_nb);
 		register_reboot_notifier(&activity_reboot_nb);
 	}
 	return rc;
@@ -256,8 +241,6 @@ static int __init activity_init(void)
 static void __exit activity_exit(void)
 {
 	unregister_reboot_notifier(&activity_reboot_nb);
-	atomic_notifier_chain_unregister(&panic_notifier_list,
-					 &activity_panic_nb);
 	led_trigger_unregister(&activity_led_trigger);
 }
 
-- 
2.27.0

