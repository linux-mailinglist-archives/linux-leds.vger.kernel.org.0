Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE70E37802A
	for <lists+linux-leds@lfdr.de>; Mon, 10 May 2021 11:52:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231144AbhEJJwu (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 10 May 2021 05:52:50 -0400
Received: from fgw20-7.mail.saunalahti.fi ([62.142.5.81]:64209 "EHLO
        fgw20-7.mail.saunalahti.fi" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231162AbhEJJwa (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Mon, 10 May 2021 05:52:30 -0400
Received: from localhost (88-115-248-186.elisa-laajakaista.fi [88.115.248.186])
        by fgw20.mail.saunalahti.fi (Halon) with ESMTP
        id 429bd30f-b175-11eb-ba24-005056bd6ce9;
        Mon, 10 May 2021 12:51:15 +0300 (EEST)
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
Subject: [PATCH v1 20/28] leds: lm3697: Update header block to reflect reality
Date:   Mon, 10 May 2021 12:50:37 +0300
Message-Id: <20210510095045.3299382-21-andy.shevchenko@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210510095045.3299382-1-andy.shevchenko@gmail.com>
References: <20210510095045.3299382-1-andy.shevchenko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Currently the headers to be included look rather like a random set.
Update them a bit to reflect the reality.

While at it, drop unneeded dependcy to OF.

Signed-off-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---
 drivers/leds/Kconfig       | 2 +-
 drivers/leds/leds-lm3697.c | 9 +++++++--
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index ff80142facbb..e3ee3c34d535 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -878,7 +878,7 @@ config LEDS_TI_LMU_COMMON
 config LEDS_LM3697
 	tristate "LED driver for LM3697"
 	depends on LEDS_TI_LMU_COMMON
-	depends on I2C && OF
+	depends on I2C
 	help
 	  Say Y to enable the LM3697 LED driver for TI LMU devices.
 	  This supports the LED device LM3697.
diff --git a/drivers/leds/leds-lm3697.c b/drivers/leds/leds-lm3697.c
index 7d216cdb91a8..9d35dd2a9bf0 100644
--- a/drivers/leds/leds-lm3697.c
+++ b/drivers/leds/leds-lm3697.c
@@ -2,11 +2,16 @@
 // TI LM3697 LED chip family driver
 // Copyright (C) 2018 Texas Instruments Incorporated - https://www.ti.com/
 
+#include <linux/bits.h>
 #include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
-#include <linux/of.h>
-#include <linux/of_gpio.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/property.h>
+#include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
+#include <linux/types.h>
+
 #include <linux/leds-ti-lmu-common.h>
 
 #define LM3697_REV			0x0
-- 
2.31.1

