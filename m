Return-Path: <linux-leds+bounces-2444-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DFED09546C1
	for <lists+linux-leds@lfdr.de>; Fri, 16 Aug 2024 12:26:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 98DF9283B1A
	for <lists+linux-leds@lfdr.de>; Fri, 16 Aug 2024 10:26:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C175183CDD;
	Fri, 16 Aug 2024 10:26:55 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mail.naobsd.org (sakura.naobsd.org [160.16.200.221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92E1117BEB5
	for <linux-leds@vger.kernel.org>; Fri, 16 Aug 2024 10:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=160.16.200.221
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723804015; cv=none; b=hbkFGYQx7gvGFeD+awSjfSUj4O0ZGUzuPMazO/PtgJR73gba0KyziP7sp7YhypsXbAwrnqpUG4WGmDDoJRY5FcLqzDWM6EnVCWO3SRSz8geP1ikBT3eehmWpYNEVzegPBv8p0rIwkv45CpaTHc9LgZ29ospW5cWmiocx9WWtahQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723804015; c=relaxed/simple;
	bh=ikM22qyRg3RsHpv/bs0UOuL39RJAKWmkJnnmIBfjHs8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GKkQEtgRSEPIJb7lOdGp+dxEw7mzgkaKWoX9CE7OVCYuvg2nL4SsdW+CiIFdCdWB2/KIyC8Z1JIBMT0chiVXBSLpQe3w4TeXfS8zTiW9fw2JJd7spllHmSUZEMOfRNlB9/iVv+dnEcA+KjE6R3sGbA5OdvZHaWAO4Qoiqx1o5IA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=radxa.com; spf=fail smtp.mailfrom=radxa.com; arc=none smtp.client-ip=160.16.200.221
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=radxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=radxa.com
Received: from secure.fukaumi.org ([10.0.0.2])
	by mail.naobsd.org (8.14.4/8.14.4/Debian-4.1ubuntu1.1) with ESMTP id 47GAQWTo025093;
	Fri, 16 Aug 2024 19:26:32 +0900
From: FUKAUMI Naoki <naoki@radxa.com>
To: linux-leds@vger.kernel.org
Cc: pavel@ucw.cz, lee@kernel.org, FUKAUMI Naoki <naoki@radxa.com>
Subject: [PATCH] leds: pwm-multicolor: fix multicolor PWM LED lights up without any setting
Date: Fri, 16 Aug 2024 19:26:26 +0900
Message-ID: <20240816102626.826-1-naoki@radxa.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

from drivers/leds/leds-pwm.c:led_pwm_set(),

/*
 * Disabling a PWM doesn't guarantee that it emits the inactive level.
 * So keep it on. Only for suspending the PWM should be disabled because
 * otherwise it refuses to suspend. The possible downside is that the
 * LED might stay (or even go) on.
 */

do the same in led_pwm_mc_set().

this fixes LEDs light up without any setting (i.e. brightness is 0) on
Radxa E25.

Signed-off-by: FUKAUMI Naoki <naoki@radxa.com>
---
 drivers/leds/rgb/leds-pwm-multicolor.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/rgb/leds-pwm-multicolor.c b/drivers/leds/rgb/leds-pwm-multicolor.c
index e1a81e0109e8..7155339c075e 100644
--- a/drivers/leds/rgb/leds-pwm-multicolor.c
+++ b/drivers/leds/rgb/leds-pwm-multicolor.c
@@ -50,7 +50,7 @@ static int led_pwm_mc_set(struct led_classdev *cdev,
 			duty = priv->leds[i].state.period - duty;
 
 		priv->leds[i].state.duty_cycle = duty;
-		priv->leds[i].state.enabled = duty > 0;
+		priv->leds[i].state.enabled = !(cdev->flags & LED_SUSPENDED);
 		ret = pwm_apply_might_sleep(priv->leds[i].pwm,
 					    &priv->leds[i].state);
 		if (ret)
-- 
2.43.0


