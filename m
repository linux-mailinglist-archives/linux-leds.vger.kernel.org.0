Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C3084EE02D
	for <lists+linux-leds@lfdr.de>; Mon,  4 Nov 2019 13:39:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729253AbfKDMjn (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 4 Nov 2019 07:39:43 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:52664 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727267AbfKDMjn (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 4 Nov 2019 07:39:43 -0500
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id xA4Cdemm118813;
        Mon, 4 Nov 2019 06:39:40 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1572871180;
        bh=CiO3hXAyFsuZm3cE8SXZzPxL1D+KaY4p9kZlHGgSu6M=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=rWAz4FGwSyFQQyHjOvix7FTqguGBvpYXY9Ov0GbmBvRZGd7fXifBrSEZSjENxSwR2
         Z1RWXbXNvlXSnN7qFoWUUl2LZx1Yz1QEh612+vd4lpk62HmBOsNPBBgXlLCamQTo04
         UcpclimbfRDRMDQVDJuNPbhR8rJAvxc1Xc0ZzW3g=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id xA4CdeaQ069385;
        Mon, 4 Nov 2019 06:39:40 -0600
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 4 Nov
 2019 06:39:25 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 4 Nov 2019 06:39:25 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id xA4Cddll013779;
        Mon, 4 Nov 2019 06:39:39 -0600
From:   Dan Murphy <dmurphy@ti.com>
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Dan Murphy <dmurphy@ti.com>
Subject: [PATCH v16 19/19] leds: lp55xx-common: Remove extern from lp55xx-common header
Date:   Mon, 4 Nov 2019 06:37:07 -0600
Message-ID: <20191104123707.31930-20-dmurphy@ti.com>
X-Mailer: git-send-email 2.22.0.214.g8dca754b1e
In-Reply-To: <20191104123707.31930-1-dmurphy@ti.com>
References: <20191104123707.31930-1-dmurphy@ti.com>
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
 drivers/leds/leds-lp55xx-common.h | 26 ++++++++++++--------------
 1 file changed, 12 insertions(+), 14 deletions(-)

diff --git a/drivers/leds/leds-lp55xx-common.h b/drivers/leds/leds-lp55xx-common.h
index 18476051d3d2..051f8b33c601 100644
--- a/drivers/leds/leds-lp55xx-common.h
+++ b/drivers/leds/leds-lp55xx-common.h
@@ -183,29 +183,27 @@ struct lp55xx_led {
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
-*lp55xx_of_populate_pdata(struct device *dev, struct device_node *np,
-			  struct lp55xx_chip *chip);
+struct lp55xx_platform_data *lp55xx_of_populate_pdata(struct device *dev,
+						      struct device_node *np,
+						      struct lp55xx_chip *chip);
 
 #endif /* _LEDS_LP55XX_COMMON_H */
-- 
2.22.0.214.g8dca754b1e

