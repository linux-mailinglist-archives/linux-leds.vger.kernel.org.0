Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88F9937803B
	for <lists+linux-leds@lfdr.de>; Mon, 10 May 2021 11:52:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230480AbhEJJxC (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 10 May 2021 05:53:02 -0400
Received: from fgw20-7.mail.saunalahti.fi ([62.142.5.81]:64418 "EHLO
        fgw20-7.mail.saunalahti.fi" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231190AbhEJJwg (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Mon, 10 May 2021 05:52:36 -0400
Received: from localhost (88-115-248-186.elisa-laajakaista.fi [88.115.248.186])
        by fgw20.mail.saunalahti.fi (Halon) with ESMTP
        id 458a1905-b175-11eb-ba24-005056bd6ce9;
        Mon, 10 May 2021 12:51:20 +0300 (EEST)
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
Subject: [PATCH v1 26/28] leds: pwm: Make error handling more robust
Date:   Mon, 10 May 2021 12:50:43 +0300
Message-Id: <20210510095045.3299382-27-andy.shevchenko@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210510095045.3299382-1-andy.shevchenko@gmail.com>
References: <20210510095045.3299382-1-andy.shevchenko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

It's easy to miss necessary clean up, e.g. firmware node reference counting,
during error path in ->probe(). Make it more robust by moving to a single
point of return.

Signed-off-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---
 drivers/leds/leds-pwm.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/leds/leds-pwm.c b/drivers/leds/leds-pwm.c
index f53f9309ca6c..d71e9fa5c8de 100644
--- a/drivers/leds/leds-pwm.c
+++ b/drivers/leds/leds-pwm.c
@@ -101,7 +101,7 @@ static int led_pwm_create_fwnode(struct device *dev, struct led_pwm_priv *priv)
 {
 	struct fwnode_handle *fwnode;
 	struct led_pwm led;
-	int ret = 0;
+	int ret;
 
 	memset(&led, 0, sizeof(led));
 
@@ -111,8 +111,8 @@ static int led_pwm_create_fwnode(struct device *dev, struct led_pwm_priv *priv)
 			led.name = to_of_node(fwnode)->name;
 
 		if (!led.name) {
-			fwnode_handle_put(fwnode);
-			return -EINVAL;
+			ret = EINVAL;
+			goto err_child_out;
 		}
 
 		led.active_low = fwnode_property_read_bool(fwnode,
@@ -121,12 +121,14 @@ static int led_pwm_create_fwnode(struct device *dev, struct led_pwm_priv *priv)
 					 &led.max_brightness);
 
 		ret = led_pwm_add(dev, priv, &led, fwnode);
-		if (ret) {
-			fwnode_handle_put(fwnode);
-			break;
-		}
+		if (ret)
+			goto err_child_out;
 	}
 
+	return 0;
+
+err_child_out:
+	fwnode_handle_put(fwnode);
 	return ret;
 }
 
-- 
2.31.1

