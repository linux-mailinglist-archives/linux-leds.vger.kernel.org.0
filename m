Return-Path: <linux-leds+bounces-3617-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A03A9F2E7E
	for <lists+linux-leds@lfdr.de>; Mon, 16 Dec 2024 11:48:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B7203161C6D
	for <lists+linux-leds@lfdr.de>; Mon, 16 Dec 2024 10:48:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 675E8203D53;
	Mon, 16 Dec 2024 10:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="O+pY6u1Q"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx.denx.de (mx.denx.de [89.58.32.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BEB11FF7CA;
	Mon, 16 Dec 2024 10:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.58.32.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734346133; cv=none; b=q3ipzMzdRv+eBd/9lP4g9vbPxKs8PXATNj0h5lv7aOOjTe6u2tWBCboIc+G5w5BDrN9TPCoigCHCwqK/7zkZwANL1Wy3TqQt7i4x/BBJi9WlrODFc5Eq2+1VTzZRlOFUHsyvpTJh5uWTejXgkpUeO1MC8aTCuPrQk2RYNldR2sA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734346133; c=relaxed/simple;
	bh=FeE9uoz1XlundDdxH0bo5LNmwkRiK6g82p3uZWZ85T8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OYi/eHuSEiUaV5FY2OqjMds6q+eCtnoRwCWNp7GNzpqLzWjUhV/m8/n3Oxslz4f1ic+hGFNdNblmyg1gTxBLD6itrly1k++Q+Oe17zwX9fiF4eiIWYTNXJ1AHGI5M4ePyBjBmFmEfdxYDAjajoWD7sTIPKT+CtsqaF22CEQynKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=O+pY6u1Q; arc=none smtp.client-ip=89.58.32.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3CD2210485583;
	Mon, 16 Dec 2024 11:48:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1734346125;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Za1qix9JUC09ToDEoUUTr8e+BFUBM5V10zVNxMXFSIA=;
	b=O+pY6u1Q+ijtVw3tzhJCjRyROFg7PkpQszT0yM/rcH+hd4qsAIVLdq+xpC9RQgSTZS6gAr
	SVNkk8yHprfW4Urq+IO5xEZxdCAfB/jFanMP/D6vaDR0hJLEcIb6NXblxrsR81af8V+z2y
	FKT1+GPJCUoEotD+Ep5woz1b4FtL2KpFY9pEASkpc4ADmeLWxIvxQSORe6Dk/Bn4aumKx2
	eQxOy0DpTxjs7vv0OZYfODR1r+KwUkKO69l/1IL9lTOEw0zh7zG6akB+VMKIqP7sJ+lrAA
	An1CA7zDts5vP1rlGug1RJv0b27WsvRL5t2fpeJJJthTy0s1AVrcqXIrthgXPw==
From: Marek Vasut <marex@denx.de>
To: linux-leds@vger.kernel.org
Cc: Marek Vasut <marex@denx.de>,
	Andrew Lunn <andrew@lunn.ch>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
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
Subject: [PATCH v2] leds: trigger: netdev: Check offload ability on interface up
Date: Mon, 16 Dec 2024 11:48:22 +0100
Message-ID: <20241216104826.6946-1-marex@denx.de>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

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

Reviewed-by: Andrew Lunn <andrew@lunn.ch>
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
V2: Add RB from Andrew
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


