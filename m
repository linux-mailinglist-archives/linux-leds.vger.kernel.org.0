Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62CEA378000
	for <lists+linux-leds@lfdr.de>; Mon, 10 May 2021 11:51:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230484AbhEJJwQ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 10 May 2021 05:52:16 -0400
Received: from fgw22-7.mail.saunalahti.fi ([62.142.5.83]:17159 "EHLO
        fgw22-7.mail.saunalahti.fi" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230489AbhEJJwO (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Mon, 10 May 2021 05:52:14 -0400
Received: from localhost (88-115-248-186.elisa-laajakaista.fi [88.115.248.186])
        by fgw22.mail.saunalahti.fi (Halon) with ESMTP
        id 3c2a7c16-b175-11eb-88cb-005056bdf889;
        Mon, 10 May 2021 12:51:04 +0300 (EEST)
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
To:     Pavel Machek <pavel@ucw.cz>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Amireddy Mallikarjuna reddy 
        <mallikarjunax.reddy@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>,
        Abanoub Sameh <abanoubsameh8@gmail.com>,
        Dan Murphy <dmurphy@ti.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: [PATCH v1 07/28] leds: lgm-sso: Fix clock handling
Date:   Mon, 10 May 2021 12:50:24 +0300
Message-Id: <20210510095045.3299382-8-andy.shevchenko@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210510095045.3299382-1-andy.shevchenko@gmail.com>
References: <20210510095045.3299382-1-andy.shevchenko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

The clock handling has a few issues:
 - when getting second clock fails, the first one left prepared and enabled
 - on ->remove() clocks are unprepared and disabled twice

Fix all these by converting to use bulk clock operations since both clocks
are mandatory.

Fixes: c3987cd2bca3 ("leds: lgm: Add LED controller driver for LGM SoC")
Cc: Amireddy Mallikarjuna reddy <mallikarjunax.reddy@linux.intel.com>
Signed-off-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---
 drivers/leds/blink/leds-lgm-sso.c | 44 ++++++++++++-------------------
 1 file changed, 17 insertions(+), 27 deletions(-)

diff --git a/drivers/leds/blink/leds-lgm-sso.c b/drivers/leds/blink/leds-lgm-sso.c
index 484f6831e6e7..6a6d75f07af0 100644
--- a/drivers/leds/blink/leds-lgm-sso.c
+++ b/drivers/leds/blink/leds-lgm-sso.c
@@ -133,8 +133,7 @@ struct sso_led_priv {
 	struct regmap *mmap;
 	struct device *dev;
 	struct platform_device *pdev;
-	struct clk *gclk;
-	struct clk *fpid_clk;
+	struct clk_bulk_data clocks[2];
 	u32 fpid_clkrate;
 	u32 gptc_clkrate;
 	u32 freq[MAX_FREQ_RANK];
@@ -766,12 +765,11 @@ static int sso_probe_gpios(struct sso_led_priv *priv)
 	return sso_gpio_gc_init(dev, priv);
 }
 
-static void sso_clk_disable(void *data)
+static void sso_clock_disable_unprepare(void *data)
 {
 	struct sso_led_priv *priv = data;
 
-	clk_disable_unprepare(priv->fpid_clk);
-	clk_disable_unprepare(priv->gclk);
+	clk_bulk_disable_unprepare(ARRAY_SIZE(priv->clocks), priv->clocks);
 }
 
 static int intel_sso_led_probe(struct platform_device *pdev)
@@ -788,36 +786,30 @@ static int intel_sso_led_probe(struct platform_device *pdev)
 	priv->dev = dev;
 
 	/* gate clock */
-	priv->gclk = devm_clk_get(dev, "sso");
-	if (IS_ERR(priv->gclk)) {
-		dev_err(dev, "get sso gate clock failed!\n");
-		return PTR_ERR(priv->gclk);
-	}
+	priv->clocks[0].id = "sso";
+
+	/* fpid clock */
+	priv->clocks[1].id = "fpid";
 
-	ret = clk_prepare_enable(priv->gclk);
+	ret = devm_clk_bulk_get(dev, ARRAY_SIZE(priv->clocks), priv->clocks);
 	if (ret) {
-		dev_err(dev, "Failed to prepare/enable sso gate clock!\n");
+		dev_err(dev, "Getting clocks failed!\n");
 		return ret;
 	}
 
-	priv->fpid_clk = devm_clk_get(dev, "fpid");
-	if (IS_ERR(priv->fpid_clk)) {
-		dev_err(dev, "Failed to get fpid clock!\n");
-		return PTR_ERR(priv->fpid_clk);
-	}
-
-	ret = clk_prepare_enable(priv->fpid_clk);
+	ret = clk_bulk_prepare_enable(ARRAY_SIZE(priv->clocks), priv->clocks);
 	if (ret) {
-		dev_err(dev, "Failed to prepare/enable fpid clock!\n");
+		dev_err(dev, "Failed to prepare and enable clocks!\n");
 		return ret;
 	}
-	priv->fpid_clkrate = clk_get_rate(priv->fpid_clk);
 
-	ret = devm_add_action_or_reset(dev, sso_clk_disable, priv);
-	if (ret) {
-		dev_err(dev, "Failed to devm_add_action_or_reset, %d\n", ret);
+	ret = devm_add_action_or_reset(dev, sso_clock_disable_unprepare, priv);
+	if (ret)
 		return ret;
-	}
+
+	priv->fpid_clkrate = clk_get_rate(priv->clocks[1].clk);
+
+	priv->mmap = syscon_node_to_regmap(dev->of_node);
 
 	priv->mmap = syscon_node_to_regmap(dev->of_node);
 	if (IS_ERR(priv->mmap)) {
@@ -862,8 +854,6 @@ static int intel_sso_led_remove(struct platform_device *pdev)
 		sso_led_shutdown(led);
 	}
 
-	clk_disable_unprepare(priv->fpid_clk);
-	clk_disable_unprepare(priv->gclk);
 	regmap_exit(priv->mmap);
 
 	return 0;
-- 
2.31.1

