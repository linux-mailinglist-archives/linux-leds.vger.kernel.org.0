Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A02FEB599B
	for <lists+linux-leds@lfdr.de>; Wed, 18 Sep 2019 04:20:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727742AbfIRCUH (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 17 Sep 2019 22:20:07 -0400
Received: from honk.sigxcpu.org ([24.134.29.49]:35254 "EHLO honk.sigxcpu.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727790AbfIRCUG (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Tue, 17 Sep 2019 22:20:06 -0400
Received: from localhost (localhost [127.0.0.1])
        by honk.sigxcpu.org (Postfix) with ESMTP id C96F1FB06;
        Wed, 18 Sep 2019 04:20:04 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
        by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id q1jHUL4tJnUN; Wed, 18 Sep 2019 04:20:04 +0200 (CEST)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
        id 4564649248; Tue, 17 Sep 2019 19:19:58 -0700 (PDT)
From:   =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 5/5] leds: lm3692x: Use flags from LM3692X_BRT_CTRL
Date:   Tue, 17 Sep 2019 19:19:58 -0700
Message-Id: <d1347a31ab9f86c3d13ab8016606999d5c0497cd.1568772964.git.agx@sigxcpu.org>
X-Mailer: git-send-email 2.23.0.rc1
In-Reply-To: <cover.1568772964.git.agx@sigxcpu.org>
References: <cover.1568772964.git.agx@sigxcpu.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Use LM3692X_RAMP_EN instead of LM3692X_PWM_HYSTER_4LSB
since the later is a flag for the PWM register. The
actual register value remains unchanged.

Signed-off-by: Guido Günther <agx@sigxcpu.org>
---
 drivers/leds/leds-lm3692x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/leds-lm3692x.c b/drivers/leds/leds-lm3692x.c
index d673f706385e..ecac586ca89c 100644
--- a/drivers/leds/leds-lm3692x.c
+++ b/drivers/leds/leds-lm3692x.c
@@ -269,7 +269,7 @@ static int lm3692x_init(struct lm3692x_led *led)
 		goto out;
 
 	ret = regmap_write(led->regmap, LM3692X_BRT_CTRL,
-			LM3692X_BL_ADJ_POL | LM3692X_PWM_HYSTER_4LSB);
+			LM3692X_BL_ADJ_POL | LM3692X_RAMP_EN);
 	if (ret)
 		goto out;
 
-- 
2.23.0.rc1

