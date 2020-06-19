Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62D54201DC9
	for <lists+linux-leds@lfdr.de>; Sat, 20 Jun 2020 00:10:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728977AbgFSWIk (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 19 Jun 2020 18:08:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:38976 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728906AbgFSWIk (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Fri, 19 Jun 2020 18:08:40 -0400
Received: from embeddedor (unknown [189.207.59.248])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A222622254;
        Fri, 19 Jun 2020 22:08:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592604520;
        bh=FPujhuHy8XQ5w+xZmYoRx4eJBUret8iD8/H/jWW313U=;
        h=Date:From:To:Cc:Subject:From;
        b=0Ryv3eBhGBUzUiiK8HHrpWqnIbHamBIdJ9W8VYJABtLrT7GSebtO0uDCxWsLzEBrg
         TOLyJHQt0PqnLJL2RcNY53JcAZ+ckZ7XHoxl0oX1ETb8fyHNwiGFh5iXMNzQO6C249
         VNrs3JAzHYvSa8PFn/mq7Gr61vNdmpuh9cEUlEbE=
Date:   Fri, 19 Jun 2020 17:14:03 -0500
From:   "Gustavo A. R. Silva" <gustavoars@kernel.org>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>
Cc:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: [PATCH][next] leds: gpio: Use struct_size() in devm_kzalloc()
Message-ID: <20200619221403.GA12097@embeddedor>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Make use of the struct_size() helper instead of an open-coded version
in order to avoid any potential type mistakes. Also, remove unnecessary
function sizeof_gpio_leds_priv().

This code was detected with the help of Coccinelle and, audited and
fixed manually.

Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
 drivers/leds/leds-gpio.c | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/drivers/leds/leds-gpio.c b/drivers/leds/leds-gpio.c
index 2bf74595610f..30ae453f32f7 100644
--- a/drivers/leds/leds-gpio.c
+++ b/drivers/leds/leds-gpio.c
@@ -125,12 +125,6 @@ struct gpio_leds_priv {
 	struct gpio_led_data leds[];
 };
 
-static inline int sizeof_gpio_leds_priv(int num_leds)
-{
-	return sizeof(struct gpio_leds_priv) +
-		(sizeof(struct gpio_led_data) * num_leds);
-}
-
 static struct gpio_leds_priv *gpio_leds_create(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -142,7 +136,7 @@ static struct gpio_leds_priv *gpio_leds_create(struct platform_device *pdev)
 	if (!count)
 		return ERR_PTR(-ENODEV);
 
-	priv = devm_kzalloc(dev, sizeof_gpio_leds_priv(count), GFP_KERNEL);
+	priv = devm_kzalloc(dev, struct_size(priv, leds, count), GFP_KERNEL);
 	if (!priv)
 		return ERR_PTR(-ENOMEM);
 
@@ -260,9 +254,8 @@ static int gpio_led_probe(struct platform_device *pdev)
 	int i, ret = 0;
 
 	if (pdata && pdata->num_leds) {
-		priv = devm_kzalloc(&pdev->dev,
-				sizeof_gpio_leds_priv(pdata->num_leds),
-					GFP_KERNEL);
+		priv = devm_kzalloc(&pdev->dev, struct_size(priv, leds, pdata->num_leds),
+				    GFP_KERNEL);
 		if (!priv)
 			return -ENOMEM;
 
-- 
2.27.0

