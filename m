Return-Path: <linux-leds+bounces-3037-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 86C4E9986BC
	for <lists+linux-leds@lfdr.de>; Thu, 10 Oct 2024 14:55:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B65E61C214F8
	for <lists+linux-leds@lfdr.de>; Thu, 10 Oct 2024 12:55:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE2E51C8FAA;
	Thu, 10 Oct 2024 12:55:12 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from pidgin.makrotopia.org (pidgin.makrotopia.org [185.142.180.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 042F91C7B63;
	Thu, 10 Oct 2024 12:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.142.180.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728564912; cv=none; b=DAUgFh7qmQKBZHVLz+Qbt1ZWt4rZjB42mVv45FRGccyFwFQhi30rG/8QS7MMhp2b+k6DsnZuT4jTDKweweBPHU9L2fgALvt8wfpMoWdkPUWw+ihk7zOMpOv+PaZa+Du66EkcdAl68KhYdLl91vZDA8YNhCwZ3UaBd5HQdHy9Qok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728564912; c=relaxed/simple;
	bh=9T18g7yr2ox+C+1PRX2dfhTcOSFI6bMTmsJZHdGkvlM=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dd5tOTEbocv0s8XQG6aaiFINjRxdmiDxivsRVcnW4GiwnKtGiWZwZdByFvffxUTm5KIGxWS7e/2QfZjn+sT0Imzyj9VeIo2ZhdySvWhsDNd9A/Qbrldlp6qQlBXKlKJj94ghxDUDaZoQ0vevnHN9gFBAJrEDBQPchJEOGrRRZhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org; spf=pass smtp.mailfrom=makrotopia.org; arc=none smtp.client-ip=185.142.180.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=makrotopia.org
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.98)
	(envelope-from <daniel@makrotopia.org>)
	id 1sysh6-000000003AT-2EW4;
	Thu, 10 Oct 2024 12:55:04 +0000
Date: Thu, 10 Oct 2024 13:55:00 +0100
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
Subject: [PATCH net-next v2 3/5] net: phy: aquantia: correctly describe LED
 polarity override
Message-ID: <86a413b4387c42dcb54f587cc2433a06f16aae83.1728558223.git.daniel@makrotopia.org>
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

Use newly defined 'active-high' property to set the
VEND1_GLOBAL_LED_DRIVE_VDD bit and let 'active-low' clear that bit. This
reflects the technical reality which was inverted in the previous
description in which the 'active-low' property was used to actually set
the VEND1_GLOBAL_LED_DRIVE_VDD bit, which means that VDD (ie. supply
voltage) of the LED is driven rather than GND.

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
v2: use dedicated bools force_active_high and force_active_low to make
    aqr_phy_led_polarity_set() more robust

 drivers/net/phy/aquantia/aquantia.h      |  1 +
 drivers/net/phy/aquantia/aquantia_leds.c | 19 ++++++++++++++-----
 drivers/net/phy/aquantia/aquantia_main.c | 12 +++++++++---
 3 files changed, 24 insertions(+), 8 deletions(-)

diff --git a/drivers/net/phy/aquantia/aquantia.h b/drivers/net/phy/aquantia/aquantia.h
index 2465345081f8..0c78bfabace5 100644
--- a/drivers/net/phy/aquantia/aquantia.h
+++ b/drivers/net/phy/aquantia/aquantia.h
@@ -177,6 +177,7 @@ static const struct aqr107_hw_stat aqr107_hw_stats[] = {
 struct aqr107_priv {
 	u64 sgmii_stats[AQR107_SGMII_STAT_SZ];
 	unsigned long leds_active_low;
+	unsigned long leds_active_high;
 };
 
 #if IS_REACHABLE(CONFIG_HWMON)
diff --git a/drivers/net/phy/aquantia/aquantia_leds.c b/drivers/net/phy/aquantia/aquantia_leds.c
index 201c8df93fad..2bafd6c78b00 100644
--- a/drivers/net/phy/aquantia/aquantia_leds.c
+++ b/drivers/net/phy/aquantia/aquantia_leds.c
@@ -121,13 +121,13 @@ int aqr_phy_led_active_low_set(struct phy_device *phydev, int index, bool enable
 {
 	return phy_modify_mmd(phydev, MDIO_MMD_VEND1, AQR_LED_DRIVE(index),
 			      VEND1_GLOBAL_LED_DRIVE_VDD,
-			      enable ? VEND1_GLOBAL_LED_DRIVE_VDD : 0);
+			      enable ? 0 : VEND1_GLOBAL_LED_DRIVE_VDD);
 }
 
 int aqr_phy_led_polarity_set(struct phy_device *phydev, int index, unsigned long modes)
 {
+	bool force_active_low = false, force_active_high = false;
 	struct aqr107_priv *priv = phydev->priv;
-	bool active_low = false;
 	u32 mode;
 
 	if (index >= AQR_MAX_LEDS)
@@ -136,7 +136,10 @@ int aqr_phy_led_polarity_set(struct phy_device *phydev, int index, unsigned long
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
@@ -144,8 +147,14 @@ int aqr_phy_led_polarity_set(struct phy_device *phydev, int index, unsigned long
 	}
 
 	/* Save LED driver vdd state to restore on SW reset */
-	if (active_low)
+	if (force_active_low)
 		priv->leds_active_low |= BIT(index);
 
-	return aqr_phy_led_active_low_set(phydev, index, active_low);
+	if (force_active_high)
+		priv->leds_active_high |= BIT(index);
+
+	if (force_active_high || force_active_low)
+		return aqr_phy_led_active_low_set(phydev, index, force_active_low);
+
+	unreachable();
 }
diff --git a/drivers/net/phy/aquantia/aquantia_main.c b/drivers/net/phy/aquantia/aquantia_main.c
index dcad3fa1ddc3..c62fc65ddbdb 100644
--- a/drivers/net/phy/aquantia/aquantia_main.c
+++ b/drivers/net/phy/aquantia/aquantia_main.c
@@ -517,7 +517,7 @@ static int aqr107_config_mdi(struct phy_device *phydev)
 static int aqr107_config_init(struct phy_device *phydev)
 {
 	struct aqr107_priv *priv = phydev->priv;
-	u32 led_active_low;
+	u32 led_idx;
 	int ret;
 
 	/* Check that the PHY interface type is compatible */
@@ -548,8 +548,14 @@ static int aqr107_config_init(struct phy_device *phydev)
 		return ret;
 
 	/* Restore LED polarity state after reset */
-	for_each_set_bit(led_active_low, &priv->leds_active_low, AQR_MAX_LEDS) {
-		ret = aqr_phy_led_active_low_set(phydev, led_active_low, true);
+	for_each_set_bit(led_idx, &priv->leds_active_low, AQR_MAX_LEDS) {
+		ret = aqr_phy_led_active_low_set(phydev, led_idx, true);
+		if (ret)
+			return ret;
+	}
+
+	for_each_set_bit(led_idx, &priv->leds_active_high, AQR_MAX_LEDS) {
+		ret = aqr_phy_led_active_low_set(phydev, led_idx, false);
 		if (ret)
 			return ret;
 	}
-- 
2.47.0

