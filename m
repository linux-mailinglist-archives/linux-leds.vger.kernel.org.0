Return-Path: <linux-leds+bounces-2963-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 02B45991848
	for <lists+linux-leds@lfdr.de>; Sat,  5 Oct 2024 18:28:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 812A2B20C09
	for <lists+linux-leds@lfdr.de>; Sat,  5 Oct 2024 16:28:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F5A1157476;
	Sat,  5 Oct 2024 16:28:26 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from pidgin.makrotopia.org (pidgin.makrotopia.org [185.142.180.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB6C314B94B;
	Sat,  5 Oct 2024 16:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.142.180.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728145706; cv=none; b=iYrPxyiLECK+cAkVD/s+MBiaOL+C2WP3gn27ZYYVRTs6a1dfJVCWQtqujI8Bst4cA2funvrqOmFrAikoBWmnDEzOoVH83HbHH+lHd6V5nKc3d4PYnGLhxfnX0kEySIh/a9iGTj9ffjbVNlnh4M8ZAZGhOZS8Ay2/fLme0YKR2YY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728145706; c=relaxed/simple;
	bh=mfY8SjHy1iBJk5oaEJ2SJrGLxqt7p0f0z8HzXY/WCXE=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PoCpz6nyEABDYlFIBijxYyd9HkuWZStDpv8ZSfVnNKJZ+hXqssLMNIh6zxXSB52whM7ZUYlK8CAHY9dZRWPXsSbOH4r/utkkcbxmre8BBC9wm/gjDvDI2W118IWkuevTaciEiUlKqNyLLAbfdEjXQZSLPp9cnI+iG8G86ua8gew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org; spf=pass smtp.mailfrom=makrotopia.org; arc=none smtp.client-ip=185.142.180.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=makrotopia.org
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.98)
	(envelope-from <daniel@makrotopia.org>)
	id 1sx7dh-0000000045x-1TwZ;
	Sat, 05 Oct 2024 16:28:17 +0000
Date: Sat, 5 Oct 2024 17:28:13 +0100
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
	Abhishek Chauhan <quic_abchauha@quicinc.com>,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Subject: [PATCH net-next 3/4] net: phy: aquantia: correctly describe LED
 polarity override
Message-ID: <2d59088ac85d78b9bf4b54c2de9442e89eacf790.1728145095.git.daniel@makrotopia.org>
References: <e91ca84ac836fc40c94c52733f8fc607bcbed64c.1728145095.git.daniel@makrotopia.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e91ca84ac836fc40c94c52733f8fc607bcbed64c.1728145095.git.daniel@makrotopia.org>

Use newly defined 'active-high' property to set the
VEND1_GLOBAL_LED_DRIVE_VDD bit and let 'active-low' clear that bit. This
reflects the technical reality which was inverted in the previous
description in which the 'active-low' property was used to actually set
the VEND1_GLOBAL_LED_DRIVE_VDD bit, which means that VDD (ie. supply
voltage) of the LED is driven rather than GND.

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 drivers/net/phy/aquantia/aquantia.h      |  1 +
 drivers/net/phy/aquantia/aquantia_leds.c |  6 +++++-
 drivers/net/phy/aquantia/aquantia_main.c | 12 +++++++++---
 3 files changed, 15 insertions(+), 4 deletions(-)

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
index 201c8df93fad..21b8ede2a105 100644
--- a/drivers/net/phy/aquantia/aquantia_leds.c
+++ b/drivers/net/phy/aquantia/aquantia_leds.c
@@ -121,7 +121,7 @@ int aqr_phy_led_active_low_set(struct phy_device *phydev, int index, bool enable
 {
 	return phy_modify_mmd(phydev, MDIO_MMD_VEND1, AQR_LED_DRIVE(index),
 			      VEND1_GLOBAL_LED_DRIVE_VDD,
-			      enable ? VEND1_GLOBAL_LED_DRIVE_VDD : 0);
+			      enable ? 0 : VEND1_GLOBAL_LED_DRIVE_VDD);
 }
 
 int aqr_phy_led_polarity_set(struct phy_device *phydev, int index, unsigned long modes)
@@ -138,6 +138,8 @@ int aqr_phy_led_polarity_set(struct phy_device *phydev, int index, unsigned long
 		case PHY_LED_ACTIVE_LOW:
 			active_low = true;
 			break;
+		case PHY_LED_ACTIVE_HIGH:
+			break;
 		default:
 			return -EINVAL;
 		}
@@ -146,6 +148,8 @@ int aqr_phy_led_polarity_set(struct phy_device *phydev, int index, unsigned long
 	/* Save LED driver vdd state to restore on SW reset */
 	if (active_low)
 		priv->leds_active_low |= BIT(index);
+	else
+		priv->leds_active_high |= BIT(index);
 
 	return aqr_phy_led_active_low_set(phydev, index, active_low);
 }
diff --git a/drivers/net/phy/aquantia/aquantia_main.c b/drivers/net/phy/aquantia/aquantia_main.c
index c33a5ef34ba0..c7381d5ede37 100644
--- a/drivers/net/phy/aquantia/aquantia_main.c
+++ b/drivers/net/phy/aquantia/aquantia_main.c
@@ -488,7 +488,7 @@ static void aqr107_chip_info(struct phy_device *phydev)
 static int aqr107_config_init(struct phy_device *phydev)
 {
 	struct aqr107_priv *priv = phydev->priv;
-	u32 led_active_low;
+	u32 led_idx;
 	int ret;
 
 	/* Check that the PHY interface type is compatible */
@@ -515,8 +515,14 @@ static int aqr107_config_init(struct phy_device *phydev)
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
2.46.2


