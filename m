Return-Path: <linux-leds+bounces-1819-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B79F8FA36E
	for <lists+linux-leds@lfdr.de>; Mon,  3 Jun 2024 23:46:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ABD0D1F263FA
	for <lists+linux-leds@lfdr.de>; Mon,  3 Jun 2024 21:46:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0ED9D13957B;
	Mon,  3 Jun 2024 21:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="Z3G5f6mH"
X-Original-To: linux-leds@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76EA323A6;
	Mon,  3 Jun 2024 21:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717451157; cv=none; b=kVZi0BpDicSuz02U8vrxTqSm+iScAqftJR2BneG//38BDavFcJ4EIcrfNTCqK85plgx3bxF0y794LmU+J02gzk0RVqiSj9qw1IaJtqY+U8i0XSNxJ5vTAqCRwGW8zIBxcSs1EjOtflgG0hfEuBWnrFT8KmmLc29ptMxyCN2FbaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717451157; c=relaxed/simple;
	bh=jnzdAcc4PzycCzETozPN0Yi+614DvOmUMIDAH3w8MWI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=qKRYwu5Bt+JigU/V0doKOElpFTgZbA2TTvY/u8PbS1+u+VlX9oJq9Nc89wkdCbYKJBGazxWp4OIcfRWgyXD8AR/zrDrfVuKlOrQDjeuUXbx2EbDd6H9dr/bCs2VwCSlvvBvFrJZc7qdolSc/Kx05OhSfLv7GgKbP3eVcxGWxHrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=Z3G5f6mH; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1717451152;
	bh=jnzdAcc4PzycCzETozPN0Yi+614DvOmUMIDAH3w8MWI=;
	h=From:Date:Subject:To:Cc:From;
	b=Z3G5f6mHtnwoBuvaJ2A8zbBDKfLFnsVfG6paE0p+8AjDm70lkyShDySIu9s4ShK6R
	 eG+taaMigO0hNW2cct4UswiKaob9PSWIpPfDthazVqugZtS0qtTozpq4+p3noN8k/O
	 W7170NJhsQaq4/f+j9fhtwq/oBKRqu60S4Qk3qAw=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Mon, 03 Jun 2024 23:45:29 +0200
Subject: [PATCH] leds: triggers: flush pending brightness before activating
 trigger
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240603-led-trigger-flush-v1-1-c904c6e2fb34@weissschuh.net>
X-B4-Tracking: v=1; b=H4sIAHg5XmYC/x3MQQqEMAxG4atI1hOIrQh6FXExjn9rQFRSlQHx7
 haX3+K9ixJMkagtLjKcmnRdMspPQb/pu0SwjtnkxFVSi+cZI++mMcI4zEea2A8IXjyGRhzlbjM
 E/b/Prr/vB3TderFjAAAA
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
 Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Dustin Howett <dustin@howett.net>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1717451151; l=2217;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=jnzdAcc4PzycCzETozPN0Yi+614DvOmUMIDAH3w8MWI=;
 b=DAmfVDCS7blGrssqP3RWZCRm53faQYuKu8a5Zw2zdv/zTi5sOCNVQi6QvJrLuiWAPpf2b0kqY
 cFQkQmsu1a8DBYfwMgEE6CNmT+xuJtdxURJmEyvH+ofnM9G1zv9DAeW
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

The race fixed in timer_trig_activate() between a blocking
set_brightness() call and trigger->activate() can affect any trigger.
So move the call to flush_work() into led_trigger_set() where it can
avoid the race for all triggers.

Fixes: 0db37915d912 ("leds: avoid races with workqueue")
Fixes: 8c0f693c6eff ("leds: avoid flush_work in atomic context")
Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
Dustin, could you validate that this fixes the issue you encountered in
the cros_ec led driver?
---
 drivers/leds/led-triggers.c          | 10 ++++++++--
 drivers/leds/trigger/ledtrig-timer.c |  5 -----
 2 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/leds/led-triggers.c b/drivers/leds/led-triggers.c
index b1b323b19301..9e6233dbcfd4 100644
--- a/drivers/leds/led-triggers.c
+++ b/drivers/leds/led-triggers.c
@@ -195,10 +195,16 @@ int led_trigger_set(struct led_classdev *led_cdev, struct led_trigger *trig)
 		led_cdev->trigger = trig;
 
 		ret = 0;
-		if (trig->activate)
+		if (trig->activate) {
+			/*
+			 * If "set brightness to 0" is pending in workqueue,
+			 * we don't want that to be reordered after ->activate()
+			 */
+			flush_work(&led_cdev->set_brightness_work);
 			ret = trig->activate(led_cdev);
-		else
+		} else {
 			led_set_brightness(led_cdev, trig->brightness);
+		}
 		if (ret)
 			goto err_activate;
 
diff --git a/drivers/leds/trigger/ledtrig-timer.c b/drivers/leds/trigger/ledtrig-timer.c
index b4688d1d9d2b..1d213c999d40 100644
--- a/drivers/leds/trigger/ledtrig-timer.c
+++ b/drivers/leds/trigger/ledtrig-timer.c
@@ -110,11 +110,6 @@ static int timer_trig_activate(struct led_classdev *led_cdev)
 		led_cdev->flags &= ~LED_INIT_DEFAULT_TRIGGER;
 	}
 
-	/*
-	 * If "set brightness to 0" is pending in workqueue, we don't
-	 * want that to be reordered after blink_set()
-	 */
-	flush_work(&led_cdev->set_brightness_work);
 	led_blink_set(led_cdev, &led_cdev->blink_delay_on,
 		      &led_cdev->blink_delay_off);
 

---
base-commit: f06ce441457d4abc4d76be7acba26868a2d02b1c
change-id: 20240603-led-trigger-flush-3bef303eb902

Best regards,
-- 
Thomas Weißschuh <linux@weissschuh.net>


