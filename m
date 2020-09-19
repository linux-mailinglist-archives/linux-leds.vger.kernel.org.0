Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8A392710EF
	for <lists+linux-leds@lfdr.de>; Sun, 20 Sep 2020 00:15:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726660AbgISWPw (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 19 Sep 2020 18:15:52 -0400
Received: from lists.nic.cz ([217.31.204.67]:49994 "EHLO mail.nic.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726626AbgISWPw (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Sat, 19 Sep 2020 18:15:52 -0400
Received: from dellmb.labs.office.nic.cz (unknown [IPv6:2001:1488:fffe:6:cac7:3539:7f1f:463])
        by mail.nic.cz (Postfix) with ESMTP id 461AE140A7D;
        Sun, 20 Sep 2020 00:15:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
        t=1600553750; bh=4GFIuoGep6B/Lp8izOufEKIIzt3hVVrrJhDzcEp36lM=;
        h=From:To:Date;
        b=FKtu2sxEEJJkm+ke71jJkOg+WzF+gAVwrp7Sgb5BjgEtWx5E3HD0F6ved0QRoIppT
         FYh39twpS6M6pzS7WeLPlPJ61vjgu5YrvEBTyci/gE8SIcIMaNSkueg62T9dGSDDFA
         dEEB2qeOlAKIhYqamW9QLAGOwZuqtO+eQwxS7GCk=
From:   =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>
To:     linux-leds@vger.kernel.org
Cc:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>,
        NeilBrown <neilb@suse.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        "H . Nikolaus Schaller" <hns@goldelico.com>,
        Tony Lindgren <tony@atomide.com>,
        Adam Ford <aford173@gmail.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Subject: [PATCH leds + devicetree 04/13] ARM: dts: omap3: gta04: rename LED controlled subnodes
Date:   Sun, 20 Sep 2020 00:15:39 +0200
Message-Id: <20200919221548.29984-5-marek.behun@nic.cz>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200919221548.29984-1-marek.behun@nic.cz>
References: <20200919221548.29984-1-marek.behun@nic.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.nic.cz
X-Spam-Status: No, score=0.00
X-Spamd-Bar: /
X-Virus-Scanned: clamav-milter 0.102.2 at mail
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Rename LED controller subnodes to format "led@[0-6]" or "gpio@[0-6]" to
conform to the new YAML defined binding.

Use the `gpio-line-names` property to define GPIO names.

Signed-off-by: Marek Behún <marek.behun@nic.cz>
Cc: NeilBrown <neilb@suse.de>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: H. Nikolaus Schaller <hns@goldelico.com>
Cc: Tony Lindgren <tony@atomide.com>
Cc: Adam Ford <aford173@gmail.com>
Cc: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org
---
 arch/arm/boot/dts/omap3-gta04.dtsi | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/omap3-gta04.dtsi b/arch/arm/boot/dts/omap3-gta04.dtsi
index ecc45862b4f34..a28fe1b07215c 100644
--- a/arch/arm/boot/dts/omap3-gta04.dtsi
+++ b/arch/arm/boot/dts/omap3-gta04.dtsi
@@ -541,28 +541,30 @@ tca6507: tca6507@45 {
 		gpio-controller;
 		#gpio-cells = <2>;
 
-		gta04_led0: red_aux@0 {
+		gpio-line-names = "wifi_reset@6";
+
+		gta04_led0: led@0 {
 			label = "gta04:red:aux";
 			reg = <0x0>;
 		};
 
-		gta04_led1: green_aux@1 {
+		gta04_led1: led@1 {
 			label = "gta04:green:aux";
 			reg = <0x1>;
 		};
 
-		gta04_led3: red_power@3 {
+		gta04_led3: led@3 {
 			label = "gta04:red:power";
 			reg = <0x3>;
 			linux,default-trigger = "default-on";
 		};
 
-		gta04_led4: green_power@4 {
+		gta04_led4: led@4 {
 			label = "gta04:green:power";
 			reg = <0x4>;
 		};
 
-		wifi_reset: wifi_reset@6 { /* reference as <&tca_gpios 0 0> since it is currently the only GPIO */
+		wifi_reset: gpio@6 { /* reference as <&tca_gpios 0 0> since it is currently the only GPIO */
 			reg = <0x6>;
 			compatible = "gpio";
 		};
-- 
2.26.2

