Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 768EE378034
	for <lists+linux-leds@lfdr.de>; Mon, 10 May 2021 11:52:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231226AbhEJJw7 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 10 May 2021 05:52:59 -0400
Received: from fgw23-7.mail.saunalahti.fi ([62.142.5.84]:14679 "EHLO
        fgw23-7.mail.saunalahti.fi" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230429AbhEJJw2 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Mon, 10 May 2021 05:52:28 -0400
Received: from localhost (88-115-248-186.elisa-laajakaista.fi [88.115.248.186])
        by fgw23.mail.saunalahti.fi (Halon) with ESMTP
        id 41a1ad77-b175-11eb-8ccd-005056bdfda7;
        Mon, 10 May 2021 12:51:13 +0300 (EEST)
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
Subject: [PATCH v1 18/28] leds: lm3692x: Put fwnode in any case during ->probe()
Date:   Mon, 10 May 2021 12:50:35 +0300
Message-Id: <20210510095045.3299382-19-andy.shevchenko@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210510095045.3299382-1-andy.shevchenko@gmail.com>
References: <20210510095045.3299382-1-andy.shevchenko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

device_get_next_child_node() bumps a reference counting of a returned variable.
We have to balance it whenever we return to the caller.

Fixes: 9a5c1c64ac0a ("leds: lm3692x: Change DT calls to fwnode calls")
Cc: Dan Murphy <dmurphy@ti.com>
Signed-off-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---
 drivers/leds/leds-lm3692x.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/leds/leds-lm3692x.c b/drivers/leds/leds-lm3692x.c
index e945de45388c..55e6443997ec 100644
--- a/drivers/leds/leds-lm3692x.c
+++ b/drivers/leds/leds-lm3692x.c
@@ -435,6 +435,7 @@ static int lm3692x_probe_dt(struct lm3692x_led *led)
 
 	ret = fwnode_property_read_u32(child, "reg", &led->led_enable);
 	if (ret) {
+		fwnode_handle_put(child);
 		dev_err(&led->client->dev, "reg DT property missing\n");
 		return ret;
 	}
@@ -449,12 +450,11 @@ static int lm3692x_probe_dt(struct lm3692x_led *led)
 
 	ret = devm_led_classdev_register_ext(&led->client->dev, &led->led_dev,
 					     &init_data);
-	if (ret) {
+	if (ret)
 		dev_err(&led->client->dev, "led register err: %d\n", ret);
-		return ret;
-	}
 
-	return 0;
+	fwnode_handle_put(init_data.fwnode);
+	return ret;
 }
 
 static int lm3692x_probe(struct i2c_client *client,
-- 
2.31.1

