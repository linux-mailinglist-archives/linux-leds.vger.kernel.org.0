Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E887931CD3B
	for <lists+linux-leds@lfdr.de>; Tue, 16 Feb 2021 16:53:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230218AbhBPPww (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 16 Feb 2021 10:52:52 -0500
Received: from mga03.intel.com ([134.134.136.65]:56586 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230017AbhBPPws (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Tue, 16 Feb 2021 10:52:48 -0500
IronPort-SDR: 6MWFD37tK38RrYykBOiUdINivz2yvqqon9My7ZfdNL6QGue42SErsfvh64HyfgxIVezC/womLm
 E3JU93KeXnig==
X-IronPort-AV: E=McAfee;i="6000,8403,9897"; a="182993765"
X-IronPort-AV: E=Sophos;i="5.81,184,1610438400"; 
   d="scan'208";a="182993765"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2021 07:51:01 -0800
IronPort-SDR: EJUMPQZh1iTHYX5ohBQCpyuT/xmVWXfkpS15FmSPjMV87gTye2hO9YiVye0gf6/dottRSKNEh5
 CwG0jeHRYUuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,184,1610438400"; 
   d="scan'208";a="580539163"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga005.jf.intel.com with ESMTP; 16 Feb 2021 07:51:00 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 34508169; Tue, 16 Feb 2021 17:50:59 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Dan Murphy <dmurphy@ti.com>, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Pavel Machek <pavel@ucw.cz>
Subject: [PATCH v1 2/7] leds: lp50xx: Switch to new style i2c-driver probe function
Date:   Tue, 16 Feb 2021 17:50:45 +0200
Message-Id: <20210216155050.29322-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210216155050.29322-1-andriy.shevchenko@linux.intel.com>
References: <20210216155050.29322-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Switch to the new style i2c-driver probe_new probe function.
Note we do not have any old style board files using this but
user still has a possibility to instantiate device from sysfs.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/leds/leds-lp50xx.c | 33 ++++++++++++++++-----------------
 1 file changed, 16 insertions(+), 17 deletions(-)

diff --git a/drivers/leds/leds-lp50xx.c b/drivers/leds/leds-lp50xx.c
index a2d18ec8fd2b..19aec80e527a 100644
--- a/drivers/leds/leds-lp50xx.c
+++ b/drivers/leds/leds-lp50xx.c
@@ -526,8 +526,7 @@ static int lp50xx_probe_dt(struct lp50xx *priv)
 	return ret;
 }
 
-static int lp50xx_probe(struct i2c_client *client,
-			const struct i2c_device_id *id)
+static int lp50xx_probe(struct i2c_client *client)
 {
 	struct lp50xx *led;
 	int count;
@@ -547,7 +546,7 @@ static int lp50xx_probe(struct i2c_client *client,
 	mutex_init(&led->lock);
 	led->client = client;
 	led->dev = &client->dev;
-	led->chip_info = &lp50xx_chip_info_tbl[id->driver_data];
+	led->chip_info = device_get_match_data(&client->dev);
 	i2c_set_clientdata(client, led);
 	led->regmap = devm_regmap_init_i2c(client,
 					led->chip_info->lp50xx_regmap_config);
@@ -593,24 +592,24 @@ static int lp50xx_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id lp50xx_id[] = {
-	{ "lp5009", LP5009 },
-	{ "lp5012", LP5012 },
-	{ "lp5018", LP5018 },
-	{ "lp5024", LP5024 },
-	{ "lp5030", LP5030 },
-	{ "lp5036", LP5036 },
+	{ "lp5009", (kernel_ulong_t)&lp50xx_chip_info_tbl[LP5009] },
+	{ "lp5012", (kernel_ulong_t)&lp50xx_chip_info_tbl[LP5012] },
+	{ "lp5018", (kernel_ulong_t)&lp50xx_chip_info_tbl[LP5018] },
+	{ "lp5024", (kernel_ulong_t)&lp50xx_chip_info_tbl[LP5024] },
+	{ "lp5030", (kernel_ulong_t)&lp50xx_chip_info_tbl[LP5030] },
+	{ "lp5036", (kernel_ulong_t)&lp50xx_chip_info_tbl[LP5036] },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, lp50xx_id);
 
 static const struct of_device_id of_lp50xx_leds_match[] = {
-	{ .compatible = "ti,lp5009", .data = (void *)LP5009 },
-	{ .compatible = "ti,lp5012", .data = (void *)LP5012 },
-	{ .compatible = "ti,lp5018", .data = (void *)LP5018 },
-	{ .compatible = "ti,lp5024", .data = (void *)LP5024 },
-	{ .compatible = "ti,lp5030", .data = (void *)LP5030 },
-	{ .compatible = "ti,lp5036", .data = (void *)LP5036 },
-	{},
+	{ .compatible = "ti,lp5009", .data = &lp50xx_chip_info_tbl[LP5009] },
+	{ .compatible = "ti,lp5012", .data = &lp50xx_chip_info_tbl[LP5012] },
+	{ .compatible = "ti,lp5018", .data = &lp50xx_chip_info_tbl[LP5018] },
+	{ .compatible = "ti,lp5024", .data = &lp50xx_chip_info_tbl[LP5024] },
+	{ .compatible = "ti,lp5030", .data = &lp50xx_chip_info_tbl[LP5030] },
+	{ .compatible = "ti,lp5036", .data = &lp50xx_chip_info_tbl[LP5036] },
+	{}
 };
 MODULE_DEVICE_TABLE(of, of_lp50xx_leds_match);
 
@@ -619,7 +618,7 @@ static struct i2c_driver lp50xx_driver = {
 		.name	= "lp50xx",
 		.of_match_table = of_lp50xx_leds_match,
 	},
-	.probe		= lp50xx_probe,
+	.probe_new	= lp50xx_probe,
 	.remove		= lp50xx_remove,
 	.id_table	= lp50xx_id,
 };
-- 
2.30.0

