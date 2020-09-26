Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A62562795AA
	for <lists+linux-leds@lfdr.de>; Sat, 26 Sep 2020 02:51:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729426AbgIZAvT (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 25 Sep 2020 20:51:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729424AbgIZAvT (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 25 Sep 2020 20:51:19 -0400
Received: from agrajag.zerfleddert.de (agrajag.zerfleddert.de [IPv6:2a01:4f8:bc:1de::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 695C6C0613CE;
        Fri, 25 Sep 2020 17:51:19 -0700 (PDT)
Received: by agrajag.zerfleddert.de (Postfix, from userid 1000)
        id CB7965B20807; Sat, 26 Sep 2020 02:51:17 +0200 (CEST)
Date:   Sat, 26 Sep 2020 02:51:17 +0200
From:   Tobias Jordan <kernel@cdqe.de>
To:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Jean-Jacques Hiblot <jjhiblot@ti.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Marek Behun <marek.behun@nic.cz>
Subject: [PATCH v2] leds: tlc591xx: fix leak of device node iterator
Message-ID: <20200926005117.GA32209@agrajag.zerfleddert.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

In one of the error paths of the for_each_child_of_node loop in
tlc591xx_probe, add missing call to of_node_put.

Fixes: 1ab4531ad132 ("leds: tlc591xx: simplify driver by using the
managed led API")

Signed-off-by: Tobias Jordan <kernel@cdqe.de>
---
v2: rebased to Pavel's for-next branch

 drivers/leds/leds-tlc591xx.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/leds/leds-tlc591xx.c b/drivers/leds/leds-tlc591xx.c
index f24271337bd8..5b9dfdf743ec 100644
--- a/drivers/leds/leds-tlc591xx.c
+++ b/drivers/leds/leds-tlc591xx.c
@@ -205,10 +205,12 @@ tlc591xx_probe(struct i2c_client *client,
 		led->ldev.max_brightness = TLC591XX_MAX_BRIGHTNESS;
 		err = devm_led_classdev_register_ext(dev, &led->ldev,
 						     &init_data);
-		if (err < 0)
+		if (err < 0) {
+			of_node_put(child);
 			return dev_err_probe(dev, err,
 					     "couldn't register LED %s\n",
 					     led->ldev.name);
+		}
 	}
 	return 0;
 }
-- 
2.20.1

