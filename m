Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B00929E719
	for <lists+linux-leds@lfdr.de>; Thu, 29 Oct 2020 10:19:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726018AbgJ2JT2 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 29 Oct 2020 05:19:28 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:6925 "EHLO
        szxga07-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725372AbgJ2JT2 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 29 Oct 2020 05:19:28 -0400
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.58])
        by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4CMKdP31qKz6yyG;
        Thu, 29 Oct 2020 17:19:21 +0800 (CST)
Received: from huawei.com (10.175.127.227) by DGGEMS414-HUB.china.huawei.com
 (10.3.19.214) with Microsoft SMTP Server id 14.3.487.0; Thu, 29 Oct 2020
 17:19:11 +0800
From:   Yu Kuai <yukuai3@huawei.com>
To:     <pavel@ucw.cz>, <linus.walleij@linaro.org>,
        <j.anaszewski@samsung.com>, <simon.guinot@sequanux.org>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <yukuai3@huawei.com>, <yi.zhang@huawei.com>
Subject: [PATCH] leds: various: add missing put_device() call in netxbig_leds_get_of_pdata()
Date:   Thu, 29 Oct 2020 17:23:05 +0800
Message-ID: <20201029092305.900767-1-yukuai3@huawei.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.127.227]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

if of_find_device_by_node() succeed, netxbig_leds_get_of_pdata() doesn't
have a corresponding put_device(). Thus add jump target to fix the
exception handling for this function implementation.

Fixes: 2976b1798909 ("leds: netxbig: add device tree binding")
Signed-off-by: Yu Kuai <yukuai3@huawei.com>
---
 drivers/leds/leds-netxbig.c | 35 ++++++++++++++++++++++++-----------
 1 file changed, 24 insertions(+), 11 deletions(-)

diff --git a/drivers/leds/leds-netxbig.c b/drivers/leds/leds-netxbig.c
index e6fd47365b58..68fbf0b66fad 100644
--- a/drivers/leds/leds-netxbig.c
+++ b/drivers/leds/leds-netxbig.c
@@ -448,31 +448,39 @@ static int netxbig_leds_get_of_pdata(struct device *dev,
 	gpio_ext = devm_kzalloc(dev, sizeof(*gpio_ext), GFP_KERNEL);
 	if (!gpio_ext) {
 		of_node_put(gpio_ext_np);
-		return -ENOMEM;
+		ret = -ENOMEM;
+		goto put_device;
 	}
 	ret = netxbig_gpio_ext_get(dev, gpio_ext_dev, gpio_ext);
 	of_node_put(gpio_ext_np);
 	if (ret)
-		return ret;
+		goto put_device;
 	pdata->gpio_ext = gpio_ext;
 
 	/* Timers (optional) */
 	ret = of_property_count_u32_elems(np, "timers");
 	if (ret > 0) {
-		if (ret % 3)
-			return -EINVAL;
+		if (ret % 3) {
+			ret = -EINVAL;
+			goto put_device;
+		}
+
 		num_timers = ret / 3;
 		timers = devm_kcalloc(dev, num_timers, sizeof(*timers),
 				      GFP_KERNEL);
-		if (!timers)
-			return -ENOMEM;
+		if (!timers) {
+			ret = -ENOMEM;
+			goto put_device;
+		}
 		for (i = 0; i < num_timers; i++) {
 			u32 tmp;
 
 			of_property_read_u32_index(np, "timers", 3 * i,
 						   &timers[i].mode);
-			if (timers[i].mode >= NETXBIG_LED_MODE_NUM)
-				return -EINVAL;
+			if (timers[i].mode >= NETXBIG_LED_MODE_NUM) {
+				ret = -EINVAL;
+				goto put_device;
+			}
 			of_property_read_u32_index(np, "timers",
 						   3 * i + 1, &tmp);
 			timers[i].delay_on = tmp;
@@ -488,12 +496,15 @@ static int netxbig_leds_get_of_pdata(struct device *dev,
 	num_leds = of_get_available_child_count(np);
 	if (!num_leds) {
 		dev_err(dev, "No LED subnodes found in DT\n");
-		return -ENODEV;
+		ret = -ENODEV;
+		goto put_device;
 	}
 
 	leds = devm_kcalloc(dev, num_leds, sizeof(*leds), GFP_KERNEL);
-	if (!leds)
-		return -ENOMEM;
+	if (!leds) {
+		ret = -ENOMEM;
+		goto put_device;
+	}
 
 	led = leds;
 	for_each_available_child_of_node(np, child) {
@@ -574,6 +585,8 @@ static int netxbig_leds_get_of_pdata(struct device *dev,
 
 err_node_put:
 	of_node_put(child);
+put_device:
+	put_device(gpio_ext_dev);
 	return ret;
 }
 
-- 
2.25.4

