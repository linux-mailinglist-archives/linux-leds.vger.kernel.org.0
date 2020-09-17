Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CCC9026E8F8
	for <lists+linux-leds@lfdr.de>; Fri, 18 Sep 2020 00:37:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726115AbgIQWd4 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 17 Sep 2020 18:33:56 -0400
Received: from mail.nic.cz ([217.31.204.67]:35390 "EHLO mail.nic.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726002AbgIQWdz (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Thu, 17 Sep 2020 18:33:55 -0400
Received: from dellmb.labs.office.nic.cz (unknown [IPv6:2001:1488:fffe:6:cac7:3539:7f1f:463])
        by mail.nic.cz (Postfix) with ESMTP id 77288140A77;
        Fri, 18 Sep 2020 00:33:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
        t=1600382033; bh=rfV/YCisp35X1dtXLdY98Kx278wzd/xZQcYiIrwuE0A=;
        h=From:To:Date;
        b=sT4rqLeb/NoofjbWWjAc4/YyeR8B9rbS+gQChKhuIvORsgEwjL/f73EpdLR30u23d
         N7hiSMRsLmYdCK9+a7RChs9hiJ3XAOg+KH35hwUNG2rKkKG2qou1z6LbtkrvxJXOLi
         7R55Nr60zBXdsck7mFUNROTamRidgjIq4EjKCcKA=
From:   =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>
To:     linux-leds@vger.kernel.org
Cc:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        =?UTF-8?q?Ond=C5=99ej=20Jirman?= <megous@megous.com>,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org,
        =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>,
        "H . Nikolaus Schaller" <hns@goldelico.com>,
        David Rivshin <drivshin@allworx.com>,
        Sebastian Reichel <sre@kernel.org>,
        Christian Mauderer <oss@c-mauderer.de>,
        Andrew Lunn <andrew@lunn.ch>
Subject: [PATCH leds v2 04/50] leds: various: use device_get_match_data
Date:   Fri, 18 Sep 2020 00:32:52 +0200
Message-Id: <20200917223338.14164-5-marek.behun@nic.cz>
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

Simply use device_get_match_data instead of matching against the match
table again.

Signed-off-by: Marek Behún <marek.behun@nic.cz>
Cc: H. Nikolaus Schaller <hns@goldelico.com>
Cc: David Rivshin <drivshin@allworx.com>
Cc: Sebastian Reichel <sre@kernel.org>
Cc: Christian Mauderer <oss@c-mauderer.de>
Cc: Andrew Lunn <andrew@lunn.ch>
---
 drivers/leds/leds-cpcap.c      |  7 +------
 drivers/leds/leds-is31fl319x.c | 12 ++----------
 drivers/leds/leds-is31fl32xx.c |  7 +------
 drivers/leds/leds-spi-byte.c   |  7 +------
 drivers/leds/leds-tlc591xx.c   |  7 +------
 5 files changed, 6 insertions(+), 34 deletions(-)

diff --git a/drivers/leds/leds-cpcap.c b/drivers/leds/leds-cpcap.c
index 9f3fa47372134..7d41ce8c9bb1e 100644
--- a/drivers/leds/leds-cpcap.c
+++ b/drivers/leds/leds-cpcap.c
@@ -158,19 +158,14 @@ MODULE_DEVICE_TABLE(of, cpcap_led_of_match);
 
 static int cpcap_led_probe(struct platform_device *pdev)
 {
-	const struct of_device_id *match;
 	struct cpcap_led *led;
 	int err;
 
-	match = of_match_device(of_match_ptr(cpcap_led_of_match), &pdev->dev);
-	if (!match || !match->data)
-		return -EINVAL;
-
 	led = devm_kzalloc(&pdev->dev, sizeof(*led), GFP_KERNEL);
 	if (!led)
 		return -ENOMEM;
 	platform_set_drvdata(pdev, led);
-	led->info = match->data;
+	led->info = device_get_match_data(&pdev->dev);
 	led->dev = &pdev->dev;
 
 	if (led->info->reg == 0x0000) {
diff --git a/drivers/leds/leds-is31fl319x.c b/drivers/leds/leds-is31fl319x.c
index 54ac50740d43d..b039ffa33559c 100644
--- a/drivers/leds/leds-is31fl319x.c
+++ b/drivers/leds/leds-is31fl319x.c
@@ -203,7 +203,6 @@ static int is31fl319x_parse_dt(struct device *dev,
 			       struct is31fl319x_chip *is31)
 {
 	struct device_node *np = dev->of_node, *child;
-	const struct of_device_id *of_dev_id;
 	int count;
 	int ret;
 
@@ -219,18 +218,11 @@ static int is31fl319x_parse_dt(struct device *dev,
 		return ret;
 	}
 
-	of_dev_id = of_match_device(of_is31fl319x_match, dev);
-	if (!of_dev_id) {
-		dev_err(dev, "Failed to match device with supported chips\n");
-		return -EINVAL;
-	}
-
-	is31->cdef = of_dev_id->data;
+	is31->cdef = device_get_match_data(dev);
 
 	count = of_get_child_count(np);
 
-	dev_dbg(dev, "probe %s with %d leds defined in DT\n",
-		of_dev_id->compatible, count);
+	dev_dbg(dev, "probing with %d leds defined in DT\n", count);
 
 	if (!count || count > is31->cdef->num_leds) {
 		dev_err(dev, "Number of leds defined must be between 1 and %u\n",
diff --git a/drivers/leds/leds-is31fl32xx.c b/drivers/leds/leds-is31fl32xx.c
index cd768f991da10..acf51e17e8df6 100644
--- a/drivers/leds/leds-is31fl32xx.c
+++ b/drivers/leds/leds-is31fl32xx.c
@@ -428,17 +428,12 @@ static int is31fl32xx_probe(struct i2c_client *client,
 			    const struct i2c_device_id *id)
 {
 	const struct is31fl32xx_chipdef *cdef;
-	const struct of_device_id *of_dev_id;
 	struct device *dev = &client->dev;
 	struct is31fl32xx_priv *priv;
 	int count;
 	int ret = 0;
 
-	of_dev_id = of_match_device(of_is31fl32xx_match, dev);
-	if (!of_dev_id)
-		return -EINVAL;
-
-	cdef = of_dev_id->data;
+	cdef = device_get_match_data(dev);
 
 	count = of_get_child_count(dev->of_node);
 	if (!count)
diff --git a/drivers/leds/leds-spi-byte.c b/drivers/leds/leds-spi-byte.c
index b231b563b7bbd..9632eb84f8de1 100644
--- a/drivers/leds/leds-spi-byte.c
+++ b/drivers/leds/leds-spi-byte.c
@@ -80,7 +80,6 @@ static int spi_byte_brightness_set_blocking(struct led_classdev *dev,
 
 static int spi_byte_probe(struct spi_device *spi)
 {
-	const struct of_device_id *of_dev_id;
 	struct device_node *child;
 	struct device *dev = &spi->dev;
 	struct spi_byte_led *led;
@@ -88,10 +87,6 @@ static int spi_byte_probe(struct spi_device *spi)
 	const char *state;
 	int ret;
 
-	of_dev_id = of_match_device(spi_byte_dt_ids, dev);
-	if (!of_dev_id)
-		return -EINVAL;
-
 	if (of_get_child_count(dev->of_node) != 1) {
 		dev_err(dev, "Device must have exactly one LED sub-node.");
 		return -EINVAL;
@@ -106,7 +101,7 @@ static int spi_byte_probe(struct spi_device *spi)
 	strlcpy(led->name, name, sizeof(led->name));
 	led->spi = spi;
 	mutex_init(&led->mutex);
-	led->cdef = of_dev_id->data;
+	led->cdef = device_get_match_data(dev);
 	led->ldev.name = led->name;
 	led->ldev.brightness = LED_OFF;
 	led->ldev.max_brightness = led->cdef->max_value - led->cdef->off_value;
diff --git a/drivers/leds/leds-tlc591xx.c b/drivers/leds/leds-tlc591xx.c
index 1dc14051639c9..aeedf1aa62976 100644
--- a/drivers/leds/leds-tlc591xx.c
+++ b/drivers/leds/leds-tlc591xx.c
@@ -150,16 +150,11 @@ tlc591xx_probe(struct i2c_client *client,
 {
 	struct device_node *np = client->dev.of_node, *child;
 	struct device *dev = &client->dev;
-	const struct of_device_id *match;
 	const struct tlc591xx *tlc591xx;
 	struct tlc591xx_priv *priv;
 	int err, count, reg;
 
-	match = of_match_device(of_tlc591xx_leds_match, dev);
-	if (!match)
-		return -ENODEV;
-
-	tlc591xx = match->data;
+	tlc591xx = device_get_match_data(dev);
 	if (!np)
 		return -ENODEV;
 
-- 
2.26.2

