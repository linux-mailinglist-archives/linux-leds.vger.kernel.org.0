Return-Path: <linux-leds+bounces-5683-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id DC0C7BC7930
	for <lists+linux-leds@lfdr.de>; Thu, 09 Oct 2025 08:48:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D26FC4F485A
	for <lists+linux-leds@lfdr.de>; Thu,  9 Oct 2025 06:48:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAC5B2D0C70;
	Thu,  9 Oct 2025 06:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t5sxhCFG"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97A542C234F;
	Thu,  9 Oct 2025 06:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759992508; cv=none; b=rfkTKK3RYwu1AT167I33h4Am9j37pxeSELNl0BaS4BzRM6HyD2i/EmgxTnPsiw0OLnaYKbQ1/h/HvEL9hWN7eI/7s+rQFY3JFHuaatcJ6aknUI1WdnrOfK45PzMD1YXb+wF9HVnh0iINtTmPK+NAG03Sr7xrVexvH8CQIRgJOhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759992508; c=relaxed/simple;
	bh=4XdM9wcnYNU2LkGINpDAAZjGYWWB2K+VEu9ljuY48hg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CtVED2aEkPifhBPTcEY58jNaiPVJCBY/mOLr6ALxj0kSAoD0QT7DbnRwzBoJYOvV40D+fcs5OwKiioQMfvOiOSv5bfPmjfIkO6ACkuX3QRJcerEdPn5vMZYoPkgWByXi5rWQTS3i7UkdNF0WUJYPjKlo2OlZEEZbbpqy/3CzjPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t5sxhCFG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 22F54C19422;
	Thu,  9 Oct 2025 06:48:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759992508;
	bh=4XdM9wcnYNU2LkGINpDAAZjGYWWB2K+VEu9ljuY48hg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=t5sxhCFGq8b5VeeXou6XoRRkX07P0L4X3ewWchOXZ3YMk914cwNj3CIEmm7AZ96Dd
	 k5hIAn0/tToXGFHWwC2KSrFvuQui2WgERwkrfXdUD1dqq+58qtZPX4kAEMWz2zrIX8
	 Z/Dg4htbyiNw4Rgi++o/2n0oBgVw+OPyQHK2c2D4RF2uZkv9lOYEcQbqf+Ma2aV2Ef
	 zJNffkmDiEYna2O56rYp+bCWNtRN70dPt48/TFdpyK0440vsxRAZ3jHdz1oVZVV91S
	 b4dxStQWhzSiTy0PXumg/h6JcyGQIMOcUmlnGvIjvfotQYb7aVqSPZM4OFHBzLqqnc
	 vnRzMNSiyxRJA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18572CCD18A;
	Thu,  9 Oct 2025 06:48:28 +0000 (UTC)
From: Maud Spierings via B4 Relay <devnull+maudspierings.gocontroll.com@kernel.org>
Date: Thu, 09 Oct 2025 08:48:28 +0200
Subject: [PATCH v4 4/4] arm64: dts: freescale:
 moduline-display-av123z7m-n17: add backlight
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251009-max25014-v4-4-6adb2a0aa35f@gocontroll.com>
References: <20251009-max25014-v4-0-6adb2a0aa35f@gocontroll.com>
In-Reply-To: <20251009-max25014-v4-0-6adb2a0aa35f@gocontroll.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759992506; l=1639;
 i=maudspierings@gocontroll.com; s=20250214; h=from:subject:message-id;
 bh=pWeAK4Rn7wjoYLcVlDOrdhK/tMcB60QeJTaIHG+EMUw=;
 b=M1+ka83/gjtFmtqPnLvMWm+kXFyj+0T+dYJTiIImhhAqPMKlwgthVMhg/haaB6ZkpiwXQMoQE
 R/U68uJ0KQUBSRMKPSpeeKyR+gkZXexQBuiIbfUL3OxNmbGA6yOxHX8
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
 ...x8p-ml81-moduline-display-106-av123z7m-n17.dtso | 27 +++++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106-av123z7m-n17.dtso b/arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106-av123z7m-n17.dtso
index 3eb665ce9d5d2..c320e0f563af9 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106-av123z7m-n17.dtso
+++ b/arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106-av123z7m-n17.dtso
@@ -16,6 +16,7 @@
 
 	panel {
 		compatible = "boe,av123z7m-n17";
+		backlight = <&backlight>;
 		enable-gpios = <&gpio1 7 GPIO_ACTIVE_HIGH>;
 		pinctrl-0 = <&pinctrl_panel>;
 		pinctrl-names = "default";
@@ -91,10 +92,34 @@ lvds1_out: endpoint {
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
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		led@0 {
+			reg = <0>;
+			led-sources = <0 1 2 3>;
+			default-brightness = <50>;
+		};
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



