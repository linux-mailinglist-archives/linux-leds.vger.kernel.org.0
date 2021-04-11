Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D337835B236
	for <lists+linux-leds@lfdr.de>; Sun, 11 Apr 2021 09:45:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229792AbhDKHpu (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 11 Apr 2021 03:45:50 -0400
Received: from smtp03.smtpout.orange.fr ([80.12.242.125]:23554 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235079AbhDKHpt (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 11 Apr 2021 03:45:49 -0400
Received: from localhost.localdomain ([90.126.11.170])
        by mwinf5d26 with ME
        id rKlX240043g7mfN03KlXi1; Sun, 11 Apr 2021 09:45:32 +0200
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 11 Apr 2021 09:45:32 +0200
X-ME-IP: 90.126.11.170
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     pavel@ucw.cz, mallikarjunax.reddy@linux.intel.com
Cc:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH 1/2] leds: lgm: Propagate error codes to the caller
Date:   Sun, 11 Apr 2021 09:45:30 +0200
Message-Id: <22e1f8245251f0ec297881942abfa2b00eff48d2.1618126878.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Do not always return -EINVAL in case of error in '__sso_led_dt_parse()'.
Propagate the error code instead.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/leds/blink/leds-lgm-sso.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/blink/leds-lgm-sso.c b/drivers/leds/blink/leds-lgm-sso.c
index 7d5c9ca007d6..3da242d4ce7d 100644
--- a/drivers/leds/blink/leds-lgm-sso.c
+++ b/drivers/leds/blink/leds-lgm-sso.c
@@ -643,6 +643,7 @@ __sso_led_dt_parse(struct sso_led_priv *priv, struct fwnode_handle *fw_ssoled)
 							      GPIOD_ASIS, NULL);
 		if (IS_ERR(led->gpiod)) {
 			dev_err(dev, "led: get gpio fail!\n");
+			ret = PTR_ERR(led->gpiod);
 			goto __dt_err;
 		}
 
@@ -664,6 +665,7 @@ __sso_led_dt_parse(struct sso_led_priv *priv, struct fwnode_handle *fw_ssoled)
 		ret = fwnode_property_read_u32(fwnode_child, "reg", &prop);
 		if (ret != 0 || prop >= SSO_LED_MAX_NUM) {
 			dev_err(dev, "invalid LED pin:%u\n", prop);
+			ret = ret ? ret : -EINVAL;
 			goto __dt_err;
 		}
 		desc->pin = prop;
@@ -699,8 +701,10 @@ __sso_led_dt_parse(struct sso_led_priv *priv, struct fwnode_handle *fw_ssoled)
 				desc->brightness = LED_FULL;
 		}
 
-		if (sso_create_led(priv, led, fwnode_child))
+		if (sso_create_led(priv, led, fwnode_child)) {
+			ret = -EINVAL;
 			goto __dt_err;
+		}
 	}
 	fwnode_handle_put(fw_ssoled);
 
@@ -713,7 +717,7 @@ __sso_led_dt_parse(struct sso_led_priv *priv, struct fwnode_handle *fw_ssoled)
 		sso_led_shutdown(led);
 	}
 
-	return -EINVAL;
+	return ret;
 }
 
 static int sso_led_dt_parse(struct sso_led_priv *priv)
-- 
2.27.0

