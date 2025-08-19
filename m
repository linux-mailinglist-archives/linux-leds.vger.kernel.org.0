Return-Path: <linux-leds+bounces-5242-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D56B2B2BF96
	for <lists+linux-leds@lfdr.de>; Tue, 19 Aug 2025 12:59:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7A9F8688070
	for <lists+linux-leds@lfdr.de>; Tue, 19 Aug 2025 10:59:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF08B326D48;
	Tue, 19 Aug 2025 10:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r7EwYQCJ"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79956322A2A;
	Tue, 19 Aug 2025 10:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755601144; cv=none; b=oKxmBktyKHgl/C6dW3VdiAHataIQFHH1u5VWgn9mJ3sB3QiT31NvJMHaCYZpDIGOScteUzr591Z+b0e71SPYM7qnlwUJ/ckcH75uqDpX/IqZ2xuX6WG5oAc0x7nA6VXsZpDKfd0TnLaGIOAIDeZwWwikHXSCr6129lBFgFtXTfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755601144; c=relaxed/simple;
	bh=IqjXzr05zSduckLPDfWkg7xIEVFrdf8l5BHBSomO7vs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NeDaw1NtpceMtfPBDLDokwJRtaypbcWmp3/nhupbmf62RnSbOZTYdzMTsAB9/qpO/dOb4ScR6Cxenr/Ar/XfPN+N9v06nrNlhzA3vCuEjAecLIrqz3NK7e2NMJxs9AYBfhFegXp0JIstAhzmE7n/F0aCJPtA1P80ajr+NRkPWZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r7EwYQCJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 231FDC16AAE;
	Tue, 19 Aug 2025 10:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755601144;
	bh=IqjXzr05zSduckLPDfWkg7xIEVFrdf8l5BHBSomO7vs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=r7EwYQCJ9AkhvYx4Yp9r6f6F9lF0u1sSPIQIPM/8p29+kbYyFXwspO37yeT4Gx5p4
	 h8fgk4floTNfbR9TRLj8gY10JxwzYZn85jTNg1iH+MtP7FN//5MQuMZif+RIL8xzDI
	 sg4783DSANSNOAcJOZuLC2m2KhUJc0mEpd5RKbdymq9nrp6lCRTBhdCdlii7vRRjjN
	 s5grXxmvwRjrlLnRC/V1mnqoXJIGsuVd3phlttJkojCvWNWqn+6Y2+xmlh2Z4C30hF
	 I/M3V1L/gMh5fBvqnJCZndbxKjxkn9qXpfQ5GANSQ0zgRB0ircZaNFqB1Qg/NppVKe
	 CaITJm34TENoQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16AD1CA0EEB;
	Tue, 19 Aug 2025 10:59:04 +0000 (UTC)
From: Maud Spierings via B4 Relay <devnull+maudspierings.gocontroll.com@kernel.org>
Date: Tue, 19 Aug 2025 12:59:01 +0200
Subject: [PATCH v2 3/4] arm64: dts: freescale:
 moduline-display-av101hdt-a10: add backlight
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250819-max25014-v2-3-5fd7aeb141ea@gocontroll.com>
References: <20250819-max25014-v2-0-5fd7aeb141ea@gocontroll.com>
In-Reply-To: <20250819-max25014-v2-0-5fd7aeb141ea@gocontroll.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755601142; l=1541;
 i=maudspierings@gocontroll.com; s=20250214; h=from:subject:message-id;
 bh=hP/iMSDnGfJ92Bbev2fKqlJFdnLO6wB7nn/ebAUvpWI=;
 b=nNR/p/xEsP3b/4DiXK7GkttSOvmSvpk+twYdNEKrmyAuoUm0sCmK7rijwIuZ4/FPLyS8W4NYF
 dlSh1xWDGeSBi7e+KWoO93cmoY5gRFj3CNDkFqkmwb/1pPvhevOWDQT
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



