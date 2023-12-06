Return-Path: <linux-leds+bounces-266-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 77064806E7A
	for <lists+linux-leds@lfdr.de>; Wed,  6 Dec 2023 12:48:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 211171F21554
	for <lists+linux-leds@lfdr.de>; Wed,  6 Dec 2023 11:48:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCE863455B;
	Wed,  6 Dec 2023 11:48:42 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B288B112
	for <linux-leds@vger.kernel.org>; Wed,  6 Dec 2023 03:48:30 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rAqO6-0005yl-Dx; Wed, 06 Dec 2023 12:48:22 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rAqO5-00Dwrd-IN; Wed, 06 Dec 2023 12:48:21 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rAqO5-00FQwl-8y; Wed, 06 Dec 2023 12:48:21 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: kernel@pengutronix.de,
	Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Anjelique Melendez <quic_amelende@quicinc.com>,
	Luca Weiss <luca@z3ntu.xyz>,
	Lu Hongfei <luhongfei@vivo.com>,
	Kees Cook <keescook@chromium.org>,
	linux-leds@vger.kernel.org
Subject: [PATCH v4 005/115] leds: qcom-lpg: Introduce a wrapper for getting driver data from a pwm chip
Date: Wed,  6 Dec 2023 12:43:19 +0100
Message-ID:  <4785982785812615d15c7dd6d2755270bd8670b2.1701860672.git.u.kleine-koenig@pengutronix.de>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1897; i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id; bh=UvHPvfzK4zu0qj3NueYMF9QiGggoolwYvSZ0Joyq9Ow=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlcF5XMttrmsVQY3Yx7JgC/P63fCv4AbvN2VPAc 9dR8f+l/tSJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZXBeVwAKCRCPgPtYfRL+ TlBJB/9n8hJsGTVNWNgb4XnXNUvkwoYr/zPYpWuYGs2QMywhFsHa1SlyfndQGafWbRWf5Io9flL PJs7vxsyH0/gnd7SAiUxLaHJ8QanV609ZhXVsMkxNeMvEZGj6pKTW//XeqwjeoJ6ebBBl4QvZ4Q Lex1wiQBqLdhuhYDVuL1oVeA2leeRaNA9kzMhGpkWU4xK2ErSKdc3m2p3EQGrG9WMrlZ3cvHfmt 5kFZA36sutBsXPxUL8xbWtJ8m8sAukyWveme0THCEWpDgE1x3sXCe1qwNH9LQa5ZyFYWhjrtTC6 DaQJN+RyvxGbdATHsKEUglBMXOioX2mWzfNSAYwfSrmURG0T
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-leds@vger.kernel.org

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
Note this patch was already sent out individually, find it at
https://lore.kernel.org/linux-leds/20231124215208.616551-3-u.kleine-koenig@pengutronix.de

 drivers/leds/rgb/leds-qcom-lpg.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/leds/rgb/leds-qcom-lpg.c b/drivers/leds/rgb/leds-qcom-lpg.c
index 54c90ee43ef8..156b73d1f4a2 100644
--- a/drivers/leds/rgb/leds-qcom-lpg.c
+++ b/drivers/leds/rgb/leds-qcom-lpg.c
@@ -976,9 +976,14 @@ static int lpg_pattern_mc_clear(struct led_classdev *cdev)
 	return lpg_pattern_clear(led);
 }
 
+static inline struct lpg *lpg_pwm_from_chip(struct pwm_chip *chip)
+{
+	return container_of(chip, struct lpg, pwm);
+}
+
 static int lpg_pwm_request(struct pwm_chip *chip, struct pwm_device *pwm)
 {
-	struct lpg *lpg = container_of(chip, struct lpg, pwm);
+	struct lpg *lpg = lpg_pwm_from_chip(chip);
 	struct lpg_channel *chan = &lpg->channels[pwm->hwpwm];
 
 	return chan->in_use ? -EBUSY : 0;
@@ -994,7 +999,7 @@ static int lpg_pwm_request(struct pwm_chip *chip, struct pwm_device *pwm)
 static int lpg_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 			 const struct pwm_state *state)
 {
-	struct lpg *lpg = container_of(chip, struct lpg, pwm);
+	struct lpg *lpg = lpg_pwm_from_chip(chip);
 	struct lpg_channel *chan = &lpg->channels[pwm->hwpwm];
 	int ret = 0;
 
@@ -1025,7 +1030,7 @@ static int lpg_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 static int lpg_pwm_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
 			     struct pwm_state *state)
 {
-	struct lpg *lpg = container_of(chip, struct lpg, pwm);
+	struct lpg *lpg = lpg_pwm_from_chip(chip);
 	struct lpg_channel *chan = &lpg->channels[pwm->hwpwm];
 	unsigned int resolution;
 	unsigned int pre_div;
-- 
2.42.0


