Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B697526E879
	for <lists+linux-leds@lfdr.de>; Fri, 18 Sep 2020 00:34:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726366AbgIQWeK (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 17 Sep 2020 18:34:10 -0400
Received: from mail.nic.cz ([217.31.204.67]:35842 "EHLO mail.nic.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726216AbgIQWeJ (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Thu, 17 Sep 2020 18:34:09 -0400
Received: from dellmb.labs.office.nic.cz (unknown [IPv6:2001:1488:fffe:6:cac7:3539:7f1f:463])
        by mail.nic.cz (Postfix) with ESMTP id 0652E1419F6;
        Fri, 18 Sep 2020 00:33:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
        t=1600382038; bh=eVEEs+3FCmghmvPcW79AsOl6NcLqYrjCH2wd/yFtugk=;
        h=From:To:Date;
        b=iRVnNu4FDoqE0CN7TvkhuJw1xfSAhDSIcSZ6JJL2P68v51XuZoRhkY6i6kCg9L7rC
         gtYL0FabWl5QX+KNoVRuR4zfYfXC7MFRprlWfyeMDevRA4gXBnfZL6+EPtG55WFjmA
         lGWtPwSA7cscnLRexk9K3x3N78/tqXD4cOspLdd0=
From:   =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>
To:     linux-leds@vger.kernel.org
Cc:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        =?UTF-8?q?Ond=C5=99ej=20Jirman?= <megous@megous.com>,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org,
        =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>,
        "H . Nikolaus Schaller" <hns@goldelico.com>,
        Grant Feng <von81@163.com>
Subject: [PATCH leds v2 26/50] leds: is31fl319x: don't store shutdown gpio descriptor
Date:   Fri, 18 Sep 2020 00:33:14 +0200
Message-Id: <20200917223338.14164-27-marek.behun@nic.cz>
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

Since the shutdown gpio descriptor is only accessed in device probe
method there is no need to store it in the private structure.

Signed-off-by: Marek Behún <marek.behun@nic.cz>
Cc: H. Nikolaus Schaller <hns@goldelico.com>
Cc: Grant Feng <von81@163.com>
---
 drivers/leds/leds-is31fl319x.c | 31 +++++++++++++++----------------
 1 file changed, 15 insertions(+), 16 deletions(-)

diff --git a/drivers/leds/leds-is31fl319x.c b/drivers/leds/leds-is31fl319x.c
index ba1a5da5521b5..595112958617e 100644
--- a/drivers/leds/leds-is31fl319x.c
+++ b/drivers/leds/leds-is31fl319x.c
@@ -63,7 +63,6 @@
 struct is31fl319x_chip {
 	const struct is31fl319x_chipdef *cdef;
 	struct i2c_client               *client;
-	struct gpio_desc		*shutdown_gpio;
 	struct regmap                   *regmap;
 	struct mutex                    lock;
 	u32                             audio_gain_db;
@@ -227,15 +226,6 @@ static int is31fl319x_parse_dt(struct device *dev,
 	if (!np)
 		return -ENODEV;
 
-	is31->shutdown_gpio = devm_gpiod_get_optional(dev,
-						"shutdown",
-						GPIOD_OUT_HIGH);
-	if (IS_ERR(is31->shutdown_gpio)) {
-		ret = PTR_ERR(is31->shutdown_gpio);
-		dev_err(dev, "Failed to get shutdown gpio: %d\n", ret);
-		return ret;
-	}
-
 	is31->cdef = device_get_match_data(dev);
 
 	count = of_get_available_child_count(np);
@@ -355,6 +345,7 @@ static int is31fl319x_probe(struct i2c_client *client,
 {
 	struct is31fl319x_chip *is31;
 	struct device *dev = &client->dev;
+	struct gpio_desc *shutdown_gpio;
 	int err;
 	int i = 0;
 	u32 aggregated_led_microamp;
@@ -375,18 +366,26 @@ static int is31fl319x_probe(struct i2c_client *client,
 	if (!is31)
 		return -ENOMEM;
 
+	shutdown_gpio = gpiod_get_optional(dev, "shutdown", GPIOD_OUT_HIGH);
+	if (IS_ERR(shutdown_gpio)) {
+		err = PTR_ERR(shutdown_gpio);
+		dev_err(dev, "Failed to get shutdown gpio: %d\n", err);
+		return err;
+	}
+
+	if (shutdown_gpio) {
+		gpiod_direction_output(shutdown_gpio, 0);
+		mdelay(5);
+		gpiod_direction_output(shutdown_gpio, 1);
+		gpiod_put(shutdown_gpio);
+	}
+
 	mutex_init(&is31->lock);
 
 	err = is31fl319x_parse_dt(&client->dev, is31);
 	if (err)
 		goto free_mutex;
 
-	if (is31->shutdown_gpio) {
-		gpiod_direction_output(is31->shutdown_gpio, 0);
-		mdelay(5);
-		gpiod_direction_output(is31->shutdown_gpio, 1);
-	}
-
 	is31->client = client;
 	is31->regmap = devm_regmap_init_i2c(client, &regmap_config);
 	if (IS_ERR(is31->regmap)) {
-- 
2.26.2

