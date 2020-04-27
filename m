Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 347311B98A7
	for <lists+linux-leds@lfdr.de>; Mon, 27 Apr 2020 09:32:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726671AbgD0Hbq (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 27 Apr 2020 03:31:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:35468 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726349AbgD0Hbp (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Mon, 27 Apr 2020 03:31:45 -0400
Received: from wens.tw (mirror2.csie.ntu.edu.tw [140.112.30.76])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9563C2051A;
        Mon, 27 Apr 2020 07:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587972704;
        bh=EB/8lQ6+/XniFQ49WgaV6x0TkKREKExmreY0EeEVl70=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=GsD/E2b5m33qFTMLKp7RyIht3sckCqUa+LfmwqRzzX99BAadGU5LlmnlU1UR4im0r
         0Xvf2kwD7pIYc8aAEyYLWrtF/eFimXP4UA0aSupz+Tq+CPzT1zj9bHqd2OE7mL+qmu
         QGaMD5TMG/ahGFA2FbW7L4y5HjGV481B+XPjnM44=
Received: by wens.tw (Postfix, from userid 1000)
        id 6F9F15FCE9; Mon, 27 Apr 2020 15:31:42 +0800 (CST)
From:   Chen-Yu Tsai <wens@kernel.org>
To:     Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>
Cc:     Chen-Yu Tsai <wens@csie.org>, linux-rockchip@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] arm64: dts: rockchip: rk3399-roc-pc: Fix MMC numbering for LED triggers
Date:   Mon, 27 Apr 2020 15:31:31 +0800
Message-Id: <20200427073132.29997-3-wens@kernel.org>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200427073132.29997-1-wens@kernel.org>
References: <20200427073132.29997-1-wens@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

From: Chen-Yu Tsai <wens@csie.org>

With SDIO now enabled, the numbering of the existing MMC host controllers
gets incremented by 1, as the SDIO host is the first one.

Increment the numbering of the MMC LED triggers to match.

Fixes: cf3c5397835f ("arm64: dts: rockchip: Enable sdio0 and uart0 on rk3399-roc-pc-mezzanine")
Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
 arch/arm64/boot/dts/rockchip/rk3399-roc-pc-mezzanine.dts | 8 ++++++++
 arch/arm64/boot/dts/rockchip/rk3399-roc-pc.dtsi          | 4 ++--
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-roc-pc-mezzanine.dts b/arch/arm64/boot/dts/rockchip/rk3399-roc-pc-mezzanine.dts
index 2acb3d500fb9..f0686fc276be 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-roc-pc-mezzanine.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-roc-pc-mezzanine.dts
@@ -38,6 +38,10 @@ vcc3v3_pcie: vcc3v3-pcie {
 	};
 };
 
+&diy_led {
+	linux,default-trigger = "mmc2";
+};
+
 &pcie_phy {
 	status = "okay";
 };
@@ -91,3 +95,7 @@ &uart0 {
 	pinctrl-0 = <&uart0_xfer &uart0_cts &uart0_rts>;
 	status = "okay";
 };
+
+&yellow_led {
+	linux,default-trigger = "mmc1";
+};
diff --git a/arch/arm64/boot/dts/rockchip/rk3399-roc-pc.dtsi b/arch/arm64/boot/dts/rockchip/rk3399-roc-pc.dtsi
index 9f225e9c3d54..bc060ac7972d 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-roc-pc.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399-roc-pc.dtsi
@@ -70,14 +70,14 @@ work-led {
 			linux,default-trigger = "heartbeat";
 		};
 
-		diy-led {
+		diy_led: diy-led {
 			label = "red:diy";
 			gpios = <&gpio0 RK_PB5 GPIO_ACTIVE_HIGH>;
 			default-state = "off";
 			linux,default-trigger = "mmc1";
 		};
 
-		yellow-led {
+		yellow_led: yellow-led {
 			label = "yellow:yellow-led";
 			gpios = <&gpio0 RK_PA2 GPIO_ACTIVE_HIGH>;
 			default-state = "off";
-- 
2.26.0

