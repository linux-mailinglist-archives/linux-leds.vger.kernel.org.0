Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4DAFE37803E
	for <lists+linux-leds@lfdr.de>; Mon, 10 May 2021 11:52:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231190AbhEJJxC (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 10 May 2021 05:53:02 -0400
Received: from fgw21-7.mail.saunalahti.fi ([62.142.5.82]:42811 "EHLO
        fgw21-7.mail.saunalahti.fi" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231157AbhEJJwh (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Mon, 10 May 2021 05:52:37 -0400
Received: from localhost (88-115-248-186.elisa-laajakaista.fi [88.115.248.186])
        by fgw21.mail.saunalahti.fi (Halon) with ESMTP
        id 4608872c-b175-11eb-9eb8-005056bdd08f;
        Mon, 10 May 2021 12:51:21 +0300 (EEST)
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
Subject: [PATCH v1 27/28] leds: rt8515: Put fwnode in any case during ->probe()
Date:   Mon, 10 May 2021 12:50:44 +0300
Message-Id: <20210510095045.3299382-28-andy.shevchenko@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210510095045.3299382-1-andy.shevchenko@gmail.com>
References: <20210510095045.3299382-1-andy.shevchenko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

fwnode_get_next_available_child_node() bumps a reference counting of
a returned variable. We have to balance it whenever we return to
the caller.

Fixes: e1c6edcbea13 ("leds: rt8515: Add Richtek RT8515 LED driver")
Cc: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---
 drivers/leds/flash/leds-rt8515.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/leds/flash/leds-rt8515.c b/drivers/leds/flash/leds-rt8515.c
index 590bfa180d10..44904fdee3cc 100644
--- a/drivers/leds/flash/leds-rt8515.c
+++ b/drivers/leds/flash/leds-rt8515.c
@@ -343,8 +343,9 @@ static int rt8515_probe(struct platform_device *pdev)
 
 	ret = devm_led_classdev_flash_register_ext(dev, fled, &init_data);
 	if (ret) {
-		dev_err(dev, "can't register LED %s\n", led->name);
+		fwnode_handle_put(child);
 		mutex_destroy(&rt->lock);
+		dev_err(dev, "can't register LED %s\n", led->name);
 		return ret;
 	}
 
@@ -362,6 +363,7 @@ static int rt8515_probe(struct platform_device *pdev)
 		 */
 	}
 
+	fwnode_handle_put(child);
 	return 0;
 }
 
-- 
2.31.1

