Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6174264667
	for <lists+linux-leds@lfdr.de>; Wed, 10 Jul 2019 14:40:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727068AbfGJMj4 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 10 Jul 2019 08:39:56 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:53306 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727325AbfGJMjt (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 10 Jul 2019 08:39:49 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x6ACdeeO104812;
        Wed, 10 Jul 2019 07:39:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1562762380;
        bh=ItirwO8erJEYpB2ZQfeB1f9//VYKLfEYE9vUyXsRw94=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=fiAQzfgmv6EyownznjqE2NAbeOdOnBlqbOktus8k3tf27F6fETNlihMgdsdHarK0a
         gQLxG0AVtms0wfiulXwC26bUO26ilXTpISul4YJRd+dJxpaYOh/ovK1nH8X8HQx0Qx
         JC7OAD+x2E6sGrkg1x89rSRrRBMPvdsIkvOg8id0=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x6ACdeme113528
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 10 Jul 2019 07:39:40 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 10
 Jul 2019 07:39:40 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 10 Jul 2019 07:39:40 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x6ACdd2g071883;
        Wed, 10 Jul 2019 07:39:39 -0500
From:   Jean-Jacques Hiblot <jjhiblot@ti.com>
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>, <robh+dt@kernel.org>,
        <mark.rutland@arm.com>, <lee.jones@linaro.org>,
        <daniel.thompson@linaro.org>, <jingoohan1@gmail.com>
CC:     <dmurphy@ti.com>, <linux-leds@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <tomi.valkeinen@ti.com>, Jean-Jacques Hiblot <jjhiblot@ti.com>
Subject: [PATCH v3 2/4] leds: Add managed API to get a LED from a device driver
Date:   Wed, 10 Jul 2019 14:39:30 +0200
Message-ID: <20190710123932.28244-3-jjhiblot@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190710123932.28244-1-jjhiblot@ti.com>
References: <20190710123932.28244-1-jjhiblot@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

If the LED is acquired by a consumer device with devm_led_get(), it is
automatically release when the device is detach.

Signed-off-by: Jean-Jacques Hiblot <jjhiblot@ti.com>
---
 drivers/leds/led-class.c | 42 ++++++++++++++++++++++++++++++++++++++++
 include/linux/leds.h     |  2 ++
 2 files changed, 44 insertions(+)

diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
index 0f67b13b0f1f..521cb76fbaf7 100644
--- a/drivers/leds/led-class.c
+++ b/drivers/leds/led-class.c
@@ -264,6 +264,48 @@ void led_put(struct led_classdev *led_cdev)
 }
 EXPORT_SYMBOL_GPL(led_put);
 
+static void devm_led_release(struct device *dev, void *res)
+{
+	struct led_classdev **p = res;
+
+	led_put(*p);
+}
+
+/**
+ * devm_led_get - Resource-managed request of a LED device
+ * @dev:	LED consumer
+ * @idx:	index of the LED to obtain in the consumer
+ *
+ * The device node of the device is parse to find the request LED device.
+ * The LED device returned from this function is automatically released
+ * on driver detach.
+ *
+ * @return a pointer to a LED device or ERR_PTR(errno) on failure.
+ */
+struct led_classdev *__must_check devm_led_get(struct device *dev,
+					       int index)
+{
+	struct led_classdev *led;
+	struct led_classdev **dr;
+
+	led = of_led_get(dev->of_node, index);
+	if (IS_ERR(led))
+		return led;
+
+	dr = devres_alloc(devm_led_release, sizeof(struct led_classdev *),
+			  GFP_KERNEL);
+	if (!dr) {
+		led_put(led);
+		return ERR_PTR(-ENOMEM);
+	}
+
+	*dr = led;
+	devres_add(dev, dr);
+
+	return led;
+}
+EXPORT_SYMBOL_GPL(devm_led_get);
+
 static int match_name(struct device *dev, const void *data)
 {
 	if (!dev_name(dev))
diff --git a/include/linux/leds.h b/include/linux/leds.h
index 0a71c7cdd191..7fcec566d774 100644
--- a/include/linux/leds.h
+++ b/include/linux/leds.h
@@ -148,6 +148,8 @@ extern void led_classdev_resume(struct led_classdev *led_cdev);
 
 extern struct led_classdev *of_led_get(struct device_node *np, int index);
 extern void led_put(struct led_classdev *led_cdev);
+struct led_classdev *__must_check devm_led_get(struct device *dev,
+					       int index);
 
 /**
  * led_blink_set - set blinking with software fallback
-- 
2.17.1

