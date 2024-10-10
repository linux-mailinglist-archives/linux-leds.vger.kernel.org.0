Return-Path: <linux-leds+bounces-3038-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ECC5E9986C0
	for <lists+linux-leds@lfdr.de>; Thu, 10 Oct 2024 14:55:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 88CD6287B68
	for <lists+linux-leds@lfdr.de>; Thu, 10 Oct 2024 12:55:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88F781C7B6E;
	Thu, 10 Oct 2024 12:55:29 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from pidgin.makrotopia.org (pidgin.makrotopia.org [185.142.180.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2CE01C6F65;
	Thu, 10 Oct 2024 12:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.142.180.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728564929; cv=none; b=ADc0JdT7sN2gyYC0foFZ9hqugGhBbIfTQlv6/W7T9HFdcIOmeFv7vSx6xOwxX0tQynvoWWsGbf+Ct0iJ2+i/sBTEf5RA74uN66qfIQ2NGI+Qq9qNjegGPqxA3bfy0BH+WwN218sGirqjenrHHA4S6wxteX+3aryLldZedhkVJmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728564929; c=relaxed/simple;
	bh=BDcveaXRRH7OxdXgT/OSU3kQSAeTncKr+aE+8wR1bJE=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ds03N8+qIWJ0fXUxrX67KRWYwuE5opXnsPXluTGr7JkXCBVNsPdU7TD5MWqOrapeYm4ZkwV1xiUtuft47lJTjk4Ohtubd+q/bUn2vdYO9pFEGpbn3HyqEtOk3qFoabtGX0W+ku/wyFWYv9lc/5LtZaK6XpMdyVoXWFWGJNqGivQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org; spf=pass smtp.mailfrom=makrotopia.org; arc=none smtp.client-ip=185.142.180.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=makrotopia.org
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.98)
	(envelope-from <daniel@makrotopia.org>)
	id 1syshN-000000003Ap-2cNR;
	Thu, 10 Oct 2024 12:55:21 +0000
Date: Thu, 10 Oct 2024 13:55:17 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Xu Liang <lxu@maxlinear.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Daniel Golle <daniel@makrotopia.org>,
	Robert Marko <robimarko@gmail.com>,
	Russell King <rmk+kernel@armlinux.org.uk>,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Subject: [PATCH net-next v2 4/5] net: phy: mxl-gpy: correctly describe LED
 polarity
Message-ID: <180ccafa837f09908b852a8a874a3808c5ecd2d0.1728558223.git.daniel@makrotopia.org>
References: <e9b15613a81129ceecb07ec51f71bbe75425ad2e.1728558223.git.daniel@makrotopia.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e9b15613a81129ceecb07ec51f71bbe75425ad2e.1728558223.git.daniel@makrotopia.org>

According the datasheet covering the LED (0x1b) register:
0B Active High LEDx pin driven high when activated
1B Active Low LEDx pin driven low when activated

Make use of the now available 'active-high' property and correctly
reflect the polarity setting which was previously inverted.

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
---
v2: use dedicated bools force_active_high and force_active_low to make
    gpy_led_polarity_set() more robust

 drivers/net/phy/mxl-gpy.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/net/phy/mxl-gpy.c b/drivers/net/phy/mxl-gpy.c
index bc4abb957e15..00676e272913 100644
--- a/drivers/net/phy/mxl-gpy.c
+++ b/drivers/net/phy/mxl-gpy.c
@@ -989,7 +989,7 @@ static int gpy_led_hw_control_set(struct phy_device *phydev, u8 index,
 static int gpy_led_polarity_set(struct phy_device *phydev, int index,
 				unsigned long modes)
 {
-	bool active_low = false;
+	bool force_active_low = false, force_active_high = false;
 	u32 mode;
 
 	if (index >= GPY_MAX_LEDS)
@@ -998,15 +998,23 @@ static int gpy_led_polarity_set(struct phy_device *phydev, int index,
 	for_each_set_bit(mode, &modes, __PHY_LED_MODES_NUM) {
 		switch (mode) {
 		case PHY_LED_ACTIVE_LOW:
-			active_low = true;
+			force_active_low = true;
+			break;
+		case PHY_LED_ACTIVE_HIGH:
+			force_active_high = true;
 			break;
 		default:
 			return -EINVAL;
 		}
 	}
 
-	return phy_modify(phydev, PHY_LED, PHY_LED_POLARITY(index),
-			  active_low ? 0 : PHY_LED_POLARITY(index));
+	if (force_active_low)
+		return phy_set_bits(phydev, PHY_LED, PHY_LED_POLARITY(index));
+
+	if (force_active_high)
+		return phy_clear_bits(phydev, PHY_LED, PHY_LED_POLARITY(index));
+
+	unreachable();
 }
 
 static struct phy_driver gpy_drivers[] = {
-- 
2.47.0

