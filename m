Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E34391041F0
	for <lists+linux-leds@lfdr.de>; Wed, 20 Nov 2019 18:18:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728030AbfKTRSf (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 20 Nov 2019 12:18:35 -0500
Received: from foss.arm.com ([217.140.110.172]:43416 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730674AbfKTRSf (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Wed, 20 Nov 2019 12:18:35 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D969B12FC;
        Wed, 20 Nov 2019 09:18:34 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 53F503F703;
        Wed, 20 Nov 2019 09:18:34 -0800 (PST)
Date:   Wed, 20 Nov 2019 17:18:32 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Sven Van Asbroeck <thesven73@gmail.com>
Cc:     Axel Lin <axel.lin@ingics.com>, Dan Murphy <dmurphy@ti.com>,
        devicetree@vger.kernel.org, Grigoryev Denis <grigoryev@fastwel.ru>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        Mark Brown <broonie@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Sven Van Asbroeck <TheSven73@gmail.com>
Subject: Applied "tps6105x: add optional devicetree support" to the regulator tree
In-Reply-To: <20191119154611.29625-2-TheSven73@gmail.com>
Message-Id: <applied-20191119154611.29625-2-TheSven73@gmail.com>
X-Patchwork-Hint: ignore
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

The patch

   tps6105x: add optional devicetree support

has been applied to the regulator tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-5.5

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From 62f7f3eca4c30064ab37b42d97cef4292d75fdd0 Mon Sep 17 00:00:00 2001
From: Sven Van Asbroeck <thesven73@gmail.com>
Date: Tue, 19 Nov 2019 10:46:08 -0500
Subject: [PATCH] tps6105x: add optional devicetree support

This driver currently requires platform data to specify the
operational mode and regulator init data (in case of regulator
mode).

Optionally specify the operational mode by looking at the name
of the devicetree child node.

Example: put chip in regulator mode:

i2c0 {
	tps61052@33 {
		compatible = "ti,tps61052";
		reg = <0x33>;

		regulator {
                            regulator-min-microvolt = <5000000>;
                            regulator-max-microvolt = <5000000>;
                            regulator-always-on;
		};
	};
};

Tree: linux-next
Signed-off-by: Sven Van Asbroeck <TheSven73@gmail.com>
Link: https://lore.kernel.org/r/20191119154611.29625-2-TheSven73@gmail.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/mfd/tps6105x.c | 34 +++++++++++++++++++++++++++++++---
 1 file changed, 31 insertions(+), 3 deletions(-)

diff --git a/drivers/mfd/tps6105x.c b/drivers/mfd/tps6105x.c
index 6ac3607a79c2..c906324d293e 100644
--- a/drivers/mfd/tps6105x.c
+++ b/drivers/mfd/tps6105x.c
@@ -91,6 +91,32 @@ static int tps6105x_add_device(struct tps6105x *tps6105x,
 			       PLATFORM_DEVID_AUTO, cell, 1, NULL, 0, NULL);
 }
 
+static struct tps6105x_platform_data *tps6105x_parse_dt(struct device *dev)
+{
+	struct device_node *np = dev->of_node;
+	struct tps6105x_platform_data *pdata;
+	struct device_node *child;
+
+	if (!np)
+		return ERR_PTR(-EINVAL);
+	if (of_get_available_child_count(np) > 1) {
+		dev_err(dev, "cannot support multiple operational modes");
+		return ERR_PTR(-EINVAL);
+	}
+	pdata = devm_kzalloc(dev, sizeof(*pdata), GFP_KERNEL);
+	if (!pdata)
+		return ERR_PTR(-ENOMEM);
+	pdata->mode = TPS6105X_MODE_SHUTDOWN;
+	for_each_available_child_of_node(np, child) {
+		if (child->name && !of_node_cmp(child->name, "regulator"))
+			pdata->mode = TPS6105X_MODE_VOLTAGE;
+		else if (child->name && !of_node_cmp(child->name, "led"))
+			pdata->mode = TPS6105X_MODE_TORCH;
+	}
+
+	return pdata;
+}
+
 static int tps6105x_probe(struct i2c_client *client,
 			const struct i2c_device_id *id)
 {
@@ -99,9 +125,11 @@ static int tps6105x_probe(struct i2c_client *client,
 	int ret;
 
 	pdata = dev_get_platdata(&client->dev);
-	if (!pdata) {
-		dev_err(&client->dev, "missing platform data\n");
-		return -ENODEV;
+	if (!pdata)
+		pdata = tps6105x_parse_dt(&client->dev);
+	if (IS_ERR(pdata)) {
+		dev_err(&client->dev, "No platform data or DT found");
+		return PTR_ERR(pdata);
 	}
 
 	tps6105x = devm_kmalloc(&client->dev, sizeof(*tps6105x), GFP_KERNEL);
-- 
2.20.1

