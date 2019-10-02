Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8EC20C8E6D
	for <lists+linux-leds@lfdr.de>; Wed,  2 Oct 2019 18:33:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726152AbfJBQdX (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 2 Oct 2019 12:33:23 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:56688 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725893AbfJBQdX (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 2 Oct 2019 12:33:23 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x92GXIMS034417;
        Wed, 2 Oct 2019 11:33:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1570033998;
        bh=DTUoNDG5N8HN1ZaCfl0a0R825gnKHU8frM18CiQxi5o=;
        h=From:To:CC:Subject:Date;
        b=pLzsE7V5DxbmX+logTWc1WDZTxFTXbsV2zE3tFOBWHHlmgT/6eOF8EcDGwxQo5pJj
         gEv6Z2HE/YbGusvARgwT/mgDlaBpoAmbrqGC+fAYHbpOUuJa0wSp9QCdu08z67Ff4F
         ZMP8biKK4iUb7Bgj8VQfnoLGx3/P529ItEpTSq4Y=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x92GXI8B076694
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 2 Oct 2019 11:33:18 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 2 Oct
 2019 11:33:07 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 2 Oct 2019 11:33:07 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x92GXHYN112973;
        Wed, 2 Oct 2019 11:33:17 -0500
From:   Dan Murphy <dmurphy@ti.com>
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Dan Murphy <dmurphy@ti.com>
Subject: [RFC PATCH] leds: core: Fix LED_COLOR_MAX_ID
Date:   Wed, 2 Oct 2019 11:34:00 -0500
Message-ID: <20191002163400.25317-1-dmurphy@ti.com>
X-Mailer: git-send-email 2.22.0.214.g8dca754b1e
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

The LED_COLOR_MAX_ID is incorrect.  THe MAX_ID should
be the last COLOR_ID in the list.  If an array was allocate
with MAX_ID the allocation would be correct but the meaning
is wrong.

So for array allocation the code should use LED_NUM_COLOR_IDS
which will allocate MAX_ID + 1.  Whent the code needs to validate
that the color ID is not out of bounds then the code should use
LED_COLOR_MAX_ID.

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 drivers/leds/led-core.c           | 4 ++--
 drivers/leds/leds.h               | 2 +-
 include/dt-bindings/leds/common.h | 3 ++-
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c
index f1f718dbe0f8..4e57d47c97e0 100644
--- a/drivers/leds/led-core.c
+++ b/drivers/leds/led-core.c
@@ -25,7 +25,7 @@ EXPORT_SYMBOL_GPL(leds_list_lock);
 LIST_HEAD(leds_list);
 EXPORT_SYMBOL_GPL(leds_list);
 
-const char * const led_colors[LED_COLOR_ID_MAX] = {
+const char * const led_colors[LED_NUM_COLOR_IDS] = {
 	[LED_COLOR_ID_WHITE] = "white",
 	[LED_COLOR_ID_RED] = "red",
 	[LED_COLOR_ID_GREEN] = "green",
@@ -385,7 +385,7 @@ static void led_parse_fwnode_props(struct device *dev,
 		ret = fwnode_property_read_u32(fwnode, "color", &props->color);
 		if (ret)
 			dev_err(dev, "Error parsing 'color' property (%d)\n", ret);
-		else if (props->color >= LED_COLOR_ID_MAX)
+		else if (props->color > LED_COLOR_ID_MAX)
 			dev_err(dev, "LED color identifier out of range\n");
 		else
 			props->color_present = true;
diff --git a/drivers/leds/leds.h b/drivers/leds/leds.h
index 2d9eb48bbed9..2c493efc8f55 100644
--- a/drivers/leds/leds.h
+++ b/drivers/leds/leds.h
@@ -33,6 +33,6 @@ ssize_t led_trigger_write(struct file *filp, struct kobject *kobj,
 extern struct rw_semaphore leds_list_lock;
 extern struct list_head leds_list;
 extern struct list_head trigger_list;
-extern const char * const led_colors[LED_COLOR_ID_MAX];
+extern const char * const led_colors[LED_NUM_COLOR_IDS];
 
 #endif	/* __LEDS_H_INCLUDED */
diff --git a/include/dt-bindings/leds/common.h b/include/dt-bindings/leds/common.h
index 9e1256a7c1bf..ce82f0b5f6d6 100644
--- a/include/dt-bindings/leds/common.h
+++ b/include/dt-bindings/leds/common.h
@@ -29,7 +29,8 @@
 #define LED_COLOR_ID_VIOLET	5
 #define LED_COLOR_ID_YELLOW	6
 #define LED_COLOR_ID_IR		7
-#define LED_COLOR_ID_MAX	8
+#define LED_COLOR_ID_MAX	LED_COLOR_ID_IR
+#define LED_NUM_COLOR_IDS	(LED_COLOR_ID_MAX + 1)
 
 /* Standard LED functions */
 #define LED_FUNCTION_ACTIVITY "activity"
-- 
2.22.0.214.g8dca754b1e

