Return-Path: <linux-leds+bounces-3828-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 57225A16BB8
	for <lists+linux-leds@lfdr.de>; Mon, 20 Jan 2025 12:38:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 565C9163C63
	for <lists+linux-leds@lfdr.de>; Mon, 20 Jan 2025 11:38:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9DBA191F95;
	Mon, 20 Jan 2025 11:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="LBl/YPJW"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx.denx.de (mx.denx.de [89.58.32.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EA9F10E9
	for <linux-leds@vger.kernel.org>; Mon, 20 Jan 2025 11:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.58.32.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737373085; cv=none; b=AMC5n9T0ZkS7BMyQVyTovLHhE7UmPjtBNR9SiIRikO0AlmHsA7S23YEomXNzt6gtoPEW5hmKvMZenO7CEKhIFdaRsBBnKuynbRjPlUzGIC2EaztU1+g/0Vv1rICCstUQ/54HzZNajke+hKPagsbAuWLrPO02Eo9tr4J+NdAc/4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737373085; c=relaxed/simple;
	bh=519Hq0Oqatv1/lF2DyfEluJsjkAiM0XFDWdNUq9YL68=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AzkPW1ruo2C8/JVVGu3/uvWYR1mEl9ZlBb+UK7miJN5AbWtckPOTPXwPJrMRKcbwO7yYV9spQpZXZ0MyjKd5ND6CSbf9akfWt0cP8uh1xcN7Z665zOTvNGo3fAAmRGTl3SEj/FuKDm2zIECbBWuKMWkoDmSd7mJBrtRy1rKLJXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=LBl/YPJW; arc=none smtp.client-ip=89.58.32.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 252E11048B8B6;
	Mon, 20 Jan 2025 12:37:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1737373080;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=rB7T6vTMLqdj8PDtIZpFXRveqRe2giRmZ+QvNbBGViY=;
	b=LBl/YPJWOaAMGv9kP4op+2CT6bZ256C+aW3RwM1o0QHWO3ARtgIOoqOVTh4l6K1wt6fDRs
	qv3EbGqCOOFmoQxIx/bINm/oJSnbLUQBji8EbkQK47HJqhOzNawV7qPnnOy+npytfs7Dt1
	07JINRDpkGkkis5N9mfxi/7ViaHFWYfH9Hs55WqFc7fJ2OOOqITYQ3uLCnNMavt7lgnyfV
	aOpDLO8WlRhpv00jxHmbkGuyxR+xoiyaRAI5YWop6cPZO+V1jPcT9U1aX/0y3hQxHQaF2r
	6FRelsJ84o9SiwG+25xPfLulFiN0NLl/MbuDbesNhvyA6Nl1f+skD+Km8Q1Ubg==
From: Marek Vasut <marex@denx.de>
To: linux-leds@vger.kernel.org
Cc: Marek Vasut <marex@denx.de>,
	Andrew Lunn <andrew@lunn.ch>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Lukasz Majewski <lukma@denx.de>,
	Pavel Machek <pavel@ucw.cz>
Subject: [PATCH] leds: trigger: netdev: Configure LED blink interval for HW offload
Date: Mon, 20 Jan 2025 12:36:53 +0100
Message-ID: <20250120113740.91807-1-marex@denx.de>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

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
---
Cc: Andrew Lunn <andrew@lunn.ch>
Cc: Christian Marangi <ansuelsmth@gmail.com>
Cc: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Lee Jones <lee@kernel.org>
Cc: Lukasz Majewski <lukma@denx.de>
Cc: Pavel Machek <pavel@ucw.cz>
Cc: linux-leds@vger.kernel.org
---
 drivers/leds/trigger/ledtrig-netdev.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/leds/trigger/ledtrig-netdev.c b/drivers/leds/trigger/ledtrig-netdev.c
index 20dfc9506c0a6..47c44620ba585 100644
--- a/drivers/leds/trigger/ledtrig-netdev.c
+++ b/drivers/leds/trigger/ledtrig-netdev.c
@@ -69,6 +69,7 @@ struct led_netdev_data {
 	unsigned int last_activity;
 
 	unsigned long mode;
+	unsigned long blink_delay;
 	int link_speed;
 	__ETHTOOL_DECLARE_LINK_MODE_MASK(supported_link_modes);
 	u8 duplex;
@@ -87,6 +88,10 @@ static void set_baseline_state(struct led_netdev_data *trigger_data)
 	/* Already validated, hw control is possible with the requested mode */
 	if (trigger_data->hw_control) {
 		led_cdev->hw_control_set(led_cdev, trigger_data->mode);
+		if (led_cdev->blink_set) {
+			led_cdev->blink_set(led_cdev, &trigger_data->blink_delay,
+					    &trigger_data->blink_delay);
+		}
 
 		return;
 	}
@@ -463,10 +468,11 @@ static ssize_t interval_store(struct device *dev,
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
@@ -475,9 +481,13 @@ static ssize_t interval_store(struct device *dev,
 
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
2.45.2


