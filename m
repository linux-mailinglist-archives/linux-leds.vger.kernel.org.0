Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1AE2226E8E1
	for <lists+linux-leds@lfdr.de>; Fri, 18 Sep 2020 00:36:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726326AbgIQWgV (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 17 Sep 2020 18:36:21 -0400
Received: from lists.nic.cz ([217.31.204.67]:35608 "EHLO mail.nic.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726168AbgIQWeE (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Thu, 17 Sep 2020 18:34:04 -0400
Received: from dellmb.labs.office.nic.cz (unknown [IPv6:2001:1488:fffe:6:cac7:3539:7f1f:463])
        by mail.nic.cz (Postfix) with ESMTP id 8A7DE140AA3;
        Fri, 18 Sep 2020 00:33:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
        t=1600382035; bh=AREUEGn1RuUtTfOukJ/Urgj0JfOX/IrUKRwB+urWhqs=;
        h=From:To:Date;
        b=lQ8Q1J3nSjE0S7+Y2/5BamLdRgKNxGMY4nUYOXlUWamsV578/PinjXpkT6YmsCegD
         trIKUFaPc3FqXvD4Zblbs21W0ZIM7/fu/QcQ/hKvsbkej7lMPE1SJP4zVxBIDd3/2O
         rq0slxvPlWJezZgFlCite+u7bksQVBX8s7yMTMCc=
From:   =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>
To:     linux-leds@vger.kernel.org
Cc:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        =?UTF-8?q?Ond=C5=99ej=20Jirman?= <megous@megous.com>,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org,
        =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>,
        =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>, Kevin Cernekee <cernekee@gmail.com>,
        Jaedon Shin <jaedon.shin@gmail.com>
Subject: [PATCH leds v2 13/50] leds: bcm6358: cosmetic: use reverse christmas tree
Date:   Fri, 18 Sep 2020 00:33:01 +0200
Message-Id: <20200917223338.14164-14-marek.behun@nic.cz>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200917223338.14164-1-marek.behun@nic.cz>
References: <20200917223338.14164-1-marek.behun@nic.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.nic.cz
X-Spam-Status: No, score=0.00
X-Spamd-Bar: /
X-Virus-Scanned: clamav-milter 0.102.2 at mail
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Only a cosmetic change: use reverse christmas tree variables
declaration.

Signed-off-by: Marek Behún <marek.behun@nic.cz>
Cc: Álvaro Fernández Rojas <noltari@gmail.com>
Cc: Kevin Cernekee <cernekee@gmail.com>
Cc: Jaedon Shin <jaedon.shin@gmail.com>
---
 drivers/leds/leds-bcm6358.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/leds/leds-bcm6358.c b/drivers/leds/leds-bcm6358.c
index 49f703c59ecdc..71c49d5fa811f 100644
--- a/drivers/leds/leds-bcm6358.c
+++ b/drivers/leds/leds-bcm6358.c
@@ -150,11 +150,10 @@ static int bcm6358_led(struct device *dev, struct device_node *nc, u32 reg,
 static int bcm6358_leds_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct device_node *np = dev_of_node(&pdev->dev);
-	struct device_node *child;
+	struct device_node *np, *child;
 	void __iomem *mem;
-	spinlock_t *lock; /* memory lock */
 	unsigned long val;
+	spinlock_t *lock; /* memory lock */
 	u32 clk_div;
 
 	mem = devm_platform_ioremap_resource(pdev, 0);
@@ -167,6 +166,8 @@ static int bcm6358_leds_probe(struct platform_device *pdev)
 
 	spin_lock_init(lock);
 
+	np = dev_of_node(dev);
+
 	val = bcm6358_led_busy(mem);
 	val &= ~(BCM6358_SLED_POLARITY | BCM6358_SLED_CLKDIV_MASK);
 	if (of_property_read_bool(np, "brcm,clk-dat-low"))
@@ -189,8 +190,8 @@ static int bcm6358_leds_probe(struct platform_device *pdev)
 	bcm6358_led_write(mem + BCM6358_REG_CTRL, val);
 
 	for_each_available_child_of_node(np, child) {
-		int rc;
 		u32 reg;
+		int rc;
 
 		if (of_property_read_u32(child, "reg", &reg))
 			continue;
-- 
2.26.2

