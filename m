Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15EB8377FFE
	for <lists+linux-leds@lfdr.de>; Mon, 10 May 2021 11:51:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230517AbhEJJwQ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 10 May 2021 05:52:16 -0400
Received: from fgw22-7.mail.saunalahti.fi ([62.142.5.83]:17086 "EHLO
        fgw22-7.mail.saunalahti.fi" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230484AbhEJJwO (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Mon, 10 May 2021 05:52:14 -0400
Received: from localhost (88-115-248-186.elisa-laajakaista.fi [88.115.248.186])
        by fgw22.mail.saunalahti.fi (Halon) with ESMTP
        id 3b10f6f4-b175-11eb-88cb-005056bdf889;
        Mon, 10 May 2021 12:51:02 +0300 (EEST)
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
Subject: [PATCH v1 05/28] leds: el15203000: Correct headers (of*.h -> mod_devicetable.h)
Date:   Mon, 10 May 2021 12:50:22 +0300
Message-Id: <20210510095045.3299382-6-andy.shevchenko@gmail.com>
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
 drivers/leds/Kconfig           | 1 -
 drivers/leds/leds-el15203000.c | 3 ++-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index dcbfcd491fd0..531c79155717 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -167,7 +167,6 @@ config LEDS_EL15203000
 	tristate "LED Support for Crane EL15203000"
 	depends on LEDS_CLASS
 	depends on SPI
-	depends on OF
 	help
 	  This option enables support for EL15203000 LED Board
 	  (aka RED LED board) which is widely used in coffee vending
diff --git a/drivers/leds/leds-el15203000.c b/drivers/leds/leds-el15203000.c
index bcdbbbc9c187..fcb90d7cd42f 100644
--- a/drivers/leds/leds-el15203000.c
+++ b/drivers/leds/leds-el15203000.c
@@ -4,8 +4,9 @@
 
 #include <linux/delay.h>
 #include <linux/leds.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
-#include <linux/of_device.h>
+#include <linux/property.h>
 #include <linux/spi/spi.h>
 
 /*
-- 
2.31.1

