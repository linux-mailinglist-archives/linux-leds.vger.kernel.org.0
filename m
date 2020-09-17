Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD60826E8FA
	for <lists+linux-leds@lfdr.de>; Fri, 18 Sep 2020 00:37:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726471AbgIQWgx (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 17 Sep 2020 18:36:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726022AbgIQWeA (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 17 Sep 2020 18:34:00 -0400
Received: from mail.nic.cz (mail.nic.cz [IPv6:2001:1488:800:400::400])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 504AAC06178A;
        Thu, 17 Sep 2020 15:33:57 -0700 (PDT)
Received: from dellmb.labs.office.nic.cz (unknown [IPv6:2001:1488:fffe:6:cac7:3539:7f1f:463])
        by mail.nic.cz (Postfix) with ESMTP id 5B61C140A9E;
        Fri, 18 Sep 2020 00:33:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
        t=1600382035; bh=D0iTJlV5xHof5NzeaqX6wLD0t/Lb+Guor4EBE5NWa3o=;
        h=From:To:Date;
        b=jYpu6+dE39GSbHwLxbH8DTSztaLu1PshH4N1Q6WVg6OmiqUsLXxhyUQVSHZgn20+k
         wtk66lzx7u2WKw2QGaA9uCSezz8EL/uQU24zl69x5pfjQTesBCMKMq0NVYw2EcbN0t
         kY9zQrX3EXyYUoyg8VwYXAc7MWjwVmZxY1ChHKQc=
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
Subject: [PATCH leds v2 12/50] leds: bcm6328: cosmetic: use reverse christmas tree
Date:   Fri, 18 Sep 2020 00:33:00 +0200
Message-Id: <20200917223338.14164-13-marek.behun@nic.cz>
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
 drivers/leds/leds-bcm6328.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/leds/leds-bcm6328.c b/drivers/leds/leds-bcm6328.c
index c72b0842e8151..38bf820372528 100644
--- a/drivers/leds/leds-bcm6328.c
+++ b/drivers/leds/leds-bcm6328.c
@@ -109,8 +109,8 @@ static unsigned long bcm6328_pin2shift(unsigned long pin)
 
 static void bcm6328_led_mode(struct bcm6328_led *led, unsigned long value)
 {
-	void __iomem *mode;
 	unsigned long val, shift;
+	void __iomem *mode;
 
 	shift = bcm6328_pin2shift(led->pin);
 	if (shift / 16)
@@ -255,8 +255,8 @@ static int bcm6328_blink_set(struct led_classdev *led_cdev,
 static int bcm6328_hwled(struct device *dev, struct device_node *nc, u32 reg,
 			 void __iomem *mem, spinlock_t *lock)
 {
-	int i, cnt;
 	unsigned long flags, val;
+	int i, cnt;
 
 	spin_lock_irqsave(lock, flags);
 	val = bcm6328_led_read(mem + BCM6328_REG_HWDIS);
@@ -271,8 +271,8 @@ static int bcm6328_hwled(struct device *dev, struct device_node *nc, u32 reg,
 	cnt = of_property_count_elems_of_size(nc, "brcm,link-signal-sources",
 					      sizeof(u32));
 	for (i = 0; i < cnt; i++) {
-		u32 sel;
 		void __iomem *addr;
+		u32 sel;
 
 		if (reg < 4)
 			addr = mem + BCM6328_REG_LNKACTSEL_LO;
@@ -298,8 +298,8 @@ static int bcm6328_hwled(struct device *dev, struct device_node *nc, u32 reg,
 					      "brcm,activity-signal-sources",
 					      sizeof(u32));
 	for (i = 0; i < cnt; i++) {
-		u32 sel;
 		void __iomem *addr;
+		u32 sel;
 
 		if (reg < 4)
 			addr = mem + BCM6328_REG_LNKACTSEL_LO;
@@ -395,12 +395,11 @@ static int bcm6328_led(struct device *dev, struct device_node *nc, u32 reg,
 
 static int bcm6328_leds_probe(struct platform_device *pdev)
 {
+	unsigned long val, *blink_leds, *blink_delay;
 	struct device *dev = &pdev->dev;
-	struct device_node *np = dev_of_node(&pdev->dev);
-	struct device_node *child;
+	struct device_node *np, *child;
 	void __iomem *mem;
 	spinlock_t *lock; /* memory lock */
-	unsigned long val, *blink_leds, *blink_delay;
 
 	mem = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(mem))
@@ -426,6 +425,8 @@ static int bcm6328_leds_probe(struct platform_device *pdev)
 	bcm6328_led_write(mem + BCM6328_REG_LNKACTSEL_HI, 0);
 	bcm6328_led_write(mem + BCM6328_REG_LNKACTSEL_LO, 0);
 
+	np = dev_of_node(dev);
+
 	val = bcm6328_led_read(mem + BCM6328_REG_INIT);
 	val &= ~(BCM6328_INIT_MASK);
 	if (of_property_read_bool(np, "brcm,serial-leds"))
@@ -441,8 +442,8 @@ static int bcm6328_leds_probe(struct platform_device *pdev)
 	bcm6328_led_write(mem + BCM6328_REG_INIT, val);
 
 	for_each_available_child_of_node(np, child) {
-		int rc;
 		u32 reg;
+		int rc;
 
 		if (of_property_read_u32(child, "reg", &reg))
 			continue;
-- 
2.26.2

