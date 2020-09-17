Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 345C126E8BF
	for <lists+linux-leds@lfdr.de>; Fri, 18 Sep 2020 00:36:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726746AbgIQWfo (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 17 Sep 2020 18:35:44 -0400
Received: from lists.nic.cz ([217.31.204.67]:35872 "EHLO mail.nic.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726221AbgIQWeL (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Thu, 17 Sep 2020 18:34:11 -0400
Received: from dellmb.labs.office.nic.cz (unknown [IPv6:2001:1488:fffe:6:cac7:3539:7f1f:463])
        by mail.nic.cz (Postfix) with ESMTP id B76B514204D;
        Fri, 18 Sep 2020 00:33:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
        t=1600382038; bh=dpwUnrGSiVS9NDLxxq/du+zF4OLpRLtNHtt1AMGrQdI=;
        h=From:To:Date;
        b=G7EVmvmi9kmJYu6Jj6WoQP2l8Vyd5eEwAXFnmMllcqVxtYhaKZB2hr+k3uVCJ4fKa
         fGKvIPwu8FZW4P7mQlYS+Lcr15AaKksILdyMS9s/p35h8fHSq29j+mLU2N7nPneojT
         KQsPJqEwOr00VIfAAUkQnlbetWPpa8T9vURHeYhk=
From:   =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>
To:     linux-leds@vger.kernel.org
Cc:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        =?UTF-8?q?Ond=C5=99ej=20Jirman?= <megous@megous.com>,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org,
        =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>,
        "H . Nikolaus Schaller" <hns@goldelico.com>,
        Grant Feng <von81@163.com>
Subject: [PATCH leds v2 30/50] leds: is31fl319x: use struct led_init_data when registering
Date:   Fri, 18 Sep 2020 00:33:18 +0200
Message-Id: <20200917223338.14164-31-marek.behun@nic.cz>
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

By using struct led_init_data when registering we do not need to parse
`label` DT property. Moreover `label` is deprecated and if it is not
present but `color` and `function` are, LED core will compose a name
from these properties instead.

Signed-off-by: Marek Behún <marek.behun@nic.cz>
Cc: H. Nikolaus Schaller <hns@goldelico.com>
Cc: Grant Feng <von81@163.com>
---
 drivers/leds/leds-is31fl319x.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/leds/leds-is31fl319x.c b/drivers/leds/leds-is31fl319x.c
index 15bdbc6378d93..ef5b3e08c7313 100644
--- a/drivers/leds/leds-is31fl319x.c
+++ b/drivers/leds/leds-is31fl319x.c
@@ -269,6 +269,7 @@ static int is31fl319x_led_register(struct device *dev,
 				   struct is31fl319x_chip *is31,
 				   struct device_node *np)
 {
+	struct led_init_data init_data = {};
 	struct is31fl319x_led *led;
 	u32 reg;
 	int ret;
@@ -292,9 +293,6 @@ static int is31fl319x_led_register(struct device *dev,
 		return -EEXIST;
 	}
 
-	if (of_property_read_string(np, "label", &led->cdev.name))
-		led->cdev.name = np->name;
-
 	ret = of_property_read_string(np, "linux,default-trigger",
 				      &led->cdev.default_trigger);
 	if (ret < 0 && ret != -EINVAL) /* is optional */
@@ -303,8 +301,9 @@ static int is31fl319x_led_register(struct device *dev,
 	led->configured = true;
 	led->chip = is31;
 	led->cdev.brightness_set_blocking = is31fl319x_brightness_set;
+	init_data.fwnode = of_fwnode_handle(np);
 
-	ret = devm_led_classdev_register(dev, &led->cdev);
+	ret = devm_led_classdev_register_ext(dev, &led->cdev, &init_data);
 	if (ret)
 		dev_err(dev, "Failed to register LED for node %pOF\n", np);
 
-- 
2.26.2

