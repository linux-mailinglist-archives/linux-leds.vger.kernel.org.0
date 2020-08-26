Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D489A2531FA
	for <lists+linux-leds@lfdr.de>; Wed, 26 Aug 2020 16:51:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726885AbgHZOuX (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 26 Aug 2020 10:50:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:36024 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727939AbgHZOuV (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Wed, 26 Aug 2020 10:50:21 -0400
Received: from localhost.localdomain (unknown [194.230.155.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 099F9221E2;
        Wed, 26 Aug 2020 14:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598453421;
        bh=mLmHNNYAulsYIvuCLX3SOGim/VZfkqUsFtnN2e6UEk4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=2tN+CuPDaLD5qDm5Q7BEHLs124HFQ/2J81VX1LnwKl/ANWHd1JTLjgu5oJgFgrQiI
         3vsFRpkyBJWVSu5r1i5yIXYMebESESMyDHoWyghcbH+LxEuV4NnkT21fPVKTvMGcmz
         komlFQndmkPvafLK+a4dkWaLmE0USGNmeKLQif3w=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH 2/4] leds: pwm: Simplify with dev_err_probe()
Date:   Wed, 26 Aug 2020 16:50:11 +0200
Message-Id: <20200826145013.10230-2-krzk@kernel.org>
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
 drivers/leds/leds-pwm.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/leds/leds-pwm.c b/drivers/leds/leds-pwm.c
index ef7b91bd2064..e35a97c1d828 100644
--- a/drivers/leds/leds-pwm.c
+++ b/drivers/leds/leds-pwm.c
@@ -78,13 +78,10 @@ static int led_pwm_add(struct device *dev, struct led_pwm_priv *priv,
 		led_data->pwm = devm_fwnode_pwm_get(dev, fwnode, NULL);
 	else
 		led_data->pwm = devm_pwm_get(dev, led->name);
-	if (IS_ERR(led_data->pwm)) {
-		ret = PTR_ERR(led_data->pwm);
-		if (ret != -EPROBE_DEFER)
-			dev_err(dev, "unable to request PWM for %s: %d\n",
-				led->name, ret);
-		return ret;
-	}
+	if (IS_ERR(led_data->pwm))
+		return dev_err_probe(dev, PTR_ERR(led_data->pwm),
+				     "unable to request PWM for %s\n",
+				     led->name);
 
 	led_data->cdev.brightness_set_blocking = led_pwm_set;
 
-- 
2.17.1

