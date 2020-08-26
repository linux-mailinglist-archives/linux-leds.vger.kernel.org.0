Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 108FD2531FD
	for <lists+linux-leds@lfdr.de>; Wed, 26 Aug 2020 16:51:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727012AbgHZOvL (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 26 Aug 2020 10:51:11 -0400
Received: from mail.kernel.org ([198.145.29.99]:36084 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727933AbgHZOuX (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Wed, 26 Aug 2020 10:50:23 -0400
Received: from localhost.localdomain (unknown [194.230.155.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B19FA2224D;
        Wed, 26 Aug 2020 14:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598453422;
        bh=mPxrskT16BTXZLsuW1Na7OVRaeDyD5RwQHrNqaXEdyo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=MVN95EpKseaVsjjqPh+floPvXJNIJCpyCH6EJxl2LHeopYGobeOcvip/Wb3habmiU
         y4O07n84Bws14k3eO+c3Bbii/THS+JBwpsHf7glmStZBEiWM3TGsPYVeRMT9GRdkPs
         dlmoheUc1pe2AANhI50VJPG9Oj8Dntg/RDO4NzIM=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH 3/4] leds: sgm3140: Simplify with dev_err_probe()
Date:   Wed, 26 Aug 2020 16:50:12 +0200
Message-Id: <20200826145013.10230-3-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200826145013.10230-1-krzk@kernel.org>
References: <20200826145013.10230-1-krzk@kernel.org>
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Common pattern of handling deferred probe can be simplified with
dev_err_probe().  Less code and also it prints the error value.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/leds/leds-sgm3140.c | 27 +++++++++------------------
 1 file changed, 9 insertions(+), 18 deletions(-)

diff --git a/drivers/leds/leds-sgm3140.c b/drivers/leds/leds-sgm3140.c
index 28c8b31fa952..f4f831570f11 100644
--- a/drivers/leds/leds-sgm3140.c
+++ b/drivers/leds/leds-sgm3140.c
@@ -195,30 +195,21 @@ static int sgm3140_probe(struct platform_device *pdev)
 
 	priv->flash_gpio = devm_gpiod_get(&pdev->dev, "flash", GPIOD_OUT_LOW);
 	ret = PTR_ERR_OR_ZERO(priv->flash_gpio);
-	if (ret) {
-		if (ret != -EPROBE_DEFER)
-			dev_err(&pdev->dev,
-				"Failed to request flash gpio: %d\n", ret);
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "Failed to request flash gpio\n");
 
 	priv->enable_gpio = devm_gpiod_get(&pdev->dev, "enable", GPIOD_OUT_LOW);
 	ret = PTR_ERR_OR_ZERO(priv->enable_gpio);
-	if (ret) {
-		if (ret != -EPROBE_DEFER)
-			dev_err(&pdev->dev,
-				"Failed to request enable gpio: %d\n", ret);
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "Failed to request enable gpio\n");
 
 	priv->vin_regulator = devm_regulator_get(&pdev->dev, "vin");
 	ret = PTR_ERR_OR_ZERO(priv->vin_regulator);
-	if (ret) {
-		if (ret != -EPROBE_DEFER)
-			dev_err(&pdev->dev,
-				"Failed to request regulator: %d\n", ret);
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "Failed to request regulator\n");
 
 	child_node = fwnode_get_next_available_child_node(pdev->dev.fwnode,
 							  NULL);
-- 
2.17.1

