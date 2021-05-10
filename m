Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B41A537802C
	for <lists+linux-leds@lfdr.de>; Mon, 10 May 2021 11:52:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231277AbhEJJwv (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 10 May 2021 05:52:51 -0400
Received: from fgw22-7.mail.saunalahti.fi ([62.142.5.83]:17498 "EHLO
        fgw22-7.mail.saunalahti.fi" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231159AbhEJJwa (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Mon, 10 May 2021 05:52:30 -0400
Received: from localhost (88-115-248-186.elisa-laajakaista.fi [88.115.248.186])
        by fgw22.mail.saunalahti.fi (Halon) with ESMTP
        id 4212ed5c-b175-11eb-88cb-005056bdf889;
        Mon, 10 May 2021 12:51:14 +0300 (EEST)
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
Subject: [PATCH v1 19/28] leds: lm3692x: Correct headers (of*.h -> mod_devicetable.h)
Date:   Mon, 10 May 2021 12:50:36 +0300
Message-Id: <20210510095045.3299382-20-andy.shevchenko@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210510095045.3299382-1-andy.shevchenko@gmail.com>
References: <20210510095045.3299382-1-andy.shevchenko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

There is no user of of*.h headers, but mod_devicetable.h.
Update header block accordingly.

While at it, drop unneeded dependency to OF.

Signed-off-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---
 drivers/leds/Kconfig        | 2 +-
 drivers/leds/leds-lm3692x.c | 3 +--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index b06eb12f14bf..ff80142facbb 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -232,7 +232,7 @@ config LEDS_LM3642
 
 config LEDS_LM3692X
 	tristate "LED support for LM3692x Chips"
-	depends on LEDS_CLASS && I2C && OF
+	depends on LEDS_CLASS && I2C
 	select REGMAP_I2C
 	help
 	  This option enables support for the TI LM3692x family
diff --git a/drivers/leds/leds-lm3692x.c b/drivers/leds/leds-lm3692x.c
index 55e6443997ec..50b4b8ee49fd 100644
--- a/drivers/leds/leds-lm3692x.c
+++ b/drivers/leds/leds-lm3692x.c
@@ -7,10 +7,9 @@
 #include <linux/init.h>
 #include <linux/leds.h>
 #include <linux/log2.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
-#include <linux/of.h>
-#include <linux/of_gpio.h>
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
 #include <linux/slab.h>
-- 
2.31.1

