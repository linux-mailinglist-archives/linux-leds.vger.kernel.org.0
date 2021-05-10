Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72E4B378016
	for <lists+linux-leds@lfdr.de>; Mon, 10 May 2021 11:51:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231250AbhEJJwn (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 10 May 2021 05:52:43 -0400
Received: from fgw20-7.mail.saunalahti.fi ([62.142.5.81]:64095 "EHLO
        fgw20-7.mail.saunalahti.fi" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231143AbhEJJw0 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Mon, 10 May 2021 05:52:26 -0400
Received: from localhost (88-115-248-186.elisa-laajakaista.fi [88.115.248.186])
        by fgw20.mail.saunalahti.fi (Halon) with ESMTP
        id 40a368e3-b175-11eb-ba24-005056bd6ce9;
        Mon, 10 May 2021 12:51:12 +0300 (EEST)
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
Subject: [PATCH v1 16/28] leds: lm36274: Put fwnode in error case during ->probe()
Date:   Mon, 10 May 2021 12:50:33 +0300
Message-Id: <20210510095045.3299382-17-andy.shevchenko@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210510095045.3299382-1-andy.shevchenko@gmail.com>
References: <20210510095045.3299382-1-andy.shevchenko@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

device_get_next_child_node() bumps a reference counting of a returned variable.
We have to balance it whenever we return to the caller.

In the older code the same is implied with device_for_each_child_node().

Fixes: 11e1bbc116a7 ("leds: lm36274: Introduce the TI LM36274 LED driver")
Fixes: a448fcf19c9c ("leds: lm36274: don't iterate through children since there is only one")
Cc: Dan Murphy <dmurphy@ti.com>
Cc: Marek Behún <marek.behun@nic.cz>
Signed-off-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---
 drivers/leds/leds-lm36274.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/leds/leds-lm36274.c b/drivers/leds/leds-lm36274.c
index aadb03468a40..a23a9424c2f3 100644
--- a/drivers/leds/leds-lm36274.c
+++ b/drivers/leds/leds-lm36274.c
@@ -127,6 +127,7 @@ static int lm36274_probe(struct platform_device *pdev)
 
 	ret = lm36274_init(chip);
 	if (ret) {
+		fwnode_handle_put(init_data.fwnode);
 		dev_err(chip->dev, "Failed to init the device\n");
 		return ret;
 	}
-- 
2.31.1

