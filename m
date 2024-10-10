Return-Path: <linux-leds+bounces-3036-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 25EC99986B6
	for <lists+linux-leds@lfdr.de>; Thu, 10 Oct 2024 14:54:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9784AB227A0
	for <lists+linux-leds@lfdr.de>; Thu, 10 Oct 2024 12:54:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C82481C6F45;
	Thu, 10 Oct 2024 12:54:31 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from pidgin.makrotopia.org (pidgin.makrotopia.org [185.142.180.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21C081C2DAA;
	Thu, 10 Oct 2024 12:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.142.180.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728564871; cv=none; b=R9vDeoWRK8IH/qOAVBEfB0q98AjZFv7x6cgUtRnT+5v1ecRvMopHdmgZfWTaePdwsD3tE4dbJv3YXMF1SpDFekzVxogm3CVcXIPz32uACA7n1J+kMtLStg1A/gPFdwzR87LOWKjTzAvA0El4kiBjib9xwuygwPuumkmOSNEZwfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728564871; c=relaxed/simple;
	bh=PUrZp8lCXWqh4KpB2y21LccScnMbQxPhaDUJOqh3RBc=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TrzbRER/4+IJv3BaSQUN7j9hNITus8f226Z70a8OJsGSbkSK2g23vAfD8laE6bP9XjdQGVqibqs2XWjLbmll3Mt4BqjdFpewGvwOVxN/Vl9J942PIlfnAzhL/8zqc33vakElUXHfAlS6YrPIFfslYCXdoph37haaQGYxQnnMwXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org; spf=pass smtp.mailfrom=makrotopia.org; arc=none smtp.client-ip=185.142.180.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=makrotopia.org
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.98)
	(envelope-from <daniel@makrotopia.org>)
	id 1sysgR-0000000039k-0Jbr;
	Thu, 10 Oct 2024 12:54:23 +0000
Date: Thu, 10 Oct 2024 13:54:19 +0100
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
Subject: [PATCH net-next v2 2/5] net: phy: support 'active-high' property for
 PHY LEDs
Message-ID: <91598487773d768f254d5faf06cf65b13e972f0e.1728558223.git.daniel@makrotopia.org>
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

In addition to 'active-low' and 'inactive-high-impedance' also
support 'active-high' property for PHY LED pin configuration.
As only either 'active-high' or 'active-low' can be set at the
same time, WARN and return an error in case both are set.

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
v2: emmit warning and return error if both, 'active-high' and
    'active-low' are set

 drivers/net/phy/phy_device.c | 6 ++++++
 include/linux/phy.h          | 5 +++--
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/net/phy/phy_device.c b/drivers/net/phy/phy_device.c
index 4ccf504a8b2c..e92fac9aad92 100644
--- a/drivers/net/phy/phy_device.c
+++ b/drivers/net/phy/phy_device.c
@@ -3357,11 +3357,17 @@ static int of_phy_led(struct phy_device *phydev,
 	if (index > U8_MAX)
 		return -EINVAL;
 
+	if (of_property_read_bool(led, "active-high"))
+		set_bit(PHY_LED_ACTIVE_HIGH, &modes);
 	if (of_property_read_bool(led, "active-low"))
 		set_bit(PHY_LED_ACTIVE_LOW, &modes);
 	if (of_property_read_bool(led, "inactive-high-impedance"))
 		set_bit(PHY_LED_INACTIVE_HIGH_IMPEDANCE, &modes);
 
+	if (WARN_ON(modes & BIT(PHY_LED_ACTIVE_LOW) &&
+		    modes & BIT(PHY_LED_ACTIVE_HIGH)))
+		return -EINVAL;
+
 	if (modes) {
 		/* Return error if asked to set polarity modes but not supported */
 		if (!phydev->drv->led_polarity_set)
diff --git a/include/linux/phy.h b/include/linux/phy.h
index ff762a3d8270..bf0eb4e5d35c 100644
--- a/include/linux/phy.h
+++ b/include/linux/phy.h
@@ -877,8 +877,9 @@ struct phy_plca_status {
 
 /* Modes for PHY LED configuration */
 enum phy_led_modes {
-	PHY_LED_ACTIVE_LOW = 0,
-	PHY_LED_INACTIVE_HIGH_IMPEDANCE = 1,
+	PHY_LED_ACTIVE_HIGH = 0,
+	PHY_LED_ACTIVE_LOW = 1,
+	PHY_LED_INACTIVE_HIGH_IMPEDANCE = 2,
 
 	/* keep it last */
 	__PHY_LED_MODES_NUM,
-- 
2.47.0

