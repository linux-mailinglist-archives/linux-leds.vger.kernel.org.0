Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2B6C5B8F60
	for <lists+linux-leds@lfdr.de>; Fri, 20 Sep 2019 13:58:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2408821AbfITL6R (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 20 Sep 2019 07:58:17 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:52760 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2408806AbfITL6P (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 20 Sep 2019 07:58:15 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8KBwCXN068213;
        Fri, 20 Sep 2019 06:58:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1568980692;
        bh=ZOcqTLVEr3nn+41wnlCxrgM97BsSS51UgwOEyQKYKck=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=UGSxoOX2o9c7Lwca1bKP/XInNcgAei18NKCF9hh7PKaxgevpJxr03D7eCC74Op9kl
         H+9svBTKJ432XudHbnh2NMwyu3KlNzTgfs3JBnfXLR4ZUXiFcvDCxoScD5yvjwkTn6
         P+9xib5uoKDn7Jq6hGcxMPwdkR7eWuAq9TLsgw8o=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8KBwCnU099046
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 20 Sep 2019 06:58:12 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 20
 Sep 2019 06:58:12 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 20 Sep 2019 06:58:08 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8KBwBsv063748;
        Fri, 20 Sep 2019 06:58:12 -0500
From:   Jean-Jacques Hiblot <jjhiblot@ti.com>
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>, <dmurphy@ti.com>
CC:     <tomi.valkeinen@ti.com>, <linux-leds@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Jean-Jacques Hiblot <jjhiblot@ti.com>
Subject: [PATCH v4 2/2] leds: tlc591xx: use devm_led_classdev_register_ext()
Date:   Fri, 20 Sep 2019 13:58:06 +0200
Message-ID: <20190920115806.14475-3-jjhiblot@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190920115806.14475-1-jjhiblot@ti.com>
References: <20190920115806.14475-1-jjhiblot@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Use devm_led_classdev_register_ext() to pass the fwnode to the LED core.
The fwnode can then be used by the firmware core to create meaningful
names.

Signed-off-by: Jean-Jacques Hiblot <jjhiblot@ti.com>
---
 drivers/leds/leds-tlc591xx.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/leds/leds-tlc591xx.c b/drivers/leds/leds-tlc591xx.c
index bbdaa3148317..8eadb673dc2e 100644
--- a/drivers/leds/leds-tlc591xx.c
+++ b/drivers/leds/leds-tlc591xx.c
@@ -186,6 +186,9 @@ tlc591xx_probe(struct i2c_client *client,
 
 	for_each_child_of_node(np, child) {
 		struct tlc591xx_led *led;
+		struct led_init_data init_data = {};
+
+		init_data.fwnode = of_fwnode_handle(child);
 
 		err = of_property_read_u32(child, "reg", &reg);
 		if (err) {
@@ -200,8 +203,6 @@ tlc591xx_probe(struct i2c_client *client,
 		led = &priv->leds[reg];
 
 		led->active = true;
-		led->ldev.name =
-			of_get_property(child, "label", NULL) ? : child->name;
 		led->ldev.default_trigger =
 			of_get_property(child, "linux,default-trigger", NULL);
 
@@ -209,7 +210,8 @@ tlc591xx_probe(struct i2c_client *client,
 		led->led_no = reg;
 		led->ldev.brightness_set_blocking = tlc591xx_brightness_set;
 		led->ldev.max_brightness = LED_FULL;
-		err = devm_led_classdev_register(dev, &led->ldev);
+		err = devm_led_classdev_register_ext(dev, &led->ldev,
+						     &init_data);
 		if (err < 0) {
 			dev_err(dev, "couldn't register LED %s\n",
 				led->ldev.name);
-- 
2.17.1

