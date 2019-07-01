Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3411B5BF62
	for <lists+linux-leds@lfdr.de>; Mon,  1 Jul 2019 17:16:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730199AbfGAPOk (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 1 Jul 2019 11:14:40 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:58226 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730186AbfGAPOj (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 1 Jul 2019 11:14:39 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x61FESVg002124;
        Mon, 1 Jul 2019 10:14:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1561994068;
        bh=O0D/V4WZu3t93vPM9Q9NrNn7oxGBb0WBPibwmXJHyIw=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=L8MsFSUTnrHnqjVkDw+kJeTC5NpZ9maijwhPCZrjWWjk9JilKE08XQ61KtYHRS0rO
         92bouxd4Bxee+fmJC++GrIDxB9Oj9TdYm40mgBzDBY+2GhRSPRtthV5kMvYRyKkj6o
         CI864+kZc5V/48lhrYkT/7yfIVli3bfinq8Q6+Yo=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x61FESD6055557
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 1 Jul 2019 10:14:28 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 1 Jul
 2019 10:14:28 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 1 Jul 2019 10:14:28 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x61FERDB063745;
        Mon, 1 Jul 2019 10:14:27 -0500
From:   Jean-Jacques Hiblot <jjhiblot@ti.com>
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>, <robh+dt@kernel.org>,
        <mark.rutland@arm.com>, <lee.jones@linaro.org>,
        <daniel.thompson@linaro.org>, <jingoohan1@gmail.com>
CC:     <dmurphy@ti.com>, <linux-leds@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <tomi.valkeinen@ti.com>, Jean-Jacques Hiblot <jjhiblot@ti.com>
Subject: [PATCH 1/4] leds: of: create a child device if the LED node contains a "compatible" string
Date:   Mon, 1 Jul 2019 17:14:20 +0200
Message-ID: <20190701151423.30768-2-jjhiblot@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190701151423.30768-1-jjhiblot@ti.com>
References: <20190701151423.30768-1-jjhiblot@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

This allows the LED core to probe a consumer device when the LED is
registered. In that way the LED can be seen like a minimalist bus that
can handle at most one device.
This is useful to manage simple devices, the purpose of which is
mostly to drive a LED.

One example would be a LED-controlled backlight. The device-tree would look
like the following:

tlc59116@40 {
	compatible = "ti,tlc59108";
	reg = <0x40>;

	bl@2 {
		label = "backlight";
		reg = <0x2>;

		compatible = "led-backlight";
		brightness-levels = <0 243 245 247 248 249 251 252 255>;
		default-brightness-level = <8>;
	};
};

Signed-off-by: Jean-Jacques Hiblot <jjhiblot@ti.com>
---
 drivers/leds/led-class.c | 16 ++++++++++++++++
 include/linux/leds.h     | 11 +++++++++++
 2 files changed, 27 insertions(+)

diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
index 4793e77808e2..abf0e63285b9 100644
--- a/drivers/leds/led-class.c
+++ b/drivers/leds/led-class.c
@@ -14,6 +14,7 @@
 #include <linux/leds.h>
 #include <linux/list.h>
 #include <linux/module.h>
+#include <linux/of_platform.h>
 #include <linux/slab.h>
 #include <linux/spinlock.h>
 #include <linux/timer.h>
@@ -306,6 +307,17 @@ int of_led_classdev_register(struct device *parent, struct device_node *np,
 
 	mutex_unlock(&led_cdev->led_access);
 
+	/* Parse the LED's node in the device-tree and create the consumer
+	 * device if needed.
+	 */
+	if (np) {
+		struct platform_device *pd;
+
+		pd = of_platform_device_create(np, NULL, led_cdev->dev);
+		if (pd)
+			led_cdev->consumer = &pd->dev;
+	}
+
 	dev_dbg(parent, "Registered led device: %s\n",
 			led_cdev->name);
 
@@ -321,6 +333,10 @@ EXPORT_SYMBOL_GPL(of_led_classdev_register);
  */
 void led_classdev_unregister(struct led_classdev *led_cdev)
 {
+	/* destroy the consummer device before removing anything else */
+	if (led_cdev->consumer)
+		of_platform_device_destroy(led_cdev->consumer, NULL);
+
 #ifdef CONFIG_LEDS_TRIGGERS
 	down_write(&led_cdev->trigger_lock);
 	if (led_cdev->trigger)
diff --git a/include/linux/leds.h b/include/linux/leds.h
index 9b2bf574a17a..63feb8495f3e 100644
--- a/include/linux/leds.h
+++ b/include/linux/leds.h
@@ -91,6 +91,12 @@ struct led_classdev {
 	int (*pattern_clear)(struct led_classdev *led_cdev);
 
 	struct device		*dev;
+	/*
+	 * The consumer device is a child device created by the LED core if the
+	 * appropriate information (ie "compatible" string) is available in the
+	 * device tree. Its life cycle follows the life cycle of the LED device.
+	 */
+	struct device		*consumer;
 	const struct attribute_group	**groups;
 
 	struct list_head	 node;			/* LED Device list */
@@ -141,6 +147,11 @@ extern void devm_led_classdev_unregister(struct device *parent,
 extern void led_classdev_suspend(struct led_classdev *led_cdev);
 extern void led_classdev_resume(struct led_classdev *led_cdev);
 
+static inline struct led_classdev *to_led_classdev(struct device *dev)
+{
+	return (struct led_classdev *) dev_get_drvdata(dev);
+}
+
 /**
  * led_blink_set - set blinking with software fallback
  * @led_cdev: the LED to start blinking
-- 
2.17.1

