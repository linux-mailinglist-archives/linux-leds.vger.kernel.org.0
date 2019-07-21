Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D08CC6F5BA
	for <lists+linux-leds@lfdr.de>; Sun, 21 Jul 2019 23:06:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726613AbfGUVGI (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 21 Jul 2019 17:06:08 -0400
Received: from smtp06.smtpout.orange.fr ([80.12.242.128]:23713 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726605AbfGUVGI (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 21 Jul 2019 17:06:08 -0400
Received: from localhost.localdomain ([92.140.204.221])
        by mwinf5d11 with ME
        id fZ662000A4n7eLC03Z66rk; Sun, 21 Jul 2019 23:06:07 +0200
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 21 Jul 2019 23:06:07 +0200
X-ME-IP: 92.140.204.221
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     jacek.anaszewski@gmail.com, pavel@ucw.cz, dmurphy@ti.com
Cc:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] leds: ktd2692: Fix a typo in the name of a constant
Date:   Sun, 21 Jul 2019 23:05:39 +0200
Message-Id: <20190721210539.25669-1-christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

There is a typo in KTD2962_MM_MIN_CURR_THRESHOLD_SCALE. 6 and 9 are
switched in 2962.

Define and use KTD2692_MM_MIN_CURR_THRESHOLD_SCALE instead.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/leds/leds-ktd2692.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/leds-ktd2692.c b/drivers/leds/leds-ktd2692.c
index 45296aaca9da..44db748c570e 100644
--- a/drivers/leds/leds-ktd2692.c
+++ b/drivers/leds/leds-ktd2692.c
@@ -22,7 +22,7 @@
 /* Value related the movie mode */
 #define KTD2692_MOVIE_MODE_CURRENT_LEVELS	16
 #define KTD2692_MM_TO_FL_RATIO(x)		((x) / 3)
-#define KTD2962_MM_MIN_CURR_THRESHOLD_SCALE	8
+#define KTD2692_MM_MIN_CURR_THRESHOLD_SCALE	8
 
 /* Value related the flash mode */
 #define KTD2692_FLASH_MODE_TIMEOUT_LEVELS	8
@@ -253,7 +253,7 @@ static void ktd2692_setup(struct ktd2692_context *led)
 	ktd2692_expresswire_reset(led);
 	gpiod_direction_output(led->aux_gpio, KTD2692_LOW);
 
-	ktd2692_expresswire_write(led, (KTD2962_MM_MIN_CURR_THRESHOLD_SCALE - 1)
+	ktd2692_expresswire_write(led, (KTD2692_MM_MIN_CURR_THRESHOLD_SCALE - 1)
 				 | KTD2692_REG_MM_MIN_CURR_THRESHOLD_BASE);
 	ktd2692_expresswire_write(led, KTD2692_FLASH_MODE_CURR_PERCENT(45)
 				 | KTD2692_REG_FLASH_CURRENT_BASE);
-- 
2.20.1

