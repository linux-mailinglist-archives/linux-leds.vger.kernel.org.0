Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9262C72092
	for <lists+linux-leds@lfdr.de>; Tue, 23 Jul 2019 22:15:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728939AbfGWUPD (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 23 Jul 2019 16:15:03 -0400
Received: from mga07.intel.com ([134.134.136.100]:62856 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730777AbfGWUPD (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Tue, 23 Jul 2019 16:15:03 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 23 Jul 2019 13:15:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,300,1559545200"; 
   d="scan'208";a="171267854"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga007.fm.intel.com with ESMTP; 23 Jul 2019 13:15:01 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 815AB4B; Tue, 23 Jul 2019 23:15:00 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org,
        Dan Murphy <dmurphy@ti.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 2/3] leds: lm36274: Switch to use fwnode_property_count_uXX()
Date:   Tue, 23 Jul 2019 23:14:58 +0300
Message-Id: <20190723201459.70449-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190723201459.70449-1-andriy.shevchenko@linux.intel.com>
References: <20190723201459.70449-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Use fwnode_property_count_uXX() directly, that makes code neater.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/leds/leds-lm36274.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/leds/leds-lm36274.c b/drivers/leds/leds-lm36274.c
index ed9dc857ec8f..836b60c9a2b8 100644
--- a/drivers/leds/leds-lm36274.c
+++ b/drivers/leds/leds-lm36274.c
@@ -90,9 +90,7 @@ static int lm36274_parse_dt(struct lm36274 *lm36274_data)
 			snprintf(label, sizeof(label),
 				 "%s:%s", lm36274_data->pdev->name, name);
 
-		lm36274_data->num_leds = fwnode_property_read_u32_array(child,
-							  "led-sources",
-							  NULL, 0);
+		lm36274_data->num_leds = fwnode_property_count_u32(child, "led-sources");
 		if (lm36274_data->num_leds <= 0)
 			return -ENODEV;
 
-- 
2.20.1

