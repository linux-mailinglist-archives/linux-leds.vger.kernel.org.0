Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E6AD394BEE
	for <lists+linux-leds@lfdr.de>; Sat, 29 May 2021 13:19:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229718AbhE2LVR (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 29 May 2021 07:21:17 -0400
Received: from fgw21-7.mail.saunalahti.fi ([62.142.5.82]:38751 "EHLO
        fgw21-7.mail.saunalahti.fi" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229686AbhE2LVQ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Sat, 29 May 2021 07:21:16 -0400
Received: from localhost (88-115-248-186.elisa-laajakaista.fi [88.115.248.186])
        by fgw21.mail.saunalahti.fi (Halon) with ESMTP
        id c0719dcb-c06f-11eb-9eb8-005056bdd08f;
        Sat, 29 May 2021 14:19:37 +0300 (EEST)
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
To:     Pavel Machek <pavel@ucw.cz>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Amireddy Mallikarjuna reddy 
        <mallikarjunax.reddy@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Abanoub Sameh <abanoubsameh8@gmail.com>,
        =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: [PATCH v2 01/13] leds: core: The -ENOTSUPP should never be seen by user space
Date:   Sat, 29 May 2021 14:19:23 +0300
Message-Id: <20210529111935.3849707-1-andy.shevchenko@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Luckily there is no user which checks for returned code and actually
returns it, but since the function is exported any user may try to return
an error code from it to user space, usually during probe phase,

Replace -ENOTSUPP by -EOPNOTSUPP when returning from exported function.

Fixes: 13ae79bbe4c2 ("leds: core: Drivers shouldn't enforce SYNC/ASYNC brightness setting")
Cc: Jacek Anaszewski <j.anaszewski@samsung.com>
Signed-off-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---
v2: amended the commit message
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

