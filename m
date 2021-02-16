Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64E3A31CD3C
	for <lists+linux-leds@lfdr.de>; Tue, 16 Feb 2021 16:53:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230378AbhBPPwx (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 16 Feb 2021 10:52:53 -0500
Received: from mga11.intel.com ([192.55.52.93]:6756 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230059AbhBPPwv (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Tue, 16 Feb 2021 10:52:51 -0500
IronPort-SDR: 43Dxz9MApAOVV9RHa0NrFdzfn4wlllQktVf9tcb1p2c4Eq6mWToepxCSSGayHUFyNXO9MdUg5d
 +mhZj9T8dUrw==
X-IronPort-AV: E=McAfee;i="6000,8403,9897"; a="179417994"
X-IronPort-AV: E=Sophos;i="5.81,184,1610438400"; 
   d="scan'208";a="179417994"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2021 07:51:03 -0800
IronPort-SDR: Hy5Ez2qMCmZgFthigJdzemOKsXhT4LQpiGSWDkqYtVBGFkVo6AMx8ip5Zh/TL4Z7SVIIs8/a1G
 KpgOXszbdvEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,184,1610438400"; 
   d="scan'208";a="512563338"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga004.jf.intel.com with ESMTP; 16 Feb 2021 07:51:02 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 5F17D2D5; Tue, 16 Feb 2021 17:50:59 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Dan Murphy <dmurphy@ti.com>, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Pavel Machek <pavel@ucw.cz>
Subject: [PATCH v1 6/7] leds: lp50xx: Add missed bits.h and convert to BIT()
Date:   Tue, 16 Feb 2021 17:50:49 +0200
Message-Id: <20210216155050.29322-6-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210216155050.29322-1-andriy.shevchenko@linux.intel.com>
References: <20210216155050.29322-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Add missed bits.h and convert to BIT() in lp50xx_set_banks().

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/leds/leds-lp50xx.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/leds/leds-lp50xx.c b/drivers/leds/leds-lp50xx.c
index 2b4981b5778d..0c6a5a9dd162 100644
--- a/drivers/leds/leds-lp50xx.c
+++ b/drivers/leds/leds-lp50xx.c
@@ -2,6 +2,7 @@
 // TI LP50XX LED chip family driver
 // Copyright (C) 2018-20 Texas Instruments Incorporated - https://www.ti.com/
 
+#include <linux/bits.h>
 #include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
 #include <linux/init.h>
@@ -357,7 +358,7 @@ static int lp50xx_set_banks(struct lp50xx *priv, u32 led_banks[])
 
 	for (i = 0; i < priv->chip_info->max_modules; i++) {
 		if (led_banks[i])
-			bank_enable_mask |= (1 << led_banks[i]);
+			bank_enable_mask |= BIT(led_banks[i]);
 	}
 
 	led_config_lo = bank_enable_mask;
-- 
2.30.0

