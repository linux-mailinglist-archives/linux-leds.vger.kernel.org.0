Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 228EBC88DC
	for <lists+linux-leds@lfdr.de>; Wed,  2 Oct 2019 14:40:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726829AbfJBMkW (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 2 Oct 2019 08:40:22 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:54008 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725747AbfJBMkI (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 2 Oct 2019 08:40:08 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x92Ce43E014737;
        Wed, 2 Oct 2019 07:40:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1570020004;
        bh=GGDOyQL+13uGomQIzn17lPQZjfrmmobRzDF35QsnYtE=;
        h=From:To:CC:Subject:Date;
        b=zPiMketrYRsyTn91wIRfRfVw1RXCFpSapJbumE7qE0Fn08Id7HLjO6RSOa2LQn3au
         eTjzCCjjdav4+d8awZJTmXL//OtdZqh+hYTDCyWHa8utXcTG/IjsccF1BwSwSvssUj
         e7T3fgS5E50VgyJV/V+iRPbCV98h24nkD4qpMzME=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x92Ce3hK009143
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 2 Oct 2019 07:40:04 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 2 Oct
 2019 07:39:53 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 2 Oct 2019 07:40:03 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x92Ce3rm055816;
        Wed, 2 Oct 2019 07:40:03 -0500
From:   Dan Murphy <dmurphy@ti.com>
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Dan Murphy <dmurphy@ti.com>
Subject: [PATCH v2 1/6] leds: flash: Remove extern from the header file
Date:   Wed, 2 Oct 2019 07:40:37 -0500
Message-ID: <20191002124042.25593-1-dmurphy@ti.com>
X-Mailer: git-send-email 2.22.0.214.g8dca754b1e
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

