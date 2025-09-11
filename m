Return-Path: <linux-leds+bounces-5494-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A401B52A98
	for <lists+linux-leds@lfdr.de>; Thu, 11 Sep 2025 09:53:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CC1395833CE
	for <lists+linux-leds@lfdr.de>; Thu, 11 Sep 2025 07:53:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE1BB2BE7D7;
	Thu, 11 Sep 2025 07:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZJjYVfUV"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B068429E112;
	Thu, 11 Sep 2025 07:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757577208; cv=none; b=BwpoVJKhVEz14CMVYpJWxZpiENQU42mmgH0beFKpd6lvshJLO9Z1webTWt9HgfoXJQqRsJNaJUmsGGaX+FTt5gw6GxuXTjG/Yonz67+k2yOoyO0omuq+pjmoMUeqDhj8rK3lzEsb6h3XDR7iB800E4yPaBiaoLt3d+WCvOlVzfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757577208; c=relaxed/simple;
	bh=LJSX/YJBkIOu6NLyPR0jclq0ztLZ+upJxjY3L0qzdts=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MoVuuvRY+UHgCMGW99BW4CF6jTirTQx2Fcfz9WAR5PEJq3NoKeDitbrWfRP/iEv+EB9a3IJY8bB+YI82+a7SUgTUtggD8zsF6e9g2Nj5c3Tab9kWnPLIA76MUMTb8qSmK+wdZGutS44CXXiMTLheClGx3Fx/TMgKosWIO2FjYVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZJjYVfUV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 620A2C113D0;
	Thu, 11 Sep 2025 07:53:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757577208;
	bh=LJSX/YJBkIOu6NLyPR0jclq0ztLZ+upJxjY3L0qzdts=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ZJjYVfUV6Ie6wL2FIicKoSuwDryKXx8JcttdSm8wwIgrEH/rLJVDsLSz0bmmWwnJr
	 fuiRk/vCTQBBvSocDSVIdPi9WiG5V43QDvghM7g0R2xTYbqGKFDpaSbGM5gpbjGlca
	 hSsFMLp72xj+fKcquHfXKwIt4VPu6QNIfC2SQNYqQ+9OLAjsuvGTi7gpV1JksPcV1v
	 JQm9az14Tal5jo96qbQ0iEwQGeSY9dE+/Oy2iln3kpj9OqhZJJgPsg1Sl28hYGhB/o
	 xRwshqhvR4jed5BoprxScJB3jgMFbQ1kCLfoFcaRjBtPr8RgT3hLPnFF2kmrIe2kE1
	 SIiRWFJvza1iA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57910CAC594;
	Thu, 11 Sep 2025 07:53:28 +0000 (UTC)
From: Maud Spierings via B4 Relay <devnull+maudspierings.gocontroll.com@kernel.org>
Date: Thu, 11 Sep 2025 09:53:21 +0200
Subject: [PATCH v3 4/4] arm64: dts: freescale:
 moduline-display-av123z7m-n17: add backlight
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250911-max25014-v3-4-d03f4eba375e@gocontroll.com>
References: <20250911-max25014-v3-0-d03f4eba375e@gocontroll.com>
In-Reply-To: <20250911-max25014-v3-0-d03f4eba375e@gocontroll.com>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-fbdev@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Maud Spierings <maudspierings@gocontroll.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757577207; l=1572;
 i=maudspierings@gocontroll.com; s=20250214; h=from:subject:message-id;
 bh=+aYLH/ybVi5ZerWepGpRa9xOZexNmERp/UmcwCxehRI=;
 b=YtagMT7BdxUBqeoCBONoCdU+5rEpYVDLrI6lTl22BO4sEXpAhosycuRxEdFyi3aLKihg2F4gu
 N/ak4sYXqdpCsm5KBsGV2d4+qsLu8ep3uhIhCWgTzFc8zObCS/xTg/F
X-Developer-Key: i=maudspierings@gocontroll.com; a=ed25519;
 pk=7chUb8XpaTQDvWhzTdHC0YPMkTDloELEC7q94tOUyPg=
X-Endpoint-Received: by B4 Relay for maudspierings@gocontroll.com/20250214
 with auth_id=341
X-Original-From: Maud Spierings <maudspierings@gocontroll.com>
Reply-To: maudspierings@gocontroll.com

From: Maud Spierings <maudspierings@gocontroll.com>

Add the missing backlight.

Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
---
 ...p-tx8p-ml81-moduline-display-106-av123z7m-n17.dtso | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106-av123z7m-n17.dtso b/arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106-av123z7m-n17.dtso
index 3eb665ce9d5d2a1c742ffb4feca046e406e29956..0b969c8c04db1c86b2a90c5f5ef91e494e5de7a6 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106-av123z7m-n17.dtso
+++ b/arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106-av123z7m-n17.dtso
@@ -16,6 +16,7 @@
 
 	panel {
 		compatible = "boe,av123z7m-n17";
+		backlight = <&backlight>;
 		enable-gpios = <&gpio1 7 GPIO_ACTIVE_HIGH>;
 		pinctrl-0 = <&pinctrl_panel>;
 		pinctrl-names = "default";
@@ -91,10 +92,26 @@ lvds1_out: endpoint {
 		};
 	};
 
-	/* max25014 @ 0x6f */
+	backlight: backlight@6f {
+		compatible = "maxim,max25014";
+		reg = <0x6f>;
+		default-brightness = <50>;
+		enable-gpios = <&gpio1 4 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_backlight>;
+		maxim,iset = <7>;
+		maxim,strings = <1 1 1 1>;
+	};
 };
 
 &iomuxc {
+	pinctrl_backlight: backlightgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_GPIO1_IO04__GPIO1_IO04
+				(MX8MP_PULL_UP | MX8MP_PULL_ENABLE)
+		>;
+	};
+
 	pinctrl_lvds_bridge: lvdsbridgegrp {
 		fsl,pins = <
 			MX8MP_IOMUXC_SAI1_TXD2__GPIO4_IO14

-- 
2.51.0



