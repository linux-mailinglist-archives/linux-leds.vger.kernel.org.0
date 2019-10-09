Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 34B62D0A33
	for <lists+linux-leds@lfdr.de>; Wed,  9 Oct 2019 10:51:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729865AbfJIIvw (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 9 Oct 2019 04:51:52 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:46864 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725942AbfJIIvw (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 9 Oct 2019 04:51:52 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x998pj9p016803;
        Wed, 9 Oct 2019 03:51:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1570611105;
        bh=FR+nvrSZgWMXntW2XMWvjmlcw8r7jN30c+jRxIX64OA=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=s/g71kTwPC1ghewOl8Z6WeV+GKMOtPKEOgLgRCmTFAssdJ/Vhi1AfB9CVgrbT/JlD
         qVn8VxEqS3n4FV+0yHih9A9q80IEUyzfEMO9ahHc5tvXpQpsU2T36rt+k104UQZmFu
         MlCK3oLXa24LcyEn+GXqukGEMBzylvk5pS5QM+PM=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x998pjD2073296
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 9 Oct 2019 03:51:45 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 9 Oct
 2019 03:51:44 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 9 Oct 2019 03:51:41 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x998ph4L099088;
        Wed, 9 Oct 2019 03:51:44 -0500
From:   Jean-Jacques Hiblot <jjhiblot@ti.com>
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>, <sre@kernel.org>,
        <robh+dt@kernel.org>, <mark.rutland@arm.com>,
        <lee.jones@linaro.org>, <daniel.thompson@linaro.org>
CC:     <dmurphy@ti.com>, <linux-leds@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <tomi.valkeinen@ti.com>, Jean-Jacques Hiblot <jjhiblot@ti.com>
Subject: [PATCH v10 2/6] leds: Add of_led_get() and led_put()
Date:   Wed, 9 Oct 2019 10:51:23 +0200
Message-ID: <20191009085127.22843-3-jjhiblot@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191009085127.22843-1-jjhiblot@ti.com>
References: <20191009085127.22843-1-jjhiblot@ti.com>
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
index bfa1b1033274..1d1f1d546dc7 100644
--- a/drivers/leds/led-class.c
+++ b/drivers/leds/led-class.c
@@ -19,6 +19,7 @@
 #include <linux/spinlock.h>
 #include <linux/timer.h>
 #include <uapi/linux/uleds.h>
+#include <linux/of.h>
 #include "leds.h"
 
 static struct class *leds_class;
@@ -214,6 +215,55 @@ static int led_resume(struct device *dev)
 
 static SIMPLE_DEV_PM_OPS(leds_class_dev_pm_ops, led_suspend, led_resume);
 
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
+	/* Not using device tree? */
+	if (!IS_ENABLED(CONFIG_OF))
+		return ERR_PTR(-ENOTSUPP);
+	if (!np)
+		return ERR_PTR(-EINVAL);
+
+	led_node = of_parse_phandle(np, "leds", index);
+	if (!led_node)
+		return ERR_PTR(-ENOENT);
+
+	led_dev = class_find_device_by_of_node(leds_class, led_node);
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
 static int led_classdev_next_name(const char *init_name, char *name,
 				  size_t len)
 {
diff --git a/include/linux/leds.h b/include/linux/leds.h
index b8df71193329..6f7371bc7757 100644
--- a/include/linux/leds.h
+++ b/include/linux/leds.h
@@ -20,6 +20,7 @@
 
 struct device;
 struct led_pattern;
+struct device_node;
 /*
  * LED Core
  */
@@ -196,6 +197,9 @@ extern void devm_led_classdev_unregister(struct device *parent,
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

