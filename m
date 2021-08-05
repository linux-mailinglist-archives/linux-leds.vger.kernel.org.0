Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2EE53E13D3
	for <lists+linux-leds@lfdr.de>; Thu,  5 Aug 2021 13:26:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241028AbhHEL0R (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 5 Aug 2021 07:26:17 -0400
Received: from mga03.intel.com ([134.134.136.65]:43033 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S241017AbhHEL0Q (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Thu, 5 Aug 2021 07:26:16 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10066"; a="214158748"
X-IronPort-AV: E=Sophos;i="5.84,296,1620716400"; 
   d="scan'208";a="214158748"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2021 04:26:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,296,1620716400"; 
   d="scan'208";a="458987333"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga007.jf.intel.com with ESMTP; 05 Aug 2021 04:25:58 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id A0164142; Thu,  5 Aug 2021 14:26:28 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Pavel Machek <pavel@ucw.cz>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Amireddy Mallikarjuna reddy 
        <mallikarjunax.reddy@linux.intel.com>, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     kernel test robot <lkp@intel.com>
Subject: [PATCH v1 1/1] leds: lgm-sso: Propagate error codes from callee to caller
Date:   Thu,  5 Aug 2021 14:26:19 +0300
Message-Id: <20210805112619.65116-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

The one of the latest change to the driver reveals the problem that
the error codes from callee aren't propagated to the caller of
__sso_led_dt_parse(). Fix this accordingly.

Fixes: 9999908ca1ab ("leds: lgm-sso: Put fwnode in any case during ->probe()")
Fixes: c3987cd2bca3 ("leds: lgm: Add LED controller driver for LGM SoC")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/leds/blink/leds-lgm-sso.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/leds/blink/leds-lgm-sso.c b/drivers/leds/blink/leds-lgm-sso.c
index e47c47e421d6..fd8b7573285a 100644
--- a/drivers/leds/blink/leds-lgm-sso.c
+++ b/drivers/leds/blink/leds-lgm-sso.c
@@ -640,7 +640,7 @@ __sso_led_dt_parse(struct sso_led_priv *priv, struct fwnode_handle *fw_ssoled)
 							      fwnode_child,
 							      GPIOD_ASIS, NULL);
 		if (IS_ERR(led->gpiod)) {
-			dev_err_probe(dev, PTR_ERR(led->gpiod), "led: get gpio fail!\n");
+			ret = dev_err_probe(dev, PTR_ERR(led->gpiod), "led: get gpio fail!\n");
 			goto __dt_err;
 		}
 
@@ -660,8 +660,11 @@ __sso_led_dt_parse(struct sso_led_priv *priv, struct fwnode_handle *fw_ssoled)
 			desc->panic_indicator = 1;
 
 		ret = fwnode_property_read_u32(fwnode_child, "reg", &prop);
-		if (ret != 0 || prop >= SSO_LED_MAX_NUM) {
+		if (ret)
+			goto __dt_err;
+		if (prop >= SSO_LED_MAX_NUM) {
 			dev_err(dev, "invalid LED pin:%u\n", prop);
+			ret = -EINVAL;
 			goto __dt_err;
 		}
 		desc->pin = prop;
@@ -697,7 +700,8 @@ __sso_led_dt_parse(struct sso_led_priv *priv, struct fwnode_handle *fw_ssoled)
 				desc->brightness = LED_FULL;
 		}
 
-		if (sso_create_led(priv, led, fwnode_child))
+		ret = sso_create_led(priv, led, fwnode_child);
+		if (ret)
 			goto __dt_err;
 	}
 
@@ -709,7 +713,7 @@ __sso_led_dt_parse(struct sso_led_priv *priv, struct fwnode_handle *fw_ssoled)
 	list_for_each_entry(led, &priv->led_list, list)
 		sso_led_shutdown(led);
 
-	return -EINVAL;
+	return ret;
 }
 
 static int sso_led_dt_parse(struct sso_led_priv *priv)
-- 
2.30.2

