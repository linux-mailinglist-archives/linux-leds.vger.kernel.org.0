Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 40AD8BB1DE
	for <lists+linux-leds@lfdr.de>; Mon, 23 Sep 2019 12:03:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405681AbfIWKDL (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 23 Sep 2019 06:03:11 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:49076 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2407586AbfIWKDL (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 23 Sep 2019 06:03:11 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8NA37sS036667;
        Mon, 23 Sep 2019 05:03:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1569232987;
        bh=7Y0BpFLf0Vbxg8zDWPU0ZsLcRq0WFsPjE8vtO+u1dIs=;
        h=From:To:CC:Subject:Date;
        b=oW/jF7CUS/9zuemrap2T14U4GADn3bhDZkSDEkGgx506+WYvBnFbk3aNVtwR4z4p1
         6rlDNGY6QHB+Fs9uM3q4QNP4knbwPnvD2CIb415KqUcjb/fJPnSUfUy+Od+JofCxs9
         fmyZsVImo0Nq7/eLTjHMacV3YYbxAEwoYgv5LoSU=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8NA37Rm021543
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 23 Sep 2019 05:03:07 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 23
 Sep 2019 05:03:01 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 23 Sep 2019 05:03:01 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8NA36bl120646;
        Mon, 23 Sep 2019 05:03:07 -0500
From:   Jean-Jacques Hiblot <jjhiblot@ti.com>
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>, <dmurphy@ti.com>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Jean-Jacques Hiblot <jjhiblot@ti.com>
Subject: [PATCH] leds: tlc591xx: update the maximum brightness
Date:   Mon, 23 Sep 2019 12:02:50 +0200
Message-ID: <20190923100250.22326-1-jjhiblot@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

The TLC chips actually offer 257 levels:
- 0: led OFF
- 1-255: Led dimmed is using a PWM. The duty cycle range from 0.4% to 99.6%
- 256: led fully ON

Signed-off-by: Jean-Jacques Hiblot <jjhiblot@ti.com>
---
 drivers/leds/leds-tlc591xx.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/leds/leds-tlc591xx.c b/drivers/leds/leds-tlc591xx.c
index 8eadb673dc2e..a8911ebd30e5 100644
--- a/drivers/leds/leds-tlc591xx.c
+++ b/drivers/leds/leds-tlc591xx.c
@@ -13,6 +13,7 @@
 #include <linux/slab.h>
 
 #define TLC591XX_MAX_LEDS	16
+#define TLC591XX_MAX_BRIGHTNESS	256
 
 #define TLC591XX_REG_MODE1	0x00
 #define MODE1_RESPON_ADDR_MASK	0xF0
@@ -112,11 +113,11 @@ tlc591xx_brightness_set(struct led_classdev *led_cdev,
 	struct tlc591xx_priv *priv = led->priv;
 	int err;
 
-	switch (brightness) {
+	switch ((int)brightness) {
 	case 0:
 		err = tlc591xx_set_ledout(priv, led, LEDOUT_OFF);
 		break;
-	case LED_FULL:
+	case TLC591XX_MAX_BRIGHTNESS:
 		err = tlc591xx_set_ledout(priv, led, LEDOUT_ON);
 		break;
 	default:
@@ -209,7 +210,7 @@ tlc591xx_probe(struct i2c_client *client,
 		led->priv = priv;
 		led->led_no = reg;
 		led->ldev.brightness_set_blocking = tlc591xx_brightness_set;
-		led->ldev.max_brightness = LED_FULL;
+		led->ldev.max_brightness = TLC591XX_MAX_BRIGHTNESS;
 		err = devm_led_classdev_register_ext(dev, &led->ldev,
 						     &init_data);
 		if (err < 0) {
-- 
2.17.1

