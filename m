Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 05BB0B8A7B
	for <lists+linux-leds@lfdr.de>; Fri, 20 Sep 2019 07:33:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390482AbfITFds (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 20 Sep 2019 01:33:48 -0400
Received: from honk.sigxcpu.org ([24.134.29.49]:39854 "EHLO honk.sigxcpu.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390374AbfITFds (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Fri, 20 Sep 2019 01:33:48 -0400
Received: from localhost (localhost [127.0.0.1])
        by honk.sigxcpu.org (Postfix) with ESMTP id A6614FB03;
        Fri, 20 Sep 2019 07:33:46 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
        by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id mbFqnZjl7fSg; Fri, 20 Sep 2019 07:33:45 +0200 (CEST)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
        id EA8D648849; Thu, 19 Sep 2019 22:27:07 -0700 (PDT)
From:   =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/5] leds: lm3692x: Use flags from LM3692X_BRT_CTRL
Date:   Thu, 19 Sep 2019 22:27:07 -0700
Message-Id: <0cb2b013f979f4ef2e0a84bb98baee3724c19f00.1568957104.git.agx@sigxcpu.org>
X-Mailer: git-send-email 2.23.0.rc1
In-Reply-To: <cover.1568957104.git.agx@sigxcpu.org>
References: <cover.1568957104.git.agx@sigxcpu.org>
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
Reviewed-by: Dan Murphy <dmurphy@ti.com>
Acked-by: Pavel Machek <pavel@ucw.cz>
---
 drivers/leds/leds-lm3692x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/leds-lm3692x.c b/drivers/leds/leds-lm3692x.c
index d8a60c7c8077..a404b66b31e5 100644
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

