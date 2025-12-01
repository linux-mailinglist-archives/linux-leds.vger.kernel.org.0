Return-Path: <linux-leds+bounces-6364-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 622E0C97230
	for <lists+linux-leds@lfdr.de>; Mon, 01 Dec 2025 12:54:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 452924E1E98
	for <lists+linux-leds@lfdr.de>; Mon,  1 Dec 2025 11:53:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 827EE2F5A03;
	Mon,  1 Dec 2025 11:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X2HX94rW"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D4732F5305;
	Mon,  1 Dec 2025 11:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764590006; cv=none; b=oeUlFpcQPQQedwhOMfWwMCJpqSY3e+UjWxKJ1WK+3Pf/eB6ssghBK3/9Vs6jkUk4Lf/o8E0hR/wOqPBrUvW0ao/cToOa8Nd8vxrJIZXRvDUfEYyB36fAjh+u64rZEg4W/LSfJ/HCVwQ682XZ79Gw8T2iyUiHz15oGChgfRqtP6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764590006; c=relaxed/simple;
	bh=As7VxcdiGSM6WKyddLJP3nl6IFr7YW7eI/5lBDAp5Rg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pfBkhtAn8pRreJ1oRdbir+PsEFeUBMUJjLBSeL1jT+d62xZAiPu2l8rYT4z1hqwHCaVVhqfU2MGt0NSXUbRp81nr8kWlGCTZCBxVec4FwP+j53EptV8n0TiRqSeQf2UCpemlUyFC4+0uhAwen478T+5ntwwmOcStAUf1dMiTxPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X2HX94rW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id E592EC19421;
	Mon,  1 Dec 2025 11:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764590006;
	bh=As7VxcdiGSM6WKyddLJP3nl6IFr7YW7eI/5lBDAp5Rg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=X2HX94rWnPBAkbz7Lfv6lz0Jm3dtbZc2F/CfmmqjLGTeycTJ5FmQ2VidxT7FC8OvX
	 /Lb1w4RSv9TTFXnY8z8+69uAGaatHEURsCnHFHfqId173Skxh0zszEGnMZJpiT4NLB
	 vmUW5V0Qtbf2g3GnOWeVTMinPVsFm7fXbwzzx7N5/+WLWZ6TQ2RYXBt4CWvwwgt7Vh
	 2eJY6YKYs7emIKksS4BNu++56dVrh1xaMmvptVM8HQPu32vFW+vm0ygbDGG6qE71fM
	 go8Ag2NE4sz8SoUkLGe9cFJAFueqjolojCZ3aoczPYP2zVL9b43O7eva0KcE6ddEjL
	 Wo6GMsJpS9S/w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D75FBD116F1;
	Mon,  1 Dec 2025 11:53:25 +0000 (UTC)
From: Maud Spierings via B4 Relay <devnull+maudspierings.gocontroll.com@kernel.org>
Date: Mon, 01 Dec 2025 12:53:22 +0100
Subject: [PATCH v6 3/4] arm64: dts: freescale:
 moduline-display-av101hdt-a10: add backlight
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251201-max25014-v6-3-88e3ac8112ff@gocontroll.com>
References: <20251201-max25014-v6-0-88e3ac8112ff@gocontroll.com>
In-Reply-To: <20251201-max25014-v6-0-88e3ac8112ff@gocontroll.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764590004; l=1620;
 i=maudspierings@gocontroll.com; s=20250214; h=from:subject:message-id;
 bh=qi6/BcrCEYVJ/jWiiobwb7h+IH88mEoOqv0vUhXRMjc=;
 b=v9bWOBB/IXa5US40LHAmKkyL4NOpXzigHVKXAlxAEqggqlIBxCCtQzNEEmYXyJ+PDpr2pljlo
 1zO9berqyLCDQdQod7Me8G7CzfQ5ACNwxTkDjdxdWge9tTc2VQA2IGP
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
2.52.0



