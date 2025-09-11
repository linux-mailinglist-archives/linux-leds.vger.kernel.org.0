Return-Path: <linux-leds+bounces-5496-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D4EFB52A9C
	for <lists+linux-leds@lfdr.de>; Thu, 11 Sep 2025 09:53:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DB1E01898E70
	for <lists+linux-leds@lfdr.de>; Thu, 11 Sep 2025 07:54:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 072592BEFE0;
	Thu, 11 Sep 2025 07:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UD0BngKf"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B300029E11A;
	Thu, 11 Sep 2025 07:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757577208; cv=none; b=rZDAOCb0uar9OrWf+maummKOE3tJPUGKa/rBmnDQs0efQFIsaZHRv5gKLXOPf1q0djZJQ7Y+lazMy+CHkLgJ1sidIwRvnNtLmcnkLL0L8acGj2VgcaxbyXmHPQeH7jXxM+WaJReAnQpGXXlMs/QsvGedRtl+r93e2EXCbyQYnHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757577208; c=relaxed/simple;
	bh=Ym/gINLHmikuw69uc6+19TWOxHmwsBHXCw48WiyJQsw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m2mT8d6szLZc14xogAYsYXmA8E9KT0/GWi7JygIYMNFKwxgCG1kFdb3xknU4T0sZQSH+G7fhdlYBIMgC2bpN4kfMDscgLDmzw98lkDidZ5U81hJh+GnNNuKkqhWcLQtxdYwusucz9DHYnrxaUoKNAXETckxwEkgMe7VlAFexVjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UD0BngKf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5264FC4CEFE;
	Thu, 11 Sep 2025 07:53:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757577208;
	bh=Ym/gINLHmikuw69uc6+19TWOxHmwsBHXCw48WiyJQsw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=UD0BngKfEOEQtMBSI8z7uftnKJd3DgMs57frIxGd2AnM10aK4WYIyxvqBQa1h2r5f
	 mYlfCAHyxv1vLNeY5T8kKnrbuPEOsjaGPv8pevpsI2TC9H1OkJZwbihEf9FiFk7wec
	 lVfDOX90DYNiu6TcUCULeD/2BOrWW85mciBL0o6oSxOUDBZoY2i5XAbyzBWGQPmZk3
	 q7quZ9nqCxtleOWF1hlATQuyKkdP3QeqHqtxBdakhYWtdvWrPw9ZY3y/rrR0GcDEkq
	 6SIcXI01gJ5WrZSJDK1ct2Qn1RCwTNSmhCYFYzTkDybsR3ZwU1jPCroi68PiG/aoI6
	 VCuve4TBp0/tA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47273CAC587;
	Thu, 11 Sep 2025 07:53:28 +0000 (UTC)
From: Maud Spierings via B4 Relay <devnull+maudspierings.gocontroll.com@kernel.org>
Date: Thu, 11 Sep 2025 09:53:20 +0200
Subject: [PATCH v3 3/4] arm64: dts: freescale:
 moduline-display-av101hdt-a10: add backlight
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250911-max25014-v3-3-d03f4eba375e@gocontroll.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757577207; l=1541;
 i=maudspierings@gocontroll.com; s=20250214; h=from:subject:message-id;
 bh=MKPHYiixnvo18K/Tipnb4mW1ZFhvWvMFDXU6EXpZykM=;
 b=/CA6jwFw9AdCyBAGzCS1uYBPRwTDVmL+ssxdE9/CUUa/h/o7hlenPzXWcz1X3FtED346hee9A
 8SD+Do7xMlUAHbnbtAef882ZeDM34phyYWsrLI83NbXgjNDIo6iamk1
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
 ...tx8p-ml81-moduline-display-106-av101hdt-a10.dtso | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106-av101hdt-a10.dtso b/arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106-av101hdt-a10.dtso
index e3965caca6be42a17aa89b77bd5b919382c84151..3d0983a3ab5463196de8cefb863bde74426b735d 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106-av101hdt-a10.dtso
+++ b/arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106-av101hdt-a10.dtso
@@ -17,6 +17,7 @@
 
 	panel {
 		compatible = "boe,av101hdt-a10";
+		backlight = <&backlight>;
 		enable-gpios = <&gpio1 7 GPIO_ACTIVE_HIGH>;
 		pinctrl-0 = <&pinctrl_panel>;
 		pinctrl-names = "default";
@@ -40,7 +41,27 @@ reg_vbus: regulator-vbus {
 	};
 };
 
+&i2c4 {
+	backlight: backlight@6f {
+		compatible = "maxim,max25014";
+		reg = <0x6f>;
+		default-brightness = <50>;
+		enable-gpios = <&gpio1 4 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_backlight>;
+		maxim,iset = <7>;
+		maxim,strings = <1 1 1 0>;
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
2.51.0



