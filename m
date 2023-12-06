Return-Path: <linux-leds+bounces-267-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D6DCC806E82
	for <lists+linux-leds@lfdr.de>; Wed,  6 Dec 2023 12:48:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8ECBD1F2120B
	for <lists+linux-leds@lfdr.de>; Wed,  6 Dec 2023 11:48:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89BED34575;
	Wed,  6 Dec 2023 11:48:44 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5946D6D
	for <linux-leds@vger.kernel.org>; Wed,  6 Dec 2023 03:48:31 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rAqO6-0005yh-Di; Wed, 06 Dec 2023 12:48:22 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rAqO5-00DwrZ-Bg; Wed, 06 Dec 2023 12:48:21 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rAqO5-00FQwi-2b; Wed, 06 Dec 2023 12:48:21 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: kernel@pengutronix.de,
	Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>,
	Anjelique Melendez <quic_amelende@quicinc.com>,
	Lu Hongfei <luhongfei@vivo.com>,
	Rob Herring <robh@kernel.org>,
	Luca Weiss <luca@z3ntu.xyz>,
	linux-leds@vger.kernel.org
Subject: [PATCH v4 004/115] leds: qcom-lpg: Consistenly use dev_err_probe() in .probe()'s error path
Date: Wed,  6 Dec 2023 12:43:18 +0100
Message-ID:  <1884e7d6928764ef230587d68ec79f04aa0e79a0.1701860672.git.u.kleine-koenig@pengutronix.de>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3943; i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id; bh=6oU15lfp1LCvdQHKK6/LXwZgDnhknB7CYyZJ6e5dt1w=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlcF5WdoJRypBRMEkJAYrKiL/dr/2eH/LCDZbVF J1kFCoGIKGJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZXBeVgAKCRCPgPtYfRL+ TqEPB/98ugKHBTzXlbbIjLKmjI2r+S4B7my8wmT5/6IzR7aT8u2LuafoIShipvNoWNec+ffUr88 jvp8YC28GDt6+ZToZbY2kU1GmSwyY8zd9eZW1qcaCOsaQw1ecX43cWDCm9hShegOau6fBJwS2S8 1Q80nMAChCni7Iy1AYmjOAJ5M9JZqPplSBZPwpNUObnNzOb4RRzF3bAoIeFCH9rK5bUGy9ppMOZ IYZcQmiqe4pI3NwKSqBr8wuaxdW7sMtibJpCvv1k7aY9RKdFBX0IpqJf8MByqAbGR13QHyE8FUY +yCt3I9/TPDT1B1ziub9YgrFvmATJZ/FYcueUzEqETsGbaiD
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-leds@vger.kernel.org

One error path already used dev_err_probe(). Adapt the other error paths
that emit an error message to also use this function for consistency and
slightly simplified code.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
Note this patch was already sent out individually, find it at
https://lore.kernel.org/linux-pwm/20231130074133.969806-3-u.kleine-koenig@pengutronix.de

 drivers/leds/rgb/leds-qcom-lpg.c | 40 ++++++++++++++------------------
 1 file changed, 17 insertions(+), 23 deletions(-)

diff --git a/drivers/leds/rgb/leds-qcom-lpg.c b/drivers/leds/rgb/leds-qcom-lpg.c
index f5805fd0eb21..54c90ee43ef8 100644
--- a/drivers/leds/rgb/leds-qcom-lpg.c
+++ b/drivers/leds/rgb/leds-qcom-lpg.c
@@ -552,9 +552,9 @@ static int lpg_parse_dtest(struct lpg *lpg)
 		ret = count;
 		goto err_malformed;
 	} else if (count != lpg->data->num_channels * 2) {
-		dev_err(lpg->dev, "qcom,dtest needs to be %d items\n",
-			lpg->data->num_channels * 2);
-		return -EINVAL;
+		return dev_err_probe(lpg->dev, -EINVAL,
+				     "qcom,dtest needs to be %d items\n",
+				     lpg->data->num_channels * 2);
 	}
 
 	for (i = 0; i < lpg->data->num_channels; i++) {
@@ -574,8 +574,7 @@ static int lpg_parse_dtest(struct lpg *lpg)
 	return 0;
 
 err_malformed:
-	dev_err(lpg->dev, "malformed qcom,dtest\n");
-	return ret;
+	return dev_err_probe(lpg->dev, ret, "malformed qcom,dtest\n");
 }
 
 static void lpg_apply_dtest(struct lpg_channel *chan)
@@ -1097,7 +1096,7 @@ static int lpg_add_pwm(struct lpg *lpg)
 
 	ret = devm_pwmchip_add(lpg->dev, &lpg->pwm);
 	if (ret)
-		dev_err(lpg->dev, "failed to add PWM chip: ret %d\n", ret);
+		dev_err_probe(lpg->dev, ret, "failed to add PWM chip\n");
 
 	return ret;
 }
@@ -1111,19 +1110,16 @@ static int lpg_parse_channel(struct lpg *lpg, struct device_node *np,
 	int ret;
 
 	ret = of_property_read_u32(np, "reg", &reg);
-	if (ret || !reg || reg > lpg->num_channels) {
-		dev_err(lpg->dev, "invalid \"reg\" of %pOFn\n", np);
-		return -EINVAL;
-	}
+	if (ret || !reg || reg > lpg->num_channels)
+		return dev_err_probe(lpg->dev, -EINVAL, "invalid \"reg\" of %pOFn\n", np);
 
 	chan = &lpg->channels[reg - 1];
 	chan->in_use = true;
 
 	ret = of_property_read_u32(np, "color", &color);
-	if (ret < 0 && ret != -EINVAL) {
-		dev_err(lpg->dev, "failed to parse \"color\" of %pOF\n", np);
-		return ret;
-	}
+	if (ret < 0 && ret != -EINVAL)
+		return dev_err_probe(lpg->dev, ret,
+				     "failed to parse \"color\" of %pOF\n", np);
 
 	chan->color = color;
 
@@ -1146,10 +1142,9 @@ static int lpg_add_led(struct lpg *lpg, struct device_node *np)
 	int i;
 
 	ret = of_property_read_u32(np, "color", &color);
-	if (ret < 0 && ret != -EINVAL) {
-		dev_err(lpg->dev, "failed to parse \"color\" of %pOF\n", np);
-		return ret;
-	}
+	if (ret < 0 && ret != -EINVAL)
+		return dev_err_probe(lpg->dev, ret,
+			      "failed to parse \"color\" of %pOF\n", np);
 
 	if (color == LED_COLOR_ID_RGB)
 		num_channels = of_get_available_child_count(np);
@@ -1226,7 +1221,7 @@ static int lpg_add_led(struct lpg *lpg, struct device_node *np)
 	else
 		ret = devm_led_classdev_register_ext(lpg->dev, &led->cdev, &init_data);
 	if (ret)
-		dev_err(lpg->dev, "unable to register %s\n", cdev->name);
+		dev_err_probe(lpg->dev, ret, "unable to register %s\n", cdev->name);
 
 	return ret;
 }
@@ -1272,10 +1267,9 @@ static int lpg_init_triled(struct lpg *lpg)
 
 	if (lpg->triled_has_src_sel) {
 		ret = of_property_read_u32(np, "qcom,power-source", &lpg->triled_src);
-		if (ret || lpg->triled_src == 2 || lpg->triled_src > 3) {
-			dev_err(lpg->dev, "invalid power source\n");
-			return -EINVAL;
-		}
+		if (ret || lpg->triled_src == 2 || lpg->triled_src > 3)
+			return dev_err_probe(lpg->dev, -EINVAL,
+					     "invalid power source\n");
 	}
 
 	/* Disable automatic trickle charge LED */
-- 
2.42.0


