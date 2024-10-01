Return-Path: <linux-leds+bounces-2896-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 81DE098B290
	for <lists+linux-leds@lfdr.de>; Tue,  1 Oct 2024 04:53:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 224B228804C
	for <lists+linux-leds@lfdr.de>; Tue,  1 Oct 2024 02:53:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72C8B44374;
	Tue,  1 Oct 2024 02:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="Tqxdr5Qy"
X-Original-To: linux-leds@vger.kernel.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4743D2C6BB;
	Tue,  1 Oct 2024 02:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727750875; cv=none; b=pVkKkF2G4hCqVlDEoWPeam84oJ7NzHVADbEHh6wATnqSu0Hq0qjjCNRVnzI+l6tEemTCLyvGUfRiJjh8DEv/wA1me9/O8sU9q544ESuxhMj5nhyCHxHuRNYFbtLgDrc9J9oAqNkPC3pUJsOEhyuQig///2PXbYzVHJzkKQKQfVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727750875; c=relaxed/simple;
	bh=jNSaRlMS0pxpzcklnPIgQ2sMpWB4Ku751X0pvluJBkA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nEIfdNi15IHiqJ+/03gHpkBlePINOAiRb0Q3p7kM/3zZLII1QFbRV3zCasUlX9e0cQ76JeBgE0u10CcV/NKPJ+PoUWjtd1BqsWrboromNDlHoBoyCnSIp3NY3OjACLQAs/wLOkGxjMR4F7qYcAzCWPMsG1BNTCt/AcIhwoekABc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=Tqxdr5Qy; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 1674188CBD;
	Tue,  1 Oct 2024 04:47:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1727750871;
	bh=NhcdDwpsEmYCBndpQt/krb+dCGJNToK5RDdDiG8+SdQ=;
	h=From:To:Cc:Subject:Date:From;
	b=Tqxdr5QyjWQtO/GZKEzyZKmWmh/BY5cNdYxNtHv3X+DJumohPcqf6m/QGzbEUkzl8
	 bUceATTrzwlIIDYXwYfPzsTz/JkVrWn0AACWZmKpAz0xYsE7Ww1AVlfXJZiOG4zcrM
	 J08UN4X/9343V42sWX1tbppO4Tip1GLncuR/vjLbZUN9t/RYgeB97qe95ZPpNwmjaa
	 Mc67RpSRNRJMNEDksvzA1/wTcHm6+zHu0uHoPpYDycnAeYoDmDQgqX5IA0ad4oEAgu
	 hRchnF+k3YR7y+UUlx1pyKUfsI/VYVPX+kaAmyfwtpAQB8X3uZN2H+ixRQu4Qey4ch
	 tsO5kdCUxvF3Q==
From: Marek Vasut <marex@denx.de>
To: linux-leds@vger.kernel.org
Cc: Marek Vasut <marex@denx.de>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Christophe Roullier <christophe.roullier@foss.st.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Lukasz Majewski <lukma@denx.de>,
	Pavel Machek <pavel@ucw.cz>,
	kernel@dh-electronics.com,
	linux-stm32@st-md-mailman.stormreply.com,
	netdev@vger.kernel.org
Subject: [PATCH] leds: trigger: netdev: Check offload ability on interface up
Date: Tue,  1 Oct 2024 04:45:23 +0200
Message-ID: <20241001024731.140069-1-marex@denx.de>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

The trigger_data->hw_control indicates whether the LED is controlled by HW
offload, i.e. the PHY. The trigger_data->hw_control = can_hw_control() is
currently called only from netdev_led_attr_store(), i.e. when writing any
sysfs attribute of the netdev trigger instance associated with a PHY LED.

The can_hw_control() calls validate_net_dev() which internally calls
led_cdev->hw_control_get_device(), which is phy_led_hw_control_get_device()
for PHY LEDs. The phy_led_hw_control_get_device() returns NULL if the PHY
is not attached.

At least in case of DWMAC (STM32MP, iMX8M, ...), the PHY device is attached
only when the interface is brought up and is detached again when the
interface is brought down. In case e.g. udev rules configure the netdev
LED trigger sysfs attributes before the interface is brought up, then when
the interface is brought up, the LEDs are not blinking.

This is because trigger_data->hw_control = can_hw_control() was called
when udev wrote the sysfs attribute files, before the interface was up,
so can_hw_control() resp. validate_net_dev() returned false, and the
trigger_data->hw_control = can_hw_control() was never called again to
update the trigger_data->hw_control content and let the offload take
over the LED blinking.

Call data->hw_control = can_hw_control() from netdev_trig_notify() to
update the offload capability of the LED when the UP notification arrives.
This makes the LEDs blink after the interface is brought up.

On STM32MP13xx with RTL8211F, it is enough to have the following udev rule
in place, boot the machine with cable plugged in, and the LEDs won't work
without this patch once the interface is brought up, even if they should:
"
ACTION=="add", SUBSYSTEM=="leds", KERNEL=="stmmac-0:01:green:wan", ATTR{trigger}="netdev", ATTR{link_10}="1", ATTR{link_100}="1", ATTR{link_1000}="1", ATTR{device_name}="end0"
ACTION=="add", SUBSYSTEM=="leds", KERNEL=="stmmac-0:01:yellow:wan", ATTR{trigger}="netdev", ATTR{rx}="1", ATTR{tx}="1", ATTR{device_name}="end0"
"

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Andrew Lunn <andrew@lunn.ch>
Cc: Christian Marangi <ansuelsmth@gmail.com>
Cc: Christophe Roullier <christophe.roullier@foss.st.com>
Cc: Daniel Golle <daniel@makrotopia.org>
Cc: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Lee Jones <lee@kernel.org>
Cc: Lukasz Majewski <lukma@denx.de>
Cc: Pavel Machek <pavel@ucw.cz>
Cc: kernel@dh-electronics.com
Cc: linux-leds@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: netdev@vger.kernel.org
---
 drivers/leds/trigger/ledtrig-netdev.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/leds/trigger/ledtrig-netdev.c b/drivers/leds/trigger/ledtrig-netdev.c
index 4b0863db901a9..c15efe3e50780 100644
--- a/drivers/leds/trigger/ledtrig-netdev.c
+++ b/drivers/leds/trigger/ledtrig-netdev.c
@@ -605,6 +605,8 @@ static int netdev_trig_notify(struct notifier_block *nb,
 		trigger_data->net_dev = NULL;
 		break;
 	case NETDEV_UP:
+		trigger_data->hw_control = can_hw_control(trigger_data);
+		fallthrough;
 	case NETDEV_CHANGE:
 		get_device_state(trigger_data);
 		/* Refresh link_speed visibility */
-- 
2.45.2


