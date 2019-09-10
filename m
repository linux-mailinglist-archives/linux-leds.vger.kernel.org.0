Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AD648AE8C6
	for <lists+linux-leds@lfdr.de>; Tue, 10 Sep 2019 13:01:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390667AbfIJLAK (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 10 Sep 2019 07:00:10 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:56638 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390489AbfIJLAD (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 10 Sep 2019 07:00:03 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8AAxs02030064;
        Tue, 10 Sep 2019 05:59:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1568113195;
        bh=X9CLDurAV4+8BXGygMXyGmO09KukiKXcqx5K3Hb479E=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=y65Rh7J5vVyLnwSWFpIvyHbbJYxn7n+iL2Nx7OwbhcCycRa5qcLPAzZi+55McmUtC
         7+AjVamgI1EmbvsiqubkqtFtXIighTbK3TEUnbHqNlkkVSCyawQaADkySxqFUqFrDj
         o+9ANh/BcGYrRLCRMfLoi8RpWj36k4DRc6xae+4s=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8AAxsqW036220
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 10 Sep 2019 05:59:54 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 10
 Sep 2019 05:59:54 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 10 Sep 2019 05:59:54 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8AAxrPx018246;
        Tue, 10 Sep 2019 05:59:54 -0500
From:   Jean-Jacques Hiblot <jjhiblot@ti.com>
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>, <robh+dt@kernel.org>,
        <mark.rutland@arm.com>, <lee.jones@linaro.org>,
        <daniel.thompson@linaro.org>
CC:     <dmurphy@ti.com>, <linux-leds@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <dridevel@lists.freedesktop.org>,
        <tomi.valkeinen@ti.com>, Jean-Jacques Hiblot <jjhiblot@ti.com>
Subject: [PATCH v5 2/4] leds: Add managed API to get a LED from a device driver
Date:   Tue, 10 Sep 2019 12:59:44 +0200
Message-ID: <20190910105946.23057-3-jjhiblot@ti.com>
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

If the LED is acquired by a consumer device with devm_led_get(), it is
automatically released when the device is detached.

Signed-off-by: Jean-Jacques Hiblot <jjhiblot@ti.com>
Acked-by: Pavel Machek <pavel@ucw.cz>
---
 drivers/leds/led-class.c | 42 ++++++++++++++++++++++++++++++++++++++++
 include/linux/leds.h     |  2 ++
 2 files changed, 44 insertions(+)

diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
index eb98bf13e53b..7763aad8fabe 100644
--- a/drivers/leds/led-class.c
+++ b/drivers/leds/led-class.c
@@ -263,6 +263,48 @@ void led_put(struct led_classdev *led_cdev)
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

