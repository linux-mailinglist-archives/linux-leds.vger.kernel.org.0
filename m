Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8229394BF8
	for <lists+linux-leds@lfdr.de>; Sat, 29 May 2021 13:19:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229827AbhE2LV0 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 29 May 2021 07:21:26 -0400
Received: from fgw22-7.mail.saunalahti.fi ([62.142.5.83]:14186 "EHLO
        fgw22-7.mail.saunalahti.fi" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229789AbhE2LVZ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Sat, 29 May 2021 07:21:25 -0400
Received: from localhost (88-115-248-186.elisa-laajakaista.fi [88.115.248.186])
        by fgw22.mail.saunalahti.fi (Halon) with ESMTP
        id c510db35-c06f-11eb-88cb-005056bdf889;
        Sat, 29 May 2021 14:19:44 +0300 (EEST)
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
Subject: [PATCH v2 09/13] leds: lm3697: Update header block to reflect reality
Date:   Sat, 29 May 2021 14:19:31 +0300
Message-Id: <20210529111935.3849707-9-andy.shevchenko@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210529111935.3849707-1-andy.shevchenko@gmail.com>
References: <20210529111935.3849707-1-andy.shevchenko@gmail.com>
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
v2: dropped OF change (Pavel)
 drivers/leds/leds-lm3697.c | 9 +++++++--
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/leds/leds-lm3697.c b/drivers/leds/leds-lm3697.c
index 970a4f34791b..292d64b2eeab 100644
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

