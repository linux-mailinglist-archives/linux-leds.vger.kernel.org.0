Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 93B36274AA5
	for <lists+linux-leds@lfdr.de>; Tue, 22 Sep 2020 23:06:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726818AbgIVVFi (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 22 Sep 2020 17:05:38 -0400
Received: from smtp05.smtpout.orange.fr ([80.12.242.127]:26269 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726817AbgIVVFi (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 22 Sep 2020 17:05:38 -0400
Received: from localhost.localdomain ([93.23.13.13])
        by mwinf5d10 with ME
        id X95a230060Gtiid0395aX5; Tue, 22 Sep 2020 23:05:35 +0200
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Tue, 22 Sep 2020 23:05:35 +0200
X-ME-IP: 93.23.13.13
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     pavel@ucw.cz, dmurphy@ti.com, jacek.anaszewski@gmail.com
Cc:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] leds: lp50xx: Fix an error handling path in 'lp50xx_probe_dt()'
Date:   Tue, 22 Sep 2020 23:05:15 +0200
Message-Id: <20200922210515.385099-1-christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

In case of memory allocation failure, we must release some resources as
done in all other error handling paths of the function.

'goto child_out' instead of a direct return so that 'fwnode_handle_put()'
is called when we break out of a 'device_for_each_child_node' loop.

Fixes: 242b81170fb8 ("leds: lp50xx: Add the LP50XX family of the RGB LED driver")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/leds/leds-lp50xx.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/leds-lp50xx.c b/drivers/leds/leds-lp50xx.c
index 47144a37cb94..8178782f2a8a 100644
--- a/drivers/leds/leds-lp50xx.c
+++ b/drivers/leds/leds-lp50xx.c
@@ -487,8 +487,10 @@ static int lp50xx_probe_dt(struct lp50xx *priv)
 		 */
 		mc_led_info = devm_kcalloc(priv->dev, LP50XX_LEDS_PER_MODULE,
 					   sizeof(*mc_led_info), GFP_KERNEL);
-		if (!mc_led_info)
-			return -ENOMEM;
+		if (!mc_led_info) {
+			ret = -ENOMEM;
+			goto child_out;
+		}
 
 		fwnode_for_each_child_node(child, led_node) {
 			ret = fwnode_property_read_u32(led_node, "color",
-- 
2.25.1

