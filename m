Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E91159981A
	for <lists+linux-leds@lfdr.de>; Thu, 22 Aug 2019 17:25:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731024AbfHVPZn (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 22 Aug 2019 11:25:43 -0400
Received: from mga17.intel.com ([192.55.52.151]:36520 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730818AbfHVPZm (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Thu, 22 Aug 2019 11:25:42 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 22 Aug 2019 08:25:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,417,1559545200"; 
   d="scan'208";a="208206069"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga002.fm.intel.com with ESMTP; 22 Aug 2019 08:25:40 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 7100E96; Thu, 22 Aug 2019 18:25:40 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        linux-leds@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1] leds: core: Refactor led_update_brightness()
Date:   Thu, 22 Aug 2019 18:25:39 +0300
Message-Id: <20190822152539.52641-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.23.0.rc1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

There is neither need to have an additional assignment of ret, nor
the non-so-standard conditional. Moreover, the resulting code better to read
and less LOCs.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/leds/led-core.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c
index f1f718dbe0f8..810053fbe0f6 100644
--- a/drivers/leds/led-core.c
+++ b/drivers/leds/led-core.c
@@ -308,17 +308,16 @@ EXPORT_SYMBOL_GPL(led_set_brightness_sync);
 
 int led_update_brightness(struct led_classdev *led_cdev)
 {
-	int ret = 0;
+	int ret;
 
 	if (led_cdev->brightness_get) {
 		ret = led_cdev->brightness_get(led_cdev);
-		if (ret >= 0) {
-			led_cdev->brightness = ret;
-			return 0;
-		}
+		if (ret < 0)
+			return ret;
 	}
 
-	return ret;
+	led_cdev->brightness = ret;
+	return 0;
 }
 EXPORT_SYMBOL_GPL(led_update_brightness);
 
-- 
2.23.0.rc1

