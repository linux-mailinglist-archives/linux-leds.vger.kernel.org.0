Return-Path: <linux-leds+bounces-2962-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E2FB99183F
	for <lists+linux-leds@lfdr.de>; Sat,  5 Oct 2024 18:25:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3FEBC1C20E34
	for <lists+linux-leds@lfdr.de>; Sat,  5 Oct 2024 16:25:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 151AF156C74;
	Sat,  5 Oct 2024 16:25:02 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from pidgin.makrotopia.org (pidgin.makrotopia.org [185.142.180.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73A4214A4F7;
	Sat,  5 Oct 2024 16:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.142.180.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728145502; cv=none; b=CaaGHyNQCL54eBntg/iQ88jngyUE3D7ZaMidvzXTv5sHyzhNfZ+HVj95B0zySqsBYdrnZVIa3oLP43xRNdL2jX1c9ATLsyQDmEoeUVGn+rPQM0r69nFqY2QUuN8VNDQfzlxUqq/BqrquSqU5yApKfvnplmd9+mtpRKzjHwHvtjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728145502; c=relaxed/simple;
	bh=/eUWtaBY0uWZ/lz1sHWviqJKBLa0Eu6JNXikC033Ej0=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZdSpsZC1Pk8OzeNTlbJqTSxxOhTUKS43i5nAzmETScno99wjOyP9TWniIpNHhYqhuN1zZGFecEAGJAqGHh+5+x719YsTl4imP2o9+xEYlnjtGraq2cZQtTUtWFhH6+ww0otma/zD0QS+tLEMjiLB+DmzPfKnbN7cmfhUvdedi1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org; spf=pass smtp.mailfrom=makrotopia.org; arc=none smtp.client-ip=185.142.180.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=makrotopia.org
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.98)
	(envelope-from <daniel@makrotopia.org>)
	id 1sx7aQ-0000000044p-1Fzd;
	Sat, 05 Oct 2024 16:24:54 +0000
Date: Sat, 5 Oct 2024 17:24:50 +0100
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
Subject: [PATCH net-next 2/4] net: phy: support 'active-high' property for
 PHY LEDs
Message-ID: <d1d3b2cdbc866c5f3c435f270fa3b2037dbdac97.1728145095.git.daniel@makrotopia.org>
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

In addition to 'active-low' and 'inactive-high-impedance' also
support 'active-high' property for PHY LED pin configuration.

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 drivers/net/phy/phy_device.c | 2 ++
 include/linux/phy.h          | 5 +++--
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/net/phy/phy_device.c b/drivers/net/phy/phy_device.c
index 560e338b307a..df67d9297253 100644
--- a/drivers/net/phy/phy_device.c
+++ b/drivers/net/phy/phy_device.c
@@ -3357,6 +3357,8 @@ static int of_phy_led(struct phy_device *phydev,
 	if (index > U8_MAX)
 		return -EINVAL;
 
+	if (of_property_read_bool(led, "active-high"))
+		set_bit(PHY_LED_ACTIVE_HIGH, &modes);
 	if (of_property_read_bool(led, "active-low"))
 		set_bit(PHY_LED_ACTIVE_LOW, &modes);
 	if (of_property_read_bool(led, "inactive-high-impedance"))
diff --git a/include/linux/phy.h b/include/linux/phy.h
index a98bc91a0cde..22dde07cbec7 100644
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
2.46.2

