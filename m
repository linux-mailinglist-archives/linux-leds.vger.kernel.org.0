Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D50B431CD3D
	for <lists+linux-leds@lfdr.de>; Tue, 16 Feb 2021 16:53:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230383AbhBPPwx (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 16 Feb 2021 10:52:53 -0500
Received: from mga11.intel.com ([192.55.52.93]:6751 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230044AbhBPPwv (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Tue, 16 Feb 2021 10:52:51 -0500
IronPort-SDR: JUHyTIWmSxJVhDDhPiMSkWdmHuwLn36UKu3e1p4BXsdXYjHOxcYLXJ9hZw9fYXEhJxZ3olntHL
 HiI+Iwt2AHtw==
X-IronPort-AV: E=McAfee;i="6000,8403,9897"; a="179417995"
X-IronPort-AV: E=Sophos;i="5.81,184,1610438400"; 
   d="scan'208";a="179417995"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2021 07:51:04 -0800
IronPort-SDR: mQlUzYfWhbkiwCuydQuvNTXGMl6KMTM6L157tZGo5uYlhYILHkeOretf2NaA3HJPlRoZ7OkDuw
 AhcoII/cwsgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,184,1610438400"; 
   d="scan'208";a="512563339"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga004.jf.intel.com with ESMTP; 16 Feb 2021 07:51:02 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 6B69B525; Tue, 16 Feb 2021 17:50:59 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Dan Murphy <dmurphy@ti.com>, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Pavel Machek <pavel@ucw.cz>
Subject: [PATCH v1 7/7] leds: lp50xx: Update headers block to reflect reality
Date:   Tue, 16 Feb 2021 17:50:50 +0200
Message-Id: <20210216155050.29322-7-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210216155050.29322-1-andriy.shevchenko@linux.intel.com>
References: <20210216155050.29322-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

The OF is not used in the driver, thus the OF headers are not needed,
but mod_devicetable.h is missed.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/leds/leds-lp50xx.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/leds/leds-lp50xx.c b/drivers/leds/leds-lp50xx.c
index 0c6a5a9dd162..43c9ac1d4b1c 100644
--- a/drivers/leds/leds-lp50xx.c
+++ b/drivers/leds/leds-lp50xx.c
@@ -7,10 +7,9 @@
 #include <linux/i2c.h>
 #include <linux/init.h>
 #include <linux/leds.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
-#include <linux/of.h>
-#include <linux/of_gpio.h>
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
 #include <linux/slab.h>
-- 
2.30.0

