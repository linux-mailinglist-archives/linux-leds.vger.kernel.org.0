Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CC8B71041F2
	for <lists+linux-leds@lfdr.de>; Wed, 20 Nov 2019 18:18:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730625AbfKTRSd (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 20 Nov 2019 12:18:33 -0500
Received: from foss.arm.com ([217.140.110.172]:43398 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728030AbfKTRSc (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Wed, 20 Nov 2019 12:18:32 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 59E851045;
        Wed, 20 Nov 2019 09:18:32 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CA63A3F703;
        Wed, 20 Nov 2019 09:18:31 -0800 (PST)
Date:   Wed, 20 Nov 2019 17:18:30 +0000
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
Subject: Applied "regulator: tps6105x: add optional devicetree support" to the regulator tree
In-Reply-To: <20191119154611.29625-3-TheSven73@gmail.com>
Message-Id: <applied-20191119154611.29625-3-TheSven73@gmail.com>
X-Patchwork-Hint: ignore
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

The patch

   regulator: tps6105x: add optional devicetree support

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

From f0a19fa823fb7b1f98d54b22a3ae0e5de88a1e50 Mon Sep 17 00:00:00 2001
From: Sven Van Asbroeck <thesven73@gmail.com>
Date: Tue, 19 Nov 2019 10:46:09 -0500
Subject: [PATCH] regulator: tps6105x: add optional devicetree support

Tell the regulator framework to retrieve regulator init
data from the 'regulator' subnode, or from the parent mfd
device's platform data.

Example:

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

Tree: next-20191118
Signed-off-by: Sven Van Asbroeck <TheSven73@gmail.com>
Link: https://lore.kernel.org/r/20191119154611.29625-3-TheSven73@gmail.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/regulator/tps6105x-regulator.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/regulator/tps6105x-regulator.c b/drivers/regulator/tps6105x-regulator.c
index 06059a94f7c6..f8939af0bd2c 100644
--- a/drivers/regulator/tps6105x-regulator.c
+++ b/drivers/regulator/tps6105x-regulator.c
@@ -37,6 +37,7 @@ static struct regulator_ops tps6105x_regulator_ops = {
 
 static const struct regulator_desc tps6105x_regulator_desc = {
 	.name		= "tps6105x-boost",
+	.of_match	= of_match_ptr("regulator"),
 	.ops		= &tps6105x_regulator_ops,
 	.type		= REGULATOR_VOLTAGE,
 	.id		= 0,
@@ -71,6 +72,7 @@ static int tps6105x_regulator_probe(struct platform_device *pdev)
 	config.dev = &tps6105x->client->dev;
 	config.init_data = pdata->regulator_data;
 	config.driver_data = tps6105x;
+	config.of_node = pdev->dev.parent->of_node;
 	config.regmap = tps6105x->regmap;
 
 	/* Register regulator with framework */
-- 
2.20.1

