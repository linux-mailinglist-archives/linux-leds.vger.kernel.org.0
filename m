Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 779E7394BEF
	for <lists+linux-leds@lfdr.de>; Sat, 29 May 2021 13:19:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229746AbhE2LVT (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 29 May 2021 07:21:19 -0400
Received: from fgw23-7.mail.saunalahti.fi ([62.142.5.84]:13869 "EHLO
        fgw23-7.mail.saunalahti.fi" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229710AbhE2LVR (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Sat, 29 May 2021 07:21:17 -0400
Received: from localhost (88-115-248-186.elisa-laajakaista.fi [88.115.248.186])
        by fgw23.mail.saunalahti.fi (Halon) with ESMTP
        id c15494ef-c06f-11eb-8ccd-005056bdfda7;
        Sat, 29 May 2021 14:19:38 +0300 (EEST)
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
Subject: [PATCH v2 02/13] leds: el15203000: Give better margin for usleep_range()
Date:   Sat, 29 May 2021 14:19:24 +0300
Message-Id: <20210529111935.3849707-2-andy.shevchenko@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210529111935.3849707-1-andy.shevchenko@gmail.com>
References: <20210529111935.3849707-1-andy.shevchenko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

1 microsecond with 20 millisecond parameter is too low margin for
usleep_range(). Give 100 to make scheduler been less tortured.

While at it, fix indentation in cases where EL_FW_DELAY_USEC is in use.
In the loop, move it to the end to avoid a conditional.

Signed-off-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---
v2: amended the commit message
 drivers/leds/leds-el15203000.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/drivers/leds/leds-el15203000.c b/drivers/leds/leds-el15203000.c
index 76b455e87574..77e76f775385 100644
--- a/drivers/leds/leds-el15203000.c
+++ b/drivers/leds/leds-el15203000.c
@@ -97,27 +97,22 @@ static int el15203000_cmd(struct el15203000_led *led, u8 brightness)
 
 	/* to avoid SPI mistiming with firmware we should wait some time */
 	if (time_after(led->priv->delay, jiffies)) {
-		dev_dbg(led->priv->dev, "Wait %luus to sync",
-			EL_FW_DELAY_USEC);
+		dev_dbg(led->priv->dev, "Wait %luus to sync", EL_FW_DELAY_USEC);
 
-		usleep_range(EL_FW_DELAY_USEC,
-			     EL_FW_DELAY_USEC + 1);
+		usleep_range(EL_FW_DELAY_USEC, EL_FW_DELAY_USEC + 100);
 	}
 
 	cmd[0] = led->reg;
 	cmd[1] = brightness;
 
 	for (i = 0; i < ARRAY_SIZE(cmd); i++) {
-		if (i)
-			usleep_range(EL_FW_DELAY_USEC,
-				     EL_FW_DELAY_USEC + 1);
-
 		ret = spi_write(led->priv->spi, &cmd[i], sizeof(cmd[i]));
 		if (ret) {
 			dev_err(led->priv->dev,
 				"spi_write() error %d", ret);
 			break;
 		}
+		usleep_range(EL_FW_DELAY_USEC, EL_FW_DELAY_USEC + 100);
 	}
 
 	led->priv->delay = jiffies + usecs_to_jiffies(EL_FW_DELAY_USEC);
@@ -306,8 +301,7 @@ static int el15203000_probe(struct spi_device *spi)
 	priv->count	= count;
 	priv->dev	= &spi->dev;
 	priv->spi	= spi;
-	priv->delay	= jiffies -
-			  usecs_to_jiffies(EL_FW_DELAY_USEC);
+	priv->delay	= jiffies - usecs_to_jiffies(EL_FW_DELAY_USEC);
 
 	spi_set_drvdata(spi, priv);
 
-- 
2.31.1

