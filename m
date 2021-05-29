Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 43934394BFD
	for <lists+linux-leds@lfdr.de>; Sat, 29 May 2021 13:19:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229789AbhE2LVa (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 29 May 2021 07:21:30 -0400
Received: from fgw22-7.mail.saunalahti.fi ([62.142.5.83]:14270 "EHLO
        fgw22-7.mail.saunalahti.fi" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229825AbhE2LV2 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Sat, 29 May 2021 07:21:28 -0400
Received: from localhost (88-115-248-186.elisa-laajakaista.fi [88.115.248.186])
        by fgw22.mail.saunalahti.fi (Halon) with ESMTP
        id c7064bb3-c06f-11eb-88cb-005056bdf889;
        Sat, 29 May 2021 14:19:48 +0300 (EEST)
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
Cc:     Luca Weiss <luca@z3ntu.xyz>
Subject: [PATCH v2 13/13] leds: sgm3140: Put fwnode in any case during ->probe()
Date:   Sat, 29 May 2021 14:19:35 +0300
Message-Id: <20210529111935.3849707-13-andy.shevchenko@gmail.com>
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

Fixes: cef8ec8cbd21 ("leds: add sgm3140 driver")
Cc: Luca Weiss <luca@z3ntu.xyz>
Signed-off-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---
v2: no changes
 drivers/leds/leds-sgm3140.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/leds/leds-sgm3140.c b/drivers/leds/leds-sgm3140.c
index f4f831570f11..df9402071695 100644
--- a/drivers/leds/leds-sgm3140.c
+++ b/drivers/leds/leds-sgm3140.c
@@ -266,12 +266,8 @@ static int sgm3140_probe(struct platform_device *pdev)
 					   child_node,
 					   fled_cdev, NULL,
 					   &v4l2_sd_cfg);
-	if (IS_ERR(priv->v4l2_flash)) {
-		ret = PTR_ERR(priv->v4l2_flash);
-		goto err;
-	}
-
-	return ret;
+	fwnode_handle_put(child_node);
+	return PTR_ERR_OR_ZERO(priv->v4l2_flash);
 
 err:
 	fwnode_handle_put(child_node);
-- 
2.31.1

