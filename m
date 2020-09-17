Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 920CE26E874
	for <lists+linux-leds@lfdr.de>; Fri, 18 Sep 2020 00:34:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726307AbgIQWeD (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 17 Sep 2020 18:34:03 -0400
Received: from mail.nic.cz ([217.31.204.67]:35610 "EHLO mail.nic.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726154AbgIQWeC (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Thu, 17 Sep 2020 18:34:02 -0400
Received: from dellmb.labs.office.nic.cz (unknown [IPv6:2001:1488:fffe:6:cac7:3539:7f1f:463])
        by mail.nic.cz (Postfix) with ESMTP id AEFE3140AAB;
        Fri, 18 Sep 2020 00:33:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
        t=1600382035; bh=wpYWIMFLHHEQHY3szNAZh0Xlv5s2DPdwZfaOXl2xbtY=;
        h=From:To:Date;
        b=pEXzLZridMTS9MO6S1TGAIiEovytcB8dr3+gIuKJX9bER3qLnUTY3q3fbYs0KIt/x
         uW5o05gkXp9niUsrOLEPvN3Gi96S1Za6T10Ex6Ll44vIWkwLe8iZ7mngwE1tlghIrI
         /W0MY7PMwOrKKsTI4K1TH/jCdbyY7/THJwp4XsGM=
From:   =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>
To:     linux-leds@vger.kernel.org
Cc:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        =?UTF-8?q?Ond=C5=99ej=20Jirman?= <megous@megous.com>,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org,
        =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>
Subject: [PATCH leds v2 14/50] leds: lm3697: use struct led_init_data when registering
Date:   Fri, 18 Sep 2020 00:33:02 +0200
Message-Id: <20200917223338.14164-15-marek.behun@nic.cz>
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

Previously if the `label` DT property was not present, the code composed
name for the LED in the form
  "parent_name::"
For backwards compatibility we therefore set
  init_data->default_label = ":";
so that the LED will not get a different name if `label` property is not
present.

Signed-off-by: Marek Behún <marek.behun@nic.cz>
Cc: Dan Murphy <dmurphy@ti.com>
---
 drivers/leds/leds-lm3697.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/drivers/leds/leds-lm3697.c b/drivers/leds/leds-lm3697.c
index 5d14f3d2220af..479776ac36c35 100644
--- a/drivers/leds/leds-lm3697.c
+++ b/drivers/leds/leds-lm3697.c
@@ -194,7 +194,6 @@ static int lm3697_probe_dt(struct lm3697 *priv)
 {
 	struct fwnode_handle *child = NULL;
 	struct lm3697_led *led;
-	const char *name;
 	int control_bank;
 	size_t i = 0;
 	int ret = -EINVAL;
@@ -214,6 +213,8 @@ static int lm3697_probe_dt(struct lm3697 *priv)
 		priv->regulator = NULL;
 
 	device_for_each_child_node(priv->dev, child) {
+		struct led_init_data init_data = {};
+
 		ret = fwnode_property_read_u32(child, "reg", &control_bank);
 		if (ret) {
 			dev_err(&priv->client->dev, "reg property missing\n");
@@ -271,20 +272,17 @@ static int lm3697_probe_dt(struct lm3697 *priv)
 		fwnode_property_read_string(child, "linux,default-trigger",
 					    &led->led_dev.default_trigger);
 
-		ret = fwnode_property_read_string(child, "label", &name);
-		if (ret)
-			snprintf(led->label, sizeof(led->label),
-				"%s::", priv->client->name);
-		else
-			snprintf(led->label, sizeof(led->label),
-				 "%s:%s", priv->client->name, name);
+		init_data.fwnode = child;
+		init_data.devicename = priv->client->name;
+		/* for backwards compatibility if `label` is not present */
+		init_data.default_label = ":";
 
 		led->priv = priv;
-		led->led_dev.name = led->label;
 		led->led_dev.max_brightness = led->lmu_data.max_brightness;
 		led->led_dev.brightness_set_blocking = lm3697_brightness_set;
 
-		ret = devm_led_classdev_register(priv->dev, &led->led_dev);
+		ret = devm_led_classdev_register_ext(priv->dev, &led->led_dev,
+						     &init_data);
 		if (ret) {
 			dev_err(&priv->client->dev, "led register err: %d\n",
 				ret);
-- 
2.26.2

