Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42A9D2B8BEC
	for <lists+linux-leds@lfdr.de>; Thu, 19 Nov 2020 08:09:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726182AbgKSHEK (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 19 Nov 2020 02:04:10 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:7700 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725857AbgKSHEK (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 19 Nov 2020 02:04:10 -0500
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.59])
        by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Cc9dG4qrdzkbZb;
        Thu, 19 Nov 2020 15:03:46 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS409-HUB.china.huawei.com (10.3.19.209) with Microsoft SMTP Server id
 14.3.487.0; Thu, 19 Nov 2020 15:03:58 +0800
From:   Qinglang Miao <miaoqinglang@huawei.com>
To:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        "Qinglang Miao" <miaoqinglang@huawei.com>
Subject: [PATCH v2] leds: lp50xx: add missing fwnode_handle_put in error handling case
Date:   Thu, 19 Nov 2020 15:08:41 +0800
Message-ID: <20201119070841.712-1-miaoqinglang@huawei.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Fix to set ret and goto child_out for fwnode_handle_put(child)
in the error handling case rather than simply return, as done
elsewhere in this function.

Fixes: 242b81170fb8 ("leds: lp50xx: Add the LP50XX family of the RGB LED driver")
Reported-by: Hulk Robot <hulkci@huawei.com>
Suggested-by: Pavel Machek <pavel@ucw.cz>
Signed-off-by: Qinglang Miao <miaoqinglang@huawei.com>
---
 v2: forget to set ret on v1

 drivers/leds/leds-lp50xx.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/leds-lp50xx.c b/drivers/leds/leds-lp50xx.c
index 5fb4f24ae..f13117eed 100644
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
2.23.0

