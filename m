Return-Path: <linux-leds+bounces-5130-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC4E8B11D3B
	for <lists+linux-leds@lfdr.de>; Fri, 25 Jul 2025 13:10:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2204C3AD55D
	for <lists+linux-leds@lfdr.de>; Fri, 25 Jul 2025 11:09:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3BC02E7650;
	Fri, 25 Jul 2025 11:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gpvEOr5t"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67E222E610E;
	Fri, 25 Jul 2025 11:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753441767; cv=none; b=YIMPgVHvpl12S1Cx6bJINxniqHrwTOwV8qPL7rHGVXmcHykh82y34VLiLEdpmUdfDTfs4r8vxHpJHiDzbwHF9Ich6SRPcTrTpDZghJVpaoZxfYKhJFUNuKzS8WqnQrTAhmTuBR445gWVrgC6yIMvjBc/rfSQxRl7EmOfD45WgVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753441767; c=relaxed/simple;
	bh=IqjXzr05zSduckLPDfWkg7xIEVFrdf8l5BHBSomO7vs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IVvROEqrgnk2eIAIsV4j8hSLoG6VhRDbToHR8+2PRt8XgE7+hhHQRGkXObVzZqrgrqOLThMkJ52CwCk4PskKm4IVMQvONMWHrHuzzCXmWCpAyCRVCkao6y6cWGONf56OPfJB7MdsimgMjP/USRCL5oapNo1ky2QV4iBziPCouxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gpvEOr5t; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 11A50C4CEF9;
	Fri, 25 Jul 2025 11:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753441767;
	bh=IqjXzr05zSduckLPDfWkg7xIEVFrdf8l5BHBSomO7vs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=gpvEOr5t19O/SEk8/KGjR0fH6D+68/hErp3ZdkvQXrw1GbEkr6OqMnIcuB05HKVdm
	 PvXcnQllOzJChFmw0IDhutMlUb36BguSBcW28L4SmHihdHhPaLcZI3YAZ9v9jmBJQq
	 RZwmS8uefMmWku5ZJAeNMTxQqcqqyV8m6b96RWLHK1bErvS4MzgDTJt/BcXcxfQCqA
	 Jyvw82Af5YsB8eHYv9oj7Ffu/OyRPPkGLauN5Uj5CVWBpsSno9T7YtVYljlrP5erRL
	 QKkGpxDHV9oIS3Td1tPCnpCfKaQ253hgz8oq7BzFuMd927KZ2Byjfe0hiYwseh4H73
	 t502tB9wtu/vg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0561AC87FCA;
	Fri, 25 Jul 2025 11:09:27 +0000 (UTC)
From: Maud Spierings via B4 Relay <devnull+maudspierings.gocontroll.com@kernel.org>
Date: Fri, 25 Jul 2025 13:09:25 +0200
Subject: [PATCH 3/4] arm64: dts: freescale: moduline-display-av101hdt-a10:
 add backlight
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250725-max25014-v1-3-0e8cce92078e@gocontroll.com>
References: <20250725-max25014-v1-0-0e8cce92078e@gocontroll.com>
In-Reply-To: <20250725-max25014-v1-0-0e8cce92078e@gocontroll.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753441765; l=1541;
 i=maudspierings@gocontroll.com; s=20250214; h=from:subject:message-id;
 bh=hP/iMSDnGfJ92Bbev2fKqlJFdnLO6wB7nn/ebAUvpWI=;
 b=7ExsNftFWU7giIkLsBxUozc08FSHnvmeqMz49OuEqfUnvOHQgvirIv4NAx8H5k6YHws7RyYoi
 QUZLpcHBdCAA4XETnHLoYMP5tK/UlbJTh9GZlRFsE2wwO3lEMvQ/hKB
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
index e3965caca6be42a17aa89b77bd5b919382c84151..143243ba95cd7a69c7b043fa0fb32c37b67e1064 100644
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
+		reg = <0x6f>;
+		compatible = "maxim,max25014";
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
2.50.1



