Return-Path: <linux-leds+bounces-2597-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 265DB96AC56
	for <lists+linux-leds@lfdr.de>; Wed,  4 Sep 2024 00:40:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4BD811C20ACE
	for <lists+linux-leds@lfdr.de>; Tue,  3 Sep 2024 22:40:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF3771D5CE1;
	Tue,  3 Sep 2024 22:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=salutedevices.com header.i=@salutedevices.com header.b="vAIEV3HB"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx1.sberdevices.ru (mx2.sberdevices.ru [45.89.224.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEA481A4E82;
	Tue,  3 Sep 2024 22:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.89.224.132
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725403198; cv=none; b=CkIqjCeCmhDbh5kGj1vEVdw763GjdBnaL2/ZUYNGw3DAWdoZMDpNrM0zpTPjs0ascl6+RLfO4UnvuZ/FxjvszThfZLe9t0/Enz8klCbReBB9k5Xc3iw0gOxGAlhIy+jQfUlxcVBnsv3UH8JdHS3HfJiK1yBEmSNNyntzVat7US4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725403198; c=relaxed/simple;
	bh=53mS/sX0yNaUT/8JcOrRucePW5GpyLqAUQZP/puA/WM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=axoyJp41mwG0jVyM6BgX6R5Ut7+D2GPPWq31+Ufs01szeAVo1nLk5WuXdn5pFNpTEMVaJ+XuU8oWwlFQK6LfZrUwGsLBUALUadIGDabHYykFOQxgCFVqkd3Kgvxo4oMzL6RPYGSwxvYxaSyZXuBXronJBCehrZHWh8VOWNc53EM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=salutedevices.com; spf=pass smtp.mailfrom=salutedevices.com; dkim=pass (2048-bit key) header.d=salutedevices.com header.i=@salutedevices.com header.b=vAIEV3HB; arc=none smtp.client-ip=45.89.224.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=salutedevices.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=salutedevices.com
Received: from p-infra-ksmg-sc-msk02.sberdevices.ru (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id CC9F212000E;
	Wed,  4 Sep 2024 01:39:46 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru CC9F212000E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1725403186;
	bh=/b8KvL37VJ7Yl3OS0J5IUxw4T/Li7iFq09Xpsl0pz9Q=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=vAIEV3HB8p49UmlAkom3hms+4jcKRN8S/p/QbDROVvhpbs0FmPTuOQcmixGnhbqeS
	 w8MrwyTdEkuFSIR5few+fCYfJNXXKr6JV39wRaud5bxs37oWemni4tGMPMAKGMqizf
	 7Lp44jEF89V9+POi0B3JMzrkH43bl93PcfPKISITcAFW+EzPnr6Bo4jufhHq7MdQiH
	 XyfRTsB6WFTGo5odc8GbMqXy3sa48aCkMVDLza13K25T+1vjEUMS08o9fIFsu2iGWx
	 Aas1/WPJ3iRNG17vGNnYRK+78GzP9PE6jdsKdKoeiUiZxyR/GMPhkKPPbs0oVvxY9j
	 19JfrRdCXIo1Q==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Wed,  4 Sep 2024 01:39:43 +0300 (MSK)
From: Dmitry Rokosov <ddrokosov@salutedevices.com>
To: <pavel@ucw.cz>, <lee@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <linux-leds@vger.kernel.org>,
	<kernel@salutedevices.com>, <rockosov@gmail.com>, Dmitry Rokosov
	<ddrokosov@salutedevices.com>, Alexey Romanov <avromanov@salutedevices.com>
Subject: [PATCH v2] leds: introduce ordered workqueue for leds events instead of system_wq
Date: Wed, 4 Sep 2024 01:39:30 +0300
Message-ID: <20240903223936.21292-1-ddrokosov@salutedevices.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: p-i-exch-a-m1.sberdevices.ru (172.24.196.116) To
 p-i-exch-a-m2.sberdevices.ru (172.24.196.120)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 187515 [Sep 03 2024]
X-KSMG-AntiSpam-Version: 6.1.1.5
X-KSMG-AntiSpam-Envelope-From: ddrokosov@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 32 0.3.32 766319f57b3d5e49f2c79a76e7d7087b621090df, {Tracking_uf_ne_domains}, {Tracking_from_domain_doesnt_match_to}, salutedevices.com:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2;smtp.sberdevices.ru:7.1.1,5.0.1;lore.kernel.org:7.1.1, FromAlignment: s
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean, bases: 2024/09/03 21:19:00
X-KSMG-LinksScanning: Clean, bases: 2024/09/03 20:52:00
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/09/03 20:30:00 #26515812
X-KSMG-AntiVirus-Status: Clean, skipped

This allows to setup ordered workqueue for leds events. This may be
useful, because default 'system_wq' does not guarantee execution order
of each work_struct, thus for several brightness update requests (for
multiple leds), real brightness switch could be in random order.

Yes, for sysfs-based leds we have flush_work() call inside
brightness_store() operation, but it's blocking call, so userspace
caller can be blocked at a long time, which means leds animation stream
can be broken.

Ordered workqueue has the same behaviour as system_wq + flush_work(),
but all scheduled works are async and userspace caller is not blocked,
which it better for userspace animation scheduling.

Signed-off-by: Alexey Romanov <avromanov@salutedevices.com>
Signed-off-by: Dmitry Rokosov <ddrokosov@salutedevices.com>
---
Changes v2 since v1 at [1]:
    - replace "leds" with "LEDs" in the log message

Links:
    [1] https://lore.kernel.org/all/20240820155407.32729-1-ddrokosov@salutedevices.com/
---
 drivers/leds/led-class.c | 12 +++++++++++-
 drivers/leds/led-core.c  |  6 +++---
 include/linux/leds.h     |  1 +
 3 files changed, 15 insertions(+), 4 deletions(-)

diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
index c66d1bead0a4..b5e28ad54f7f 100644
--- a/drivers/leds/led-class.c
+++ b/drivers/leds/led-class.c
@@ -25,6 +25,8 @@
 static DEFINE_MUTEX(leds_lookup_lock);
 static LIST_HEAD(leds_lookup_list);
 
+static struct workqueue_struct *leds_wq;
+
 static ssize_t brightness_show(struct device *dev,
 		struct device_attribute *attr, char *buf)
 {
@@ -57,7 +59,6 @@ static ssize_t brightness_store(struct device *dev,
 	if (state == LED_OFF)
 		led_trigger_remove(led_cdev);
 	led_set_brightness(led_cdev, state);
-	flush_work(&led_cdev->set_brightness_work);
 
 	ret = size;
 unlock:
@@ -548,6 +549,8 @@ int led_classdev_register_ext(struct device *parent,
 
 	led_update_brightness(led_cdev);
 
+	led_cdev->wq = leds_wq;
+
 	led_init_core(led_cdev);
 
 #ifdef CONFIG_LEDS_TRIGGERS
@@ -666,12 +669,19 @@ EXPORT_SYMBOL_GPL(devm_led_classdev_unregister);
 
 static int __init leds_init(void)
 {
+	leds_wq = alloc_ordered_workqueue("leds", 0);
+	if (!leds_wq) {
+		pr_err("failed to create LEDs ordered workqueue\n");
+		return -ENOMEM;
+	}
+
 	return class_register(&leds_class);
 }
 
 static void __exit leds_exit(void)
 {
 	class_unregister(&leds_class);
+	destroy_workqueue(leds_wq);
 }
 
 subsys_initcall(leds_init);
diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c
index 89c9806cc97f..9769ac49be20 100644
--- a/drivers/leds/led-core.c
+++ b/drivers/leds/led-core.c
@@ -266,7 +266,7 @@ void led_blink_set_nosleep(struct led_classdev *led_cdev, unsigned long delay_on
 		led_cdev->delayed_delay_on = delay_on;
 		led_cdev->delayed_delay_off = delay_off;
 		set_bit(LED_SET_BLINK, &led_cdev->work_flags);
-		schedule_work(&led_cdev->set_brightness_work);
+		queue_work(led_cdev->wq, &led_cdev->set_brightness_work);
 		return;
 	}
 
@@ -297,7 +297,7 @@ void led_set_brightness(struct led_classdev *led_cdev, unsigned int brightness)
 		 */
 		if (!brightness) {
 			set_bit(LED_BLINK_DISABLE, &led_cdev->work_flags);
-			schedule_work(&led_cdev->set_brightness_work);
+			queue_work(led_cdev->wq, &led_cdev->set_brightness_work);
 		} else {
 			set_bit(LED_BLINK_BRIGHTNESS_CHANGE,
 				&led_cdev->work_flags);
@@ -333,7 +333,7 @@ void led_set_brightness_nopm(struct led_classdev *led_cdev, unsigned int value)
 		set_bit(LED_SET_BRIGHTNESS_OFF, &led_cdev->work_flags);
 	}
 
-	schedule_work(&led_cdev->set_brightness_work);
+	queue_work(led_cdev->wq, &led_cdev->set_brightness_work);
 }
 EXPORT_SYMBOL_GPL(led_set_brightness_nopm);
 
diff --git a/include/linux/leds.h b/include/linux/leds.h
index 6300313c46b7..7c9f1cb12ab9 100644
--- a/include/linux/leds.h
+++ b/include/linux/leds.h
@@ -169,6 +169,7 @@ struct led_classdev {
 	int			 new_blink_brightness;
 	void			(*flash_resume)(struct led_classdev *led_cdev);
 
+	struct workqueue_struct *wq; /* LED workqueue */
 	struct work_struct	set_brightness_work;
 	int			delayed_set_value;
 	unsigned long		delayed_delay_on;
-- 
2.43.0


