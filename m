Return-Path: <linux-leds+bounces-2488-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A1315958BAB
	for <lists+linux-leds@lfdr.de>; Tue, 20 Aug 2024 17:54:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5919328569D
	for <lists+linux-leds@lfdr.de>; Tue, 20 Aug 2024 15:54:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC29B194129;
	Tue, 20 Aug 2024 15:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=salutedevices.com header.i=@salutedevices.com header.b="XOGh2vzE"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx1.sberdevices.ru (mx1.sberdevices.ru [37.18.73.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0024719408E;
	Tue, 20 Aug 2024 15:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.18.73.165
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724169259; cv=none; b=m51xpNnkIh7UpgiHjvAIIAoK44NarQLaJGX1aLjM+qcdbiA3wRPHQAcIHCfroNvzc3gb5Mq4yH7bxxj4KdH1i3kHFgxCxLsso1qFTDG5hguzi7OLbdnikoT3417KLL7ZforNeTtBDlELy/cROsyYrAP+5v3QzyiaOPUtzTVwf7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724169259; c=relaxed/simple;
	bh=vICFzgkcetGfCx5gi2FJTpO5yJE77JUKs2iB409YoGQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=fgA//BdOK5EAWdnPhat5+XHf9qYD2WhlUQgIm9gFIs68KCjaRGLeV3B0TuqrGQXcZPZ6VZUcVNzZD5HIZ8/vxoI3e7o88P2w92V0Iu9qN16OUm62oYIbAw9llEiRZefRS2GQST4b6mfS71LGDzBXTJt7dNkPhBzokLh6GtQu8L4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=salutedevices.com; spf=pass smtp.mailfrom=salutedevices.com; dkim=pass (2048-bit key) header.d=salutedevices.com header.i=@salutedevices.com header.b=XOGh2vzE; arc=none smtp.client-ip=37.18.73.165
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=salutedevices.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=salutedevices.com
Received: from p-infra-ksmg-sc-msk01.sberdevices.ru (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 2C2F0100031;
	Tue, 20 Aug 2024 18:54:14 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 2C2F0100031
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1724169254;
	bh=bqqGXDzCV6YHIfrLXemQUmEga2MPZ+L4iiJ9MGopbyA=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=XOGh2vzEEBm7OvQBG4hqN+Co0c03P/lW3As2L3XKK7pY9n5qK97iUN6tc9sfEFHu2
	 oSdrlzgRpYmAuUKbl1ysEkD0khWPd+BlZCEdDmEym8e53CWTHuLxvHOhtXPyljeCpd
	 TrZ5H/Hpg5Ni7Ms9vu1OyHuB7qph0CTPKgVu3zP6ts+QlO/xvYJAudPmjqYMk7s0pW
	 g5/LhngciAa9CIOpeuyoRzr5j+MnEJQfu4Xszf6kAP9wymjLTUUoIffOVua6c5hxEP
	 cebB0m/82oTpSk3LEYZ+n7OAYvWBNiebxlbS3TlI4Qdqe1Ylbkgt0aYS+H+6pKeClg
	 MlSb973qJBB6A==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Tue, 20 Aug 2024 18:54:13 +0300 (MSK)
From: Dmitry Rokosov <ddrokosov@salutedevices.com>
To: <pavel@ucw.cz>, <lee@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <linux-leds@vger.kernel.org>,
	<kernel@salutedevices.com>, <rockosov@gmail.com>, Dmitry Rokosov
	<ddrokosov@salutedevices.com>, Alexey Romanov <avromanov@salutedevices.com>
Subject: [PATCH v1] leds: introduce ordered workqueue for leds events instead of system_wq
Date: Tue, 20 Aug 2024 18:54:05 +0300
Message-ID: <20240820155407.32729-1-ddrokosov@salutedevices.com>
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
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 187181 [Aug 20 2024]
X-KSMG-AntiSpam-Version: 6.1.0.4
X-KSMG-AntiSpam-Envelope-From: ddrokosov@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 27 0.3.27 71302da218a62dcd84ac43314e19b5cc6b38e0b6, {Tracking_from_domain_doesnt_match_to}, 127.0.0.199:7.1.2;salutedevices.com:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;smtp.sberdevices.ru:5.0.1,7.1.1, FromAlignment: s
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/08/20 03:45:00 #26365304
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
 drivers/leds/led-class.c | 12 +++++++++++-
 drivers/leds/led-core.c  |  6 +++---
 include/linux/leds.h     |  1 +
 3 files changed, 15 insertions(+), 4 deletions(-)

diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
index ba1be15cfd8e..fba12471cf1f 100644
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
@@ -549,6 +550,8 @@ int led_classdev_register_ext(struct device *parent,
 
 	led_update_brightness(led_cdev);
 
+	led_cdev->wq = leds_wq;
+
 	led_init_core(led_cdev);
 
 #ifdef CONFIG_LEDS_TRIGGERS
@@ -667,12 +670,19 @@ EXPORT_SYMBOL_GPL(devm_led_classdev_unregister);
 
 static int __init leds_init(void)
 {
+	leds_wq = alloc_ordered_workqueue("leds", 0);
+	if (!leds_wq) {
+		pr_err("failed to create leds ordered workqueue\n");
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


