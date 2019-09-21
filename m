Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A3BEABA1CA
	for <lists+linux-leds@lfdr.de>; Sun, 22 Sep 2019 12:25:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728202AbfIVKYa (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 22 Sep 2019 06:24:30 -0400
Received: from honk.sigxcpu.org ([24.134.29.49]:36236 "EHLO honk.sigxcpu.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728141AbfIVKYa (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Sun, 22 Sep 2019 06:24:30 -0400
Received: from localhost (localhost [127.0.0.1])
        by honk.sigxcpu.org (Postfix) with ESMTP id 2029FFB08;
        Sun, 22 Sep 2019 12:24:29 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
        by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id owtZTPbETakA; Sun, 22 Sep 2019 12:24:25 +0200 (CEST)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
        id DA8544866C; Sat, 21 Sep 2019 14:12:12 -0700 (PDT)
From:   =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 4/5] leds: lm3692x: Use flags from LM3692X_BOOST_CTRL
Date:   Sat, 21 Sep 2019 14:12:11 -0700
Message-Id: <258bf6f37d0b23cd4f72f97a042d81c2ea2e42b2.1569100154.git.agx@sigxcpu.org>
X-Mailer: git-send-email 2.23.0.rc1
In-Reply-To: <cover.1569100154.git.agx@sigxcpu.org>
References: <cover.1569100154.git.agx@sigxcpu.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

The current setup of LM3692X_BOOST_CTRL uses flags from LM3692X_BRT_CTRL.
Use flags from LM3692X_BOOST_CTRL but leave the resulting register value
unchanged.

Signed-off-by: Guido Günther <agx@sigxcpu.org>
Reviewed-by: Dan Murphy <dmurphy@ti.com>
Acked-by: Pavel Machek <pavel@ucw.cz>
---
 drivers/leds/leds-lm3692x.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/leds/leds-lm3692x.c b/drivers/leds/leds-lm3692x.c
index 54e9bd2d288b..a57b1571e359 100644
--- a/drivers/leds/leds-lm3692x.c
+++ b/drivers/leds/leds-lm3692x.c
@@ -250,9 +250,9 @@ static int lm3692x_init(struct lm3692x_led *led)
 		goto out;
 
 	ret = regmap_write(led->regmap, LM3692X_BOOST_CTRL,
-			LM3692X_BRHT_MODE_RAMP_MULTI |
-			LM3692X_BL_ADJ_POL |
-			LM3692X_RAMP_RATE_250us);
+			LM3692X_BOOST_SW_1MHZ |
+			LM3692X_BOOST_SW_NO_SHIFT |
+			LM3692X_OCP_PROT_1_5A);
 	if (ret)
 		goto out;
 
-- 
2.23.0.rc1

