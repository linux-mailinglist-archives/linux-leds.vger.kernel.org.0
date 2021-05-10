Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1116937800E
	for <lists+linux-leds@lfdr.de>; Mon, 10 May 2021 11:51:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230481AbhEJJw0 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 10 May 2021 05:52:26 -0400
Received: from fgw21-7.mail.saunalahti.fi ([62.142.5.82]:42565 "EHLO
        fgw21-7.mail.saunalahti.fi" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230526AbhEJJwU (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Mon, 10 May 2021 05:52:20 -0400
Received: from localhost (88-115-248-186.elisa-laajakaista.fi [88.115.248.186])
        by fgw21.mail.saunalahti.fi (Halon) with ESMTP
        id 3f0710d0-b175-11eb-9eb8-005056bdd08f;
        Mon, 10 May 2021 12:51:09 +0300 (EEST)
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
Subject: [PATCH v1 13/28] leds: lgm-sso: Convert to use list_for_each_entry*() API
Date:   Mon, 10 May 2021 12:50:30 +0300
Message-Id: <20210510095045.3299382-14-andy.shevchenko@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210510095045.3299382-1-andy.shevchenko@gmail.com>
References: <20210510095045.3299382-1-andy.shevchenko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Convert to use list_for_each_entry*() API insted of open coded variants.
It saves few lines of code and makes iteasier to read and maintain.

Signed-off-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---
 drivers/leds/blink/leds-lgm-sso.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/leds/blink/leds-lgm-sso.c b/drivers/leds/blink/leds-lgm-sso.c
index f44d6bf5a5b3..5505eda3c800 100644
--- a/drivers/leds/blink/leds-lgm-sso.c
+++ b/drivers/leds/blink/leds-lgm-sso.c
@@ -620,7 +620,6 @@ __sso_led_dt_parse(struct sso_led_priv *priv, struct fwnode_handle *fw_ssoled)
 	struct device *dev = priv->dev;
 	struct sso_led_desc *desc;
 	struct sso_led *led;
-	struct list_head *p;
 	const char *tmp;
 	u32 prop;
 	int ret;
@@ -706,10 +705,8 @@ __sso_led_dt_parse(struct sso_led_priv *priv, struct fwnode_handle *fw_ssoled)
 __dt_err:
 	fwnode_handle_put(fwnode_child);
 	/* unregister leds */
-	list_for_each(p, &priv->led_list) {
-		led = list_entry(p, struct sso_led, list);
+	list_for_each_entry(led, &priv->led_list, list)
 		sso_led_shutdown(led);
-	}
 
 	return -EINVAL;
 }
@@ -844,14 +841,12 @@ static int intel_sso_led_probe(struct platform_device *pdev)
 static int intel_sso_led_remove(struct platform_device *pdev)
 {
 	struct sso_led_priv *priv;
-	struct list_head *pos, *n;
-	struct sso_led *led;
+	struct sso_led *led, *n;
 
 	priv = platform_get_drvdata(pdev);
 
-	list_for_each_safe(pos, n, &priv->led_list) {
-		list_del(pos);
-		led = list_entry(pos, struct sso_led, list);
+	list_for_each_entry_safe(led, n, &priv->led_list, list) {
+		list_del(&led->list);
 		sso_led_shutdown(led);
 	}
 
-- 
2.31.1

