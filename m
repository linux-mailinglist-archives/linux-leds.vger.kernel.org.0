Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D207D1697B9
	for <lists+linux-leds@lfdr.de>; Sun, 23 Feb 2020 14:21:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726302AbgBWNVb (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 23 Feb 2020 08:21:31 -0500
Received: from vps.xff.cz ([195.181.215.36]:42860 "EHLO vps.xff.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726490AbgBWNVa (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Sun, 23 Feb 2020 08:21:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=megous.com; s=mail;
        t=1582463690; bh=O0vRhY+V2Jl0M2obAxrjSnldPLPIOsBZnIOFMxJMK+c=;
        h=From:To:Cc:Subject:Date:References:From;
        b=mJC075OALCfwecGtghLUWPgvLx+ENTajLDet/rRYECHBD3H+iU5h22uyPSOneXWA6
         bbpu90eCtl56eNcxBQGRX+/cQmM2Web00EzrUdJJ95Ykq8mD6V8vI/3bynYSeGVXBk
         Gh23GXprCha0Kn49mD4lg63UldnhkNREBDh2Cyww=
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
Subject: [PATCH 4/4] ARM: dts: sun8i-a83t-tbs-a711: Enable charging LED
Date:   Sun, 23 Feb 2020 14:14:35 +0100
Message-Id: <20200223131435.681620-5-megous@megous.com>
In-Reply-To: <20200223131435.681620-1-megous@megous.com>
References: <20200223131435.681620-1-megous@megous.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

The tablet has a LED connected to the PMIC. The LED is visible in the
top right corner of the tablet. Enable it.

Signed-off-by: Ondrej Jirman <megous@megous.com>
---
 arch/arm/boot/dts/sun8i-a83t-tbs-a711.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/sun8i-a83t-tbs-a711.dts b/arch/arm/boot/dts/sun8i-a83t-tbs-a711.dts
index 2fd31a0a0b344..40911b5d3f323 100644
--- a/arch/arm/boot/dts/sun8i-a83t-tbs-a711.dts
+++ b/arch/arm/boot/dts/sun8i-a83t-tbs-a711.dts
@@ -300,6 +300,10 @@ &battery_power_supply {
 	status = "okay";
 };
 
+&charger_led {
+	status = "okay";
+};
+
 &reg_aldo1 {
 	regulator-min-microvolt = <1800000>;
 	regulator-max-microvolt = <1800000>;
-- 
2.25.1

