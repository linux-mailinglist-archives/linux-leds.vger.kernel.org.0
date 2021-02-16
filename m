Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7749131CD3A
	for <lists+linux-leds@lfdr.de>; Tue, 16 Feb 2021 16:53:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229699AbhBPPwt (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 16 Feb 2021 10:52:49 -0500
Received: from mga02.intel.com ([134.134.136.20]:30345 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229626AbhBPPws (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Tue, 16 Feb 2021 10:52:48 -0500
IronPort-SDR: oEX8sR/2fPSqJ5bAbx1etgZB1W+vllYH5Onz+grsF2oVhuE7gJ31ZfxbRbY0k2y8kqg9RBZofJ
 5Gi5y/aSurQQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9897"; a="170053936"
X-IronPort-AV: E=Sophos;i="5.81,184,1610438400"; 
   d="scan'208";a="170053936"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2021 07:51:01 -0800
IronPort-SDR: rgrn2CMqlMiRx23Yl3ddunPP4jEXLQiRtbVdF5aqhE96pq0rNwS1GQqkJJ3LfOxJcq5ccNKQY2
 e6CeI2elUesA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,184,1610438400"; 
   d="scan'208";a="364145355"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga006.jf.intel.com with ESMTP; 16 Feb 2021 07:51:00 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 5555F35E; Tue, 16 Feb 2021 17:50:59 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Dan Murphy <dmurphy@ti.com>, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Pavel Machek <pavel@ucw.cz>
Subject: [PATCH v1 5/7] leds: lp50xx: Get rid of redundant check in lp50xx_enable_disable()
Date:   Tue, 16 Feb 2021 17:50:48 +0200
Message-Id: <20210216155050.29322-5-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210216155050.29322-1-andriy.shevchenko@linux.intel.com>
References: <20210216155050.29322-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Since GPIO is optional the API is NULL aware and will check descriptor anyway.
Remove duplicate redundant check in lp50xx_enable_disable().

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/leds/leds-lp50xx.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/leds/leds-lp50xx.c b/drivers/leds/leds-lp50xx.c
index 58cd25fe565d..2b4981b5778d 100644
--- a/drivers/leds/leds-lp50xx.c
+++ b/drivers/leds/leds-lp50xx.c
@@ -382,11 +382,9 @@ static int lp50xx_enable_disable(struct lp50xx *priv, int enable_disable)
 {
 	int ret;
 
-	if (priv->enable_gpio) {
-		ret = gpiod_direction_output(priv->enable_gpio, enable_disable);
-		if (ret)
-			return ret;
-	}
+	ret = gpiod_direction_output(priv->enable_gpio, enable_disable);
+	if (ret)
+		return ret;
 
 	if (enable_disable)
 		return regmap_write(priv->regmap, LP50XX_DEV_CFG0, LP50XX_CHIP_EN);
-- 
2.30.0

