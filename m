Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C20783BB00
	for <lists+linux-leds@lfdr.de>; Mon, 10 Jun 2019 19:32:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387860AbfFJRcZ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 10 Jun 2019 13:32:25 -0400
Received: from smtp.220.in.ua ([89.184.67.205]:54794 "EHLO smtp.220.in.ua"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387456AbfFJRcZ (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Mon, 10 Jun 2019 13:32:25 -0400
Received: from oleh-pc.lan (unknown [95.67.115.55])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by smtp.220.in.ua (Postfix) with ESMTPSA id 961611A200F5;
        Mon, 10 Jun 2019 20:32:23 +0300 (EEST)
From:   Oleh Kravchenko <oleg@kaa.org.ua>
To:     linux-leds@vger.kernel.org
Cc:     Oleh Kravchenko <oleg@kaa.org.ua>
Subject: [PATCH v3 2/2] Simplify LED registeration by devm_led_classdev_register()
Date:   Mon, 10 Jun 2019 20:32:06 +0300
Message-Id: <20190610173206.8060-2-oleg@kaa.org.ua>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190610173206.8060-1-oleg@kaa.org.ua>
References: <20190610173206.8060-1-oleg@kaa.org.ua>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Because of devm_led_classdev_register() doesn't require device node pointer.
This patch reduce little bit code size and complexity.

Signed-off-by: Oleh Kravchenko <oleg@kaa.org.ua>
---

Just improve commit message.

drivers/leds/leds-cr0014114.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/leds/leds-cr0014114.c b/drivers/leds/leds-cr0014114.c
index 91deb40db307..880089ef9a9b 100644
--- a/drivers/leds/leds-cr0014114.c
+++ b/drivers/leds/leds-cr0014114.c
@@ -183,12 +183,10 @@ static int cr0014114_probe_dt(struct cr0014114 *priv)
 	size_t			i = 0;
 	struct cr0014114_led	*led;
 	struct fwnode_handle	*child;
-	struct device_node	*np;
 	int			ret;
 	const char		*str;
 
 	device_for_each_child_node(priv->dev, child) {
-		np = to_of_node(child);
 		led = &priv->leds[i];
 
 		ret = fwnode_property_read_string(child, "label", &str);
@@ -207,8 +205,7 @@ static int cr0014114_probe_dt(struct cr0014114 *priv)
 		led->ldev.max_brightness	  = CR_MAX_BRIGHTNESS;
 		led->ldev.brightness_set_blocking = cr0014114_set_sync;
 
-		ret = devm_of_led_classdev_register(priv->dev, np,
-						    &led->ldev);
+		ret = devm_led_classdev_register(priv->dev, &led->ldev);
 		if (ret) {
 			dev_err(priv->dev,
 				"failed to register LED device %s, err %d",
@@ -217,8 +214,6 @@ static int cr0014114_probe_dt(struct cr0014114 *priv)
 			return ret;
 		}
 
-		led->ldev.dev->of_node = np;
-
 		i++;
 	}
 
-- 
2.21.0

