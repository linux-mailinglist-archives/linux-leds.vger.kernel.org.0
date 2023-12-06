Return-Path: <linux-leds+bounces-265-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 79651806E77
	for <lists+linux-leds@lfdr.de>; Wed,  6 Dec 2023 12:48:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D8A1CB20DDF
	for <lists+linux-leds@lfdr.de>; Wed,  6 Dec 2023 11:48:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB380358B6;
	Wed,  6 Dec 2023 11:48:41 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73274181
	for <linux-leds@vger.kernel.org>; Wed,  6 Dec 2023 03:48:31 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rAqO6-0005yU-Di; Wed, 06 Dec 2023 12:48:22 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rAqO5-00DwrW-6x; Wed, 06 Dec 2023 12:48:21 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rAqO4-00FQwe-To; Wed, 06 Dec 2023 12:48:20 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: kernel@pengutronix.de,
	Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Anjelique Melendez <quic_amelende@quicinc.com>,
	Lu Hongfei <luhongfei@vivo.com>,
	Bjorn Andersson <quic_bjorande@quicinc.com>,
	Luca Weiss <luca@z3ntu.xyz>,
	linux-leds@vger.kernel.org
Subject: [PATCH v4 003/115] leds: qcom-lpg: Use devm_pwmchip_add() simplifying driver removal
Date: Wed,  6 Dec 2023 12:43:17 +0100
Message-ID:  <631d24f0edaa7ac8ebeb22bb66260db8d8823aff.1701860672.git.u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <cover.1701860672.git.u.kleine-koenig@pengutronix.de>
References: <cover.1701860672.git.u.kleine-koenig@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1968; i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id; bh=eAo2sms+IdnUcS+VQAmli0qw30jKPeeRn2Hzf92eCok=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlcF5Vz88q1wxr7wuaHOcrsrN9rvSsQbiTnMheB N85Nph3ClKJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZXBeVQAKCRCPgPtYfRL+ TvJUB/4wk8liDnQVXBoS/JXanLhibw+/Nq3kIdUMq98clTCjCv3DRVygmDLM/evfSfCzd1ByRax srXgM8Gg6GyluODf947nhAjG12H3B8I0OJDCAFFpf4rpDprguzkEkpduDNWtiiZvthFn3NEWyr1 k9W0K0CsozF4Y7rbI2Z779sGYuw7plbeifrDvxz6oIkLKL+zGaLvljlbbJbMGSuGg+nOfPJiVZ8 v0sbIIO96pyDKSXziKnn1RTUlDpf+xCP+9F0grg+pnPa8jshKvitKKw6DLW4S1ceF+J6FIoNRar 9tMsIDFJy5swoBY5Bs99OrP17RzyifunNlTkBx7o6paOou+o
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-leds@vger.kernel.org

With pwmchip_remove() being automatically called after switching to
devm_pwmchip_add() the remove function can be dropped completely. Yay!
With lpg_remove() gone there is no user of the platform device's drvdata
left, so platform_set_drvdata() can be dropped from .probe(), too.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
Note this patch was already sent out individually, find it at
https://lore.kernel.org/linux-leds/20231126095230.683204-2-u.kleine-koenig@pengutronix.de/

 drivers/leds/rgb/leds-qcom-lpg.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/leds/rgb/leds-qcom-lpg.c b/drivers/leds/rgb/leds-qcom-lpg.c
index 68d82a682bf6..f5805fd0eb21 100644
--- a/drivers/leds/rgb/leds-qcom-lpg.c
+++ b/drivers/leds/rgb/leds-qcom-lpg.c
@@ -1095,7 +1095,7 @@ static int lpg_add_pwm(struct lpg *lpg)
 	lpg->pwm.npwm = lpg->num_channels;
 	lpg->pwm.ops = &lpg_pwm_ops;
 
-	ret = pwmchip_add(&lpg->pwm);
+	ret = devm_pwmchip_add(lpg->dev, &lpg->pwm);
 	if (ret)
 		dev_err(lpg->dev, "failed to add PWM chip: ret %d\n", ret);
 
@@ -1324,8 +1324,6 @@ static int lpg_probe(struct platform_device *pdev)
 	if (!lpg->data)
 		return -EINVAL;
 
-	platform_set_drvdata(pdev, lpg);
-
 	lpg->dev = &pdev->dev;
 	mutex_init(&lpg->lock);
 
@@ -1363,13 +1361,6 @@ static int lpg_probe(struct platform_device *pdev)
 	return lpg_add_pwm(lpg);
 }
 
-static void lpg_remove(struct platform_device *pdev)
-{
-	struct lpg *lpg = platform_get_drvdata(pdev);
-
-	pwmchip_remove(&lpg->pwm);
-}
-
 static const struct lpg_data pm8916_pwm_data = {
 	.num_channels = 1,
 	.channels = (const struct lpg_channel_data[]) {
@@ -1529,7 +1520,6 @@ MODULE_DEVICE_TABLE(of, lpg_of_table);
 
 static struct platform_driver lpg_driver = {
 	.probe = lpg_probe,
-	.remove_new = lpg_remove,
 	.driver = {
 		.name = "qcom-spmi-lpg",
 		.of_match_table = lpg_of_table,
-- 
2.42.0


