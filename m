Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8AFCB394BF2
	for <lists+linux-leds@lfdr.de>; Sat, 29 May 2021 13:19:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229723AbhE2LVV (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 29 May 2021 07:21:21 -0400
Received: from fgw22-7.mail.saunalahti.fi ([62.142.5.83]:14070 "EHLO
        fgw22-7.mail.saunalahti.fi" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229719AbhE2LVT (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Sat, 29 May 2021 07:21:19 -0400
Received: from localhost (88-115-248-186.elisa-laajakaista.fi [88.115.248.186])
        by fgw22.mail.saunalahti.fi (Halon) with ESMTP
        id c1f3f92d-c06f-11eb-88cb-005056bdf889;
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
Cc:     Oleh Kravchenko <oleg@kaa.org.ua>
Subject: [PATCH v2 03/13] leds: el15203000: Correct headers (of*.h -> mod_devicetable.h)
Date:   Sat, 29 May 2021 14:19:25 +0300
Message-Id: <20210529111935.3849707-3-andy.shevchenko@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210529111935.3849707-1-andy.shevchenko@gmail.com>
References: <20210529111935.3849707-1-andy.shevchenko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

There is no user of of*.h headers, but mod_devicetable.h.
Update header block accordingly.

Signed-off-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Reviewed-by: Oleh Kravchenko <oleg@kaa.org.ua>
---
v2: dropped OF change (Pavel), added Rb tag (Oleg)
 drivers/leds/leds-el15203000.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/leds/leds-el15203000.c b/drivers/leds/leds-el15203000.c
index 77e76f775385..e81a93d57210 100644
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

