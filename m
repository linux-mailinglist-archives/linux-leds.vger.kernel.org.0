Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5C36279487
	for <lists+linux-leds@lfdr.de>; Sat, 26 Sep 2020 01:10:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728780AbgIYXKO (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 25 Sep 2020 19:10:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728612AbgIYXKN (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 25 Sep 2020 19:10:13 -0400
X-Greylist: delayed 667 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 25 Sep 2020 16:10:13 PDT
Received: from agrajag.zerfleddert.de (agrajag.zerfleddert.de [IPv6:2a01:4f8:bc:1de::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98FB5C0613CE;
        Fri, 25 Sep 2020 16:10:13 -0700 (PDT)
Received: by agrajag.zerfleddert.de (Postfix, from userid 1000)
        id 0EEBC5B2096F; Sat, 26 Sep 2020 01:10:12 +0200 (CEST)
Date:   Sat, 26 Sep 2020 01:10:11 +0200
From:   Tobias Jordan <kernel@cdqe.de>
To:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Jean-Jacques Hiblot <jjhiblot@ti.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCH] leds: tlc591xx: fix leak of device node iterator
Message-ID: <20200925231011.GA2450@agrajag.zerfleddert.de>
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
 drivers/leds/leds-tlc591xx.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/leds/leds-tlc591xx.c b/drivers/leds/leds-tlc591xx.c
index 0929f1275814..a8cc49752cd5 100644
--- a/drivers/leds/leds-tlc591xx.c
+++ b/drivers/leds/leds-tlc591xx.c
@@ -214,6 +214,7 @@ tlc591xx_probe(struct i2c_client *client,
 		err = devm_led_classdev_register_ext(dev, &led->ldev,
 						     &init_data);
 		if (err < 0) {
+			of_node_put(child);
 			if (err != -EPROBE_DEFER)
 				dev_err(dev, "couldn't register LED %s\n",
 					led->ldev.name);
-- 
2.20.1

