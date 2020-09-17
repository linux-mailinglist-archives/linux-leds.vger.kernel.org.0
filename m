Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9796026E8E0
	for <lists+linux-leds@lfdr.de>; Fri, 18 Sep 2020 00:36:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726831AbgIQWgV (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 17 Sep 2020 18:36:21 -0400
Received: from mail.nic.cz ([217.31.204.67]:35700 "EHLO mail.nic.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726002AbgIQWeG (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Thu, 17 Sep 2020 18:34:06 -0400
Received: from dellmb.labs.office.nic.cz (unknown [IPv6:2001:1488:fffe:6:cac7:3539:7f1f:463])
        by mail.nic.cz (Postfix) with ESMTP id 76DF1140ACC;
        Fri, 18 Sep 2020 00:33:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
        t=1600382036; bh=PudSrnQk2VQk9kM5P052llxhBfC5x3nuZfzy/vHQrmc=;
        h=From:To:Date;
        b=HiSTP7PUT/v+iEyqEwlSY7RGTJklU+oCT1bd+noE1ERUHbqKjQMlZDxmvc6fpqhcg
         QFTdm7MJ8yiys+nk7+nC9EZtEvS+Um/0qQywi8M0VecyIq0NwD29lWFFZq5QSc8Tba
         8oSaM6I+8FW8Ga2ufQTV3k4dp9zSRCQqdsGFdbK4=
From:   =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>
To:     linux-leds@vger.kernel.org
Cc:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        =?UTF-8?q?Ond=C5=99ej=20Jirman?= <megous@megous.com>,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org,
        =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>,
        Sean Wang <sean.wang@mediatek.com>,
        John Crispin <john@phrozen.org>,
        Ryder Lee <ryder.lee@mediatek.com>
Subject: [PATCH leds v2 18/50] leds: mt6323: use struct led_init_data when registering
Date:   Fri, 18 Sep 2020 00:33:06 +0200
Message-Id: <20200917223338.14164-19-marek.behun@nic.cz>
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

Since init_data is passed with fwnode handle, we do not need to set
the of_node member of the newly created LED classdev.

Signed-off-by: Marek Behún <marek.behun@nic.cz>
Cc: Sean Wang <sean.wang@mediatek.com>
Cc: John Crispin <john@phrozen.org>
Cc: Ryder Lee <ryder.lee@mediatek.com>
---
 drivers/leds/leds-mt6323.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/leds/leds-mt6323.c b/drivers/leds/leds-mt6323.c
index 2c46b75030358..f6c71fd691bb8 100644
--- a/drivers/leds/leds-mt6323.c
+++ b/drivers/leds/leds-mt6323.c
@@ -342,7 +342,6 @@ static int mt6323_led_set_dt_default(struct led_classdev *cdev,
 	const char *state;
 	int ret = 0;
 
-	led->cdev.name = of_get_property(np, "label", NULL) ? : np->name;
 	led->cdev.default_trigger = of_get_property(np,
 						    "linux,default-trigger",
 						    NULL);
@@ -402,6 +401,8 @@ static int mt6323_led_probe(struct platform_device *pdev)
 	}
 
 	for_each_available_child_of_node(np, child) {
+		struct led_init_data init_data = {};
+
 		ret = of_property_read_u32(child, "reg", &reg);
 		if (ret) {
 			dev_err(dev, "Failed to read led 'reg' property\n");
@@ -437,13 +438,15 @@ static int mt6323_led_probe(struct platform_device *pdev)
 			goto put_child_node;
 		}
 
-		ret = devm_led_classdev_register(dev, &leds->led[reg]->cdev);
+		init_data.fwnode = of_fwnode_handle(child);
+
+		ret = devm_led_classdev_register_ext(dev, &leds->led[reg]->cdev,
+						     &init_data);
 		if (ret) {
 			dev_err(&pdev->dev, "Failed to register LED: %d\n",
 				ret);
 			goto put_child_node;
 		}
-		leds->led[reg]->cdev.dev->of_node = child;
 	}
 
 	return 0;
-- 
2.26.2

