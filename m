Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C3C79C3F46
	for <lists+linux-leds@lfdr.de>; Tue,  1 Oct 2019 20:04:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727562AbfJASEY (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 1 Oct 2019 14:04:24 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:37688 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727536AbfJASEX (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 1 Oct 2019 14:04:23 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x91I4JCx039866;
        Tue, 1 Oct 2019 13:04:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1569953060;
        bh=GGDOyQL+13uGomQIzn17lPQZjfrmmobRzDF35QsnYtE=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=G7aZZl8TjDZUPebnntJYia0rvpwZrWt9tckxhEtPSyPDXuD3pMm+HPNWM/30ndW62
         lriQiXdWk6JpjkAn0CLMogGqoGH2WOteYyZRgx0foaEfwlhfPgns5/DqkAP66A5jBq
         LP8W+UVFNs9aVqJSe6k4I8mJKr8K42XZk90/OhuU=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x91I4J1O025096
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 1 Oct 2019 13:04:19 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 1 Oct
 2019 13:04:09 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 1 Oct 2019 13:04:19 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x91I4JZp126163;
        Tue, 1 Oct 2019 13:04:19 -0500
From:   Dan Murphy <dmurphy@ti.com>
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Dan Murphy <dmurphy@ti.com>
Subject: [PATCH 3/5] leds: flash: Remove extern from the header file
Date:   Tue, 1 Oct 2019 13:04:37 -0500
Message-ID: <20191001180439.8312-3-dmurphy@ti.com>
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

extern is implied and is not needed in the header file.
Remove the extern keyword and re-align the code.

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 include/linux/led-class-flash.h | 22 ++++++++++------------
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/include/linux/led-class-flash.h b/include/linux/led-class-flash.h
index 7ff287a9e2a2..1bd83159fa4c 100644
--- a/include/linux/led-class-flash.h
+++ b/include/linux/led-class-flash.h
@@ -94,12 +94,12 @@ static inline struct led_classdev_flash *lcdev_to_flcdev(
  *
  * Returns: 0 on success or negative error value on failure
  */
-extern int led_classdev_flash_register_ext(struct device *parent,
-					struct led_classdev_flash *fled_cdev,
-					struct led_init_data *init_data);
+int led_classdev_flash_register_ext(struct device *parent,
+				    struct led_classdev_flash *fled_cdev,
+				    struct led_init_data *init_data);
 
 static inline int led_classdev_flash_register(struct device *parent,
-					struct led_classdev_flash *fled_cdev)
+					   struct led_classdev_flash *fled_cdev)
 {
 	return led_classdev_flash_register_ext(parent, fled_cdev, NULL);
 }
@@ -111,7 +111,7 @@ static inline int led_classdev_flash_register(struct device *parent,
  *
  * Unregister a previously registered via led_classdev_flash_register object
  */
-extern void led_classdev_flash_unregister(struct led_classdev_flash *fled_cdev);
+void led_classdev_flash_unregister(struct led_classdev_flash *fled_cdev);
 
 /**
  * led_set_flash_strobe - setup flash strobe
@@ -159,8 +159,8 @@ static inline int led_get_flash_strobe(struct led_classdev_flash *fled_cdev,
  *
  * Returns: 0 on success or negative error value on failure
  */
-extern int led_set_flash_brightness(struct led_classdev_flash *fled_cdev,
-					u32 brightness);
+int led_set_flash_brightness(struct led_classdev_flash *fled_cdev,
+			     u32 brightness);
 
 /**
  * led_update_flash_brightness - update flash LED brightness
@@ -171,7 +171,7 @@ extern int led_set_flash_brightness(struct led_classdev_flash *fled_cdev,
  *
  * Returns: 0 on success or negative error value on failure
  */
-extern int led_update_flash_brightness(struct led_classdev_flash *fled_cdev);
+int led_update_flash_brightness(struct led_classdev_flash *fled_cdev);
 
 /**
  * led_set_flash_timeout - set flash LED timeout
@@ -182,8 +182,7 @@ extern int led_update_flash_brightness(struct led_classdev_flash *fled_cdev);
  *
  * Returns: 0 on success or negative error value on failure
  */
-extern int led_set_flash_timeout(struct led_classdev_flash *fled_cdev,
-					u32 timeout);
+int led_set_flash_timeout(struct led_classdev_flash *fled_cdev, u32 timeout);
 
 /**
  * led_get_flash_fault - get the flash LED fault
@@ -194,7 +193,6 @@ extern int led_set_flash_timeout(struct led_classdev_flash *fled_cdev,
  *
  * Returns: 0 on success or negative error value on failure
  */
-extern int led_get_flash_fault(struct led_classdev_flash *fled_cdev,
-					u32 *fault);
+int led_get_flash_fault(struct led_classdev_flash *fled_cdev, u32 *fault);
 
 #endif	/* __LINUX_FLASH_LEDS_H_INCLUDED */
-- 
2.22.0.214.g8dca754b1e

