Return-Path: <linux-leds+bounces-661-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B052A837471
	for <lists+linux-leds@lfdr.de>; Mon, 22 Jan 2024 21:48:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3D6851F2660A
	for <lists+linux-leds@lfdr.de>; Mon, 22 Jan 2024 20:48:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A35247F58;
	Mon, 22 Jan 2024 20:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="w72KG6Dw"
X-Original-To: linux-leds@vger.kernel.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE6F47E8;
	Mon, 22 Jan 2024 20:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705956427; cv=none; b=W1yxUg+qwcwfpBNKxudFrioJxHkvTGGMJjZivRqkXODTDLVYq/2KqjvZ7KeoLTtF6BvneOG26v3DCTXXWavWkU4rPTPlRMagE38xSDKqd93pPKfvHBBsoYaBXs+KBnP1xONdSnGETcjJMyMQk09t8d7J3Q2EYhgXHjfQ+Kw6dV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705956427; c=relaxed/simple;
	bh=xhoSg7HCiJB8nm0GytlBZuAs5wdKZX1yo/OegtNKoH4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=T/YOphgoGhcANUtaEY/oqZzaX+Vmnlcad24MFqtHMDlv7LwMYtwnrdOh0ZxDQTz79bJek+4Y2D46wsEwqFTej2E0q3Gusjxxyjh4I3WUZUCCahOAky02BnqDIPcfrc0aBk8nDtMHmVSYRGX4uEushUngGSnAOgws77rTUe96ik8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=w72KG6Dw; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id E182C8785F;
	Mon, 22 Jan 2024 21:47:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1705956422;
	bh=JxBtzlcpgR9/Ek6eHU9p5BsUP/L8XPN5FuVoVVQTYTw=;
	h=From:To:Cc:Subject:Date:From;
	b=w72KG6DwouCrNqJd8AreYW6NfPC3VAxDJuG2XBRUo4+51bOUKzV6cCbjOfPcHjmSZ
	 bDfsVCUMg3irOy0aSwynaP3q9Mp4yjkz+XYswsAMeKeEi8PqITG4U9kwmmZCn9Ow64
	 vE+kPNVqkNyAEYiziN2XYvaGB40hXq41F0E/296AisZVdvNy4ZgZwu3a0BwfLu0HTj
	 UieZSxkZJObJ43ZJg+G7Nj9LafFy9H5bOYh8HvP8EzP6QuVtIXRKD9jp9/OZUVA25V
	 M4CuTEZfP8FlOvzJf5kLRqzKhhE12brD63tn5lJE7R03Ph3Xqf1G0WIOAqjXuoWu69
	 UUXNBYM02cwhg==
From: Marek Vasut <marex@denx.de>
To: netdev@vger.kernel.org
Cc: Marek Vasut <marex@denx.de>,
	"David S. Miller" <davem@davemloft.net>,
	Andrew Lunn <andrew@lunn.ch>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Lee Jones <lee@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Pavel Machek <pavel@ucw.cz>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Rob Herring <robh+dt@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	devicetree@vger.kernel.org,
	linux-leds@vger.kernel.org
Subject: [PATCH] [RFC] net: phy: broadcom: Add DT LED configuration support
Date: Mon, 22 Jan 2024 21:45:51 +0100
Message-ID: <20240122204650.344794-1-marex@denx.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

The BCM54213E and similar PHYs have extensive LED configuration
capabilities -- the PHY has two LEDs, either of the two LEDs can
be configured to 1 of 16 functions (speed, TX, RX, activity, on,
off, quality, ... multi-color) used to drive single-color LED.
The multi-color mode is special, it provides 16 more sub-modes
used to drive multi-color LED.

The current configuration -- both LEDs configured as multi-color,
with both LEDs multi-color sub-mode set to link activity indicator,
is not suitable for all systems in which this PHY is used.

Attempt to implement a way to describe the LED configuration in DT.

Use Documentation/devicetree/bindings/net/ethernet-phy.yaml leds {}
subnode of the PHY DT node, describe both LEDs present on this PHY
as single LEDs within the leds {} subnode. Each described LED is a
subnode of its own, the description uses standard LED subsystem
bindings from Documentation/devicetree/bindings/leds/common.yaml .

The DT description of the LED configuration can look for example
like this:

"
ethernet-phy@1 {
...
	leds {
		#address-cells = <1>;
		#size-cells = <0>;

		led@0 {
			reg = <0>;
			function = LED_FUNCTION_ACTIVITY;
		};

		led@1 {
			reg = <1>;
			function = LED_FUNCTION_SPEED_2;
		};
	};
};
"

Implement parsing code in the broadcom PHY driver to detemine desired
LED configuration from DT. In case the leds {} subnode is present, the
parser code iterates over its subnodes and for each led@N subnode it
parses the following properties:

- reg - LED ID, either 0 or 1, used to identify the LED on the PHY
- function - LED single-color function (speed, TX, RX, multi-color...),
             uses LED subsystem LED_FUNCTION_* string. The parser in
	     the driver maps this to register setting.
- function-enumerator - In case function is set to "multi-color",
                        the multi-color function number. The parser
			in the driver uses this value directly for
			the multi-color configuration register.

Once the properties are parsed, the LED configuration registers of the
PHY are programmed.

The current list of LED subsystem LED_FUNCTION_* does not cover the
entire list of possible single-color LED functions of this PHY, add
example extension for "link speed 1" and "link speed 2" setting into
the leds/common.h header file.

The function-enumerator should probably not be a number, but maybe
some sort of macro specific to this PHY ? I would like to avoid new
broadcom PHY specific DT properties.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Andrew Lunn <andrew@lunn.ch>
Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Eric Dumazet <edumazet@google.com>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Lee Jones <lee@kernel.org>
Cc: Paolo Abeni <pabeni@redhat.com>
Cc: Pavel Machek <pavel@ucw.cz>
Cc: Rafał Miłecki <rafal@milecki.pl>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Russell King <linux@armlinux.org.uk>
Cc: devicetree@vger.kernel.org
Cc: linux-leds@vger.kernel.org
Cc: netdev@vger.kernel.org
---
 drivers/net/phy/broadcom.c        | 56 +++++++++++++++++++++++++++----
 include/dt-bindings/leds/common.h |  2 ++
 2 files changed, 52 insertions(+), 6 deletions(-)

diff --git a/drivers/net/phy/broadcom.c b/drivers/net/phy/broadcom.c
index 312a8bb35d780..9250cd45b0b24 100644
--- a/drivers/net/phy/broadcom.c
+++ b/drivers/net/phy/broadcom.c
@@ -407,20 +407,64 @@ static int bcm54xx_config_init(struct phy_device *phydev)
 
 	/* For non-SFP setups, encode link speed into LED1 and LED3 pair
 	 * (green/amber).
-	 * Also flash these two LEDs on activity. This means configuring
-	 * them for MULTICOLOR and encoding link/activity into them.
+	 * By default, flash these two LEDs on activity. This means
+	 * configuring them for MULTICOLOR and encoding link/activity
+	 * into them, but let user reconfigure this via DT.
 	 * Don't do this for devices on an SFP module, since some of these
 	 * use the LED outputs to control the SFP LOS signal, and changing
 	 * these settings will cause LOS to malfunction.
 	 */
 	if (!phy_on_sfp(phydev)) {
-		val = BCM54XX_SHD_LEDS1_LED1(BCM_LED_SRC_MULTICOLOR1) |
-			BCM54XX_SHD_LEDS1_LED3(BCM_LED_SRC_MULTICOLOR1);
+		struct device_node *np = phydev->mdio.dev.of_node;
+		struct device_node *leds, *led = NULL;
+		u8 mode[2] = { BCM_LED_SRC_MULTICOLOR1, BCM_LED_SRC_MULTICOLOR1 };
+		u8 mcmode[2] = { BCM_LED_MULTICOLOR_LINK_ACT, BCM_LED_MULTICOLOR_LINK_ACT };
+		const char *func;
+		u32 val, enumerator;
+		int ret;
+
+		leds = of_find_node_by_name(np, "leds");
+		if (leds) {
+			for_each_available_child_of_node(leds, led) {
+				ret = of_property_read_u32(led, "reg", &val);
+				if (ret < 0 || val >= 2)
+					continue;
+
+				ret = of_property_read_string(led, "function", &func);
+				if (ret)
+					continue;
+
+				if (!strcmp(func, LED_FUNCTION_TX))
+					mode[val] = BCM_LED_SRC_XMITLED;
+				else if (!strcmp(func, LED_FUNCTION_RX))
+					mode[val] = BCM_LED_SRC_RCVLED;
+				else if (!strcmp(func, LED_FUNCTION_ACTIVITY))
+					mode[val] = BCM_LED_SRC_ACTIVITYLED;
+				else if (!strcmp(func, LED_FUNCTION_SPEED_1))
+					mode[val] = BCM_LED_SRC_LINKSPD1;
+				else if (!strcmp(func, LED_FUNCTION_SPEED_2))
+					mode[val] = BCM_LED_SRC_LINKSPD2;
+				/* Add other LED settings here */
+
+				ret = of_property_read_string(led, "function", &func);
+				if (ret)
+					continue;
+
+				ret = of_property_read_u32(led, "function-enumerator", &enumerator);
+				if (ret || enumerator >= 16)
+					continue;
+
+				mcmode[val] = enumerator;
+			}
+		}
+
+		val = BCM54XX_SHD_LEDS1_LED1(mode[0]) |
+			BCM54XX_SHD_LEDS1_LED3(mode[1]);
 		bcm_phy_write_shadow(phydev, BCM54XX_SHD_LEDS1, val);
 
 		val = BCM_LED_MULTICOLOR_IN_PHASE |
-			BCM54XX_SHD_LEDS1_LED1(BCM_LED_MULTICOLOR_LINK_ACT) |
-			BCM54XX_SHD_LEDS1_LED3(BCM_LED_MULTICOLOR_LINK_ACT);
+			BCM54XX_SHD_LEDS1_LED1(mcmode[0]) |
+			BCM54XX_SHD_LEDS1_LED3(mcmode[1]);
 		bcm_phy_write_exp(phydev, BCM_EXP_MULTICOLOR, val);
 	}
 
diff --git a/include/dt-bindings/leds/common.h b/include/dt-bindings/leds/common.h
index 9a0d33d027fff..83d09508841b6 100644
--- a/include/dt-bindings/leds/common.h
+++ b/include/dt-bindings/leds/common.h
@@ -102,5 +102,7 @@
 #define LED_FUNCTION_WAN "wan"
 #define LED_FUNCTION_WLAN "wlan"
 #define LED_FUNCTION_WPS "wps"
+#define LED_FUNCTION_SPEED_1 "speed-1"
+#define LED_FUNCTION_SPEED_2 "speed-2"
 
 #endif /* __DT_BINDINGS_LEDS_H */
-- 
2.43.0


