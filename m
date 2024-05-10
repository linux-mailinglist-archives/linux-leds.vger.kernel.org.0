Return-Path: <linux-leds+bounces-1661-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DD45D8C2CD1
	for <lists+linux-leds@lfdr.de>; Sat, 11 May 2024 01:14:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0CEF31C212A6
	for <lists+linux-leds@lfdr.de>; Fri, 10 May 2024 23:14:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A85D171E5E;
	Fri, 10 May 2024 23:14:53 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from pidgin.makrotopia.org (pidgin.makrotopia.org [185.142.180.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D10B013D24E;
	Fri, 10 May 2024 23:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.142.180.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715382892; cv=none; b=SmR32djcgS4atCqo9PyNvVYr9tiNQL7+HhbUg+Ba8lmZeJWKzoRj3AWGlo/ULbOLz2M/5n2Ul36fCEtpJRdBhmUqTPbKn9QgMrYFysjl+5WWQ/it39Ayg0YOBJlU6uB3J2FgHjtDqya35WxEDjWxPpmW7MTAT9cPUMfPVBlF8ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715382892; c=relaxed/simple;
	bh=Pc7GFzBDdxx+C5kRi7y59nePkuWmI3j6CE75W4o17Oc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dho7QYYybktbZ+sbFPzu5q3DizBl1Ub1jVBCIfqwofoODPoP8yb5dTxWj+M/tUKYrWVATu+aQGVhWrYBc9UDWjiXmnWELTwajmz48K4GdL5qaBCydnFMWCZzppLdh0yU+Q/L48GVjl0tivcYe1AVTO26aAC0gkji6DVPTAbAIPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org; spf=pass smtp.mailfrom=makrotopia.org; arc=none smtp.client-ip=185.142.180.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=makrotopia.org
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.97.1)
	(envelope-from <daniel@makrotopia.org>)
	id 1s5ZRe-000000000Jm-01WF;
	Fri, 10 May 2024 23:14:30 +0000
Date: Sat, 11 May 2024 00:14:25 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	William Zhang <william.zhang@broadcom.com>,
	Anand Gore <anand.gore@broadcom.com>,
	Kursad Oney <kursad.oney@broadcom.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>,
	=?iso-8859-1?Q?Fern=E1ndez?= Rojas <noltari@gmail.com>,
	Sven Schwermer <sven.schwermer@disruptive-technologies.com>,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	netdev@vger.kernel.org
Subject: Re: [net-next PATCH v10 3/5] net: phy: add support for PHY LEDs
 polarity modes
Message-ID: <Zj6qURAmoED2QywF@makrotopia.org>
References: <20240125203702.4552-1-ansuelsmth@gmail.com>
 <20240125203702.4552-4-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240125203702.4552-4-ansuelsmth@gmail.com>

Hi Christian,
Hi Andrew,

On Thu, Jan 25, 2024 at 09:36:59PM +0100, Christian Marangi wrote:
> Add support for PHY LEDs polarity modes. Some PHY require LED to be set
> to active low to be turned ON. Adds support for this by declaring
> active-low property in DT.
> 
> PHY driver needs to declare .led_polarity_set() to configure LED
> polarity modes. Function will pass the index with the LED index and a
> bitmap with all the required modes to set.
> 
> Current supported modes are:
> - active-low with the flag PHY_LED_ACTIVE_LOW. LED is set to active-low
>   to turn it ON.
> - inactive-high-impedance with the flag PHY_LED_INACTIVE_HIGH_IMPEDANCE.
>   LED is set to high impedance to turn it OFF.

Wanting to make use of this I noticed that polarity settings are only
applied once in of_phy_led(), which is not sufficient for my use-case:

I'm writing a LED driver for Aquantia PHYs and those PHYs reset the
polarity mode every time a PHY reset is triggered.

I ended up writing the patch below, but I'm not sure if phy_init_hw
should take care of this or if the polarity modes should be stored in
memory allocated by the PHY driver and re-applied by the driver after
reset (eg. in .config_init). Kinda depends on taste and on how common
this behavior is in practise, so I thought the best is to reach out to
discuss.

Let me know what you think.

diff --git a/drivers/net/phy/phy_device.c b/drivers/net/phy/phy_device.c
index 616bd7ba46cb..1624884fd627 100644
--- a/drivers/net/phy/phy_device.c
+++ b/drivers/net/phy/phy_device.c
@@ -1251,6 +1251,7 @@ static int phy_poll_reset(struct phy_device *phydev)
 int phy_init_hw(struct phy_device *phydev)
 {
 	int ret = 0;
+	struct phy_led *phyled;
 
 	/* Deassert the reset signal */
 	phy_device_reset(phydev, 0);
@@ -1285,6 +1286,17 @@ int phy_init_hw(struct phy_device *phydev)
 			return ret;
 	}
 
+	if (phydev->drv->led_polarity_set) {
+		list_for_each_entry(phyled, &phydev->leds, list) {
+			if (!phyled->polarity_modes)
+				continue;
+
+			ret = phydev->drv->led_polarity_set(phydev, phyled->index, phyled->polarity_modes);
+			if (ret)
+				return ret;
+		}
+	}
+
 	return 0;
 }
 EXPORT_SYMBOL(phy_init_hw);
@@ -3316,7 +3328,6 @@ static int of_phy_led(struct phy_device *phydev,
 	struct device *dev = &phydev->mdio.dev;
 	struct led_init_data init_data = {};
 	struct led_classdev *cdev;
-	unsigned long modes = 0;
 	struct phy_led *phyled;
 	u32 index;
 	int err;
@@ -3335,18 +3346,14 @@ static int of_phy_led(struct phy_device *phydev,
 		return -EINVAL;
 
 	if (of_property_read_bool(led, "active-low"))
-		set_bit(PHY_LED_ACTIVE_LOW, &modes);
+		set_bit(PHY_LED_ACTIVE_LOW, &phyled->polarity_modes);
 	if (of_property_read_bool(led, "inactive-high-impedance"))
-		set_bit(PHY_LED_INACTIVE_HIGH_IMPEDANCE, &modes);
+		set_bit(PHY_LED_INACTIVE_HIGH_IMPEDANCE, &phyled->polarity_modes);
 
-	if (modes) {
+	if (phyled->polarity_modes) {
 		/* Return error if asked to set polarity modes but not supported */
 		if (!phydev->drv->led_polarity_set)
 			return -EINVAL;
-
-		err = phydev->drv->led_polarity_set(phydev, index, modes);
-		if (err)
-			return err;
 	}
 
 	phyled->index = index;
diff --git a/include/linux/phy.h b/include/linux/phy.h
index 3ddfe7fe781a..7c8bd72e6fee 100644
--- a/include/linux/phy.h
+++ b/include/linux/phy.h
@@ -888,6 +888,7 @@ struct phy_led {
 	struct list_head list;
 	struct phy_device *phydev;
 	struct led_classdev led_cdev;
+	unsigned long polarity_modes;
 	u8 index;
 };
 

