Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2411C279481
	for <lists+linux-leds@lfdr.de>; Sat, 26 Sep 2020 01:06:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729261AbgIYXGH (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 25 Sep 2020 19:06:07 -0400
Received: from agrajag.zerfleddert.de ([88.198.237.222]:38412 "EHLO
        agrajag.zerfleddert.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725272AbgIYXGH (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 25 Sep 2020 19:06:07 -0400
X-Greylist: delayed 419 seconds by postgrey-1.27 at vger.kernel.org; Fri, 25 Sep 2020 19:06:06 EDT
Received: by agrajag.zerfleddert.de (Postfix, from userid 1000)
        id 2C44A5B2057C; Sat, 26 Sep 2020 00:59:05 +0200 (CEST)
Date:   Sat, 26 Sep 2020 00:59:05 +0200
From:   Tobias Jordan <kernel@cdqe.de>
To:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: [PATCH] leds: lp55xx: fix device node iterator memory leaks
Message-ID: <20200925225905.GA11731@agrajag.zerfleddert.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Fix error paths in for_each_child_of_node loops that were missing an
of_node_put call.

Fixes: 92a81562e695 ("leds: lp55xx: Add multicolor framework support to
lp55xx")
Signed-off-by: Tobias Jordan <kernel@cdqe.de>
---
 drivers/leds/leds-lp55xx-common.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/leds-lp55xx-common.c b/drivers/leds/leds-lp55xx-common.c
index 56210f4ad919..f8b55cfd21ef 100644
--- a/drivers/leds/leds-lp55xx-common.c
+++ b/drivers/leds/leds-lp55xx-common.c
@@ -614,8 +614,10 @@ static int lp55xx_parse_multi_led(struct device_node *np,
 	for_each_child_of_node(np, child) {
 		ret = lp55xx_parse_multi_led_child(child, cfg, child_number,
 						   num_colors);
-		if (ret)
+		if (ret) {
+			of_node_put(child);
 			return ret;
+		}
 		num_colors++;
 	}
 
@@ -681,8 +683,10 @@ struct lp55xx_platform_data *lp55xx_of_populate_pdata(struct device *dev,
 
 	for_each_child_of_node(np, child) {
 		ret = lp55xx_parse_logical_led(child, cfg, i);
-		if (ret)
+		if (ret) {
+			of_node_put(child);
 			return ERR_PTR(-EINVAL);
+		}
 		i++;
 	}
 
-- 
2.20.1

