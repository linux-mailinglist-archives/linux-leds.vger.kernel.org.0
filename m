Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27A272513D6
	for <lists+linux-leds@lfdr.de>; Tue, 25 Aug 2020 10:08:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727793AbgHYIIs (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 25 Aug 2020 04:08:48 -0400
Received: from m12-11.163.com ([220.181.12.11]:38754 "EHLO m12-11.163.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725890AbgHYIIs (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Tue, 25 Aug 2020 04:08:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
        s=s110527; h=From:Subject:Date:Message-Id; bh=uzJQefAboauO6PTuM2
        6KoCfp7NDYLyFh9K9UE5Px/BM=; b=kRmTEwWNKXXJnJulcK9KWXwmwC3JvpNYPp
        AugMKjabHJSXa4Ew+Ck677FL3jgjHYBV2N4/b9EncsBAHCRNThWmTPuO1r+487GF
        O1PiiOQCuRt1HEmxpaxHl4CUO42evvO2IAGPRZQq4zl2y8wsPdEOOVG7QOy2ykah
        ZAg04EZeE=
Received: from localhost.localdomain (unknown [58.33.102.45])
        by smtp7 (Coremail) with SMTP id C8CowAD3rDXqxkRfAWr+DA--.63807S2;
        Tue, 25 Aug 2020 16:08:15 +0800 (CST)
From:   Grant Feng <von81@163.com>
To:     von81@163.com, jacek.anaszewski@gmail.com, pavel@ucw.cz,
        dmurphy@ti.com, robh+dt@kernel.org, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/2] leds: is31fl32xx: Add shutdown pin and generate a 5ms low pulse when startup
Date:   Tue, 25 Aug 2020 16:07:57 +0800
Message-Id: <20200825080758.5283-1-von81@163.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: C8CowAD3rDXqxkRfAWr+DA--.63807S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7AF17trWUCr1rGr17JFW3trb_yoW8KFW7pF
        4qkFy5Ar4YvrWxKwnrAF4UZFy3A348JF4DtFWxC3y3J3W2krn0qFy0yryqv3W5WFZ5uay5
        AF4DKF15Gr48Aw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jwsqXUUUUU=
X-Originating-IP: [58.33.102.45]
X-CM-SenderInfo: xyrqmii6rwjhhfrp/1tbiUQ+LOlWBQf6LUgAAsd
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

generate a 5ms low pulse on shutdown pin when startup, then the chip
becomes more stable in the complex EM environment.

Signed-off-by: Grant Feng <von81@163.com>
---
 drivers/leds/leds-is31fl32xx.c | 24 +++++++++++++++++++++---
 1 file changed, 21 insertions(+), 3 deletions(-)

diff --git a/drivers/leds/leds-is31fl32xx.c b/drivers/leds/leds-is31fl32xx.c
index cd768f991da1..946ad2f71e00 100644
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
+	struct gpio_desc *shutdown_gpio;
 	unsigned int num_leds;
 	struct is31fl32xx_led_data leds[];
 };
@@ -282,11 +285,17 @@ static int is31fl32xx_software_shutdown(struct is31fl32xx_priv *priv,
 	return 0;
 }
 
-static int is31fl32xx_init_regs(struct is31fl32xx_priv *priv)
+static int is31fl32xx_init(struct is31fl32xx_priv *priv)
 {
 	const struct is31fl32xx_chipdef *cdef = priv->cdef;
 	int ret;
 
+	if (priv->shutdown_gpio) {
+		gpiod_direction_output(priv->shutdown_gpio, 0);
+		mdelay(5);
+		gpiod_direction_output(priv->shutdown_gpio, 1);
+	}
+
 	ret = is31fl32xx_reset_regs(priv);
 	if (ret)
 		return ret;
@@ -372,6 +381,15 @@ static int is31fl32xx_parse_dt(struct device *dev,
 	struct device_node *child;
 	int ret = 0;
 
+	priv->shutdown_gpio = devm_gpiod_get_optional(dev,
+						"shutdown",
+						GPIOD_OUT_HIGH);
+	if (IS_ERR(priv->shutdown_gpio)) {
+		ret = PTR_ERR(priv->shutdown_gpio);
+		dev_err(dev, "Failed to get shutdown gpio: %d\n", ret);
+		return ret;
+	}
+
 	for_each_child_of_node(dev->of_node, child) {
 		struct is31fl32xx_led_data *led_data =
 			&priv->leds[priv->num_leds];
@@ -453,11 +471,11 @@ static int is31fl32xx_probe(struct i2c_client *client,
 	priv->cdef = cdef;
 	i2c_set_clientdata(client, priv);
 
-	ret = is31fl32xx_init_regs(priv);
+	ret = is31fl32xx_parse_dt(dev, priv);
 	if (ret)
 		return ret;
 
-	ret = is31fl32xx_parse_dt(dev, priv);
+	ret = is31fl32xx_init(priv);
 	if (ret)
 		return ret;
 
-- 
2.17.1


