Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 655F0D0A43
	for <lists+linux-leds@lfdr.de>; Wed,  9 Oct 2019 10:52:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730000AbfJIIv5 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 9 Oct 2019 04:51:57 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:43670 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725942AbfJIIv5 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 9 Oct 2019 04:51:57 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x998pnj6035193;
        Wed, 9 Oct 2019 03:51:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1570611109;
        bh=MNtYkdAzVgE8Ou25bkrDZ4gd8PxFOPcx4cXOPWheoh0=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=h2iqrqDQTjhXuTQfqbA56rBtITHeAxuvTjNW16gT+hwuHOFwRphpDZWXfnEspC1Ov
         ZfhkVg66RB5WdlJghLp8bqUdLdHp4BSYIt00IxooPvP84XWZJMI0iDRlJDuxn7ad7c
         YGu43lsCqP6htNP/Bm+1BZmycvss1h8/6pq5DrtY=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x998pne0043422
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 9 Oct 2019 03:51:49 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 9 Oct
 2019 03:51:48 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 9 Oct 2019 03:51:48 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x998pmep099135;
        Wed, 9 Oct 2019 03:51:48 -0500
From:   Jean-Jacques Hiblot <jjhiblot@ti.com>
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>, <sre@kernel.org>,
        <robh+dt@kernel.org>, <mark.rutland@arm.com>,
        <lee.jones@linaro.org>, <daniel.thompson@linaro.org>
CC:     <dmurphy@ti.com>, <linux-leds@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <tomi.valkeinen@ti.com>, Jean-Jacques Hiblot <jjhiblot@ti.com>
Subject: [PATCH v10 3/6] leds: Add managed API to get a LED from a device driver
Date:   Wed, 9 Oct 2019 10:51:24 +0200
Message-ID: <20191009085127.22843-4-jjhiblot@ti.com>
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

If the LED is acquired by a consumer device with devm_led_get(), it is
automatically released when the device is detached.

Signed-off-by: Jean-Jacques Hiblot <jjhiblot@ti.com>
Acked-by: Pavel Machek <pavel@ucw.cz>
---
 drivers/leds/led-class.c | 49 ++++++++++++++++++++++++++++++++++++++++
 include/linux/leds.h     |  2 ++
 2 files changed, 51 insertions(+)

diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
index 1d1f1d546dc7..639224392ffa 100644
--- a/drivers/leds/led-class.c
+++ b/drivers/leds/led-class.c
@@ -264,6 +264,55 @@ void led_put(struct led_classdev *led_cdev)
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
+ * devm_of_led_get - Resource-managed request of a LED device
+ * @dev:	LED consumer
+ * @index:	index of the LED to obtain in the consumer
+ *
+ * The device node of the device is parse to find the request LED device.
+ * The LED device returned from this function is automatically released
+ * on driver detach.
+ *
+ * @return a pointer to a LED device or ERR_PTR(errno) on failure.
+ */
+struct led_classdev *__must_check devm_of_led_get(struct device *dev,
+						  int index)
+{
+	struct led_classdev *led;
+	struct led_classdev **dr;
+
+	if (!dev)
+		return ERR_PTR(-EINVAL);
+
+	/* Consummer not using device tree? */
+	if (!dev_of_node(dev))
+		return ERR_PTR(-ENOTSUPP);
+
+	led = of_led_get(dev_of_node(dev), index);
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
+EXPORT_SYMBOL_GPL(devm_of_led_get);
+
 static int led_classdev_next_name(const char *init_name, char *name,
 				  size_t len)
 {
diff --git a/include/linux/leds.h b/include/linux/leds.h
index 6f7371bc7757..9b94cf752012 100644
--- a/include/linux/leds.h
+++ b/include/linux/leds.h
@@ -199,6 +199,8 @@ extern void led_classdev_resume(struct led_classdev *led_cdev);
 
 extern struct led_classdev *of_led_get(struct device_node *np, int index);
 extern void led_put(struct led_classdev *led_cdev);
+struct led_classdev *__must_check devm_of_led_get(struct device *dev,
+						  int index);
 
 /**
  * led_blink_set - set blinking with software fallback
-- 
2.17.1

