Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7E692531EB
	for <lists+linux-leds@lfdr.de>; Wed, 26 Aug 2020 16:50:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727935AbgHZOuW (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 26 Aug 2020 10:50:22 -0400
Received: from mail.kernel.org ([198.145.29.99]:35940 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727937AbgHZOuT (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Wed, 26 Aug 2020 10:50:19 -0400
Received: from localhost.localdomain (unknown [194.230.155.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 582732078D;
        Wed, 26 Aug 2020 14:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598453419;
        bh=HmqM7R3r2SqMGJttHaUpwqTq3zLTi/LuDmgVEImBqN0=;
        h=From:To:Cc:Subject:Date:From;
        b=hoYgeJw+MKxcZ21NRRGgN4SgmK+Qzc9G3xiLTMkOdVGX1Vrc1GFDQoNPqjDO9Ia2E
         G9yxmL8JE2Ni43mBwN5kxebmcdQYDpe+iwO8gEAIsbC0lXId/Pem5hYlbo0RmOoh72
         x/37RoL+6H4n1QuQwLcn7EqhA34LZslgxUI0G1x4=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH 1/4] leds: lm3692x: Simplify with dev_err_probe()
Date:   Wed, 26 Aug 2020 16:50:10 +0200
Message-Id: <20200826145013.10230-1-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Common pattern of handling deferred probe can be simplified with
dev_err_probe().  Less code and also it prints the error value.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/leds/leds-lm3692x.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/leds/leds-lm3692x.c b/drivers/leds/leds-lm3692x.c
index e1e2d2b64a56..1d7ea1b76a12 100644
--- a/drivers/leds/leds-lm3692x.c
+++ b/drivers/leds/leds-lm3692x.c
@@ -394,13 +394,10 @@ static int lm3692x_probe_dt(struct lm3692x_led *led)
 	led->regulator = devm_regulator_get_optional(&led->client->dev, "vled");
 	if (IS_ERR(led->regulator)) {
 		ret = PTR_ERR(led->regulator);
-		if (ret != -ENODEV) {
-			if (ret != -EPROBE_DEFER)
-				dev_err(&led->client->dev,
-					"Failed to get vled regulator: %d\n",
-					ret);
-			return ret;
-		}
+		if (ret != -ENODEV)
+			return dev_err_probe(&led->client->dev, ret,
+					     "Failed to get vled regulator\n");
+
 		led->regulator = NULL;
 	}
 
-- 
2.17.1

