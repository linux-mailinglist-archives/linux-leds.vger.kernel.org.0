Return-Path: <linux-leds+bounces-5050-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BF4F5B02BB7
	for <lists+linux-leds@lfdr.de>; Sat, 12 Jul 2025 17:39:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E61001AA3D12
	for <lists+linux-leds@lfdr.de>; Sat, 12 Jul 2025 15:40:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 516C12BAF4;
	Sat, 12 Jul 2025 15:39:43 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from pidgin.makrotopia.org (pidgin.makrotopia.org [185.142.180.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0656F278761;
	Sat, 12 Jul 2025 15:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.142.180.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752334783; cv=none; b=dPgdc32RVJaf1UtgLlomVCVM4lZ0bYE55TTOpDPDoJNvhcE3iKu295TYKHo971qDG44az0FyR/aDgM7L451KqXm8DF6rk795PwwOS76qSyGW80soE44SPNt2SlPBZjlCmpfb49HRdbYmg3GhXptS+GXRV0a9N46gr/4cJdurDS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752334783; c=relaxed/simple;
	bh=TDlk/7piRADNdlRBOAhu2fuQY5YffS22iPT+2k178Ng=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nW96Yz6pAuS5qUW5qPGyL15Iv8rnSGEHjHKC80F1DPfvTjLEj3u1X06h4j+DYDeCMLoTKUGts8e+ACi+Cao5zFnQXe+U7z13RVfHUF7YOQkviYJgPCD46MCSSwSh8SwDReMRtGXYB3hwds5uR98BqqrMiw85BojBqRqVah2Rp1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org; spf=pass smtp.mailfrom=makrotopia.org; arc=none smtp.client-ip=185.142.180.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=makrotopia.org
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.98.2)
	(envelope-from <daniel@makrotopia.org>)
	id 1uacK0-000000007Hb-1M5R;
	Sat, 12 Jul 2025 15:39:28 +0000
Date: Sat, 12 Jul 2025 16:39:21 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>, Marek Vasut <marek.vasut@mailbox.org>,
	Lukasz Majewski <lukma@denx.de>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>, linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] Revert "leds: trigger: netdev: Configure LED blink
 interval for HW offload"
Message-ID: <6dcc77ee1c9676891d6250d8994850f521426a0f.1752334655.git.daniel@makrotopia.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

This reverts commit c629c972b310af41e9e072febb6dae9a299edde6.

While .led_blink_set() would previously put an LED into an unconditional
permanently blinking state, the offending commit now uses same operation
to (also?) set the blink timing of the netdev trigger when offloading.

This breaks many if not all of the existing PHY drivers which offer
offloading LED operations, as those drivers would just put the LED into
blinking state after .led_blink_set() has been called.

Unfortunately the change even made it into stable kernels for unknown
reasons, so it should be reverted there as well.

Fixes: c629c972b310a ("leds: trigger: netdev: Configure LED blink interval for HW offload")
Link: https://lore.kernel.org/linux-leds/c6134e26-2e45-4121-aa15-58aaef327201@lunn.ch/T/#m9d6fe81bbcb273e59f12bbedbd633edd32118387
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
2.50.1


