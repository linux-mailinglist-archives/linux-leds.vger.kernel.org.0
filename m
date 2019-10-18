Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 56C41DC4C2
	for <lists+linux-leds@lfdr.de>; Fri, 18 Oct 2019 14:26:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2438645AbfJRM0f (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 18 Oct 2019 08:26:35 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:48416 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2633694AbfJRM0B (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 18 Oct 2019 08:26:01 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9ICPwm2066260;
        Fri, 18 Oct 2019 07:25:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1571401558;
        bh=96XKwsvfr/hilZmCToqslXZd9JY49viDUA+WUPFaAOY=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=vuMiDNpRLQODv3yxgUHazpLE7igf/4LxgYcEU3A334R3hdez6dXqT3GYJdI/nnDSG
         0CkOwG5pXKwtif/ixjiDI9isJVrtXtKKL7uhILiIpZOvlwn6CyKzK3bPlpvRMSa75b
         JIg7NVgjdTftSpuzwSkQQjxgJvR0T+1cetLR2I28=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9ICPwSC053657
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 18 Oct 2019 07:25:58 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 18
 Oct 2019 07:25:50 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 18 Oct 2019 07:25:50 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9ICPwn6092036;
        Fri, 18 Oct 2019 07:25:58 -0500
From:   Dan Murphy <dmurphy@ti.com>
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Dan Murphy <dmurphy@ti.com>
Subject: [PATCH v14 19/19] leds: lp55xx-common: Remove extern from lp55xx-common header
Date:   Fri, 18 Oct 2019 07:25:21 -0500
Message-ID: <20191018122521.6757-20-dmurphy@ti.com>
X-Mailer: git-send-email 2.22.0.214.g8dca754b1e
In-Reply-To: <20191018122521.6757-1-dmurphy@ti.com>
References: <20191018122521.6757-1-dmurphy@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

extern is implied and is not needed in the common header file.
Remove the extern keyword and re-align the code.

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 drivers/leds/leds-lp55xx-common.h | 24 +++++++++++-------------
 1 file changed, 11 insertions(+), 13 deletions(-)

diff --git a/drivers/leds/leds-lp55xx-common.h b/drivers/leds/leds-lp55xx-common.h
index 4a0cdbfe54a6..69ae96a0a24e 100644
--- a/drivers/leds/leds-lp55xx-common.h
+++ b/drivers/leds/leds-lp55xx-common.h
@@ -183,28 +183,26 @@ struct lp55xx_led {
 };
 
 /* register access */
-extern int lp55xx_write(struct lp55xx_chip *chip, u8 reg, u8 val);
-extern int lp55xx_read(struct lp55xx_chip *chip, u8 reg, u8 *val);
-extern int lp55xx_update_bits(struct lp55xx_chip *chip, u8 reg,
-			u8 mask, u8 val);
+int lp55xx_write(struct lp55xx_chip *chip, u8 reg, u8 val);
+int lp55xx_read(struct lp55xx_chip *chip, u8 reg, u8 *val);
+int lp55xx_update_bits(struct lp55xx_chip *chip, u8 reg, u8 mask, u8 val);
 
 /* external clock detection */
-extern bool lp55xx_is_extclk_used(struct lp55xx_chip *chip);
+bool lp55xx_is_extclk_used(struct lp55xx_chip *chip);
 
 /* common device init/deinit functions */
-extern int lp55xx_init_device(struct lp55xx_chip *chip);
-extern void lp55xx_deinit_device(struct lp55xx_chip *chip);
+int lp55xx_init_device(struct lp55xx_chip *chip);
+void lp55xx_deinit_device(struct lp55xx_chip *chip);
 
 /* common LED class device functions */
-extern int lp55xx_register_leds(struct lp55xx_led *led,
-				struct lp55xx_chip *chip);
+int lp55xx_register_leds(struct lp55xx_led *led, struct lp55xx_chip *chip);
 
 /* common device attributes functions */
-extern int lp55xx_register_sysfs(struct lp55xx_chip *chip);
-extern void lp55xx_unregister_sysfs(struct lp55xx_chip *chip);
+int lp55xx_register_sysfs(struct lp55xx_chip *chip);
+void lp55xx_unregister_sysfs(struct lp55xx_chip *chip);
 
 /* common device tree population function */
-extern struct lp55xx_platform_data
-*lp55xx_of_populate_pdata(struct device *dev, struct device_node *np);
+struct lp55xx_platform_data *lp55xx_of_populate_pdata(struct device *dev,
+						      struct device_node *np);
 
 #endif /* _LEDS_LP55XX_COMMON_H */
-- 
2.22.0.214.g8dca754b1e

