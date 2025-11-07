Return-Path: <linux-leds+bounces-6033-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 40040C3FFAF
	for <lists+linux-leds@lfdr.de>; Fri, 07 Nov 2025 13:50:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 29D1D4E8AD5
	for <lists+linux-leds@lfdr.de>; Fri,  7 Nov 2025 12:50:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89EFC2BDC35;
	Fri,  7 Nov 2025 12:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S+RZYTI+"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BC5C274FE8;
	Fri,  7 Nov 2025 12:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762519813; cv=none; b=U+9mfzLSoWowSlsUrrjbqjtwWzKusTU9WjFHF1iauEQancodszeUuggHuW1PBdA5XcaU5ikQ3FfIJXJ9Pr5K7jI09n+805kcWJwjvhqb25rBij1esZmbZ+8snb6iwNJ7M1fKYZjCZQNsc+FlbzoeDkurxfvSBE1xNV/MJadYb6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762519813; c=relaxed/simple;
	bh=R+P9YC83++uFXox8Cc6IFwB64s3H9EKY1X6A/lJabnM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sy3FPgin8hrvLkI8a60FiFtvjWcpRR9gF13d+WYlTyuGAKlogzysAT1TV7iLY/NBJZS3BsLlpv8LcoMDFTnsdZvfYrwc2HotYGW0tr+8PkV4ZTIHKwmJZqjvwPvWfeDyNAHS2C5fEkOGedS/+zCY3mt+ZgR56EnDML1yanlmebY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S+RZYTI+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id E5680C2BCB2;
	Fri,  7 Nov 2025 12:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762519812;
	bh=R+P9YC83++uFXox8Cc6IFwB64s3H9EKY1X6A/lJabnM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=S+RZYTI+RdLo+1vo4VOX/6usH4H9TBYy4y4J35sfh6mpn5k4FGfrZAx5ZQM2Ku/cz
	 Ukj5CNpnnm5vPnWcdEvkc9fn4mMl+CETMERGCKYwmsd+zinXz3SeuC8rFB6Gkd9ZBj
	 dsOLxAmk3RMURZUL8wPVqpIOLgctyJ2runFexbTZh2HWpsMUvuiMJN7ro8K4Qlxgjb
	 m+jaSEklLhPqX8DWgVLIw6HyKc8vyp5agwn/Wh6JdqmPkzi6/obARZxZEPYC2DLcrv
	 LXvuNAxrtK6vHRGqzojZMGu9ucINrIewhRGdDvB9bPDCRQ8RWwHmb/FVDsnS8RdXdr
	 dRFrO+NSU3DFQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF816CCF9E3;
	Fri,  7 Nov 2025 12:50:12 +0000 (UTC)
From: Maud Spierings via B4 Relay <devnull+maudspierings.gocontroll.com@kernel.org>
Date: Fri, 07 Nov 2025 13:50:01 +0100
Subject: [PATCH v5 4/4] arm64: dts: freescale:
 moduline-display-av123z7m-n17: add backlight
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251107-max25014-v5-4-9a6aa57306bf@gocontroll.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762519811; l=1603;
 i=maudspierings@gocontroll.com; s=20250214; h=from:subject:message-id;
 bh=W3+O65MLK+QQ45G6UQnntYqpahuzB8Ny+hes04KZ2tw=;
 b=ezpjtjsv6GgTUKTj7VIN8Ol7x+BVdwyWUUs+AXJaY5Qg3P1dzkwOkW9zWLzP2vTxhen37C8V2
 EGi+m0I9ldbD7r5Bw0/dGwM/b7StU0TVUcAQqEYBAqeDlohud8dP0sb
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
 ...x8p-ml81-moduline-display-106-av123z7m-n17.dtso | 25 +++++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106-av123z7m-n17.dtso b/arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106-av123z7m-n17.dtso
index 3eb665ce9d5d..786a04ef40c8 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106-av123z7m-n17.dtso
+++ b/arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106-av123z7m-n17.dtso
@@ -16,6 +16,7 @@
 
 	panel {
 		compatible = "boe,av123z7m-n17";
+		backlight = <&backlight>;
 		enable-gpios = <&gpio1 7 GPIO_ACTIVE_HIGH>;
 		pinctrl-0 = <&pinctrl_panel>;
 		pinctrl-names = "default";
@@ -91,10 +92,32 @@ lvds1_out: endpoint {
 		};
 	};
 
-	/* max25014 @ 0x6f */
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
2.51.2



