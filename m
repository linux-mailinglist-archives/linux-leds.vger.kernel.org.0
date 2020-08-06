Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6CC6F23D6E0
	for <lists+linux-leds@lfdr.de>; Thu,  6 Aug 2020 08:38:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728205AbgHFGiF (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 6 Aug 2020 02:38:05 -0400
Received: from m12-15.163.com ([220.181.12.15]:33391 "EHLO m12-15.163.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726051AbgHFGiE (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Thu, 6 Aug 2020 02:38:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
        s=s110527; h=From:Subject:Date:Message-Id; bh=PtRFGMacX+QscZqfbZ
        +Lu5FxPAgj+Rd4K44h0HnDPoQ=; b=a3YFdVFvhVRmHICzbfsIWhBZQD/rgvhTWF
        QqabZ3we7Z8X5pN69cI6TvMH1VIjmZR24IqQUE1PQZ6UUsGIgQVv/D8llXC6y/zg
        PcYOV6m9LG0jEZU2WJ5hxBgFM89l2A2GItkWczwvO75skBqUglVeD0sJvnjbohyj
        fEJhsVyNM=
Received: from localhost.localdomain (unknown [58.33.126.62])
        by smtp11 (Coremail) with SMTP id D8CowADnbcp1oStf0rT5EQ--.55997S2;
        Thu, 06 Aug 2020 14:21:45 +0800 (CST)
From:   Grant Feng <von81@163.com>
To:     von81@163.com, jacek.anaszewski@gmail.com, pavel@ucw.cz,
        dmurphy@ti.com, robh+dt@kernel.org, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] leds: is31fl319x: Add sdb pin and generate a 5ms low pulse when startup
Date:   Thu,  6 Aug 2020 14:21:29 +0800
Message-Id: <20200806062130.25187-1-von81@163.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: D8CowADnbcp1oStf0rT5EQ--.55997S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7AF17try8JrWDGr18ur48WFg_yoW8GF4UpF
        1DCFyrZFW3J3y2g3WfZFW7u345ta18KrZrJrWxXa4Sv3WkK3Wvga4ktFnIvF13XFWxuay5
        ZanxtFW8Gr4vyw7anT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j73kZUUUUU=
X-Originating-IP: [58.33.126.62]
X-CM-SenderInfo: xyrqmii6rwjhhfrp/1tbiRBp4OlSIgamPWgAAs9
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

generate a 5ms low pulse on sdb pin when startup, then the chip
becomes more stable in the complex EM environment.

Signed-off-by: Grant Feng <von81@163.com>
---
 drivers/leds/leds-is31fl319x.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/leds/leds-is31fl319x.c b/drivers/leds/leds-is31fl319x.c
index ca6634b8683c..b4f70002cec9 100644
--- a/drivers/leds/leds-is31fl319x.c
+++ b/drivers/leds/leds-is31fl319x.c
@@ -16,6 +16,8 @@
 #include <linux/of_device.h>
 #include <linux/regmap.h>
 #include <linux/slab.h>
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
 
 /* register numbers */
 #define IS31FL319X_SHUTDOWN		0x00
@@ -61,6 +63,7 @@
 struct is31fl319x_chip {
 	const struct is31fl319x_chipdef *cdef;
 	struct i2c_client               *client;
+	struct gpio_desc		*sdb_pin;
 	struct regmap                   *regmap;
 	struct mutex                    lock;
 	u32                             audio_gain_db;
@@ -265,6 +268,15 @@ static int is31fl319x_parse_dt(struct device *dev,
 		is31->audio_gain_db = min(is31->audio_gain_db,
 					  IS31FL319X_AUDIO_GAIN_DB_MAX);
 
+	is31->sdb_pin = gpiod_get(dev, "sdb", GPIOD_ASIS);
+	if (IS_ERR(is31->sdb_pin)) {
+		dev_warn(dev, "failed to get gpio_sdb, try default\r\n");
+	} else {
+		gpiod_direction_output(is31->sdb_pin, 0);
+		mdelay(5);
+		gpiod_direction_output(is31->sdb_pin, 1);
+	}
+
 	return 0;
 
 put_child_node:
-- 
2.17.1


