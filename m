Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7ECA026E8E6
	for <lists+linux-leds@lfdr.de>; Fri, 18 Sep 2020 00:36:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726002AbgIQWgc (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 17 Sep 2020 18:36:32 -0400
Received: from lists.nic.cz ([217.31.204.67]:35560 "EHLO mail.nic.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726148AbgIQWeB (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Thu, 17 Sep 2020 18:34:01 -0400
Received: from dellmb.labs.office.nic.cz (unknown [IPv6:2001:1488:fffe:6:cac7:3539:7f1f:463])
        by mail.nic.cz (Postfix) with ESMTP id 09959140A98;
        Fri, 18 Sep 2020 00:33:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
        t=1600382035; bh=7qde80XtutzOvUvTVeYWoRsA/xkLB2RT3E7wnLFkILw=;
        h=From:To:Date;
        b=T+/lW1EVLKq0DFU1fzPi7x3lBMM8wFOUC5M5e6126NQ2P+sCFZp+2wrMc6v498jNf
         Yn2UuJnoLkcHQk9k5CxMHP2jnzUsE2zKxCAuXmhtOqmRWB+X9gIYWI52w0uF5eMfXa
         JSeHrTaEbdlHA4HTPnt7SK/In6no8d6rh/9MMXV0=
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
Subject: [PATCH leds v2 10/50] leds: bcm6328, bcm6358: use devres LED registering function
Date:   Fri, 18 Sep 2020 00:32:58 +0200
Message-Id: <20200917223338.14164-11-marek.behun@nic.cz>
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

These two drivers do not provide remove method and use devres for
allocation of other resources, yet they use led_classdev_register
instead of the devres variant, devm_led_classdev_register.

Fix this.

Signed-off-by: Marek Behún <marek.behun@nic.cz>
Cc: Álvaro Fernández Rojas <noltari@gmail.com>
Cc: Kevin Cernekee <cernekee@gmail.com>
Cc: Jaedon Shin <jaedon.shin@gmail.com>
---
 drivers/leds/leds-bcm6328.c | 2 +-
 drivers/leds/leds-bcm6358.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/leds-bcm6328.c b/drivers/leds/leds-bcm6328.c
index c73097758e353..b3cf84a3eb150 100644
--- a/drivers/leds/leds-bcm6328.c
+++ b/drivers/leds/leds-bcm6328.c
@@ -383,7 +383,7 @@ static int bcm6328_led(struct device *dev, struct device_node *nc, u32 reg,
 	led->cdev.brightness_set = bcm6328_led_set;
 	led->cdev.blink_set = bcm6328_blink_set;
 
-	rc = led_classdev_register(dev, &led->cdev);
+	rc = devm_led_classdev_register(dev, &led->cdev);
 	if (rc < 0)
 		return rc;
 
diff --git a/drivers/leds/leds-bcm6358.c b/drivers/leds/leds-bcm6358.c
index 289dfc412eda4..99dbf62aa6222 100644
--- a/drivers/leds/leds-bcm6358.c
+++ b/drivers/leds/leds-bcm6358.c
@@ -137,7 +137,7 @@ static int bcm6358_led(struct device *dev, struct device_node *nc, u32 reg,
 
 	led->cdev.brightness_set = bcm6358_led_set;
 
-	rc = led_classdev_register(dev, &led->cdev);
+	rc = devm_led_classdev_register(dev, &led->cdev);
 	if (rc < 0)
 		return rc;
 
-- 
2.26.2

