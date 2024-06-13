Return-Path: <linux-leds+bounces-1908-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F168907686
	for <lists+linux-leds@lfdr.de>; Thu, 13 Jun 2024 17:25:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B02C1281F86
	for <lists+linux-leds@lfdr.de>; Thu, 13 Jun 2024 15:25:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34B4B1494C3;
	Thu, 13 Jun 2024 15:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="Cnu34rAF"
X-Original-To: linux-leds@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEC0353E31;
	Thu, 13 Jun 2024 15:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718292299; cv=none; b=pqblUv7/HGE+djPfyM0du1b7yGi3Ldy3qZAdU2nHt7rmN3p8HjjH3YV7it7wuSOl/owB9gwYVfX0tnyPFBjgpQpVpyfN1afKKp1Nx3NjYR2DB/pcXo0To+oM4EOND/Af/7EQQrM3R2YOx2YBYCBGujIRtS3Xl8Mwvchz34mqDDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718292299; c=relaxed/simple;
	bh=lkr1QctdrwBqiaLGk73+KO5d+sPtA7Bi31a8uXsZvLM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=cVOIyj5ueQLQfyeDh+TfFp9KdSZsstSJkAyFjb4fkJKLd91pAyTZWC3pj23K3NcudiSKYGz2Ggl8T5Zb2BueQrDzUu2yJfjxk46p3IUTBZusSdaF38uDwGfSDT9hAYJWUjerzYGq95Y1Fp6JX5Uj+g40rv59SUfW05qhnECUvFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=Cnu34rAF; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1718292294;
	bh=lkr1QctdrwBqiaLGk73+KO5d+sPtA7Bi31a8uXsZvLM=;
	h=From:Date:Subject:To:Cc:From;
	b=Cnu34rAFfuzqEBAV0IjuFq/EN2ECf8/ZV5aHa4+ePvlZH+OKMghnKuChzzvAa2KHX
	 UsiYq7xIgploRqfmtwYS4diz0VVXq/605mXxHCKZBH7hhOROomK14crNZzvbebMRt+
	 x7PIp4bW9gApLYTQBdejF38nyGOlAxxgmT7UTq4w=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Thu, 13 Jun 2024 17:24:51 +0200
Subject: [PATCH v2] leds: triggers: flush pending brightness before
 activating trigger
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240613-led-trigger-flush-v2-1-f4f970799d77@weissschuh.net>
X-B4-Tracking: v=1; b=H4sIAEIPa2YC/32NQQqDMBBFryKz7pSYiGBXvUdxUeMkGRAtmagtk
 rs39QBdvgf//QOEIpPArTog0sbCy1xAXyqw4Tl7Qh4Lg1a6Ua0yONGIKbL3FNFNqwQ0AzmjDA2
 d0lB2r0iO32fz0RcOLGmJn/Niq3/2X22rsUbbqca2pN1gmvtOLCI2rOE6U4I+5/wFfRGb/rcAA
 AA=
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
 Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Dustin Howett <dustin@howett.net>, stable@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1718292294; l=2694;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=lkr1QctdrwBqiaLGk73+KO5d+sPtA7Bi31a8uXsZvLM=;
 b=BeT9bQPIN0S2PP6EGAIJapWFwWehZhBUWYDfHdhDO6u9Gytb+cpAPkWQ7AsdxmI/Gl+AsLJhQ
 zpM2cThQSCvDSNPdcKU0lKtFti+HZHNHX69XZIXFqyy+9t6B5UZE8pP
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

The race fixed in timer_trig_activate() between a blocking
set_brightness() call and trigger->activate() can affect any trigger.
So move the call to flush_work() into led_trigger_set() where it can
avoid the race for all triggers.

Fixes: 0db37915d912 ("leds: avoid races with workqueue")
Fixes: 8c0f693c6eff ("leds: avoid flush_work in atomic context")
Cc: stable@vger.kernel.org
Tested-by: Dustin L. Howett <dustin@howett.net>
Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
Changes in v2:
- Cc stable
- Add Dustin's Tested-by
- Rebase against led/for-leds-next
- Always execute flush_work(), similar to synchronize_rcu()
- Link to v1: https://lore.kernel.org/r/20240603-led-trigger-flush-v1-1-c904c6e2fb34@weissschuh.net
---

Commit 7abae7a11fc9 ("leds: trigger: Call synchronize_rcu() before calling trig->activate()")
alone also solves the issue that the LED stays completely off after
enabling the trigger.
But there is a recognizable timeframe where it is disabled in between.

Also from a correctness perspective, this seems like a coincidence and
the call to flush_work() is the correct fix for that race.
---
 drivers/leds/led-triggers.c          | 6 ++++++
 drivers/leds/trigger/ledtrig-timer.c | 5 -----
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/leds/led-triggers.c b/drivers/leds/led-triggers.c
index 59deadb86335..78eb20093b2c 100644
--- a/drivers/leds/led-triggers.c
+++ b/drivers/leds/led-triggers.c
@@ -201,6 +201,12 @@ int led_trigger_set(struct led_classdev *led_cdev, struct led_trigger *trig)
 		 */
 		synchronize_rcu();
 
+		/*
+		 * If "set brightness to 0" is pending in workqueue,
+		 * we don't want that to be reordered after ->activate()
+		 */
+		flush_work(&led_cdev->set_brightness_work);
+
 		ret = 0;
 		if (trig->activate)
 			ret = trig->activate(led_cdev);
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
base-commit: 005408af25d5550e1bd22a18bf371651969c17ee
change-id: 20240603-led-trigger-flush-3bef303eb902

Best regards,
-- 
Thomas Weißschuh <linux@weissschuh.net>


