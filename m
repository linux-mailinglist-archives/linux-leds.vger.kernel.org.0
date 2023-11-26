Return-Path: <linux-leds+bounces-162-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A47797F920B
	for <lists+linux-leds@lfdr.de>; Sun, 26 Nov 2023 10:53:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A85251C20A30
	for <lists+linux-leds@lfdr.de>; Sun, 26 Nov 2023 09:53:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18E856AD7;
	Sun, 26 Nov 2023 09:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-leds@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B1EF10A
	for <linux-leds@vger.kernel.org>; Sun, 26 Nov 2023 01:53:07 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1r7Bop-0002xR-I6; Sun, 26 Nov 2023 10:52:51 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1r7Boi-00BgLp-DX; Sun, 26 Nov 2023 10:52:44 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1r7Boi-008VGc-4C; Sun, 26 Nov 2023 10:52:44 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
	Anjelique Melendez <quic_amelende@quicinc.com>,
	Lu Hongfei <luhongfei@vivo.com>,
	Luca Weiss <luca@z3ntu.xyz>,
	Kees Cook <keescook@chromium.org>,
	linux-leds@vger.kernel.org,
	kernel@pengutronix.de
Subject: [PATCH 1/2] leds: qcom-lpg: Use devm_pwmchip_add() simplifying driver removal
Date: Sun, 26 Nov 2023 10:52:32 +0100
Message-ID: <20231126095230.683204-2-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0.586.gbc5204569f7d.dirty
In-Reply-To: <20231126095230.683204-1-u.kleine-koenig@pengutronix.de>
References: <20231126095230.683204-1-u.kleine-koenig@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1811; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=DaKE3drL0pt9V9UMiQBo5kxWFwxO/b4SuYgUEI4yflQ=; b=owGbwMvMwMXY3/A7olbonx/jabUkhtRk0YSaB6tMrpYtTPe/oyP8VVa+12Ji+bz2xXW76p4lz l3V7ve9k9GYhYGRi0FWTJHFvnFNplWVXGTn2n+XYQaxMoFMYeDiFICJHE7iYJjSU7iCO336AU4R gWfqjZfF12/vDZ2lMbtvp7hH5z4lzf1/hEQEP02KeZGhWbroVMBhnfp9PQePSSXVaHX6sl1sV9g eriV4WH3u2tfXndn1GGRUZB+r1ItPWb0jVrROoutlVcfnyxoGPz8d36hiFjHlMF+qkUJkteRUi9 XCQf8ZVKKal/zQjUuvM9VpZm++YMW/aSV39p7Lr/esFQhr6i9va9M+6WZgyb8/LfP5jNBzB2vPX dvWpGNbG5XGfzN93dwZ72ck7Pn77Pa+kty908/7c4a9qqh3bODfFKxsya+Y+O/Dvjbzh2WCaTuk 7wuv4xeTjJxf812jNVrAK2kqa8SjD58875TIc/dq1/8GAA==
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


