Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 133CD377FED
	for <lists+linux-leds@lfdr.de>; Mon, 10 May 2021 11:51:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230497AbhEJJwN (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 10 May 2021 05:52:13 -0400
Received: from fgw23-7.mail.saunalahti.fi ([62.142.5.84]:14328 "EHLO
        fgw23-7.mail.saunalahti.fi" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230474AbhEJJwL (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Mon, 10 May 2021 05:52:11 -0400
Received: from localhost (88-115-248-186.elisa-laajakaista.fi [88.115.248.186])
        by fgw23.mail.saunalahti.fi (Halon) with ESMTP
        id 39560256-b175-11eb-8ccd-005056bdfda7;
        Mon, 10 May 2021 12:51:00 +0300 (EEST)
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
To:     Pavel Machek <pavel@ucw.cz>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Amireddy Mallikarjuna reddy 
        <mallikarjunax.reddy@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>,
        Abanoub Sameh <abanoubsameh8@gmail.com>,
        Dan Murphy <dmurphy@ti.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: [PATCH v1 02/28] leds: core: The -ENOTSUPP should never be seen by user space
Date:   Mon, 10 May 2021 12:50:19 +0300
Message-Id: <20210510095045.3299382-3-andy.shevchenko@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210510095045.3299382-1-andy.shevchenko@gmail.com>
References: <20210510095045.3299382-1-andy.shevchenko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Replace -ENOTSUPP by -EOPNOTSUPP when returning from exported function.

Fixes: 13ae79bbe4c2 ("leds: core: Drivers shouldn't enforce SYNC/ASYNC brightness setting")
Cc: Jacek Anaszewski <j.anaszewski@samsung.com>
Signed-off-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---
 drivers/leds/led-core.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c
index d56ff4939492..f962620a504f 100644
--- a/drivers/leds/led-core.c
+++ b/drivers/leds/led-core.c
@@ -289,6 +289,8 @@ EXPORT_SYMBOL_GPL(led_set_brightness_nosleep);
 
 int led_set_brightness_sync(struct led_classdev *led_cdev, unsigned int value)
 {
+	int ret;
+
 	if (led_cdev->blink_delay_on || led_cdev->blink_delay_off)
 		return -EBUSY;
 
@@ -297,7 +299,10 @@ int led_set_brightness_sync(struct led_classdev *led_cdev, unsigned int value)
 	if (led_cdev->flags & LED_SUSPENDED)
 		return 0;
 
-	return __led_set_brightness_blocking(led_cdev, led_cdev->brightness);
+	ret = __led_set_brightness_blocking(led_cdev, led_cdev->brightness);
+	if (ret == -ENOTSUPP)
+		return -EOPNOTSUPP;
+	return ret;
 }
 EXPORT_SYMBOL_GPL(led_set_brightness_sync);
 
-- 
2.31.1

