Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9055CC3F4B
	for <lists+linux-leds@lfdr.de>; Tue,  1 Oct 2019 20:04:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731213AbfJASE1 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 1 Oct 2019 14:04:27 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:37686 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727055AbfJASEY (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 1 Oct 2019 14:04:24 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x91I4Koq039874;
        Tue, 1 Oct 2019 13:04:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1569953060;
        bh=0MAAkXKcdPthxYixT0lj3t8FWR9F4q7jJ98gke/CcJo=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=StMs0bl1+he7hgTa+KETPq8KbTJZT2gH68TxrzgITmj9KTgKHJfnGHpIT9MUqTnAL
         YWUzO72oiq0cZh43Jq83UC674vxiZyIRRqlM4j/zTQVbBgKsJPRzRr9ut2dZ1kkUC0
         saKoVjxuk735m4xFonoUoB2iito5kATs64UTHPGs=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x91I4KeC025102
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 1 Oct 2019 13:04:20 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 1 Oct
 2019 13:04:19 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 1 Oct 2019 13:04:19 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x91I4J4E061654;
        Tue, 1 Oct 2019 13:04:19 -0500
From:   Dan Murphy <dmurphy@ti.com>
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Dan Murphy <dmurphy@ti.com>
Subject: [PATCH 4/5] leds: flash: Add devm_* functions to the flash class
Date:   Tue, 1 Oct 2019 13:04:38 -0500
Message-ID: <20191001180439.8312-4-dmurphy@ti.com>
X-Mailer: git-send-email 2.22.0.214.g8dca754b1e
In-Reply-To: <20191001180439.8312-1-dmurphy@ti.com>
References: <20191001180439.8312-1-dmurphy@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Add the missing device managed API for registration and
unregistration for the LED flash class.

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 drivers/leds/led-class-flash.c  | 50 +++++++++++++++++++++++++++++++++
 include/linux/led-class-flash.h | 14 +++++++++
 2 files changed, 64 insertions(+)

diff --git a/drivers/leds/led-class-flash.c b/drivers/leds/led-class-flash.c
index 60c3de5c6b9f..c2b4fd02a1bc 100644
--- a/drivers/leds/led-class-flash.c
+++ b/drivers/leds/led-class-flash.c
@@ -327,6 +327,56 @@ void led_classdev_flash_unregister(struct led_classdev_flash *fled_cdev)
 }
 EXPORT_SYMBOL_GPL(led_classdev_flash_unregister);
 
+static void devm_led_classdev_flash_release(struct device *dev, void *res)
+{
+	led_classdev_flash_unregister(*(struct led_classdev_flash **)res);
+}
+
+int devm_led_classdev_flash_register_ext(struct device *parent,
+				     struct led_classdev_flash *fled_cdev,
+				     struct led_init_data *init_data)
+{
+	struct led_classdev_flash **dr;
+	int ret;
+
+	dr = devres_alloc(devm_led_classdev_flash_release, sizeof(*dr),
+			  GFP_KERNEL);
+	if (!dr)
+		return -ENOMEM;
+
+	ret = led_classdev_flash_register_ext(parent, fled_cdev, init_data);
+	if (ret) {
+		devres_free(dr);
+		return ret;
+	}
+
+	*dr = fled_cdev;
+	devres_add(parent, dr);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(devm_led_classdev_flash_register_ext);
+
+static int devm_led_classdev_flash_match(struct device *dev,
+					      void *res, void *data)
+{
+	struct fled_cdev **p = res;
+
+	if (WARN_ON(!p || !*p))
+		return 0;
+
+	return *p == data;
+}
+
+void devm_led_classdev_flash_unregister(struct device *dev,
+				  	     struct led_classdev_flash *fled_cdev)
+{
+	WARN_ON(devres_release(dev,
+			       devm_led_classdev_flash_release,
+			       devm_led_classdev_flash_match, fled_cdev));
+}
+EXPORT_SYMBOL_GPL(devm_led_classdev_flash_unregister);
+
 static void led_clamp_align(struct led_flash_setting *s)
 {
 	u32 v, offset;
diff --git a/include/linux/led-class-flash.h b/include/linux/led-class-flash.h
index 1bd83159fa4c..21a3358a1731 100644
--- a/include/linux/led-class-flash.h
+++ b/include/linux/led-class-flash.h
@@ -113,6 +113,20 @@ static inline int led_classdev_flash_register(struct device *parent,
  */
 void led_classdev_flash_unregister(struct led_classdev_flash *fled_cdev);
 
+int devm_led_classdev_flash_register_ext(struct device *parent,
+				     struct led_classdev_flash *fled_cdev,
+				     struct led_init_data *init_data);
+
+
+static inline int devm_led_classdev_flash_register(struct device *parent,
+				     struct led_classdev_flash *fled_cdev)
+{
+	return devm_led_classdev_flash_register_ext(parent, fled_cdev, NULL);
+}
+
+void devm_led_classdev_flash_unregister(struct device *parent,
+					struct led_classdev_flash *fled_cdev);
+
 /**
  * led_set_flash_strobe - setup flash strobe
  * @fled_cdev: the flash LED to set strobe on
-- 
2.22.0.214.g8dca754b1e

