Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B1E026E8F0
	for <lists+linux-leds@lfdr.de>; Fri, 18 Sep 2020 00:36:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726867AbgIQWgj (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 17 Sep 2020 18:36:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726183AbgIQWeA (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 17 Sep 2020 18:34:00 -0400
Received: from mail.nic.cz (lists.nic.cz [IPv6:2001:1488:800:400::400])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D195C061756;
        Thu, 17 Sep 2020 15:33:57 -0700 (PDT)
Received: from dellmb.labs.office.nic.cz (unknown [IPv6:2001:1488:fffe:6:cac7:3539:7f1f:463])
        by mail.nic.cz (Postfix) with ESMTP id 6BD70140A87;
        Fri, 18 Sep 2020 00:33:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
        t=1600382034; bh=6eWJm2oBbeCebgSrpt4HIcHW5NzY8PFx99U9aOqzJrg=;
        h=From:To:Date;
        b=vBAmfVk4nRjbqx9NHx+J5CgzIIPxigQdkteay5p9mnHjg+eju/rLmvvBNaSyLPkhx
         7SuyPTgyM1vHHW+SOO21LNLRO786gYzaIi1Rtj5Uf9P/gx1LFQqXJ0CIS3CcqQnJlI
         mB0UGcksJTv8yWusuhfwvJORtojvIuOwi3SbhMic=
From:   =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>
To:     linux-leds@vger.kernel.org
Cc:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        =?UTF-8?q?Ond=C5=99ej=20Jirman?= <megous@megous.com>,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org,
        =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>,
        Andrew Lunn <andrew@lunn.ch>,
        Andrey Utkin <andrey_utkin@fastmail.com>,
        Baolin Wang <baolin.wang7@gmail.com>,
        Baolin Wang <baolin.wang@linaro.org>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Christian Mauderer <oss@c-mauderer.de>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        David Rivshin <drivshin@allworx.com>,
        Haojian Zhuang <haojian.zhuang@marvell.com>,
        "H . Nikolaus Schaller" <hns@goldelico.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Milo Kim <milo.kim@ti.com>, NeilBrown <neilb@suse.de>,
        Nikita Travkin <nikitos.tr@gmail.com>,
        Orson Zhai <orsonzhai@gmail.com>,
        Paul Mackerras <paulus@samba.org>,
        Philippe Retornaz <philippe.retornaz@epfl.ch>,
        Riku Voipio <riku.voipio@iki.fi>,
        Simon Guinot <sguinot@lacie.com>,
        Simon Shields <simon@lineageos.org>,
        Vasant Hegde <hegdevasant@linux.vnet.ibm.com>,
        Xiaotong Lu <xiaotong.lu@spreadtrum.com>
Subject: [PATCH leds v2 08/50] leds: various: use only available OF children
Date:   Fri, 18 Sep 2020 00:32:56 +0200
Message-Id: <20200917223338.14164-9-marek.behun@nic.cz>
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

Various drivers count and iterate over OF children nodes via
of_get_child_count and for_each_child_of_node. Instead they should use
of_get_available_child_count and for_each_available_child_of_node, so
that if a given node has the `status` property set to `disabled`, the
child will be ignored.

Signed-off-by: Marek Behún <marek.behun@nic.cz>
Cc: Andrew Lunn <andrew@lunn.ch>
Cc: Andrey Utkin <andrey_utkin@fastmail.com>
Cc: Baolin Wang <baolin.wang7@gmail.com>
Cc: Baolin Wang <baolin.wang@linaro.org>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Christian Mauderer <oss@c-mauderer.de>
Cc: Chunyan Zhang <zhang.lyra@gmail.com>
Cc: Dan Murphy <dmurphy@ti.com>
Cc: David Rivshin <drivshin@allworx.com>
Cc: Haojian Zhuang <haojian.zhuang@marvell.com>
Cc: H. Nikolaus Schaller <hns@goldelico.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Milo Kim <milo.kim@ti.com>
Cc: NeilBrown <neilb@suse.de>
Cc: Nikita Travkin <nikitos.tr@gmail.com>
Cc: Orson Zhai <orsonzhai@gmail.com>
Cc: Paul Mackerras <paulus@samba.org>
Cc: Philippe Retornaz <philippe.retornaz@epfl.ch>
Cc: Riku Voipio <riku.voipio@iki.fi>
Cc: Simon Guinot <sguinot@lacie.com>
Cc: Simon Shields <simon@lineageos.org>
Cc: Vasant Hegde <hegdevasant@linux.vnet.ibm.com>
Cc: Xiaotong Lu <xiaotong.lu@spreadtrum.com>
---
 drivers/leds/leds-88pm860x.c      | 2 +-
 drivers/leds/leds-an30259a.c      | 2 +-
 drivers/leds/leds-aw2013.c        | 2 +-
 drivers/leds/leds-is31fl319x.c    | 4 ++--
 drivers/leds/leds-is31fl32xx.c    | 4 ++--
 drivers/leds/leds-lp55xx-common.c | 6 +++---
 drivers/leds/leds-mc13783.c       | 4 ++--
 drivers/leds/leds-netxbig.c       | 4 ++--
 drivers/leds/leds-ns2.c           | 4 ++--
 drivers/leds/leds-pca9532.c       | 2 +-
 drivers/leds/leds-powernv.c       | 2 +-
 drivers/leds/leds-sc27xx-bltc.c   | 4 ++--
 drivers/leds/leds-spi-byte.c      | 4 ++--
 drivers/leds/leds-tca6507.c       | 4 ++--
 drivers/leds/leds-tlc591xx.c      | 4 ++--
 15 files changed, 26 insertions(+), 26 deletions(-)

diff --git a/drivers/leds/leds-88pm860x.c b/drivers/leds/leds-88pm860x.c
index 2d1b3269e0f7f..508d0d859f2e0 100644
--- a/drivers/leds/leds-88pm860x.c
+++ b/drivers/leds/leds-88pm860x.c
@@ -125,7 +125,7 @@ static int pm860x_led_dt_init(struct platform_device *pdev,
 		dev_err(&pdev->dev, "failed to find leds node\n");
 		return -ENODEV;
 	}
-	for_each_child_of_node(nproot, np) {
+	for_each_available_child_of_node(nproot, np) {
 		if (of_node_name_eq(np, data->name)) {
 			of_property_read_u32(np, "marvell,88pm860x-iset",
 					     &iset);
diff --git a/drivers/leds/leds-an30259a.c b/drivers/leds/leds-an30259a.c
index 8ec23ccd02d69..9749f1cc3e15f 100644
--- a/drivers/leds/leds-an30259a.c
+++ b/drivers/leds/leds-an30259a.c
@@ -208,7 +208,7 @@ static int an30259a_dt_init(struct i2c_client *client,
 	const char *str;
 	struct an30259a_led *led;
 
-	count = of_get_child_count(np);
+	count = of_get_available_child_count(np);
 	if (!count || count > AN30259A_MAX_LEDS)
 		return -EINVAL;
 
diff --git a/drivers/leds/leds-aw2013.c b/drivers/leds/leds-aw2013.c
index 3aeed4f68a8a3..9df7de042bca2 100644
--- a/drivers/leds/leds-aw2013.c
+++ b/drivers/leds/leds-aw2013.c
@@ -265,7 +265,7 @@ static int aw2013_probe_dt(struct aw2013 *chip)
 	int count, ret = 0, i = 0;
 	struct aw2013_led *led;
 
-	count = of_get_child_count(np);
+	count = of_get_available_child_count(np);
 	if (!count || count > AW2013_MAX_LEDS)
 		return -EINVAL;
 
diff --git a/drivers/leds/leds-is31fl319x.c b/drivers/leds/leds-is31fl319x.c
index e6d185ad0b7e6..4161b9dd7e488 100644
--- a/drivers/leds/leds-is31fl319x.c
+++ b/drivers/leds/leds-is31fl319x.c
@@ -220,7 +220,7 @@ static int is31fl319x_parse_dt(struct device *dev,
 
 	is31->cdef = device_get_match_data(dev);
 
-	count = of_get_child_count(np);
+	count = of_get_available_child_count(np);
 
 	dev_dbg(dev, "probing with %d leds defined in DT\n", count);
 
@@ -230,7 +230,7 @@ static int is31fl319x_parse_dt(struct device *dev,
 		return -ENODEV;
 	}
 
-	for_each_child_of_node(np, child) {
+	for_each_available_child_of_node(np, child) {
 		struct is31fl319x_led *led;
 		u32 reg;
 
diff --git a/drivers/leds/leds-is31fl32xx.c b/drivers/leds/leds-is31fl32xx.c
index e0af75475e24b..7bacd01289770 100644
--- a/drivers/leds/leds-is31fl32xx.c
+++ b/drivers/leds/leds-is31fl32xx.c
@@ -372,7 +372,7 @@ static int is31fl32xx_parse_dt(struct device *dev,
 	struct device_node *child;
 	int ret = 0;
 
-	for_each_child_of_node(dev_of_node(dev), child) {
+	for_each_available_child_of_node(dev_of_node(dev), child) {
 		struct is31fl32xx_led_data *led_data =
 			&priv->leds[priv->num_leds];
 		const struct is31fl32xx_led_data *other_led_data;
@@ -435,7 +435,7 @@ static int is31fl32xx_probe(struct i2c_client *client,
 
 	cdef = device_get_match_data(dev);
 
-	count = of_get_child_count(dev_of_node(dev));
+	count = of_get_available_child_count(dev_of_node(dev));
 	if (!count)
 		return -EINVAL;
 
diff --git a/drivers/leds/leds-lp55xx-common.c b/drivers/leds/leds-lp55xx-common.c
index 56210f4ad919a..50f7f5b874636 100644
--- a/drivers/leds/leds-lp55xx-common.c
+++ b/drivers/leds/leds-lp55xx-common.c
@@ -611,7 +611,7 @@ static int lp55xx_parse_multi_led(struct device_node *np,
 	struct device_node *child;
 	int num_colors = 0, ret;
 
-	for_each_child_of_node(np, child) {
+	for_each_available_child_of_node(np, child) {
 		ret = lp55xx_parse_multi_led_child(child, cfg, child_number,
 						   num_colors);
 		if (ret)
@@ -665,7 +665,7 @@ struct lp55xx_platform_data *lp55xx_of_populate_pdata(struct device *dev,
 	if (!pdata)
 		return ERR_PTR(-ENOMEM);
 
-	num_channels = of_get_child_count(np);
+	num_channels = of_get_available_child_count(np);
 	if (num_channels == 0) {
 		dev_err(dev, "no LED channels\n");
 		return ERR_PTR(-EINVAL);
@@ -679,7 +679,7 @@ struct lp55xx_platform_data *lp55xx_of_populate_pdata(struct device *dev,
 	pdata->num_channels = num_channels;
 	cfg->max_channel = chip->cfg->max_channel;
 
-	for_each_child_of_node(np, child) {
+	for_each_available_child_of_node(np, child) {
 		ret = lp55xx_parse_logical_led(child, cfg, i);
 		if (ret)
 			return ERR_PTR(-EINVAL);
diff --git a/drivers/leds/leds-mc13783.c b/drivers/leds/leds-mc13783.c
index ee37f4a2d65b4..675502c15c2b4 100644
--- a/drivers/leds/leds-mc13783.c
+++ b/drivers/leds/leds-mc13783.c
@@ -131,7 +131,7 @@ static struct mc13xxx_leds_platform_data __init *mc13xxx_led_probe_dt(
 	if (ret)
 		goto out_node_put;
 
-	pdata->num_leds = of_get_child_count(parent);
+	pdata->num_leds = of_get_available_child_count(parent);
 
 	pdata->led = devm_kcalloc(dev, pdata->num_leds, sizeof(*pdata->led),
 				  GFP_KERNEL);
@@ -140,7 +140,7 @@ static struct mc13xxx_leds_platform_data __init *mc13xxx_led_probe_dt(
 		goto out_node_put;
 	}
 
-	for_each_child_of_node(parent, child) {
+	for_each_available_child_of_node(parent, child) {
 		const char *str;
 		u32 tmp;
 
diff --git a/drivers/leds/leds-netxbig.c b/drivers/leds/leds-netxbig.c
index 578dd18b21e3b..f41e176cf6c49 100644
--- a/drivers/leds/leds-netxbig.c
+++ b/drivers/leds/leds-netxbig.c
@@ -485,7 +485,7 @@ static int netxbig_leds_get_of_pdata(struct device *dev,
 	}
 
 	/* LEDs */
-	num_leds = of_get_child_count(np);
+	num_leds = of_get_available_child_count(np);
 	if (!num_leds) {
 		dev_err(dev, "No LED subnodes found in DT\n");
 		return -ENODEV;
@@ -496,7 +496,7 @@ static int netxbig_leds_get_of_pdata(struct device *dev,
 		return -ENOMEM;
 
 	led = leds;
-	for_each_child_of_node(np, child) {
+	for_each_available_child_of_node(np, child) {
 		const char *string;
 		int *mode_val;
 		int num_modes;
diff --git a/drivers/leds/leds-ns2.c b/drivers/leds/leds-ns2.c
index 9cbd2d7251af9..22d38c83b6dca 100644
--- a/drivers/leds/leds-ns2.c
+++ b/drivers/leds/leds-ns2.c
@@ -251,7 +251,7 @@ ns2_leds_get_of_pdata(struct device *dev, struct ns2_led_platform_data *pdata)
 	struct ns2_led *led, *leds;
 	int ret, num_leds = 0;
 
-	num_leds = of_get_child_count(np);
+	num_leds = of_get_available_child_count(np);
 	if (!num_leds)
 		return -ENODEV;
 
@@ -261,7 +261,7 @@ ns2_leds_get_of_pdata(struct device *dev, struct ns2_led_platform_data *pdata)
 		return -ENOMEM;
 
 	led = leds;
-	for_each_child_of_node(np, child) {
+	for_each_available_child_of_node(np, child) {
 		const char *string;
 		int i, num_modes;
 		struct ns2_led_modval *modval;
diff --git a/drivers/leds/leds-pca9532.c b/drivers/leds/leds-pca9532.c
index b1ae34e509588..f834550999ddb 100644
--- a/drivers/leds/leds-pca9532.c
+++ b/drivers/leds/leds-pca9532.c
@@ -478,7 +478,7 @@ pca9532_of_populate_pdata(struct device *dev, struct device_node *np)
 	if (!pdata)
 		return ERR_PTR(-ENOMEM);
 
-	for_each_child_of_node(np, child) {
+	for_each_available_child_of_node(np, child) {
 		if (of_property_read_string(child, "label",
 					    &pdata->leds[i].name))
 			pdata->leds[i].name = child->name;
diff --git a/drivers/leds/leds-powernv.c b/drivers/leds/leds-powernv.c
index d803726300ff4..86f288425b2f6 100644
--- a/drivers/leds/leds-powernv.c
+++ b/drivers/leds/leds-powernv.c
@@ -250,7 +250,7 @@ static int powernv_led_classdev(struct platform_device *pdev,
 	struct powernv_led_data *powernv_led;
 	struct device *dev = &pdev->dev;
 
-	for_each_child_of_node(led_node, np) {
+	for_each_available_child_of_node(led_node, np) {
 		p = of_find_property(np, "led-types", NULL);
 
 		while ((cur = of_prop_next_string(p, cur)) != NULL) {
diff --git a/drivers/leds/leds-sc27xx-bltc.c b/drivers/leds/leds-sc27xx-bltc.c
index 7ba09e0140739..4947894056305 100644
--- a/drivers/leds/leds-sc27xx-bltc.c
+++ b/drivers/leds/leds-sc27xx-bltc.c
@@ -281,7 +281,7 @@ static int sc27xx_led_probe(struct platform_device *pdev)
 	u32 base, count, reg;
 	int err;
 
-	count = of_get_child_count(np);
+	count = of_get_available_child_count(np);
 	if (!count || count > SC27XX_LEDS_MAX)
 		return -EINVAL;
 
@@ -305,7 +305,7 @@ static int sc27xx_led_probe(struct platform_device *pdev)
 		return err;
 	}
 
-	for_each_child_of_node(np, child) {
+	for_each_available_child_of_node(np, child) {
 		err = of_property_read_u32(child, "reg", &reg);
 		if (err) {
 			of_node_put(child);
diff --git a/drivers/leds/leds-spi-byte.c b/drivers/leds/leds-spi-byte.c
index 8535c6b1aebec..49909a68e4987 100644
--- a/drivers/leds/leds-spi-byte.c
+++ b/drivers/leds/leds-spi-byte.c
@@ -87,11 +87,11 @@ static int spi_byte_probe(struct spi_device *spi)
 	const char *state;
 	int ret;
 
-	if (of_get_child_count(dev_of_node(dev)) != 1) {
+	if (of_get_available_child_count(dev_of_node(dev)) != 1) {
 		dev_err(dev, "Device must have exactly one LED sub-node.");
 		return -EINVAL;
 	}
-	child = of_get_next_child(dev_of_node(dev), NULL);
+	child = of_get_next_available_child(dev_of_node(dev), NULL);
 
 	led = devm_kzalloc(dev, sizeof(*led), GFP_KERNEL);
 	if (!led)
diff --git a/drivers/leds/leds-tca6507.c b/drivers/leds/leds-tca6507.c
index d44b64af6d6e7..a7e9fd85b6dd5 100644
--- a/drivers/leds/leds-tca6507.c
+++ b/drivers/leds/leds-tca6507.c
@@ -694,7 +694,7 @@ tca6507_led_dt_init(struct i2c_client *client)
 	struct led_info *tca_leds;
 	int count;
 
-	count = of_get_child_count(np);
+	count = of_get_available_child_count(np);
 	if (!count || count > NUM_LEDS)
 		return ERR_PTR(-ENODEV);
 
@@ -703,7 +703,7 @@ tca6507_led_dt_init(struct i2c_client *client)
 	if (!tca_leds)
 		return ERR_PTR(-ENOMEM);
 
-	for_each_child_of_node(np, child) {
+	for_each_available_child_of_node(np, child) {
 		struct led_info led;
 		u32 reg;
 		int ret;
diff --git a/drivers/leds/leds-tlc591xx.c b/drivers/leds/leds-tlc591xx.c
index f4d5785f0068f..5e84a0c7aacbd 100644
--- a/drivers/leds/leds-tlc591xx.c
+++ b/drivers/leds/leds-tlc591xx.c
@@ -158,7 +158,7 @@ tlc591xx_probe(struct i2c_client *client,
 	if (!np)
 		return -ENODEV;
 
-	count = of_get_child_count(np);
+	count = of_get_available_child_count(np);
 	if (!count || count > tlc591xx->max_leds)
 		return -EINVAL;
 
@@ -180,7 +180,7 @@ tlc591xx_probe(struct i2c_client *client,
 	if (err < 0)
 		return err;
 
-	for_each_child_of_node(np, child) {
+	for_each_available_child_of_node(np, child) {
 		struct tlc591xx_led *led;
 		struct led_init_data init_data = {};
 
-- 
2.26.2

