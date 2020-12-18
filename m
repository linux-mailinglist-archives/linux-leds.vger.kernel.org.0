Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE70D2DE22C
	for <lists+linux-leds@lfdr.de>; Fri, 18 Dec 2020 12:45:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726341AbgLRLpD (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 18 Dec 2020 06:45:03 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:9463 "EHLO
        szxga06-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726303AbgLRLpD (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 18 Dec 2020 06:45:03 -0500
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.58])
        by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4Cy6T10T8mzhsnY;
        Fri, 18 Dec 2020 19:43:49 +0800 (CST)
Received: from use12-sp2.huawei.com (10.67.189.174) by
 DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server id
 14.3.498.0; Fri, 18 Dec 2020 19:44:13 +0800
From:   Xiaoming Ni <nixiaoming@huawei.com>
To:     <linux-kernel@vger.kernel.org>, <linux-leds@vger.kernel.org>,
        <pavel@ucw.cz>, <dmurphy@ti.com>, <akpm@linux-foundation.org>,
        <keescook@chromium.org>, <gpiccoli@canonical.com>,
        <penguin-kernel@i-love.sakura.ne.jp>
CC:     <nixiaoming@huawei.com>, <wangle6@huawei.com>
Subject: [PATCH 4/4] leds:trigger:ledtrig-heartbeat: Replace "panic_heartbeats" with is_be_panic()
Date:   Fri, 18 Dec 2020 19:44:06 +0800
Message-ID: <20201218114406.61906-5-nixiaoming@huawei.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201218114406.61906-1-nixiaoming@huawei.com>
References: <20201218114406.61906-1-nixiaoming@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.67.189.174]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Replace the global variable "panic_heartbeats" with is_be_panic()

Signed-off-by: Xiaoming Ni <nixiaoming@huawei.com>
---
 drivers/leds/trigger/ledtrig-heartbeat.c | 19 +------------------
 1 file changed, 1 insertion(+), 18 deletions(-)

diff --git a/drivers/leds/trigger/ledtrig-heartbeat.c b/drivers/leds/trigger/ledtrig-heartbeat.c
index 36b6709afe9f..3c34d49f0ed8 100644
--- a/drivers/leds/trigger/ledtrig-heartbeat.c
+++ b/drivers/leds/trigger/ledtrig-heartbeat.c
@@ -19,8 +19,6 @@
 #include <linux/reboot.h>
 #include "../leds.h"
 
-static int panic_heartbeats;
-
 struct heartbeat_trig_data {
 	struct led_classdev *led_cdev;
 	unsigned int phase;
@@ -39,7 +37,7 @@ static void led_heartbeat_function(struct timer_list *t)
 
 	led_cdev = heartbeat_data->led_cdev;
 
-	if (unlikely(panic_heartbeats)) {
+	if (unlikely(is_being_panic())) {
 		led_set_brightness_nosleep(led_cdev, LED_OFF);
 		return;
 	}
@@ -169,28 +167,15 @@ static int heartbeat_reboot_notifier(struct notifier_block *nb,
 	return NOTIFY_DONE;
 }
 
-static int heartbeat_panic_notifier(struct notifier_block *nb,
-				     unsigned long code, void *unused)
-{
-	panic_heartbeats = 1;
-	return NOTIFY_DONE;
-}
-
 static struct notifier_block heartbeat_reboot_nb = {
 	.notifier_call = heartbeat_reboot_notifier,
 };
 
-static struct notifier_block heartbeat_panic_nb = {
-	.notifier_call = heartbeat_panic_notifier,
-};
-
 static int __init heartbeat_trig_init(void)
 {
 	int rc = led_trigger_register(&heartbeat_led_trigger);
 
 	if (!rc) {
-		atomic_notifier_chain_register(&panic_notifier_list,
-					       &heartbeat_panic_nb);
 		register_reboot_notifier(&heartbeat_reboot_nb);
 	}
 	return rc;
@@ -199,8 +184,6 @@ static int __init heartbeat_trig_init(void)
 static void __exit heartbeat_trig_exit(void)
 {
 	unregister_reboot_notifier(&heartbeat_reboot_nb);
-	atomic_notifier_chain_unregister(&panic_notifier_list,
-					 &heartbeat_panic_nb);
 	led_trigger_unregister(&heartbeat_led_trigger);
 }
 
-- 
2.27.0

