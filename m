Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 941FB37800D
	for <lists+linux-leds@lfdr.de>; Mon, 10 May 2021 11:51:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231168AbhEJJw0 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 10 May 2021 05:52:26 -0400
Received: from fgw20-7.mail.saunalahti.fi ([62.142.5.81]:64036 "EHLO
        fgw20-7.mail.saunalahti.fi" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230481AbhEJJwY (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Mon, 10 May 2021 05:52:24 -0400
Received: from localhost (88-115-248-186.elisa-laajakaista.fi [88.115.248.186])
        by fgw20.mail.saunalahti.fi (Halon) with ESMTP
        id 3fc5926c-b175-11eb-ba24-005056bd6ce9;
        Mon, 10 May 2021 12:51:10 +0300 (EEST)
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
Subject: [PATCH v1 14/28] leds: lm3532: select regmap I2C API
Date:   Mon, 10 May 2021 12:50:31 +0300
Message-Id: <20210510095045.3299382-15-andy.shevchenko@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210510095045.3299382-1-andy.shevchenko@gmail.com>
References: <20210510095045.3299382-1-andy.shevchenko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Regmap APIs should be selected, otherwise link can fail

ERROR: modpost: "__devm_regmap_init_i2c" [drivers/leds/leds-lm3532.ko] undefined!

Fixes: bc1b8492c764 ("leds: lm3532: Introduce the lm3532 LED driver")
Cc: Dan Murphy <dmurphy@ti.com>
Signed-off-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---
 drivers/leds/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index 531c79155717..b06eb12f14bf 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -198,6 +198,7 @@ config LEDS_LM3530
 
 config LEDS_LM3532
 	tristate "LCD Backlight driver for LM3532"
+	select REGMAP_I2C
 	depends on LEDS_CLASS
 	depends on I2C
 	help
-- 
2.31.1

