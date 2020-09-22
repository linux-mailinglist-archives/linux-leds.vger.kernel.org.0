Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0F9B27491D
	for <lists+linux-leds@lfdr.de>; Tue, 22 Sep 2020 21:28:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726603AbgIVT2q (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 22 Sep 2020 15:28:46 -0400
Received: from vsmx011.vodafonemail.xion.oxcs.net ([153.92.174.89]:53517 "EHLO
        vsmx011.vodafonemail.xion.oxcs.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726583AbgIVT2p (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Tue, 22 Sep 2020 15:28:45 -0400
X-Greylist: delayed 343 seconds by postgrey-1.27 at vger.kernel.org; Tue, 22 Sep 2020 15:28:45 EDT
Received: from vsmx003.vodafonemail.xion.oxcs.net (unknown [192.168.75.197])
        by mta-5-out.mta.xion.oxcs.net (Postfix) with ESMTP id 53D2F59D43C;
        Tue, 22 Sep 2020 19:28:44 +0000 (UTC)
Received: from app-43.app.xion.oxcs.net (app-43.app.xion.oxcs.net [10.10.1.43])
        by mta-7-out.mta.xion.oxcs.net (Postfix) with ESMTPA id E9F13539A02;
        Tue, 22 Sep 2020 19:28:35 +0000 (UTC)
Date:   Tue, 22 Sep 2020 21:28:35 +0200 (CEST)
From:   Markus Moll <moll.markus@arcor.de>
To:     Riku Voipio <riku.voipio@iki.fi>, Pavel Machek <pavel@ucw.cz>,
        Dan Murphy <dmurphy@ti.com>
Cc:     linux-leds@vger.kernel.org
Message-ID: <718260256.101908.1600802915869@mail.vodafone.de>
Subject: [PATCH v1] leds: pca9532: correct shift computation in
 pca9532_getled
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Priority: 3
Importance: Medium
X-Mailer: Open-Xchange Mailer v7.8.4-Rev73
X-Originating-Client: open-xchange-appsuite
X-VADE-STATUS: LEGIT
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Each led setting occupies two bits in a corresponding led register.
Accessing these bits requires shifting and masking, which was
implemented incorrectly in pca9532_getled. Two new helper macros
concentrate the computation of those masks in one place.

Signed-off-by: Markus Moll <mmoll@de.pepperl-fuchs.com>
---
 drivers/leds/leds-pca9532.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/leds/leds-pca9532.c b/drivers/leds/leds-pca9532.c
index 41229f775d3..d37fd9577d4 100644
--- a/drivers/leds/leds-pca9532.c
+++ b/drivers/leds/leds-pca9532.c
@@ -27,6 +27,8 @@
 #define PCA9532_REG_PWM(m, i)	(PCA9532_REG_OFFSET(m) + 0x2 + (i) * 2)
 #define LED_REG(m, led)		(PCA9532_REG_OFFSET(m) + 0x5 + (led >> 2))
 #define LED_NUM(led)		(led & 0x3)
+#define LED_SHIFT(led)		(LED_NUM(led) * 2)
+#define LED_MASK(led)		(0x3 << LED_SHIFT(led))
 
 #define ldev_to_led(c)       container_of(c, struct pca9532_led, ldev)
 
@@ -162,9 +164,9 @@ static void pca9532_setled(struct pca9532_led *led)
 	mutex_lock(&data->update_lock);
 	reg = i2c_smbus_read_byte_data(client, LED_REG(maxleds, led->id));
 	/* zero led bits */
-	reg = reg & ~(0x3<<LED_NUM(led->id)*2);
+	reg = reg & ~LED_MASK(led->id);
 	/* set the new value */
-	reg = reg | (led->state << LED_NUM(led->id)*2);
+	reg = reg | (led->state << LED_SHIFT(led->id));
 	i2c_smbus_write_byte_data(client, LED_REG(maxleds, led->id), reg);
 	mutex_unlock(&data->update_lock);
 }
@@ -260,7 +262,7 @@ static enum pca9532_state pca9532_getled(struct pca9532_led *led)
 
 	mutex_lock(&data->update_lock);
 	reg = i2c_smbus_read_byte_data(client, LED_REG(maxleds, led->id));
-	ret = reg >> LED_NUM(led->id)/2;
+	ret = (reg & LED_MASK(led->id)) >> LED_SHIFT(led->id);
 	mutex_unlock(&data->update_lock);
 	return ret;
 }
-- 
2.25.1
