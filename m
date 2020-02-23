Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5E5A91697BB
	for <lists+linux-leds@lfdr.de>; Sun, 23 Feb 2020 14:21:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726490AbgBWNVb (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 23 Feb 2020 08:21:31 -0500
Received: from vps.xff.cz ([195.181.215.36]:42862 "EHLO vps.xff.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726534AbgBWNVa (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Sun, 23 Feb 2020 08:21:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=megous.com; s=mail;
        t=1582463689; bh=NMin2NjZeeqocWZC9NSK1oMc+IKPqF2jiBrmazxCDxs=;
        h=From:To:Cc:Subject:Date:References:From;
        b=rGyp96Slng/w/Z7/e3YLulL5bZqgnaIYdI5fCn37OVTi25dHUU6qMSWUoRJMMTFH3
         A0a3h0AKjpqQBgmI4pDVojzIgMFnrYegCmMSejetqfS1d4vnCStpAQ943VDbMh+pE9
         G4OGZrj2ZGK52DJLuab6irxsutHCdFVxLnjXm5FA=
From:   Ondrej Jirman <megous@megous.com>
To:     linux-sunxi@googlegroups.com,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Maxime Ripard <mripard@kernel.org>
Cc:     Ondrej Jirman <megous@megous.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Lee Jones <lee.jones@linaro.org>, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 3/4] ARM: dts: axp813: Add charger LED
Date:   Sun, 23 Feb 2020 14:14:34 +0100
Message-Id: <20200223131435.681620-4-megous@megous.com>
In-Reply-To: <20200223131435.681620-1-megous@megous.com>
References: <20200223131435.681620-1-megous@megous.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

PMIC supports charging status indication via a LED. Add support
for it.

Signed-off-by: Ondrej Jirman <megous@megous.com>
---
 arch/arm/boot/dts/axp81x.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/axp81x.dtsi b/arch/arm/boot/dts/axp81x.dtsi
index 1dfeeceabf4c3..00b092f94433d 100644
--- a/arch/arm/boot/dts/axp81x.dtsi
+++ b/arch/arm/boot/dts/axp81x.dtsi
@@ -175,4 +175,9 @@ reg_drivevbus: drivevbus {
 	usb_power_supply: usb-power-supply {
 		compatible = "x-powers,axp813-usb-power-supply";
 	};
+
+	charger_led: charger-led {
+		compatible = "x-powers,axp813-charger-led";
+		status = "disabled";
+	};
 };
-- 
2.25.1

