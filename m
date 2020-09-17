Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 47BA326E8CA
	for <lists+linux-leds@lfdr.de>; Fri, 18 Sep 2020 00:36:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726221AbgIQWf7 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 17 Sep 2020 18:35:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726279AbgIQWeL (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 17 Sep 2020 18:34:11 -0400
Received: from mail.nic.cz (mail.nic.cz [IPv6:2001:1488:800:400::400])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6900C061352;
        Thu, 17 Sep 2020 15:33:59 -0700 (PDT)
Received: from dellmb.labs.office.nic.cz (unknown [IPv6:2001:1488:fffe:6:cac7:3539:7f1f:463])
        by mail.nic.cz (Postfix) with ESMTP id 9A447140A4F;
        Fri, 18 Sep 2020 00:33:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
        t=1600382037; bh=81EuTMVUBmsnLEzejgo3xcizWjv8hAhA273os+JXhxY=;
        h=From:To:Date;
        b=m7jnkU0WVghbOP4jSxqKGZWdCGsz4fRNumnhEuXseDeFy+QM4QeWf3BrnL7YyvTrz
         BtsKkcJ482vSw8cXvgdNFMjdHw1QOMiUMIUq9K/kjKIdbQDCNee4UIRmAHpnub3jXm
         e/RHkqfU4/N2qq2t77gvf0V3m2DxUXxGVw2/XxsU=
From:   =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>
To:     linux-leds@vger.kernel.org
Cc:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        =?UTF-8?q?Ond=C5=99ej=20Jirman?= <megous@megous.com>,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org,
        =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>,
        "H . Nikolaus Schaller" <hns@goldelico.com>,
        David Rivshin <drivshin@allworx.com>
Subject: [PATCH leds v2 24/50] leds: is31fl32xx: use struct led_init_data when registering
Date:   Fri, 18 Sep 2020 00:33:12 +0200
Message-Id: <20200917223338.14164-25-marek.behun@nic.cz>
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
Cc: David Rivshin <drivshin@allworx.com>
---
 drivers/leds/leds-is31fl32xx.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/leds/leds-is31fl32xx.c b/drivers/leds/leds-is31fl32xx.c
index 7bacd01289770..279f52931a177 100644
--- a/drivers/leds/leds-is31fl32xx.c
+++ b/drivers/leds/leds-is31fl32xx.c
@@ -332,9 +332,6 @@ static int is31fl32xx_parse_child_dt(const struct device *dev,
 	int ret = 0;
 	u32 reg;
 
-	if (of_property_read_string(child, "label", &cdev->name))
-		cdev->name = child->name;
-
 	ret = of_property_read_u32(child, "reg", &reg);
 	if (ret || reg < 1 || reg > led_data->priv->cdef->channels) {
 		dev_err(dev,
@@ -373,6 +370,7 @@ static int is31fl32xx_parse_dt(struct device *dev,
 	int ret = 0;
 
 	for_each_available_child_of_node(dev_of_node(dev), child) {
+		struct led_init_data init_data = {};
 		struct is31fl32xx_led_data *led_data =
 			&priv->leds[priv->num_leds];
 		const struct is31fl32xx_led_data *other_led_data;
@@ -388,17 +386,18 @@ static int is31fl32xx_parse_dt(struct device *dev,
 							  led_data->channel);
 		if (other_led_data) {
 			dev_err(dev,
-				"%s and %s both attempting to use channel %d\n",
-				led_data->cdev.name,
-				other_led_data->cdev.name,
-				led_data->channel);
+				"Node %pOF 'reg' conflicts with another LED\n",
+				child);
 			goto err;
 		}
 
-		ret = devm_led_classdev_register(dev, &led_data->cdev);
+		init_data.fwnode = of_fwnode_handle(child);
+
+		ret = devm_led_classdev_register_ext(dev, &led_data->cdev,
+						     &init_data);
 		if (ret) {
-			dev_err(dev, "failed to register PWM led for %s: %d\n",
-				led_data->cdev.name, ret);
+			dev_err(dev, "Failed to register LED for %pOF: %d\n",
+				child, ret);
 			goto err;
 		}
 
-- 
2.26.2

