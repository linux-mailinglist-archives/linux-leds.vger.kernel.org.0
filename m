Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 64144AE8C3
	for <lists+linux-leds@lfdr.de>; Tue, 10 Sep 2019 13:01:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390551AbfIJLAD (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 10 Sep 2019 07:00:03 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:55952 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729140AbfIJLAD (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 10 Sep 2019 07:00:03 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8AAxrvY071827;
        Tue, 10 Sep 2019 05:59:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1568113193;
        bh=GmpKwYhuK5X7dWJRaRkcMJXDbBVLOuX+foIqgPcfYaQ=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=GTl7tqKBWUTt/YMmhUHbDPNfVGgYS7mGYfMM+DE0S3PsXq9qfwKVMrxMwq9i49UKZ
         19oc8mgpKk/f2a03GJlISL75+udY5Vp6/69mVxjZvbAEQR60wfV6RkH6kyNfGnSJJk
         +rFzJswDlUis/KWsidcSRqVyiMocB3rbGTtm2VHY=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8AAxr9Z034403;
        Tue, 10 Sep 2019 05:59:53 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 10
 Sep 2019 05:59:53 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 10 Sep 2019 05:59:53 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8AAxqrJ054728;
        Tue, 10 Sep 2019 05:59:52 -0500
From:   Jean-Jacques Hiblot <jjhiblot@ti.com>
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>, <robh+dt@kernel.org>,
        <mark.rutland@arm.com>, <lee.jones@linaro.org>,
        <daniel.thompson@linaro.org>
CC:     <dmurphy@ti.com>, <linux-leds@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <dridevel@lists.freedesktop.org>,
        <tomi.valkeinen@ti.com>, Jean-Jacques Hiblot <jjhiblot@ti.com>
Subject: [PATCH v5 1/4] leds: Add of_led_get() and led_put()
Date:   Tue, 10 Sep 2019 12:59:43 +0200
Message-ID: <20190910105946.23057-2-jjhiblot@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190910105946.23057-1-jjhiblot@ti.com>
References: <20190910105946.23057-1-jjhiblot@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

From: Tomi Valkeinen <tomi.valkeinen@ti.com>

This patch adds basic support for a kernel driver to get a LED device.
This will be used by the led-backlight driver.

Only OF version is implemented for now, and the behavior is similar to
PWM's of_pwm_get() and pwm_put().

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Signed-off-by: Jean-Jacques Hiblot <jjhiblot@ti.com>
Acked-by: Pavel Machek <pavel@ucw.cz>
---
 drivers/leds/led-class.c | 50 ++++++++++++++++++++++++++++++++++++++++
 include/linux/leds.h     |  4 ++++
 2 files changed, 54 insertions(+)

diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
index 4e2af8df5aa8..eb98bf13e53b 100644
--- a/drivers/leds/led-class.c
+++ b/drivers/leds/led-class.c
@@ -18,6 +18,7 @@
 #include <linux/spinlock.h>
 #include <linux/timer.h>
 #include <uapi/linux/uleds.h>
+#include <linux/of.h>
 #include "leds.h"
 
 static struct class *leds_class;
@@ -213,6 +214,55 @@ static int led_resume(struct device *dev)
 
 static SIMPLE_DEV_PM_OPS(leds_class_dev_pm_ops, led_suspend, led_resume);
 
+static int led_match_led_node(struct device *led_dev, const void *data)
+{
+	return led_dev->of_node == data;
+}
+
+/**
+ * of_led_get() - request a LED device via the LED framework
+ * @np: device node to get the LED device from
+ * @index: the index of the LED
+ *
+ * Returns the LED device parsed from the phandle specified in the "leds"
+ * property of a device tree node or a negative error-code on failure.
+ */
+struct led_classdev *of_led_get(struct device_node *np, int index)
+{
+	struct device *led_dev;
+	struct led_classdev *led_cdev;
+	struct device_node *led_node;
+
+	led_node = of_parse_phandle(np, "leds", index);
+	if (!led_node)
+		return ERR_PTR(-ENOENT);
+
+	led_dev = class_find_device(leds_class, NULL, led_node,
+		led_match_led_node);
+	of_node_put(led_node);
+
+	if (!led_dev)
+		return ERR_PTR(-EPROBE_DEFER);
+
+	led_cdev = dev_get_drvdata(led_dev);
+
+	if (!try_module_get(led_cdev->dev->parent->driver->owner))
+		return ERR_PTR(-ENODEV);
+
+	return led_cdev;
+}
+EXPORT_SYMBOL_GPL(of_led_get);
+
+/**
+ * led_put() - release a LED device
+ * @led_cdev: LED device
+ */
+void led_put(struct led_classdev *led_cdev)
+{
+	module_put(led_cdev->dev->parent->driver->owner);
+}
+EXPORT_SYMBOL_GPL(led_put);
+
 static int match_name(struct device *dev, const void *data)
 {
 	if (!dev_name(dev))
diff --git a/include/linux/leds.h b/include/linux/leds.h
index bee8e3f8dddd..0a71c7cdd191 100644
--- a/include/linux/leds.h
+++ b/include/linux/leds.h
@@ -19,6 +19,7 @@
 
 struct device;
 struct led_pattern;
+struct device_node;
 /*
  * LED Core
  */
@@ -145,6 +146,9 @@ extern void devm_led_classdev_unregister(struct device *parent,
 extern void led_classdev_suspend(struct led_classdev *led_cdev);
 extern void led_classdev_resume(struct led_classdev *led_cdev);
 
+extern struct led_classdev *of_led_get(struct device_node *np, int index);
+extern void led_put(struct led_classdev *led_cdev);
+
 /**
  * led_blink_set - set blinking with software fallback
  * @led_cdev: the LED to start blinking
-- 
2.17.1

