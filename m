Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A1702C7C4E
	for <lists+linux-leds@lfdr.de>; Mon, 30 Nov 2020 02:20:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727055AbgK3BTx (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 29 Nov 2020 20:19:53 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:9069 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726520AbgK3BTx (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 29 Nov 2020 20:19:53 -0500
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.60])
        by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CknRz1yRZzLxCn;
        Mon, 30 Nov 2020 09:18:39 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 DGGEMS409-HUB.china.huawei.com (10.3.19.209) with Microsoft SMTP Server id
 14.3.487.0; Mon, 30 Nov 2020 09:19:09 +0800
From:   Tian Tao <tiantao6@hisilicon.com>
To:     <pavel@ucw.cz>, <dmurphy@ti.com>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] leds: lm3533: Switch to using the new API kobj_to_dev()
Date:   Mon, 30 Nov 2020 09:19:28 +0800
Message-ID: <1606699168-49894-1-git-send-email-tiantao6@hisilicon.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.69.192.56]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

fixed the following coccicheck:
drivers/leds/leds-lm3533.c:611:60-61: WARNING opportunity for kobj_to_dev().

Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
---
 drivers/leds/leds-lm3533.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/leds-lm3533.c b/drivers/leds/leds-lm3533.c
index b3edee7..9791166 100644
--- a/drivers/leds/leds-lm3533.c
+++ b/drivers/leds/leds-lm3533.c
@@ -608,7 +608,7 @@ static struct attribute *lm3533_led_attributes[] = {
 static umode_t lm3533_led_attr_is_visible(struct kobject *kobj,
 					     struct attribute *attr, int n)
 {
-	struct device *dev = container_of(kobj, struct device, kobj);
+	struct device *dev = kobj_to_dev(kobj);
 	struct led_classdev *led_cdev = dev_get_drvdata(dev);
 	struct lm3533_led *led = to_lm3533_led(led_cdev);
 	umode_t mode = attr->mode;
-- 
2.7.4

