Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 17C6F72090
	for <lists+linux-leds@lfdr.de>; Tue, 23 Jul 2019 22:15:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730811AbfGWUPD (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 23 Jul 2019 16:15:03 -0400
Received: from mga18.intel.com ([134.134.136.126]:16733 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728939AbfGWUPD (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Tue, 23 Jul 2019 16:15:03 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 23 Jul 2019 13:15:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,300,1559545200"; 
   d="scan'208";a="344852161"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga005.jf.intel.com with ESMTP; 23 Jul 2019 13:15:01 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 7804A81; Tue, 23 Jul 2019 23:15:00 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org,
        Dan Murphy <dmurphy@ti.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/3] leds: lm3532: Switch to use fwnode_property_count_uXX()
Date:   Tue, 23 Jul 2019 23:14:57 +0300
Message-Id: <20190723201459.70449-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Use fwnode_property_count_uXX() directly, that makes code neater.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/leds/leds-lm3532.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/leds/leds-lm3532.c b/drivers/leds/leds-lm3532.c
index 180895b83b88..646100724971 100644
--- a/drivers/leds/leds-lm3532.c
+++ b/drivers/leds/leds-lm3532.c
@@ -549,10 +549,7 @@ static int lm3532_parse_node(struct lm3532_data *priv)
 				lm3532_als_configure(priv, led);
 		}
 
-		led->num_leds = fwnode_property_read_u32_array(child,
-							       "led-sources",
-							       NULL, 0);
-
+		led->num_leds = fwnode_property_count_u32(child, "led-sources");
 		if (led->num_leds > LM3532_MAX_LED_STRINGS) {
 			dev_err(&priv->client->dev, "To many LED string defined\n");
 			continue;
-- 
2.20.1

