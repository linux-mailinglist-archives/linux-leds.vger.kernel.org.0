Return-Path: <linux-leds+bounces-5039-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DBFFB0209E
	for <lists+linux-leds@lfdr.de>; Fri, 11 Jul 2025 17:41:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 02D394A6833
	for <lists+linux-leds@lfdr.de>; Fri, 11 Jul 2025 15:41:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92F552ED845;
	Fri, 11 Jul 2025 15:40:41 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from pidgin.makrotopia.org (pidgin.makrotopia.org [185.142.180.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D4DC2ED854;
	Fri, 11 Jul 2025 15:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.142.180.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752248441; cv=none; b=bO2qgV5Y/7VTU7lnt0c+cae8ILZJPgRdD9WSLxwj0Zgv+xYtmoYSZNL3fM/5PorQqCzvYpXHvTmcbRH2ha4IYkLx1SRwEIq1Vk7ZogKlpFRnZTHovt8jdMoDJRnDv2OBpJ0s+35aTwVELfa4rAqAkgG2b92wydIcHYRyTR9idfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752248441; c=relaxed/simple;
	bh=x6to5Bztfv5TH+ywbH/5u2u6JpWJLuPC3q67kQoKHzQ=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OiY3nhCcWT5OTJCjgXwx4vKmKkjVpv9Y2V9lQtKHRh/5OeZMROy3qLQW8jgUpff1QJ8Xr0jcYds5hZKu1j2e6ZCKxvWdu+QmlX4GDxCyeRKuvABPETVEGXwJgwT/6TEAllRYoSAkGCD+m65q2tWXQnPr/gBmWme4ijIEDxvx8yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org; spf=pass smtp.mailfrom=makrotopia.org; arc=none smtp.client-ip=185.142.180.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=makrotopia.org
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.98.2)
	(envelope-from <daniel@makrotopia.org>)
	id 1uaFrX-000000003Ij-3NMD;
	Fri, 11 Jul 2025 15:40:35 +0000
Date: Fri, 11 Jul 2025 16:40:29 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>, Marek Vasut <marex@denx.de>,
	Lukasz Majewski <lukma@denx.de>, linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: [PATCH] Revert "leds: trigger: netdev: Configure LED blink interval
 for HW offload"
Message-ID: <c28c2a71489b34fe595d694c809f553978069653.1752248354.git.daniel@makrotopia.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

This reverts commit c629c972b310af41e9e072febb6dae9a299edde6.

Fixes: c629c972b310a ("leds: trigger: netdev: Configure LED blink interval for HW offload")
Suggested-by: Andrew Lunn <andrew@lunn.ch>
Cc: stable@vger.kernel.org
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 drivers/leds/trigger/ledtrig-netdev.c | 16 +++-------------
 1 file changed, 3 insertions(+), 13 deletions(-)

diff --git a/drivers/leds/trigger/ledtrig-netdev.c b/drivers/leds/trigger/ledtrig-netdev.c
index 4e048e08c4fde..c15efe3e50780 100644
--- a/drivers/leds/trigger/ledtrig-netdev.c
+++ b/drivers/leds/trigger/ledtrig-netdev.c
@@ -68,7 +68,6 @@ struct led_netdev_data {
 	unsigned int last_activity;
 
 	unsigned long mode;
-	unsigned long blink_delay;
 	int link_speed;
 	__ETHTOOL_DECLARE_LINK_MODE_MASK(supported_link_modes);
 	u8 duplex;
@@ -87,10 +86,6 @@ static void set_baseline_state(struct led_netdev_data *trigger_data)
 	/* Already validated, hw control is possible with the requested mode */
 	if (trigger_data->hw_control) {
 		led_cdev->hw_control_set(led_cdev, trigger_data->mode);
-		if (led_cdev->blink_set) {
-			led_cdev->blink_set(led_cdev, &trigger_data->blink_delay,
-					    &trigger_data->blink_delay);
-		}
 
 		return;
 	}
@@ -459,11 +454,10 @@ static ssize_t interval_store(struct device *dev,
 			      size_t size)
 {
 	struct led_netdev_data *trigger_data = led_trigger_get_drvdata(dev);
-	struct led_classdev *led_cdev = trigger_data->led_cdev;
 	unsigned long value;
 	int ret;
 
-	if (trigger_data->hw_control && !led_cdev->blink_set)
+	if (trigger_data->hw_control)
 		return -EINVAL;
 
 	ret = kstrtoul(buf, 0, &value);
@@ -472,13 +466,9 @@ static ssize_t interval_store(struct device *dev,
 
 	/* impose some basic bounds on the timer interval */
 	if (value >= 5 && value <= 10000) {
-		if (trigger_data->hw_control) {
-			trigger_data->blink_delay = value;
-		} else {
-			cancel_delayed_work_sync(&trigger_data->work);
+		cancel_delayed_work_sync(&trigger_data->work);
 
-			atomic_set(&trigger_data->interval, msecs_to_jiffies(value));
-		}
+		atomic_set(&trigger_data->interval, msecs_to_jiffies(value));
 		set_baseline_state(trigger_data);	/* resets timer */
 	}
 
-- 
2.50.0


