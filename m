Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EDBFA3A045
	for <lists+linux-leds@lfdr.de>; Sat,  8 Jun 2019 16:30:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726984AbfFHOas (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 8 Jun 2019 10:30:48 -0400
Received: from smtp.220.in.ua ([89.184.67.205]:36327 "EHLO smtp.220.in.ua"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726227AbfFHOas (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Sat, 8 Jun 2019 10:30:48 -0400
Received: from oleh-pc.lan (unknown [95.67.115.55])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by smtp.220.in.ua (Postfix) with ESMTPSA id 886D31A20425;
        Sat,  8 Jun 2019 17:30:45 +0300 (EEST)
From:   Oleh Kravchenko <oleg@kaa.org.ua>
To:     linux-leds@vger.kernel.org
Cc:     Oleh Kravchenko <oleg@kaa.org.ua>
Subject: [PATCH v2 1/2] Use usleep_range() for better precision timings
Date:   Sat,  8 Jun 2019 17:30:38 +0300
Message-Id: <20190608143039.13454-1-oleg@kaa.org.ua>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Documentation/timers/timers-howto.txt recommends to use msleep_range()
for delays less or equal 20ms. This driver use 10ms delays to talk with
hardware, so let's follow the rules.

Signed-off-by: Oleh Kravchenko <oleg@kaa.org.ua>
---
 drivers/leds/leds-cr0014114.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/leds/leds-cr0014114.c b/drivers/leds/leds-cr0014114.c
index 0e4262462cb9..91deb40db307 100644
--- a/drivers/leds/leds-cr0014114.c
+++ b/drivers/leds/leds-cr0014114.c
@@ -37,7 +37,7 @@
 
 /* CR0014114 default settings */
 #define CR_MAX_BRIGHTNESS	GENMASK(6, 0)
-#define CR_FW_DELAY_MSEC	10
+#define CR_FW_DELAY_USEC	10000
 #define CR_RECOUNT_DELAY	(HZ * 3600)
 
 struct cr0014114_led {
@@ -92,7 +92,7 @@ static int cr0014114_recount(struct cr0014114 *priv)
 
 	cmd = CR_NEXT_REENUMERATE;
 	for (i = 0; i < priv->count; i++) {
-		msleep(CR_FW_DELAY_MSEC);
+		usleep_range(CR_FW_DELAY_USEC, CR_FW_DELAY_USEC + 1);
 
 		ret = spi_write(priv->spi, &cmd, sizeof(cmd));
 		if (ret)
@@ -126,7 +126,7 @@ static int cr0014114_sync(struct cr0014114 *priv)
 			goto err;
 
 		priv->do_recount = false;
-		msleep(CR_FW_DELAY_MSEC);
+		usleep_range(CR_FW_DELAY_USEC, CR_FW_DELAY_USEC + 1);
 	}
 
 	priv->buf[0] = CR_SET_BRIGHTNESS;
@@ -136,7 +136,7 @@ static int cr0014114_sync(struct cr0014114 *priv)
 	ret = spi_write(priv->spi, priv->buf, priv->count + 2);
 
 err:
-	priv->delay = jiffies + msecs_to_jiffies(CR_FW_DELAY_MSEC);
+	priv->delay = jiffies + usecs_to_jiffies(CR_FW_DELAY_USEC);
 
 	return ret;
 }
@@ -252,7 +252,7 @@ static int cr0014114_probe(struct spi_device *spi)
 	priv->dev	= &spi->dev;
 	priv->spi	= spi;
 	priv->delay	= jiffies -
-			  msecs_to_jiffies(CR_FW_DELAY_MSEC);
+			  usecs_to_jiffies(CR_FW_DELAY_USEC);
 
 	priv->do_recount = true;
 	ret = cr0014114_sync(priv);
-- 
2.21.0

