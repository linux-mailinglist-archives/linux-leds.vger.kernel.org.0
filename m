Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5121831CD3E
	for <lists+linux-leds@lfdr.de>; Tue, 16 Feb 2021 16:53:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230389AbhBPPwy (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 16 Feb 2021 10:52:54 -0500
Received: from mga03.intel.com ([134.134.136.65]:56597 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230166AbhBPPwv (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Tue, 16 Feb 2021 10:52:51 -0500
IronPort-SDR: SoEJ46dAvzjVMhClb0GHc5XC9eCs/t43J5JyxXjxCa8n53hgZ1Bv19m1/lgJg/wXYj1KntbJMY
 d8dnyFC6w04Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9897"; a="182993769"
X-IronPort-AV: E=Sophos;i="5.81,184,1610438400"; 
   d="scan'208";a="182993769"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2021 07:51:01 -0800
IronPort-SDR: Yy5hBAW2qArpAq34HwntmjUAStF/Mh513N/VgmnaAHT2R6hWG6/bOadqBvAAjMQLB5EYTlN+Qn
 IHCF5D3L6B6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,184,1610438400"; 
   d="scan'208";a="592220863"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga005.fm.intel.com with ESMTP; 16 Feb 2021 07:51:00 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 4A25D35A; Tue, 16 Feb 2021 17:50:59 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Dan Murphy <dmurphy@ti.com>, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Pavel Machek <pavel@ucw.cz>
Subject: [PATCH v1 4/7] leds: lp50xx: Get rid of redundant explicit casting
Date:   Tue, 16 Feb 2021 17:50:47 +0200
Message-Id: <20210216155050.29322-4-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210216155050.29322-1-andriy.shevchenko@linux.intel.com>
References: <20210216155050.29322-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

In the line like

	u32 bar = ...;
	u8 foo = (u8)(bar >> 8) & 0xff;

is no need to have neither explicit casting nor ' & 0xff' part.
Get rid of them.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/leds/leds-lp50xx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/leds-lp50xx.c b/drivers/leds/leds-lp50xx.c
index 0723b2688552..58cd25fe565d 100644
--- a/drivers/leds/leds-lp50xx.c
+++ b/drivers/leds/leds-lp50xx.c
@@ -360,8 +360,8 @@ static int lp50xx_set_banks(struct lp50xx *priv, u32 led_banks[])
 			bank_enable_mask |= (1 << led_banks[i]);
 	}
 
-	led_config_lo = (u8)(bank_enable_mask & 0xff);
-	led_config_hi = (u8)(bank_enable_mask >> 8) & 0xff;
+	led_config_lo = bank_enable_mask;
+	led_config_hi = bank_enable_mask >> 8;
 
 	ret = regmap_write(priv->regmap, LP50XX_LED_CFG0, led_config_lo);
 	if (ret)
-- 
2.30.0

