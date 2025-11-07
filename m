Return-Path: <linux-leds+bounces-6034-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 310F1C3FFC1
	for <lists+linux-leds@lfdr.de>; Fri, 07 Nov 2025 13:50:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B571618995CD
	for <lists+linux-leds@lfdr.de>; Fri,  7 Nov 2025 12:50:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 913C92BFC73;
	Fri,  7 Nov 2025 12:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p4RSu86o"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BCC9275112;
	Fri,  7 Nov 2025 12:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762519813; cv=none; b=tdy2Ui3d+JOJRIPKQ84Bu8159p+ZutZ9NFwG6WQwVzX67kdqckEzyr9QJER2QHwiMlNKFK4h8KuAd/0oVD/UU6eWZ/7KpZ/uHj8jyECEB9EnzaJxGOV0JJb563GmwM/W2G2VbU+ewCGsmUpMPFZIN2EBpp3b7Ql42K/NSTqQQFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762519813; c=relaxed/simple;
	bh=yDiqSOQULBB2rLC+PqQWvExsXr88gNjIXBSWnDJ9wPQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Knp/qDKz1qB6XWH1ig1LjPbrJLOZDHAaZCOkuzBSrTK8a5CRE/87Fv8wy1JxYuW/lPCRz8uIO72x8oL/1sLl0a9p128g46/CRV2G1Ra5oKq7rOvzMlpCJqosN/DQo30Ggg+lF+8LUe9bRJJVWLFYL3uXvQcuxRbN3vPnKegrt4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p4RSu86o; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id DA9C8C19423;
	Fri,  7 Nov 2025 12:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762519812;
	bh=yDiqSOQULBB2rLC+PqQWvExsXr88gNjIXBSWnDJ9wPQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=p4RSu86onv9sOIt+YfjV3mgmADd7zeL2+8fOGxZjlVpreuOijIZYnHngGNaFxulAs
	 WpI+7FT4sIDyqfQ+Bbz1VNPmAh73gOeTbbH/lEQJnCr/fT1e8/oho0/OH+n/XqRzmQ
	 sBt5iNDdtdtCtAcweYj4jS4rDqTxaWPPSPvvPQHFJa7IjTbSEUJzkjSHqQsnQ1Khqx
	 8Z8GVv6QiS/DyMevK7kcg2EPM6RN1/KNFWQRa4ND6jr3t1nTzDWcLNhaxx81chfC0f
	 2DyLhFzA4YY+Ybadsn35v5KeBM3wj/UXfpdXOHFnFMzbIiNQyjsBL7NMKw7rxyu64C
	 2BrURyPSJk3Ww==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D11D9CCFA18;
	Fri,  7 Nov 2025 12:50:12 +0000 (UTC)
From: Maud Spierings via B4 Relay <devnull+maudspierings.gocontroll.com@kernel.org>
Date: Fri, 07 Nov 2025 13:50:00 +0100
Subject: [PATCH v5 3/4] arm64: dts: freescale:
 moduline-display-av101hdt-a10: add backlight
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251107-max25014-v5-3-9a6aa57306bf@gocontroll.com>
References: <20251107-max25014-v5-0-9a6aa57306bf@gocontroll.com>
In-Reply-To: <20251107-max25014-v5-0-9a6aa57306bf@gocontroll.com>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-fbdev@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Maud Spierings <maudspierings@gocontroll.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762519811; l=1620;
 i=maudspierings@gocontroll.com; s=20250214; h=from:subject:message-id;
 bh=VwDrQbdFl3MoeRR0Hyu6UwVAM4rKJvip1fa/fyci9zk=;
 b=hlqHu2mewfEp0ujJzmXMfvckTMU+B7F8ukuGjncq52pBkYOJc+zA1IMAV6XZr2pP/RKQmw5mE
 MJJKe4x+LluA4pORHbbNBQoezZCcupw8UmPUtS9FE4UsP220Mod4xUd
X-Developer-Key: i=maudspierings@gocontroll.com; a=ed25519;
 pk=7chUb8XpaTQDvWhzTdHC0YPMkTDloELEC7q94tOUyPg=
X-Endpoint-Received: by B4 Relay for maudspierings@gocontroll.com/20250214
 with auth_id=341
X-Original-From: Maud Spierings <maudspierings@gocontroll.com>
Reply-To: maudspierings@gocontroll.com

From: Maud Spierings <maudspierings@gocontroll.com>

Add the missing backlight driver.

Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
---
 ...x8p-ml81-moduline-display-106-av101hdt-a10.dtso | 30 ++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106-av101hdt-a10.dtso b/arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106-av101hdt-a10.dtso
index e3965caca6be..0e2914861154 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106-av101hdt-a10.dtso
+++ b/arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106-av101hdt-a10.dtso
@@ -17,6 +17,7 @@
 
 	panel {
 		compatible = "boe,av101hdt-a10";
+		backlight = <&backlight>;
 		enable-gpios = <&gpio1 7 GPIO_ACTIVE_HIGH>;
 		pinctrl-0 = <&pinctrl_panel>;
 		pinctrl-names = "default";
@@ -40,7 +41,36 @@ reg_vbus: regulator-vbus {
 	};
 };
 
+&i2c4 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	backlight: backlight@6f {
+		compatible = "maxim,max25014";
+		reg = <0x6f>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		enable-gpios = <&gpio1 4 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_backlight>;
+		maxim,iset = <7>;
+
+		led@0 {
+			reg = <0>;
+			led-sources = <0 1 2>;
+			default-brightness = <50>;
+		};
+	};
+};
+
 &iomuxc {
+	pinctrl_backlight: backlightgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_GPIO1_IO04__GPIO1_IO04
+				(MX8MP_PULL_UP | MX8MP_PULL_ENABLE)
+		>;
+	};
+
 	pinctrl_panel: panelgrp {
 		fsl,pins = <
 			MX8MP_IOMUXC_GPIO1_IO07__GPIO1_IO07

-- 
2.51.2



