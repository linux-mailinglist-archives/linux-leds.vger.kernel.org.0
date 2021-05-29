Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7EBD394BFA
	for <lists+linux-leds@lfdr.de>; Sat, 29 May 2021 13:19:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229816AbhE2LV1 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 29 May 2021 07:21:27 -0400
Received: from fgw21-7.mail.saunalahti.fi ([62.142.5.82]:38943 "EHLO
        fgw21-7.mail.saunalahti.fi" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229795AbhE2LV0 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Sat, 29 May 2021 07:21:26 -0400
Received: from localhost (88-115-248-186.elisa-laajakaista.fi [88.115.248.186])
        by fgw21.mail.saunalahti.fi (Halon) with ESMTP
        id c61ae325-c06f-11eb-9eb8-005056bdd08f;
        Sat, 29 May 2021 14:19:46 +0300 (EEST)
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
Cc:     Daniel Mack <daniel@zonque.org>
Subject: [PATCH v2 11/13] leds: lt3593: Put fwnode in any case during ->probe()
Date:   Sat, 29 May 2021 14:19:33 +0300
Message-Id: <20210529111935.3849707-11-andy.shevchenko@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210529111935.3849707-1-andy.shevchenko@gmail.com>
References: <20210529111935.3849707-1-andy.shevchenko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

device_get_next_child_node() bumps a reference counting of a returned variable.
We have to balance it whenever we return to the caller.

Fixes: 8cd7d6daba93 ("leds: lt3593: Add device tree probing glue")
Cc: Daniel Mack <daniel@zonque.org>
Signed-off-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---
v2: no changes
 drivers/leds/leds-lt3593.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/leds/leds-lt3593.c b/drivers/leds/leds-lt3593.c
index 3bb52d3165d9..d0160fde0f94 100644
--- a/drivers/leds/leds-lt3593.c
+++ b/drivers/leds/leds-lt3593.c
@@ -97,10 +97,9 @@ static int lt3593_led_probe(struct platform_device *pdev)
 	init_data.default_label = ":";
 
 	ret = devm_led_classdev_register_ext(dev, &led_data->cdev, &init_data);
-	if (ret < 0) {
-		fwnode_handle_put(child);
+	fwnode_handle_put(child);
+	if (ret < 0)
 		return ret;
-	}
 
 	platform_set_drvdata(pdev, led_data);
 
-- 
2.31.1

