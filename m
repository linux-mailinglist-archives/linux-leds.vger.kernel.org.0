Return-Path: <linux-leds+bounces-4584-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CFB05AAB1FE
	for <lists+linux-leds@lfdr.de>; Tue,  6 May 2025 06:10:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C1F011883293
	for <lists+linux-leds@lfdr.de>; Tue,  6 May 2025 04:08:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8027941DA18;
	Tue,  6 May 2025 00:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TEKc0tZi"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42B202D47C6;
	Mon,  5 May 2025 22:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746485642; cv=none; b=fyi+LiM8zFuCRF7wQHfT9QxfTpTZSgl1E/1DKup3MOZR6e3pqGsOwLOqR/HyjU9BbPvf++k2SEblOX+pDuw0MXQ7xcDrs6W/n4ruNDj4bE9EbUsupkp5hqndz9oZviW6UYcdtNiF1jS/Eps0hABzKNuy/G5zgHqpzUG3MLM75IE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746485642; c=relaxed/simple;
	bh=5VC5trwgL58pOlCEvy6EgNbNTSJ0i7Tyy7yTSO/wics=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dnUCpy69q9X9XWbnu2FLm2vIWk1QBnVI8FU2tWTf2pBB7DpWtEGfzJGdhtqEJOIivRh3KgssNnKxLv4Y8DWUJZNq/1j5EPbwtAfveRbtCtV8b/ruJnM1HrdtdtaMGvQp5lzUecovEDdMmSE1kgM/mhB0YYWpj3gjmlw/hqKJfU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TEKc0tZi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26D8FC4CEE4;
	Mon,  5 May 2025 22:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746485642;
	bh=5VC5trwgL58pOlCEvy6EgNbNTSJ0i7Tyy7yTSO/wics=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TEKc0tZi7Q1+GVloCPgojG/9YY8Fr+3mKAUDHJNhXBO4Mrh0LIZ6lQVYOETS7Jo4H
	 nXw98H4A8Ahw8OjVKKI4d+MJrW5AAuAbP+0PQfmdHHRpeqhWWkIcVWhClDOt7QNhSY
	 S0+G8T14cVMgnE40hevMmv2YSdmoHlucV0pYDZ+ho+Gm8/r2cfNsqpd1NgrVfR9/+f
	 BS/3MVuZnpZhlZPen5oB3xG+2V9r+2cli/+OTLoVfs41O7RAnuztQPdxLUjPcmgUeG
	 L/VPYYmhyJEYsQhVIZ8Q+2bVVYDBoobUL/x2h9cGxt56hjz1Jc0Gn78hmQ0rqZHr9m
	 V8JeeoUajEHrA==
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
Subject: [PATCH AUTOSEL 6.12 401/486] leds: trigger: netdev: Configure LED blink interval for HW offload
Date: Mon,  5 May 2025 18:37:57 -0400
Message-Id: <20250505223922.2682012-401-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505223922.2682012-1-sashal@kernel.org>
References: <20250505223922.2682012-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.26
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
index 4b0863db901a9..356a55ced2c28 100644
--- a/drivers/leds/trigger/ledtrig-netdev.c
+++ b/drivers/leds/trigger/ledtrig-netdev.c
@@ -68,6 +68,7 @@ struct led_netdev_data {
 	unsigned int last_activity;
 
 	unsigned long mode;
+	unsigned long blink_delay;
 	int link_speed;
 	__ETHTOOL_DECLARE_LINK_MODE_MASK(supported_link_modes);
 	u8 duplex;
@@ -86,6 +87,10 @@ static void set_baseline_state(struct led_netdev_data *trigger_data)
 	/* Already validated, hw control is possible with the requested mode */
 	if (trigger_data->hw_control) {
 		led_cdev->hw_control_set(led_cdev, trigger_data->mode);
+		if (led_cdev->blink_set) {
+			led_cdev->blink_set(led_cdev, &trigger_data->blink_delay,
+					    &trigger_data->blink_delay);
+		}
 
 		return;
 	}
@@ -454,10 +459,11 @@ static ssize_t interval_store(struct device *dev,
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
@@ -466,9 +472,13 @@ static ssize_t interval_store(struct device *dev,
 
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


