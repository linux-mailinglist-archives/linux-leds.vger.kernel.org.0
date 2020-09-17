Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3FE6426E8F2
	for <lists+linux-leds@lfdr.de>; Fri, 18 Sep 2020 00:36:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726859AbgIQWgi (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 17 Sep 2020 18:36:38 -0400
Received: from lists.nic.cz ([217.31.204.67]:35524 "EHLO mail.nic.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725858AbgIQWeA (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Thu, 17 Sep 2020 18:34:00 -0400
Received: from dellmb.labs.office.nic.cz (unknown [IPv6:2001:1488:fffe:6:cac7:3539:7f1f:463])
        by mail.nic.cz (Postfix) with ESMTP id 05AAF140A7F;
        Fri, 18 Sep 2020 00:33:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
        t=1600382034; bh=6RwWE9M3wlMolRn893frXMDZoRarIl3BqpDIyHwIMSg=;
        h=From:To:Date;
        b=Czz9zVRpbAo/n83VGeiwZnOvp+wFm4EGt2/fVVSOEmpt0VUyXKtM/mdC9X/vzyq7q
         wH1U/AVWSafqJyVr1iHXxYDX13ZJFuC9y+IbVGB0a9U5asTl6uxrkIMI1dRZw9nrtW
         cGl9K1o5Up52Y6jA4U9+7UsWTv9ZV72sAWHV5ddg=
From:   =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>
To:     linux-leds@vger.kernel.org
Cc:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        =?UTF-8?q?Ond=C5=99ej=20Jirman?= <megous@megous.com>,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org,
        =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang7@gmail.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Sean Wang <sean.wang@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Riku Voipio <riku.voipio@iki.fi>
Subject: [PATCH leds v2 06/50] leds: various: use dev_of_node(dev) instead of dev->of_node
Date:   Fri, 18 Sep 2020 00:32:54 +0200
Message-Id: <20200917223338.14164-7-marek.behun@nic.cz>
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

The dev_of_node function should be preferred.

Signed-off-by: Marek Behún <marek.behun@nic.cz>
Cc: Orson Zhai <orsonzhai@gmail.com>
Cc: Baolin Wang <baolin.wang7@gmail.com>
Cc: Chunyan Zhang <zhang.lyra@gmail.com>
Cc: Sean Wang <sean.wang@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Riku Voipio <riku.voipio@iki.fi>
---
 drivers/leds/leds-88pm860x.c     | 4 ++--
 drivers/leds/leds-aat1290.c      | 2 +-
 drivers/leds/leds-an30259a.c     | 2 +-
 drivers/leds/leds-aw2013.c       | 2 +-
 drivers/leds/leds-bcm6328.c      | 2 +-
 drivers/leds/leds-bcm6358.c      | 2 +-
 drivers/leds/leds-is31fl319x.c   | 2 +-
 drivers/leds/leds-is31fl32xx.c   | 4 ++--
 drivers/leds/leds-ktd2692.c      | 4 ++--
 drivers/leds/leds-lp5521.c       | 2 +-
 drivers/leds/leds-lp5523.c       | 2 +-
 drivers/leds/leds-lp5562.c       | 2 +-
 drivers/leds/leds-lp8501.c       | 2 +-
 drivers/leds/leds-lp8860.c       | 2 +-
 drivers/leds/leds-lt3593.c       | 2 +-
 drivers/leds/leds-max77693.c     | 2 +-
 drivers/leds/leds-mc13783.c      | 4 ++--
 drivers/leds/leds-mt6323.c       | 2 +-
 drivers/leds/leds-netxbig.c      | 2 +-
 drivers/leds/leds-ns2.c          | 2 +-
 drivers/leds/leds-pca9532.c      | 2 +-
 drivers/leds/leds-pm8058.c       | 2 +-
 drivers/leds/leds-sc27xx-bltc.c  | 2 +-
 drivers/leds/leds-spi-byte.c     | 4 ++--
 drivers/leds/leds-syscon.c       | 4 ++--
 drivers/leds/leds-tca6507.c      | 4 ++--
 drivers/leds/leds-tlc591xx.c     | 2 +-
 drivers/leds/leds-turris-omnia.c | 2 +-
 28 files changed, 35 insertions(+), 35 deletions(-)

diff --git a/drivers/leds/leds-88pm860x.c b/drivers/leds/leds-88pm860x.c
index 465c3755cf2e4..2d1b3269e0f7f 100644
--- a/drivers/leds/leds-88pm860x.c
+++ b/drivers/leds/leds-88pm860x.c
@@ -118,9 +118,9 @@ static int pm860x_led_dt_init(struct platform_device *pdev,
 	struct device_node *nproot, *np;
 	int iset = 0;
 
-	if (!pdev->dev.parent->of_node)
+	if (!dev_of_node(pdev->dev.parent))
 		return -ENODEV;
-	nproot = of_get_child_by_name(pdev->dev.parent->of_node, "leds");
+	nproot = of_get_child_by_name(dev_of_node(pdev->dev.parent), "leds");
 	if (!nproot) {
 		dev_err(&pdev->dev, "failed to find leds node\n");
 		return -ENODEV;
diff --git a/drivers/leds/leds-aat1290.c b/drivers/leds/leds-aat1290.c
index c78a29ab8e9fb..88cc5edabb581 100644
--- a/drivers/leds/leds-aat1290.c
+++ b/drivers/leds/leds-aat1290.c
@@ -248,7 +248,7 @@ static int aat1290_led_parse_dt(struct aat1290_led *led,
 	}
 #endif
 
-	child_node = of_get_next_available_child(dev->of_node, NULL);
+	child_node = of_get_next_available_child(dev_of_node(dev), NULL);
 	if (!child_node) {
 		dev_err(dev, "No DT child node found for connected LED.\n");
 		return -EINVAL;
diff --git a/drivers/leds/leds-an30259a.c b/drivers/leds/leds-an30259a.c
index 82350a28a5644..8ec23ccd02d69 100644
--- a/drivers/leds/leds-an30259a.c
+++ b/drivers/leds/leds-an30259a.c
@@ -202,7 +202,7 @@ static int an30259a_blink_set(struct led_classdev *cdev,
 static int an30259a_dt_init(struct i2c_client *client,
 			    struct an30259a *chip)
 {
-	struct device_node *np = client->dev.of_node, *child;
+	struct device_node *np = dev_of_node(&client->dev), *child;
 	int count, ret;
 	int i = 0;
 	const char *str;
diff --git a/drivers/leds/leds-aw2013.c b/drivers/leds/leds-aw2013.c
index d709cc1f949e3..3aeed4f68a8a3 100644
--- a/drivers/leds/leds-aw2013.c
+++ b/drivers/leds/leds-aw2013.c
@@ -261,7 +261,7 @@ static int aw2013_blink_set(struct led_classdev *cdev,
 
 static int aw2013_probe_dt(struct aw2013 *chip)
 {
-	struct device_node *np = chip->client->dev.of_node, *child;
+	struct device_node *np = dev_of_node(&chip->client->dev), *child;
 	int count, ret = 0, i = 0;
 	struct aw2013_led *led;
 
diff --git a/drivers/leds/leds-bcm6328.c b/drivers/leds/leds-bcm6328.c
index 65a3857efa4ed..c73097758e353 100644
--- a/drivers/leds/leds-bcm6328.c
+++ b/drivers/leds/leds-bcm6328.c
@@ -395,7 +395,7 @@ static int bcm6328_led(struct device *dev, struct device_node *nc, u32 reg,
 static int bcm6328_leds_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct device_node *np = pdev->dev.of_node;
+	struct device_node *np = dev_of_node(&pdev->dev);
 	struct device_node *child;
 	void __iomem *mem;
 	spinlock_t *lock; /* memory lock */
diff --git a/drivers/leds/leds-bcm6358.c b/drivers/leds/leds-bcm6358.c
index 44fd1ba4be57e..289dfc412eda4 100644
--- a/drivers/leds/leds-bcm6358.c
+++ b/drivers/leds/leds-bcm6358.c
@@ -149,7 +149,7 @@ static int bcm6358_led(struct device *dev, struct device_node *nc, u32 reg,
 static int bcm6358_leds_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct device_node *np = pdev->dev.of_node;
+	struct device_node *np = dev_of_node(&pdev->dev);
 	struct device_node *child;
 	void __iomem *mem;
 	spinlock_t *lock; /* memory lock */
diff --git a/drivers/leds/leds-is31fl319x.c b/drivers/leds/leds-is31fl319x.c
index b039ffa33559c..e6d185ad0b7e6 100644
--- a/drivers/leds/leds-is31fl319x.c
+++ b/drivers/leds/leds-is31fl319x.c
@@ -202,7 +202,7 @@ static int is31fl319x_parse_child_dt(const struct device *dev,
 static int is31fl319x_parse_dt(struct device *dev,
 			       struct is31fl319x_chip *is31)
 {
-	struct device_node *np = dev->of_node, *child;
+	struct device_node *np = dev_of_node(dev), *child;
 	int count;
 	int ret;
 
diff --git a/drivers/leds/leds-is31fl32xx.c b/drivers/leds/leds-is31fl32xx.c
index 408eb5fad4cb0..e0af75475e24b 100644
--- a/drivers/leds/leds-is31fl32xx.c
+++ b/drivers/leds/leds-is31fl32xx.c
@@ -372,7 +372,7 @@ static int is31fl32xx_parse_dt(struct device *dev,
 	struct device_node *child;
 	int ret = 0;
 
-	for_each_child_of_node(dev->of_node, child) {
+	for_each_child_of_node(dev_of_node(dev), child) {
 		struct is31fl32xx_led_data *led_data =
 			&priv->leds[priv->num_leds];
 		const struct is31fl32xx_led_data *other_led_data;
@@ -435,7 +435,7 @@ static int is31fl32xx_probe(struct i2c_client *client,
 
 	cdef = device_get_match_data(dev);
 
-	count = of_get_child_count(dev->of_node);
+	count = of_get_child_count(dev_of_node(dev));
 	if (!count)
 		return -EINVAL;
 
diff --git a/drivers/leds/leds-ktd2692.c b/drivers/leds/leds-ktd2692.c
index 63917db8cac39..846c6ecf1a5b0 100644
--- a/drivers/leds/leds-ktd2692.c
+++ b/drivers/leds/leds-ktd2692.c
@@ -259,11 +259,11 @@ static void ktd2692_setup(struct ktd2692_context *led)
 static int ktd2692_parse_dt(struct ktd2692_context *led, struct device *dev,
 			    struct ktd2692_led_config_data *cfg)
 {
-	struct device_node *np = dev->of_node;
+	struct device_node *np = dev_of_node(dev);
 	struct device_node *child_node;
 	int ret;
 
-	if (!dev->of_node)
+	if (!dev_of_node(dev))
 		return -ENXIO;
 
 	led->ctrl_gpio = devm_gpiod_get(dev, "ctrl", GPIOD_ASIS);
diff --git a/drivers/leds/leds-lp5521.c b/drivers/leds/leds-lp5521.c
index ef8c3bfa8f3c4..a9e7507c998cd 100644
--- a/drivers/leds/leds-lp5521.c
+++ b/drivers/leds/leds-lp5521.c
@@ -523,7 +523,7 @@ static int lp5521_probe(struct i2c_client *client,
 	struct lp55xx_chip *chip;
 	struct lp55xx_led *led;
 	struct lp55xx_platform_data *pdata = dev_get_platdata(&client->dev);
-	struct device_node *np = client->dev.of_node;
+	struct device_node *np = dev_of_node(&client->dev);
 
 	chip = devm_kzalloc(&client->dev, sizeof(*chip), GFP_KERNEL);
 	if (!chip)
diff --git a/drivers/leds/leds-lp5523.c b/drivers/leds/leds-lp5523.c
index f55d97258d5e7..fc433e63b1dc0 100644
--- a/drivers/leds/leds-lp5523.c
+++ b/drivers/leds/leds-lp5523.c
@@ -891,7 +891,7 @@ static int lp5523_probe(struct i2c_client *client,
 	struct lp55xx_chip *chip;
 	struct lp55xx_led *led;
 	struct lp55xx_platform_data *pdata = dev_get_platdata(&client->dev);
-	struct device_node *np = client->dev.of_node;
+	struct device_node *np = dev_of_node(&client->dev);
 
 	chip = devm_kzalloc(&client->dev, sizeof(*chip), GFP_KERNEL);
 	if (!chip)
diff --git a/drivers/leds/leds-lp5562.c b/drivers/leds/leds-lp5562.c
index 7ecdd199d7efc..31c14016d2896 100644
--- a/drivers/leds/leds-lp5562.c
+++ b/drivers/leds/leds-lp5562.c
@@ -518,7 +518,7 @@ static int lp5562_probe(struct i2c_client *client,
 	struct lp55xx_chip *chip;
 	struct lp55xx_led *led;
 	struct lp55xx_platform_data *pdata = dev_get_platdata(&client->dev);
-	struct device_node *np = client->dev.of_node;
+	struct device_node *np = dev_of_node(&client->dev);
 
 	chip = devm_kzalloc(&client->dev, sizeof(*chip), GFP_KERNEL);
 	if (!chip)
diff --git a/drivers/leds/leds-lp8501.c b/drivers/leds/leds-lp8501.c
index ac2c31db4a65c..2d2fda2ab1046 100644
--- a/drivers/leds/leds-lp8501.c
+++ b/drivers/leds/leds-lp8501.c
@@ -306,7 +306,7 @@ static int lp8501_probe(struct i2c_client *client,
 	struct lp55xx_chip *chip;
 	struct lp55xx_led *led;
 	struct lp55xx_platform_data *pdata = dev_get_platdata(&client->dev);
-	struct device_node *np = client->dev.of_node;
+	struct device_node *np = dev_of_node(&client->dev);
 
 	chip = devm_kzalloc(&client->dev, sizeof(*chip), GFP_KERNEL);
 	if (!chip)
diff --git a/drivers/leds/leds-lp8860.c b/drivers/leds/leds-lp8860.c
index 6eb323212da3c..b69ed81d52ab4 100644
--- a/drivers/leds/leds-lp8860.c
+++ b/drivers/leds/leds-lp8860.c
@@ -380,7 +380,7 @@ static int lp8860_probe(struct i2c_client *client,
 {
 	int ret;
 	struct lp8860_led *led;
-	struct device_node *np = client->dev.of_node;
+	struct device_node *np = dev_of_node(&client->dev);
 	struct device_node *child_node;
 	struct led_init_data init_data = {};
 
diff --git a/drivers/leds/leds-lt3593.c b/drivers/leds/leds-lt3593.c
index 9079850e6ea44..c2d7ffebacc56 100644
--- a/drivers/leds/leds-lt3593.c
+++ b/drivers/leds/leds-lt3593.c
@@ -68,7 +68,7 @@ static int lt3593_led_probe(struct platform_device *pdev)
 	struct led_init_data init_data = {};
 	const char *tmp;
 
-	if (!dev->of_node)
+	if (!dev_of_node(dev))
 		return -ENODEV;
 
 	led_data = devm_kzalloc(dev, sizeof(*led_data), GFP_KERNEL);
diff --git a/drivers/leds/leds-max77693.c b/drivers/leds/leds-max77693.c
index 1d8e2ffe7ad46..2baac552a74d4 100644
--- a/drivers/leds/leds-max77693.c
+++ b/drivers/leds/leds-max77693.c
@@ -599,7 +599,7 @@ static int max77693_led_parse_dt(struct max77693_led_device *led,
 {
 	struct device *dev = &led->pdev->dev;
 	struct max77693_sub_led *sub_leds = led->sub_leds;
-	struct device_node *node = dev->of_node, *child_node;
+	struct device_node *node = dev_of_node(dev), *child_node;
 	struct property *prop;
 	u32 led_sources[2];
 	int i, ret, fled_id;
diff --git a/drivers/leds/leds-mc13783.c b/drivers/leds/leds-mc13783.c
index 5cd810c545f3e..ee37f4a2d65b4 100644
--- a/drivers/leds/leds-mc13783.c
+++ b/drivers/leds/leds-mc13783.c
@@ -121,7 +121,7 @@ static struct mc13xxx_leds_platform_data __init *mc13xxx_led_probe_dt(
 	if (!pdata)
 		return ERR_PTR(-ENOMEM);
 
-	parent = of_get_child_by_name(dev->parent->of_node, "leds");
+	parent = of_get_child_by_name(dev_of_node(dev->parent), "leds");
 	if (!parent)
 		goto out_node_put;
 
@@ -192,7 +192,7 @@ static int __init mc13xxx_led_probe(struct platform_device *pdev)
 	leds->master = mcdev;
 	platform_set_drvdata(pdev, leds);
 
-	if (dev->parent->of_node) {
+	if (dev_of_node(dev->parent)) {
 		pdata = mc13xxx_led_probe_dt(pdev);
 		if (IS_ERR(pdata))
 			return PTR_ERR(pdata);
diff --git a/drivers/leds/leds-mt6323.c b/drivers/leds/leds-mt6323.c
index 80b57a39445cb..2c46b75030358 100644
--- a/drivers/leds/leds-mt6323.c
+++ b/drivers/leds/leds-mt6323.c
@@ -369,7 +369,7 @@ static int mt6323_led_set_dt_default(struct led_classdev *cdev,
 static int mt6323_led_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct device_node *np = pdev->dev.of_node;
+	struct device_node *np = dev_of_node(&pdev->dev);
 	struct device_node *child;
 	struct mt6397_chip *hw = dev_get_drvdata(pdev->dev.parent);
 	struct mt6323_leds *leds;
diff --git a/drivers/leds/leds-netxbig.c b/drivers/leds/leds-netxbig.c
index 7f3313e321fa6..578dd18b21e3b 100644
--- a/drivers/leds/leds-netxbig.c
+++ b/drivers/leds/leds-netxbig.c
@@ -419,7 +419,7 @@ static int netxbig_gpio_ext_get(struct device *dev,
 static int netxbig_leds_get_of_pdata(struct device *dev,
 				     struct netxbig_led_platform_data *pdata)
 {
-	struct device_node *np = dev->of_node;
+	struct device_node *np = dev_of_node(dev);
 	struct device_node *gpio_ext_np;
 	struct platform_device *gpio_ext_pdev;
 	struct device *gpio_ext_dev;
diff --git a/drivers/leds/leds-ns2.c b/drivers/leds/leds-ns2.c
index bd806e7c8017b..9cbd2d7251af9 100644
--- a/drivers/leds/leds-ns2.c
+++ b/drivers/leds/leds-ns2.c
@@ -246,7 +246,7 @@ static void delete_ns2_led(struct ns2_led_data *led_dat)
 static int
 ns2_leds_get_of_pdata(struct device *dev, struct ns2_led_platform_data *pdata)
 {
-	struct device_node *np = dev->of_node;
+	struct device_node *np = dev_of_node(dev);
 	struct device_node *child;
 	struct ns2_led *led, *leds;
 	int ret, num_leds = 0;
diff --git a/drivers/leds/leds-pca9532.c b/drivers/leds/leds-pca9532.c
index 7d515d5e57bd0..b1ae34e509588 100644
--- a/drivers/leds/leds-pca9532.c
+++ b/drivers/leds/leds-pca9532.c
@@ -507,7 +507,7 @@ static int pca9532_probe(struct i2c_client *client,
 	struct pca9532_data *data = i2c_get_clientdata(client);
 	struct pca9532_platform_data *pca9532_pdata =
 			dev_get_platdata(&client->dev);
-	struct device_node *np = client->dev.of_node;
+	struct device_node *np = dev_of_node(&client->dev);
 
 	if (!pca9532_pdata) {
 		if (np) {
diff --git a/drivers/leds/leds-pm8058.c b/drivers/leds/leds-pm8058.c
index d9e8ea80cd167..dcd7d8c3d6b44 100644
--- a/drivers/leds/leds-pm8058.c
+++ b/drivers/leds/leds-pm8058.c
@@ -88,7 +88,7 @@ static enum led_brightness pm8058_led_get(struct led_classdev *cled)
 static int pm8058_led_probe(struct platform_device *pdev)
 {
 	struct pm8058_led *led;
-	struct device_node *np = pdev->dev.of_node;
+	struct device_node *np = dev_of_node(&pdev->dev);
 	int ret;
 	struct regmap *map;
 	const char *state;
diff --git a/drivers/leds/leds-sc27xx-bltc.c b/drivers/leds/leds-sc27xx-bltc.c
index 3401ad389c8d9..7ba09e0140739 100644
--- a/drivers/leds/leds-sc27xx-bltc.c
+++ b/drivers/leds/leds-sc27xx-bltc.c
@@ -276,7 +276,7 @@ static int sc27xx_led_register(struct device *dev, struct sc27xx_led_priv *priv)
 static int sc27xx_led_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct device_node *np = dev->of_node, *child;
+	struct device_node *np = dev_of_node(dev), *child;
 	struct sc27xx_led_priv *priv;
 	u32 base, count, reg;
 	int err;
diff --git a/drivers/leds/leds-spi-byte.c b/drivers/leds/leds-spi-byte.c
index 21ec02c4f8dac..8535c6b1aebec 100644
--- a/drivers/leds/leds-spi-byte.c
+++ b/drivers/leds/leds-spi-byte.c
@@ -87,11 +87,11 @@ static int spi_byte_probe(struct spi_device *spi)
 	const char *state;
 	int ret;
 
-	if (of_get_child_count(dev->of_node) != 1) {
+	if (of_get_child_count(dev_of_node(dev)) != 1) {
 		dev_err(dev, "Device must have exactly one LED sub-node.");
 		return -EINVAL;
 	}
-	child = of_get_next_child(dev->of_node, NULL);
+	child = of_get_next_child(dev_of_node(dev), NULL);
 
 	led = devm_kzalloc(dev, sizeof(*led), GFP_KERNEL);
 	if (!led)
diff --git a/drivers/leds/leds-syscon.c b/drivers/leds/leds-syscon.c
index b56a5c82bf759..0c9b2c4fecbf3 100644
--- a/drivers/leds/leds-syscon.c
+++ b/drivers/leds/leds-syscon.c
@@ -56,7 +56,7 @@ static void syscon_led_set(struct led_classdev *led_cdev,
 static int syscon_led_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct device_node *np = dev->of_node;
+	struct device_node *np = dev_of_node(dev);
 	struct device *parent;
 	struct regmap *map;
 	struct syscon_led *sled;
@@ -68,7 +68,7 @@ static int syscon_led_probe(struct platform_device *pdev)
 		dev_err(dev, "no parent for syscon LED\n");
 		return -ENODEV;
 	}
-	map = syscon_node_to_regmap(parent->of_node);
+	map = syscon_node_to_regmap(dev_of_node(parent));
 	if (IS_ERR(map)) {
 		dev_err(dev, "no regmap for syscon LED parent\n");
 		return PTR_ERR(map);
diff --git a/drivers/leds/leds-tca6507.c b/drivers/leds/leds-tca6507.c
index 1128ac75443c0..d44b64af6d6e7 100644
--- a/drivers/leds/leds-tca6507.c
+++ b/drivers/leds/leds-tca6507.c
@@ -656,7 +656,7 @@ static int tca6507_probe_gpios(struct i2c_client *client,
 	tca->gpio.set = tca6507_gpio_set_value;
 	tca->gpio.parent = &client->dev;
 #ifdef CONFIG_OF_GPIO
-	tca->gpio.of_node = of_node_get(client->dev.of_node);
+	tca->gpio.of_node = of_node_get(dev_of_node(&client->dev));
 #endif
 	err = gpiochip_add_data(&tca->gpio, tca);
 	if (err) {
@@ -689,7 +689,7 @@ static void tca6507_remove_gpio(struct tca6507_chip *tca)
 static struct tca6507_platform_data *
 tca6507_led_dt_init(struct i2c_client *client)
 {
-	struct device_node *np = client->dev.of_node, *child;
+	struct device_node *np = dev_of_node(&client->dev), *child;
 	struct tca6507_platform_data *pdata;
 	struct led_info *tca_leds;
 	int count;
diff --git a/drivers/leds/leds-tlc591xx.c b/drivers/leds/leds-tlc591xx.c
index aeedf1aa62976..f4d5785f0068f 100644
--- a/drivers/leds/leds-tlc591xx.c
+++ b/drivers/leds/leds-tlc591xx.c
@@ -148,7 +148,7 @@ static int
 tlc591xx_probe(struct i2c_client *client,
 	       const struct i2c_device_id *id)
 {
-	struct device_node *np = client->dev.of_node, *child;
+	struct device_node *np = dev_of_node(&client->dev), *child;
 	struct device *dev = &client->dev;
 	const struct tlc591xx *tlc591xx;
 	struct tlc591xx_priv *priv;
diff --git a/drivers/leds/leds-turris-omnia.c b/drivers/leds/leds-turris-omnia.c
index 2a69d2085a225..b2add494af14d 100644
--- a/drivers/leds/leds-turris-omnia.c
+++ b/drivers/leds/leds-turris-omnia.c
@@ -210,7 +210,7 @@ static int omnia_leds_probe(struct i2c_client *client,
 			    const struct i2c_device_id *id)
 {
 	struct device *dev = &client->dev;
-	struct device_node *np = dev->of_node, *child;
+	struct device_node *np = dev_of_node(dev), *child;
 	struct omnia_leds *leds;
 	struct omnia_led *led;
 	int ret, count;
-- 
2.26.2

