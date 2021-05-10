Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2B37378013
	for <lists+linux-leds@lfdr.de>; Mon, 10 May 2021 11:51:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231243AbhEJJwl (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 10 May 2021 05:52:41 -0400
Received: from fgw22-7.mail.saunalahti.fi ([62.142.5.83]:17398 "EHLO
        fgw22-7.mail.saunalahti.fi" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231130AbhEJJwY (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Mon, 10 May 2021 05:52:24 -0400
Received: from localhost (88-115-248-186.elisa-laajakaista.fi [88.115.248.186])
        by fgw22.mail.saunalahti.fi (Halon) with ESMTP
        id 401f8309-b175-11eb-88cb-005056bdf889;
        Mon, 10 May 2021 12:51:11 +0300 (EEST)
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
Subject: [PATCH v1 15/28] leds: lm3532: Make error handling more robust
Date:   Mon, 10 May 2021 12:50:32 +0300
Message-Id: <20210510095045.3299382-16-andy.shevchenko@gmail.com>
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
 drivers/leds/leds-lm3532.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/leds/leds-lm3532.c b/drivers/leds/leds-lm3532.c
index 0bf25bdde02f..beb53040e09e 100644
--- a/drivers/leds/leds-lm3532.c
+++ b/drivers/leds/leds-lm3532.c
@@ -586,7 +586,6 @@ static int lm3532_parse_node(struct lm3532_data *priv)
 		ret = fwnode_property_read_u32(child, "reg", &control_bank);
 		if (ret) {
 			dev_err(&priv->client->dev, "reg property missing\n");
-			fwnode_handle_put(child);
 			goto child_out;
 		}
 
@@ -601,7 +600,6 @@ static int lm3532_parse_node(struct lm3532_data *priv)
 					       &led->mode);
 		if (ret) {
 			dev_err(&priv->client->dev, "ti,led-mode property missing\n");
-			fwnode_handle_put(child);
 			goto child_out;
 		}
 
@@ -636,7 +634,6 @@ static int lm3532_parse_node(struct lm3532_data *priv)
 						    led->num_leds);
 		if (ret) {
 			dev_err(&priv->client->dev, "led-sources property missing\n");
-			fwnode_handle_put(child);
 			goto child_out;
 		}
 
@@ -647,7 +644,6 @@ static int lm3532_parse_node(struct lm3532_data *priv)
 		if (ret) {
 			dev_err(&priv->client->dev, "led register err: %d\n",
 				ret);
-			fwnode_handle_put(child);
 			goto child_out;
 		}
 
@@ -655,14 +651,15 @@ static int lm3532_parse_node(struct lm3532_data *priv)
 		if (ret) {
 			dev_err(&priv->client->dev, "register init err: %d\n",
 				ret);
-			fwnode_handle_put(child);
 			goto child_out;
 		}
 
 		i++;
 	}
+	return 0;
 
 child_out:
+	fwnode_handle_put(child);
 	return ret;
 }
 
-- 
2.31.1

