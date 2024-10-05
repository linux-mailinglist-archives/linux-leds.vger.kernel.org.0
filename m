Return-Path: <linux-leds+bounces-2964-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FF4399184C
	for <lists+linux-leds@lfdr.de>; Sat,  5 Oct 2024 18:28:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EAAE0281130
	for <lists+linux-leds@lfdr.de>; Sat,  5 Oct 2024 16:28:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1C2E157493;
	Sat,  5 Oct 2024 16:28:47 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from pidgin.makrotopia.org (pidgin.makrotopia.org [185.142.180.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3321D14A4F7;
	Sat,  5 Oct 2024 16:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.142.180.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728145727; cv=none; b=J7+0lBq8i1gGhS6nltdyXvgGD25Mq6PFbLAY2Fbg5+G6GaL/0f920e6UT8h7KqrhL6hrOhMOioDkfRJwdDw5IKvupAAlzljqQIg7I4Nv96ZwH1jFBRvKRZVZ4/zigfBFu2W5Lna3aor9JfQ/JmwHBci5GgJJBwpEDBosViEAA6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728145727; c=relaxed/simple;
	bh=/1zA0mp9VAeBlM8oa9n+jmxw+nSew2/1tOt5CK4IRHM=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DcZTDy1ScAlyGH3EFKEjDIlb+idZrSjTWdxVw2Gxf2CuZ5ABJ5ofMHIcZJ81UXYfIrO5DdLAmgl6nqmOmZ23K4BzwvDGoQVl2OMgIqeXxjMQD2xr6BecTJkTFDm9hqow3JeHBcU6dut15dzpA0DW4b5UoWZkImuKi/hdBtjmrj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org; spf=pass smtp.mailfrom=makrotopia.org; arc=none smtp.client-ip=185.142.180.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=makrotopia.org
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.98)
	(envelope-from <daniel@makrotopia.org>)
	id 1sx7e4-0000000046L-3MCW;
	Sat, 05 Oct 2024 16:28:40 +0000
Date: Sat, 5 Oct 2024 17:28:37 +0100
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
Subject: [PATCH net-next 4/4] net: phy: mxl-gpy: correctly describe LED
 polarity
Message-ID: <cb0ae5cc99225a1bd104fd044927df6cf8ab578f.1728145095.git.daniel@makrotopia.org>
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

According the datasheet covering the LED (0x1b) register:
0B Active High LEDx pin driven high when activated
1B Active Low LEDx pin driven low when activated

Make use of the now available 'active-high' property and correctly
reflect the polarity setting which was previously inverted.

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 drivers/net/phy/mxl-gpy.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/phy/mxl-gpy.c b/drivers/net/phy/mxl-gpy.c
index 1c9cd00c7bee..f50697f35160 100644
--- a/drivers/net/phy/mxl-gpy.c
+++ b/drivers/net/phy/mxl-gpy.c
@@ -1013,13 +1013,15 @@ static int gpy_led_polarity_set(struct phy_device *phydev, int index,
 		case PHY_LED_ACTIVE_LOW:
 			active_low = true;
 			break;
+		case PHY_LED_ACTIVE_HIGH:
+			break;
 		default:
 			return -EINVAL;
 		}
 	}
 
 	return phy_modify(phydev, PHY_LED, PHY_LED_POLARITY(index),
-			  active_low ? 0 : PHY_LED_POLARITY(index));
+			  active_low ? PHY_LED_POLARITY(index) : 0);
 }
 
 static struct phy_driver gpy_drivers[] = {
-- 
2.46.2

