Return-Path: <linux-leds+bounces-4414-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5731DA7CBA0
	for <lists+linux-leds@lfdr.de>; Sat,  5 Apr 2025 21:10:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 12E6816BCD6
	for <lists+linux-leds@lfdr.de>; Sat,  5 Apr 2025 19:10:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 627271A9B4D;
	Sat,  5 Apr 2025 19:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wp.pl header.i=@wp.pl header.b="uHDwMULZ"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx3.wp.pl (mx3.wp.pl [212.77.101.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 778791A7044
	for <linux-leds@vger.kernel.org>; Sat,  5 Apr 2025 19:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.77.101.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743880201; cv=none; b=QSvuk774YNFCDJeWxd0y+oHjZUeLACuErQCfDjONYXvmTazbFC/fXE49mGYhs8yDgvQ1Fnp7dm958ejg7xsByg/S7pBmW8M+eIk7h6pmaGR0+tqqoApV/WR8DvHezmfqwz+cwMiYsa56+J//7yLWeb8CE5qzHLj7JPXBCHNvHck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743880201; c=relaxed/simple;
	bh=XBVYnSEdtaqyZtn3CoP3og85kPWuoDdRWzQInijuTwA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ur43MhxgpbGBF0fRE9qWFz9rBKfzZu6ti7D9/VRb6W/zJ65Iv4DFj5FlXzzmf9YuZqlqi3eLBJnrot0Xy57a+iNsCEF8AkwgZVgBkJXwv/SSf7xu68UKm/tTTXa2y1ItIjzqUrluNHxF4iDcUtXQQ65x+qaSbsFKJ9eTtKBzOlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wp.pl; spf=pass smtp.mailfrom=wp.pl; dkim=pass (2048-bit key) header.d=wp.pl header.i=@wp.pl header.b=uHDwMULZ; arc=none smtp.client-ip=212.77.101.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wp.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wp.pl
Received: (wp-smtpd smtp.wp.pl 45658 invoked from network); 5 Apr 2025 21:09:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wp.pl; s=20241105;
          t=1743880196; bh=QYBX4vu5I37sHQVuEXp0KOgYOqzFy606Yl2aFs6b+hw=;
          h=From:To:Cc:Subject;
          b=uHDwMULZKu0OvXuxaJ1BM9L2BVb2/xVrnEMOiCESiVcTyps7aONw6Mk5ByHdixBq3
           lt0Mmg77uZSDR+IAeSIhqE0J/ctrya+VyrzdgDTPiqgplvOE/RoH30ibJtgG7iU+gc
           5LdLVb62NhS4j+x0iQMbEXmkJh3DDIR7PXnrIGdMTPUWoFkPuxVJD5xoBgshMT5z5y
           ScWeNpzPOUIcmj6aJavZhKTN0yjGBM+awbvKyAiZ7h9mtJf2bveQAqgRU3eKI1KemP
           2p9G/p+a8DF8WqOJvVniThfLT2XImgHaaNDngkzzISvpQ8FWqOeiYPLWa1vQDVwXMb
           IF73REanOODxQ==
Received: from 83.5.244.88.ipv4.supernova.orange.pl (HELO laptop-olek.home) (olek2@wp.pl@[83.5.244.88])
          (envelope-sender <olek2@wp.pl>)
          by smtp.wp.pl (WP-SMTPD) with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP
          for <lxu@maxlinear.com>; 5 Apr 2025 21:09:56 +0200
From: Aleksander Jan Bajkowski <olek2@wp.pl>
To: lxu@maxlinear.com,
	andrew@lunn.ch,
	hkallweit1@gmail.com,
	linux@armlinux.org.uk,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lee@kernel.org,
	linux-leds@vger.kernel.org
Cc: Aleksander Jan Bajkowski <olek2@wp.pl>,
	Daniel Golle <daniel@makrotopia.org>
Subject: [PATCH net-next,v2 1/2] net: phy: add LED dimming support
Date: Sat,  5 Apr 2025 21:09:53 +0200
Message-Id: <20250405190954.703860-1-olek2@wp.pl>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-WP-MailID: 1f0438803e2afca918208c5071d2c27d
X-WP-AV: skaner antywirusowy Poczty Wirtualnej Polski
X-WP-SPAM: NO 000000B [YdO0]                               

Some PHYs support LED dimming. The use case is a router that dims LEDs
at night. PHYs from different manufacturers support a different number of
brightness levels, so it was necessary to extend the API with the
led_max_brightness() function. If this function is omitted, a default
value is used, assuming that only two levels are supported.

Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>
Reviewed-by: Daniel Golle <daniel@makrotopia.org>
---
 drivers/net/phy/phy_device.c | 7 ++++++-
 include/linux/phy.h          | 7 +++++++
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/net/phy/phy_device.c b/drivers/net/phy/phy_device.c
index 675fbd225378..4011ececca70 100644
--- a/drivers/net/phy/phy_device.c
+++ b/drivers/net/phy/phy_device.c
@@ -3106,7 +3106,12 @@ static int of_phy_led(struct phy_device *phydev,
 
 	cdev->hw_control_get_device = phy_led_hw_control_get_device;
 #endif
-	cdev->max_brightness = 1;
+	if (phydev->drv->led_max_brightness)
+		cdev->max_brightness =
+			phydev->drv->led_max_brightness(phydev, index);
+	else
+		cdev->max_brightness = 1;
+
 	init_data.devicename = dev_name(&phydev->mdio.dev);
 	init_data.fwnode = of_fwnode_handle(led);
 	init_data.devname_mandatory = true;
diff --git a/include/linux/phy.h b/include/linux/phy.h
index a2bfae80c449..94da2b6607a4 100644
--- a/include/linux/phy.h
+++ b/include/linux/phy.h
@@ -1172,6 +1172,13 @@ struct phy_driver {
 	int (*led_brightness_set)(struct phy_device *dev,
 				  u8 index, enum led_brightness value);
 
+	/**
+	 * @led_max_brightness: Maximum number of brightness levels
+	 * supported by hardware. When only two levels are supported
+	 * i.e. LED_ON and LED_OFF the function can be omitted.
+	 */
+	int (*led_max_brightness)(struct phy_device *dev, u8 index);
+
 	/**
 	 * @led_blink_set: Set a PHY LED blinking.  Index indicates
 	 * which of the PHYs led should be configured to blink. Delays
-- 
2.39.5


