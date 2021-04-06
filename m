Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D159355492
	for <lists+linux-leds@lfdr.de>; Tue,  6 Apr 2021 15:08:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233015AbhDFNIg (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 6 Apr 2021 09:08:36 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:15924 "EHLO
        szxga06-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232492AbhDFNIf (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 6 Apr 2021 09:08:35 -0400
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.58])
        by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4FF78C61kMzkhsC;
        Tue,  6 Apr 2021 21:06:35 +0800 (CST)
Received: from huawei.com (10.175.103.91) by DGGEMS409-HUB.china.huawei.com
 (10.3.19.209) with Microsoft SMTP Server id 14.3.498.0; Tue, 6 Apr 2021
 21:08:17 +0800
From:   Yang Yingliang <yangyingliang@huawei.com>
To:     <linux-kernel@vger.kernel.org>, <linux-leds@vger.kernel.org>
CC:     <pavel@ucw.cz>
Subject: [PATCH -next] leds: tlc591xx: fix return value check in tlc591xx_probe()
Date:   Tue, 6 Apr 2021 21:11:59 +0800
Message-ID: <20210406131159.2136509-1-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.103.91]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

After device_get_match_data(), tlc591xx is not checked, add
check for it and also check np after dev_of_node.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 drivers/leds/leds-tlc591xx.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/leds-tlc591xx.c b/drivers/leds/leds-tlc591xx.c
index 5b9dfdf743ec..cb7bd1353f9f 100644
--- a/drivers/leds/leds-tlc591xx.c
+++ b/drivers/leds/leds-tlc591xx.c
@@ -148,16 +148,20 @@ static int
 tlc591xx_probe(struct i2c_client *client,
 	       const struct i2c_device_id *id)
 {
-	struct device_node *np = dev_of_node(&client->dev), *child;
+	struct device_node *np, *child;
 	struct device *dev = &client->dev;
 	const struct tlc591xx *tlc591xx;
 	struct tlc591xx_priv *priv;
 	int err, count, reg;
 
-	tlc591xx = device_get_match_data(dev);
+	np = dev_of_node(dev);
 	if (!np)
 		return -ENODEV;
 
+	tlc591xx = device_get_match_data(dev);
+	if (!tlc591xx)
+		return -ENODEV;
+
 	count = of_get_available_child_count(np);
 	if (!count || count > tlc591xx->max_leds)
 		return -EINVAL;
-- 
2.25.1

