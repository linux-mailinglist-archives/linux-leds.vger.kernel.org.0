Return-Path: <linux-leds+bounces-5131-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 744FDB11D47
	for <lists+linux-leds@lfdr.de>; Fri, 25 Jul 2025 13:10:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7268C1CE562E
	for <lists+linux-leds@lfdr.de>; Fri, 25 Jul 2025 11:10:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2F062E7BAE;
	Fri, 25 Jul 2025 11:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g/QKQP06"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67E952E6112;
	Fri, 25 Jul 2025 11:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753441767; cv=none; b=qInGVHHGAsFFo1FEACVbjV7KO/DdoRHIJsrW6Dd9DQAAFtUYPpksYRtoCyB5bj58rXmqqkCJ3rrGZLMbZxki1IOIsB7YeA/dS7bWI7NyU3CQ096olbSci6CYwUY/4n8oWPJHBO2Vfx0Xrj3uuuDw/irEWH0TRY97+GxFZ+1VYt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753441767; c=relaxed/simple;
	bh=4IkvT70nHT7DJuTLaCAnhM8pgdfF6Jlm4i+ijqif6h0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GNpJ7uxRYQxONEg0IclaPKqofJjUPz8OdkGlcidcbZTtfv3tJmVQsRiQ7rz9e0wNxux2+B46p2pbHFJ5BzRi97DvZPUPNv/+iXWI98PfNgxUW0DyTexY1Hz77TA4G3jcISLTCRLEIe4Yeu45xjG+SxnnE2dyPAjMrzU+MJdBCcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g/QKQP06; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 239DBC4CEFD;
	Fri, 25 Jul 2025 11:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753441767;
	bh=4IkvT70nHT7DJuTLaCAnhM8pgdfF6Jlm4i+ijqif6h0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=g/QKQP0605g1yilwpMFnSzZNmX+X9qJU6K+gVQagKWEbNSM+3wiDFPnGJtVk139HA
	 5u+eBJo/4RhWPounHPjAa3qZB508K4CnOJYShTg/h4+94iREtAuPbhZYCTJ8J6WpQo
	 PnhbEYKWvW4215WEwfMwFuH9MGfbuIhoigAcgmap1nQXJ0XYJY2J7AN30j/o96jbeT
	 H2iypf0+hJIYUDqLmjAq5Yve4QijOOyYLDEItxB8Qers3SCk5Z2OSMwAPaZL/meGNV
	 gETWRbf4snGPVDchQeetPJdbET4lO/ZKKiqMJfKVxYQooKBnHNS2seApd5sMqQQAKW
	 kEJ8pl+X1hACw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 183A6C87FD1;
	Fri, 25 Jul 2025 11:09:27 +0000 (UTC)
From: Maud Spierings via B4 Relay <devnull+maudspierings.gocontroll.com@kernel.org>
Date: Fri, 25 Jul 2025 13:09:26 +0200
Subject: [PATCH 4/4] arm64: dts: freescale: moduline-display-av123z7m-n17:
 add backlight
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250725-max25014-v1-4-0e8cce92078e@gocontroll.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753441765; l=1572;
 i=maudspierings@gocontroll.com; s=20250214; h=from:subject:message-id;
 bh=xr006rWCG+GoAENJGxVDQaJVtVRYuMkX4hmKlW17MZE=;
 b=tufAw+u70DzqIuX1/RzscpI25dr42wvmI6N6kvkriCu6DX0SMkVxenyZHcZ/LoA/JUx7Ob0oG
 qq21cnRjhf8DO4vdpWpcZAbi7HQH+t2uhEONPb0ToKSLXMoe1o8mzV5
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
index 3eb665ce9d5d2a1c742ffb4feca046e406e29956..9124cd87cce54a5aa7b7ad674f70f814d1dc3515 100644
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
+		reg = <0x6f>;
+		compatible = "maxim,max25014";
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
2.50.1



