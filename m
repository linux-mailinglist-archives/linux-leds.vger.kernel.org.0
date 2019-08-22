Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1D48B997FC
	for <lists+linux-leds@lfdr.de>; Thu, 22 Aug 2019 17:20:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389529AbfHVPTc (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 22 Aug 2019 11:19:32 -0400
Received: from mga14.intel.com ([192.55.52.115]:49633 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388777AbfHVPTc (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Thu, 22 Aug 2019 11:19:32 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 22 Aug 2019 08:19:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,417,1559545200"; 
   d="scan'208";a="330421558"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga004.jf.intel.com with ESMTP; 22 Aug 2019 08:19:30 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 3C53E47; Thu, 22 Aug 2019 18:19:29 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        linux-leds@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 2/2] leds: Switch to use fwnode instead of be stuck with OF one
Date:   Thu, 22 Aug 2019 18:19:28 +0300
Message-Id: <20190822151928.51274-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.23.0.rc1
In-Reply-To: <20190822151928.51274-1-andriy.shevchenko@linux.intel.com>
References: <20190822151928.51274-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

There is no need to be stuck with OF node when we may use agnostic
firmware node instead.

It allows users to get property if needed independently of provider.

Note, some OF parts are left because %pfw [1] is in progress.

[1]: https://lore.kernel.org/patchwork/cover/1054863/

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/leds/led-class.c | 4 ++--
 drivers/leds/led-core.c  | 9 +++------
 2 files changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
index d231240c2047..052c7571e188 100644
--- a/drivers/leds/led-class.c
+++ b/drivers/leds/led-class.c
@@ -14,7 +14,7 @@
 #include <linux/leds.h>
 #include <linux/list.h>
 #include <linux/module.h>
-#include <linux/of.h>
+#include <linux/property.h>
 #include <linux/slab.h>
 #include <linux/spinlock.h>
 #include <linux/timer.h>
@@ -277,7 +277,7 @@ int led_classdev_register_ext(struct device *parent,
 		return PTR_ERR(led_cdev->dev);
 	}
 	if (init_data && init_data->fwnode)
-		led_cdev->dev->of_node = to_of_node(init_data->fwnode);
+		led_cdev->dev->fwnode = init_data->fwnode;
 
 	if (ret)
 		dev_warn(parent, "Led %s renamed to %s due to name collision",
diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c
index f0c1c403f678..f1f718dbe0f8 100644
--- a/drivers/leds/led-core.c
+++ b/drivers/leds/led-core.c
@@ -324,14 +324,11 @@ EXPORT_SYMBOL_GPL(led_update_brightness);
 
 u32 *led_get_default_pattern(struct led_classdev *led_cdev, unsigned int *size)
 {
-	struct device_node *np = dev_of_node(led_cdev->dev);
+	struct fwnode_handle *fwnode = led_cdev->dev->fwnode;
 	u32 *pattern;
 	int count;
 
-	if (!np)
-		return NULL;
-
-	count = of_property_count_u32_elems(np, "led-pattern");
+	count = fwnode_property_count_u32(fwnode, "led-pattern");
 	if (count < 0)
 		return NULL;
 
@@ -339,7 +336,7 @@ u32 *led_get_default_pattern(struct led_classdev *led_cdev, unsigned int *size)
 	if (!pattern)
 		return NULL;
 
-	if (of_property_read_u32_array(np, "led-pattern", pattern, count)) {
+	if (fwnode_property_read_u32_array(fwnode, "led-pattern", pattern, count)) {
 		kfree(pattern);
 		return NULL;
 	}
-- 
2.23.0.rc1

