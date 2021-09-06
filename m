Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5BF71401CAD
	for <lists+linux-leds@lfdr.de>; Mon,  6 Sep 2021 15:55:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242660AbhIFN4D (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 6 Sep 2021 09:56:03 -0400
Received: from m12-18.163.com ([220.181.12.18]:33838 "EHLO m12-18.163.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S243839AbhIFNzD (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Mon, 6 Sep 2021 09:55:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
        s=s110527; h=From:Subject:Date:Message-Id; bh=0GdV2fz1bx2ayoXl8Z
        z+z4cLRJnH9KOzRfn6OCrKlBg=; b=feNWH5v2BefT93jem8qA7JNIJRI+9xwKSt
        SxyudnoZNN3uBoV5hBj61NlEozdMaFwb1CRrRkJLUKII3ilDVMRkJP74Tkhj6VT6
        sdBJ6HvV3B0NMSi0JsVyrw22JBbYUDnsdF6wbm9K2M/+i8wOn4dm2jNyWdNM3XLT
        ZBFWn0Zno=
Received: from localhost.localdomain (unknown [183.220.75.228])
        by smtp14 (Coremail) with SMTP id EsCowABX_b5kHTZhfthN4A--.43881S2;
        Mon, 06 Sep 2021 21:53:42 +0800 (CST)
From:   chaochao2021666@163.com
To:     pavel@ucw.cz
Cc:     linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, jan.kiszk@siemens.com,
        464759471@qq.com, chao zeng <chao.zeng@siemens.com>
Subject: [PATCH 1/3] leds:triggers:Extend the kernel panic LED trigger
Date:   Mon,  6 Sep 2021 21:53:18 +0800
Message-Id: <20210906135320.23134-1-chaochao2021666@163.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: EsCowABX_b5kHTZhfthN4A--.43881S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxXF1rGw4rXFWDGw4fAry7ZFb_yoW5tr1Dp3
        40kay5Gr48JFs8JF4kZF48tFya93ykArWYyFWxC3yUKa45tF48JFyvyw13Ja4rXa4Uurs0
        yw15tryFkw4xJF7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jRCJQUUUUU=
X-Originating-IP: [183.220.75.228]
X-CM-SenderInfo: 5fkd0uhkdrjiasrwlli6rwjhhfrp/1tbiSgYGdVPAPoiNgwAAsU
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

From: chao zeng <chao.zeng@siemens.com>

This commit extend panic trigger, add two new panic trigger
"panic_on" and "panic_off" and keep the "panic" compatible with
"panic_blink".

All the led on the "panic_on" would light and on
the "panic_off" would turn off

Expand the panic state of led to meet more requirements

Signed-off-by: chao zeng <chao.zeng@siemens.com>
---
 drivers/leds/trigger/ledtrig-panic.c | 39 ++++++++++++++++++++++------
 1 file changed, 31 insertions(+), 8 deletions(-)

diff --git a/drivers/leds/trigger/ledtrig-panic.c b/drivers/leds/trigger/ledtrig-panic.c
index 64abf2e91608..1274bc94b5dd 100644
--- a/drivers/leds/trigger/ledtrig-panic.c
+++ b/drivers/leds/trigger/ledtrig-panic.c
@@ -12,19 +12,26 @@
 #include <linux/leds.h>
 #include "../leds.h"
 
-static struct led_trigger *trigger;
+enum led_display_type {
+	ON,
+	OFF,
+	BLINK,
+	DISPLAY_TYPE_COUNT,
+};
+
+static struct led_trigger *panic_trigger[DISPLAY_TYPE_COUNT];
 
 /*
  * This is called in a special context by the atomic panic
  * notifier. This means the trigger can be changed without
  * worrying about locking.
  */
-static void led_trigger_set_panic(struct led_classdev *led_cdev)
+static void led_trigger_set_panic(struct led_classdev *led_cdev, const char *type)
 {
 	struct led_trigger *trig;
 
 	list_for_each_entry(trig, &trigger_list, next_trig) {
-		if (strcmp("panic", trig->name))
+		if (strcmp(type, trig->name))
 			continue;
 		if (led_cdev->trigger)
 			list_del(&led_cdev->trig_list);
@@ -37,6 +44,10 @@ static void led_trigger_set_panic(struct led_classdev *led_cdev)
 		led_cdev->trigger = trig;
 		if (trig->activate)
 			trig->activate(led_cdev);
+
+		/*Clear current brightness work*/
+		led_cdev->work_flags = 0;
+
 		break;
 	}
 }
@@ -48,7 +59,12 @@ static int led_trigger_panic_notifier(struct notifier_block *nb,
 
 	list_for_each_entry(led_cdev, &leds_list, node)
 		if (led_cdev->flags & LED_PANIC_INDICATOR)
-			led_trigger_set_panic(led_cdev);
+			led_trigger_set_panic(led_cdev, "panic");
+		else if (led_cdev->flags & LED_PANIC_INDICATOR_ON)
+			led_trigger_set_panic(led_cdev, "panic_on");
+		else if (led_cdev->flags & LED_PANIC_INDICATOR_OFF)
+			led_trigger_set_panic(led_cdev, "panic_off");
+
 	return NOTIFY_DONE;
 }
 
@@ -56,9 +72,12 @@ static struct notifier_block led_trigger_panic_nb = {
 	.notifier_call = led_trigger_panic_notifier,
 };
 
-static long led_panic_blink(int state)
+static long led_panic_activity(int state)
 {
-	led_trigger_event(trigger, state ? LED_FULL : LED_OFF);
+	led_trigger_event(panic_trigger[BLINK], state ? LED_FULL : LED_OFF);
+	led_trigger_event(panic_trigger[ON], LED_FULL);
+	led_trigger_event(panic_trigger[OFF], LED_OFF);
+
 	return 0;
 }
 
@@ -67,8 +86,12 @@ static int __init ledtrig_panic_init(void)
 	atomic_notifier_chain_register(&panic_notifier_list,
 				       &led_trigger_panic_nb);
 
-	led_trigger_register_simple("panic", &trigger);
-	panic_blink = led_panic_blink;
+	led_trigger_register_simple("panic", &panic_trigger[BLINK]);
+	led_trigger_register_simple("panic_on", &panic_trigger[ON]);
+	led_trigger_register_simple("panic_off", &panic_trigger[OFF]);
+
+	panic_blink = led_panic_activity;
+
 	return 0;
 }
 device_initcall(ledtrig_panic_init);
-- 
2.17.1


