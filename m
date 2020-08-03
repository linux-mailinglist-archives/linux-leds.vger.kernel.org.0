Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA81123A2BC
	for <lists+linux-leds@lfdr.de>; Mon,  3 Aug 2020 12:30:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725948AbgHCKam (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 3 Aug 2020 06:30:42 -0400
Received: from m12-11.163.com ([220.181.12.11]:49845 "EHLO m12-11.163.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725933AbgHCKam (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Mon, 3 Aug 2020 06:30:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
        s=s110527; h=From:Subject:Date:Message-Id; bh=QJHCOddwJcC9lTJOiH
        oPrd47VTm47RKffasxqfRctE4=; b=qZifY37z5/MsHAjEFUrfWMGPBMr8btv8fd
        UYF6QqXrAxICXfwfoOGghW82AkTF9h01TjRnJKEU2C0L8P8sVk6TGgjUPzZKNhr5
        58rtG3AXGE+X/Oi6jaGZzmcfQkvjZJw2cy7O8rRv1k3REysa4HIDki4kT1Nghilc
        yNxwO0bOk=
Received: from localhost.localdomain (unknown [58.33.79.182])
        by smtp7 (Coremail) with SMTP id C8CowAA3FLEb5ydf1tATBg--.63493S2;
        Mon, 03 Aug 2020 18:29:54 +0800 (CST)
From:   Grant Feng <von81@163.com>
To:     von81@163.com, jacek.anaszewski@gmail.com, pavel@ucw.cz,
        dmurphy@ti.com, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v1] leds: is31fl32xx: Add sdb pin and generate a 5ms low pulse when startup
Date:   Mon,  3 Aug 2020 18:29:35 +0800
Message-Id: <20200803102935.24364-1-von81@163.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: C8CowAA3FLEb5ydf1tATBg--.63493S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7AF17trykZw1fWrWfKF4DArb_yoW8ArW5pF
        4DCFy5Jr45AryfKwnrZF4UZFy3Jay8JFyDtFWfC34ay3W2k3sYqFyvkryqv3Z8XF95uay5
        ZFs8tFs8Cr48Zw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jwhL8UUUUU=
X-Originating-IP: [58.33.79.182]
X-CM-SenderInfo: xyrqmii6rwjhhfrp/1tbiNwJ1OlWBhi8+4AAAsZ
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

generate a 5ms low pulse on sdb pin when startup, then the chip
becomes more stable in the complex EM environment.

Signed-off-by: Grant Feng <von81@163.com>
---
 drivers/leds/leds-is31fl32xx.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/leds-is31fl32xx.c b/drivers/leds/leds-is31fl32xx.c
index cd768f991da1..e0f8734223c0 100644
--- a/drivers/leds/leds-is31fl32xx.c
+++ b/drivers/leds/leds-is31fl32xx.c
@@ -16,6 +16,8 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_device.h>
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
 
 /* Used to indicate a device has no such register */
 #define IS31FL32XX_REG_NONE 0xFF
@@ -43,6 +45,7 @@ struct is31fl32xx_led_data {
 struct is31fl32xx_priv {
 	const struct is31fl32xx_chipdef *cdef;
 	struct i2c_client *client;
+	struct gpio_desc *sdb_pin;
 	unsigned int num_leds;
 	struct is31fl32xx_led_data leds[];
 };
@@ -405,6 +408,15 @@ static int is31fl32xx_parse_dt(struct device *dev,
 		priv->num_leds++;
 	}
 
+	priv->sdb_pin = gpiod_get(dev, "sdb", GPIOD_ASIS);
+	if (IS_ERR(priv->sdb_pin)) {
+		dev_warn(dev, "failed to get SDB GPIO, try default\r\n");
+	} else {
+		gpiod_direction_output(priv->sdb_pin, 0);
+		mdelay(5);
+		gpiod_direction_output(priv->sdb_pin, 1);
+	}
+
 	return 0;
 
 err:
@@ -453,11 +465,11 @@ static int is31fl32xx_probe(struct i2c_client *client,
 	priv->cdef = cdef;
 	i2c_set_clientdata(client, priv);
 
-	ret = is31fl32xx_init_regs(priv);
+	ret = is31fl32xx_parse_dt(dev, priv);
 	if (ret)
 		return ret;
 
-	ret = is31fl32xx_parse_dt(dev, priv);
+	ret = is31fl32xx_init_regs(priv);
 	if (ret)
 		return ret;
 
-- 
2.17.1


