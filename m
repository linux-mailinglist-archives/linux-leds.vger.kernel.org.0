Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 22DA731CD47
	for <lists+linux-leds@lfdr.de>; Tue, 16 Feb 2021 16:54:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230073AbhBPPyU (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 16 Feb 2021 10:54:20 -0500
Received: from mga03.intel.com ([134.134.136.65]:56597 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229787AbhBPPyP (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Tue, 16 Feb 2021 10:54:15 -0500
IronPort-SDR: uFxRYTFChpiJliSYlvD73+cDX1QnlP2q1EkWIKk5KFj7VpA2yBlGqBHPUiEl0c5kabWt4LfWFk
 JdCh6aP6hTng==
X-IronPort-AV: E=McAfee;i="6000,8403,9897"; a="182993763"
X-IronPort-AV: E=Sophos;i="5.81,184,1610438400"; 
   d="scan'208";a="182993763"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2021 07:51:01 -0800
IronPort-SDR: iBvJFjhniTxxdNc4/RTkPjD0M2S0ohTwbRcN6KtHkNPp8clIvTB6KHKbArxCWrP3cHPJUxoinK
 HoHO8nuqrO3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,184,1610438400"; 
   d="scan'208";a="384458645"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga008.fm.intel.com with ESMTP; 16 Feb 2021 07:51:00 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 23B931F1; Tue, 16 Feb 2021 17:50:58 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Dan Murphy <dmurphy@ti.com>, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Pavel Machek <pavel@ucw.cz>
Subject: [PATCH v1 1/7] leds: lp50xx: Don't spam logs when probe is deferred
Date:   Tue, 16 Feb 2021 17:50:44 +0200
Message-Id: <20210216155050.29322-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

When requesting GPIO line the probe can be deferred.
In such case don't spam logs with an error message.
This can be achieved by switching to dev_err_probe().

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/leds/leds-lp50xx.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/leds/leds-lp50xx.c b/drivers/leds/leds-lp50xx.c
index f13117eed976..a2d18ec8fd2b 100644
--- a/drivers/leds/leds-lp50xx.c
+++ b/drivers/leds/leds-lp50xx.c
@@ -455,12 +455,9 @@ static int lp50xx_probe_dt(struct lp50xx *priv)
 	int i = 0;
 
 	priv->enable_gpio = devm_gpiod_get_optional(priv->dev, "enable", GPIOD_OUT_LOW);
-	if (IS_ERR(priv->enable_gpio)) {
-		ret = PTR_ERR(priv->enable_gpio);
-		dev_err(&priv->client->dev, "Failed to get enable gpio: %d\n",
-			ret);
-		return ret;
-	}
+	if (IS_ERR(priv->enable_gpio))
+		return dev_err_probe(priv->dev, PTR_ERR(priv->enable_gpio),
+				     "Failed to get enable GPIO\n");
 
 	priv->regulator = devm_regulator_get(priv->dev, "vled");
 	if (IS_ERR(priv->regulator))
-- 
2.30.0

