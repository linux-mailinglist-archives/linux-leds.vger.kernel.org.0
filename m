Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C5FF0394BF0
	for <lists+linux-leds@lfdr.de>; Sat, 29 May 2021 13:19:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229756AbhE2LVU (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 29 May 2021 07:21:20 -0400
Received: from fgw21-7.mail.saunalahti.fi ([62.142.5.82]:38858 "EHLO
        fgw21-7.mail.saunalahti.fi" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229723AbhE2LVT (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Sat, 29 May 2021 07:21:19 -0400
Received: from localhost (88-115-248-186.elisa-laajakaista.fi [88.115.248.186])
        by fgw21.mail.saunalahti.fi (Halon) with ESMTP
        id c3473160-c06f-11eb-9eb8-005056bdd08f;
        Sat, 29 May 2021 14:19:41 +0300 (EEST)
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
Subject: [PATCH v2 05/13] leds: lgm-sso: Don't spam logs when probe is deferred
Date:   Sat, 29 May 2021 14:19:27 +0300
Message-Id: <20210529111935.3849707-5-andy.shevchenko@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210529111935.3849707-1-andy.shevchenko@gmail.com>
References: <20210529111935.3849707-1-andy.shevchenko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

When requesting GPIO line the probe can be deferred.
In such case don't spam logs with an error message.
This can be achieved by switching to dev_err_probe().

Fixes: c3987cd2bca3 ("leds: lgm: Add LED controller driver for LGM SoC")
Cc: Amireddy Mallikarjuna reddy <mallikarjunax.reddy@linux.intel.com>
Signed-off-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---
v2: fixed authorship / committer (Pavel)
 drivers/leds/blink/leds-lgm-sso.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/blink/leds-lgm-sso.c b/drivers/leds/blink/leds-lgm-sso.c
index a27687e0fc04..877b44594b26 100644
--- a/drivers/leds/blink/leds-lgm-sso.c
+++ b/drivers/leds/blink/leds-lgm-sso.c
@@ -646,7 +646,7 @@ __sso_led_dt_parse(struct sso_led_priv *priv, struct fwnode_handle *fw_ssoled)
 							      fwnode_child,
 							      GPIOD_ASIS, NULL);
 		if (IS_ERR(led->gpiod)) {
-			dev_err(dev, "led: get gpio fail!\n");
+			dev_err_probe(dev, PTR_ERR(led->gpiod), "led: get gpio fail!\n");
 			goto __dt_err;
 		}
 
-- 
2.31.1

