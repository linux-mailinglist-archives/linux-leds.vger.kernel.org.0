Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8109D2A4DA
	for <lists+linux-leds@lfdr.de>; Sat, 25 May 2019 16:20:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726968AbfEYOUV (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 25 May 2019 10:20:21 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:37152 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726126AbfEYOUV (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Sat, 25 May 2019 10:20:21 -0400
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id C18379AFA202D24360F6;
        Sat, 25 May 2019 22:20:15 +0800 (CST)
Received: from localhost (10.177.31.96) by DGGEMS412-HUB.china.huawei.com
 (10.3.19.212) with Microsoft SMTP Server id 14.3.439.0; Sat, 25 May 2019
 22:20:10 +0800
From:   YueHaibing <yuehaibing@huawei.com>
To:     <bgolaszewski@baylibre.com>, <jacek.anaszewski@gmail.com>,
        <pavel@ucw.cz>, <dmurphy@ti.com>
CC:     <linux-kernel@vger.kernel.org>, <linux-leds@vger.kernel.org>,
        YueHaibing <yuehaibing@huawei.com>
Subject: [PATCH -next] leds: max77650: Remove set but not used variable 'parent'
Date:   Sat, 25 May 2019 22:19:41 +0800
Message-ID: <20190525141941.16088-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.31.96]
X-CFilter-Loop: Reflected
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/leds/leds-max77650.c: In function max77650_led_probe:
drivers/leds/leds-max77650.c:67:17: warning: variable parent set but not used [-Wunused-but-set-variable]

It is never used and can be removed.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/leds/leds-max77650.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/leds/leds-max77650.c b/drivers/leds/leds-max77650.c
index 6b74ce9cac12..8a8e5c65b157 100644
--- a/drivers/leds/leds-max77650.c
+++ b/drivers/leds/leds-max77650.c
@@ -64,7 +64,6 @@ static int max77650_led_probe(struct platform_device *pdev)
 {
 	struct device_node *of_node, *child;
 	struct max77650_led *leds, *led;
-	struct device *parent;
 	struct device *dev;
 	struct regmap *map;
 	const char *label;
@@ -72,7 +71,6 @@ static int max77650_led_probe(struct platform_device *pdev)
 	u32 reg;
 
 	dev = &pdev->dev;
-	parent = dev->parent;
 	of_node = dev->of_node;
 
 	if (!of_node)
-- 
2.17.1


