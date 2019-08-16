Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 32E2E9004C
	for <lists+linux-leds@lfdr.de>; Fri, 16 Aug 2019 12:52:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727052AbfHPKwe (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 16 Aug 2019 06:52:34 -0400
Received: from mga02.intel.com ([134.134.136.20]:64554 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725897AbfHPKwe (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Fri, 16 Aug 2019 06:52:34 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 16 Aug 2019 03:52:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,391,1559545200"; 
   d="scan'208";a="201513701"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga004.fm.intel.com with ESMTP; 16 Aug 2019 03:52:31 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 3DC8511C; Fri, 16 Aug 2019 13:52:30 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        linux-leds@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1] leds: Allow to call led_classdev_unregister() unconditionally
Date:   Fri, 16 Aug 2019 13:52:29 +0300
Message-Id: <20190816105229.81234-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.23.0.rc1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

If in the certain driver the LED is optional, and it's a majority of them,
the call of led_classdev_unregister() still requires some additional checks.

The usual pattern on unregistering is to check for NULL, but we also check
for IS_ERR() in case device_create_with_groups() fails.

The change will reduce a burden in a lot of drivers to repeatedly check
for above conditions.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/leds/led-class.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
index d231240c2047..80b62b807ea0 100644
--- a/drivers/leds/led-class.c
+++ b/drivers/leds/led-class.c
@@ -287,6 +287,7 @@ int led_classdev_register_ext(struct device *parent,
 		ret = led_add_brightness_hw_changed(led_cdev);
 		if (ret) {
 			device_unregister(led_cdev->dev);
+			led_cdev->dev = NULL;
 			mutex_unlock(&led_cdev->led_access);
 			return ret;
 		}
@@ -332,6 +333,9 @@ EXPORT_SYMBOL_GPL(led_classdev_register_ext);
  */
 void led_classdev_unregister(struct led_classdev *led_cdev)
 {
+	if (IS_ERR_OR_NULL(led_cdev->dev))
+		return;
+
 #ifdef CONFIG_LEDS_TRIGGERS
 	down_write(&led_cdev->trigger_lock);
 	if (led_cdev->trigger)
-- 
2.23.0.rc1

