Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9282A26E8FE
	for <lists+linux-leds@lfdr.de>; Fri, 18 Sep 2020 00:37:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726022AbgIQWg6 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 17 Sep 2020 18:36:58 -0400
Received: from lists.nic.cz ([217.31.204.67]:35542 "EHLO mail.nic.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726118AbgIQWd7 (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Thu, 17 Sep 2020 18:33:59 -0400
Received: from dellmb.labs.office.nic.cz (unknown [IPv6:2001:1488:fffe:6:cac7:3539:7f1f:463])
        by mail.nic.cz (Postfix) with ESMTP id D01EE140A94;
        Fri, 18 Sep 2020 00:33:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
        t=1600382035; bh=5wo607a85PZ8EGCxuDc4OP1bAfnLn3jrieSehirzD8s=;
        h=From:To:Date;
        b=VBvCHPmMP1qIPa4bt2pFY6SsW5rtR7R4Y9gmaph+JqZZH1gr+VaNZRT2UXf0PvyKy
         BVsoFiWzNFAOHN9sPpeGJtI0t3mXAjwkDMm9FvdLSzQlTiKEKJeCMmJdO1iExCOvgo
         4yz0IxMDDbOfm9QxBMW9HWOu9ct8nWTTnD4W+gHE=
From:   =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>
To:     linux-leds@vger.kernel.org
Cc:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        =?UTF-8?q?Ond=C5=99ej=20Jirman?= <megous@megous.com>,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org,
        =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>,
        Nikita Travkin <nikitos.tr@gmail.com>,
        Milo Kim <milo.kim@ti.com>
Subject: [PATCH leds v2 09/50] leds: various: fix OF node leaks
Date:   Fri, 18 Sep 2020 00:32:57 +0200
Message-Id: <20200917223338.14164-10-marek.behun@nic.cz>
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

Fix OF node leaks by calling of_node_put in
for_each_available_child_of_node when the cycle breaks or returns.

Signed-off-by: Marek Behún <marek.behun@nic.cz>
Cc: Nikita Travkin <nikitos.tr@gmail.com>
Cc: Milo Kim <milo.kim@ti.com>
Cc: Dan Murphy <dmurphy@ti.com>
---
 drivers/leds/leds-aw2013.c        | 4 +++-
 drivers/leds/leds-lp55xx-common.c | 8 ++++++--
 drivers/leds/leds-turris-omnia.c  | 4 +++-
 3 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/leds/leds-aw2013.c b/drivers/leds/leds-aw2013.c
index 9df7de042bca2..927c5ba32592f 100644
--- a/drivers/leds/leds-aw2013.c
+++ b/drivers/leds/leds-aw2013.c
@@ -305,8 +305,10 @@ static int aw2013_probe_dt(struct aw2013 *chip)
 
 		ret = devm_led_classdev_register_ext(&chip->client->dev,
 						     &led->cdev, &init_data);
-		if (ret < 0)
+		if (ret < 0) {
+			of_node_put(child);
 			return ret;
+		}
 
 		i++;
 	}
diff --git a/drivers/leds/leds-lp55xx-common.c b/drivers/leds/leds-lp55xx-common.c
index 50f7f5b874636..81de1346bf5d6 100644
--- a/drivers/leds/leds-lp55xx-common.c
+++ b/drivers/leds/leds-lp55xx-common.c
@@ -614,8 +614,10 @@ static int lp55xx_parse_multi_led(struct device_node *np,
 	for_each_available_child_of_node(np, child) {
 		ret = lp55xx_parse_multi_led_child(child, cfg, child_number,
 						   num_colors);
-		if (ret)
+		if (ret) {
+			of_node_put(child);
 			return ret;
+		}
 		num_colors++;
 	}
 
@@ -681,8 +683,10 @@ struct lp55xx_platform_data *lp55xx_of_populate_pdata(struct device *dev,
 
 	for_each_available_child_of_node(np, child) {
 		ret = lp55xx_parse_logical_led(child, cfg, i);
-		if (ret)
+		if (ret) {
+			of_node_put(child);
 			return ERR_PTR(-EINVAL);
+		}
 		i++;
 	}
 
diff --git a/drivers/leds/leds-turris-omnia.c b/drivers/leds/leds-turris-omnia.c
index b2add494af14d..c276969137d7f 100644
--- a/drivers/leds/leds-turris-omnia.c
+++ b/drivers/leds/leds-turris-omnia.c
@@ -236,8 +236,10 @@ static int omnia_leds_probe(struct i2c_client *client,
 	led = &leds->leds[0];
 	for_each_available_child_of_node(np, child) {
 		ret = omnia_led_register(client, led, child);
-		if (ret < 0)
+		if (ret < 0) {
+			of_node_put(child);
 			return ret;
+		}
 
 		led += ret;
 	}
-- 
2.26.2

