Return-Path: <linux-leds+bounces-3754-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C5A72A0ACCE
	for <lists+linux-leds@lfdr.de>; Mon, 13 Jan 2025 01:24:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A7B4B1886606
	for <lists+linux-leds@lfdr.de>; Mon, 13 Jan 2025 00:24:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 430D533C5;
	Mon, 13 Jan 2025 00:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="Cci70lU8"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx.denx.de (mx.denx.de [89.58.32.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DA6B749A;
	Mon, 13 Jan 2025 00:24:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.58.32.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736727847; cv=none; b=kDP9SIFP774j+fdMqtrKqs4TouDjfwjGzegBKBi/4KBwIEgcDqFRG5vYsIP0nnPKP9LKTHCoNg+rHNWGq8cn8epnYXhTRPk1kR+MYp5LBpcv66VmDk82Ggfq+auRbhkaTNLZ6EYpQHMqE7w9BbfAmU7zcTO+03hM//BcWw+6I8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736727847; c=relaxed/simple;
	bh=LK36QBCDL7VmwpsAxJ3myMP3WAaaLSWzzF3ae6NLIbU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hApz7LItdvxFQJUzBB50m9vWvfuvlVOXgSuRlQjV42NunFq3gAsErWPAzXqAsFb/bLi2xWvVnYCEpc24NACFKCafejNdVND0HJ3wJPU1eVMoBaelydFLQ3YE19J7N9OF5yAnuRcrPs4ZAIJL/VQImuEYvE39feOjDW5kC1hmJbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=Cci70lU8; arc=none smtp.client-ip=89.58.32.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 19B77101D23A3;
	Mon, 13 Jan 2025 01:24:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1736727842;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CiinI+Vz1CC4T2hrWYGNflx0pjUKdpQ9DrI6EquLXFM=;
	b=Cci70lU8JxhsgWjag55yL5tDNa41fTbFIyuWFz/qofb7wSwPcfhNPrVSu6OYrri/CG561n
	A3elaYHv/TaLtOv80HrBGirZx5ViJ7j6agYbD30oxRmfIFtvqf/DF/B1IpfSW45Dotehk3
	NzNTPbc1qq0nyrZp5yZkNGBMEnFUgyK+daNSpnshmOoScFO+c72JG/WM2BQPwL7tkcfjuN
	xUmos7GImV3LiT0GZcGIaeWy9e9oRhCpeXjDrtEMZEnRc35/junJh5V+9w8LQzgMiMu8ud
	53wpxSBzCxuJ6xnz9qC6Hc2pRvfcl/hCXgRzDVSRknIuSnadw0y73sMzo8LZSA==
From: Marek Vasut <marex@denx.de>
To: linux-leds@vger.kernel.org
Cc: Marek Vasut <marex@denx.de>,
	Andrew Lunn <andrew@lunn.ch>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Lukasz Majewski <lukma@denx.de>,
	Pavel Machek <pavel@ucw.cz>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH 2/2] leds: trigger: netdev: Introduce OF mode configuration using netdev-trigger-mode property
Date: Mon, 13 Jan 2025 01:23:38 +0100
Message-ID: <20250113002346.297481-2-marex@denx.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250113002346.297481-1-marex@denx.de>
References: <20250113002346.297481-1-marex@denx.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Introduce netdev trigger specific netdev-trigger-mode property which
is used to configure the netdev trigger mode flags. Those mode flags
define events on which the LED acts upon when the hardware offload is
enabled. This is traditionally configured via sysfs, but that depends
on userspace, which is available too late and makes ethernet PHY LEDs
not work e.g. when NFS root is being mounted.

For each LED with linux,default-trigger = "netdev" described in DT, the
optional netdev-trigger-mode property supplies the default configuration
of the PHY LED mode via DT. This property should be set to a subset of
TRIGGER_NETDEV_* flags.

For each LED with linux,default-trigger = "netdev" described in DT, the
netdev trigger is activated during kernel boot. The trigger is extended
the parse the netdev-trigger-mode property and set it as a default value
of trigger_data->mode.

It is not possible to immediately configure the LED mode, because the
interface to which the PHY and the LED is connected to might not be
attached to the PHY yet. The netdev_trig_notify() is called when the
PHY got attached to interface, extend netdev_trig_notify() to detect
the condition where the LED does have netdev trigger configured in DT
but the mode was not yet configured and configure the baseline mode
from the notifier. This can reuse most of set_device_name() except for
the rtnl_lock() which cannot be claimed in the notifier, so split the
relevant core code into set_device_name_locked() and call only the core
code.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Andrew Lunn <andrew@lunn.ch>
Cc: Christian Marangi <ansuelsmth@gmail.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Lee Jones <lee@kernel.org>
Cc: Lukasz Majewski <lukma@denx.de>
Cc: Pavel Machek <pavel@ucw.cz>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-leds@vger.kernel.org
---
 drivers/leds/trigger/ledtrig-netdev.c | 51 ++++++++++++++++++++-------
 1 file changed, 38 insertions(+), 13 deletions(-)

diff --git a/drivers/leds/trigger/ledtrig-netdev.c b/drivers/leds/trigger/ledtrig-netdev.c
index c15efe3e50780..20dfc9506c0a6 100644
--- a/drivers/leds/trigger/ledtrig-netdev.c
+++ b/drivers/leds/trigger/ledtrig-netdev.c
@@ -23,6 +23,7 @@
 #include <linux/module.h>
 #include <linux/netdevice.h>
 #include <linux/mutex.h>
+#include <linux/of.h>
 #include <linux/phy.h>
 #include <linux/rtnetlink.h>
 #include <linux/timer.h>
@@ -256,19 +257,9 @@ static ssize_t device_name_show(struct device *dev,
 	return len;
 }
 
-static int set_device_name(struct led_netdev_data *trigger_data,
-			   const char *name, size_t size)
+static void set_device_name_locked(struct led_netdev_data *trigger_data,
+				  const char *name, size_t size)
 {
-	if (size >= IFNAMSIZ)
-		return -EINVAL;
-
-	cancel_delayed_work_sync(&trigger_data->work);
-
-	/*
-	 * Take RTNL lock before trigger_data lock to prevent potential
-	 * deadlock with netdev notifier registration.
-	 */
-	rtnl_lock();
 	mutex_lock(&trigger_data->lock);
 
 	if (trigger_data->net_dev) {
@@ -298,6 +289,24 @@ static int set_device_name(struct led_netdev_data *trigger_data,
 		set_baseline_state(trigger_data);
 
 	mutex_unlock(&trigger_data->lock);
+}
+
+static int set_device_name(struct led_netdev_data *trigger_data,
+			   const char *name, size_t size)
+{
+	if (size >= IFNAMSIZ)
+		return -EINVAL;
+
+	cancel_delayed_work_sync(&trigger_data->work);
+
+	/*
+	 * Take RTNL lock before trigger_data lock to prevent potential
+	 * deadlock with netdev notifier registration.
+	 */
+	rtnl_lock();
+
+	set_device_name_locked(trigger_data, name, size);
+
 	rtnl_unlock();
 
 	return 0;
@@ -579,6 +588,20 @@ static int netdev_trig_notify(struct notifier_block *nb,
 	    && evt != NETDEV_CHANGENAME)
 		return NOTIFY_DONE;
 
+	if (evt == NETDEV_REGISTER && !trigger_data->device_name[0] &&
+	    led_cdev->hw_control_get && led_cdev->hw_control_set &&
+	    led_cdev->hw_control_is_supported) {
+		struct device *ndev = led_cdev->hw_control_get_device(led_cdev);
+		if (ndev) {
+			const char *name = dev_name(ndev);
+
+			trigger_data->hw_control = true;
+
+			cancel_delayed_work_sync(&trigger_data->work);
+			set_device_name_locked(trigger_data, name, strlen(name));
+		}
+	}
+
 	if (!(dev == trigger_data->net_dev ||
 	      (evt == NETDEV_CHANGENAME && !strcmp(dev->name, trigger_data->device_name)) ||
 	      (evt == NETDEV_REGISTER && !strcmp(dev->name, trigger_data->device_name))))
@@ -689,6 +712,7 @@ static int netdev_trig_activate(struct led_classdev *led_cdev)
 	struct led_netdev_data *trigger_data;
 	unsigned long mode = 0;
 	struct device *dev;
+	u32 val;
 	int rc;
 
 	trigger_data = kzalloc(sizeof(struct led_netdev_data), GFP_KERNEL);
@@ -706,7 +730,8 @@ static int netdev_trig_activate(struct led_classdev *led_cdev)
 	trigger_data->net_dev = NULL;
 	trigger_data->device_name[0] = 0;
 
-	trigger_data->mode = 0;
+	rc = of_property_read_u32(led_cdev->dev->of_node, "netdev-trigger-mode", &val);
+	trigger_data->mode = rc ? 0 : val;
 	atomic_set(&trigger_data->interval, msecs_to_jiffies(NETDEV_LED_DEFAULT_INTERVAL));
 	trigger_data->last_activity = 0;
 
-- 
2.45.2


