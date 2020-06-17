Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6DD661FD952
	for <lists+linux-leds@lfdr.de>; Thu, 18 Jun 2020 01:02:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726854AbgFQXCh (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 17 Jun 2020 19:02:37 -0400
Received: from mail.kernel.org ([198.145.29.99]:36988 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726815AbgFQXCh (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Wed, 17 Jun 2020 19:02:37 -0400
Received: from embeddedor (unknown [189.207.59.248])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 84D7721534;
        Wed, 17 Jun 2020 23:02:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592434957;
        bh=RtU4UVT0W5V2AvGSo7p1dFWrfPGF8q4AsQ/QgOLlWRs=;
        h=Date:From:To:Cc:Subject:From;
        b=kX20oqz+i5VQyNyMFq9+fscrbc4Ktgr1pcHUsCS639s0T9sakzKqYcKCL1x4csVcj
         DLPFkidMX7EFYxFooq78A3PQBqb6HzrzMK652SmjCSX2SHzTnscj5WE+qUwMoM5Ro+
         seI0lfuJz1604UcOPPvVX4Ri7pqXmztWE1E2BiYM=
Date:   Wed, 17 Jun 2020 18:07:57 -0500
From:   "Gustavo A. R. Silva" <gustavoars@kernel.org>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>
Cc:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: [PATCH][next] leds: ns2: Use struct_size() in devm_kzalloc()
Message-ID: <20200617230757.GA21324@embeddedor>
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
function sizeof_ns2_led_priv().

This code was detected with the help of Coccinelle and, audited and
fixed manually.

Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
 drivers/leds/leds-ns2.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/leds/leds-ns2.c b/drivers/leds/leds-ns2.c
index 538ca5755602..bd806e7c8017 100644
--- a/drivers/leds/leds-ns2.c
+++ b/drivers/leds/leds-ns2.c
@@ -348,12 +348,6 @@ struct ns2_led_priv {
 	struct ns2_led_data leds_data[];
 };
 
-static inline int sizeof_ns2_led_priv(int num_leds)
-{
-	return sizeof(struct ns2_led_priv) +
-		      (sizeof(struct ns2_led_data) * num_leds);
-}
-
 static int ns2_led_probe(struct platform_device *pdev)
 {
 	struct ns2_led_platform_data *pdata = dev_get_platdata(&pdev->dev);
@@ -378,8 +372,7 @@ static int ns2_led_probe(struct platform_device *pdev)
 		return -EINVAL;
 #endif /* CONFIG_OF_GPIO */
 
-	priv = devm_kzalloc(&pdev->dev,
-			    sizeof_ns2_led_priv(pdata->num_leds), GFP_KERNEL);
+	priv = devm_kzalloc(&pdev->dev, struct_size(priv, leds_data, pdata->num_leds), GFP_KERNEL);
 	if (!priv)
 		return -ENOMEM;
 	priv->num_leds = pdata->num_leds;
-- 
2.27.0

