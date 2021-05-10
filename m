Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27D2237800C
	for <lists+linux-leds@lfdr.de>; Mon, 10 May 2021 11:51:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231135AbhEJJw0 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 10 May 2021 05:52:26 -0400
Received: from fgw22-7.mail.saunalahti.fi ([62.142.5.83]:17318 "EHLO
        fgw22-7.mail.saunalahti.fi" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230499AbhEJJwT (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Mon, 10 May 2021 05:52:19 -0400
Received: from localhost (88-115-248-186.elisa-laajakaista.fi [88.115.248.186])
        by fgw22.mail.saunalahti.fi (Halon) with ESMTP
        id 3e60dc10-b175-11eb-88cb-005056bdf889;
        Mon, 10 May 2021 12:51:08 +0300 (EEST)
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
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: [PATCH v1 12/28] leds: lgm-sso: Drop duplicate NULL check for GPIO operations
Date:   Mon, 10 May 2021 12:50:29 +0300
Message-Id: <20210510095045.3299382-13-andy.shevchenko@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210510095045.3299382-1-andy.shevchenko@gmail.com>
References: <20210510095045.3299382-1-andy.shevchenko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Since GPIO operations are NULL-aware, we don't need to duplicate
this check. Remove it and fold the rest of the code.

Signed-off-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---
 drivers/leds/blink/leds-lgm-sso.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/blink/leds-lgm-sso.c b/drivers/leds/blink/leds-lgm-sso.c
index a7f2e5436ba2..f44d6bf5a5b3 100644
--- a/drivers/leds/blink/leds-lgm-sso.c
+++ b/drivers/leds/blink/leds-lgm-sso.c
@@ -259,7 +259,7 @@ static void sso_led_brightness_set(struct led_classdev *led_cdev,
 				   1 << desc->pin);
 	}
 
-	if (!desc->hw_trig && led->gpiod)
+	if (!desc->hw_trig)
 		gpiod_set_value(led->gpiod, val);
 }
 
-- 
2.31.1

