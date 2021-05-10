Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E41F377FEC
	for <lists+linux-leds@lfdr.de>; Mon, 10 May 2021 11:51:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230449AbhEJJwL (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 10 May 2021 05:52:11 -0400
Received: from fgw20-7.mail.saunalahti.fi ([62.142.5.81]:63649 "EHLO
        fgw20-7.mail.saunalahti.fi" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230458AbhEJJwK (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Mon, 10 May 2021 05:52:10 -0400
Received: from localhost (88-115-248-186.elisa-laajakaista.fi [88.115.248.186])
        by fgw20.mail.saunalahti.fi (Halon) with ESMTP
        id 38a60b87-b175-11eb-ba24-005056bd6ce9;
        Mon, 10 May 2021 12:50:58 +0300 (EEST)
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
        Jean-Jacques Hiblot <jjhiblot@ti.com>
Subject: [PATCH v1 01/28] leds: class: The -ENOTSUPP should never be seen by user space
Date:   Mon, 10 May 2021 12:50:18 +0300
Message-Id: <20210510095045.3299382-2-andy.shevchenko@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210510095045.3299382-1-andy.shevchenko@gmail.com>
References: <20210510095045.3299382-1-andy.shevchenko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Drop the bogus error code and let of_led_get() to take care about absent
of_node.

Fixes: e389240ad992 ("leds: Add managed API to get a LED from a device driver")
Cc: Jean-Jacques Hiblot <jjhiblot@ti.com>
Signed-off-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---
 drivers/leds/led-class.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
index 2e495ff67856..fa3f5f504ff7 100644
--- a/drivers/leds/led-class.c
+++ b/drivers/leds/led-class.c
@@ -285,10 +285,6 @@ struct led_classdev *__must_check devm_of_led_get(struct device *dev,
 	if (!dev)
 		return ERR_PTR(-EINVAL);
 
-	/* Not using device tree? */
-	if (!IS_ENABLED(CONFIG_OF) || !dev->of_node)
-		return ERR_PTR(-ENOTSUPP);
-
 	led = of_led_get(dev->of_node, index);
 	if (IS_ERR(led))
 		return led;
-- 
2.31.1

