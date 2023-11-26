Return-Path: <linux-leds+bounces-161-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 57E2B7F920A
	for <lists+linux-leds@lfdr.de>; Sun, 26 Nov 2023 10:53:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D3ACC281158
	for <lists+linux-leds@lfdr.de>; Sun, 26 Nov 2023 09:53:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C71786AC2;
	Sun, 26 Nov 2023 09:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-leds@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AFD3D9
	for <linux-leds@vger.kernel.org>; Sun, 26 Nov 2023 01:53:07 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1r7Bop-0002xQ-I6; Sun, 26 Nov 2023 10:52:51 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1r7Boi-00BgLm-6r; Sun, 26 Nov 2023 10:52:44 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1r7Boh-008VGZ-Tm; Sun, 26 Nov 2023 10:52:43 +0100
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
Subject: [PATCH 0/2] leds: qcom-lpg: Two cleanups
Date: Sun, 26 Nov 2023 10:52:31 +0100
Message-ID: <20231126095230.683204-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0.586.gbc5204569f7d.dirty
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=506; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=ngPAi1vTfXg1Hg+NT3yhm/6VNx4BCjyRUSSKaufpYjU=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlYxVeQLPrHcO/DnmCUKsPp9DQC2LCfrMOPkrda LsWzMO0leCJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZWMVXgAKCRCPgPtYfRL+ TjigCACUi3mvYsRTBOmn/yRB04chJk+/9i2Mcq8FXjHaIC7iN/Kx3/WYupLcFi4zrH/lT/Ourmm 4JRKMUmZ5Erkmtl/SmvlWXqFGkpSqdXLW0VBAPVov5oggpRdRtILrUs7YVQQQb0olzm9vj6x2Qf quuWOjQRrNgVVdgv3JKGo3lbYB669V8PakvHbHgQTnANvBxt16jZYgWwgkaaveQR8WWzK3wIcLE JPADZ1NXUaP/W8mTR/Q4cp72faNHuSisDw6DYlcghqiOevnbvjltH27T1Elk6xV+DGgzvPsmnF8 oBvC20S232W7hr9ysfTft3/tGAmTGL7eoKznZaK0G/MTC7Um
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-leds@vger.kernel.org

Hello,

while looking at this driver for some pwm related changes, I noticed
these two patch opportunities.

Best regards
Uwe

Uwe Kleine-König (2):
  leds: qcom-lpg: Use devm_pwmchip_add() simplifying driver removal
  leds: qcom-lpg: Consistenly use dev_err_probe() in .probe()'s error
    path

 drivers/leds/rgb/leds-qcom-lpg.c | 52 +++++++++++---------------------
 1 file changed, 18 insertions(+), 34 deletions(-)

base-commit: 8c9660f6515396aba78d1168d2e17951d653ebf2
-- 
2.42.0


