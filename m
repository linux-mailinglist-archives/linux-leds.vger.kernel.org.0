Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A12E394BF3
	for <lists+linux-leds@lfdr.de>; Sat, 29 May 2021 13:19:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229800AbhE2LVY (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 29 May 2021 07:21:24 -0400
Received: from fgw21-7.mail.saunalahti.fi ([62.142.5.82]:38828 "EHLO
        fgw21-7.mail.saunalahti.fi" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229716AbhE2LVS (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Sat, 29 May 2021 07:21:18 -0400
Received: from localhost (88-115-248-186.elisa-laajakaista.fi [88.115.248.186])
        by fgw21.mail.saunalahti.fi (Halon) with ESMTP
        id c2d479f8-c06f-11eb-9eb8-005056bdd08f;
        Sat, 29 May 2021 14:19:40 +0300 (EEST)
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
Subject: [PATCH v2 04/13] leds: lgm-sso: Put fwnode in any case during ->probe()
Date:   Sat, 29 May 2021 14:19:26 +0300
Message-Id: <20210529111935.3849707-4-andy.shevchenko@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210529111935.3849707-1-andy.shevchenko@gmail.com>
References: <20210529111935.3849707-1-andy.shevchenko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

fwnode_get_next_child_node() bumps a reference counting of a returned variable.
We have to balance it whenever we return to the caller.

All the same in fwnode_for_each_child_node() case.

Fixes: c3987cd2bca3 ("leds: lgm: Add LED controller driver for LGM SoC")
Cc: Amireddy Mallikarjuna reddy <mallikarjunax.reddy@linux.intel.com>
Signed-off-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---
v2: simplified sso_led_dt_parse() fix (Pavel)
 drivers/leds/blink/leds-lgm-sso.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/leds/blink/leds-lgm-sso.c b/drivers/leds/blink/leds-lgm-sso.c
index e63112d445eb..a27687e0fc04 100644
--- a/drivers/leds/blink/leds-lgm-sso.c
+++ b/drivers/leds/blink/leds-lgm-sso.c
@@ -633,8 +633,10 @@ __sso_led_dt_parse(struct sso_led_priv *priv, struct fwnode_handle *fw_ssoled)
 
 	fwnode_for_each_child_node(fw_ssoled, fwnode_child) {
 		led = devm_kzalloc(dev, sizeof(*led), GFP_KERNEL);
-		if (!led)
-			return -ENOMEM;
+		if (!led) {
+			ret = -ENOMEM;
+			goto __dt_err;
+		}
 
 		INIT_LIST_HEAD(&led->list);
 		led->priv = priv;
@@ -704,11 +706,11 @@ __sso_led_dt_parse(struct sso_led_priv *priv, struct fwnode_handle *fw_ssoled)
 		if (sso_create_led(priv, led, fwnode_child))
 			goto __dt_err;
 	}
-	fwnode_handle_put(fw_ssoled);
 
 	return 0;
+
 __dt_err:
-	fwnode_handle_put(fw_ssoled);
+	fwnode_handle_put(fwnode_child);
 	/* unregister leds */
 	list_for_each(p, &priv->led_list) {
 		led = list_entry(p, struct sso_led, list);
@@ -733,6 +735,7 @@ static int sso_led_dt_parse(struct sso_led_priv *priv)
 	fw_ssoled = fwnode_get_named_child_node(fwnode, "ssoled");
 	if (fw_ssoled) {
 		ret = __sso_led_dt_parse(priv, fw_ssoled);
+		fwnode_handle_put(fw_ssoled);
 		if (ret)
 			return ret;
 	}
-- 
2.31.1

