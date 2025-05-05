Return-Path: <linux-leds+bounces-4582-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D07F3AAABA8
	for <lists+linux-leds@lfdr.de>; Tue,  6 May 2025 04:00:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9C3E35A685E
	for <lists+linux-leds@lfdr.de>; Tue,  6 May 2025 01:54:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E1162853F8;
	Mon,  5 May 2025 23:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ltZ5D7d6"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DE8E281529;
	Mon,  5 May 2025 23:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746486300; cv=none; b=DKvFvafS/EaEMHu/qjaUCoLHAGYm/x+wdV4WSyz3d2Cn9+dDAjxag/upoIkNJmovb/M0oJdZQBhFf4FhGGQmmGdJYb9F0iHpe6xfW/o7VF+Y/a3DY/vxTzpE994YuoGHkku6ehH1l1gDAlVq2fk7plxMsvz+fLVmAdfbOu//JrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746486300; c=relaxed/simple;
	bh=EFGW6uKidnmuYk/YSiUU4OZvZImJqmyUCCrIWsc34uA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=TwGRy/7fiQSMG56WCesrHgJaf+IEF9StZBOVM1yn5bYLHZywklWhm8qBpsC+J0gYZlP4lZdznbaaUCzsOwQu0YxyqOs3K/SS45egWay5juFIURiQM0KI1KRkyE4AYWv7DII/P9IfZ/WiY9SiPQNifY13mo4ZHoz+h6glK1h2a9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ltZ5D7d6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F018C4CEEE;
	Mon,  5 May 2025 23:04:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746486299;
	bh=EFGW6uKidnmuYk/YSiUU4OZvZImJqmyUCCrIWsc34uA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ltZ5D7d6A1es6GfMm2A9+LrUXBAa4TQYTSNy3/rqUTQrOTdSfC4aWfIR8ofmQj2MY
	 Nopq6nza58XURb4AtpWnbT4Idk95/o0V9InlIsemgN2SOhKqU0xboqnSm1lLtoncCf
	 LdBZVAkbotHcJZ/InTVdTGP/vhubNV56FAcWGgC4KxmnuIYsslTLSpaTcXnxaLcbpA
	 l9j3/h+w3bj0neHja7Oe9d13apiiOCQBaKuuLmZ/c2CN3qAjKih1HWeam/KT6iujDy
	 r8n8xrb7JPF++b8k02rsPf3hvfHnNxTiDbINU9ILhiN/hN0tx9JIYtFzBbPUuTA/wq
	 MiArUQeW36wdw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Marek Vasut <marex@denx.de>,
	Lee Jones <lee@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	pavel@kernel.org,
	andrew@lunn.ch,
	lukma@denx.de,
	linux-leds@vger.kernel.org
Subject: [PATCH AUTOSEL 6.6 245/294] leds: trigger: netdev: Configure LED blink interval for HW offload
Date: Mon,  5 May 2025 18:55:45 -0400
Message-Id: <20250505225634.2688578-245-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505225634.2688578-1-sashal@kernel.org>
References: <20250505225634.2688578-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.89
Content-Transfer-Encoding: 8bit

From: Marek Vasut <marex@denx.de>

[ Upstream commit c629c972b310af41e9e072febb6dae9a299edde6 ]

In case a PHY LED implements .blink_set callback to set LED blink
interval, call it even if .hw_control is already set, as that LED
blink interval likely controls the blink rate of that HW offloaded
LED. For PHY LEDs, that can be their activity blinking interval.

The software blinking is not affected by this change.

With this change, the LED interval setting looks something like this:
$ echo netdev > /sys/class/leds/led:green:lan/trigger
$ echo 1 > /sys/class/leds/led:green:lan/brightness
$ echo 250 > /sys/class/leds/led:green:lan/interval

Signed-off-by: Marek Vasut <marex@denx.de>
Link: https://lore.kernel.org/r/20250120113740.91807-1-marex@denx.de
Signed-off-by: Lee Jones <lee@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/leds/trigger/ledtrig-netdev.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/leds/trigger/ledtrig-netdev.c b/drivers/leds/trigger/ledtrig-netdev.c
index 79719fc8a08fb..f8912fa60c498 100644
--- a/drivers/leds/trigger/ledtrig-netdev.c
+++ b/drivers/leds/trigger/ledtrig-netdev.c
@@ -54,6 +54,7 @@ struct led_netdev_data {
 	unsigned int last_activity;
 
 	unsigned long mode;
+	unsigned long blink_delay;
 	int link_speed;
 	u8 duplex;
 
@@ -69,6 +70,10 @@ static void set_baseline_state(struct led_netdev_data *trigger_data)
 	/* Already validated, hw control is possible with the requested mode */
 	if (trigger_data->hw_control) {
 		led_cdev->hw_control_set(led_cdev, trigger_data->mode);
+		if (led_cdev->blink_set) {
+			led_cdev->blink_set(led_cdev, &trigger_data->blink_delay,
+					    &trigger_data->blink_delay);
+		}
 
 		return;
 	}
@@ -386,10 +391,11 @@ static ssize_t interval_store(struct device *dev,
 			      size_t size)
 {
 	struct led_netdev_data *trigger_data = led_trigger_get_drvdata(dev);
+	struct led_classdev *led_cdev = trigger_data->led_cdev;
 	unsigned long value;
 	int ret;
 
-	if (trigger_data->hw_control)
+	if (trigger_data->hw_control && !led_cdev->blink_set)
 		return -EINVAL;
 
 	ret = kstrtoul(buf, 0, &value);
@@ -398,9 +404,13 @@ static ssize_t interval_store(struct device *dev,
 
 	/* impose some basic bounds on the timer interval */
 	if (value >= 5 && value <= 10000) {
-		cancel_delayed_work_sync(&trigger_data->work);
+		if (trigger_data->hw_control) {
+			trigger_data->blink_delay = value;
+		} else {
+			cancel_delayed_work_sync(&trigger_data->work);
 
-		atomic_set(&trigger_data->interval, msecs_to_jiffies(value));
+			atomic_set(&trigger_data->interval, msecs_to_jiffies(value));
+		}
 		set_baseline_state(trigger_data);	/* resets timer */
 	}
 
-- 
2.39.5


