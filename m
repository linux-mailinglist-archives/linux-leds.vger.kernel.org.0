Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6E5526CF7D
	for <lists+linux-leds@lfdr.de>; Thu, 17 Sep 2020 01:17:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727525AbgIPXRp (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 16 Sep 2020 19:17:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726869AbgIPXQ4 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 16 Sep 2020 19:16:56 -0400
Received: from mail.nic.cz (lists.nic.cz [IPv6:2001:1488:800:400::400])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB967C06174A;
        Wed, 16 Sep 2020 16:16:55 -0700 (PDT)
Received: from dellmb.labs.office.nic.cz (unknown [IPv6:2001:1488:fffe:6:cac7:3539:7f1f:463])
        by mail.nic.cz (Postfix) with ESMTP id 5D487140971;
        Thu, 17 Sep 2020 01:16:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
        t=1600298212; bh=BHjYnLEwWCkyeXHq4xpUx10FJ5OgjPr0x73Yx4NQ6oI=;
        h=From:To:Date;
        b=oZTCZ0t5Z7zYl0RRlUdwf7UrJT4tAIWVQjmfHWnMn3NPsB3W3CHDgB7+48BdPon9d
         OR1uis0feQfDEtASxLT/AZuvm1n7Fo/M1k8QJkUb0us7KtFmsgxihQccKHB1Mvrv2S
         cCdjtWWF3IMpBKyZtWtk2apwZ1O/Qx0m8sEnFNGQ=
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
Subject: [PATCH leds v1 02/10] leds: bcm6328, bcm6358: use struct led_init_data when registering
Date:   Thu, 17 Sep 2020 01:16:42 +0200
Message-Id: <20200916231650.11484-3-marek.behun@nic.cz>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200916231650.11484-1-marek.behun@nic.cz>
References: <20200916231650.11484-1-marek.behun@nic.cz>
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

By using struct led_init_data when registering we do not need to parse
`label` DT property nor `linux,default-trigger` property.

Signed-off-by: Marek Behún <marek.behun@nic.cz>
Cc: Álvaro Fernández Rojas <noltari@gmail.com>
Cc: Kevin Cernekee <cernekee@gmail.com>
Cc: Jaedon Shin <jaedon.shin@gmail.com>
---
 drivers/leds/leds-bcm6328.c | 10 ++++------
 drivers/leds/leds-bcm6358.c | 10 ++++------
 2 files changed, 8 insertions(+), 12 deletions(-)

diff --git a/drivers/leds/leds-bcm6328.c b/drivers/leds/leds-bcm6328.c
index bad7efb751120..1aa47f3086060 100644
--- a/drivers/leds/leds-bcm6328.c
+++ b/drivers/leds/leds-bcm6328.c
@@ -328,6 +328,9 @@ static int bcm6328_led(struct device *dev, struct device_node *nc, u32 reg,
 		       void __iomem *mem, spinlock_t *lock,
 		       unsigned long *blink_leds, unsigned long *blink_delay)
 {
+	struct led_init_data init_data = {
+		.fwnode = of_fwnode_handle(nc),
+	};
 	struct bcm6328_led *led;
 	const char *state;
 	int rc;
@@ -345,11 +348,6 @@ static int bcm6328_led(struct device *dev, struct device_node *nc, u32 reg,
 	if (of_property_read_bool(nc, "active-low"))
 		led->active_low = true;
 
-	led->cdev.name = of_get_property(nc, "label", NULL) ? : nc->name;
-	led->cdev.default_trigger = of_get_property(nc,
-						    "linux,default-trigger",
-						    NULL);
-
 	if (!of_property_read_string(nc, "default-state", &state)) {
 		if (!strcmp(state, "on")) {
 			led->cdev.brightness = LED_FULL;
@@ -383,7 +381,7 @@ static int bcm6328_led(struct device *dev, struct device_node *nc, u32 reg,
 	led->cdev.brightness_set = bcm6328_led_set;
 	led->cdev.blink_set = bcm6328_blink_set;
 
-	rc = led_classdev_register(dev, &led->cdev);
+	rc = led_classdev_register_ext(dev, &led->cdev, &init_data);
 	if (rc < 0)
 		return rc;
 
diff --git a/drivers/leds/leds-bcm6358.c b/drivers/leds/leds-bcm6358.c
index 94fefd456ba07..2be38211f5383 100644
--- a/drivers/leds/leds-bcm6358.c
+++ b/drivers/leds/leds-bcm6358.c
@@ -94,6 +94,9 @@ static void bcm6358_led_set(struct led_classdev *led_cdev,
 static int bcm6358_led(struct device *dev, struct device_node *nc, u32 reg,
 		       void __iomem *mem, spinlock_t *lock)
 {
+	struct led_init_data init_data = {
+		.fwnode = of_fwnode_handle(nc),
+	};
 	struct bcm6358_led *led;
 	const char *state;
 	int rc;
@@ -109,11 +112,6 @@ static int bcm6358_led(struct device *dev, struct device_node *nc, u32 reg,
 	if (of_property_read_bool(nc, "active-low"))
 		led->active_low = true;
 
-	led->cdev.name = of_get_property(nc, "label", NULL) ? : nc->name;
-	led->cdev.default_trigger = of_get_property(nc,
-						    "linux,default-trigger",
-						    NULL);
-
 	if (!of_property_read_string(nc, "default-state", &state)) {
 		if (!strcmp(state, "on")) {
 			led->cdev.brightness = LED_FULL;
@@ -137,7 +135,7 @@ static int bcm6358_led(struct device *dev, struct device_node *nc, u32 reg,
 
 	led->cdev.brightness_set = bcm6358_led_set;
 
-	rc = led_classdev_register(dev, &led->cdev);
+	rc = led_classdev_register_ext(dev, &led->cdev, &init_data);
 	if (rc < 0)
 		return rc;
 
-- 
2.26.2

