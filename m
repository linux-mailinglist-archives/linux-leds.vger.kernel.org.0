Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8713672091
	for <lists+linux-leds@lfdr.de>; Tue, 23 Jul 2019 22:15:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730777AbfGWUPD (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 23 Jul 2019 16:15:03 -0400
Received: from mga05.intel.com ([192.55.52.43]:61467 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730783AbfGWUPD (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Tue, 23 Jul 2019 16:15:03 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 23 Jul 2019 13:15:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,300,1559545200"; 
   d="scan'208";a="174651162"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga006.jf.intel.com with ESMTP; 23 Jul 2019 13:15:00 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 8A6CC130; Tue, 23 Jul 2019 23:15:00 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org,
        Dan Murphy <dmurphy@ti.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 3/3] leds: lm3697: Switch to use fwnode_property_count_uXX()
Date:   Tue, 23 Jul 2019 23:14:59 +0300
Message-Id: <20190723201459.70449-3-andriy.shevchenko@linux.intel.com>
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
 drivers/leds/leds-lm3697.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/leds/leds-lm3697.c b/drivers/leds/leds-lm3697.c
index 54e0e35df824..b71711aff8a3 100644
--- a/drivers/leds/leds-lm3697.c
+++ b/drivers/leds/leds-lm3697.c
@@ -244,10 +244,7 @@ static int lm3697_probe_dt(struct lm3697 *priv)
 		led->lmu_data.lsb_brightness_reg = LM3697_CTRL_A_BRT_LSB +
 						   led->control_bank * 2;
 
-		led->num_leds = fwnode_property_read_u32_array(child,
-						       "led-sources",
-						       NULL, 0);
-
+		led->num_leds = fwnode_property_count_u32(child, "led-sources");
 		if (led->num_leds > LM3697_MAX_LED_STRINGS) {
 			dev_err(&priv->client->dev, "To many LED strings defined\n");
 			continue;
-- 
2.20.1

