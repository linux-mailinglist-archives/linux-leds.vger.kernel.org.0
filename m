Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 54C42766496
	for <lists+linux-leds@lfdr.de>; Fri, 28 Jul 2023 08:58:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229704AbjG1G6I (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 28 Jul 2023 02:58:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233249AbjG1G55 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 28 Jul 2023 02:57:57 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E4D51984
        for <linux-leds@vger.kernel.org>; Thu, 27 Jul 2023 23:57:56 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1qPHQ1-00087i-Fk; Fri, 28 Jul 2023 08:57:45 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qPHQ0-002eF2-5g; Fri, 28 Jul 2023 08:57:44 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qPHPz-008R2s-Dv; Fri, 28 Jul 2023 08:57:43 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-leds@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH] leds: qcom-lpg: Drop assignment to struct pwmchip::base
Date:   Fri, 28 Jul 2023 08:57:39 +0200
Message-Id: <20230728065739.580281-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=998; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=845Cv8LFVOCbFmNAvr+AGvykNh6/RSBGwmWMMyvTQek=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkw2bfG9fFr/jxy1Wo+A2MtDqYOB/Mz+GiwdRHz e63FK9+/1CJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZMNm3wAKCRCPgPtYfRL+ TqJNB/4p74GfdGCN4pf4v0MLm4I2BzKhxdy3/AqILmhrq6rmrSnKnO5yvNDHjL9uih+QzLh5tSX 1aWkjjZkvQBGcBLHbugh844g+Md0urtjdxott0TFdeAh/9RtSOvqOW7LrrgCCoRp9dTKOu0OwCE 9cjezfDm06anuMY+rFaidSho+HrDRO0dp1mHwA7PL+cNA2C89cVv5vv3JhlhlBed6b8pOslFVIP lCy0uZJUCBZgZ+f0MyR9+fhJ0bJaXS87zKpjOuL+31U/eWC6nA/IMuwflGybyUx88fobbWsPCGm Nu6sps0Avb9Bfx94Cg2pFrnRSrHUMzcnnsqKa4VQ5W0py9RZ
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-leds@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Since commit f9a8ee8c8bcd ("pwm: Always allocate PWM chip base ID
dynamically") there is no effect any more for assigning this variable. See
pwmchip_add() which unconditionally overwrites this member.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
Hello,

this is the last driver setting .base. Would be great to get rid of that, as I
might want to drop .base from the pwm core.

Thanks for considering,
Uwe

 drivers/leds/rgb/leds-qcom-lpg.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/leds/rgb/leds-qcom-lpg.c b/drivers/leds/rgb/leds-qcom-lpg.c
index 59581b3e25ca..c2fc768eaf87 100644
--- a/drivers/leds/rgb/leds-qcom-lpg.c
+++ b/drivers/leds/rgb/leds-qcom-lpg.c
@@ -1093,7 +1093,6 @@ static int lpg_add_pwm(struct lpg *lpg)
 {
 	int ret;
 
-	lpg->pwm.base = -1;
 	lpg->pwm.dev = lpg->dev;
 	lpg->pwm.npwm = lpg->num_channels;
 	lpg->pwm.ops = &lpg_pwm_ops;

base-commit: 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5
-- 
2.39.2

